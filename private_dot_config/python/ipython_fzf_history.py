import subprocess
import sys

from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, HasSelection
from prompt_toolkit.keys import Keys

ipython = get_ipython()
from shutil import which


def fzf_prompt(input) -> str:
    return subprocess.check_output(
        "fzf --no-sort --multi --border --height=80% --margin=1 --padding=1"
        " --preview 'echo {} | sed \"s/ @@ /\\n/g\" | bat --color=always --style=numbers -l py -'",
        input=input,
        text=True,
    )


def is_in_empty_line(buf):
    text = buf.text
    cursor_position = buf.cursor_position
    text = text.split("\n")
    for line in text:
        if len(line) >= cursor_position:
            return not line
        else:
            cursor_position -= len(line) + 1


def fzf_i_search(event):
    history_set = set()
    history_strings = [
        i[2] for i in ipython.history_manager.get_tail(5000, include_latest=True)
    ][::-1]

    # we replace newlines as fzf can only work on single lines; in the preview and later
    # we reverse this effect
    history_strings = [s.replace("\n", " @@ ") for s in dict.fromkeys(history_strings)]
    # refresh prompt
    print("", end="\r", flush=True)
    try:
        text = subprocess.check_output(
            "fzf --no-sort --multi --border --height=80% --margin=1 --padding=1"
            " --preview 'echo {} | sed \"s/ @@ /\\n/g\" | bat --color=always --style=numbers -l py -'",
            input="\n".join(history_strings),
            text=True,
            shell=True,
        )
        # multiple returns get concatenated with an emtpy line in-between
        text = text.rstrip().replace("\n", "\n\n")
        # reverse the replacement of newlines
        text = text.replace(" @@ ", "\n")
    except subprocess.CalledProcessError:
        return
    except Exception as e:
        print(e)
        return
    buf = event.current_buffer
    if not is_in_empty_line(buf):
        buf.insert_line_below()
    buf.insert_text(text)


def register():
    # Register the shortcut if IPython is using prompt_toolkit
    # for this we need fzf and bat
    if not which("fzf"):
        raise SystemError("fzf could not be found on path")
    if not which("bat"):
        raise SystemError("bat could not be found on path")
    if getattr(ipython, "pt_app", None):
        registry = ipython.pt_app.key_bindings
        registry.add_binding(
            Keys.ControlR, filter=(HasFocus(DEFAULT_BUFFER) & ~HasSelection())
        )(fzf_i_search)

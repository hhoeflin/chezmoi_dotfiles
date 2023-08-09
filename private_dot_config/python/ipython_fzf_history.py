import sys

from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, HasSelection
from prompt_toolkit.keys import Keys

import pyfzf

ipython = get_ipython()
fzf = pyfzf.FzfPrompt()
from shutil import which


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
    history_strings = [i[2] for i in ipython.history_manager.get_tail(5000)][::-1]

    # we replace newlines as fzf can only work on single lines; in the preview and later
    # we reverse this effect
    history_strings = [
        s.replace("\n", " @@ ")
        for s in history_strings
        if not (s in history_set or history_set.add(s))
    ]

    # refresh prompt
    print("", end="\r", flush=True)
    try:
        text = fzf.prompt(
            history_strings,
            fzf_options="--no-sort --border --height=80% --margin=1 --padding=1"
            " --preview 'echo {} | sed \"s/ @@ /\\n/g\" | bat --color=always --style=numbers -l py -'",
        )
        # multiple returns get concatenated with an emtpy line in-between
        text = "\n\n".join(text)
        # reverse the replacement of newlines
        text = text.replace(" @@ ", "\n")
    except:
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

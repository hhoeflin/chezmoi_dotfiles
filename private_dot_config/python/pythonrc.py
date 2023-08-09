import pathlib
import sys


class add_sys_path:
    def __init__(self, path):
        self.path = path

    def __enter__(self):
        sys.path.insert(0, self.path)

    def __exit__(self, exc_type, exc_value, traceback):
        try:
            sys.path.remove(self.path)
        except ValueError:
            pass


print(__file__)
# check if IPython is loaded
if "IPython" in sys.modules:
    # yes it is
    try:
        get_ipython().run_line_magic("load_ext", "mkreports")
    except Exception as e:
        print(e)

    with add_sys_path(str(pathlib.Path(__file__).parent)):
        try:
            import ipython_fzf_history

            ipython_fzf_history.register()
            del ipython_fzf_history
        except Exception as e:
            print(e)

del add_sys_path
del sys
del pathlib

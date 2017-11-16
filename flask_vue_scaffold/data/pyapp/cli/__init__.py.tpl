from . import devserver

def main():
    import os
    os.environ.setdefault('PYTHONUNBUFFERED', 'true')
    os.environ.setdefault('FLASK_APP', '$flask_vue_scaffold_app_name.app')

    from .base import cli
    cli.main()
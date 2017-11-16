import click
import os
import socket
import sys

from subprocess import list2cmdline
from honcho.manager import Manager

from .base import cli

DEFAULT_HOST_NAME = socket.gethostname().split('.', 1)[0].lower()

ENVIRONMENT = {
    'development': 'dev',
    'production': 'prod'
}

@cli.command()
@click.option('--environment', default='development', help='The environment name.')
@click.option('--port', '-p', default=5000)
def devserver(environment, port):
    os.environ.setdefault('FLASK_DEBUG', '1')
    os.environ['NODE_ENV'] = environment
    root_url = f'http://localhost:{port}'

    daemons = [
        ('web', ['$flask_vue_scaffold_app_name', 'run', f'--port={port}']),
        ('client', ['./bin/devserver']),
    ]
    cwd = os.path.realpath(
        os.path.join(os.path.dirname(__file__), os.pardir, os.pardir)
    )

    manager = Manager()
    for name, cmd in daemons:
        manager.add_process(
            name,
            list2cmdline(cmd),
            quiet=False,
            cwd=cwd,
        )

    manager.loop()
    sys.exit(manager.returncode)
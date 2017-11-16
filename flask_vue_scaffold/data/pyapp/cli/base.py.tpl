import click
from flask.cli import FlaskGroup

def _create_app(info):
    from ..app import create_app
    return create_app()


@click.group(cls=FlaskGroup, create_app=_create_app)
def cli():
    """$flask_vue_scaffold_app_name"""
import os
import shutil
import string
import pkg_resources

import click


@click.group()
def main():
    """Flask Vue Scaffold"""


def _sanitize_package_name(name):
    return name.replace('-', '_').replace(' ', '_')


@main.command()
@click.option('-n', '--name', required=True, prompt=True, help='The name of the application.')
@click.option('-d', '--dest', type=click.Path(exists=True), default='.',
              help='Path to the directory in which the new package should created.')
def init(name, dest):
    click.echo(f"Initializing new project: {name}")
    destination = os.path.abspath(os.path.join(dest, name))
    data_root = pkg_resources.resource_filename('flask_vue_scaffold', 'data')
    os.mkdir(os.path.join(dest, name))
    for path, directories, files in os.walk(data_root):
        if data_root != path:
            os.mkdir(os.path.join(destination, path.replace(data_root + '/', '')))
        for filename in files:
            srcfile = os.path.join(path, filename)
            destfile = os.path.join(destination, srcfile.replace(data_root + '/', ''))
            if filename.endswith('.tpl'):
                destfile, _ = os.path.splitext(destfile)
                content = open(srcfile).read()
                tpl = string.Template(content)
                with open(destfile, 'w') as destfile_obj:
                    destfile_obj.write(tpl.safe_substitute({'flask_vue_scaffold_app_name': _sanitize_package_name(name)}))
            else:
                shutil.copy(srcfile, destfile)
    os.rename(
        os.path.join(destination, 'pyapp'),
        os.path.join(destination, _sanitize_package_name(name))
    )
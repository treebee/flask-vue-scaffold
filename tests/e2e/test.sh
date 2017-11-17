#!/usr/bin/env bash
set -xe

virtualenv -p python3.6 /tmp/setupenv
. /tmp/setupenv/bin/activate
python setup.py bdist_wheel
pip install dist/*.whl

python --version
flask_vue init -n test-project -d /tmp
deactivate

pushd /tmp/test-project
    virtualenv -p python3.6 /tmp/venv
    . /tmp/venv/bin/activate
    pip install -e .
    yarn
    yarn build
    PATH=$PATH:`pwd`/node_modules/.bin yarn test
popd


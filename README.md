[![Build Status](https://travis-ci.org/treebee/flask-vue-scaffold.svg?branch=master)](https://travis-ci.org/treebee/flask-vue-scaffold)

# flask-vue-scaffold

Create a new [Flask](https://github.com/pallets/flask) project with a [Vue.js](https://github.com/vuejs/vue) frontend without pain.

## About

`flask-vue-scaffold` helps with setting up a new project which uses Flask for the backend and Vue.js for the frontend.
No need to spend hours getting webpack and Flask to work together for development and production.
As a base it uses [vue-cli](https://github.com/vuejs/vue-cli) with webpack.
In development mode two services are started with the help of [honcho](https://github.com/nickstenning/honcho),
the Flask server and a webpack-devserver.

## Requirements

* Python3.6
* Node

## Usage

```
pip install flask-vue-scaffold
flask_vue init --name my-awesome-project [--dest /path/to/workspace]

cd /path/to/workspace/my-awesome-project
pip install -e .
yarn
my_awesome_project devserver
```

Start editing the backend in the `my_awesome_project` directory, frontend in `src`.

## License

Apache License 2.0

## TODO
* add more tests
* add example python tests to the created project
* merge build and config folder (webpack config stuff) into config folder

from flask import Flask, render_template


def create_app(config=None):
    app = Flask(__name__)

    if config is not None:
        app.config.from_mapping(config)

    @app.route('/')
    def index():
        return render_template('index.html')

    from .api import bp
    app.register_blueprint(bp)
    return app
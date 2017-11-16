import os
import random

from flask import Blueprint, jsonify

bp = Blueprint('api', __name__, url_prefix='/api')


if os.getenv('NODE_ENV') == 'development':
    @bp.after_request
    def add_cors_header(response):
        response.headers['Access-Control-Allow-Origin'] = '*'
        return response


@bp.route('/', methods=['GET', 'OPTIONS'], strict_slashes=False)
def roll_dice():
    return jsonify({'result': f'{random.randint(1, 6)}'})
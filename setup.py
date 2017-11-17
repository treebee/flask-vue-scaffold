from setuptools import setup, find_packages


install_requires = [
    "click"
]


def setup_package():
    setup(
        name='Flask-Vue-Scaffold',
        description='Flask Vue Scaffold',
        author='Patrick Muehlbauer',
        author_email='patrick@opentrash.org',
        url='https://github.com/treebee/flask-vue-scaffold',
        packages=find_packages(
            exclude=['tests', 'test', 'test.*', 'docs']
        ),
        classifiers=[
            'License :: OSI Approved :: Apache Software License',
            'Programming Language :: Python :: 3.6'
        ],
        zip_safe=False,
        include_package_data=True,
        setup_requires=['setuptools_scm'],
        install_requires=install_requires,
        use_scm_version=True,
        entry_points={
            'console_scripts': ['flask_vue=flask_vue_scaffold.cli:main'],
        }
    )


if __name__ == "__main__":
    setup_package()

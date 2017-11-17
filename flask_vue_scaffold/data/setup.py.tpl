from setuptools import setup, find_packages


install_requires = [
    "click",
    "flask",
    "honcho",
]


def setup_package():
    setup(
        name='$flask_vue_scaffold_app_name',
        version='1.0-dev',
        description='',
        author='',
        url='',
        packages=find_packages(
            exclude=['tests', 'test', 'test.*', 'docs']
        ),
        classifiers=[
            'Development Status :: 4 - Beta',
            'Programming Language :: Python',
            'Programming Language :: Python :: 3.6'
        ],
        zip_safe=False,
        include_package_data=True,
        install_requires=install_requires,
        entry_points={
            'console_scripts': ['$flask_vue_scaffold_app_name=$flask_vue_scaffold_app_name.cli:main'],
        }
    )


if __name__ == "__main__":
    setup_package()

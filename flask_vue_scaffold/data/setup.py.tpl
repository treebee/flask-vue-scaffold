from setuptools import setup, find_packages


install_requires = [
    "click",
    "flask",
    "honcho",
]


def setup_package():
    setup(
        name='$flask_vue_scaffold_app_name',
        description='Flask Vue Scaffold App',
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
        setup_requires=['setuptools_scm'],
        install_requires=install_requires,
        use_scm_version=True,
        entry_points={
            'console_scripts': ['$flask_vue_scaffold_app_name=$flask_vue_scaffold_app_name.cli:main'],
        }
    )


if __name__ == "__main__":
    setup_package()

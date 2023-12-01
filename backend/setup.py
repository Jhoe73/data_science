from setuptools import setup, find_packages

setup(
    name='backend',
    version='0.1.0',
    packages=find_packages(),
    install_requires=[
        # list your dependencies here
        'flask',
        'requests',
        'jsonify',
    ],
    author='jjx',
    author_email='',
    description='',
    long_description=open('README.md').read(),
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
)
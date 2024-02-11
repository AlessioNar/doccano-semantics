# Doccano Semantics

This is a specialized version of the doccano tool. It starts from a fork of Doccano 1.8.4 and it is customised to support Akoma Ntoso documents and perform semantic annotation that can later be exported in LYNX standard. It targets specifically semantic annotation. Doccano provides the basic web infrastructure but some parts of the software have been expanded, modified and removed.

For full information about the original doccano annotation tool, please refer to the official repository [doccano/doccano](https://github.com/doccano/doccano)

## Documentation

Refer to the main doccano documentation at <https://doccano.github.io/doccano/>.

## Usage

To reproduce in your environment doccano-semantics you will need to rebuild the application from source.
This version is reproducible in a Linux environment only.

### Backend

The doccano backend is built in Python 3.8+ and uses Poetry as a dependency manager. If you haven't installed them yet, please see Python and Poetry documentation.

First, to install the defined dependencies for our project, just run the install command. After that, activate the virtual environment by running shell command:

```bash
cd backend
poetry install
poetry shell
```
Second, set up the database and run the development server. Doccano uses Django and Django Rest Framework as a backend. We can set up them by using Django command:

```bash
python manage.py migrate
python manage.py create_roles
python manage.py create_admin --noinput --username "admin" --email "admin@example.com" --password "password"
python manage.py runserver
```
In another terminal, activate poetry and launch celery

```bash
cd backend
poetry shell
celery --app=config worker --loglevel=INFO --concurrency=1
```

You can run tests in another terminal with 

```bash
cd backend
poetry shell
poetry run task test
```

### Frontend

The doccano frontend is built in Node.js and uses Yarn as a package manager. If you haven't installed them yet, please see Node.js and Yarn documentation.

First, to install the defined dependencies for our project, just run the install command.


```bash
cd frontend
yarn install
```

Then run the dev command to serve with hot reload at localhost:3000:

```bash
yarn dev
```

# Python package

During development, you may want to create a Python package and verify it works correctly. In such a case, you can create a package by running the following command in the root directory of your project:

```bash
./tools/create-package.sh
```

This command builds the frontend, copies the files, and packages them. This will take a few minutes. After finishing the command, you will find sdist and wheel in backend/dist:

```bash
Building doccano (1.5.5.post335.dev0+6be6d198)
  - Building sdist
  - Built doccano-1.5.5.post335.dev0+6be6d198.tar.gz
  - Building wheel
  - Built doccano-1.5.5.post335.dev0+6be6d198-py3-none-any.whl
```

Then, you can install the package via pip install command:

```bash
pip install doccano-1.5.5.post335.dev0+6be6d198-py3-none-any.whl
```

## Contribution

Please refer to the official Doccano contribution guide. At the current stage this is to be considered a research project with demonstrative purposes, with no ambition to be integrated in the main Doccano repository.

## Citation

```tex
@misc{doccano,
  title={{doccano}: Text Annotation Tool for Human},
  url={https://github.com/doccano/doccano},
  note={Software available from https://github.com/doccano/doccano},
  author={
    Hiroki Nakayama and
    Takahiro Kubo and
    Junya Kamura and
    Yasufumi Taniguchi and
    Xu Liang},
  year={2018},
}
```
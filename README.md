# :checkered_flag: speedle :checkered_flag:

Wordle: Panic Edition

## Usage
Speedle is available as a containerized Flask application.

### System Requirements
- Docker engine
- `make`

### Instructions
1. Clone repo
2. From project root, run `make speedle`
3. Application is accessbile on a web browser at `localhost:5555`


## Development
- Build & open shell into development image:
```
$ make dev
```

- Inside container, targets for Black code formatter and unit tests:
```
# make format
# make test
```

- Inside container, run the Flask app manually:
```
# make run
```

- Hit in browser on `localhost:5050`.

### Tech Stack
- [Python 3.10.4](https://docs.python.org/3/)
- [Flask](https://flask.palletsprojects.com/en/2.2.x/)
- [PyScript](https://pyscript.net/)

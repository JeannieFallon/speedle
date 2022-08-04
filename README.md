# speedle

:fire: Wordle: Panic Edition :fire:

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
make dev
make shell
```

- Targets for Black code formatter and unit tests:
```
make format
make test
```

- Inside container, run the Flask app manually:
```
make run
```

- Hit in browser on `localhost:5555`

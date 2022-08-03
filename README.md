# speedle

Wordle: Panic Edition

## Usage
- Build & run development image
```
make image
make shell
```

- Inside container, Flask app
```
python src/speedle.py
```

- Hit in browser on `localhost:8080`


## TODO
- Fully containerize app: use Docker image for deployment, not just development

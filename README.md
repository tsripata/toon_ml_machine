## To Run

Still very hacky way to add pem
* Generate pem file from `openssl req -x509 -nodes -days 365 -newkey ras:1024 -keyout mykey.key -out mycert.pem`

```
docker build -t docker build -t toon_ml_machine .
nvidia-docker run -i -t -p 8000:8000 -v /media/toon/Data/HumanAtlas/:/tmp  toon_ml_machine /opt/conda/envs/jupyter_env/bin/jupyter notebook --notebook-dir=/tmp --ip='*' --port=8000 --allow-root
```

## Other Notes for HumanAtlast Project
* Set proper mount location. For HumanAtlas, I have to go to file exploer then mnt the media fist

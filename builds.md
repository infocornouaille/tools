## Base

docker build --no-cache -f Dockerfile.base -t infocornouaille/tools:base .

docker build -f Dockerfile.base -t infocornouaille/tools:base .

docker push infocornouaille/tools:base

docker run -it --rm -v $(pwd):/data -p 8000:8000 infocornouaille/tools:base fastapi dev main.py --host 0.0.0.0

http://localhost:8000

docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "\
    conda install jupyter -y --quiet && \
    mkdir -p /opt/notebooks && \
    jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
    --no-browser --allow-root"


# Dev

docker build -f Dockerfile.dev -t infocornouaille/tools:dev .

docker push infocornouaille/tools:dev

# Data

docker build -f Dockerfile.data -t infocornouaille/tools:data .

docker push infocornouaille/tools:data

# Anaconda

docker build -f Dockerfile.anaconda -t infocornouaille/tools:anaconda .

docker push infocornouaille/tools:anaconda

docker run -it --rm infocornouaille/tools:anaconda conda --version



# Perso

docker build --no-cache -f Dockerfile.perso -t infocornouaille/tools:perso .

docker build -f Dockerfile.perso -t infocornouaille/tools:perso .

docker push infocornouaille/tools:perso

docker run -i -t -p 8888:8888 infocornouaille/tools:perso 
    jupyter notebook 
  --ip='*' --port=8888 
    --no-browser --allow-root

docker run -it --rm -v $(pwd):/data -p 8888:8888 infocornouaille/tools:perso jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --notebook-dir=/data




docker run -it --rm -v $(pwd):/data infocornouaille/tools:base conda --version

docker run -it --rm -v $(pwd):/data infocornouaille/tools:base conda list

docker run -it --rm -v $(pwd):/data infocornouaille/tools:base python --version

docker run -it --rm -v $(pwd):/data infocornouaille/tools:base pandoc --version

docker run -it --rm -v $(pwd):/data infocornouaille/tools:base magick --version

docker run -it --rm -v $(pwd):/data infocornouaille/tools:base black .

docker build --target tools-dev -t infocornouaille/tools:dev .

docker build --target tools-data -t infocornouaille/tools:data .

docker build --target tools-perso -t infocornouaille/tools:perso .

## Texlive


docker run -it --rm -v $(pwd):/data infocornouaille/tools:texlive python --version

docker run -it --rm -v $(pwd):/data infocornouaille/tools:texlive latexmk --version

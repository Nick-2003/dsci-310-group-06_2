# Formatting changed for Mac
docker run --platform=linux/amd64 --rm -p 10000:8888 \
    -v "$(pwd)/src":/home/jovyan/work/src \
    -v "$(pwd)/data":/home/jovyan/work/data \
    kayleeli/dsci310_g6_milestone1 \
    start-notebook.sh --NotebookApp.token=''

# docker run --platform=linux/amd64 --rm -p 10000:8888 \
#     -v "$(pwd)/src":/home/jovyan/work/src \
#     -v "$(pwd)/data":/home/jovyan/work/data \
#     nt2103/dsci310practice1 \
#     start-notebook.sh --NotebookApp.token=''

# docker run --rm -it -p 10000:8888 \ 
#     -v "$(pwd)/src":/home/jovyan/work/src \
#     -v "$(pwd)/data":/home/jovyan/work/data \
#     -e DISABLE_AUTH=true nt2103/dsci310practice1
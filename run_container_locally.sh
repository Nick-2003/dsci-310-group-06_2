docker run --rm -p 10000:8888 \
  -v /$(pwd)/reports:/home/jovyan/work/reports \
  -v /$(pwd)/data:/home/jovyan/work/data \
  -v /$(pwd)/src:/home/jovyan/work/src \
  kayleeli/dsci310_g6_milestone1 \
  start-notebook.sh --NotebookApp.token=''

FROM rocker/plumber

WORKDIR /app

COPY plumber.R .

EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('plumber.R'); pr$run(host='0.0.0.0', port=8000)"]

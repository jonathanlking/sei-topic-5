### *tl;dr:* our latest report is [here](http://s3.jlk.co/sei/topic5.pdf).

## Introduction

We are [dogfooding](https://en.wikipedia.org/wiki/Eating_your_own_dog_food) a
build pipeline for continuous deployment of our topic report written in LaTeX.

The pipeline is as follows:

1. A commit or pull request triggers Travis CI.
2. Travis loads our `pdflatex-base` [docker image](https://hub.docker.com/r/jonathanlking/pdflatex-base/) (which can be cached).
3. Travis runs `pdflatex` on our report and checks certain properties such as
   page count and spelling.
4. If successful and on the `release` branch, Travis will:
    - Deploy the report to an Amazon S3 bucket at this [url](http://s3.jlk.co/sei/report.pdf).
    - If a release tag has been set, the report will be uploaded to [GitHub
      Releases](https://github.com/jonathanlking/sei-topic-5/releases).

For more details please view the
[`.travis.yml`](https://raw.githubusercontent.com/jonathanlking/sei-topic-5/release/.travis.yml) file in the repo.

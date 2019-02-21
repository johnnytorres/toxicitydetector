#!/usr/bin/env bash

# EVALUATION

DATA_DIR=../data/offens_eval
TRAINING_DIR=${DATA_DIR}/training
TEST_DIR=${DATA_DIR}/test
OUTPUT_DIR=../results

# TASK A

# no preprocessing
python -m task \
    --train-path=${TRAINING_DIR}/offenseval-training-v1.tsv \
    --test-path=${TEST_DIR}/testset-taska.tsv \
    --embeddings-path=${TRAINING_DIR}/crawl-300d-2M.vec \
    --output-file=${OUTPUT_DIR}/predictions_taska.csv \
    --labels=subtask_a \
    --text-field=tweet \
    --kfolds=10 \
    --model=lr

# preprocessing
python -m task \
    --train-path=${TRAINING_DIR}/offenseval_preprocessed.tsv \
    --test-path=${TEST_DIR}/testset_taska_preprocessed.tsv \
    --embeddings-path=${TRAINING_DIR}/crawl-300d-2M.vec \
    --labels=subtask_a \
    --text-field=tweet \
    --kfolds=10 \
    --model=cnn

# prediction with best preprocessing / model

python -m task \
    --train-path=${TRAINING_DIR}/offenseval-training-v1.tsv \
    --test-path=${TEST_DIR}/testset-taska.tsv \
    --embeddings-path=${TRAINING_DIR}/crawl-300d-2M.vec \
    --output-file=../results/predictions_cnn.csv \
    --labels=subtask_a \
    --text-field=tweet \
    --model=cnn \
    --kfolds=10 \
    --predict


# TASK B

python -m task \
    --train-path=${TRAINING_DIR}/offenseval-training-v1.tsv \
    --test-path=${TEST_DIR}/testset-taskb.tsv \
    --embeddings-path=${TRAINING_DIR}/crawl-300d-2M.vec \
    --output-file=../results/task_b_validation.csv \
    --labels=subtask_b \
    --text-field=tweet \
    --model=lr \
    --kfolds=10

python -m task \
    --train-path=${TRAINING_DIR}/offenseval-training-v1.tsv \
    --test-path=${TEST_DIR}/testset-taskb.tsv \
    --embeddings-path=${TRAINING_DIR}/crawl-300d-2M.vec \
    --output-file=../results/task_b_validation.csv \
    --labels=subtask_b \
    --text-field=tweet \
    --model=cnn \
    --kfolds=10


#TASK C

python -m task \
    --train-path=${TRAINING_DIR}/offenseval-training-v1.tsv \
    --test-path=${TEST_DIR}/testset-taskc.tsv \
    --embeddings-path=${TRAINING_DIR}/crawl-300d-2M.vec \
    --output-file=../results/task_c_validation.csv \
    --labels=subtask_c \
    --text-field=tweet \
    --model=cnn \
    --kfolds=10


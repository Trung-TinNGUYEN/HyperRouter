#!/bin/bash
echo 'Run training...'
python -u train.py \
    --cuda \
    --data ../data/wikitext-103/ \
    --dataset wt103 \
    --n_layer 4 \
    --d_model 256 \
    --n_head 8 \
    --d_head 64 \
    --d_inner 512 \
    --dropatt 0.0 \
    --optim adam \
    --lr 0.00025 \
    --warmup_step 0 \
    --max_step 400000 \
    --tgt_len 512 \
    --mem_len 512 \
    --eval_tgt_len 128 \
    --batch_size 22 \
    --multi_gpu \
    --moe --moe-num-expert 16 --moe-top-k 2 \
    --gate_name NaiveGate \
    --moe_index 0,1,2,3 \
    --dynamic_moe \
    --dynamic_moe_mode linear_increase \
    --dynamic_overall_steps 400000 \
    --moe-top-k-min 8 \
    --moe-top-k-max 16 \
    --work_dir SMoE-Wiki103 \
  
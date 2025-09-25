#!/usr/bin/env bash
set -euo pipefail

export HF_HOME=/mnt/disks/extra-disk/hf-cache
export TRANSFORMERS_CACHE=$HF_HOME/transformers

python -m lm_eval \
  --model hf \
  --model_args "pretrained=google/gemma-3-4b-it,dtype=bfloat16,attn_implementation=flash_attention_2" \
  --tasks mmlu_stem \
  --batch_size auto \
  --output_path ~/lm_benchmark/results/reasoning_Gemma/ \
  --log_samples
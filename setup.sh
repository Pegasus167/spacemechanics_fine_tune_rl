#!/bin/bash
set -e
python -m venv space_env
source space_env/bin/activate
pip install --upgrade pip -q
pip install torch torchvision transformers peft trl accelerate \
    bitsandbytes datasets wandb huggingface-hub safetensors scipy \
    docling pymupdf openai python-dotenv tqdm krpc flask \
    ipykernel notebook jupyterlab -q
python -m ipykernel install --user --name space_env --display-name "Python (space_env)"
python -c "import torch, transformers, peft, trl; print('All OK'); print('CUDA:', torch.cuda.is_available()); print('GPUs:', torch.cuda.device_count())"
echo "SETUP COMPLETE"

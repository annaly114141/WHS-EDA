from hashlib import new


new

msg ="hello"
print(msg)


from transformers import TrainingArguments, pipeline
import torch
import torch.nn.functional as F

generator = pipeline("text-generation", model = "distilgpt2")
res = generator(
    "In this course, we will teach you how to",
    max_length=30,
    num_return_sequences=2,
)
print(res)
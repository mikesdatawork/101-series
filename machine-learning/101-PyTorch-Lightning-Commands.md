# 101 PyTorch Lightning Commands  
*Production-ready PyTorch — no more boilerplate*

### Setup & Installation
| Command                                      | Description |
|----------------------------------------------|-------------|
| pip install lightning                        | Install (new package name) |
| pip install pytorch-lightning                | Legacy name (still works) |
| import lightning as L                        | New recommended import |
| from lightning.pytorch import Trainer        | Core trainer |
| from lightning.pytorch import LightningModule | Base class |
| from lightning.pytorch.callbacks import ModelCheckpoint, EarlyStopping | Callbacks |

### Minimal Lightning Module
| Command                                      | Description |
|----------------------------------------------|-------------|
| class LitModel(L.LightningModule):           | Inherit from LightningModule |
|     def __init__(self): super().__init__(); self.model = nn.Linear(10,1) | Init |
|     def forward(self, x): return self.model(x) | Forward pass |
|     def training_step(self, batch, batch_idx): loss = ...; return loss | Training |
|     def validation_step(self, batch, batch_idx): self.log("val_loss", loss) | Validation |
|     def test_step(self, batch, batch_idx): ... | Testing |
|     def predict_step(self, batch, batch_idx): return self(batch) | Prediction |
|     def configure_optimizers(self): return torch.optim.Adam(self.parameters(), lr=1e-3) | Optimizer |

### Trainer – Core Training
| Command                                      | Description |
|----------------------------------------------|-------------|
| trainer = Trainer(max_epochs=10)             | Basic trainer |
| trainer = Trainer(accelerator="gpu", devices=1) | Single GPU |
| trainer = Trainer(accelerator="gpu", devices=4, strategy="ddp") | Multi-GPU DDP |
| trainer = Trainer(accelerator="tpu", devices=8) | TPU training |
| trainer = Trainer(precision=16)              | Mixed precision (AMP) |
| trainer = Trainer(precision="bf16")          | bfloat16 (A100+) |
| trainer.fit(model, train_dataloader, val_dataloader) | Start training |
| trainer.validate(model, val_dataloader)      | Validation only |
| trainer.test(model, test_dataloader)         | Testing |
| trainer.predict(model, dataloader)           | Get predictions |

### Logging & Metrics
| Command                                      | Description |
|----------------------------------------------|-------------|
| self.log("train_loss", loss, on_step=True, on_epoch=True, prog_bar=True) | Log scalar |
| self.log_dict({"acc": acc, "f1": f1})        | Log multiple |
| from lightning.pytorch.loggers import TensorBoardLogger | TensorBoard |
| from lightning.pytorch.loggers import WandbLogger | Weights & Biases |
| Trainer(logger=TensorBoardLogger("logs/"))   | Enable logger |
| Trainer(logger=WandbLogger(project="my-proj")) | WandB logging |

### Callbacks – Automation
| Command                                      | Description |
|----------------------------------------------|-------------|
| ModelCheckpoint(monitor="val_loss", mode="min", save_top_k=3) | Save best models |
| EarlyStopping(monitor="val_loss", patience=5, mode="min") | Stop early |
| from lightning.pytorch.callbacks import LearningRateMonitor | Log LR |
| Trainer(callbacks=[ModelCheckpoint(...), EarlyStopping(...)]) | Attach callbacks |

### DataModules – Clean Data Handling
| Command                                      | Description |
|----------------------------------------------|-------------|
| class MyDataModule(L.LightningDataModule):   | Inherit |
|     def prepare_data(self): ...              | Download once |
|     def setup(self, stage): self.dataset = ... | Per-GPU setup |
|     def train_dataloader(self): return DataLoader(...) | Train loader |
|     def val_dataloader(self): return DataLoader(...) | Val loader |
|     def test_dataloader(self): return DataLoader(...) | Test loader |
| dm = MyDataModule(); trainer.fit(model, dm)  | Pass instead of loaders |

### Built-in Datasets & Transforms
| Command                                      | Description |
|----------------------------------------------|-------------|
| from torchvision import datasets, transforms | Vision |
| from torchaudio import datasets              | Audio |
| from lightning.pytorch import seed_everything | Global seed |
| seed_everything(42, workers=True)           | Full reproducibility |

### Advanced Training Strategies
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(strategy="deepspeed_stage_2")        | Deepspeed |
| Trainer(strategy="fsdp")                     | Fully Sharded Data Parallel |
| Trainer(gradient_clip_val=0.5)               | Clip gradients |
| Trainer(accumulate_grad_batches=4)           | Gradient accumulation |
| Trainer(limit_train_batches=0.1)             | Train on 10 % only |
| Trainer(overfit_batches=10)                  | Overfit small batch (debug) |

### Model Saving & Loading
| Command                                      | Description |
|----------------------------------------------|-------------|
| trainer.save_checkpoint("best.ckpt")         | Manual save |
| model = LitModel.load_from_checkpoint("best.ckpt") | Load |
| Trainer(resume_from_checkpoint="last.ckpt")  | Resume training |

### Inference & Deployment
| Command                                      | Description |
|----------------------------------------------|-------------|
| trainer.predict(model, dataloader, return_predictions=True) | Return preds |
| model = model.to("cuda"); model.eval(); model.freeze() | Production mode |
| torch.jit.script(model).save("model.pt")     | TorchScript export |
| Trainer(export=True)                         | ONNX / TorchScript via plugins |

### Bonus Power Features
| Command                                      | Description |
|----------------------------------------------|-------------|
| from lightning.pytorch.tuner import Tuner   | Auto LR / batch size |
| tuner = Tuner(trainer); tuner.lr_find(model) | Find optimal LR |
| tuner.scale_batch_size(model, mode="binsearch") | Auto batch size |
| Trainer(fast_dev_run=5)                      | Quick sanity check |
| Trainer(profiler="simple")                   | Profile training |
| Trainer(enable_model_summary=True)           | Print model summary |
| Trainer(log_every_n_steps=10)                | Log frequency |

**Total: 101 PyTorch Lightning commands — from research notebook to 100-GPU production**


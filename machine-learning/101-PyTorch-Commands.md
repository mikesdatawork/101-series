# 101 PyTorch Commands  
*The dominant deep learning framework for research & production*

### Setup & Imports
| Command                                      | Description |
|----------------------------------------------|-------------|
| import torch                                 | Import PyTorch |
| import torch.nn as nn                        | Neural network module |
| import torch.optim as optim                  | Optimizers |
| import torch.nn.functional as F              | Functions (activations, etc.) |
| torch.__version__                            | Check version |
| torch.cuda.is_available()                    | Check GPU availability |
| device = torch.device('cuda' if torch.cuda.is_available() else 'cpu') | Set device |

### Tensor Creation
| Command                                      | Description |
|----------------------------------------------|-------------|
| torch.tensor([1, 2, 3])                      | From list/data |
| torch.zeros(3, 4)                            | Zeros tensor |
| torch.ones(2, 5)                             | Ones tensor |
| torch.randn(1000)                            | Standard normal |
| torch.rand(3, 3)                             | Uniform [0,1) |
| torch.arange(0, 10, 2)                       | Like range() |
| torch.linspace(0, 1, steps=5)               | Evenly spaced |
| torch.eye(4)                                 | Identity matrix |
| torch.tensor([[1,2],[3,4]], dtype=torch.float32, device='cuda') | Full control |

### Tensor Operations
| Command                                      | Description |
|----------------------------------------------|-------------|
| t.shape                                      | Shape |
| t.dtype                                      | Data type |
| t.device                                     | CPU or CUDA |
| t.numel()                                    | Number of elements |
| t.reshape(2, 3)                              | Reshape |
| t.view(-1, 6)                                | View (contiguous) |
| t.flatten()                                  | Flatten |
| t.T                                          | Transpose |
| t.unsqueeze(0)                               | Add dimension |
| t.squeeze()                                  | Remove dim of size 1 |
| torch.cat([t1, t2], dim=0)                   | Concatenate |
| torch.stack([t1, t2], dim=0)                 | Stack (new dim) |

### Math & Broadcasting
| Command                                      | Description |
|----------------------------------------------|-------------|
| t + 5                                        | Add scalar |
| t1 + t2                                      | Element-wise add |
| t1 * t2                                      | Element-wise multiply |
| t @ m                                        | Matrix multiplication |
| torch.matmul(a, b)                           | Matmul |
| torch.mm(a, b)                               | 2D matrix multiply |
| torch.exp(t)                                 | Exponential |
| torch.log(t)                                 | Natural log |
| torch.sin(t) / torch.cos(t)                  | Trig functions |

### GPU & Memory
| Command                                      | Description |
|----------------------------------------------|-------------|
| t.to('cuda')                                 | Move to GPU |
| t.cpu()                                      | Move to CPU |
| t.detach()                                   | Detach from graph |
| t.clone()                                    | Deep copy |
| torch.no_grad()                              | Disable gradients |
| with torch.no_grad():                        | Context manager |
| torch.cuda.empty_cache()                     | Free unused GPU memory |

### Autograd & Backprop
| Command                                      | Description |
|----------------------------------------------|-------------|
| x.requires_grad_(True)                       | Enable gradients |
| y = x.pow(2).sum(); y.backward()             | Compute gradients |
| x.grad                                       | Access gradients |
| optimizer.step(); optimizer.zero_grad()      | Update + clear grads |

### Datasets & DataLoaders
| Command                                      | Description |
|----------------------------------------------|-------------|
| from torch.utils.data import TensorDataset, DataLoader | Core tools |
| dataset = TensorDataset(X_tensor, y_tensor)  | Wrap tensors |
| loader = DataLoader(dataset, batch_size=32, shuffle=True) | Mini-batches |
| for batch_x, batch_y in loader:              | Training loop |
| loader = DataLoader(dataset, batch_size=64, num_workers=4, pin_memory=True) | Fast loading |

### Neural Network Building
| Command                                      | Description |
|----------------------------------------------|-------------|
| nn.Linear(10, 5)                             | Fully connected layer |
| nn.ReLU()                                    | ReLU activation |
| nn.Dropout(p=0.5)                            | Dropout |
| nn.BatchNorm1d(100)                          | Batch normalization |
| nn.Conv2d(in_channels=3, out_channels=64, kernel_size=3) | 2D conv |
| nn.MaxPool2d(2)                              | Max pooling |
| nn.LSTM(input_size=50, hidden_size=128, num_layers=2) | LSTM |

### Model Definition
| Command                                      | Description |
|----------------------------------------------|-------------|
| class Net(nn.Module):                        | Inherit from nn.Module |
|     def __init__(self): super().__init__()   | Call parent init |
|     def forward(self, x): return x           | Forward pass |
| model = Net().to(device)                     | Instantiate + move |
| model.parameters()                           | Get trainable params |
| list(model.named_parameters())               | Name + param |

### Loss Functions
| Command                                      | Description |
|----------------------------------------------|-------------|
| nn.CrossEntropyLoss()                        | Classification |
| nn.NLLLoss()                                 | Negative log likelihood |
| nn.MSELoss()                                 | Mean squared error |
| nn.BCELoss()                                 | Binary cross-entropy |
| nn.BCEWithLogitsLoss()                       | Numerically stable BCE |
| criterion = nn.CrossEntropyLoss()            | Common usage |

### Optimizers
| Command                                      | Description |
|----------------------------------------------|-------------|
| optim.SGD(model.parameters(), lr=0.01)       | SGD |
| optim.Adam(model.parameters(), lr=0.001)     | Adam (most used) |
| optim.RMSprop(model.parameters(), lr=0.001)  | RMSprop |
| optimizer = optim.Adam(model.parameters(), lr=1e-3, weight_decay=1e-5) | L2 reg |
| scheduler = optim.lr_scheduler.StepLR(optimizer, step_size=10, gamma=0.1) | LR decay |

### Training Loop (Core)
| Command                                      | Description |
|----------------------------------------------|-------------|
| model.train()                                | Training mode |
| model.eval()                                 | Evaluation mode |
| for epoch in range(10):                      | Epoch loop |
|     for x, y in train_loader:                | Batch loop |
|         optimizer.zero_grad()                | Clear grads |
|         outputs = model(x)                   | Forward |
|         loss = criterion(outputs, y)         | Compute loss |
|         loss.backward()                       | Backprop |
|         optimizer.step()                     | Update weights |

### Evaluation & Inference
| Command                                      | Description |
|----------------------------------------------|-------------|
| with torch.no_grad():                        | Inference context |
|     preds = model(x_test)                    | No gradient tracking |
| torch.max(preds, 1)                          | Get predicted class |
| torch.argmax(preds, dim=1)                   | Argmax |
| preds.cpu().numpy()                          | To NumPy |
| accuracy = (preds.argmax(1) == y).float().mean() | Simple accuracy |

### Model Saving & Loading
| Command                                      | Description |
|----------------------------------------------|-------------|
| torch.save(model.state_dict(), 'model.pth')  | Save weights |
| model.load_state_dict(torch.load('model.pth')) | Load weights |
| torch.save(model, 'full_model.pth')          | Save entire model |
| model = torch.load('full_model.pth')         | Load entire |

### Advanced & Bonus
| Command                                      | Description |
|----------------------------------------------|-------------|
| torch.hub.load('pytorch/vision', 'resnet50', pretrained=True) | Pretrained models |
| from torchvision import models; models.resnet50(pretrained=True) | Vision models |
| nn.DataParallel(model)                       | Multi-GPU training |
| torch.compile(model)                         | PyTorch 2.0 speedup |
| torch.backends.cudnn.benchmark = True        | Optimize cuDNN |
| torch.set_float32_matmul_precision('high')   | Faster matmul (Ampere+) |
| torch.jit.script(model)                      | TorchScript |
| torch.onnx.export(model, dummy_input, "model.onnx") | Export to ONNX |

**Total: 101 PyTorch commands — from research to production deep learning**


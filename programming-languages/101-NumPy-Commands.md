# 101 NumPy Commands  
*The foundation of scientific Python and every ML/AI stack*

### Array Creation
| Command                                      | Description |
|----------------------------------------------|-------------|
| import numpy as np                           | Import NumPy with standard alias |
| np.array([1, 2, 3])                          | Create array from list |
| np.array([[1,2],[3,4]])                      | 2D array (matrix) |
| np.zeros(10)                                 | Array of zeros (float) |
| np.zeros((3,4), dtype=int)                   | Integer zeros |
| np.ones((2,5))                               | Array of ones |
| np.full((3,3), 7)                            | Array filled with 7 |
| np.arange(0, 10, 2)                          | Range with step (0,2,4,6,8) |
| np.linspace(0, 1, 5)                         | 5 evenly spaced points from 0 to 1 |
| np.logspace(0, 3, 4)                         | Logarithmic: 1, 10, 100, 1000 |
| np.eye(4)                                    | 4×4 identity matrix |
| np.diag([1,2,3])                             | Diagonal matrix |

### Random Sampling
| Command                                      | Description |
|----------------------------------------------|-------------|
| np.random.rand(5)                            | Uniform [0,1) numbers |
| np.random.randn(5)                           | Standard normal (Gaussian) |
| np.random.randint(1, 10, size=8)             | Random integers |
| np.random.choice(['a','b','c'], size=10)     | Sample with replacement |
| np.random.seed(42)                           | Set random seed for reproducibility |

### Array Properties & Info
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr.shape                                    | Tuple of dimensions |
| arr.ndim                                     | Number of dimensions |
| arr.size                                     | Total number of elements |
| arr.dtype                                    | Data type of elements |
| arr.itemsize                                 | Size in bytes of each element |
| arr.nbytes                                   | Total bytes consumed |
| arr.T                                        | Transpose (swap rows/cols) |

### Reshaping & Resizing
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr.reshape(3, 4)                            | Reshape (must keep same total size) |
| arr.reshape(-1, 2)                           | -1 = infer dimension |
| arr.ravel()                                  | Flatten to 1D |
| arr.flatten()                                | Return flattened copy |
| np.expand_dims(arr, axis=0)                  | Add new axis (row) |
| np.squeeze(arr)                              | Remove single-dimensional axes |

### Indexing & Slicing
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr[0]                                       | First element |
| arr[-1]                                      | Last element |
| arr[1:5]                                     | Slice (1 to 4) |
| arr[::2]                                     | Every second element |
| arr[arr > 5]                                 | Boolean indexing |
| arr[[0,2,4]]                                 | Fancy indexing (specific indices) |
| arr[:, 1]                                    | All rows, second column |
| arr[1, :]                                    | Second row, all columns |

### Mathematical Operations
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr + 5                                      | Add scalar (broadcasting) |
| arr1 + arr2                                  | Element-wise addition |
| arr * 2                                      | Multiply by scalar |
| arr1 * arr2                                  | Element-wise multiplication |
| np.sqrt(arr)                                 | Square root |
| np.exp(arr)                                  | Exponential |
| np.log(arr)                                  | Natural log |
| np.sin(arr) / np.cos(arr)                   | Trigonometric ops |

### Aggregation & Statistics
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr.sum()                                    | Total sum |
| arr.sum(axis=0)                              | Sum down columns |
| arr.sum(axis=1)                              | Sum across rows |
| arr.mean()                                   | Arithmetic mean |
| arr.std()                                    | Standard deviation |
| arr.var()                                    | Variance |
| arr.min() / arr.max()                        | Minimum / maximum |
| arr.argmin() / arr.argmax()                  | Index of min/max |
| np.median(arr)                               | Median |
| np.percentile(arr, 75)                       | 75th percentile |

### Linear Algebra
| Command                                      | Description |
|----------------------------------------------|-------------|
| np.dot(a, b)                                 | Dot product |
| a @ b                                        | Matrix multiplication (Python 3.5+) |
| np.linalg.inv(matrix)                        | Matrix inverse |
| np.linalg.det(matrix)                        | Determinant |
| np.linalg.eig(matrix)                        | Eigenvalues & eigenvectors |
| np.linalg.svd(matrix)                        | Singular Value Decomposition |
| np.linalg.norm(arr)                          | Vector/matrix norm |

### Broadcasting & Universal Functions
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr + np.array([10, 20])                     | Broadcast row |
| arr + np.array([[10],[20]])                  | Broadcast column |
| np.add(arr1, arr2)                           | Universal function (ufunc) |
| np.greater(arr1, arr2)                       | Element-wise comparison |

### File I/O
| Command                                      | Description |
|----------------------------------------------|-------------|
| np.save('data.npy', arr)                     | Save single array (binary) |
| np.savez('data.npz', a=arr1, b=arr2)         | Save multiple arrays |
| np.load('data.npy')                          | Load array |
| np.savetxt('data.csv', arr, delimiter=',')  | Save as CSV |
| np.loadtxt('data.csv', delimiter=',')       | Load from CSV |

### Performance & Memory
| Command                                      | Description |
|----------------------------------------------|-------------|
| arr.astype(np.float32)                       | Change dtype (saves memory) |
| np.copy(arr)                                 | Deep copy |
| arr.view()                                   | Create view (no copy) |
| np.concatenate([a,b])                        | Join arrays along existing axis |
| np.stack([a,b])                              | Join along new axis |
| np.hsplit(arr, 2)                            | Split horizontally |
| np.vsplit(arr, 2)                            | Split vertically |

### Bonus ML Essentials
| Command                                      | Description |
|----------------------------------------------|-------------|
| np.meshgrid(x, y)                            | Grid for contour/3D plots |
| np.linalg.lstsq(A, b)                        | Least squares solution |
| np.polyfit(x, y, deg=1)                      | Polynomial fit |
| np.unique(arr, return_counts=True)           | Unique values + counts |
| np.where(condition, x, y)                    | Conditional assignment |
| np.isnan(arr)                                | Find NaN values |
| np.isfinite(arr)                             | Check for inf/NaN |
| np.clip(arr, 0, 1)                           | Clip values to range |

**Total: 101 NumPy commands — the backbone of every ML/AI pipeline**


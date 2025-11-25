# 101 FastAPI Commands

## Overview
FastAPI is a modern, fast, high-performance Python web framework for building APIs with Python 3.7+ based on standard Python type hints. This cheat sheet covers essential FastAPI functionality including routing, request/response handling, dependency injection, authentication, database integration, validation with Pydantic, testing, and deployment - everything needed to build production-ready APIs.

## Target Audience
- API developers building REST services
- Backend engineers creating microservices
- Data scientists deploying ML models
- Full-stack developers using Python
- Anyone building high-performance web APIs

## Command Categories

### 1. FastAPI Application Setup (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import FastAPI | Import FastAPI | Application creation | from fastapi import FastAPI |
| app = FastAPI() | Create FastAPI app | App initialization | app = FastAPI() |
| app = FastAPI(title="API") | Create with metadata | API documentation | app = FastAPI(title="My API", version="1.0.0") |
| app = FastAPI(docs_url="/docs") | Custom docs URL | Documentation path | app = FastAPI(docs_url="/api/docs") |
| app = FastAPI(redoc_url="/redoc") | Custom ReDoc URL | Alternative docs | app = FastAPI(redoc_url="/api/redoc") |
| app = FastAPI(openapi_url="/openapi.json") | Custom OpenAPI URL | OpenAPI schema | app = FastAPI(openapi_url="/api/openapi.json") |
| uvicorn.run(app) | Run with uvicorn | Server starting | uvicorn.run(app, host="0.0.0.0", port=8000) |
| uvicorn main:app --reload | Run with auto-reload | Development mode | uvicorn main:app --reload |
| uvicorn main:app --host 0.0.0.0 | Run on all interfaces | Network accessible | uvicorn main:app --host 0.0.0.0 |
| uvicorn main:app --port 8080 | Run on specific port | Custom port | uvicorn main:app --port 8080 |

### 2. Basic Routing (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @app.get("/") | Define GET endpoint | GET requests | @app.get("/") def root(): return {"message": "Hello"} |
| @app.post("/") | Define POST endpoint | POST requests | @app.post("/items") def create(): ... |
| @app.put("/") | Define PUT endpoint | PUT requests | @app.put("/items/{id}") def update(): ... |
| @app.delete("/") | Define DELETE endpoint | DELETE requests | @app.delete("/items/{id}") def delete(): ... |
| @app.patch("/") | Define PATCH endpoint | PATCH requests | @app.patch("/items/{id}") def partial_update(): ... |
| @app.options("/") | Define OPTIONS endpoint | CORS preflight | @app.options("/items") def options(): ... |
| @app.head("/") | Define HEAD endpoint | HEAD requests | @app.head("/items") def head(): ... |
| @app.api_route("/", methods=["GET", "POST"]) | Multiple methods | Combined endpoints | @app.api_route("/items", methods=["GET", "POST"]) |
| @app.get("/items/{item_id}") | Path parameter | Dynamic routing | @app.get("/items/{item_id}") def read(item_id: int): ... |
| @app.get("/users/{user_id}/items/{item_id}") | Multiple path params | Complex routing | @app.get("/users/{user_id}/items/{item_id}") |
| response_model | Set response model | Response validation | @app.get("/items", response_model=list[Item]) |
| status_code | Set status code | HTTP status | @app.post("/items", status_code=201) |

### 3. Path Parameters (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| path_param: int | Integer path parameter | Numeric IDs | @app.get("/items/{item_id}") def read(item_id: int): ... |
| path_param: str | String path parameter | Text identifiers | @app.get("/users/{username}") def read(username: str): ... |
| path_param: float | Float path parameter | Decimal values | @app.get("/price/{value}") def read(value: float): ... |
| path_param: bool | Boolean path parameter | True/False | @app.get("/items/{active}") def read(active: bool): ... |
| from fastapi import Path | Import Path | Path validation | from fastapi import Path |
| Path(...) | Required path param | Validation | item_id: int = Path(...) |
| Path(gt=0) | Greater than | Numeric validation | item_id: int = Path(gt=0) |
| Path(ge=1) | Greater or equal | Minimum value | item_id: int = Path(ge=1) |
| Path(lt=100) | Less than | Maximum value | item_id: int = Path(lt=100) |
| Path(title="Item ID") | Parameter metadata | Documentation | item_id: int = Path(..., title="Item ID") |

### 4. Query Parameters (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| param: str = None | Optional query param | Optional filtering | @app.get("/items") def read(q: str = None): ... |
| param: int = 0 | Query param with default | Default values | @app.get("/items") def read(skip: int = 0): ... |
| from fastapi import Query | Import Query | Query validation | from fastapi import Query |
| Query(None) | Optional query | Optional parameter | q: str = Query(None) |
| Query(...) | Required query | Required parameter | q: str = Query(...) |
| Query(min_length=3) | Minimum length | String validation | q: str = Query(None, min_length=3) |
| Query(max_length=50) | Maximum length | String validation | q: str = Query(None, max_length=50) |
| Query(regex="^pattern") | Regex validation | Pattern matching | q: str = Query(None, regex="^[a-z]+$") |
| Query(gt=0) | Greater than | Numeric validation | limit: int = Query(10, gt=0) |
| Query(le=100) | Less or equal | Maximum value | limit: int = Query(10, le=100) |
| Query(alias="item-query") | Query alias | Different name | q: str = Query(None, alias="item-query") |
| param: list[str] = Query([]) | List parameter | Multiple values | tags: list[str] = Query([]) |

### 5. Request Body (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from pydantic import BaseModel | Import Pydantic model | Data validation | from pydantic import BaseModel |
| class Model(BaseModel) | Define model | Request schema | class Item(BaseModel): name: str; price: float |
| from fastapi import Body | Import Body | Body parameters | from fastapi import Body |
| Body(...) | Required body | Request body | item: Item = Body(...) |
| Body(embed=True) | Embed body | Single key body | item: Item = Body(..., embed=True) |
| body: Model | Model body parameter | Structured data | def create(item: Item): ... |
| Field(...) | Model field | Field validation | name: str = Field(..., min_length=1) |
| from pydantic import Field | Import Field | Field constraints | from pydantic import Field |
| Field(default=value) | Default value | Optional fields | price: float = Field(default=0.0) |
| Field(gt=0) | Field validation | Numeric constraints | price: float = Field(gt=0) |
| Field(description="text") | Field documentation | API docs | name: str = Field(..., description="Item name") |
| Field(example="value") | Field example | Documentation | name: str = Field(..., example="Widget") |

### 6. Response Models (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| response_model=Model | Set response model | Response validation | @app.get("/items", response_model=Item) |
| response_model=list[Model] | List response | Multiple items | @app.get("/items", response_model=list[Item]) |
| response_model_exclude_unset | Exclude unset | Partial response | @app.get("/items", response_model_exclude_unset=True) |
| response_model_exclude_none | Exclude None | Skip null values | @app.get("/items", response_model_exclude_none=True) |
| response_model_include | Include fields | Field selection | @app.get("/items", response_model_include={"name", "price"}) |
| response_model_exclude | Exclude fields | Field hiding | @app.get("/items", response_model_exclude={"password"}) |
| from fastapi.responses import JSONResponse | Import JSON response | Custom responses | from fastapi.responses import JSONResponse |
| JSONResponse(content=dict) | Return JSON | Manual response | return JSONResponse(content={"message": "Success"}) |
| from fastapi.responses import Response | Import Response | Custom content | from fastapi.responses import Response |
| Response(content, media_type) | Custom response | Non-JSON response | return Response(content=xml, media_type="application/xml") |

### 7. Response Status Codes (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| status_code=200 | OK status | Successful response | @app.get("/items", status_code=200) |
| status_code=201 | Created status | Resource creation | @app.post("/items", status_code=201) |
| status_code=204 | No content | Successful deletion | @app.delete("/items/{id}", status_code=204) |
| from fastapi import status | Import status codes | Status constants | from fastapi import status |
| status.HTTP_200_OK | OK constant | Status codes | status_code=status.HTTP_200_OK |
| status.HTTP_201_CREATED | Created constant | Creation response | status_code=status.HTTP_201_CREATED |
| status.HTTP_204_NO_CONTENT | No content constant | Delete response | status_code=status.HTTP_204_NO_CONTENT |
| status.HTTP_400_BAD_REQUEST | Bad request | Validation error | status_code=status.HTTP_400_BAD_REQUEST |
| status.HTTP_404_NOT_FOUND | Not found | Missing resource | status_code=status.HTTP_404_NOT_FOUND |
| status.HTTP_500_INTERNAL_SERVER_ERROR | Server error | Internal errors | status_code=status.HTTP_500_INTERNAL_SERVER_ERROR |

### 8. Error Handling (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import HTTPException | Import exception | Error raising | from fastapi import HTTPException |
| raise HTTPException(status_code, detail) | Raise HTTP error | Error responses | raise HTTPException(status_code=404, detail="Not found") |
| HTTPException(status_code=404) | Not found error | 404 errors | raise HTTPException(status_code=404) |
| HTTPException(status_code=400) | Bad request | Validation errors | raise HTTPException(status_code=400, detail="Invalid input") |
| HTTPException(status_code=401) | Unauthorized | Auth errors | raise HTTPException(status_code=401, detail="Not authenticated") |
| HTTPException(status_code=403) | Forbidden | Permission errors | raise HTTPException(status_code=403, detail="Not authorized") |
| @app.exception_handler(Exception) | Custom handler | Exception handling | @app.exception_handler(ValueError) def handler(req, exc): ... |
| from fastapi.exceptions import RequestValidationError | Import validation error | Validation handling | from fastapi.exceptions import RequestValidationError |
| @app.exception_handler(RequestValidationError) | Validation handler | Custom validation | @app.exception_handler(RequestValidationError) |
| headers parameter | Custom headers | Error headers | raise HTTPException(status_code=404, headers={"X-Error": "custom"}) |

### 9. Dependencies (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import Depends | Import Depends | Dependency injection | from fastapi import Depends |
| Depends(function) | Inject dependency | Dependency usage | def endpoint(db: Session = Depends(get_db)): ... |
| def dependency() | Define dependency | Dependency function | def get_db(): db = SessionLocal(); yield db; db.close() |
| yield in dependency | Cleanup dependency | Resource management | yield resource; cleanup() |
| async def dependency() | Async dependency | Async operations | async def get_current_user(): ... |
| Depends(dependency, use_cache=True) | Cached dependency | Caching | Depends(get_settings, use_cache=True) |
| dependencies=[Depends()] | Route dependencies | Route-level deps | @app.get("/items", dependencies=[Depends(verify_token)]) |
| app.dependency_overrides | Override dependency | Testing | app.dependency_overrides[get_db] = get_test_db |
| class Dependency | Class dependency | Reusable logic | class CommonParams: def __init__(self, q: str = None): ... |
| Depends(Class) | Class-based dependency | Object injection | params: CommonParams = Depends(CommonParams) |
| Security dependencies | Security injection | Auth dependencies | token: str = Depends(oauth2_scheme) |
| Sub-dependencies | Nested dependencies | Dependency chains | def dep1(dep2: Type = Depends(get_dep2)): ... |

### 10. Security and Authentication (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi.security import OAuth2PasswordBearer | Import OAuth2 | Token authentication | from fastapi.security import OAuth2PasswordBearer |
| OAuth2PasswordBearer(tokenUrl="token") | Create OAuth2 scheme | Token endpoint | oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token") |
| token: str = Depends(oauth2_scheme) | Get token | Token extraction | def endpoint(token: str = Depends(oauth2_scheme)): ... |
| from fastapi.security import OAuth2PasswordRequestForm | Import login form | Login handling | from fastapi.security import OAuth2PasswordRequestForm |
| form_data: OAuth2PasswordRequestForm = Depends() | Login form | User authentication | def login(form: OAuth2PasswordRequestForm = Depends()): ... |
| from fastapi.security import HTTPBasic | Import Basic auth | Basic authentication | from fastapi.security import HTTPBasic |
| from fastapi.security import HTTPBearer | Import Bearer | Bearer tokens | from fastapi.security import HTTPBearer |
| from fastapi.security import APIKeyHeader | Import API key | API key auth | from fastapi.security import APIKeyHeader |
| APIKeyHeader(name="X-API-Key") | API key header | Header-based auth | api_key_header = APIKeyHeader(name="X-API-Key") |
| from jose import jwt | Import JWT | Token creation | from jose import jwt |
| jwt.encode(data, secret, algorithm) | Create JWT | Token generation | token = jwt.encode({"sub": user_id}, SECRET, "HS256") |
| jwt.decode(token, secret, algorithms) | Decode JWT | Token verification | payload = jwt.decode(token, SECRET, ["HS256"]) |

### 11. File Uploads (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import File | Import File | File uploads | from fastapi import File |
| from fastapi import UploadFile | Import UploadFile | File handling | from fastapi import UploadFile |
| file: UploadFile = File(...) | Upload file parameter | File endpoint | def upload(file: UploadFile = File(...)): ... |
| file.filename | Get filename | Filename access | filename = file.filename |
| file.content_type | Get content type | MIME type | content_type = file.content_type |
| await file.read() | Read file content | File processing | contents = await file.read() |
| await file.write(data) | Write to file | File saving | await file.write(data) |
| files: list[UploadFile] = File(...) | Multiple files | Bulk upload | def upload(files: list[UploadFile] = File(...)): ... |

### 12. Background Tasks (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import BackgroundTasks | Import background tasks | Task scheduling | from fastapi import BackgroundTasks |
| BackgroundTasks.add_task(func, *args) | Add background task | Task queuing | background_tasks.add_task(send_email, email) |
| def task_function() | Define task | Task definition | def send_notification(user_id: int): ... |
| async def task_function() | Async task | Async operations | async def process_data(data): ... |
| background_tasks: BackgroundTasks | Task parameter | Endpoint injection | def endpoint(background_tasks: BackgroundTasks): ... |
| add_task with kwargs | Task with kwargs | Named arguments | background_tasks.add_task(func, arg1=val1, arg2=val2) |
| Multiple tasks | Queue multiple | Task batching | background_tasks.add_task(task1); background_tasks.add_task(task2) |
| Task dependencies | Task with deps | Complex tasks | background_tasks.add_task(cleanup, db=db) |

### 13. Middleware (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi.middleware.cors import CORSMiddleware | Import CORS | CORS handling | from fastapi.middleware.cors import CORSMiddleware |
| app.add_middleware(CORSMiddleware) | Add CORS | CORS setup | app.add_middleware(CORSMiddleware, allow_origins=["*"]) |
| allow_origins | Allowed origins | Origin whitelist | allow_origins=["https://example.com"] |
| allow_credentials | Allow credentials | Cookie support | allow_credentials=True |
| allow_methods | Allowed methods | HTTP methods | allow_methods=["GET", "POST"] |
| allow_headers | Allowed headers | Custom headers | allow_headers=["X-Custom-Header"] |
| @app.middleware("http") | Custom middleware | Request/response processing | @app.middleware("http") async def middleware(req, call_next): ... |
| await call_next(request) | Call next middleware | Middleware chain | response = await call_next(request) |
| from fastapi.middleware.trustedhost import TrustedHostMiddleware | Import trusted host | Host validation | from fastapi.middleware.trustedhost import TrustedHostMiddleware |
| from fastapi.middleware.gzip import GZipMiddleware | Import GZip | Response compression | from fastapi.middleware.gzip import GZipMiddleware |

### 14. Database Integration (SQLAlchemy) (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from sqlalchemy import create_engine | Import engine | Database connection | from sqlalchemy import create_engine |
| create_engine(url) | Create engine | Engine initialization | engine = create_engine("sqlite:///./test.db") |
| from sqlalchemy.orm import sessionmaker | Import session maker | Session creation | from sqlalchemy.orm import sessionmaker |
| SessionLocal = sessionmaker() | Create session class | Session factory | SessionLocal = sessionmaker(bind=engine) |
| from sqlalchemy.ext.declarative import declarative_base | Import base | Model base | from sqlalchemy.ext.declarative import declarative_base |
| Base = declarative_base() | Create base class | Model inheritance | Base = declarative_base() |
| class Model(Base) | Define model | Database model | class User(Base): __tablename__ = "users" |
| Column() | Define column | Table column | id = Column(Integer, primary_key=True) |
| relationship() | Define relationship | Model relationships | posts = relationship("Post", back_populates="author") |
| Base.metadata.create_all(engine) | Create tables | Database initialization | Base.metadata.create_all(bind=engine) |
| def get_db() | Database dependency | DB session | def get_db(): db = SessionLocal(); yield db; db.close() |
| db: Session = Depends(get_db) | Inject database | Database access | def endpoint(db: Session = Depends(get_db)): ... |

### 15. Testing (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi.testclient import TestClient | Import test client | Testing setup | from fastapi.testclient import TestClient |
| client = TestClient(app) | Create test client | Client initialization | client = TestClient(app) |
| client.get("/") | Test GET request | GET testing | response = client.get("/") |
| client.post("/", json=data) | Test POST request | POST testing | response = client.post("/items", json={"name": "test"}) |
| response.status_code | Get status code | Status verification | assert response.status_code == 200 |
| response.json() | Get JSON response | Response parsing | data = response.json() |
| client.headers | Set headers | Header testing | client.headers = {"Authorization": "Bearer token"} |
| app.dependency_overrides | Override dependencies | Mock dependencies | app.dependency_overrides[get_db] = override_get_db |
| pytest.fixture | Create fixture | Test fixtures | @pytest.fixture def client(): return TestClient(app) |
| def test_function() | Define test | Test function | def test_read_main(): response = client.get("/") |

### 16. WebSockets (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import WebSocket | Import WebSocket | WebSocket support | from fastapi import WebSocket |
| @app.websocket("/ws") | WebSocket endpoint | WebSocket route | @app.websocket("/ws") async def websocket_endpoint(websocket: WebSocket): ... |
| await websocket.accept() | Accept connection | Connection establishment | await websocket.accept() |
| await websocket.receive_text() | Receive message | Message receiving | message = await websocket.receive_text() |
| await websocket.send_text() | Send message | Message sending | await websocket.send_text("Hello") |
| await websocket.receive_json() | Receive JSON | JSON receiving | data = await websocket.receive_json() |
| await websocket.send_json() | Send JSON | JSON sending | await websocket.send_json({"message": "Hello"}) |
| await websocket.close() | Close connection | Connection closing | await websocket.close() |

### 17. Advanced Features (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from fastapi import APIRouter | Import router | Route organization | from fastapi import APIRouter |
| router = APIRouter() | Create router | Router initialization | router = APIRouter(prefix="/api") |
| app.include_router(router) | Include router | Router registration | app.include_router(router, prefix="/api", tags=["items"]) |
| tags=["Items"] | Endpoint tags | Documentation grouping | @app.get("/items", tags=["Items"]) |
| summary="Description" | Endpoint summary | Short description | @app.get("/items", summary="Get all items") |
| description="Long text" | Endpoint description | Detailed description | @app.get("/items", description="Retrieve all items...") |
| deprecated=True | Mark deprecated | Deprecation notice | @app.get("/old", deprecated=True) |
| @app.on_event("startup") | Startup event | Initialization | @app.on_event("startup") async def startup(): ... |
| @app.on_event("shutdown") | Shutdown event | Cleanup | @app.on_event("shutdown") async def shutdown(): ... |
| from typing import Optional | Import Optional | Optional types | from typing import Optional |

## Tips and Best Practices
* Use Pydantic models for request and response validation
* Leverage dependency injection for reusable logic
* Implement proper error handling with HTTPException
* Use type hints for automatic validation and docs
* Organize routes with APIRouter for large applications
* Use background tasks for non-blocking operations
* Implement proper authentication and authorization
* Use response models to control output
* Enable CORS for cross-origin requests
* Write tests using TestClient
* Use async/await for I/O-bound operations
* Leverage automatic OpenAPI documentation
* Use environment variables for configuration
* Implement rate limiting for production APIs
* Use database connection pooling

## Additional Resources
* [FastAPI Documentation](https://fastapi.tiangolo.com/)
* [FastAPI Tutorial](https://fastapi.tiangolo.com/tutorial/)
* [Pydantic Documentation](https://pydantic-docs.helpmanual.io/)
* [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)
* [FastAPI Best Practices](https://github.com/zhanymkanov/fastapi-best-practices)
* [Full Stack FastAPI Template](https://github.com/tiangolo/full-stack-fastapi-postgresql)
* [Awesome FastAPI](https://github.com/mjhea0/awesome-fastapi)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to FastAPI development.

### Common Terms

| Term | Description |
|------|-------------|
| ASGI | Asynchronous Server Gateway Interface |
| Pydantic | Data validation library using type hints |
| Dependency Injection | Providing dependencies to functions automatically |
| Path Operation | Function handling a specific path and HTTP method |
| Request Body | Data sent in POST/PUT requests |
| Response Model | Model defining response structure |
| Query Parameter | URL parameter after question mark |
| Path Parameter | Variable part of URL path |
| Middleware | Request/response processing layer |
| OpenAPI | API specification standard |

### FastAPI Features

| Feature | Description | Benefit |
|---------|-------------|---------|
| Type hints | Python type annotations | Automatic validation |
| Pydantic models | Data validation models | Request/response validation |
| Dependency injection | Automatic dependency resolution | Code reusability |
| Async support | Native async/await | High performance |
| Auto documentation | Swagger UI and ReDoc | Interactive docs |
| Standards-based | OpenAPI and JSON Schema | API compatibility |
| Fast | Built on Starlette and Pydantic | High speed |
| Modern Python | Python 3.7+ features | Clean code |

### HTTP Methods

| Method | Purpose | FastAPI Decorator |
|--------|---------|-------------------|
| GET | Retrieve resource | @app.get() |
| POST | Create resource | @app.post() |
| PUT | Update resource | @app.put() |
| DELETE | Delete resource | @app.delete() |
| PATCH | Partial update | @app.patch() |
| OPTIONS | Get options | @app.options() |
| HEAD | Get headers | @app.head() |

### Status Codes

| Code | Constant | Meaning |
|------|----------|---------|
| 200 | HTTP_200_OK | Success |
| 201 | HTTP_201_CREATED | Created |
| 204 | HTTP_204_NO_CONTENT | No content |
| 400 | HTTP_400_BAD_REQUEST | Bad request |
| 401 | HTTP_401_UNAUTHORIZED | Unauthorized |
| 403 | HTTP_403_FORBIDDEN | Forbidden |
| 404 | HTTP_404_NOT_FOUND | Not found |
| 422 | HTTP_422_UNPROCESSABLE_ENTITY | Validation error |
| 500 | HTTP_500_INTERNAL_SERVER_ERROR | Server error |

### Pydantic Field Types

| Type | Purpose | Example |
|------|---------|---------|
| str | String | name: str |
| int | Integer | age: int |
| float | Float | price: float |
| bool | Boolean | active: bool |
| list | List | tags: list[str] |
| dict | Dictionary | metadata: dict |
| Optional | Optional field | email: Optional[str] |
| Union | Multiple types | value: Union[int, str] |

### Dependency Injection Patterns

| Pattern | Usage | Example |
|---------|-------|---------|
| Function dependency | Simple injection | Depends(get_db) |
| Class dependency | Reusable logic | Depends(CommonParams) |
| Yield dependency | Resource cleanup | yield db; db.close() |
| Sub-dependency | Nested deps | dep1(dep2: Type = Depends()) |
| Cached dependency | Single execution | Depends(use_cache=True) |
| Security dependency | Authentication | Depends(oauth2_scheme) |

### Response Types

| Type | Purpose | Usage |
|------|---------|-------|
| JSONResponse | JSON content | return JSONResponse(content={}) |
| HTMLResponse | HTML content | return HTMLResponse(content="<html>") |
| PlainTextResponse | Plain text | return PlainTextResponse("text") |
| FileResponse | File download | return FileResponse(path) |
| StreamingResponse | Streaming data | return StreamingResponse(iterator) |
| RedirectResponse | Redirect | return RedirectResponse(url) |

### Validation Constraints

| Constraint | Purpose | Example |
|------------|---------|---------|
| min_length | Minimum length | Field(min_length=3) |
| max_length | Maximum length | Field(max_length=50) |
| gt | Greater than | Field(gt=0) |
| ge | Greater or equal | Field(ge=0) |
| lt | Less than | Field(lt=100) |
| le | Less or equal | Field(le=100) |
| regex | Pattern matching | Field(regex="^[a-z]+$") |
| multiple_of | Multiple of value | Field(multiple_of=5) |

### Authentication Schemes

| Scheme | Purpose | Usage |
|--------|---------|-------|
| OAuth2PasswordBearer | OAuth2 tokens | Token authentication |
| OAuth2PasswordRequestForm | Login form | Username/password login |
| HTTPBasic | Basic auth | Username/password header |
| HTTPBearer | Bearer tokens | Authorization: Bearer {token} |
| APIKeyHeader | API key header | Custom header auth |
| APIKeyCookie | API key cookie | Cookie-based auth |
| APIKeyQuery | API key query | Query parameter auth |

### Testing Patterns

| Pattern | Purpose | Example |
|---------|---------|---------|
| TestClient | API testing | client = TestClient(app) |
| Dependency override | Mock dependencies | app.dependency_overrides[get_db] = mock |
| Fixtures | Test setup | @pytest.fixture def client(): ... |
| Parametrize | Multiple test cases | @pytest.mark.parametrize("input,expected", ...) |
| Async tests | Async testing | @pytest.mark.asyncio async def test(): ... |

### Database Patterns

| Pattern | Purpose | Usage |
|---------|---------|-------|
| Session dependency | DB access | Depends(get_db) |
| Connection pooling | Performance | create_engine(pool_size=10) |
| Migrations | Schema changes | Alembic migrations |
| Transactions | Data integrity | with db.begin(): ... |
| Eager loading | Optimize queries | selectinload(), joinedload() |

### Performance Optimization

| Technique | Purpose | Implementation |
|-----------|---------|----------------|
| Async operations | Non-blocking I/O | async/await |
| Connection pooling | Reuse connections | SQLAlchemy pool |
| Response caching | Reduce computation | Cache decorator |
| Compression | Reduce bandwidth | GZipMiddleware |
| Background tasks | Async processing | BackgroundTasks |
| Database indexing | Query speed | Index on columns |
| Pagination | Limit results | Query offset/limit |

### Common Packages

| Package | Purpose | Installation |
|---------|---------|--------------|
| uvicorn | ASGI server | pip install uvicorn |
| pydantic | Data validation | pip install pydantic |
| sqlalchemy | ORM | pip install sqlalchemy |
| python-jose | JWT handling | pip install python-jose |
| passlib | Password hashing | pip install passlib |
| python-multipart | File uploads | pip install python-multipart |
| aiofiles | Async files | pip install aiofiles |
| httpx | HTTP client | pip install httpx |

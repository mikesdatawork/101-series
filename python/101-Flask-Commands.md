# 101 Flask Commands

## Overview
Flask is a lightweight, flexible Python web framework that provides the essentials for building web applications without imposing rigid structure. This cheat sheet covers core Flask functionality, extensions, routing, templates, database integration, authentication, API development, testing, and deployment - everything needed to build production-ready Flask applications.

## Target Audience
- Web developers building Flask applications
- Backend engineers creating REST APIs
- Full-stack developers using Python
- DevOps engineers deploying Flask apps
- Anyone learning web development with Python

## Command Categories

### 1. Flask Application Setup (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask import Flask | Import Flask class | Application creation | from flask import Flask |
| app = Flask(__name__) | Create Flask application | App initialization | app = Flask(__name__) |
| app = Flask(__name__, instance_relative_config=True) | Create with instance folder | Config separation | app = Flask(__name__, instance_relative_config=True) |
| app = Flask(__name__, static_folder='assets') | Custom static folder | Static file customization | app = Flask(__name__, static_folder='assets') |
| app = Flask(__name__, template_folder='views') | Custom template folder | Template customization | app = Flask(__name__, template_folder='views') |
| app.run() | Run development server | Local development | app.run(debug=True, port=5000) |
| flask run | Run Flask CLI server | CLI development | flask run |
| flask run --host=0.0.0.0 | Run on all interfaces | Network accessible | flask run --host=0.0.0.0 |
| flask run --port=8000 | Run on specific port | Custom port | flask run --port=8000 |
| FLASK_APP=app.py flask run | Set app file | Environment variable | FLASK_APP=app.py flask run |

### 2. Configuration (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| app.config['KEY'] = value | Set config value | Direct configuration | app.config['DEBUG'] = True |
| app.config.from_object() | Load config from object | Object-based config | app.config.from_object('config.DevelopmentConfig') |
| app.config.from_pyfile() | Load config from file | File-based config | app.config.from_pyfile('config.py') |
| app.config.from_envvar() | Load config from env variable | Environment config | app.config.from_envvar('APP_SETTINGS') |
| app.config.from_mapping() | Load config from dict | Dictionary config | app.config.from_mapping(DEBUG=True) |
| app.config.get() | Get config value | Safe config access | debug = app.config.get('DEBUG', False) |
| SECRET_KEY | Secret key for sessions | Security configuration | app.config['SECRET_KEY'] = 'secret-key-here' |
| DEBUG | Debug mode | Development setting | app.config['DEBUG'] = True |
| TESTING | Testing mode | Test configuration | app.config['TESTING'] = True |
| ENV | Environment name | Environment setting | app.config['ENV'] = 'production' |
| SERVER_NAME | Server name | URL generation | app.config['SERVER_NAME'] = 'example.com' |
| APPLICATION_ROOT | Application root path | Sub-path deployment | app.config['APPLICATION_ROOT'] = '/myapp' |

### 3. Routing (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @app.route('/') | Define route | Basic routing | @app.route('/') def index(): return 'Home' |
| @app.route('/path', methods=['GET']) | Specify HTTP methods | Method restriction | @app.route('/api', methods=['GET', 'POST']) |
| @app.route('/user/<username>') | Dynamic route | URL parameters | @app.route('/user/<username>') def user(username): ... |
| @app.route('/post/<int:id>') | Typed route parameter | Type conversion | @app.route('/post/<int:id>') def post(id): ... |
| @app.route('/path/<float:value>') | Float parameter | Numeric parameters | @app.route('/price/<float:value>') |
| @app.route('/file/<path:filename>') | Path parameter | File paths | @app.route('/file/<path:filename>') |
| @app.route('/page', defaults={'page': 1}) | Default parameters | Optional parameters | @app.route('/page', defaults={'page': 1}) |
| @app.route('/old', redirect_to='/new') | Route redirect | URL redirects | @app.route('/old', redirect_to='/new') |
| @app.route('/api/', strict_slashes=False) | Flexible trailing slash | Slash handling | @app.route('/api/', strict_slashes=False) |
| @app.route('/page', endpoint='page_view') | Named endpoint | Custom endpoint names | @app.route('/page', endpoint='page_view') |
| @app.route('/api', subdomain='api') | Subdomain routing | Subdomain handling | @app.route('/api', subdomain='api') |
| @app.route('/docs', host='docs.example.com') | Host-based routing | Multi-domain routing | @app.route('/docs', host='docs.example.com') |

### 4. Request Handling (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask import request | Import request object | Request access | from flask import request |
| request.method | Get HTTP method | Method checking | if request.method == 'POST': ... |
| request.args | Get query parameters | URL parameters | name = request.args.get('name') |
| request.args.get('key', default) | Get query param safely | Safe parameter access | page = request.args.get('page', 1, type=int) |
| request.form | Get form data | Form handling | email = request.form.get('email') |
| request.form.get('key', default) | Get form data safely | Safe form access | username = request.form.get('username', '') |
| request.json | Get JSON data | API requests | data = request.json |
| request.get_json() | Get JSON with options | JSON parsing | data = request.get_json(force=True) |
| request.files | Get uploaded files | File uploads | file = request.files['upload'] |
| request.files.getlist('key') | Get multiple files | Multiple file uploads | files = request.files.getlist('documents') |
| request.data | Get raw request data | Raw data access | raw = request.data |
| request.values | Get combined args and form | Combined data access | value = request.values.get('key') |

### 5. Request Properties (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| request.headers | Get request headers | Header access | auth = request.headers.get('Authorization') |
| request.headers.get('key') | Get header safely | Safe header access | token = request.headers.get('X-API-Key') |
| request.cookies | Get cookies | Cookie access | session = request.cookies.get('session_id') |
| request.path | Get request path | Path inspection | path = request.path |
| request.url | Get full URL | URL inspection | url = request.url |
| request.base_url | Get base URL | URL without query | base = request.base_url |
| request.url_root | Get root URL | Domain URL | root = request.url_root |
| request.remote_addr | Get client IP address | IP tracking | ip = request.remote_addr |
| request.user_agent | Get user agent | Browser detection | ua = request.user_agent.string |
| request.referrer | Get referrer URL | Navigation tracking | ref = request.referrer |

### 6. Response Handling (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| return string | Return text response | Simple responses | return 'Hello, World!' |
| return jsonify() | Return JSON response | API responses | return jsonify({'status': 'success'}) |
| from flask import jsonify | Import JSON function | JSON responses | from flask import jsonify |
| return render_template() | Render HTML template | Template rendering | return render_template('index.html') |
| return redirect() | Redirect to URL | URL redirection | return redirect(url_for('login')) |
| from flask import make_response | Import response creator | Custom responses | from flask import make_response |
| response = make_response() | Create response object | Response customization | response = make_response(content, 200) |
| response.status_code | Set status code | HTTP status | response.status_code = 201 |
| response.headers['key'] = value | Set response header | Header modification | response.headers['X-Custom'] = 'value' |
| response.set_cookie() | Set cookie | Cookie creation | response.set_cookie('key', 'value') |
| response.delete_cookie() | Delete cookie | Cookie removal | response.delete_cookie('session') |
| return send_file() | Send file | File downloads | return send_file('report.pdf') |

### 7. Templates (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask import render_template | Import template renderer | Template rendering | from flask import render_template |
| render_template('file.html') | Render template | Basic rendering | return render_template('index.html') |
| render_template('file.html', var=value) | Pass variables | Data passing | return render_template('page.html', title='Home') |
| render_template_string() | Render string template | Dynamic templates | return render_template_string('<h1>{{ title }}</h1>', title='Hello') |
| url_for('endpoint') | Generate URL | URL generation | url = url_for('index') |
| url_for('static', filename='file') | Static file URL | Static file links | url_for('static', filename='style.css') |
| url_for('endpoint', _external=True) | Generate absolute URL | External URLs | url_for('api.user', _external=True) |
| url_for('endpoint', var=value) | URL with parameters | Dynamic URLs | url_for('user', username='john') |
| {{ variable }} | Template variable | Variable display | {{ user.name }} |
| {% if condition %} | Template conditional | Conditional rendering | {% if user.is_admin %} ... {% endif %} |

### 8. Error Handling (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask import abort | Import abort function | Error triggering | from flask import abort |
| abort(404) | Trigger HTTP error | Error responses | abort(404) |
| abort(403, description='msg') | Abort with message | Custom error messages | abort(403, description='Access denied') |
| @app.errorhandler(404) | Define error handler | Custom error pages | @app.errorhandler(404) def not_found(e): ... |
| @app.errorhandler(Exception) | Catch all exceptions | Global error handling | @app.errorhandler(Exception) def handle_error(e): ... |
| app.register_error_handler() | Register error handler | Dynamic registration | app.register_error_handler(404, handler) |
| try/except with abort | Handle errors | Error management | try: ... except: abort(500) |
| app.logger.error() | Log error | Error logging | app.logger.error('Error occurred') |
| app.logger.warning() | Log warning | Warning logging | app.logger.warning('Low memory') |
| app.logger.info() | Log info | Info logging | app.logger.info('User logged in') |

### 9. Flask-SQLAlchemy (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask_sqlalchemy import SQLAlchemy | Import extension | Database setup | from flask_sqlalchemy import SQLAlchemy |
| db = SQLAlchemy(app) | Initialize database | Database initialization | db = SQLAlchemy(app) |
| app.config['SQLALCHEMY_DATABASE_URI'] | Set database URI | Database configuration | app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.db' |
| class Model(db.Model) | Define model | Model creation | class User(db.Model): ... |
| db.Column() | Define column | Column definition | name = db.Column(db.String(80)) |
| db.Integer | Integer type | Integer columns | id = db.Column(db.Integer, primary_key=True) |
| db.String(length) | String type | String columns | email = db.Column(db.String(120), unique=True) |
| db.Text | Text type | Long text | content = db.Column(db.Text) |
| db.Boolean | Boolean type | Boolean columns | active = db.Column(db.Boolean, default=True) |
| db.DateTime | DateTime type | Date/time columns | created = db.Column(db.DateTime, default=datetime.utcnow) |
| db.ForeignKey() | Foreign key | Relationships | user_id = db.Column(db.Integer, db.ForeignKey('user.id')) |
| db.relationship() | Define relationship | Model relationships | posts = db.relationship('Post', backref='author') |

### 10. Database Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| db.create_all() | Create all tables | Database initialization | db.create_all() |
| db.drop_all() | Drop all tables | Database reset | db.drop_all() |
| db.session.add() | Add object | Object creation | db.session.add(user) |
| db.session.add_all() | Add multiple objects | Bulk creation | db.session.add_all([user1, user2]) |
| db.session.commit() | Commit transaction | Save changes | db.session.commit() |
| db.session.rollback() | Rollback transaction | Undo changes | db.session.rollback() |
| db.session.delete() | Delete object | Object deletion | db.session.delete(user) |
| db.session.flush() | Flush session | Partial commit | db.session.flush() |
| Model.query.all() | Get all records | Data retrieval | users = User.query.all() |
| Model.query.first() | Get first record | Single record | user = User.query.first() |
| Model.query.get(id) | Get by primary key | ID lookup | user = User.query.get(1) |
| Model.query.count() | Count records | Record counting | count = User.query.count() |

### 11. Querying (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| Model.query.filter() | Filter with condition | Complex filtering | User.query.filter(User.age > 18) |
| Model.query.filter_by() | Filter by keyword | Simple filtering | User.query.filter_by(username='john') |
| Model.query.filter().first() | Get first match | Filtered single | User.query.filter_by(email=email).first() |
| Model.query.filter().all() | Get all matches | Filtered list | User.query.filter(User.active == True).all() |
| Model.query.order_by() | Order results | Sorting | User.query.order_by(User.created.desc()) |
| Model.query.limit() | Limit results | Result limiting | User.query.limit(10) |
| Model.query.offset() | Skip records | Pagination | User.query.offset(20).limit(10) |
| Model.query.paginate() | Paginate results | Pagination | users = User.query.paginate(page=1, per_page=20) |
| db.or_() | OR condition | Multiple conditions | db.or_(User.role=='admin', User.role=='mod') |
| db.and_() | AND condition | Combined conditions | db.and_(User.active==True, User.verified==True) |
| Model.query.join() | Join tables | Relationship queries | User.query.join(Post) |
| Model.query.distinct() | Distinct values | Unique results | User.query.distinct(User.city) |

### 12. Flask-Login (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask_login import LoginManager | Import login manager | Authentication setup | from flask_login import LoginManager |
| login_manager = LoginManager() | Create login manager | Manager initialization | login_manager.init_app(app) |
| from flask_login import UserMixin | Import user mixin | User model | class User(UserMixin, db.Model): ... |
| @login_manager.user_loader | Define user loader | User loading | @login_manager.user_loader def load_user(id): ... |
| from flask_login import login_user | Import login function | User login | from flask_login import login_user |
| login_user(user) | Log in user | Authentication | login_user(user, remember=True) |
| from flask_login import logout_user | Import logout function | User logout | from flask_login import logout_user |
| logout_user() | Log out user | Session termination | logout_user() |
| from flask_login import login_required | Import decorator | Route protection | from flask_login import login_required |
| @login_required | Protect route | Authentication required | @login_required def profile(): ... |

### 13. Flask-Login User Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask_login import current_user | Import current user | User access | from flask_login import current_user |
| current_user.is_authenticated | Check if logged in | Authentication check | if current_user.is_authenticated: ... |
| current_user.is_active | Check if active | Active status | if current_user.is_active: ... |
| current_user.is_anonymous | Check if anonymous | Anonymous check | if current_user.is_anonymous: ... |
| current_user.get_id() | Get user ID | ID retrieval | user_id = current_user.get_id() |
| login_manager.login_view | Set login route | Login redirect | login_manager.login_view = 'login' |
| login_manager.login_message | Set login message | Flash message | login_manager.login_message = 'Please log in' |
| fresh_login_required | Require fresh login | Security enhancement | @fresh_login_required def change_password(): ... |

### 14. Session Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask import session | Import session | Session access | from flask import session |
| session['key'] = value | Set session value | Session storage | session['user_id'] = user.id |
| session.get('key') | Get session value | Session retrieval | user_id = session.get('user_id') |
| session.get('key', default) | Get with default | Safe retrieval | count = session.get('count', 0) |
| session.pop('key') | Remove session key | Session cleanup | session.pop('user_id', None) |
| session.clear() | Clear all session | Full cleanup | session.clear() |
| session.modified = True | Mark session modified | Force save | session.modified = True |
| session.permanent | Set permanent session | Long-lived session | session.permanent = True |

### 15. Blueprints (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from flask import Blueprint | Import Blueprint | Modular apps | from flask import Blueprint |
| bp = Blueprint('name', __name__) | Create blueprint | Blueprint creation | auth_bp = Blueprint('auth', __name__) |
| @bp.route() | Define blueprint route | Blueprint routing | @auth_bp.route('/login') |
| app.register_blueprint() | Register blueprint | Blueprint registration | app.register_blueprint(auth_bp) |
| app.register_blueprint(bp, url_prefix) | Register with prefix | URL prefixing | app.register_blueprint(api_bp, url_prefix='/api') |
| bp.before_request | Blueprint before request | Blueprint hooks | @bp.before_request def before(): ... |
| bp.after_request | Blueprint after request | Response processing | @bp.after_request def after(response): ... |
| bp.errorhandler() | Blueprint error handler | Blueprint errors | @bp.errorhandler(404) def not_found(e): ... |
| bp.app_context_processor | Context processor | Template context | @bp.app_context_processor def inject(): ... |
| url_for('bp.endpoint') | Blueprint URL | Blueprint URLs | url_for('auth.login') |

### 16. Application Context (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| with app.app_context() | Application context | Context management | with app.app_context(): db.create_all() |
| app.app_context().push() | Push app context | Manual context | ctx = app.app_context(); ctx.push() |
| app.app_context().pop() | Pop app context | Context cleanup | ctx.pop() |
| from flask import g | Import g object | Request globals | from flask import g |
| g.variable = value | Store in g | Request-scoped storage | g.user = current_user |
| @app.before_request | Before request hook | Request preprocessing | @app.before_request def before(): ... |
| @app.after_request | After request hook | Response processing | @app.after_request def after(response): ... |
| @app.teardown_request | Teardown hook | Cleanup | @app.teardown_request def teardown(exception): ... |

### 17. Flask CLI (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| flask shell | Open Flask shell | Interactive shell | flask shell |
| @app.cli.command() | Define CLI command | Custom commands | @app.cli.command() def initdb(): ... |
| flask command | Run custom command | Command execution | flask initdb |
| click.echo() | Print to console | CLI output | click.echo('Done!') |
| click.argument() | Define argument | CLI arguments | @click.argument('name') |
| click.option() | Define option | CLI options | @click.option('--count', default=1) |
| flask routes | List all routes | Route inspection | flask routes |
| FLASK_ENV=development | Set environment | Environment configuration | FLASK_ENV=development flask run |
| FLASK_DEBUG=1 | Enable debug mode | Debug activation | FLASK_DEBUG=1 flask run |
| flask --help | Show help | Command help | flask --help |

## Tips and Best Practices
* Use blueprints to organize large applications
* Always use environment variables for sensitive configuration
* Implement proper error handling with custom error pages
* Use Flask-SQLAlchemy for database operations
* Enable CSRF protection for forms
* Use Flask-Login for authentication
* Implement rate limiting for APIs
* Use application factory pattern for testing
* Keep business logic out of routes
* Use context processors for common template variables
* Validate all user input
* Use migrations for database schema changes
* Implement proper logging
* Use environment-specific configuration
* Follow REST conventions for APIs

## Additional Resources
* [Flask Documentation](https://flask.palletsprojects.com/)
* [Flask Mega-Tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world)
* [Flask-SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/)
* [Flask-Login](https://flask-login.readthedocs.io/)
* [Flask Patterns](https://flask.palletsprojects.com/patterns/)
* [Real Python Flask Tutorials](https://realpython.com/tutorials/flask/)
* [Flask Extensions](https://flask.palletsprojects.com/extensions/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Flask development.

### Common Terms

| Term | Description |
|------|-------------|
| WSGI | Web Server Gateway Interface - Python web standard |
| Werkzeug | WSGI utility library used by Flask |
| Jinja2 | Template engine used by Flask |
| Blueprint | Modular component for organizing Flask apps |
| Application Context | Context holding app-level data |
| Request Context | Context holding request-level data |
| View Function | Function that handles a route |
| Endpoint | Internal name for a route |
| URL Rule | Mapping between URL and view function |
| Extension | Third-party Flask plugin |

### Flask Configuration

| Setting | Purpose | Example Value |
|---------|---------|---------------|
| DEBUG | Debug mode | True, False |
| TESTING | Testing mode | True, False |
| SECRET_KEY | Session encryption | random secret string |
| SQLALCHEMY_DATABASE_URI | Database connection | sqlite:///app.db |
| SQLALCHEMY_TRACK_MODIFICATIONS | SQLAlchemy tracking | False |
| SESSION_COOKIE_NAME | Cookie name | session |
| PERMANENT_SESSION_LIFETIME | Session duration | timedelta(days=7) |
| MAX_CONTENT_LENGTH | Max upload size | 16 * 1024 * 1024 |

### HTTP Methods

| Method | Purpose | Flask Route |
|--------|---------|-------------|
| GET | Retrieve resource | @app.route('/users', methods=['GET']) |
| POST | Create resource | @app.route('/users', methods=['POST']) |
| PUT | Update resource | @app.route('/users/<id>', methods=['PUT']) |
| DELETE | Delete resource | @app.route('/users/<id>', methods=['DELETE']) |
| PATCH | Partial update | @app.route('/users/<id>', methods=['PATCH']) |
| HEAD | Get headers only | @app.route('/users', methods=['HEAD']) |
| OPTIONS | Get allowed methods | @app.route('/users', methods=['OPTIONS']) |

### Common Status Codes

| Code | Meaning | Usage |
|------|---------|-------|
| 200 | OK | Successful request |
| 201 | Created | Resource created |
| 204 | No Content | Successful with no response |
| 400 | Bad Request | Invalid request |
| 401 | Unauthorized | Authentication required |
| 403 | Forbidden | Access denied |
| 404 | Not Found | Resource not found |
| 500 | Server Error | Internal error |

### Flask Extensions

| Extension | Purpose | Installation |
|-----------|---------|--------------|
| Flask-SQLAlchemy | Database ORM | pip install flask-sqlalchemy |
| Flask-Login | User authentication | pip install flask-login |
| Flask-WTF | Form handling | pip install flask-wtf |
| Flask-Mail | Email sending | pip install flask-mail |
| Flask-Migrate | Database migrations | pip install flask-migrate |
| Flask-CORS | CORS handling | pip install flask-cors |
| Flask-RESTful | REST API building | pip install flask-restful |
| Flask-JWT-Extended | JWT authentication | pip install flask-jwt-extended |

### URL Converters

| Converter | Matches | Example |
|-----------|---------|---------|
| string | Text without slashes | /user/<username> |
| int | Integers | /post/<int:id> |
| float | Floating point | /price/<float:amount> |
| path | Text with slashes | /file/<path:filename> |
| uuid | UUID strings | /item/<uuid:id> |

### Template Filters

| Filter | Purpose | Example |
|--------|---------|---------|
| {{ var \| safe }} | Disable escaping | {{ html_content \| safe }} |
| {{ var \| length }} | Get length | {{ items \| length }} |
| {{ var \| upper }} | Uppercase | {{ name \| upper }} |
| {{ var \| lower }} | Lowercase | {{ NAME \| lower }} |
| {{ var \| title }} | Title case | {{ name \| title }} |
| {{ var \| default() }} | Default value | {{ var \| default('N/A') }} |

### Common Patterns

| Pattern | Usage | Example |
|---------|-------|---------|
| Application Factory | Creating app in function | def create_app(): app = Flask(__name__) |
| Blueprint Registration | Modular organization | app.register_blueprint(bp) |
| Error Handlers | Custom error pages | @app.errorhandler(404) |
| Context Processors | Inject template vars | @app.context_processor |
| Before/After Request | Request hooks | @app.before_request |
| Template Inheritance | Reusable templates | {% extends "base.html" %} |
| Flash Messages | User feedback | flash('Success!') |

### SQLAlchemy Relationships

| Type | Definition | Example |
|------|------------|---------|
| One-to-Many | ForeignKey + relationship | user_id = db.Column(db.ForeignKey('user.id')) |
| Many-to-One | ForeignKey on many side | author = db.relationship('User') |
| One-to-One | ForeignKey + uselist=False | profile = db.relationship('Profile', uselist=False) |
| Many-to-Many | Association table | tags = db.relationship('Tag', secondary=post_tags) |

### Testing Patterns

| Pattern | Purpose | Example |
|---------|---------|---------|
| Test Client | Simulate requests | client = app.test_client() |
| Test Context | Application context | with app.app_context(): ... |
| Fixtures | Test data | @pytest.fixture def client(): ... |
| Mocking | Isolate tests | with mock.patch('module.func'): ... |

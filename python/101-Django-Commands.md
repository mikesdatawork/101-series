# 101 Django Commands

## Overview
Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design. This cheat sheet covers essential Django commands including project setup, models, views, URLs, templates, forms, authentication, admin interface, testing, and deployment - everything needed to build robust, scalable web applications.

## Target Audience
- Web developers building Django applications
- Backend engineers creating web services
- Full-stack developers using Python
- DevOps engineers deploying Django apps
- Anyone learning web development with Django

## Command Categories

### 1. Project and App Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| django-admin startproject | Create new project | Project initialization | django-admin startproject myproject |
| django-admin startproject name . | Create project in current dir | In-place creation | django-admin startproject config . |
| python manage.py startapp | Create new app | App creation | python manage.py startapp blog |
| python manage.py runserver | Start development server | Local development | python manage.py runserver |
| python manage.py runserver 8080 | Run on specific port | Custom port | python manage.py runserver 8080 |
| python manage.py runserver 0.0.0.0:8000 | Run on all interfaces | Network access | python manage.py runserver 0.0.0.0:8000 |
| python manage.py shell | Open Django shell | Interactive Python | python manage.py shell |
| python manage.py dbshell | Open database shell | Database access | python manage.py dbshell |
| python manage.py check | Check for problems | Project validation | python manage.py check |
| python manage.py showmigrations | Show migrations | Migration status | python manage.py showmigrations |
| python manage.py diffsettings | Show settings differences | Config inspection | python manage.py diffsettings |
| python manage.py version | Show Django version | Version check | python manage.py version |

### 2. Database Migrations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| python manage.py makemigrations | Create migrations | Schema changes | python manage.py makemigrations |
| python manage.py makemigrations app | Create app migrations | App-specific migrations | python manage.py makemigrations blog |
| python manage.py makemigrations --name | Named migration | Descriptive migrations | python manage.py makemigrations --name add_user_profile |
| python manage.py migrate | Apply migrations | Database updates | python manage.py migrate |
| python manage.py migrate app | Migrate specific app | App migration | python manage.py migrate blog |
| python manage.py migrate app migration | Migrate to specific | Target migration | python manage.py migrate blog 0003 |
| python manage.py migrate --fake | Fake migration | Skip actual changes | python manage.py migrate --fake |
| python manage.py migrate --fake-initial | Fake initial | Existing tables | python manage.py migrate --fake-initial |
| python manage.py sqlmigrate | Show migration SQL | SQL inspection | python manage.py sqlmigrate blog 0001 |
| python manage.py squashmigrations | Squash migrations | Migration consolidation | python manage.py squashmigrations blog 0001 0004 |
| python manage.py migrate app zero | Unapply all migrations | Migration reversal | python manage.py migrate blog zero |
| python manage.py migrate --run-syncdb | Create tables without migrations | Legacy sync | python manage.py migrate --run-syncdb |

### 3. Models and Fields (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from django.db import models | Import models | Model creation | from django.db import models |
| class Model(models.Model) | Define model | Model definition | class Article(models.Model): ... |
| models.CharField() | Character field | String fields | title = models.CharField(max_length=200) |
| models.TextField() | Text field | Long text | content = models.TextField() |
| models.IntegerField() | Integer field | Numeric fields | views = models.IntegerField(default=0) |
| models.FloatField() | Float field | Decimal numbers | price = models.FloatField() |
| models.DecimalField() | Decimal field | Precise decimals | amount = models.DecimalField(max_digits=10, decimal_places=2) |
| models.BooleanField() | Boolean field | True/False | active = models.BooleanField(default=True) |
| models.DateField() | Date field | Dates only | birth_date = models.DateField() |
| models.DateTimeField() | DateTime field | Timestamps | created = models.DateTimeField(auto_now_add=True) |
| models.EmailField() | Email field | Email addresses | email = models.EmailField(unique=True) |
| models.URLField() | URL field | URLs | website = models.URLField(blank=True) |

### 4. Model Relationships (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| models.ForeignKey() | Foreign key relation | One-to-many | author = models.ForeignKey(User, on_delete=models.CASCADE) |
| models.OneToOneField() | One-to-one relation | One-to-one | profile = models.OneToOneField(User, on_delete=models.CASCADE) |
| models.ManyToManyField() | Many-to-many relation | Many-to-many | tags = models.ManyToManyField(Tag) |
| on_delete=models.CASCADE | Cascade delete | Delete behavior | on_delete=models.CASCADE |
| on_delete=models.PROTECT | Protect from delete | Prevent deletion | on_delete=models.PROTECT |
| on_delete=models.SET_NULL | Set to null | Null on delete | on_delete=models.SET_NULL, null=True |
| on_delete=models.SET_DEFAULT | Set to default | Default on delete | on_delete=models.SET_DEFAULT, default=0 |
| related_name | Reverse relation name | Reverse access | author = models.ForeignKey(User, related_name='posts') |
| through | Intermediary model | Custom through table | members = models.ManyToManyField(User, through='Membership') |
| symmetrical=False | Asymmetric relation | Non-symmetric M2M | friends = models.ManyToManyField('self', symmetrical=False) |

### 5. Model Meta Options (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| class Meta | Meta options | Model configuration | class Meta: ordering = ['-created'] |
| ordering | Default ordering | Sort order | ordering = ['-created', 'title'] |
| verbose_name | Singular name | Admin display | verbose_name = 'Article' |
| verbose_name_plural | Plural name | Admin display | verbose_name_plural = 'Articles' |
| db_table | Custom table name | Table naming | db_table = 'blog_posts' |
| unique_together | Unique constraint | Compound uniqueness | unique_together = [['user', 'email']] |
| indexes | Database indexes | Performance | indexes = [models.Index(fields=['title'])] |
| abstract = True | Abstract model | Base classes | abstract = True |
| proxy = True | Proxy model | Alternative interface | proxy = True |
| permissions | Custom permissions | Authorization | permissions = [('can_publish', 'Can publish')] |

### 6. QuerySet Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| Model.objects.all() | Get all records | Data retrieval | articles = Article.objects.all() |
| Model.objects.filter() | Filter records | Conditional queries | Article.objects.filter(status='published') |
| Model.objects.exclude() | Exclude records | Inverse filtering | Article.objects.exclude(status='draft') |
| Model.objects.get() | Get single record | Single record | article = Article.objects.get(id=1) |
| Model.objects.first() | Get first record | First result | first = Article.objects.first() |
| Model.objects.last() | Get last record | Last result | last = Article.objects.last() |
| Model.objects.count() | Count records | Record counting | count = Article.objects.count() |
| Model.objects.exists() | Check existence | Existence check | exists = Article.objects.filter(slug=slug).exists() |
| Model.objects.create() | Create record | Object creation | article = Article.objects.create(title='New') |
| Model.objects.update() | Update records | Bulk update | Article.objects.filter(status='draft').update(status='review') |
| Model.objects.delete() | Delete records | Bulk deletion | Article.objects.filter(old=True).delete() |
| Model.objects.get_or_create() | Get or create | Upsert operation | article, created = Article.objects.get_or_create(slug=slug) |

### 7. QuerySet Methods (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| queryset.order_by() | Order results | Sorting | Article.objects.all().order_by('-created') |
| queryset.reverse() | Reverse order | Order reversal | Article.objects.all().order_by('title').reverse() |
| queryset.distinct() | Get distinct values | Remove duplicates | Article.objects.values('author').distinct() |
| queryset.values() | Get dictionaries | Dictionary format | Article.objects.values('id', 'title') |
| queryset.values_list() | Get tuples | Tuple format | Article.objects.values_list('id', 'title') |
| queryset.values_list(flat=True) | Get flat list | Single field list | Article.objects.values_list('title', flat=True) |
| queryset.only() | Load specific fields | Field selection | Article.objects.only('title', 'slug') |
| queryset.defer() | Defer fields | Exclude fields | Article.objects.defer('content') |
| queryset.select_related() | Eager load FK | Join optimization | Article.objects.select_related('author') |
| queryset.prefetch_related() | Eager load M2M | M2M optimization | Article.objects.prefetch_related('tags') |
| queryset.annotate() | Add annotation | Aggregation | Article.objects.annotate(comment_count=Count('comments')) |
| queryset.aggregate() | Calculate aggregate | Summary stats | Article.objects.aggregate(Avg('views')) |

### 8. Query Lookups (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| field__exact | Exact match | Exact equality | Article.objects.filter(status__exact='published') |
| field__iexact | Case-insensitive exact | Case-insensitive match | User.objects.filter(username__iexact='john') |
| field__contains | Contains substring | Substring search | Article.objects.filter(title__contains='Django') |
| field__icontains | Case-insensitive contains | Case-insensitive search | Article.objects.filter(title__icontains='django') |
| field__startswith | Starts with | Prefix search | Article.objects.filter(slug__startswith='intro') |
| field__endswith | Ends with | Suffix search | Article.objects.filter(slug__endswith='guide') |
| field__gt | Greater than | Comparison | Article.objects.filter(views__gt=100) |
| field__gte | Greater than or equal | Comparison | Article.objects.filter(views__gte=100) |
| field__lt | Less than | Comparison | Article.objects.filter(views__lt=100) |
| field__lte | Less than or equal | Comparison | Article.objects.filter(views__lte=100) |
| field__in | In list | List membership | Article.objects.filter(status__in=['draft', 'review']) |
| field__range | In range | Range queries | Article.objects.filter(created__range=[start, end]) |

### 9. Views (Function-Based) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from django.shortcuts import render | Import render | Template rendering | from django.shortcuts import render |
| def view(request) | Define view function | View creation | def index(request): return render(request, 'index.html') |
| render(request, template, context) | Render template | Template response | return render(request, 'home.html', {'title': 'Home'}) |
| from django.shortcuts import redirect | Import redirect | URL redirection | from django.shortcuts import redirect |
| redirect('view-name') | Redirect to view | Named redirect | return redirect('home') |
| redirect('view-name', arg) | Redirect with args | Parametric redirect | return redirect('post-detail', slug=slug) |
| from django.shortcuts import get_object_or_404 | Import get or 404 | Safe object retrieval | from django.shortcuts import get_object_or_404 |
| get_object_or_404(Model, **kwargs) | Get or 404 | Error handling | article = get_object_or_404(Article, slug=slug) |
| from django.http import JsonResponse | Import JSON response | JSON responses | from django.http import JsonResponse |
| JsonResponse(dict) | Return JSON | API responses | return JsonResponse({'status': 'success'}) |

### 10. Views (Class-Based) (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from django.views import View | Import base view | Class views | from django.views import View |
| class MyView(View) | Define class view | View definition | class ArticleView(View): ... |
| def get(self, request) | Handle GET | GET requests | def get(self, request): return render(...) |
| def post(self, request) | Handle POST | POST requests | def post(self, request): return redirect(...) |
| from django.views.generic import ListView | Import list view | List display | from django.views.generic import ListView |
| from django.views.generic import DetailView | Import detail view | Detail display | from django.views.generic import DetailView |
| from django.views.generic import CreateView | Import create view | Object creation | from django.views.generic import CreateView |
| from django.views.generic import UpdateView | Import update view | Object updating | from django.views.generic import UpdateView |
| from django.views.generic import DeleteView | Import delete view | Object deletion | from django.views.generic import DeleteView |
| model = Model | Set model | View model | model = Article |
| template_name | Set template | Template path | template_name = 'blog/article_list.html' |
| context_object_name | Set context name | Context naming | context_object_name = 'articles' |

### 11. URLs (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from django.urls import path | Import path | URL routing | from django.urls import path |
| urlpatterns = [] | Define URL patterns | URL configuration | urlpatterns = [path('', views.index)] |
| path('route/', view) | Map URL to view | Basic routing | path('about/', views.about, name='about') |
| path('post/<int:id>/', view) | URL with parameter | Dynamic URLs | path('post/<int:id>/', views.post_detail) |
| path('<slug:slug>/', view) | Slug parameter | Slug routing | path('<slug:slug>/', views.article) |
| path('api/', include()) | Include app URLs | URL organization | path('api/', include('api.urls')) |
| from django.urls import include | Import include | URL including | from django.urls import include |
| from django.urls import re_path | Import regex path | Regex routing | from django.urls import re_path |
| re_path(r'^pattern/', view) | Regex URL | Complex patterns | re_path(r'^archive/(?P<year>[0-9]{4})/', views.archive) |
| name='view-name' | Name URL pattern | URL naming | path('login/', views.login, name='login') |

### 12. Templates (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| {% extends 'base.html' %} | Template inheritance | Base template | {% extends 'base.html' %} |
| {% block name %} | Define block | Content blocks | {% block content %}...{% endblock %} |
| {% include 'partial.html' %} | Include template | Template inclusion | {% include 'navbar.html' %} |
| {{ variable }} | Output variable | Variable display | {{ article.title }} |
| {{ variable \| filter }} | Apply filter | Data formatting | {{ article.created \| date:'Y-m-d' }} |
| {% for item in items %} | For loop | Iteration | {% for article in articles %}...{% endfor %} |
| {% if condition %} | Conditional | Conditional rendering | {% if user.is_authenticated %}...{% endif %} |
| {% url 'view-name' %} | Generate URL | URL generation | <a href="{% url 'home' %}">Home</a> |
| {% url 'view-name' arg %} | URL with arguments | Dynamic URLs | {% url 'post' slug=article.slug %} |
| {% static 'file' %} | Static file URL | Static files | <img src="{% static 'img/logo.png' %}"> |

### 13. Forms (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from django import forms | Import forms | Form creation | from django import forms |
| class MyForm(forms.Form) | Define form | Form definition | class ContactForm(forms.Form): ... |
| forms.CharField() | Character field | Text input | name = forms.CharField(max_length=100) |
| forms.EmailField() | Email field | Email input | email = forms.EmailField() |
| forms.IntegerField() | Integer field | Number input | age = forms.IntegerField() |
| forms.BooleanField() | Boolean field | Checkbox | agree = forms.BooleanField(required=True) |
| forms.ChoiceField() | Choice field | Dropdown | status = forms.ChoiceField(choices=CHOICES) |
| forms.ModelForm | Model-based form | Model forms | class ArticleForm(forms.ModelForm): ... |
| class Meta | Form meta | Form configuration | class Meta: model = Article; fields = '__all__' |
| form.is_valid() | Validate form | Form validation | if form.is_valid(): ... |
| form.cleaned_data | Get clean data | Data access | title = form.cleaned_data['title'] |
| form.save() | Save model form | Database save | article = form.save() |

### 14. Admin (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| python manage.py createsuperuser | Create admin user | Admin setup | python manage.py createsuperuser |
| from django.contrib import admin | Import admin | Admin registration | from django.contrib import admin |
| admin.site.register(Model) | Register model | Admin registration | admin.site.register(Article) |
| @admin.register(Model) | Register with decorator | Decorator registration | @admin.register(Article) class ArticleAdmin: ... |
| class ModelAdmin(admin.ModelAdmin) | Define admin class | Admin customization | class ArticleAdmin(admin.ModelAdmin): ... |
| list_display | Set list columns | Column display | list_display = ['title', 'author', 'created'] |
| list_filter | Add filters | Sidebar filters | list_filter = ['status', 'created'] |
| search_fields | Add search | Search functionality | search_fields = ['title', 'content'] |
| ordering | Set default order | Result ordering | ordering = ['-created'] |
| readonly_fields | Read-only fields | Field protection | readonly_fields = ['created', 'modified'] |

### 15. Authentication (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from django.contrib.auth.models import User | Import User model | User management | from django.contrib.auth.models import User |
| User.objects.create_user() | Create user | User creation | user = User.objects.create_user('john', 'john@example.com', 'password') |
| user.set_password() | Set password | Password update | user.set_password('newpassword') |
| user.check_password() | Verify password | Password verification | user.check_password('password') |
| from django.contrib.auth import authenticate | Import authenticate | Authentication | from django.contrib.auth import authenticate |
| authenticate(username, password) | Authenticate user | Login validation | user = authenticate(username='john', password='secret') |
| from django.contrib.auth import login | Import login | User login | from django.contrib.auth import login |
| login(request, user) | Log in user | Session creation | login(request, user) |
| from django.contrib.auth import logout | Import logout | User logout | from django.contrib.auth import logout |
| logout(request) | Log out user | Session termination | logout(request) |
| from django.contrib.auth.decorators import login_required | Import decorator | Route protection | from django.contrib.auth.decorators import login_required |
| @login_required | Protect view | Authentication required | @login_required def profile(request): ... |

### 16. Static and Media Files (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| python manage.py collectstatic | Collect static files | Static deployment | python manage.py collectstatic |
| STATIC_URL | Static files URL | URL configuration | STATIC_URL = '/static/' |
| STATIC_ROOT | Static files directory | Deployment directory | STATIC_ROOT = BASE_DIR / 'staticfiles' |
| STATICFILES_DIRS | Additional static dirs | Development directories | STATICFILES_DIRS = [BASE_DIR / 'static'] |
| MEDIA_URL | Media files URL | Upload URL | MEDIA_URL = '/media/' |
| MEDIA_ROOT | Media files directory | Upload directory | MEDIA_ROOT = BASE_DIR / 'media' |
| {% load static %} | Load static tag | Template static | {% load static %} |
| models.ImageField() | Image field | Image uploads | photo = models.ImageField(upload_to='photos/') |

### 17. Testing (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| python manage.py test | Run all tests | Test execution | python manage.py test |
| python manage.py test app | Test specific app | App testing | python manage.py test blog |
| python manage.py test app.tests.TestClass | Test specific class | Class testing | python manage.py test blog.tests.ArticleTestCase |
| from django.test import TestCase | Import test case | Test creation | from django.test import TestCase |
| class MyTest(TestCase) | Define test class | Test definition | class ArticleTest(TestCase): ... |
| def test_method(self) | Define test method | Test method | def test_create_article(self): ... |
| self.assertEqual() | Assert equality | Assertions | self.assertEqual(article.title, 'Test') |
| self.assertTrue() | Assert true | Boolean testing | self.assertTrue(article.published) |
| self.client.get() | Test GET request | Request testing | response = self.client.get('/') |
| self.client.post() | Test POST request | POST testing | response = self.client.post('/login/', data) |

## Tips and Best Practices
* Use Django's built-in User model or extend it properly
* Always use migrations for schema changes
* Leverage Django admin for quick CRUD interfaces
* Use select_related and prefetch_related to optimize queries
* Implement proper error handling with try/except
* Use Django's form validation system
* Keep business logic in models, not views
* Use class-based views for common patterns
* Implement proper URL naming for maintainability
* Use Django's template inheritance effectively
* Enable CSRF protection for forms
* Use Django's built-in authentication system
* Implement proper logging
* Use Django's caching framework for performance
* Write tests for critical functionality

## Additional Resources
* [Django Documentation](https://docs.djangoproject.com/)
* [Django Tutorial](https://docs.djangoproject.com/en/stable/intro/tutorial01/)
* [Django Best Practices](https://django-best-practices.readthedocs.io/)
* [Two Scoops of Django](https://www.feldroy.com/books/two-scoops-of-django-3-x)
* [Django for APIs](https://djangoforapis.com/)
* [Classy Class-Based Views](https://ccbv.co.uk/)
* [Django Packages](https://djangopackages.org/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Django development.

### Common Terms

| Term | Description |
|------|-------------|
| MVT | Model-View-Template - Django's architecture pattern |
| ORM | Object-Relational Mapping - Database abstraction |
| QuerySet | Database query result set |
| Migration | Database schema change file |
| App | Modular Django component |
| Project | Django site container |
| Middleware | Request/response processing layer |
| Context | Data passed to templates |
| Signal | Event notification system |
| Manager | Database query interface |

### Django Settings

| Setting | Purpose | Example Value |
|---------|---------|---------------|
| DEBUG | Debug mode | True, False |
| ALLOWED_HOSTS | Permitted hosts | ['example.com', 'localhost'] |
| INSTALLED_APPS | Active apps | ['django.contrib.admin', 'myapp'] |
| DATABASES | Database config | {'default': {'ENGINE': 'django.db.backends.postgresql'}} |
| SECRET_KEY | Security key | Random secret string |
| MIDDLEWARE | Middleware stack | ['django.middleware.security.SecurityMiddleware'] |
| TEMPLATES | Template config | [{'BACKEND': 'django.template.backends.django.DjangoTemplates'}] |
| STATIC_URL | Static files URL | '/static/' |

### Model Field Types

| Field Type | Purpose | Example |
|------------|---------|---------|
| CharField | Short text | CharField(max_length=200) |
| TextField | Long text | TextField() |
| IntegerField | Integers | IntegerField() |
| DecimalField | Precise decimals | DecimalField(max_digits=10, decimal_places=2) |
| BooleanField | True/False | BooleanField(default=True) |
| DateField | Dates | DateField() |
| DateTimeField | Timestamps | DateTimeField(auto_now_add=True) |
| EmailField | Email addresses | EmailField() |

### QuerySet Methods

| Method | Purpose | Returns |
|--------|---------|---------|
| all() | All records | QuerySet |
| filter() | Filtered records | QuerySet |
| exclude() | Excluded records | QuerySet |
| get() | Single record | Model instance |
| first() | First record | Model instance or None |
| last() | Last record | Model instance or None |
| count() | Record count | Integer |
| exists() | Check existence | Boolean |

### Generic Views

| View | Purpose | Common Usage |
|------|---------|--------------|
| ListView | Display list | Article list |
| DetailView | Display detail | Article detail |
| CreateView | Create object | New article |
| UpdateView | Update object | Edit article |
| DeleteView | Delete object | Delete article |
| FormView | Handle form | Contact form |
| TemplateView | Static template | About page |
| RedirectView | Redirect | URL redirect |

### URL Patterns

| Pattern | Matches | Example |
|---------|---------|---------|
| path('about/') | Exact match | /about/ |
| path('post/<int:id>/') | Integer param | /post/123/ |
| path('article/<slug:slug>/') | Slug param | /article/my-post/ |
| path('<str:username>/') | String param | /john/ |
| path('<path:filename>/') | Path param | /files/docs/guide.pdf |
| path('<uuid:id>/') | UUID param | /550e8400-e29b-41d4-a716-446655440000/ |

### Template Tags

| Tag | Purpose | Example |
|-----|---------|---------|
| {% extends %} | Template inheritance | {% extends 'base.html' %} |
| {% block %} | Content block | {% block content %}...{% endblock %} |
| {% include %} | Include template | {% include 'nav.html' %} |
| {% for %} | Loop | {% for item in items %}...{% endfor %} |
| {% if %} | Conditional | {% if user.is_authenticated %}...{% endif %} |
| {% url %} | URL generation | {% url 'home' %} |
| {% static %} | Static file URL | {% static 'css/style.css' %} |
| {% csrf_token %} | CSRF protection | {% csrf_token %} |

### Template Filters

| Filter | Purpose | Example |
|--------|---------|---------|
| {{ var \| date }} | Date formatting | {{ article.created \| date:'Y-m-d' }} |
| {{ var \| time }} | Time formatting | {{ article.created \| time:'H:i' }} |
| {{ var \| truncatewords }} | Truncate text | {{ article.content \| truncatewords:50 }} |
| {{ var \| length }} | Get length | {{ articles \| length }} |
| {{ var \| default }} | Default value | {{ title \| default:'Untitled' }} |
| {{ var \| lower }} | Lowercase | {{ name \| lower }} |
| {{ var \| upper }} | Uppercase | {{ name \| upper }} |
| {{ var \| title }} | Title case | {{ name \| title }} |

### Common Management Commands

| Command | Purpose | Usage |
|---------|---------|-------|
| runserver | Start dev server | Development |
| makemigrations | Create migrations | Schema changes |
| migrate | Apply migrations | Database updates |
| createsuperuser | Create admin | Admin setup |
| shell | Django shell | Interactive testing |
| test | Run tests | Testing |
| collectstatic | Collect static files | Deployment |
| dumpdata | Export data | Backup |
| loaddata | Import data | Restore |

### HTTP Status Codes

| Code | Meaning | Django Usage |
|------|---------|--------------|
| 200 | OK | Successful response |
| 201 | Created | Object created |
| 204 | No Content | Successful delete |
| 301 | Moved Permanently | Permanent redirect |
| 302 | Found | Temporary redirect |
| 400 | Bad Request | Invalid input |
| 401 | Unauthorized | Authentication required |
| 403 | Forbidden | Permission denied |
| 404 | Not Found | Object not found |
| 500 | Server Error | Application error |

### Django Packages

| Package | Purpose | Installation |
|---------|---------|--------------|
| django-debug-toolbar | Debugging | pip install django-debug-toolbar |
| djangorestframework | REST APIs | pip install djangorestframework |
| django-extensions | Utilities | pip install django-extensions |
| django-crispy-forms | Form styling | pip install django-crispy-forms |
| django-filter | Filtering | pip install django-filter |
| django-cors-headers | CORS | pip install django-cors-headers |
| celery | Task queue | pip install celery |
| pillow | Image handling | pip install pillow |

### Testing Assertions

| Assertion | Purpose | Example |
|-----------|---------|---------|
| assertEqual() | Equal values | self.assertEqual(a, b) |
| assertNotEqual() | Not equal | self.assertNotEqual(a, b) |
| assertTrue() | True value | self.assertTrue(condition) |
| assertFalse() | False value | self.assertFalse(condition) |
| assertContains() | Response contains | self.assertContains(response, 'text') |
| assertRedirects() | Redirects to | self.assertRedirects(response, '/home/') |
| assertTemplateUsed() | Template used | self.assertTemplateUsed(response, 'home.html') |

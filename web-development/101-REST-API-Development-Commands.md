# 101 REST API Development Commands

## Overview
REST (Representational State Transfer) is an architectural style for designing networked applications. This cheat sheet covers essential REST API concepts including HTTP methods, status codes, URL design patterns, authentication strategies, versioning approaches, error handling, security best practices, and API documentation standards. These principles apply across all programming languages and frameworks.

## Target Audience
- API developers and architects
- Backend engineers building web services
- Full-stack developers integrating APIs
- DevOps engineers managing API infrastructure
- Anyone designing or consuming REST APIs

## Command Categories

### 1. REST Principles (10)

| Concept | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| Client-Server | Separation of concerns | Independent evolution | Client handles UI, server handles data |
| Stateless | No session state on server | Scalability | Each request contains all needed info |
| Cacheable | Responses marked as cacheable | Performance | Cache-Control headers |
| Uniform Interface | Consistent API design | Predictability | Standard HTTP methods and status codes |
| Layered System | Intermediary layers allowed | Security, caching | Load balancers, proxies, gateways |
| Resource-Based | URLs represent resources | Clear semantics | /users, /products, /orders |
| Representation | Resources have multiple formats | Content negotiation | JSON, XML, HTML |
| Hypermedia | Links in responses | Discoverability | HATEOAS links |
| Idempotent Operations | Same result on repeat | Safety | GET, PUT, DELETE are idempotent |
| Safe Operations | No side effects | Read-only | GET, HEAD, OPTIONS are safe |

### 2. HTTP Methods (10)

| Method | Purpose | Idempotent | Safe | Examples |
|--------|---------|------------|------|----------|
| GET | Retrieve resource | Yes | Yes | GET /users/123 |
| POST | Create resource | No | No | POST /users |
| PUT | Update/replace resource | Yes | No | PUT /users/123 |
| PATCH | Partial update | No | No | PATCH /users/123 |
| DELETE | Remove resource | Yes | No | DELETE /users/123 |
| HEAD | Get headers only | Yes | Yes | HEAD /users/123 |
| OPTIONS | Get allowed methods | Yes | Yes | OPTIONS /users |
| TRACE | Echo request | Yes | Yes | TRACE /users |
| CONNECT | Establish tunnel | No | No | CONNECT proxy.example.com:443 |
| Custom methods | Non-standard operations | Varies | Varies | Avoid custom methods when possible |

### 3. Success Status Codes (12)

| Code | Name | Meaning | When to Use |
|------|------|---------|-------------|
| 200 | OK | Success | Successful GET, PUT, PATCH, DELETE |
| 201 | Created | Resource created | Successful POST |
| 202 | Accepted | Async processing | Long-running operations |
| 204 | No Content | Success, no body | Successful DELETE |
| 206 | Partial Content | Range request | Pagination, streaming |
| 300 | Multiple Choices | Multiple options | Resource has multiple representations |
| 301 | Moved Permanently | Permanent redirect | Resource permanently moved |
| 302 | Found | Temporary redirect | Temporary resource location |
| 303 | See Other | GET different resource | After POST, redirect to GET |
| 304 | Not Modified | Cached version valid | Conditional GET with valid cache |
| 307 | Temporary Redirect | Preserve method | Temporary redirect, keep method |
| 308 | Permanent Redirect | Preserve method | Permanent redirect, keep method |

### 4. Client Error Status Codes (12)

| Code | Name | Meaning | When to Use |
|------|------|---------|-------------|
| 400 | Bad Request | Invalid syntax | Malformed JSON, invalid parameters |
| 401 | Unauthorized | Authentication required | Missing or invalid credentials |
| 403 | Forbidden | Insufficient permissions | Valid auth but no access |
| 404 | Not Found | Resource doesn't exist | Invalid resource ID |
| 405 | Method Not Allowed | HTTP method invalid | POST to read-only endpoint |
| 406 | Not Acceptable | Can't satisfy Accept header | Unsupported content type |
| 408 | Request Timeout | Client took too long | Slow client connection |
| 409 | Conflict | Request conflicts | Concurrent modification |
| 410 | Gone | Resource permanently deleted | Explicitly removed resource |
| 415 | Unsupported Media Type | Wrong Content-Type | JSON expected, XML sent |
| 422 | Unprocessable Entity | Semantic errors | Valid syntax, invalid data |
| 429 | Too Many Requests | Rate limit exceeded | Throttling triggered |

### 5. Server Error Status Codes (8)

| Code | Name | Meaning | When to Use |
|------|------|---------|-------------|
| 500 | Internal Server Error | Generic server error | Unhandled exceptions |
| 501 | Not Implemented | Feature not supported | Unimplemented method |
| 502 | Bad Gateway | Invalid upstream response | Proxy/gateway error |
| 503 | Service Unavailable | Temporarily unavailable | Maintenance, overload |
| 504 | Gateway Timeout | Upstream timeout | Slow upstream service |
| 505 | HTTP Version Not Supported | HTTP version issue | HTTP/2 not supported |
| 507 | Insufficient Storage | Server storage full | Disk space exhausted |
| 511 | Network Authentication Required | Captive portal | WiFi login required |

### 6. URL Design Patterns (12)

| Pattern | Purpose | Good Example | Bad Example |
|---------|---------|--------------|-------------|
| Plural nouns | Resource collections | /users | /user |
| Lowercase | Consistency | /products | /Products |
| Hyphens over underscores | Readability | /user-profiles | /user_profiles |
| No trailing slash | Clean URLs | /users/123 | /users/123/ |
| Hierarchical | Relationships | /users/123/orders | /orders?user_id=123 |
| Versioning | API evolution | /v1/users | /users?version=1 |
| Filtering | Query parameters | /users?role=admin | /users/role/admin |
| Sorting | Query parameters | /users?sort=created_desc | /users/sorted/created |
| Pagination | Query parameters | /users?page=2&limit=20 | /users/page/2 |
| Actions on resources | Clear operations | /users/123/activate | /activateUser/123 |
| Avoid verbs | Resource-oriented | /users | /getUsers |
| Use nouns | Resource naming | /orders | /createOrder |

### 7. Request Headers (12)

| Header | Purpose | Example Value |
|--------|---------|---------------|
| Accept | Requested content type | application/json |
| Accept-Language | Preferred language | en-US, fr-FR |
| Accept-Encoding | Compression support | gzip, deflate |
| Authorization | Authentication credentials | Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9... |
| Content-Type | Request body format | application/json |
| Content-Length | Body size in bytes | 348 |
| User-Agent | Client information | Mozilla/5.0... |
| Referer | Previous page URL | https://example.com/page |
| Origin | Request origin | https://example.com |
| Host | Target server | api.example.com |
| If-None-Match | Conditional request | "686897696a7c876b7e" |
| If-Modified-Since | Conditional request | Wed, 21 Oct 2015 07:28:00 GMT |

### 8. Response Headers (12)

| Header | Purpose | Example Value |
|--------|---------|---------------|
| Content-Type | Response format | application/json; charset=utf-8 |
| Content-Length | Response size | 1234 |
| Content-Encoding | Compression used | gzip |
| Cache-Control | Caching directive | max-age=3600, private |
| ETag | Resource version | "686897696a7c876b7e" |
| Last-Modified | Last modification time | Wed, 21 Oct 2015 07:28:00 GMT |
| Location | New resource location | https://api.example.com/users/123 |
| Allow | Allowed HTTP methods | GET, POST, PUT, DELETE |
| Access-Control-Allow-Origin | CORS origin | https://example.com |
| Access-Control-Allow-Methods | CORS methods | GET, POST, OPTIONS |
| X-RateLimit-Limit | Rate limit max | 1000 |
| X-RateLimit-Remaining | Remaining requests | 847 |

### 9. Authentication Methods (10)

| Method | Description | Usage | Security Level |
|--------|-------------|-------|----------------|
| API Keys | Simple token-based | Header: X-API-Key: abc123 | Low |
| Basic Auth | Username:password Base64 | Authorization: Basic dXNlcjpwYXNz | Low (requires HTTPS) |
| Bearer Token | Token-based auth | Authorization: Bearer <token> | Medium |
| OAuth 1.0 | Signature-based | Complex signing process | Medium |
| OAuth 2.0 | Token-based framework | Authorization: Bearer <access_token> | High |
| JWT | Self-contained tokens | Authorization: Bearer <jwt> | High |
| HMAC | Hash-based signatures | Custom signature headers | High |
| mTLS | Certificate-based | Client certificate | Very High |
| SAML | XML-based SSO | Enterprise authentication | High |
| OpenID Connect | Identity layer on OAuth 2.0 | Modern SSO | High |

### 10. API Versioning Strategies (8)

| Strategy | Implementation | Pros | Cons |
|----------|----------------|------|------|
| URL versioning | /v1/users, /v2/users | Clear, simple | URL pollution |
| Header versioning | Accept: application/vnd.api.v1+json | Clean URLs | Less discoverable |
| Query parameter | /users?version=1 | Simple | Easy to miss |
| Custom header | X-API-Version: 1 | Clean URLs | Non-standard |
| Content negotiation | Accept: application/vnd.example.v1+json | RESTful | Complex |
| Subdomain | v1.api.example.com | Clear separation | Infrastructure overhead |
| No versioning | Breaking changes prohibited | Simple | Limited flexibility |
| Semantic versioning | v2.1.0 format | Clear changes | More complex |

### 11. Error Response Patterns (10)

| Pattern | Purpose | Example |
|---------|---------|---------|
| Error object | Structured errors | {"error": {"code": "INVALID_INPUT", "message": "..."}} |
| Error code | Machine-readable | {"error_code": "USER_NOT_FOUND"} |
| Error message | Human-readable | {"message": "User not found"} |
| Field errors | Validation errors | {"errors": {"email": ["Invalid format"]}} |
| Error details | Additional context | {"details": "Email must be unique"} |
| Error documentation | Link to docs | {"doc_url": "https://docs.example.com/errors/404"} |
| Request ID | Tracking | {"request_id": "abc-123-def"} |
| Timestamp | When error occurred | {"timestamp": "2023-10-15T14:30:00Z"} |
| HTTP status | Consistent with header | {"status": 404} |
| Stack trace | Development only | {"trace": "..."} (never in production) |

### 12. Pagination Patterns (10)

| Pattern | Implementation | Example | Use Case |
|---------|----------------|---------|----------|
| Offset-based | page and limit params | ?page=2&limit=20 | Simple pagination |
| Cursor-based | Opaque cursor token | ?cursor=eyJpZCI6MTIzfQ | Large datasets |
| Link header | RFC 5988 links | Link: </users?page=3>; rel="next" | RESTful |
| Total count | Include total records | {"total": 1000, "data": [...]} | UI needs |
| Page metadata | Page information | {"page": 2, "per_page": 20, "total_pages": 50} | Full context |
| Range header | HTTP range requests | Range: items=0-24 | Standardized |
| Keyset pagination | Use last ID | ?after_id=123 | Performance |
| Hybrid approach | Multiple strategies | Combine cursor + offset | Flexibility |
| Default limits | Reasonable defaults | Default: 20, Max: 100 | Protection |
| Limit parameter | Client-controlled | ?limit=50 | Flexibility |

### 13. Filtering and Sorting (10)

| Pattern | Purpose | Example | Use Case |
|---------|---------|---------|----------|
| Simple filters | Single field | ?status=active | Basic filtering |
| Multiple filters | AND logic | ?status=active&role=admin | Combined filters |
| Comparison operators | Greater, less than | ?age_gt=18&age_lt=65 | Range queries |
| IN operator | Multiple values | ?status=active,pending | Set membership |
| NOT operator | Exclusion | ?status_ne=deleted | Negative filter |
| Pattern matching | Wildcards | ?name_like=%john% | Search |
| Date ranges | Time-based | ?created_after=2023-01-01 | Temporal filtering |
| Sorting | Order results | ?sort=created_desc | Result ordering |
| Multiple sort | Priority order | ?sort=status_asc,created_desc | Complex sorting |
| Case sensitivity | Control matching | ?name_ilike=%john% | Flexible search |

### 14. HATEOAS Principles (8)

| Concept | Description | Example |
|---------|-------------|---------|
| Hypermedia links | Embed navigation | {"_links": {"self": {"href": "/users/1"}}} |
| Self link | Link to resource itself | {"_links": {"self": {"href": "/users/123"}}} |
| Related resources | Links to related items | {"_links": {"orders": {"href": "/users/123/orders"}}} |
| Actions | Available operations | {"_links": {"delete": {"href": "/users/123", "method": "DELETE"}}} |
| Pagination links | Next, prev, first, last | {"_links": {"next": {"href": "/users?page=3"}}} |
| Templates | URI templates | {"_links": {"search": {"href": "/users{?name}", "templated": true}}} |
| Deprecation | Mark outdated links | {"_links": {"old": {"href": "...", "deprecation": "..."}}} |
| Link relations | Semantic meaning | Standard relations: self, next, prev, first, last |

### 15. Rate Limiting (10)

| Technique | Description | Implementation | Use Case |
|-----------|-------------|----------------|----------|
| Fixed window | Requests per time window | 1000 per hour | Simple limiting |
| Sliding window | Rolling time window | Last 3600 seconds | Smoother limits |
| Token bucket | Tokens replenish over time | Burst + sustained rate | Flexible rates |
| Leaky bucket | Constant rate output | Fixed rate processing | Traffic shaping |
| Per-user limits | User-specific limits | Different tiers | Tiered access |
| Per-IP limits | IP-based limiting | Anonymous users | Abuse prevention |
| Per-endpoint | Different limits | Critical vs non-critical | Resource protection |
| Burst allowance | Short-term spikes | 100/min, burst 150 | Flexibility |
| Rate headers | Communicate limits | X-RateLimit-* headers | Client awareness |
| 429 response | Exceeded limit | Status 429 + Retry-After | Standard handling |

### 16. Caching Strategies (12)

| Strategy | Description | Header | Use Case |
|----------|-------------|--------|----------|
| No caching | Disable caching | Cache-Control: no-cache, no-store | Sensitive data |
| Public caching | Shareable cache | Cache-Control: public, max-age=3600 | Static content |
| Private caching | User-specific | Cache-Control: private, max-age=3600 | User data |
| Conditional requests | Validate cache | If-None-Match, If-Modified-Since | Efficient updates |
| ETags | Resource version | ETag: "686897696a7c876b7e" | Change detection |
| Last-Modified | Modification time | Last-Modified: Wed, 21 Oct 2015 07:28:00 GMT | Time-based cache |
| Vary header | Cache key factors | Vary: Accept-Encoding, Authorization | Content negotiation |
| Stale-while-revalidate | Serve stale during update | Cache-Control: stale-while-revalidate=60 | Performance |
| Immutable | Never changes | Cache-Control: immutable | Static assets |
| Max-age | Cache duration | Cache-Control: max-age=3600 | TTL control |
| Must-revalidate | Force revalidation | Cache-Control: must-revalidate | Data integrity |
| No-transform | Prevent modification | Cache-Control: no-transform | Proxy behavior |

### 17. API Security Best Practices (12)

| Practice | Description | Implementation | Priority |
|----------|-------------|----------------|----------|
| HTTPS only | Encrypted transport | Enforce TLS 1.2+ | Critical |
| Authentication | Verify identity | JWT, OAuth 2.0 | Critical |
| Authorization | Control access | Role-based, permissions | Critical |
| Input validation | Sanitize input | Validate all parameters | Critical |
| Rate limiting | Prevent abuse | Token bucket, sliding window | High |
| CORS configuration | Control origins | Whitelist specific domains | High |
| SQL injection prevention | Parameterized queries | Use ORM, prepared statements | Critical |
| XSS prevention | Escape output | Content Security Policy | High |
| CSRF protection | Validate tokens | CSRF tokens, SameSite cookies | High |
| Security headers | Browser protection | X-Frame-Options, X-Content-Type-Options | Medium |
| API keys rotation | Periodic renewal | Automated key rotation | Medium |
| Audit logging | Track access | Log all sensitive operations | High |

## Tips and Best Practices
* Always use HTTPS in production
* Version your API from the start
* Use proper HTTP status codes
* Implement comprehensive error handling
* Document your API thoroughly
* Use consistent naming conventions
* Implement rate limiting to prevent abuse
* Support filtering, sorting, and pagination
* Use ETags for caching optimization
* Implement proper authentication and authorization
* Log all requests for debugging and monitoring
* Use idempotent operations where possible
* Return appropriate Content-Type headers
* Implement CORS correctly for web clients
* Use semantic versioning for API versions

## Additional Resources
* [REST API Tutorial](https://restfulapi.net/)
* [HTTP Status Codes](https://httpstatuses.com/)
* [REST API Best Practices](https://github.com/NationalBankBelgium/REST-API-Design-Guide)
* [OpenAPI Specification](https://swagger.io/specification/)
* [Roy Fielding's Dissertation on REST](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)
* [Microsoft REST API Guidelines](https://github.com/microsoft/api-guidelines)
* [Google API Design Guide](https://cloud.google.com/apis/design)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to REST API development.

### Common Terms

| Term | Description |
|------|-------------|
| REST | Representational State Transfer - architectural style |
| Resource | Any information that can be named - user, document, image |
| Endpoint | URL where API can be accessed |
| Payload | Data sent in request or response body |
| Idempotent | Operation produces same result when repeated |
| Safe | Operation has no side effects |
| Stateless | Server doesn't store client state |
| CRUD | Create, Read, Update, Delete operations |
| Hypermedia | Links embedded in responses |
| Content negotiation | Client specifies preferred format |

### HTTP Method Characteristics

| Method | Safe | Idempotent | Cacheable | Has Body |
|--------|------|------------|-----------|----------|
| GET | Yes | Yes | Yes | No |
| POST | No | No | Yes | Yes |
| PUT | No | Yes | No | Yes |
| PATCH | No | No | No | Yes |
| DELETE | No | Yes | No | No |
| HEAD | Yes | Yes | Yes | No |
| OPTIONS | Yes | Yes | No | No |

### Common Status Code Ranges

| Range | Category | Meaning |
|-------|----------|---------|
| 1xx | Informational | Request received, continuing |
| 2xx | Success | Request successful |
| 3xx | Redirection | Further action needed |
| 4xx | Client Error | Client made error |
| 5xx | Server Error | Server failed |

### REST vs SOAP

| Aspect | REST | SOAP |
|--------|------|------|
| Protocol | Architectural style | Protocol |
| Format | JSON, XML, others | XML only |
| Transport | HTTP | HTTP, SMTP, TCP |
| State | Stateless | Can be stateful |
| Performance | Faster, less overhead | Slower, more overhead |
| Caching | Built-in support | Limited |
| Security | HTTPS, OAuth | WS-Security |
| Learning curve | Easier | Steeper |

### Authentication Comparison

| Method | Pros | Cons | Best For |
|--------|------|------|----------|
| API Keys | Simple | Low security | Internal APIs |
| Basic Auth | Universal support | Requires HTTPS | Simple auth |
| Bearer Tokens | Flexible | Requires management | Most APIs |
| OAuth 2.0 | Comprehensive | Complex setup | Third-party access |
| JWT | Self-contained | Token size | Microservices |

### Content Types

| Type | Format | Usage |
|------|--------|-------|
| application/json | JSON | Most common |
| application/xml | XML | Legacy systems |
| text/plain | Plain text | Simple responses |
| text/html | HTML | Web pages |
| multipart/form-data | Form with files | File uploads |
| application/x-www-form-urlencoded | URL-encoded form | Simple forms |
| application/octet-stream | Binary | File downloads |

### API Design Patterns

| Pattern | Purpose | Example |
|---------|---------|---------|
| Resource-oriented | Model as resources | /users, /products |
| Action-oriented | Model as actions | /users/123/activate |
| RPC-style | Remote procedure calls | /getUserById |
| GraphQL-style | Query language | Single /graphql endpoint |
| Batch operations | Multiple ops | POST /batch |
| Bulk operations | Mass operations | POST /users/bulk-create |
| Webhooks | Event notifications | Callback URLs |
| WebSockets | Real-time | Persistent connection |

### Error Handling Patterns

| Pattern | Format | Example |
|---------|--------|---------|
| Simple message | String | {"error": "User not found"} |
| Error object | Object | {"error": {"code": "404", "message": "..."}} |
| RFC 7807 | Problem Details | {"type": "...", "title": "...", "status": 404} |
| Multiple errors | Array | {"errors": [{"field": "email", "message": "..."}]} |
| Nested errors | Hierarchy | {"error": {"validation": {"email": ["..."]}}} |

### API Maturity Levels (Richardson Model)

| Level | Name | Characteristics |
|-------|------|-----------------|
| 0 | Swamp of POX | Single endpoint, single method |
| 1 | Resources | Multiple endpoints |
| 2 | HTTP Verbs | Proper HTTP methods |
| 3 | Hypermedia Controls | HATEOAS, self-documenting |

### Common Query Parameters

| Parameter | Purpose | Example |
|-----------|---------|---------|
| page | Page number | ?page=2 |
| limit | Results per page | ?limit=20 |
| offset | Skip records | ?offset=40 |
| sort | Sort order | ?sort=created_desc |
| filter | Filter results | ?filter=active |
| fields | Sparse fieldsets | ?fields=id,name,email |
| include | Related resources | ?include=author,comments |
| search | Search query | ?search=john |
| expand | Embed resources | ?expand=profile |

### Rate Limit Headers

| Header | Purpose | Example |
|--------|---------|---------|
| X-RateLimit-Limit | Max requests | 1000 |
| X-RateLimit-Remaining | Remaining | 847 |
| X-RateLimit-Reset | Reset time | 1640000000 |
| Retry-After | When to retry | 60 |

### CORS Headers

| Header | Purpose | Example |
|--------|---------|---------|
| Access-Control-Allow-Origin | Allowed origins | https://example.com |
| Access-Control-Allow-Methods | Allowed methods | GET, POST, PUT |
| Access-Control-Allow-Headers | Allowed headers | Content-Type, Authorization |
| Access-Control-Max-Age | Preflight cache | 3600 |
| Access-Control-Allow-Credentials | Allow cookies | true |

### Testing Considerations

| Aspect | What to Test | Tools |
|--------|--------------|-------|
| Functionality | Correct responses | Postman, Insomnia |
| Status codes | Appropriate codes | cURL, HTTPie |
| Authentication | Auth flows | OAuth testing tools |
| Rate limiting | Limits enforced | Load testing tools |
| Error handling | Error responses | Negative test cases |
| Performance | Response times | JMeter, Gatling |
| Security | Vulnerabilities | OWASP ZAP, Burp Suite |
| Documentation | Accuracy | Manual review |

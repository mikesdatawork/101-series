# 101 Swagger OpenAPI Commands

## Overview
OpenAPI Specification (formerly Swagger Specification) is a standard format for describing REST APIs. This cheat sheet covers essential OpenAPI concepts including specification structure, data types, request/response definitions, security schemes, documentation practices, code generation, API testing, and tooling. Master these patterns to create comprehensive, maintainable API documentation.

## Target Audience
- API developers documenting endpoints
- Backend engineers building web services
- Technical writers creating API documentation
- DevOps engineers managing API gateways
- Anyone designing or maintaining REST APIs

## Command Categories

### 1. OpenAPI Specification Basics (10)

| Field | Description | Required | Examples |
|-------|-------------|----------|----------|
| openapi | OpenAPI version | Yes | openapi: 3.0.3 |
| info | API metadata | Yes | info: title, version, description |
| servers | Server URLs | No | servers: url, description |
| paths | API endpoints | Yes | paths: /users, /products |
| components | Reusable objects | No | components: schemas, responses |
| security | Security requirements | No | security: api_key, oauth2 |
| tags | Endpoint grouping | No | tags: name, description |
| externalDocs | External documentation | No | externalDocs: url, description |
| webhooks | Webhook definitions | No | webhooks: callback definitions |
| jsonSchemaDialect | JSON Schema dialect | No | jsonSchemaDialect: https://json-schema.org/draft/2020-12/schema |

### 2. Info Object Fields (10)

| Field | Description | Required | Examples |
|-------|-------------|----------|----------|
| title | API title | Yes | title: User Management API |
| version | API version | Yes | version: 1.0.0 |
| description | API description | No | description: Complete user management system |
| termsOfService | Terms of service URL | No | termsOfService: https://example.com/terms |
| contact | Contact information | No | contact: name, email, url |
| license | License information | No | license: name, url |
| summary | Short summary | No | summary: User CRUD operations |
| contact.name | Contact name | No | name: API Support Team |
| contact.email | Contact email | No | email: support@example.com |
| contact.url | Contact URL | No | url: https://example.com/support |

### 3. Server Object (8)

| Field | Description | Required | Examples |
|-------|-------------|----------|----------|
| url | Server URL | Yes | url: https://api.example.com/v1 |
| description | Server description | No | description: Production server |
| variables | URL template variables | No | variables: environment, version |
| variable.default | Variable default | Yes | default: production |
| variable.enum | Variable choices | No | enum: [production, staging, dev] |
| variable.description | Variable description | No | description: Environment name |
| Multiple servers | Different environments | No | Production, staging, development |
| Relative URLs | Path-relative | No | url: /api/v1 |

### 4. Path Item Object (12)

| Field | Description | Usage | Examples |
|-------|-------------|-------|----------|
| get | GET operation | Read resources | get: summary, responses |
| post | POST operation | Create resources | post: summary, requestBody |
| put | PUT operation | Update resources | put: summary, requestBody |
| patch | PATCH operation | Partial update | patch: summary, requestBody |
| delete | DELETE operation | Remove resources | delete: summary, responses |
| options | OPTIONS operation | CORS preflight | options: summary, responses |
| head | HEAD operation | Headers only | head: summary, responses |
| trace | TRACE operation | Diagnostic | trace: summary, responses |
| parameters | Shared parameters | All operations | parameters: path, query params |
| servers | Path-specific servers | Override global | servers: alternative endpoints |
| summary | Path summary | Documentation | summary: User operations |
| description | Path description | Detailed docs | description: CRUD for users |

### 5. Operation Object Fields (12)

| Field | Description | Required | Examples |
|-------|-------------|----------|----------|
| operationId | Unique operation ID | No | operationId: getUsers |
| summary | Short summary | No | summary: Get all users |
| description | Detailed description | No | description: Returns paginated user list |
| tags | Operation grouping | No | tags: [users] |
| parameters | Operation parameters | No | parameters: query, path, header |
| requestBody | Request body | No | requestBody: content, required |
| responses | Response definitions | Yes | responses: 200, 400, 404 |
| callbacks | Async callbacks | No | callbacks: webhook definitions |
| deprecated | Mark as deprecated | No | deprecated: true |
| security | Security override | No | security: operation-specific auth |
| servers | Operation servers | No | servers: operation-specific URLs |
| externalDocs | External docs | No | externalDocs: related documentation |

### 6. Parameter Object (12)

| Field | Description | Location | Examples |
|-------|-------------|----------|----------|
| name | Parameter name | All | name: userId |
| in | Parameter location | All | in: path, query, header, cookie |
| required | Required flag | All | required: true |
| description | Parameter description | All | description: User identifier |
| schema | Parameter schema | All | schema: type, format |
| deprecated | Deprecation flag | All | deprecated: true |
| allowEmptyValue | Allow empty | query | allowEmptyValue: false |
| style | Serialization style | All | style: form, simple, matrix |
| explode | Explode arrays | All | explode: true |
| allowReserved | Reserved chars | query | allowReserved: false |
| example | Example value | All | example: 12345 |
| examples | Multiple examples | All | examples: exampleName: value |

### 7. Request Body Object (10)

| Field | Description | Required | Examples |
|-------|-------------|----------|----------|
| content | Media type definitions | Yes | content: application/json |
| description | Request description | No | description: User object |
| required | Required flag | No | required: true |
| application/json | JSON content type | Common | schema, example, examples |
| application/xml | XML content type | Less common | schema, example |
| multipart/form-data | File upload | File uploads | schema: properties |
| application/x-www-form-urlencoded | Form data | Forms | schema: properties |
| text/plain | Plain text | Simple data | schema: type string |
| encoding | Encoding properties | Multipart | encoding: contentType |
| example | Request example | No | example: complete request |

### 8. Response Object (12)

| Field | Description | Required | Examples |
|-------|-------------|----------|----------|
| description | Response description | Yes | description: Successful operation |
| content | Response content types | No | content: application/json |
| headers | Response headers | No | headers: X-Rate-Limit |
| links | Related operations | No | links: nextPage, prevPage |
| 200 | Success response | Common | 200: description, content |
| 201 | Created response | POST | 201: description, headers |
| 204 | No content | DELETE | 204: description |
| 400 | Bad request | Validation | 400: description, content |
| 401 | Unauthorized | Auth failure | 401: description, content |
| 404 | Not found | Missing resource | 404: description, content |
| 500 | Server error | System error | 500: description, content |
| default | Default response | Catch-all | default: error description |

### 9. Schema Object (Data Types) (12)

| Type | Format | Description | Examples |
|------|--------|-------------|----------|
| string | - | Text string | type: string |
| string | date | ISO 8601 date | format: date |
| string | date-time | ISO 8601 datetime | format: date-time |
| string | email | Email address | format: email |
| string | uuid | UUID | format: uuid |
| string | uri | URI | format: uri |
| integer | int32 | 32-bit integer | type: integer, format: int32 |
| integer | int64 | 64-bit integer | type: integer, format: int64 |
| number | float | Floating point | type: number, format: float |
| number | double | Double precision | type: number, format: double |
| boolean | - | True/false | type: boolean |
| array | - | Array of items | type: array, items: {...} |

### 10. Schema Validation (12)

| Keyword | Purpose | Type | Examples |
|---------|---------|------|----------|
| required | Required properties | object | required: [name, email] |
| enum | Allowed values | all | enum: [active, pending, deleted] |
| minimum | Minimum value | number | minimum: 0 |
| maximum | Maximum value | number | maximum: 100 |
| minLength | Minimum length | string | minLength: 3 |
| maxLength | Maximum length | string | maxLength: 50 |
| pattern | Regex pattern | string | pattern: ^[a-zA-Z]+$ |
| minItems | Minimum array size | array | minItems: 1 |
| maxItems | Maximum array size | array | maxItems: 100 |
| uniqueItems | Unique array items | array | uniqueItems: true |
| multipleOf | Multiple of value | number | multipleOf: 5 |
| format | Value format | string | format: email, uuid, date |

### 11. Schema Composition (10)

| Keyword | Purpose | Usage | Examples |
|---------|---------|-------|----------|
| allOf | Merge schemas | Inheritance | allOf: - $ref: BaseModel |
| oneOf | Exactly one match | Polymorphism | oneOf: - $ref: Dog - $ref: Cat |
| anyOf | At least one match | Flexible validation | anyOf: - type: string - type: number |
| not | Negate schema | Exclusion | not: type: null |
| discriminator | Type discrimination | Polymorphism | discriminator: propertyName: type |
| properties | Object properties | Structure | properties: name, email |
| additionalProperties | Extra properties | Flexibility | additionalProperties: false |
| items | Array item schema | Array validation | items: $ref: #/components/schemas/User |
| nullable | Allow null | Null handling | nullable: true |
| readOnly | Read-only property | Responses only | readOnly: true |

### 12. Security Schemes (12)

| Type | Description | Location | Examples |
|------|-------------|----------|----------|
| apiKey | API key authentication | header, query, cookie | in: header, name: X-API-Key |
| http | HTTP authentication | Authorization header | scheme: basic, bearer |
| oauth2 | OAuth 2.0 | Multiple flows | flows: authorizationCode |
| openIdConnect | OpenID Connect | Discovery | openIdConnectUrl: discovery URL |
| basic | HTTP Basic | Authorization header | scheme: basic |
| bearer | Bearer token | Authorization header | scheme: bearer, bearerFormat: JWT |
| flows | OAuth flows | oauth2 | flows: implicit, password, clientCredentials |
| authorizationUrl | Auth endpoint | oauth2 | authorizationUrl: /oauth/authorize |
| tokenUrl | Token endpoint | oauth2 | tokenUrl: /oauth/token |
| refreshUrl | Refresh endpoint | oauth2 | refreshUrl: /oauth/refresh |
| scopes | Permission scopes | oauth2 | scopes: read:users, write:users |
| mutualTLS | Certificate auth | x509 | scheme: mutualTLS |

### 13. Components Object (10)

| Field | Purpose | Reusable | Examples |
|-------|---------|----------|----------|
| schemas | Data models | Yes | schemas: User, Product |
| responses | Response objects | Yes | responses: NotFound, ServerError |
| parameters | Parameters | Yes | parameters: PageParam, LimitParam |
| examples | Example values | Yes | examples: UserExample |
| requestBodies | Request bodies | Yes | requestBodies: UserCreate |
| headers | Header definitions | Yes | headers: X-Rate-Limit |
| securitySchemes | Security definitions | Yes | securitySchemes: bearerAuth |
| links | Links between operations | Yes | links: nextPage |
| callbacks | Callback definitions | Yes | callbacks: webhookEvent |
| pathItems | Reusable path items | Yes | pathItems: CommonPath |

### 14. Reference Object (8)

| Pattern | Purpose | Scope | Examples |
|---------|---------|-------|----------|
| $ref | Reference definition | All | $ref: #/components/schemas/User |
| Local reference | Same document | Internal | $ref: #/components/responses/NotFound |
| Remote reference | External document | External | $ref: common.yaml#/components/schemas/Error |
| URL reference | HTTP URL | External | $ref: https://example.com/schemas/user.yaml |
| Component reference | Reusable component | Internal | $ref: #/components/parameters/PageParam |
| Schema reference | Data model | Internal | $ref: #/components/schemas/User |
| Response reference | Response definition | Internal | $ref: #/components/responses/Success |
| Parameter reference | Parameter definition | Internal | $ref: #/components/parameters/UserId |

### 15. Tags and External Documentation (8)

| Field | Purpose | Usage | Examples |
|-------|---------|-------|----------|
| tags | Endpoint grouping | Organization | tags: - name: users, description: User operations |
| name | Tag name | Identification | name: users |
| description | Tag description | Documentation | description: User management endpoints |
| externalDocs | External docs | Reference | externalDocs: url, description |
| tag.externalDocs | Tag-specific docs | Reference | externalDocs: https://docs.example.com/users |
| operation.tags | Operation grouping | Categorization | tags: [users, admin] |
| Multiple tags | Cross-cutting | Organization | tags: [users, authentication] |
| Tag ordering | Display order | UI organization | Listed in definition order |

### 16. Example and Examples (10)

| Field | Purpose | Usage | Examples |
|-------|---------|-------|----------|
| example | Single example | Simple case | example: John Doe |
| examples | Multiple examples | Various scenarios | examples: success, error |
| value | Example value | Concrete value | value: {name: John} |
| summary | Example summary | Brief description | summary: Successful response |
| description | Example description | Detailed explanation | description: User creation success |
| externalValue | External example | URL reference | externalValue: https://example.com/user.json |
| Request examples | Request samples | Documentation | requestBody: examples |
| Response examples | Response samples | Documentation | responses: 200: examples |
| Parameter examples | Parameter samples | Documentation | parameters: example |
| Schema examples | Default examples | Data model | schema: example |

### 17. OpenAPI Tools and CLI (12)

| Tool | Purpose | Usage | Examples |
|------|---------|-------|----------|
| Swagger Editor | Edit specifications | Online/offline editor | Edit YAML/JSON specs |
| Swagger UI | Interactive documentation | API testing interface | Try out endpoints |
| Swagger Codegen | Code generation | Generate client/server | Generate Python, Java clients |
| Redoc | Alternative documentation | Beautiful API docs | Static documentation |
| openapi-generator | Modern code generator | Multiple languages | openapi-generator generate -i spec.yaml |
| Stoplight Studio | Visual API designer | Design-first approach | Visual editing |
| Postman | API testing | Import OpenAPI | Test endpoints |
| Insomnia | API client | Import specs | Request testing |
| spectral | Linter | Validate specs | spectral lint openapi.yaml |
| swagger-cli | CLI tool | Validate, bundle | swagger-cli validate spec.yaml |
| openapi-diff | Compare versions | Version comparison | Compare spec changes |
| prism | Mock server | API mocking | prism mock openapi.yaml |

## Tips and Best Practices
* Start with OpenAPI 3.0+ for modern features
* Use components for reusable definitions
* Provide comprehensive examples for all endpoints
* Document all error responses
* Use meaningful operation IDs for code generation
* Include detailed descriptions for complex schemas
* Version your API specification
* Use tags for logical endpoint grouping
* Validate specifications regularly
* Keep examples up to date with implementation
* Use external documentation for detailed guides
* Implement security schemes consistently
* Use discriminators for polymorphic types
* Document deprecations clearly
* Automate documentation generation in CI/CD

## Additional Resources
* [OpenAPI Specification](https://spec.openapis.org/oas/latest.html)
* [Swagger Tools](https://swagger.io/tools/)
* [OpenAPI Generator](https://openapi-generator.tech/)
* [Redoc Documentation](https://redocly.com/redoc/)
* [Stoplight Platform](https://stoplight.io/)
* [Swagger Editor](https://editor.swagger.io/)
* [OpenAPI Best Practices](https://oai.github.io/Documentation/best-practices.html)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to OpenAPI and Swagger.

### Common Terms

| Term | Description |
|------|-------------|
| OpenAPI | API specification standard |
| Swagger | Tools for OpenAPI (former spec name) |
| Specification | API definition document |
| Schema | Data model definition |
| Operation | API endpoint with HTTP method |
| Component | Reusable definition |
| Reference | Link to component |
| Path | API endpoint URL |
| Parameter | Input to operation |
| Response | Output from operation |

### OpenAPI Versions

| Version | Release | Major Changes |
|---------|---------|---------------|
| 2.0 | 2014 | Original Swagger Specification |
| 3.0.0 | 2017 | Renamed to OpenAPI, major rewrite |
| 3.0.1 | 2017 | Clarifications and fixes |
| 3.0.2 | 2018 | Additional clarifications |
| 3.0.3 | 2020 | Security improvements |
| 3.1.0 | 2021 | JSON Schema alignment |

### Specification Formats

| Format | Extension | Usage |
|--------|-----------|-------|
| YAML | .yaml, .yml | Human-readable, common |
| JSON | .json | Machine-readable |
| Mixed | Both | YAML with JSON schemas |

### Parameter Locations

| Location | Description | Example |
|----------|-------------|---------|
| path | URL path segment | /users/{userId} |
| query | Query string | /users?page=1 |
| header | HTTP header | Authorization: Bearer token |
| cookie | HTTP cookie | sessionId=abc123 |

### Security Scheme Types

| Type | Authentication Method | Use Case |
|------|----------------------|----------|
| apiKey | API key | Simple auth |
| http | HTTP auth (Basic, Bearer) | Standard auth |
| oauth2 | OAuth 2.0 | Delegated auth |
| openIdConnect | OpenID Connect | SSO |
| mutualTLS | Client certificates | High security |

### OAuth 2.0 Flows

| Flow | Use Case | Client Type |
|------|----------|-------------|
| authorizationCode | Server-side apps | Confidential |
| implicit | Browser apps (deprecated) | Public |
| password | First-party apps | Trusted |
| clientCredentials | Machine-to-machine | Confidential |

### Content Types

| Content-Type | Format | Common Usage |
|--------------|--------|--------------|
| application/json | JSON | Most common |
| application/xml | XML | Legacy systems |
| text/plain | Plain text | Simple data |
| multipart/form-data | Multipart | File uploads |
| application/x-www-form-urlencoded | URL encoded | Forms |

### Schema Composition Keywords

| Keyword | Behavior | Use Case |
|---------|----------|----------|
| allOf | Merge all | Inheritance |
| oneOf | Exactly one | Polymorphism |
| anyOf | One or more | Flexible validation |
| not | None of | Exclusion |

### Common HTTP Status Codes

| Code | Meaning | Usage |
|------|---------|-------|
| 200 | OK | Success |
| 201 | Created | Resource created |
| 204 | No Content | Success, no body |
| 400 | Bad Request | Invalid input |
| 401 | Unauthorized | Auth required |
| 403 | Forbidden | No permission |
| 404 | Not Found | Resource missing |
| 500 | Server Error | Internal error |

### Validation Keywords

| Keyword | Type | Purpose |
|---------|------|---------|
| required | object | Required properties |
| enum | all | Allowed values |
| minimum/maximum | number | Value range |
| minLength/maxLength | string | Length constraints |
| pattern | string | Regex validation |
| minItems/maxItems | array | Size constraints |
| uniqueItems | array | No duplicates |
| format | string | Value format |

### String Formats

| Format | Validation | Example |
|--------|------------|---------|
| date | ISO 8601 date | 2023-12-31 |
| date-time | ISO 8601 datetime | 2023-12-31T23:59:59Z |
| email | Email address | user@example.com |
| uuid | UUID | 550e8400-e29b-41d4-a716-446655440000 |
| uri | URI | https://example.com |
| hostname | Hostname | example.com |
| ipv4 | IPv4 address | 192.168.1.1 |
| ipv6 | IPv6 address | 2001:db8::1 |

### Code Generation Languages

| Language | Generator | Common Use |
|----------|-----------|------------|
| Python | openapi-generator | Backend, clients |
| Java | openapi-generator | Enterprise apps |
| JavaScript | openapi-generator | Frontend, Node.js |
| TypeScript | openapi-generator | Type-safe clients |
| Go | openapi-generator | Microservices |
| C# | openapi-generator | .NET apps |
| PHP | openapi-generator | Web apps |
| Ruby | openapi-generator | Rails apps |

### Swagger Tools Comparison

| Tool | Purpose | Best For |
|------|---------|----------|
| Swagger Editor | Edit specs | Creating specs |
| Swagger UI | Interactive docs | Testing APIs |
| Swagger Codegen | Code generation | Client/server code |
| Swagger Inspector | API testing | Manual testing |
| SwaggerHub | Collaboration | Team workflows |

### Common Patterns

| Pattern | Description | Use Case |
|---------|-------------|----------|
| Pagination | Split large results | List endpoints |
| Filtering | Narrow results | Query parameters |
| Sorting | Order results | Query parameters |
| Versioning | API versions | Breaking changes |
| Deprecation | Phase out endpoints | Migrations |
| HATEOAS | Hypermedia links | Self-discovery |
| Webhooks | Async callbacks | Event notifications |
| Bulk operations | Multiple items | Efficiency |

### Documentation Best Practices

| Practice | Purpose | Implementation |
|----------|---------|----------------|
| Descriptive summaries | Quick understanding | Clear, concise text |
| Detailed descriptions | Complete info | Markdown formatting |
| Examples | Show usage | Realistic data |
| Error responses | Handle failures | All error codes |
| Authentication docs | Security setup | Step-by-step |
| Rate limits | Usage boundaries | Header documentation |
| Deprecation notices | Migration path | Timeline and alternatives |
| Changelog | Track changes | Version history |

### Validation Tools

| Tool | Purpose | Command |
|------|---------|---------|
| swagger-cli | Validate specs | swagger-cli validate spec.yaml |
| spectral | Linting | spectral lint openapi.yaml |
| openapi-validator | Schema validation | Programmatic validation |
| Swagger Editor | Online validation | Built-in validation |
| Redocly CLI | Lint and bundle | redocly lint openapi.yaml |

### Mock Server Tools

| Tool | Purpose | Usage |
|------|---------|-------|
| Prism | Mock server | prism mock openapi.yaml |
| Stoplight Prism | Advanced mocking | Dynamic responses |
| json-server | Simple mocking | Quick prototypes |
| WireMock | Stubbing | Complex scenarios |
| Postman Mock | Cloud mocking | Team collaboration |

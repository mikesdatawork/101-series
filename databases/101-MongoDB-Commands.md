# 101 MongoDB Commands

## Overview
MongoDB is a popular NoSQL, document-oriented database that stores data in flexible, JSON-like documents. This cheat sheet covers essential MongoDB commands for database operations, querying, administration, and optimization. From basic CRUD operations to advanced aggregation and indexing, these commands help developers and administrators work effectively with MongoDB databases in both development and production environments.

## Target Audience
- Backend developers
- Database administrators
- DevOps engineers
- Data engineers
- Full-stack developers
- NoSQL enthusiasts

## Command Categories

### 1. Connection and Basic Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `mongosh` | Connect to MongoDB shell | Interactive administration | `mongosh "mongodb://localhost:27017"` |
| `use database` | Switch to database | Changing current database | `use myDatabase` |
| `show dbs` | Show all databases | Listing available databases | `show dbs` |
| `show collections` | Show collections in current db | Listing available collections | `show collections` |
| `db` | Reference current database | Getting database reference | `db` |
| `db.stats()` | Database statistics | Checking database metrics | `db.stats()` |
| `db.dropDatabase()` | Delete current database | Removing databases | `db.dropDatabase()` |
| `db.createCollection()` | Create new collection | Setting up data structure | `db.createCollection("users")` |
| `db.collection.stats()` | Collection statistics | Checking collection metrics | `db.users.stats()` |
| `exit` | Exit MongoDB shell | Closing the connection | `exit` |

### 2. CRUD Operations - Create (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.insertOne()` | Insert single document | Adding individual records | `db.users.insertOne({name: "John", age: 30})` |
| `db.collection.insertMany()` | Insert multiple documents | Bulk record creation | `db.users.insertMany([{name: "John"}, {name: "Jane"}])` |
| `db.collection.insert()` | Legacy insert method | General insertion | `db.users.insert({name: "John"})` |
| `db.collection.save()` | Insert or update document | Upsert operations | `db.users.save({_id: ObjectId("..."), name: "John"})` |
| `db.collection.bulkWrite()` | Execute multiple operations | Complex batch operations | `db.users.bulkWrite([{insertOne: {doc}}, {updateOne: {...}}])` |
| `{ordered: false}` | Unordered inserts | Optimize bulk inserts | `db.users.insertMany(docs, {ordered: false})` |
| `{writeConcern: {w: "majority"}}` | Ensure write durability | Production data safety | `db.users.insertOne(doc, {writeConcern: {w: "majority"}})` |
| `try/catch` | Error handling | Handling insert failures | `try { db.users.insertOne(doc) } catch (e) { print(e) }` |
| `new Date()` | Create timestamp | Adding timestamps | `db.logs.insertOne({event: "login", timestamp: new Date()})` |
| `ObjectId()` | Generate document ID | Creating custom IDs | `db.users.insertOne({_id: ObjectId(), name: "John"})` |

### 3. CRUD Operations - Read (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.find()` | Query documents | Finding records | `db.users.find({age: {$gt: 21}})` |
| `db.collection.findOne()` | Get single document | Finding first match | `db.users.findOne({email: "user@example.com"})` |
| `db.collection.countDocuments()` | Count documents | Getting record counts | `db.users.countDocuments({active: true})` |
| `db.collection.estimatedDocumentCount()` | Estimate total count | Fast collection size | `db.users.estimatedDocumentCount()` |
| `db.collection.distinct()` | Get unique values | Finding distinct values | `db.users.distinct("country")` |
| `query selectors` | Filter documents | Conditional queries | `db.users.find({age: {$gt: 21, $lt: 65}})` |
| `projection` | Include/exclude fields | Limiting returned fields | `db.users.find({}, {name: 1, email: 1, _id: 0})` |
| `sort()` | Order results | Sorting output | `db.users.find().sort({name: 1})` |
| `limit()` | Restrict result count | Limiting results | `db.users.find().limit(10)` |
| `skip()` | Skip initial results | Pagination | `db.users.find().skip(20).limit(10)` |
| `count()` | Legacy count method | Quick counting | `db.users.find({active: true}).count()` |
| `size()` | Count query results | Counting result set | `db.users.find().size()` |
| `explain()` | Query execution info | Query optimization | `db.users.find({name: "John"}).explain()` |
| `pretty()` | Format output | Readability improvement | `db.users.find().pretty()` |
| `forEach()` | Iterate results | Processing each document | `db.users.find().forEach(doc => print(doc.name))` |

### 4. CRUD Operations - Update (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.updateOne()` | Update single document | Modifying specific document | `db.users.updateOne({_id: ObjectId("...")}, {$set: {name: "New Name"}})` |
| `db.collection.updateMany()` | Update multiple documents | Batch document updates | `db.users.updateMany({status: "inactive"}, {$set: {status: "active"}})` |
| `db.collection.replaceOne()` | Replace entire document | Complete document replacement | `db.users.replaceOne({_id: ObjectId("...")}, {name: "John", age: 30})` |
| `$set` | Set field values | Setting specific fields | `db.users.updateOne({_id: ObjectId("...")}, {$set: {email: "new@example.com"}})` |
| `$unset` | Remove fields | Deleting specific fields | `db.users.updateOne({_id: ObjectId("...")}, {$unset: {temporary: ""}})` |
| `$inc` | Increment field values | Numerical increments | `db.products.updateOne({_id: ObjectId("...")}, {$inc: {stock: -1}})` |
| `$push` | Add to array | Array element addition | `db.users.updateOne({_id: ObjectId("...")}, {$push: {tags: "new-tag"}})` |
| `$pull` | Remove from array | Array element removal | `db.users.updateOne({_id: ObjectId("...")}, {$pull: {tags: "old-tag"}})` |
| `$addToSet` | Add unique to array | Unique array updates | `db.users.updateOne({_id: ObjectId("...")}, {$addToSet: {tags: "unique-tag"}})` |
| `{upsert: true}` | Insert if no match | Create or update pattern | `db.users.updateOne({email: "user@example.com"}, {$set: {name: "John"}}, {upsert: true})` |
| `db.collection.findAndModify()` | Update and return document | Atomic update and retrieve | `db.users.findAndModify({query: {_id: ObjectId("...")}, update: {$set: {name: "John"}}, new: true})` |
| `db.collection.findOneAndUpdate()` | Update and return document | Simplified find and modify | `db.users.findOneAndUpdate({_id: ObjectId("...")}, {$set: {name: "John"}}, {returnNewDocument: true})` |

### 5. CRUD Operations - Delete (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.deleteOne()` | Delete single document | Removing specific record | `db.users.deleteOne({_id: ObjectId("...")})` |
| `db.collection.deleteMany()` | Delete multiple documents | Batch record removal | `db.users.deleteMany({status: "inactive"})` |
| `db.collection.remove()` | Legacy delete method | General deletion | `db.users.remove({status: "inactive"})` |
| `db.collection.drop()` | Delete entire collection | Complete data removal | `db.users.drop()` |
| `db.collection.findOneAndDelete()` | Delete and return document | Atomic delete and retrieve | `db.users.findOneAndDelete({status: "inactive"})` |

### 6. Query Operators (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `$eq` | Equal to | Exact matching | `db.users.find({age: {$eq: 30}})` |
| `$gt/$gte` | Greater than/equal | Range queries | `db.users.find({age: {$gte: 18}})` |
| `$lt/$lte` | Less than/equal | Range queries | `db.users.find({age: {$lt: 65}})` |
| `$ne` | Not equal to | Exclusion queries | `db.users.find({status: {$ne: "inactive"}})` |
| `$in` | In array | Multiple value matches | `db.users.find({country: {$in: ["USA", "Canada"]}})` |
| `$nin` | Not in array | Multiple value exclusions | `db.users.find({country: {$nin: ["USA", "Canada"]}})` |
| `$and` | Logical AND | Multiple condition matching | `db.users.find({$and: [{age: {$gt: 18}}, {status: "active"}]})` |
| `$or` | Logical OR | Alternative matching | `db.users.find({$or: [{status: "active"}, {age: {$gt: 65}}]})` |
| `$not` | Logical NOT | Condition negation | `db.users.find({age: {$not: {$lt: 18}}})` |
| `$exists` | Field exists check | Checking for field presence | `db.users.find({email: {$exists: true}})` |

### 7. Aggregation (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.aggregate()` | Run aggregation pipeline | Complex data processing | `db.orders.aggregate([{$match: {status: "completed"}}])` |
| `$match` | Filter documents | Query-like filtering | `db.orders.aggregate([{$match: {total: {$gt: 100}}}])` |
| `$group` | Group documents | Data aggregation | `db.orders.aggregate([{$group: {_id: "$customer", total: {$sum: "$amount"}}}])` |
| `$sort` | Sort documents | Result ordering | `db.orders.aggregate([{$sort: {date: -1}}])` |
| `$project` | Reshape documents | Field selection/transformation | `db.users.aggregate([{$project: {fullName: {$concat: ["$firstName", " ", "$lastName"]}}}])` |
| `$limit` | Limit results | Result size control | `db.orders.aggregate([{$limit: 10}])` |
| `$skip` | Skip documents | Pagination | `db.orders.aggregate([{$skip: 20}])` |
| `$unwind` | Flatten arrays | Array processing | `db.products.aggregate([{$unwind: "$categories"}])` |
| `$lookup` | Join collections | Relational operations | `db.orders.aggregate([{$lookup: {from: "customers", localField: "customerId", foreignField: "_id", as: "customer"}}])` |
| `$out` | Write results | Storing aggregation results | `db.orders.aggregate([{$group: {_id: "$status", count: {$sum: 1}}}, {$out: "statusCounts"}])` |
| `$count` | Count documents | Counting pipeline results | `db.orders.aggregate([{$match: {status: "shipped"}}, {$count: "shippedCount"}])` |
| `$facet` | Multiple pipelines | Multi-dimensional aggregations | `db.products.aggregate([{$facet: {categoryCounts: [{$group: {_id: "$category", count: {$sum: 1}}}], priceStats: [{$group: {_id: null, avg: {$avg: "$price"}}}]}}])` |

### 8. Indexing (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.createIndex()` | Create index | Performance optimization | `db.users.createIndex({email: 1})` |
| `db.collection.createIndexes()` | Create multiple indexes | Batch index creation | `db.users.createIndexes([{name: 1}, {email: 1}])` |
| `db.collection.getIndexes()` | List all indexes | Index inventory | `db.users.getIndexes()` |
| `db.collection.dropIndex()` | Remove specific index | Index cleanup | `db.users.dropIndex("email_1")` |
| `db.collection.dropIndexes()` | Remove all indexes | Complete index reset | `db.users.dropIndexes()` |
| `{unique: true}` | Create unique index | Enforcing uniqueness | `db.users.createIndex({email: 1}, {unique: true})` |
| `{sparse: true}` | Create sparse index | Indexing existing values | `db.users.createIndex({email: 1}, {sparse: true})` |
| `{background: true}` | Background indexing | Non-blocking index creation | `db.users.createIndex({name: 1}, {background: true})` |

### 9. Text Search (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.createIndex({field: "text"})` | Create text index | Enabling text search | `db.articles.createIndex({content: "text"})` |
| `$text` | Text search query | Full-text search | `db.articles.find({$text: {$search: "mongodb tutorial"}})` |
| `$meta` | Text score metadata | Relevance scoring | `db.articles.find({$text: {$search: "mongodb"}}, {score: {$meta: "textScore"}})` |
| `$language` | Specify search language | Multi-language search | `db.articles.find({$text: {$search: "mongodb", $language: "spanish"}})` |
| `$caseSensitive` | Case sensitive search | Exact text matching | `db.articles.find({$text: {$search: "MongoDB", $caseSensitive: true}})` |

### 10. Geospatial Queries (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.collection.createIndex({field: "2dsphere"})` | Create geospatial index | Location-based queries | `db.places.createIndex({location: "2dsphere"})` |
| `$near` | Find nearby locations | Proximity search | `db.places.find({location: {$near: {$geometry: {type: "Point", coordinates: [-73.9, 40.8]}, $maxDistance: 1000}}})` |
| `$geoWithin` | Within a specified region | Region-based search | `db.places.find({location: {$geoWithin: {$geometry: {type: "Polygon", coordinates: [[[...]]]}}}})` |
| `$geoIntersects` | Intersects with a geometry | Intersection queries | `db.areas.find({boundary: {$geoIntersects: {$geometry: {type: "LineString", coordinates: [[...]]}}}})`|
| `$centerSphere` | Circular area query | Radius-based search | `db.places.find({location: {$geoWithin: {$centerSphere: [[-73.9, 40.8], 0.01]}}})`|

### 11. Administration (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `db.serverStatus()` | Get server status | Server health check | `db.serverStatus()` |
| `db.currentOp()` | View current operations | Monitoring active operations | `db.currentOp()` |
| `db.killOp()` | Kill operation | Stopping long-running operations | `db.killOp(opId)` |
| `db.setProfilingLevel()` | Set profiling level | Performance monitoring | `db.setProfilingLevel(1, 100)` |
| `db.getProfilingLevel()` | Get profiling level | Checking current profiling | `db.getProfilingLevel()` |

### 12. Data Types and Functions (4)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `ObjectId()` | Create ObjectId | ID generation/reference | `new ObjectId()` |
| `ISODate()` | Create date object | Timestamp handling | `new ISODate("2023-01-01T12:00:00Z")` |
| `NumberDecimal()` | Create decimal number | Precise decimal math | `NumberDecimal("123.45")` |
| `Binary()` | Create binary data | Storing binary content | `new Binary(buffer)` |

## Tips and Best Practices
* Use appropriate indexes for frequently queried fields
* Structure documents thoughtfully to match query patterns
* Prefer the MongoDB shell over direct protocol access
* Use projection to limit returned fields for better performance
* Implement proper error handling for database operations
* Consider write concerns for critical data operations
* Use bulk operations for multiple document changes
* Use aggregation for complex data transformations
* Understand when to embed documents vs. using references
* Regularly monitor database performance and optimize as needed

## Additional Resources
* [MongoDB Official Documentation](https://docs.mongodb.com/)
* [MongoDB University](https://university.mongodb.com/)
* [MongoDB Manual](https://docs.mongodb.com/manual/)
* [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) - Managed MongoDB service
* [MongoDB Compass](https://www.mongodb.com/products/compass) - GUI for MongoDB

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to MongoDB.

### Common Terms

| Term | Description |
|------|-------------|
| `document` | Individual record in MongoDB (similar to a row in relational databases) |
| `collection` | Group of documents (similar to a table in relational databases) |
| `field` | Key-value pair in a document (similar to a column in relational databases) |
| `BSON` | Binary JSON - the format MongoDB uses to store documents |
| `_id` | Default primary key field in MongoDB documents |
| `embedded document` | Document nested inside another document |
| `replica set` | Group of MongoDB servers maintaining the same data for redundancy |
| `sharding` | Distributing data across multiple machines |
| `index` | Data structure improving the speed of data retrieval operations |
| `cursor` | Pointer to a result set of a query |

### Common Flags/Options

| Flag/Option | Common Meaning | Example Usage |
|-------------|----------------|--------------|
| `--host` | Hostname/IP to connect to | `mongosh --host 127.0.0.1` |
| `--port` | Port number to connect to | `mongosh --port 27017` |
| `--username` | Authentication username | `mongosh --username admin` |
| `--password` | Authentication password | `mongosh --password mypassword` |
| `--authenticationDatabase` | Auth database name | `mongosh --authenticationDatabase admin` |
| `--quiet` | Suppress startup text | `mongosh --quiet` |
| `-v/--verbose` | Increase logging verbosity | `mongosh -v` |
| `--eval` | Evaluate JavaScript | `mongosh --eval "db.version()"` |
| `--shell` | Run shell after evaluating files | `mongosh --shell script.js` |
| `--version` | Show version information | `mongosh --version` |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `CRUD` | Create, Read, Update, Delete | Basic database operations |
| `JSON` | JavaScript Object Notation | Data format used for MongoDB documents |
| `BSON` | Binary JSON | MongoDB's binary-encoded serialization of JSON |
| `WiredTiger` | WiredTiger | MongoDB's default storage engine |
| `TTL` | Time To Live | Automatic document expiration |
| `ACID` | Atomicity, Consistency, Isolation, Durability | Database transaction properties |
| `GeoJSON` | Geographic JSON | Format for encoding geographic data structures |
| `MQL` | MongoDB Query Language | MongoDB's query syntax |
| `URI` | Uniform Resource Identifier | MongoDB connection string format |
| `RS` | Replica Set | MongoDB's replication system |

### Special Characters/Syntax

| Symbol/Syntax | Name | Usage |
|---------------|------|-------|
| `{}` | Curly braces | Document/object definition |
| `[]` | Square brackets | Array definition |
| `$` | Dollar sign | Operator prefix, field reference in aggregation |
| `.` | Dot notation | Field access, subdocument reference |
| `_id` | Underscore ID | Default primary key field |
| `""` | Double quotes | String values |
| `ObjectId()` | Object ID constructor | Creating document IDs |
| `ISODate()` | Date constructor | Creating date objects |
| `{}` with no content | Empty document | Selection criteria for all documents |
| `$elemMatch` | Element match operator | Matching array elements |

### Command/Function Syntax

Basic syntax pattern for MongoDB commands:
```javascript
db.collection.command(query, projection, options)
```

* **db**: The database object
* **collection**: The collection to operate on
* **command**: The operation to perform (find, update, etc.)
* **query**: The selection criteria (what to find/update)
* **projection**: Fields to include/exclude (optional)
* **options**: Additional parameters (optional)

Example with breakdown:
```javascript
db.users.find(
  { age: { $gt: 21 } },  // query: users over 21
  { name: 1, email: 1, _id: 0 },  // projection: include name and email, exclude _id
  { limit: 5 }  // options: return only 5 results
)
```
* `db` is the database reference
* `users` is the collection
* `find` is the command
* `{ age: { $gt: 21 } }` is the query criteria
* `{ name: 1, email: 1, _id: 0 }` is the projection
* `{ limit: 5 }` is the options

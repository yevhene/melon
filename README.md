# bonus

## Rules
- All date/time fields formatted according to `RFC 3339`;
- All texts use Markdown format;
- All money related values measured in minor units (like `cents`).

## Definitions
- `<Entity>` - Entity
- `[<Entity>]` - List of Entities
- `<Entity (includes subentity:<AnotherEntity>)>` - Entity with included *subentity* (of type AnotherEntity).

## Entities

### User
```
{
  "id": 1,
  "name": "Vasyl Pupkin",
  "email": "user@example.com",
  "phone": "+380123456789",
  "code": "0987654321"
}
```

## Meta
Metainformation:
```
{
  "page": 1,
  "perpage": 10,
  "pages": 11,
  "count": 103 
}
```

## Globals
Each request should use this headers:
X-Key: `<Unique Outlet Key>`
Content-Type: application/json

## Resources

### Users

#### Index
Request:
```
GET /users{?name}{?email}{?phone}{?code}
```

Response:
```
{
  "meta": <Meta>,
  "data": [<User>]
}
```

#### Show
Request:
```
GET /users/:id
```

Response: 200
```
<User>
```

#### Create
Request:
```
POST /users

Body:
<User>
```

Response: 201
```
<User>
```

#### Update
Request:
```
PUT /users/:id

Body:
<User>
```

Response: 200
```
<User>
```

#### Delete
Request:
```
DELETE /users/:id
```

Response: 200

### User Operations

#### Index

### Operations

#### Index
#### Show
#### Create

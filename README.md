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

### Outlet
Shop or department
```
{
  "name": "Rainbow Shop",
  "address": "Soborna 75, 3"
}
```

### User
User can obtain bonuses for each company
```
{
  "id": 1,
  "name": "Vasyl Pupkin",
  "email": "user@example.com",
  "phone": "+380123456789",
  "code": "0987654321",
  "bonuses": 123
}
```

### Operation
```
{
  "id": 2,
  "bonuses": -12,
  "reason": "Info for user",
  "info": "Info for trader",
  "created_at": "1985-04-12T23:20:50.52Z"
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
Request:
```
GET /users/:id/operations{?reason}{?info}{?createdFrom}{?createdTo}
```

Response:
```
{
  "meta": <Meta>,
  "data": [<Operation (includes outlet:Outlet)>]
}
```

### Operations

#### Index
Request:
```
GET /operations{?reason}{?info}{?createdFrom}{?createdTo}
```

Response:
```
{
  "meta": <Meta>,
  "data": [<Operation (includes outlet:Outlet)>]
}
```

#### Show
Request:
```
GET /operations/:id
```

Response: 200
```
<Operation include Outlet>
```

#### Create
Request:
```
POST /operations

Body:
<Operation>
```

Response: 201
```
<Operation (includes outlet:Outlet)>
```

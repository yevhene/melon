# Melon.PointAPI

## Rules
- All date/time fields formatted according to `RFC 3339`;
- All texts use Markdown format;
- All money related values measured in minor units (like `cents`).

## Definitions
- `<Entity>` - Entity
- `[<Entity>]` - List of Entities
- `<Entity (includes subentity:<AnotherEntity>)>` - Entity with included *subentity* (of type AnotherEntity).

## Entities

### Point
Shop or department
```
{
  "name": "Rainbow Shop",
  "address": "Soborna 75, 3"
}
```

### Customer
Customer can obtain melones for each company
```
{
  "id": 1,
  "name": "Vasyl Pupkin",
  "email": "customer@example.com",
  "phone": "+380123456789",
  "code": "0987654321",
  "melones": 123
}
```

### Operation
```
{
  "id": 2,
  "melones": -12,
  "reason": "Info for customer",
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
X-Key: `<Unique Point Key>`
Content-Type: application/json

## Resources

### Customers

#### Index
Request:
```
GET /customers{?name}{?email}{?phone}{?code}
```

Response:
```
{
  "meta": <Meta>,
  "data": [<Customer>]
}
```

#### Show
Request:
```
GET /customers/:id
```

Response: 200
```
<Customer>
```

#### Create
Request:
```
POST /customers

Body:
<Customer>
```

Response: 201
```
<Customer>
```

#### Update
Request:
```
PUT /customers/:id

Body:
<Customer>
```

Response: 200
```
<Customer>
```

#### Delete
Request:
```
DELETE /customers/:id
```

Response: 200

### Customer Operations

#### Index
Request:
```
GET /customers/:id/operations{?reason}{?info}{?createdFrom}{?createdTo}
```

Response:
```
{
  "meta": <Meta>,
  "data": [<Operation (includes point:Point)>]
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
  "data": [<Operation (includes point:Point)>]
}
```

#### Show
Request:
```
GET /operations/:id
```

Response: 200
```
<Operation include Point>
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
<Operation (includes point:Point)>
```

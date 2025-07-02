# Interface Definition

## Public APIs
- GET /api/example → {data}
- POST /api/example → {id, created}

## Functions Exported
- processData(input) → Promise<Result>
- validateInput(data) → boolean

## Dependencies
- Database connection required
- Redis cache available

## Environment
- PORT=3000
- DATABASE_URL required
- REDIS_URL optional
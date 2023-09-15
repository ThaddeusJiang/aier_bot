# AierBot

**TODO: Add description**

## Build with

- [Elixir](https://elixir-lang.org/)
- [ex_gram](https://github.com/rockneurotiko/ex_gram)

## Usage

```

```

## Development

```
mix deps.get

export TELEGRAM_BOT_TOKEN=
mix run --no-halt
```

## Deployment

```
fly secrets set TELEGRAM_BOT_TOKEN=

fly deploy --remote-only
```

## CI/CD

GitHub Actions

Secrets:

- `FLY_API_TOKEN`

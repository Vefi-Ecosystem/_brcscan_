import Config

# Configure your database
config :explorer, Explorer.Repo,
  database: "explorer_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  # Default of `5_000` was too low for `BlockFetcher` test
  ownership_timeout: :timer.minutes(7),
  timeout: :timer.seconds(60),
  queue_target: 1000

# Configure API database
config :explorer, Explorer.Repo.Replica1, timeout: :timer.seconds(80)

# Configure Account database
config :explorer, Explorer.Repo.Account, timeout: :timer.seconds(80)

config :explorer, Explorer.Tracer, env: "dev", disabled?: true

config :logger, :explorer,
  level: :debug,
  path: Path.absname("logs/dev/explorer.log")

config :logger, :reading_token_functions,
  level: :debug,
  path: Path.absname("logs/dev/explorer/tokens/reading_functions.log"),
  metadata_filter: [fetcher: :token_functions]

config :logger, :token_instances,
  level: :debug,
  path: Path.absname("logs/dev/explorer/tokens/token_instances.log"),
  metadata_filter: [fetcher: :token_instances]

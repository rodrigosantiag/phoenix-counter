import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :counter_by_myself, CounterByMyselfWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "yndRiST7lCqr3ANVBeflcc7Lp9sMAu1V5+glhVMdO2B0drkgpvlWZxiML6CcAJMv",
  server: false

# In test we don't send emails
config :counter_by_myself, CounterByMyself.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

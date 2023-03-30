import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :locales, LocalSampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "AXrlgTryRIpLX5m6lKlDwmkDux/9/BnA5mEPCbymQoQFDjBO3HuvAZ9ZYYnxPOTl",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

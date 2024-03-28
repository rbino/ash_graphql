defmodule AshGraphql.Test.RelayIds.Domain do
  @moduledoc false

  use Ash.Domain,
    extensions: [
      AshGraphql.Domain
    ],
    otp_app: :ash_graphql

  resources do
    registry(AshGraphql.Test.RelayIds.Registry)
  end
end

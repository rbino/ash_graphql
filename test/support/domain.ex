defmodule AshGraphql.Test.Domain do
  @moduledoc false

  use Ash.Domain,
    extensions: [
      AshGraphql.Domain
    ],
    otp_app: :ash_graphql

  resources do
    registry(AshGraphql.Test.Registry)
  end
end

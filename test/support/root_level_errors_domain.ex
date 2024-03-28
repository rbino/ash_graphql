defmodule AshGraphql.Test.RootLevelErrorsDomain do
  @moduledoc false

  use Ash.Domain,
    extensions: [
      AshGraphql.Domain
    ],
    otp_app: :ash_graphql

  graphql do
    root_level_errors? true
  end

  resources do
    registry(AshGraphql.Test.Registry)
  end
end

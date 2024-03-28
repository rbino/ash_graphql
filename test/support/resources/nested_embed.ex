defmodule AshGraphql.Test.NestedEmbed do
  @moduledoc false

  use Ash.Resource,
    domain: AshGraphql.Test.Domain,
    data_layer: :embedded,
    extensions: [AshGraphql.Resource]

  graphql do
    type :nested_embed
  end

  attributes do
    attribute(:name, :string)
    attribute(:enum, AshGraphql.Test.NestedEnum)
  end
end

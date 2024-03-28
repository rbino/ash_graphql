defmodule AshGraphql.Test.Channel do
  @moduledoc false

  use Ash.Resource,
    domain: AshGraphql.Test.Domain,
    data_layer: Ash.DataLayer.Ets,
    extensions: [AshGraphql.Resource]

  require Ash.Query

  graphql do
    type :channel

    queries do
      get :channel, :read
    end
  end

  actions do
    create :create do
      primary?(true)
    end

    read(:read, primary?: true)

    update(:update, primary?: true)

    destroy(:destroy, primary?: true)
  end

  attributes do
    uuid_primary_key(:id)

    create_timestamp(:created_at, public?: true)
  end

  calculations do
    calculate(
      :direct_channel_messages,
      {:array, AshGraphql.Test.MessageUnion},
      fn record,
         %{
           domain: domain
         } ->
        record = domain.load!(record, :messages)

        {:ok,
         record.messages
         |> Enum.map(
           &%Ash.Union{type: AshGraphql.Test.MessageUnion.struct_to_name(&1), value: &1}
         )}
      end
    )

    calculate :indirect_channel_messages,
              AshGraphql.Test.PageOfChannelMessages,
              AshGraphql.Test.PageOfChannelMessagesCalculation do
      argument :offset, :integer do
        default(0)
      end

      argument :limit, :integer do
        default(10)
      end
    end
  end

  aggregates do
    count(:channel_message_count, :messages)
  end

  relationships do
    has_many(:messages, AshGraphql.Test.Message)
  end
end

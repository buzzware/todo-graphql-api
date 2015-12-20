TodoType = GraphQL::ObjectType.define do
  name "Todo"
  description "A task to be completed"

  field :id, types.ID
  field :title, types.String
  field :completed, types.Boolean
end

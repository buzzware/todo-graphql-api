QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :todos do
    type !types[!TodoType]

    resolve -> (obj, args, ctx) do
      Todo.all
    end
  end

  field :todo do
    type TodoType
    argument :id, !types.ID, "The ID of the todo"

    resolve -> (obj, args, ctw) do
      Todo.find(args[:id])
    end
  end
end

require "rails_helper"

describe "todos", type: :request do
  let!(:todo) { Todo.create!(title: "Buy Milk", completed: false) }

  it "fetches all todos" do
    get graph_path(query: "query { todos { id title }}")
    response_body = JSON.parse(response.body)

    expect(response_body).to eq({
      "data" => {
        "todos" => [
          "id" => todo.id.to_s,
          "title" => todo.title
        ]
      }
    })
  end

  it "fetches a single todo" do
    get graph_path(query: "query { todo(id: #{todo.id}) { id title }}")
    response_body = JSON.parse(response.body)

    expect(response_body).to eq({
      "data" => {
        "todo" => {
          "id" => todo.id.to_s,
          "title" => todo.title
        }
      }
    })
  end
end

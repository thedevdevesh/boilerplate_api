require 'rails_helper'

RSpec.describe "Tasks API", type: :request do
  let!(:tasks) { create_list(:task, 5) }
  let(:task_id) { tasks.first.id }

  describe "GET /tasks" do
    it "returns all tasks" do
      get "/tasks"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe "GET /tasks/:id" do
    it "returns the task" do
      get "/tasks/#{task_id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(task_id)
    end
  end

  describe "POST /tasks" do
    it "creates a task" do
      post "/tasks", params: { task: { title: "New Task", description: "Test", status: "open" } }
      expect(response).to have_http_status(:created)
    end
  end
end

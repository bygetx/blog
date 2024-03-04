require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:user) { create(:user) }
  let(:credentials) { Base64.strict_encode64("#{user.email}:#{user.password}") }
  let(:article_params) { attributes_for(:article) }
  let(:article_stubbed) {build_stubbed(:article)}
  describe "Api call", type: :request do
    it "returns 201 response" do
      post api_v1_articles_url, params: { article: article_params }, headers: { "Authorization": "Basic #{credentials}" }
      expect(response.status).to eq(201)
    end

    it "returns 200 response" do
      get api_v1_articles_url, headers: { "Authorization": "Basic #{credentials}" }
      expect(response.status).to eq(200)
    end
  end
end

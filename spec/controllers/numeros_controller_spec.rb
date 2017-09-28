require 'rails_helper'

RSpec.describe NumerosController, type: :controller do
  describe 'GET #show' do
    it 'recebe um número e retorna uma string' do
      get :show, format: :json, params: { id: 10 }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['frase']).to eq('ten')
      expect(response).to have_http_status(200)
    end

    it 'recebe uma string que não é um número' do
      get :show, format: :json, params: { id: 'NaN' }
      expect(response).to have_http_status(400)
    end

    it 'recebe um número grande demais' do
      get :show, format: :json, params: { id: '9999999999999999991' }
      expect(response).to have_http_status(400)
    end

  end
end

require 'spec_helper'

describe SoundsController, :signed_in do
  let(:sound) { create(:sound) }

  describe '#show' do
    it 'is successful' do
      get :show, id: sound.id
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:file_upload) { generate(:file_upload) }
    let(:sound_attrs) { attributes_for(:sound) }

    let(:params) do
      {sound: sound_attrs.merge(file: file_upload)}
    end

    it 'creates a Sound' do
      expect do
        post :create, params
      end.to change(Sound, :count).by(1)
    end

    it 'creates an Upload' do
      expect do
        post :create, params
      end.to change(Upload, :count).by(1)
    end

    it 'responds 201 created' do
      post :create, params
      expect(response.status).to be(201)
    end

    it 'responds 400 with invalid parameters' do
      params[:sound].delete(:title)
      post :create, params
      expect(response.status).to be(400)
    end
  end
end

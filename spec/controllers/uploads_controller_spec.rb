require 'spec_helper'

describe UploadsController, :signed_in do
  describe '#new' do
    it 'assigns a new upload' do
      get :new
      expect(assigns[:upload]).to be_an(Upload)
    end
  end

  describe '#create' do
    let(:file_upload)   { generate(:file_upload) }
    let(:sound_params)  { attributes_for(:sound) }
    let(:upload_params) { attributes_for(:upload).except(:sha1) }

    let(:params) do
      {upload: upload_params.merge(sound: sound_params, file: file_upload)}
    end

    it 'creates an Upload' do
      expect do
        post :create, params
      end.to change(Upload, :count).by(1)
    end

    it 'creates a Sound' do
      expect do
        post :create, params
      end.to change(Sound, :count).by(1)
    end

    it 'redirects to the uploads page' do
      post :create, params
      expect(response).to redirect_to(uploads_path)
    end

    it 'assigns errors if the upload is invalid' do
      sound_params.delete(:title)

      post :create, params
      expect(assigns[:errors]).to include('Sound title is not present')
    end
  end
end

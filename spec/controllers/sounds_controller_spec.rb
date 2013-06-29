require 'spec_helper'

describe SoundsController, :signed_in do
  describe '#show' do
    let(:sound) { create(:sound) }

    it 'assigns @sound' do
      get :show, id: sound.id
      expect(assigns[:sound]).to eq(sound)
    end

    it 'assigns @upload' do
      get :show, id: sound.id
      expect(assigns[:upload]).to eq(sound.upload)
    end
  end

  describe '#new' do
    it 'assigns a new sound' do
      get :new
      expect(assigns[:sound]).to be_a(Sound)
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

    it 'redirects to the uploads page' do
      post :create, params
      expect(response).to redirect_to(uploads_path)
    end
  end
end

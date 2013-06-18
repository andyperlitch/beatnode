require 'spec_helper'

describe SoundsController, :signed_in do
  describe '#new' do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'assigns a new sound belonging to the viewer' do
      get :new
      expect(assigns[:sound].uploader).to eq(viewer)
    end
  end

  describe '#create' do
    let(:params) { {sound: {title: 'A title'}} }

    it 'creates a sound' do
      expect do
        post :create, params
      end.to change(Sound, :count).by(1)
    end

    it 'sets attributes' do
      post :create, params
      expect(Sound.last.title).to eq('A title')
    end

    it 'adds the uploaded sound to the users crate' do
      post :create, params
      expect(viewer.crate).to include(Sound.last)
    end

    it 'protects against mass assignment on uploader_id' do
      other_user = create(:user)
      post :create, params.merge(uploader_id: other_user.id)
      expect(Sound.last.uploader).to eq(viewer)
    end

    it 'redirects to the uploads page' do
      post :create, params
      expect(response).to redirect_to(uploads_path)
    end

    it 're-renders the new action if there are errors' do
      post :create, {sound: {title: ''}}
      assert_template :new
    end
  end

  describe '#show' do
    let(:sound) { create(:sound) }

    it 'assigns @sound' do
      get :show, id: sound.id
      expect(assigns[:sound]).to eq(sound)
    end
  end
end

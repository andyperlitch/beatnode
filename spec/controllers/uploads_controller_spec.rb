require 'spec_helper'

describe UploadsController, :signed_in do
  describe '#create' do
    let(:location)      { '/user/sound.mp3' }
    let(:sound_params)  { attributes_for(:sound) }
    let(:upload_params) { attributes_for(:upload) }

    let(:params) do
      {upload: upload_params.merge(sound: sound_params)}
    end

    it 'calls Upload#create_for with parameters' do
      Upload.should_receive(:create_for).
        with(viewer, upload_params.stringify_keys,
                     sound_params.stringify_keys)

      post :create, params
    end

    it 'creates an upload' do
      expect do
        post :create, params
      end.to change(Upload, :count).by(1)
    end
  end
end

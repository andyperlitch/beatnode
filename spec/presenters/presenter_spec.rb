require 'spec_helper'

describe Presenter do
  describe 'json' do
    it 'delegates to #values' do
      object = double(values: [1, 2, 3])
      pres   = Presenter.new(object)

      expect(pres.json).to eq([1, 2, 3])
    end
  end
end

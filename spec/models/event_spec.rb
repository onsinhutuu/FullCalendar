require 'rails_helper'

RSpec.describe 'Eventモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
  	let(:event) { create(:event) }
  	let(:event2) { create(:event) }
    subject { event.valid? }
    context 'titleカラム' do
      it '空欄ではないこと' do
        event.title = ''
        is_expected.to eq false
      end
      it '空欄ではないこと' do
        event2.title = ''
        is_expected.to eq true
      end
    end
    context 'bodyカラム' do
      it '空欄ではないこと' do
        event.body = ''
        is_expected.to eq false
      end
      it '空欄ではないこと' do
        event2.body = ''
        is_expected.to eq true
      end
    end
    context 'start_dateカラム' do
      it '空欄ではないこと' do
        event.start_date = ''
        is_expected.to eq false
      end
      it '空欄ではないこと' do
        event2.start_date = ''
        is_expected.to eq true
      end
    end
    context 'end_dateカラム' do
      it '空欄ではないこと' do
        event.end_date = ''
        is_expected.to eq false
      end
      it '空欄ではないこと' do
        event2.end_date = ''
        is_expected.to eq true
      end
    end
  end
end
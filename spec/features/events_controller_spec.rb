require 'rails_helper'
RSpec.describe 'Eventscontrollerのテスト', js: true, type: :feature do
	describe '投稿のテスト' do
		let(:event) { create(:event) }
		describe 'サイドバーのテスト' do
			context '表示の確認' do
				it '次月ボタンで遷移できるか' do
					visit events_path
					click_on '次月'
					expect(page).to have_content '2020年 12月'
				end
				it '前月ボタンで遷移できるか' do
					visit events_path
					click_on '前月'
					expect(page).to have_content '2020年 10月'
				end
				it 'newページへ遷移できるか' do
					visit events_path
					find('.fc-left').click
					expect(current_path).to eq('/events/new')
				end
				it 'カレンダーに戻ると表示される' do
			  	visit new_event_path
		    	expect(page).to have_content 'カレンダーに戻る'
			  end
				it '投稿に成功する' do
					visit new_event_path
					fill_in "event[title]", with: Faker::Lorem.characters(number: 10)
		      fill_in 'event[body]', with: Faker::Lorem.characters(number: 20)
		      click_button '追加'
		      expect(page).to have_content 'イベントが追加されました'
		    end
		    it '投稿に失敗する' do
		    	visit new_event_path
			  	click_button '追加'
			  	expect(page).to have_content 'を入力してください'
			  	expect(current_path).to eq('/events')
				end
			end
		end
		describe '編集のテスト' do
			context '表示の確認' do
				before do
					visit edit_event_path(event)
				end
				it 'title編集フォームが表示される' do
					expect(page).to have_field 'event[title]', with: event.title
				end
				it 'body編集フォームが表示される' do
					expect(page).to have_field 'event[body]', with: event.body
				end
				it '詳細に戻るリンクが表示される' do
					expect(page).to have_link '詳細に戻る', href: event_path(event)
				end
				it 'カレンダーに戻るリンクが表示される' do
					expect(page).to have_link 'カレンダーに戻る', href: events_path
				end
			end
			context 'フォームの確認' do
				it '編集に成功する' do
					visit edit_event_path(event)
					click_button '追加'
					expect(page).to have_content 'イベントが更新されました'
					expect(current_path).to eq '/events/' + event.id.to_s
				end
				it '編集に失敗する' do
					visit edit_event_path(event)
					fill_in 'event[title]', with: ''
					click_button '追加'
					expect(page).to have_content 'を入力してください'
					expect(current_path).to eq '/events/' + event.id.to_s
				end
			end
		end
		describe '詳細画面のテスト' do
			before do
				visit event_path(event)
			end
			context '投稿画面の遷移' do
	  	  it '編集画面へ遷移できる' do
		  		click_on '編集する'
		  		expect(current_path).to eq('/events/' + event.id.to_s + '/edit')
		  	end
		  	it '投稿を削除できる' do
					click_on '削除する'
					expect { event.destroy }.to change{ Event.count }.by(-1)
				end
		  end
	  	context '投稿詳細画面の表示を確認' do
	  		it '投稿のtitleが表示される' do
	  			visit event_path(event)
	  			expect(page).to have_content event.title
	  		end
	  		it '投稿のbodyが表示される' do
	  			expect(page).to have_content event.body
	  		end
	  	end
	  	context '自分の投稿詳細画面の表示を確認' do
	  		it '投稿の編集リンクが表示される' do
	  			expect(page).to have_link '編集する', href: edit_event_path(event)
	  		end
	  		it '投稿の削除リンクが表示される' do
	  			expect(page).to have_link '削除する', href: event_path(event)
	  		end
	  		it 'カレンダーに戻るリンクが表示される' do
					expect(page).to have_link 'カレンダーに戻る', href: events_path
				end
	  	end
  	end
  	describe '一覧画面のテスト' do
  		let!(:event) { create(:event) }
	  	before do
	  		visit events_path
	  	end
	  	context '表示の確認' do
	  		it 'イベントを追加と表示される' do
	  			expect(page).to have_content 'イベントを追加'
	  		end
	  		it 'イベントが表示される' do
	  			expect(page).to have_content event.title
	  			expect(page).to have_content '08:13'
	  		end
	  	end
  	end
	end
end
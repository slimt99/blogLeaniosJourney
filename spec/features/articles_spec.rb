require 'rails_helper'
require 'spec_helper'

RSpec.feature "Articles", type: :feature do
  let(:user) { create(:user) }
  describe "GET /" do

    before do
      login_as(user)
    end
    
    context "from login user" do
      it "should return 200: OK" do 

        visit articles_path
        expect(page).to have_content('Leanios Internship Journey')
      end
    end

    it 'creates a new article' do
      visit 'articles/new'

      within("#article-form") do
        fill_in 'article[title]', with: 'test one'
        fill_in 'article[body]', with: 'this is a testing article'
        select 'public', from: 'article[status]'
        check 'article[published_on_Leanios]'
      end

      click_on 'Create Article'

      expect(Article.last.title).to eq("test one")
      expect(Article.last.body).to eq("this is a testing article")
      expect(Article.last.status).to eq("public")
      expect(Article.last.published_on_Leanios).to be true
    end
    it 'prevents article creation when title doesnt exist' do
      visit 'articles/new'

      within("#article-form") do
        fill_in 'article[body]', with: 'this is a testing article'
        select 'public', from: 'article[status]'
        check 'article[published_on_Leanios]'

        click_on 'Create Article'
         expect(page).to have_text("Title can't be blank")

      end

    end

    it 'prevents article creation when body doesnt exist' do
      visit 'articles/new'

      within("#article-form") do
        fill_in 'article[title]', with: 'test one'
        select 'public', from: 'article[status]'
        check 'article[published_on_Leanios]'

        click_on 'Create Article'
         expect(page).to have_text("Body can't be blank")
      end

    end
    it 'prevents article creation when body respect the minimun number characters' do
      visit 'articles/new'

      within("#article-form") do
        fill_in 'article[title]', with: 'test one'
        fill_in 'article[body]', with: 'hey !'
        select 'public', from: 'article[status]'
        check 'article[published_on_Leanios]'

        click_on 'Create Article'
         expect(page).to have_text("Body is too short (minimum is 10 characters)")
      end

    end

  end

end
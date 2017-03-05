require 'rails_helper'

describe 'navigate' do 
  before do
    @sal = Sal.create(name: "Fantasy")
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit sals_path
      expect(page.status_code).to eq(200)
    end

    it 'renders the list of sals' do
      Sal.create(name: "sea")
      visit sals_path
      expect(page).to have_content(/Fantasy|sea/)
    end

    xit 'each sal links to its show page' do
      visit sals_path
      expect(page).to have_link(@sal.name, href: sal_path(@sal))
    end
  end
end
require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading) { "Sample app" }
    let(:page_title) { "" }
    it { should_not have_title('| Home') }

    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      expect(page).to have_title(full_title('About Us'))
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
      click_link "Contact"
      expect(page).to have_title(full_title('Contact'))
      click_link "Home"
      expect(page).to have_content('Sample App')
      click_link "Sign up now!"
      expect(page).to have_title(full_title('Sign up'))
      click_link "sample app"
      expect(page).to have_content('Sample App')
    end
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading) { "Help" }
    let(:page_title) { "Help" }
  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { "About" }
    let(:page_title) { "About" }
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading) { "Contact" }
    let(:page_title) { "Contact" }
  end

end
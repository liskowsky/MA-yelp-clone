feature 'reviewing' do
  before { Restaurant.create name: 'KFC', description: 'Deep fried goodness' }

  scenario 'allows users to leave a review using a form' do
    sign_up
    visit '/restaurants'
    leave_review(name: 'KFC')

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'does not allow user to review the same place twice' do
    sign_up
    leave_review(name: 'KFC')

    visit '/restaurants'
    click_link 'Review KFC'
    expect(page).to have_content 'You have already reviewed KFC!'
  end
end

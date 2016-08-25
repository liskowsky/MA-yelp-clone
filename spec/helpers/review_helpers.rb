def leave_review(name: 'KFC', thoughts: 'so so', rating: '3')
  click_link "Review #{name}"
  fill_in "Thoughts", with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end

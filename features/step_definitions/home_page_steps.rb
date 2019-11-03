Given('I am an any user') do
end

Given('There are published advertisements') do
  @published_ads = FactoryBot.create_list(:advertisement, 10)
end

Given('There are hidden advertisements') do
  @hidden_ads = FactoryBot.create_list(:hidden_advertisement, 10)
end

When('I visit home page') do
  visit('/')
end

Then('I must see only published advertisements') do
  @published_ads.each do |adver|
    expect(page).to have_content adver.image
  end
end

Then("I mustn't see any of hidden advertisements") do
  @hidden_ads.each do |adver|
    expect(page).not_to have_content adver.image
  end
end

Then('Fresh advertisements showed first by default') do
  published_ads = Advertisement.where(status: :published).order(updated_at: :desc)

  published_ads.reverse_each.each_cons(2) do |prev_ad, next_ad|
    raise("Fresh advertisements don't appear first") \
         if page.body.index(prev_ad.image) < page.body.index(next_ad.image)
  end
end

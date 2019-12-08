User.create(
  email: 'user@mail.ru',
  nickname: 'apivchenko',
  first_name: 'Aleksey',
  last_name: 'Pivchenko',
  password: '12345',
  role_id: Role.find_or_create_by(name: 'user').id
)

User.create(
  email: 'admin@gmail.com',
  nickname: 'ahalavin',
  first_name: 'Artsiom',
  last_name: 'Halavin',
  password: '1234455',
  role_id: Role.find_or_create_by(name: 'administrator').id
)

@user = User.find_by(nickname: 'apivchenko')
@adver_type = AdverType.create(name: 'animals')

STATUSES = HIDDEN_STATUSES + [:published]
STATUSES.each do |status|
  Advertisement.create!(
    title: "#{@user.first_name}'s #{status} advertisement",
    description: "#{@user.first_name}'s beautiful capybara",
    status: status,
    user_id: @user.id,
    adver_type_id: @adver_type.id
  )
end

Advertisement.all.each do |adver|
  adver.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'capybara.jpg')), filename: 'capybara.jpg', content_type: 'image/jpg')
end

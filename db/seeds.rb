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
  role_id: Role.find_or_create_by(name: 'admin').id
)

user = User.find_by(nickname: 'apivchenko')

HIDDEN_STATUSES.each do |status|
  Advertisement.create!(
    title: "#{user.first_name}'s #{status} advertisement",
    description: "#{user.first_name}'s #{status} advertisement",
    status: status,
    user_id: user.id
  )
end

Advertisement.create!(
  title: "#{user.first_name}'s published advertisement",
  description: "#{user.first_name}'s published advertisement",
  status: :published,
  user_id: user.id
)

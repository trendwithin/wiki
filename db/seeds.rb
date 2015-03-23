users = %w{grapeape hongkongfooey scoobydoo underdog bullwinkle}.map do |name|
  u = User.new(
    email: "#{name}@cartoon.com",
    password: '123ABC',
    password_confirmation: '123ABC')
  u.save!(validate: false)
  u
end

titles = [
  'What cereal goes best with saturday morning cartoons?',
  'How many bowls of cereal can you eat?',
  'Watching Halloween specials eating BooBerry',
  'Have you ever played scrabble with Alpha Bits?'
]

pages = []
titles.each_with_index do |t, i|
  p = users[i].pages.new(title: t, body: '')
  p.save
  pages << p
end

pages.each do |p|
  users.sample(4).each do |u|
    p.update(body: "Cap'n Crunch, Honey Nut Cherrios" * 10)
    u.pages << p
  end
end

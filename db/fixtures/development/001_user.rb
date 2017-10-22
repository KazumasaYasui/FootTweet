10.times do |i|
  User.seed_once(:id) do |user|
    user.id = i+1
    user.username = "#{i+1}番さん"
    user.email = "#{i+1}@abc"
    user.profile = "私は#{i+1}番と申します。"
    user.password = 111101+i
    user.password_confirmation = 111101+i
  end
end
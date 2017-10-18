1000.times do |i|
  Post.seed_once(:id) do |post|
    post.id = i+1
    post.user_id = rand(1..50)
    post.body = "#{i+1}番目のコメントです"
  end
end
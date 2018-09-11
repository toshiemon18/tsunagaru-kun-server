# InsomniaやiOSアプリ等で、HTTPヘッダに
#   uid: kiyoshi@takaomi.com
#   client: sample
#   access-token: sampletoken
# をセットするとkiyoshiで認証される

unless User.exists?(name: 'kiyoshi')
  user = User.create(name: 'kiyoshi', email: 'kiyoshi@takaomi.com', password: 'kiyoshi1234')
  user.tokens = {
    sample: {
      token: BCrypt::Password.create('sampletoken'),
      expiry: (Time.now + 1.year).to_i
    }
  }
end

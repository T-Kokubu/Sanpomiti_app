Prefecture.create! (
  [
    {
      id: 1,
      name: "茨城"
    },
    {
      id: 2,
      name: "埼玉"
    },
    {
      id: 3,
      name: "千葉"
    },
    {
      id: 4,
      name: "東京"
    },
    {
      id: 5,
      name: "神奈川"
    }
  ]
)

User.create!(
  [
    {
      email: "test1@test.com",
      name: "テスト1",
      password: "123456",
      password_confirmation: "123456",
      prefecture_id: 1
    },
    {
      email: "test2@test.com",
      name: "テスト2",
      password: "123456",
      password_confirmation: "123456",
      prefecture_id: 2
    },
    {
      email: "test3@test.com",
      name: "テスト3",
      password: "123456",
      password_confirmation: "123456",
      prefecture_id: 3
    },
    {
      email: "test4@test.com",
      name: "テスト4",
      password: "123456",
      password_confirmation: "123456",
      prefecture_id: 4
    },
    {
      email: "test5@test.com",
      name: "テスト5",
      password: "123456",
      password_confirmation: "123456",
      prefecture_id: 5
    }
  ]
)

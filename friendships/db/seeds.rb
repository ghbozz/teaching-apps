User.destroy_all
Friendship.destroy_all

User.create(email: 'romain@lewagon.org', password: 'mdpmdp')
User.create(email: 'boris@lewagon.org', password: 'mdpmdp')
User.create(email: 'seb@lewagon.org', password: 'mdpmdp')

Friendship.create(sender: User.first, receiver: User.second, accepted: true)
Friendship.create(sender: User.first, receiver: User.third)
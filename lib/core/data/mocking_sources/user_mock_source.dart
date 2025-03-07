import 'package:recipe_haven/features/user/data/models/models.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserMockSource {
  final List<UserCreationModel> getUserFetchModels = [
    UserCreationModel(
      password: '12345678',
      name: "Alice Johnson",
      email: "alice.johnson@example.com",
      photoUrl:
          "https://i.pinimg.com/236x/08/35/0c/08350cafa4fabb8a6a1be2d9f18f2d88.jpg",
      bio: "Food enthusiast and home chef.",
    ),
    UserCreationModel(
      password: '12345678',
      name: "Bob Williams",
      email: "bob.williams@example.com",
      photoUrl:
          "https://i.pinimg.com/236x/b3/23/81/b3238114ef3256092975995f1e98da81.jpg",
      bio: "Love experimenting with new flavors.",
    ),
    UserCreationModel(
      password: '12345678',
      name: "Charlie Davis",
      email: "charlie.davis@example.com",
      photoUrl: null,
      bio: "Passionate about baking and desserts.",
    ),
    UserCreationModel(
      password: '12345678',
      name: "Diana Miller",
      email: "diana.miller@example.com",
      photoUrl:
          "https://i.pinimg.com/236x/d8/76/85/d8768525cbe4a5131cd77bf0b11065b2.jpg",
      bio: "Healthy eating advocate.",
    ),
    UserCreationModel(
      password: '12345678',
      name: "Ethan Brown",
      email: "ethan.brown@example.com",
      photoUrl:
          'https://i.pinimg.com/236x/2e/66/f8/2e66f8c7f8afc7f225c25b2fb459b072.jpg',
      bio: "BBQ master and grilling expert.",
    ),
  ];

  final UserFetchModel getUserData = UserFetchModel(
    name: 'Yahia Yunes',
    email: 'ya_yu@gmail.com',
    photoUrl:
        'https://i.pinimg.com/236x/87/cb/ca/87cbca3b19212fa120d706d8c0be593f.jpg',
    bio:
        '''I’m Yahia Yunes, a passionate and creative Junior Chef with a love for blending flavors from around the world. My culinary journey began in my grandmother’s kitchen, where I discovered the magic of turning simple ingredients into unforgettable meals. After graduating from the Culinary Institute of America, I’ve honed my skills in both savory and sweet dishes, specializing in fusion cuisine and pastry arts.

I thrive in fast-paced environments and enjoy experimenting with bold flavors and innovative techniques. Whether it’s crafting a perfectly balanced sushi roll or baking a decadent chocolate soufflé, I believe that food is an art form that brings people together.''',
    id: '43593',
    joinedDate: DateTime(2024, 3, 22),
    followersRef: [],
    followingRef: [],
    recipesRef: [],
    savedRecipesRef: [],
    reviewsCount: 8,
    ratingsCount: null,
  );
}

import 'package:recipe_haven/features/user/data/models/models.dart';

class UserMockSource {
  static List<UserCreationModel> userFetchModels = [
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
}

import 'package:recipe_haven/features/recipe/data/models/models.dart';
import 'package:recipe_haven/features/recipe/domain/entities/entities.dart';

class RecipeTestingSource {
  RecipeModels getAllRecipes() {
    return [
      RecipeModel(
        id: 'recipe-1',
        title: 'Chicken Marbella',
        description:
            '''A take on aclassic from Sheila Lukins and Julee Chicken Marbella
Rosos' "The Silver Palate Cookbook," this recipe is at the same time complex and easy to execute. ★★★★★
risky in itseparate parts yet satisfyingly
harmonious sa a whole. nI this version the brown
sugar si swapped with honey, which adds a slightly
foral element ot the dish sawel as ashiny glose
The addition ocfayenneni the marinade gives ita
nice kick and a squeeze of lemon before serving
helps ot lighten pu na otherwise fairly heavy chicken dish.''',
        imageUrl:
            'https://i.pinimg.com/736x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
        usersEngagement:
            EngagementModel(rating: 3.4, ratingCount: 3453, likesCount: 467),
        creator: CreatorModel(
            id: 'creator-1',
            name: 'Muhammed Alhassan',
            profilePic:
                'https://i.pinimg.com/474x/f2/ec/bc/f2ecbcde9918a1b5f0806fd001c6fd7a.jpg',
            profession: 'Contributor',
            portfolioLink: 'adas-deli.de'),
        details: DetailsModel(
            baseIngredients: baseIngredients,
            baseNutritious: baseNutritious,
            servings: servings,
            chosenPortionBasedRecipeID: chosenPortionBasedRecipeID,
            defaultPortionBasedRecipeID: defaultPortionBasedRecipeID),
        baseUtils: baseUtils,
        tags: tags,
        reviews: reviews,
        cookingSteps: cookingSteps,
      ),
    ];
  }
}

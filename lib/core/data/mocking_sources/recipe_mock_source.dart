import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
import 'package:recipe_haven/features/recipe_review/data/models/sub_review_model.dart';
import 'package:recipe_haven/features/view_recipe/data/models/details/measuring_unit_model.dart';
import 'package:recipe_haven/features/view_recipe/data/models/models.dart';
import 'package:recipe_haven/features/view_recipe/enums/recipe_step_font_size.dart';

class RecipeMockSource {
  final getAllRecipes = [
    RecipeModel(
      id: 'recipe-1',
      title: 'Chicken Marbella',
      description:
          'A take on a classic from Sheila Lukins and Julee Chicken Marbella Rosos\' "The Silver Palate Cookbook", this recipe is at the same time complex and easy to execute. Risky in its separate parts yet satisfyingly harmonious as a whole. In this version, the brown sugar is swapped with honey, which adds a slightly floral element to the dish as well as a shiny gloss. The addition of cayenne in the marinade gives it a nice kick and a squeeze of lemon before serving helps to lighten up an otherwise fairly heavy chicken dish.',
      imageUrl:
          'https://i.pinimg.com/736x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
      usersEngagement: EngagementModel(
        rating: 3.4,
        ratingCount: 3453000,
        likesCount: 467,
      ),
      userData: CreatorModel(
        id: 'creator-1',
        name: 'Muhammed Alhassan',
        profilePic:
            'https://i.pinimg.com/474x/f2/ec/bc/f2ecbcde9918a1b5f0806fd001c6fd7a.jpg',
        profession: 'Contributor',
        portfolioLink: 'adas-deli.de',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'knife'),
        UtensilModel(id: 'ute-2', name: 'cutting board'),
        UtensilModel(id: 'ute-3', name: 'bowl'),
        UtensilModel(id: 'ute-4', name: 'baking dish'),
        UtensilModel(id: 'ute-5', name: 'whisk'),
        UtensilModel(id: 'ute-6', name: 'food thermometer'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'whole chickens',
            baseUnit: MeasuringUnitModel(name: 'kilogram', abbreviation: 'kg'),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'prunes',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'jarred pitted green olives',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'garlic',
            baseUnit: MeasuringUnitModel(
              name: 'clovers',
              abbreviation: 'clovers',
            ),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'capers',
            baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp'),
          ),
          IngredientModel(
            id: 'ing-6',
            name: 'dried oregano',
            baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp'),
          ),
          IngredientModel(id: 'ing-7', name: 'bay leaves'),
          IngredientModel(
            id: 'ing-8',
            name: 'chili powder',
            baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-9',
            name: 'honey',
            baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp'),
          ),
          IngredientModel(
            id: 'ing-10',
            name: 'salt',
            baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp'),
          ),
          IngredientModel(
            id: 'ing-11',
            name: 'pepper',
            baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp'),
          ),
          IngredientModel(id: 'ing-12', name: 'lemon'),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Cal'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carb',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 4,
            difficulty: 'Medium',
            preparationHumanTime: '15m',
            bakingHumanTime: '40m',
            restingHumanTime: '24h',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 1.5),
              WeightCountModel(id: 'ing-2', count: 65),
              WeightCountModel(id: 'ing-3', count: 65),
              WeightCountModel(id: 'ing-4', count: 3),
              WeightCountModel(id: 'ing-5', count: 2),
              WeightCountModel(id: 'ing-6', count: 1.5),
              WeightCountModel(id: 'ing-7', count: 3),
              WeightCountModel(id: 'ing-8', count: 1),
              WeightCountModel(id: 'ing-9', count: 2),
              WeightCountModel(id: 'ing-10', count: 1),
              WeightCountModel(id: 'ing-11', count: 2),
              WeightCountModel(id: 'ing-12', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 965),
              WeightCountModel(id: 'nut-2', count: 72),
              WeightCountModel(id: 'nut-3', count: 60),
              WeightCountModel(id: 'nut-4', count: 30),
            ],
          ),
          PortionBasedRecipeModel(
            id: 'ser-2',
            minPortionCount: 2,
            maxPortionCount: 3,
            difficulty: 'Medium',
            preparationHumanTime: '12m',
            bakingHumanTime: '37m',
            restingHumanTime: '24h',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 1.5),
              WeightCountModel(id: 'ing-2', count: 65),
              WeightCountModel(id: 'ing-3', count: 65),
              WeightCountModel(id: 'ing-4', count: 3),
              WeightCountModel(id: 'ing-5', count: 2),
              WeightCountModel(id: 'ing-6', count: 1.5),
              WeightCountModel(id: 'ing-7', count: 3),
              WeightCountModel(id: 'ing-8', count: 1),
              WeightCountModel(id: 'ing-9', count: 2),
              WeightCountModel(
                id: 'ing-10',
                count: 1.5,
                measuringUnit: MeasuringUnitModel(
                  name: 'tsp',
                  abbreviation: 'tsp',
                ),
              ),
              WeightCountModel(id: 'ing-11', count: 2),
              WeightCountModel(id: 'ing-12', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 820),
              WeightCountModel(id: 'nut-2', count: 65),
              WeightCountModel(id: 'nut-3', count: 55),
              WeightCountModel(
                id: 'nut-4',
                count: 1,
                measuringUnit: MeasuringUnitModel(
                  name: 'kilogram',
                  abbreviation: 'kg',
                ),
              ),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['herbs', 'Packed dinner', '2024 trends'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-1',
            'Muhab',
            'https://i.pinimg.com/236x/e6/22/fb/e622fbfee64bbe2a9ea36adb7a1620b5.jpg',
          ),

          imagesUrl: [
            'https://i.pinimg.com/474x/0e/51/e3/0e51e3190ff7fab23e83713e554c2468.jpg',
            'https://i.pinimg.com/236x/d0/e2/0d/d0e20d6ca492365803a8da9dbd07d17b.jpg',
          ],
          rating: 4.5,
          publishedAt: DateTime(2024, 3, 4),
          comment: 'Great recipe idea! eh The taste persisted',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-2',
          reviewerModel: ReviewerModel('userID-2', 'Alice'),
          imagesUrl: [
            'https://i.pinimg.com/236x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
            'https://i.pinimg.com/236x/f7/c6/24/f7c6242addd8a1ebc91e07c69c2954e0.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 8, 5),
          comment:
              'Absolutely loved it! The flavors were amazing and the instructions were easy to follow.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-3',
          reviewerModel: ReviewerModel('userID-3', 'Bob'),

          imagesUrl: [
            'https://i.pinimg.com/236x/30/70/d1/3070d19e87a69acca2e2fed1e2695138.jpg',
          ],
          rating: 3.5,
          publishedAt: DateTime(2023, 5, 2),
          comment:
              'Good recipe, but it took longer to cook than expected. The taste was decent though.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-4',
          reviewerModel: ReviewerModel('userID-4', 'Charlie'),
          imagesUrl: [
            'https://i.pinimg.com/236x/8d/cb/e7/8dcbe74e933d192bd2029874d9a30578.jpg',
          ],
          rating: 4.0,
          publishedAt: DateTime(2020, 5, 1),
          comment:
              'Solid recipe. I would recommend adding a bit more seasoning for extra flavor.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-5',
          reviewerModel: ReviewerModel('userID-5', 'Diana'),
          imagesUrl: [
            'https://i.pinimg.com/236x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
            'https://i.pinimg.com/236x/9f/b6/e2/9fb6e200b3be5848f23cfaf8fc0f9e9b.jpg',
            'https://i.pinimg.com/236x/fd/5a/e5/fd5ae5a2de1ed887f7c7300aef8a21dd.jpg',
          ],
          rating: 2.0,
          publishedAt: DateTime(2024, 4, 30),
          comment:
              'Not a fan. The dish was too bland and the instructions were unclear.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-6',
          reviewerModel: ReviewerModel(
            'userID-6',
            'Eve',
            'https://i.pinimg.com/236x/5c/95/31/5c9531d05f919414e9dff0c974388f67.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/236x/ff/b1/36/ffb136af8fc1c2125a2fbf2b5eca8d0f.jpg',
          ],
          rating: 4.8,
          publishedAt: DateTime(2024, 4, 29),
          comment:
              'Fantastic recipe! The dish was a hit at my Packed dinner party. Will definitely make it again.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-2', 'ute-3'],
          ingredientsID: [
            'ing-1',
            'ing-2',
            'ing-3',
            'ing-4',
            'ing-5',
            'ing-6',
            'ing-7',
            'ing-9',
            'ing-10',
          ],
          imagesUrl: [
            'https://i.pinimg.com/236x/00/08/b2/0008b2e89b6bb952492a81d47be284c0.jpg',
            'https://i.pinimg.com/236x/d5/16/8b/d5168b74359b82489f77bf14968b6adf.jpg',
            'https://i.pinimg.com/236x/31/f0/4d/31f04d9dea0f7c587cdcb8bb7eae18ac.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
In a __utensil_ute-2, combine the __ing_ing-1, __ing_ing-4, __ing_ing-6, __ing_ing-9 and __ing_ing-10.
Add the __ing_ing-2, __ing_ing-3, __ing_ing-5, and __ing_ing-7. Mix well to ensure the chicken is evenly coated.
Cover the __utensil_ute-3 , and refrigerate for at least 4 hours (or overnight) to allow the flavors to meld.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-2', 'ing-3', 'ing-5', 'ing-7'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Preheat your oven to 350°F (175°C).__nlRemove the chicken from the marinade and place it in a single layer in a large __utensil_ute_4 or roasting pan.
Scatter the __ing_ing-2, __ing_ing-3, __ing_ing-5, and __ing_ing-7 over the chicken.
Pour the remaining marinade over the chicken.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-8', 'ing-9'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Pour __ing_ing-8 evenly over the chicken.__nl Sprinkle __ing_ing-9 over the top of the chicken and other ingredients.
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-5'],
          ingredientsID: ['ing-3'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Place the dish in the preheated __utensil_ute-5 (oven) and bake for __timer_40m, basting occasionally with the pan juices.__nl
The chicken is done when it reaches an internal temperature of 165°F (74°C) and the skin is golden brown.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-6'],
          ingredientsID: ['ing-2', 'ing-3', 'ing-6', 'ing-10'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Remove the dish from the oven and let it rest for __timer_7m.__nl
Sprinkle with freshly chopped __ing_ing-10 for a pop of color and freshness.__nl
Serve the chicken with the __ing_ing-2,  __ing_ing-3, and  __ing_ing-6 over the top.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-2',
      title: 'Classic Spaghetti Carbonara',
      description: '''
A timeless Italian pasta dish made with eggs, cheese, pancetta, and black pepper. 
Simple yet rich in flavor, this recipe is perfect for a quick and satisfying meal. ★★★★★
''',
      imageUrl:
          'https://i.pinimg.com/236x/a2/26/07/a226076c1498919907ff9596acfb0874.jpg',
      usersEngagement: EngagementModel(
        rating: 4.7,
        ratingCount: 2890,
        likesCount: 1200,
      ),
      userData: CreatorModel(
        id: 'creator-2',
        name: 'Giulia Rossi',
        profilePic:
            'https://i.pinimg.com/474x/f2/ec/bc/f2ecbcde9918a1b5f0806fd001c6fd7a.jpg',
        profession: 'Chef',
        portfolioLink: 'giulia-rossi.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'Large pot'),
        UtensilModel(id: 'ute-2', name: 'Skillet'),
        UtensilModel(id: 'ute-3', name: 'Mixing bowl'),
        UtensilModel(id: 'ute-4', name: 'Whisk'),
        UtensilModel(id: 'ute-5', name: 'Grater'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'Spaghetti',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'Pancetta',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'Eggs',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'Parmesan cheese',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'Garlic',
            baseUnit: MeasuringUnitModel(name: 'clove', abbreviation: 'clove'),
          ),
          IngredientModel(
            id: 'ing-6',
            name: 'Black pepper',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-7',
            name: 'Salt',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Calories'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carbs',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 4,
            difficulty: 'Easy',
            preparationHumanTime: '10m',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 400),
              WeightCountModel(id: 'ing-2', count: 150),
              WeightCountModel(id: 'ing-3', count: 3),
              WeightCountModel(id: 'ing-4', count: 100),
              WeightCountModel(id: 'ing-5', count: 2),
              WeightCountModel(id: 'ing-6', count: 1),
              WeightCountModel(id: 'ing-7', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 650),
              WeightCountModel(id: 'nut-2', count: 25),
              WeightCountModel(id: 'nut-3', count: 30),
              WeightCountModel(id: 'nut-4', count: 70),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['pasta', 'Italian', 'quick meal'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-7',
            'Marco',

            'https://i.pinimg.com/236x/e6/22/fb/e622fbfee64bbe2a9ea36adb7a1620b5.jpg',
          ),
          imagesUrl: [],
          rating: 5.0,
          publishedAt: DateTime(2024, 5, 4),
          comment:
              'Perfect recipe! Tastes just like my grandmother\'s carbonara.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-2',
          reviewerModel: ReviewerModel('userID-8', 'Sophia'),
          imagesUrl: [
            'https://i.pinimg.com/236x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
          ],
          rating: 4.5,
          publishedAt: DateTime(2024, 5, 3),
          comment:
              'Delicious and easy to make. I added a bit more cheese for extra flavor.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-1'],
          ingredientsID: ['ing-1', 'ing-7'],
          imagesUrl: [
            'https://i.pinimg.com/236x/00/08/b2/0008b2e89b6bb952492a81d47be284c0.jpg',
          ],
          fontSize: FontSize.medium,
          paragraph: '''
Bring a large pot of salted water to a boil.__nl
Add __ing_ing-1 (spaghetti) and cook until al dente. Reserve 1/2 cup of pasta water, then drain.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-2', 'ing-5'],
          imagesUrl: [
            'https://i.pinimg.com/236x/d5/16/8b/d5168b74359b82489f77bf14968b6adf.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Heat a skillet over Medium heat.__nl
Add __ing_ing-2 (pancetta) and cook until crispy.__nl
Add __ing_ing-5 (garlic) and sauté for 1 minute.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-3', 'ute-4'],
          ingredientsID: ['ing-3', 'ing-4', 'ing-6'],
          imagesUrl: [
            'https://i.pinimg.com/236x/31/f0/4d/31f04d9dea0f7c587cdcb8bb7eae18ac.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
In a mixing bowl, whisk together __ing_ing-3 (eggs), __ing_ing-4 (Parmesan cheese), and __ing_ing-6 (black pepper).__nl
Slowly add the reserved pasta water to the egg mixture while whisking.
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-1', 'ing-2'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Add the cooked __ing_ing-1 (spaghetti) to the skillet with __ing_ing-2 (pancetta).__nl
Remove from heat and pour the egg mixture over the pasta, tossing quickly to combine.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-3',
      title: 'Chocolate Lava Cake',
      description: '''
A decadent dessert with a gooey, molten chocolate center. Perfect for chocolate lovers and special occasions. ★★★★★
''',
      imageUrl:
          'https://i.pinimg.com/474x/32/32/b3/3232b30401529f3fce3022771324a7ab.jpg',
      usersEngagement: EngagementModel(
        rating: 4.9,
        ratingCount: 4500,
        likesCount: 2500,
      ),
      userData: CreatorModel(
        id: 'creator-3',
        name: 'Sophie Laurent',
        profilePic:
            'https://i.pinimg.com/474x/f2/ec/bc/f2ecbcde9918a1b5f0806fd001c6fd7a.jpg',
        profession: 'Pastry Chef',
        portfolioLink: 'sophie-laurent.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'Mixing bowl'),
        UtensilModel(id: 'ute-2', name: 'Whisk'),
        UtensilModel(id: 'ute-3', name: 'Ramekins'),
        UtensilModel(id: 'ute-4', name: 'Oven'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'Dark chocolate',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'Butter',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'Sugar',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'Eggs',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'Flour',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Calories'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carbs',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 4,
            difficulty: 'Medium',
            preparationHumanTime: '15m',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 200),
              WeightCountModel(id: 'ing-2', count: 100),
              WeightCountModel(id: 'ing-3', count: 100),
              WeightCountModel(id: 'ing-4', count: 3),
              WeightCountModel(id: 'ing-5', count: 50),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 450),
              WeightCountModel(id: 'nut-2', count: 8),
              WeightCountModel(id: 'nut-3', count: 30),
              WeightCountModel(id: 'nut-4', count: 40),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['dessert', 'chocolate', 'baking'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-9',
            'Emma',

            'https://i.pinimg.com/236x/e6/22/fb/e622fbfee64bbe2a9ea36adb7a1620b5.jpg',
          ),
          imagesUrl: [],
          rating: 5.0,
          publishedAt: DateTime(2024, 5, 4),
          comment: 'Absolutely divine! The molten center is perfect.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-1'],
          ingredientsID: ['ing-1', 'ing-2'],
          imagesUrl: [
            'https://i.pinimg.com/236x/00/08/b2/0008b2e89b6bb952492a81d47be284c0.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Melt __ing_ing-1 (dark chocolate) and __ing_ing-2 (butter) together in a mixing bowl.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-1', 'ute-2'],
          ingredientsID: ['ing-3', 'ing-4', 'ing-5'],
          imagesUrl: [
            'https://i.pinimg.com/236x/d5/16/8b/d5168b74359b82489f77bf14968b6adf.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Whisk in __ing_ing-3 (sugar), __ing_ing-4 (eggs), and __ing_ing-5 (flour) until smooth.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-3', 'ute-4'],
          ingredientsID: ['ing-6'],
          imagesUrl: [
            'https://i.pinimg.com/236x/31/f0/4d/31f04d9dea0f7c587cdcb8bb7eae18ac.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Pour the batter into greased ramekins and bake in a preheated oven at 200°C for 10 minutes.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-4',
      title: 'Spicy Thai Green Curry',
      description: '''
A fragrant and flavorful Thai curry with a perfect balance of spicy, sweet, and savory notes. Made with fresh ingredients and authentic spices, this vibrant curry will transport you straight to Thailand. Serve with steamed jasmine rice for a complete meal that's sure to impress. ★★★★★
''',
      imageUrl:
          'https://i.pinimg.com/736x/03/3f/cc/033fcc670a1e1833fc1ca94847c59366.jpg',
      usersEngagement: EngagementModel(
        rating: 4.8,
        ratingCount: 3785,
        likesCount: 1890,
      ),
      userData: CreatorModel(
        id: 'creator-4',
        name: 'Priya Patel',
        profilePic:
            'https://i.pinimg.com/236x/ad/73/1c/ad731cd0da0641bb16090f25778ef0fd.jpg',
        profession: 'Food Blogger',
        portfolioLink: 'cuisineadventures.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'Wok'),
        UtensilModel(id: 'ute-2', name: 'Knife'),
        UtensilModel(id: 'ute-3', name: 'Cutting board'),
        UtensilModel(id: 'ute-4', name: 'Wooden spoon'),
        UtensilModel(id: 'ute-5', name: 'Measuring cups'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'Green curry paste',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'Coconut milk',
            baseUnit: MeasuringUnitModel(
              name: 'milliliter',
              abbreviation: 'ml',
            ),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'Chicken breast',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'Thai eggplant',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'Bell pepper',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-6',
            name: 'Kaffir lime leaves',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-7',
            name: 'Thai basil',
            baseUnit: MeasuringUnitModel(name: 'cup', abbreviation: 'cup'),
          ),
          IngredientModel(
            id: 'ing-8',
            name: 'Fish sauce',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-9',
            name: 'Palm sugar',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-10',
            name: 'Vegetable oil',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Calories'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carbs',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 4,
            difficulty: 'Medium',
            preparationHumanTime: '20m',
            // cookingHumanTime: '25m',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 3),
              WeightCountModel(id: 'ing-2', count: 400),
              WeightCountModel(id: 'ing-3', count: 500),
              WeightCountModel(id: 'ing-4', count: 6),
              WeightCountModel(id: 'ing-5', count: 1),
              WeightCountModel(id: 'ing-6', count: 4),
              WeightCountModel(id: 'ing-7', count: 0.5),
              WeightCountModel(id: 'ing-8', count: 2),
              WeightCountModel(id: 'ing-9', count: 2),
              WeightCountModel(id: 'ing-10', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 420),
              WeightCountModel(id: 'nut-2', count: 28),
              WeightCountModel(id: 'nut-3', count: 25),
              WeightCountModel(id: 'nut-4', count: 18),
            ],
          ),
          PortionBasedRecipeModel(
            id: 'ser-2',
            portionCount: 2,
            difficulty: 'Medium',
            preparationHumanTime: '15m',
            // cookingHumanTime: '20m',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 1.5),
              WeightCountModel(id: 'ing-2', count: 200),
              WeightCountModel(id: 'ing-3', count: 250),
              WeightCountModel(id: 'ing-4', count: 3),
              WeightCountModel(id: 'ing-5', count: 0.5),
              WeightCountModel(id: 'ing-6', count: 2),
              WeightCountModel(id: 'ing-7', count: 0.25),
              WeightCountModel(id: 'ing-8', count: 1),
              WeightCountModel(id: 'ing-9', count: 1),
              WeightCountModel(id: 'ing-10', count: 0.5),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 210),
              WeightCountModel(id: 'nut-2', count: 14),
              WeightCountModel(id: 'nut-3', count: 12.5),
              WeightCountModel(id: 'nut-4', count: 9),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['Thai', 'spicy', 'curry', 'Packed dinner', 'Asian'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-10',
            'James',

            'https://i.pinimg.com/236x/7c/19/99/7c1999c9b66a24b58207b4c5d639edad.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/236x/11/80/d0/1180d08e44209b9b9774720e4555c3b2.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 4, 28),
          comment:
              'Bursting with authentic flavors! Reminds me of my trip to Thailand. A favorite in our household now.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-2',
          reviewerModel: ReviewerModel('userID-11', 'Lila'),
          imagesUrl: [],
          rating: 4.5,
          publishedAt: DateTime(2024, 4, 20),
          comment:
              'Delicious and fairly easy to make! I had trouble finding kaffir lime leaves so used lime zest instead.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-3',
          reviewerModel: ReviewerModel(
            'userID-12',
            'Michael',
            'https://i.pinimg.com/236x/4c/8d/e5/4c8de5e103723d152c072c7a5795ac11.jpg',
          ),
          imagesUrl: [],
          rating: 4.0,
          publishedAt: DateTime(2024, 4, 15),
          comment:
              'Great flavors but a bit too spicy for my taste. Will reduce the curry paste next time.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-2', 'ute-3'],
          ingredientsID: ['ing-3', 'ing-4', 'ing-5'],
          imagesUrl: [
            'https://i.pinimg.com/236x/e4/7d/2a/e47d2a005b7b80100e293a0e74d31e9f.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Cut __ing_ing-3 (chicken breast) into bite-sized pieces.__nl
Slice __ing_ing-4 (Thai eggplant) into quarters.__nl
Cut __ing_ing-5 (bell pepper) into thin strips.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-1', 'ute-4'],
          ingredientsID: ['ing-1', 'ing-10'],
          imagesUrl: [
            'https://i.pinimg.com/236x/f8/a1/28/f8a128808f76c73b626b5c3c464ac9f3.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Heat __ing_ing-10 (vegetable oil) in a __utensil_ute-1 (wok) over medium heat.__nl
Add __ing_ing-1 (green curry paste) and stir-fry for 1-2 minutes until fragrant.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-1', 'ute-4'],
          ingredientsID: ['ing-2', 'ing-3', 'ing-6'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c9/2a/7e/c92a7e341e69244a4e696b06c3179c04.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Add __ing_ing-3 (chicken) and cook for 3-4 minutes until partially cooked.__nl
Pour in __ing_ing-2 (coconut milk) and bring to a gentle simmer.__nl
Add __ing_ing-6 (kaffir lime leaves).
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-1', 'ute-4'],
          ingredientsID: ['ing-4', 'ing-5', 'ing-8', 'ing-9'],
          imagesUrl: [
            'https://i.pinimg.com/236x/1a/0d/2c/1a0d2c8f9ee067b7e80e78e4bfe0c179.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Add __ing_ing-4 (Thai eggplant) and __ing_ing-5 (bell pepper).__nl
Season with __ing_ing-8 (fish sauce) and __ing_ing-9 (palm sugar).__nl
Simmer for __timer_15m until vegetables are tender and chicken is fully cooked.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-7'],
          imagesUrl: [
            'https://i.pinimg.com/236x/47/ec/26/47ec26a0e3f1983883d8348921857c53.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Stir in __ing_ing-7 (Thai basil) just before serving.__nl
Adjust seasoning to taste and serve hot with steamed jasmine rice.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-5',
      title: 'Rustic Apple Galette',
      description: '''
A simple yet elegant free-form apple tart with a flaky, buttery crust and sweet-tart apple filling. The rustic presentation makes this dessert both impressive and approachable. Finish with a dusting of powdered sugar or a scoop of vanilla ice cream for the perfect treat. ★★★★☆
''',
      imageUrl:
          'https://i.pinimg.com/474x/e0/6d/1c/e06d1c7743d5a89db86d2f19ce7a3ea1.jpg',
      usersEngagement: EngagementModel(
        rating: 4.6,
        ratingCount: 2130,
        likesCount: 980,
      ),
      userData: CreatorModel(
        id: 'creator-5',
        name: 'Emma Baker',
        profilePic:
            'https://i.pinimg.com/236x/67/89/cc/6789ccc33fea3feae36d6617a57dc827.jpg',
        profession: 'Home Baker',
        portfolioLink: 'emmabakes.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'Rolling pin'),
        UtensilModel(id: 'ute-2', name: 'Baking sheet'),
        UtensilModel(id: 'ute-3', name: 'Parchment paper'),
        UtensilModel(id: 'ute-4', name: 'Mixing bowl'),
        UtensilModel(id: 'ute-5', name: 'Pastry brush'),
        UtensilModel(id: 'ute-6', name: 'Apple peeler'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'All-purpose flour',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'Unsalted butter',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'Ice water',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'Granulated sugar',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'Salt',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-6',
            name: 'Apples',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-7',
            name: 'Lemon juice',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-8',
            name: 'Ground cinnamon',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-9',
            name: 'Egg',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-10',
            name: 'Apricot jam',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Calories'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carbs',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 8,
            difficulty: 'Medium',
            preparationHumanTime: '30m',
            bakingHumanTime: '35m',
            // chillHumanTime: '1h',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 200),
              WeightCountModel(id: 'ing-2', count: 115),
              WeightCountModel(id: 'ing-3', count: 4),
              WeightCountModel(id: 'ing-4', count: 100),
              WeightCountModel(id: 'ing-5', count: 0.25),
              WeightCountModel(id: 'ing-6', count: 4),
              WeightCountModel(id: 'ing-7', count: 1),
              WeightCountModel(id: 'ing-8', count: 1),
              WeightCountModel(id: 'ing-9', count: 1),
              WeightCountModel(id: 'ing-10', count: 2),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 320),
              WeightCountModel(id: 'nut-2', count: 3),
              WeightCountModel(id: 'nut-3', count: 15),
              WeightCountModel(id: 'nut-4', count: 45),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['dessert', 'fruit', 'pastry', 'baking', 'fall'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-13',
            'Sarah',
            'https://i.pinimg.com/236x/29/8d/22/298d227d55e78f2985803ad79f3a6f08.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/474x/51/0d/2e/510d2e84bfb8a156e9538847935fa392.jpg',
            'https://i.pinimg.com/236x/e2/a3/71/e2a371c196f3f2b7e8869b34bbecbd48.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 4, 10),
          comment:
              'So much easier than a traditional pie but tastes just as good! The pastry was perfectly flaky.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-2',
          reviewerModel: ReviewerModel('userID-14', 'Daniel'),
          imagesUrl: [],
          rating: 4.0,
          publishedAt: DateTime(2024, 4, 5),
          comment:
              'Delicious flavor but my crust leaked a bit. Will try chilling it longer next time.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-3',
          reviewerModel: ReviewerModel('userID-15', 'Olivia'),
          imagesUrl: [
            'https://i.pinimg.com/236x/aa/ba/6e/aaba6ec5335f914ef5e37177fdd0e431.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 3, 20),
          comment:
              'Perfect for autumn! I used a mix of Honeycrisp and Granny Smith apples which gave a nice balance of sweet and tart.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-1', 'ing-2', 'ing-5'],
          imagesUrl: [
            'https://i.pinimg.com/236x/a1/d5/54/a1d5549e1ba7be959a29e5c8ab9aee6c.jpg',
          ],
          fontSize: FontSize.medium,
          paragraph: '''
In a mixing bowl, combine __ing_ing-1 (all-purpose flour) and __ing_ing-5 (salt).__nl
Cut in cold __ing_ing-2 (unsalted butter) until mixture resembles coarse crumbs.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-3'],
          imagesUrl: [
            'https://i.pinimg.com/236x/45/6c/fe/456cfe8f40c6ca7d22fd1f0a151a63d5.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Gradually add __ing_ing-3 (ice water), 1 tablespoon at a time, stirring until dough holds together.__nl
Form dough into a disk, wrap in plastic, and refrigerate for __timer_1h.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-6'],
          ingredientsID: ['ing-6', 'ing-7', 'ing-8', 'ing-4'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c7/c1/de/c7c1de5cb44c01338151a64336eba3a8.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Peel, core, and thinly slice __ing_ing-6 (apples).__nl
Toss apple slices with __ing_ing-7 (lemon juice), __ing_ing-8 (cinnamon), and 50g of __ing_ing-4 (sugar).
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-1', 'ute-2', 'ute-3'],
          ingredientsID: ['ing-1', 'ing-2'],
          imagesUrl: [
            'https://i.pinimg.com/236x/64/e3/f4/64e3f4a8a2a0b0f957be5a4e2c9038fe.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Preheat oven to 375°F (190°C).__nl
On a lightly floured surface, roll dough into a 12-inch circle.__nl
Transfer to a baking sheet lined with parchment paper.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-4', 'ing-6'],
          imagesUrl: [
            'https://i.pinimg.com/236x/15/9a/89/159a89f9f97dd9a886c2815e34e38fb5.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Arrange __ing_ing-6 (apple) slices in the center of the dough, leaving a 2-inch border.__nl
Sprinkle remaining __ing_ing-4 (sugar) over the apples.
''',
        ),
        CookingStepModel(
          stepNumber: 6,
          utensilsID: ['ute-5'],
          ingredientsID: ['ing-9'],
          imagesUrl: [
            'https://i.pinimg.com/236x/e7/d2/d1/e7d2d16cf5b44571c38ea97c7fa22b3f.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Fold the edges of the dough over the apples, pleating as you go.__nl
Brush the crust with beaten __ing_ing-9 (egg).
''',
        ),
        CookingStepModel(
          stepNumber: 7,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-1'],
          imagesUrl: [
            'https://i.pinimg.com/236x/5a/ea/ce/5aeace72ca1b83c0c1e1cd13a38c8984.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Bake for __timer_35m until crust is golden and apples are tender.
''',
        ),
        CookingStepModel(
          stepNumber: 8,
          utensilsID: ['ute-5'],
          ingredientsID: ['ing-10'],
          imagesUrl: [
            'https://i.pinimg.com/236x/79/46/cf/7946cf468cdf18c921fca4f32fe1ad7d.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Heat __ing_ing-10 (apricot jam) until liquid and brush over warm galette for a glossy finish.__nl
Let cool slightly before serving.
''',
        ),
      ],
    ),
  ];

  final getTonightRecipes = [
    RecipeModel(
      id: 'recipe-6',
      title: 'Spaghetti Carbonara',
      description:
          'A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper. This recipe is simple yet incredibly flavorful, perfect for a quick weeknight dinner.',
      imageUrl:
          'https://i.pinimg.com/736x/3b/34/bd/3b34bd290fd8c4aced62e70aa73f6f6c.jpg',
      usersEngagement: EngagementModel(
        rating: 4.7,
        ratingCount: 1234567,
        likesCount: 789,
      ),
      userData: CreatorModel(
        id: 'creator-2',
        name: 'Giovanni Rossi',
        profilePic:
            'https://i.pinimg.com/474x/ec/ef/a8/ecefa8c572d71770ecc3318141ad3b37.jpg',
        profession: 'Chef',
        portfolioLink: 'giovanni-rossi.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-7', name: 'pot'),
        UtensilModel(id: 'ute-8', name: 'frying pan'),
        UtensilModel(id: 'ute-9', name: 'whisk'),
        UtensilModel(id: 'ute-10', name: 'grater'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-13',
            name: 'spaghetti',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-14',
            name: 'pancetta',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-15',
            name: 'eggs',
            baseUnit: MeasuringUnitModel(name: 'pieces', abbreviation: 'pcs'),
          ),
          IngredientModel(
            id: 'ing-16',
            name: 'Parmesan cheese',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-17',
            name: 'black pepper',
            baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-18',
            name: 'salt',
            baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp'),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-5', name: 'Cal'),
          NutritionModel(
            id: 'nut-6',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-7',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-8',
            name: 'Carb',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-3',
            portionCount: 4,
            difficulty: 'Easy',
            preparationHumanTime: '40m',
            bakingHumanTime: '20m',
            restingHumanTime: '10m',
            ingredients: [
              WeightCountModel(id: 'ing-13', count: 400),
              WeightCountModel(id: 'ing-14', count: 150),
              WeightCountModel(id: 'ing-15', count: 3),
              WeightCountModel(id: 'ing-16', count: 100),
              WeightCountModel(id: 'ing-17', count: 1),
              WeightCountModel(id: 'ing-18', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-5', count: 750),
              WeightCountModel(id: 'nut-6', count: 30),
              WeightCountModel(id: 'nut-7', count: 40),
              WeightCountModel(id: 'nut-8', count: 80),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-3',
      ),
      tags: ['Italian', 'Pasta', 'Quick Dinner'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-7',
          reviewerModel: ReviewerModel(
            'userID-7',
            'Sophia',
            'https://i.pinimg.com/474x/ec/ef/a8/ecefa8c572d71770ecc3318141ad3b37.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/474x/83/7e/54/837e54f6c97f2e5d7436a5e0d7cc4bda.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 5, 5),
          comment:
              'Absolutely delicious! The recipe was easy to follow, and the result was amazing.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-7'],
          ingredientsID: ['ing-13', 'ing-18'],
          imagesUrl: [
            'https://i.pinimg.com/236x/3f/81/72/3f8172d4ce2f31b0dd4d29b89ea86625.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Bring a large __utensil_ute-7 of salted water to a boil. Add the __ing_ing-13 and cook according to package instructions until al dente.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-8'],
          ingredientsID: ['ing-14'],
          imagesUrl: [
            'https://i.pinimg.com/236x/72/51/39/725139e53e20bd71dae147aeed04449c.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
While the pasta is cooking, heat a __utensil_ute-8 over medium heat. Add the __ing_ing-14 and cook until crispy.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-9'],
          ingredientsID: ['ing-15', 'ing-16', 'ing-17'],
          imagesUrl: [
            'https://i.pinimg.com/236x/72/51/39/725139e53e20bd71dae147aeed04449c.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
In a __utensil_ute-9, whisk together the __ing_ing-15, __ing_ing-16, and __ing_ing-17.
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-7', 'ute-8'],
          ingredientsID: ['ing-13', 'ing-14'],
          imagesUrl: [
            'https://i.pinimg.com/236x/34/b0/b9/34b0b94b974e0aa3fca85f46f0bdd69b.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Once the pasta is cooked, reserve 1 cup of the pasta water, then drain the pasta. Add the pasta to the __utensil_ute-8 with the __ing_ing-14.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-8'],
          ingredientsID: ['ing-15', 'ing-16', 'ing-17'],
          imagesUrl: [
            'https://i.pinimg.com/236x/32/2a/45/322a459efe060bd98fda0b2d8fc48967.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Remove the __utensil_ute-8 from heat and quickly stir in the egg mixture. Add reserved pasta water as needed to create a creamy sauce.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-7',
      title: 'Vegetarian Buddha Bowl',
      description:
          'A healthy and vibrant bowl packed with roasted vegetables, grains, and a creamy tahini dressing. Perfect for a nutritious and satisfying meal.',
      imageUrl:
          'https://i.pinimg.com/236x/87/0c/c0/870cc08059a383002e99ea2dac1e9768.jpg',

      usersEngagement: EngagementModel(
        rating: 4.6,
        ratingCount: 567890,
        likesCount: 987,
      ),
      userData: CreatorModel(
        id: 'creator-4',
        name: 'Lily Green',
        profilePic: null,
        profession: 'Nutritionist',
        portfolioLink: 'lily-green.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-15', name: 'baking sheet'),
        UtensilModel(id: 'ute-16', name: 'mixing bowl'),
        UtensilModel(id: 'ute-17', name: 'whisk'),
        UtensilModel(id: 'ute-18', name: 'blender'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-25',
            name: 'quinoa',
            baseUnit: MeasuringUnitModel(name: 'cup', abbreviation: 'cup'),
          ),
          IngredientModel(
            id: 'ing-26',
            name: 'sweet potatoes',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-27',
            name: 'broccoli',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-28',
            name: 'chickpeas',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-29',
            name: 'avocado',
            baseUnit: MeasuringUnitModel(name: 'pieces', abbreviation: 'pcs'),
          ),
          IngredientModel(
            id: 'ing-30',
            name: 'tahini',
            baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp'),
          ),
          IngredientModel(
            id: 'ing-31',
            name: 'lemon',
            baseUnit: MeasuringUnitModel(name: 'pieces', abbreviation: 'pcs'),
          ),
          IngredientModel(
            id: 'ing-32',
            name: 'garlic',
            baseUnit: MeasuringUnitModel(
              name: 'cloves',
              abbreviation: 'cloves',
            ),
          ),
          IngredientModel(
            id: 'ing-33',
            name: 'olive oil',
            baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp'),
          ),
          IngredientModel(
            id: 'ing-34',
            name: 'salt',
            baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-35',
            name: 'pepper',
            baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp'),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-13', name: 'Cal'),
          NutritionModel(
            id: 'nut-14',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-15',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-16',
            name: 'Carb',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-5',
            portionCount: 2,
            difficulty: 'Easy',
            preparationHumanTime: '15m',
            bakingHumanTime: '25m',
            ingredients: [
              WeightCountModel(id: 'ing-25', count: 1),
              WeightCountModel(id: 'ing-26', count: 200),
              WeightCountModel(id: 'ing-27', count: 150),
              WeightCountModel(id: 'ing-28', count: 100),
              WeightCountModel(id: 'ing-29', count: 1),
              WeightCountModel(id: 'ing-30', count: 2),
              WeightCountModel(id: 'ing-31', count: 1),
              WeightCountModel(id: 'ing-32', count: 2),
              WeightCountModel(id: 'ing-33', count: 3),
              WeightCountModel(id: 'ing-34', count: 1),
              WeightCountModel(id: 'ing-35', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-13', count: 600),
              WeightCountModel(id: 'nut-14', count: 20),
              WeightCountModel(id: 'nut-15', count: 25),
              WeightCountModel(id: 'nut-16', count: 70),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-5',
      ),
      tags: ['Vegetarian', 'Healthy', 'Bowl'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-9',
          reviewerModel: ReviewerModel(
            'userID-9',
            'Emma',
            'https://i.pinimg.com/236x/5c/95/31/5c9531d05f919414e9dff0c974388f67.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/236x/ff/b1/36/ffb136af8fc1c2125a2fbf2b5eca8d0f.jpg',
          ],
          rating: 4.8,
          publishedAt: DateTime(2024, 5, 7),
          comment:
              'This bowl is so delicious and filling! The tahini dressing is the perfect touch.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-15'],
          ingredientsID: [
            'ing-26',
            'ing-27',
            'ing-28',
            'ing-33',
            'ing-34',
            'ing-35',
          ],
          imagesUrl: [
            'https://i.pinimg.com/236x/00/08/b2/0008b2e89b6bb952492a81d47be284c0.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Preheat your __utensil_ute-15 to 400°F (200°C). Toss the __ing_ing-26, __ing_ing-27, and __ing_ing-28 with __ing_ing-33, __ing_ing-34, and __ing_ing-35. Spread evenly on the __utensil_ute-15 and roast for __timer_25m.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-16'],
          ingredientsID: ['ing-25'],
          imagesUrl: [
            'https://i.pinimg.com/236x/d5/16/8b/d5168b74359b82489f77bf14968b6adf.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
While the vegetables are roasting, cook the __ing_ing-25 according to package instructions.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-18'],
          ingredientsID: ['ing-30', 'ing-31', 'ing-32', 'ing-33'],
          imagesUrl: [
            'https://i.pinimg.com/236x/31/f0/4d/31f04d9dea0f7c587cdcb8bb7eae18ac.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
In a __utensil_ute-18, combine the __ing_ing-30, juice of __ing_ing-31, __ing_ing-32, and __ing_ing-33. Blend until smooth.
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-29'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Slice the __ing_ing-29.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-1'],
          ingredientsID: ['ing-1', 'ing-2'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Assemble the bowls: Divide the cooked __ing_ing-25, roasted vegetables, and sliced __ing_ing-29 between two bowls. Drizzle with the tahini dressing.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-8',
      title: 'Spicy Thai Green Curry',
      description: '''
A fragrant and flavorful Thai curry with a perfect balance of spicy, sweet, and savory notes. Made with fresh ingredients and authentic spices, this vibrant curry will transport you straight to Thailand. Serve with steamed jasmine rice for a complete meal that's sure to impress. ★★★★★
''',
      imageUrl:
          'https://i.pinimg.com/736x/03/3f/cc/033fcc670a1e1833fc1ca94847c59366.jpg',
      usersEngagement: EngagementModel(
        rating: 4.8,
        ratingCount: 3785,
        likesCount: 1890,
      ),
      userData: CreatorModel(
        id: 'creator-4',
        name: 'Priya Patel',
        profilePic:
            'https://i.pinimg.com/236x/ad/73/1c/ad731cd0da0641bb16090f25778ef0fd.jpg',
        profession: 'Food Blogger',
        portfolioLink: 'cuisineadventures.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'Wok'),
        UtensilModel(id: 'ute-2', name: 'Knife'),
        UtensilModel(id: 'ute-3', name: 'Cutting board'),
        UtensilModel(id: 'ute-4', name: 'Wooden spoon'),
        UtensilModel(id: 'ute-5', name: 'Measuring cups'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'Green curry paste',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'Coconut milk',
            baseUnit: MeasuringUnitModel(
              name: 'milliliter',
              abbreviation: 'ml',
            ),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'Chicken breast',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'Thai eggplant',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'Bell pepper',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-6',
            name: 'Kaffir lime leaves',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-7',
            name: 'Thai basil',
            baseUnit: MeasuringUnitModel(name: 'cup', abbreviation: 'cup'),
          ),
          IngredientModel(
            id: 'ing-8',
            name: 'Fish sauce',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-9',
            name: 'Palm sugar',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-10',
            name: 'Vegetable oil',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Calories'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carbs',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 4,
            difficulty: 'Medium',
            preparationHumanTime: '20m',
            // cookingHumanTime: '25m',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 3),
              WeightCountModel(id: 'ing-2', count: 400),
              WeightCountModel(id: 'ing-3', count: 500),
              WeightCountModel(id: 'ing-4', count: 6),
              WeightCountModel(id: 'ing-5', count: 1),
              WeightCountModel(id: 'ing-6', count: 4),
              WeightCountModel(id: 'ing-7', count: 0.5),
              WeightCountModel(id: 'ing-8', count: 2),
              WeightCountModel(id: 'ing-9', count: 2),
              WeightCountModel(id: 'ing-10', count: 1),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 420),
              WeightCountModel(id: 'nut-2', count: 28),
              WeightCountModel(id: 'nut-3', count: 25),
              WeightCountModel(id: 'nut-4', count: 18),
            ],
          ),
          PortionBasedRecipeModel(
            id: 'ser-2',
            portionCount: 2,
            difficulty: 'Medium',
            preparationHumanTime: '15m',
            // cookingHumanTime: '20m',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 1.5),
              WeightCountModel(id: 'ing-2', count: 200),
              WeightCountModel(id: 'ing-3', count: 250),
              WeightCountModel(id: 'ing-4', count: 3),
              WeightCountModel(id: 'ing-5', count: 0.5),
              WeightCountModel(id: 'ing-6', count: 2),
              WeightCountModel(id: 'ing-7', count: 0.25),
              WeightCountModel(id: 'ing-8', count: 1),
              WeightCountModel(id: 'ing-9', count: 1),
              WeightCountModel(id: 'ing-10', count: 0.5),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 210),
              WeightCountModel(id: 'nut-2', count: 14),
              WeightCountModel(id: 'nut-3', count: 12.5),
              WeightCountModel(id: 'nut-4', count: 9),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['Thai', 'spicy', 'curry', 'Packed dinner', 'Asian'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-10',
            'James',
            'https://i.pinimg.com/236x/7c/19/99/7c1999c9b66a24b58207b4c5d639edad.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/236x/11/80/d0/1180d08e44209b9b9774720e4555c3b2.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 4, 28),
          comment:
              'Bursting with authentic flavors! Reminds me of my trip to Thailand. A favorite in our household now.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-2',
          reviewerModel: ReviewerModel('userID-11', 'Lila'),
          imagesUrl: [],
          rating: 4.5,
          publishedAt: DateTime(2024, 4, 20),
          comment:
              'Delicious and fairly easy to make! I had trouble finding kaffir lime leaves so used lime zest instead.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-3',
          reviewerModel: ReviewerModel(
            'userID-12',
            'Michael',
            'https://i.pinimg.com/236x/4c/8d/e5/4c8de5e103723d152c072c7a5795ac11.jpg',
          ),
          imagesUrl: [],
          rating: 4.0,
          publishedAt: DateTime(2024, 4, 15),
          comment:
              'Great flavors but a bit too spicy for my taste. Will reduce the curry paste next time.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-2', 'ute-3'],
          ingredientsID: ['ing-3', 'ing-4', 'ing-5'],
          imagesUrl: [
            'https://i.pinimg.com/236x/e4/7d/2a/e47d2a005b7b80100e293a0e74d31e9f.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Cut __ing_ing-3 (chicken breast) into bite-sized pieces.__nl
Slice __ing_ing-4 (Thai eggplant) into quarters.__nl
Cut __ing_ing-5 (bell pepper) into thin strips.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-1', 'ute-4'],
          ingredientsID: ['ing-1', 'ing-10'],
          imagesUrl: [
            'https://i.pinimg.com/236x/f8/a1/28/f8a128808f76c73b626b5c3c464ac9f3.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Heat __ing_ing-10 (vegetable oil) in a __utensil_ute-1 (wok) over medium heat.__nl
Add __ing_ing-1 (green curry paste) and stir-fry for 1-2 minutes until fragrant.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-1', 'ute-4'],
          ingredientsID: ['ing-2', 'ing-3', 'ing-6'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c9/2a/7e/c92a7e341e69244a4e696b06c3179c04.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Add __ing_ing-3 (chicken) and cook for 3-4 minutes until partially cooked.__nl
Pour in __ing_ing-2 (coconut milk) and bring to a gentle simmer.__nl
Add __ing_ing-6 (kaffir lime leaves).
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-1', 'ute-4'],
          ingredientsID: ['ing-4', 'ing-5', 'ing-8', 'ing-9'],
          imagesUrl: [
            'https://i.pinimg.com/236x/1a/0d/2c/1a0d2c8f9ee067b7e80e78e4bfe0c179.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Add __ing_ing-4 (Thai eggplant) and __ing_ing-5 (bell pepper).__nl
Season with __ing_ing-8 (fish sauce) and __ing_ing-9 (palm sugar).__nl
Simmer for __timer_15m until vegetables are tender and chicken is fully cooked.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-7'],
          imagesUrl: [
            'https://i.pinimg.com/236x/47/ec/26/47ec26a0e3f1983883d8348921857c53.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Stir in __ing_ing-7 (Thai basil) just before serving.__nl
Adjust seasoning to taste and serve hot with steamed jasmine rice.
''',
        ),
      ],
    ),
    RecipeModel(
      id: 'recipe-9',
      title: 'Rustic Apple Galette',
      description: '''
A simple yet elegant free-form apple tart with a flaky, buttery crust and sweet-tart apple filling. The rustic presentation makes this dessert both impressive and approachable. Finish with a dusting of powdered sugar or a scoop of vanilla ice cream for the perfect treat. ★★★★☆
''',
      imageUrl:
          'https://i.pinimg.com/474x/e0/6d/1c/e06d1c7743d5a89db86d2f19ce7a3ea1.jpg',
      usersEngagement: EngagementModel(
        rating: 4.6,
        ratingCount: 2130,
        likesCount: 980,
      ),
      userData: CreatorModel(
        id: 'creator-5',
        name: 'Emma Baker',
        profilePic:
            'https://i.pinimg.com/236x/67/89/cc/6789ccc33fea3feae36d6617a57dc827.jpg',
        profession: 'Home Baker',
        portfolioLink: 'emmabakes.com',
        recipesRef: [],
      ),
      utensils: [
        UtensilModel(id: 'ute-1', name: 'Rolling pin'),
        UtensilModel(id: 'ute-2', name: 'Baking sheet'),
        UtensilModel(id: 'ute-3', name: 'Parchment paper'),
        UtensilModel(id: 'ute-4', name: 'Mixing bowl'),
        UtensilModel(id: 'ute-5', name: 'Pastry brush'),
        UtensilModel(id: 'ute-6', name: 'Apple peeler'),
      ],
      details: DetailsModel(
        baseIngredients: [
          IngredientModel(
            id: 'ing-1',
            name: 'All-purpose flour',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-2',
            name: 'Unsalted butter',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-3',
            name: 'Ice water',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-4',
            name: 'Granulated sugar',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          IngredientModel(
            id: 'ing-5',
            name: 'Salt',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-6',
            name: 'Apples',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-7',
            name: 'Lemon juice',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
          IngredientModel(
            id: 'ing-8',
            name: 'Ground cinnamon',
            baseUnit: MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
          ),
          IngredientModel(
            id: 'ing-9',
            name: 'Egg',
            baseUnit: MeasuringUnitModel(name: 'piece', abbreviation: 'pc'),
          ),
          IngredientModel(
            id: 'ing-10',
            name: 'Apricot jam',
            baseUnit: MeasuringUnitModel(
              name: 'tablespoon',
              abbreviation: 'tbsp',
            ),
          ),
        ],
        baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Calories'),
          NutritionModel(
            id: 'nut-2',
            name: 'Protein',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-3',
            name: 'Fat',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
          NutritionModel(
            id: 'nut-4',
            name: 'Carbs',
            baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g'),
          ),
        ],
        servings: [
          PortionBasedRecipeModel(
            id: 'ser-1',
            portionCount: 8,
            difficulty: 'Medium',
            preparationHumanTime: '30m',
            bakingHumanTime: '35m',
            // chillHumanTime: '1h',
            ingredients: [
              WeightCountModel(id: 'ing-1', count: 200),
              WeightCountModel(id: 'ing-2', count: 115),
              WeightCountModel(id: 'ing-3', count: 4),
              WeightCountModel(id: 'ing-4', count: 100),
              WeightCountModel(id: 'ing-5', count: 0.25),
              WeightCountModel(id: 'ing-6', count: 4),
              WeightCountModel(id: 'ing-7', count: 1),
              WeightCountModel(id: 'ing-8', count: 1),
              WeightCountModel(id: 'ing-9', count: 1),
              WeightCountModel(id: 'ing-10', count: 2),
            ],
            nutritious: [
              WeightCountModel(id: 'nut-1', count: 320),
              WeightCountModel(id: 'nut-2', count: 3),
              WeightCountModel(id: 'nut-3', count: 15),
              WeightCountModel(id: 'nut-4', count: 45),
            ],
          ),
        ],
        defaultPortionBasedRecipeID: 'ser-1',
      ),
      tags: ['dessert', 'fruit', 'pastry', 'baking', 'fall'],
      reviews: [
        ReviewModel(
          ref: null,
          id: 'rev-1',
          reviewerModel: ReviewerModel(
            'userID-13',
            'Sarah',
            'https://i.pinimg.com/236x/29/8d/22/298d227d55e78f2985803ad79f3a6f08.jpg',
          ),
          imagesUrl: [
            'https://i.pinimg.com/474x/51/0d/2e/510d2e84bfb8a156e9538847935fa392.jpg',
            'https://i.pinimg.com/236x/e2/a3/71/e2a371c196f3f2b7e8869b34bbecbd48.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 4, 10),
          comment:
              'So much easier than a traditional pie but tastes just as good! The pastry was perfectly flaky.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-2',
          reviewerModel: ReviewerModel('userID-14', 'Daniel'),
          imagesUrl: [],
          rating: 4.0,
          publishedAt: DateTime(2024, 4, 5),
          comment:
              'Delicious flavor but my crust leaked a bit. Will try chilling it longer next time.',
        ),
        ReviewModel(
          ref: null,
          id: 'rev-3',
          reviewerModel: ReviewerModel('userID-15', 'Olivia'),
          imagesUrl: [
            'https://i.pinimg.com/236x/aa/ba/6e/aaba6ec5335f914ef5e37177fdd0e431.jpg',
          ],
          rating: 5.0,
          publishedAt: DateTime(2024, 3, 20),
          comment:
              'Perfect for autumn! I used a mix of Honeycrisp and Granny Smith apples which gave a nice balance of sweet and tart.',
        ),
      ],
      cookingStepsMap: [
        CookingStepModel(
          stepNumber: 1,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-1', 'ing-2', 'ing-5'],
          imagesUrl: [
            'https://i.pinimg.com/236x/a1/d5/54/a1d5549e1ba7be959a29e5c8ab9aee6c.jpg',
          ],
          fontSize: FontSize.medium,
          paragraph: '''
In a mixing bowl, combine __ing_ing-1 (all-purpose flour) and __ing_ing-5 (salt).__nl
Cut in cold __ing_ing-2 (unsalted butter) until mixture resembles coarse crumbs.
''',
        ),
        CookingStepModel(
          stepNumber: 2,
          utensilsID: ['ute-4'],
          ingredientsID: ['ing-3'],
          imagesUrl: [
            'https://i.pinimg.com/236x/45/6c/fe/456cfe8f40c6ca7d22fd1f0a151a63d5.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Gradually add __ing_ing-3 (ice water), 1 tablespoon at a time, stirring until dough holds together.__nl
Form dough into a disk, wrap in plastic, and refrigerate for __timer_1h.
''',
        ),
        CookingStepModel(
          stepNumber: 3,
          utensilsID: ['ute-6'],
          ingredientsID: ['ing-6', 'ing-7', 'ing-8', 'ing-4'],
          imagesUrl: [
            'https://i.pinimg.com/236x/c7/c1/de/c7c1de5cb44c01338151a64336eba3a8.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Peel, core, and thinly slice __ing_ing-6 (apples).__nl
Toss apple slices with __ing_ing-7 (lemon juice), __ing_ing-8 (cinnamon), and 50g of __ing_ing-4 (sugar).
''',
        ),
        CookingStepModel(
          stepNumber: 4,
          utensilsID: ['ute-1', 'ute-2', 'ute-3'],
          ingredientsID: ['ing-1', 'ing-2'],
          imagesUrl: [
            'https://i.pinimg.com/236x/64/e3/f4/64e3f4a8a2a0b0f957be5a4e2c9038fe.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Preheat oven to 375°F (190°C).__nl
On a lightly floured surface, roll dough into a 12-inch circle.__nl
Transfer to a baking sheet lined with parchment paper.
''',
        ),
        CookingStepModel(
          stepNumber: 5,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-4', 'ing-6'],
          imagesUrl: [
            'https://i.pinimg.com/236x/15/9a/89/159a89f9f97dd9a886c2815e34e38fb5.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Arrange __ing_ing-6 (apple) slices in the center of the dough, leaving a 2-inch border.__nl
Sprinkle remaining __ing_ing-4 (sugar) over the apples.
''',
        ),
        CookingStepModel(
          stepNumber: 6,
          utensilsID: ['ute-5'],
          ingredientsID: ['ing-9'],
          imagesUrl: [
            'https://i.pinimg.com/236x/e7/d2/d1/e7d2d16cf5b44571c38ea97c7fa22b3f.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Fold the edges of the dough over the apples, pleating as you go.__nl
Brush the crust with beaten __ing_ing-9 (egg).
''',
        ),
        CookingStepModel(
          stepNumber: 7,
          utensilsID: ['ute-2'],
          ingredientsID: ['ing-1'],
          imagesUrl: [
            'https://i.pinimg.com/236x/5a/ea/ce/5aeace72ca1b83c0c1e1cd13a38c8984.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Bake for __timer_35m until crust is golden and apples are tender.
''',
        ),
        CookingStepModel(
          stepNumber: 8,
          utensilsID: ['ute-5'],
          ingredientsID: ['ing-10'],
          imagesUrl: [
            'https://i.pinimg.com/236x/79/46/cf/7946cf468cdf18c921fca4f32fe1ad7d.jpg',
          ],
          fontSize: FontSize.large,
          paragraph: '''
Heat __ing_ing-10 (apricot jam) until liquid and brush over warm galette for a glossy finish.__nl
Let cool slightly before serving.
''',
        ),
      ],
    ),
  ];

  final getAllTags = [
    TagModel(
      name: 'packed dinner',
      backgroundImage:
          'https://i.pinimg.com/236x/6a/0b/55/6a0b55624f8f4cf7f775c4f8125b8556.jpg',
      recipes: [],
    ),
    TagModel(
      name: 'baking',
      backgroundImage:
          'https://i.pinimg.com/236x/39/94/ae/3994ae82018f624dc7fbc42f8abf3426.jpg',
      recipes: [],
    ),
    TagModel(
      name: 'dessert',
      backgroundImage:
          'https://i.pinimg.com/236x/ca/69/66/ca69666a03921c7ee8d050713c8a2802.jpg',
      recipes: [],
    ),
    TagModel(
      name: 'quick meal',
      backgroundImage:
          'https://i.pinimg.com/474x/5e/85/bf/5e85bf8332b78f3e747367c7605aef7d.jpg',
      recipes: [],
    ),
  ];

  ReviewModel createReviews(CreateReviewModel review) => ReviewModel(
    id: '1',
    reviewerModel: ReviewerModel('userID-1', 'Ali Mohamed'),
    ref: null,
    subsRef: [],
    imagesUrl: review.imagesUrl,
    publishedAt: DateTime.now(),
    comment: review.comment,
    rating: null,
  );

  final getSubReviews = {
    'sub-1': SubReviewModel(
      id: 'sub-1',
      reviewerModel: ReviewerModel('1', 'Ali Mohamed'),
      publishedAt: DateTime(2024, 5, 1),
      comment: 'agree',
      mainReviewId: 'rev-1',
    ),
  };
}

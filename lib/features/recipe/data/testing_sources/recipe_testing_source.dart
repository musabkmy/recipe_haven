import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/recipe/data/models/details/measuring_unit_model.dart';
import 'package:recipe_haven/features/recipe/data/models/models.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_step_font_size.dart';

@Injectable()
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
        utensils: [
          UtensilModel(id: 'ute-1', name: 'knife'),
          UtensilModel(id: 'ute-2', name: 'cutting board'),
          UtensilModel(id: 'ute-3', name: 'bowl'),
          UtensilModel(id: 'ute-4', name: 'baking dish'),
          UtensilModel(id: 'ute-5', name: 'whisk'),
          UtensilModel(id: 'ute-6', name: 'food thermometer'),
        ],
        details: DetailsModel(baseIngredients: [
          IngredientModel(
              id: 'ing-1',
              name: 'whole chickens',
              baseUnit:
                  MeasuringUnitModel(name: 'kilogram', abbreviation: 'kg')),
          IngredientModel(
              id: 'ing-2',
              name: 'prunes',
              baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
          IngredientModel(
              id: 'ing-3',
              name: 'jarred pitted green olives',
              baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
          IngredientModel(
              id: 'ing-4',
              name: 'garlic',
              baseUnit:
                  MeasuringUnitModel(name: 'clovers', abbreviation: 'clovers')),
          IngredientModel(
              id: 'ing-5',
              name: 'capers',
              baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp')),
          IngredientModel(
              id: 'ing-6',
              name: 'dried oregano',
              baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp')),
          IngredientModel(id: 'ing-7', name: 'bay leaves'),
          IngredientModel(
              id: 'ing-8',
              name: 'chili powder',
              baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp')),
          IngredientModel(
              id: 'ing-9',
              name: 'honey',
              baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp')),
          IngredientModel(
              id: 'ing-10',
              name: 'salt',
              baseUnit: MeasuringUnitModel(name: 'tbsp', abbreviation: 'tbsp')),
          IngredientModel(
              id: 'ing-11',
              name: 'pepper',
              baseUnit: MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp')),
          IngredientModel(id: 'ing-12', name: 'lemon'),
        ], baseNutritious: [
          NutritionModel(id: 'nut-1', name: 'Cal'),
          NutritionModel(
              id: 'nut-2',
              name: 'Protein',
              baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
          NutritionModel(
              id: 'nut-3',
              name: 'Fat',
              baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
          NutritionModel(
              id: 'nut-4',
              name: 'Carb',
              baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
        ], servings: [
          PortionBasedRecipeModel(
              id: 'ser-1',
              portionCount: 4,
              difficulty: 'medium',
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
                WeightCountModel(id: 'nut-1', count: 72),
                WeightCountModel(id: 'nut-1', count: 60),
                WeightCountModel(id: 'nut-1', count: 30),
              ]),
          PortionBasedRecipeModel(
              id: 'ser-2',
              minPortionCount: 2,
              maxPortionCount: 3,
              difficulty: 'medium',
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
                    measuringUnit:
                        MeasuringUnitModel(name: 'tsp', abbreviation: 'tsp')),
                WeightCountModel(id: 'ing-11', count: 2),
                WeightCountModel(id: 'ing-12', count: 1),
              ],
              nutritious: [
                WeightCountModel(id: 'nut-1', count: 820),
                WeightCountModel(id: 'nut-1', count: 65),
                WeightCountModel(id: 'nut-1', count: 55),
                WeightCountModel(id: 'nut-1', count: 30),
              ]),
        ], defaultPortionBasedRecipeID: 'ser-1'),
        tags: ['herbs', 'dinner', '2024 trends'],
        reviews: [
          ReviewModel(
              id: 'rev-1',
              userID: 'userID-1',
              userName: 'Muhab',
              userProfilePic:
                  'https://i.pinimg.com/236x/e6/22/fb/e622fbfee64bbe2a9ea36adb7a1620b5.jpg',
              imagesUrl: [],
              rating: 4.5,
              publishedAt: DateTime(2024, 5, 4),
              description: 'Great recipe idea! eh The taste persisted'),
          ReviewModel(
              id: 'rev-2',
              userID: 'userID-2',
              userName: 'Alice',
              imagesUrl: [
                'https://i.pinimg.com/236x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
                'https://i.pinimg.com/236x/f7/c6/24/f7c6242addd8a1ebc91e07c69c2954e0.jpg'
              ],
              rating: 5.0,
              publishedAt: DateTime(2024, 5, 3),
              description:
                  'Absolutely loved it! The flavors were amazing and the instructions were easy to follow.'),
          ReviewModel(
              id: 'rev-3',
              userID: 'userID-3',
              userName: 'Bob',
              imagesUrl: [],
              rating: 3.5,
              publishedAt: DateTime(2024, 5, 2),
              description:
                  'Good recipe, but it took longer to cook than expected. The taste was decent though.'),
          ReviewModel(
              id: 'rev-4',
              userID: 'userID-4',
              userName: 'Charlie',
              imagesUrl: [
                'https://i.pinimg.com/236x/8d/cb/e7/8dcbe74e933d192bd2029874d9a30578.jpg'
              ],
              rating: 4.0,
              publishedAt: DateTime(2024, 5, 1),
              description:
                  'Solid recipe. I would recommend adding a bit more seasoning for extra flavor.'),
          ReviewModel(
              id: 'rev-5',
              userID: 'userID-5',
              userName: 'Diana',
              imagesUrl: [],
              rating: 2.0,
              publishedAt: DateTime(2024, 4, 30),
              description:
                  'Not a fan. The dish was too bland and the instructions were unclear.'),
          ReviewModel(
              id: 'rev-6',
              userID: 'userID-6',
              userName: 'Eve',
              userProfilePic:
                  'https://i.pinimg.com/236x/5c/95/31/5c9531d05f919414e9dff0c974388f67.jpg',
              imagesUrl: [
                'https://i.pinimg.com/236x/ff/b1/36/ffb136af8fc1c2125a2fbf2b5eca8d0f.jpg',
              ],
              rating: 4.8,
              publishedAt: DateTime(2024, 4, 29),
              description:
                  'Fantastic recipe! The dish was a hit at my dinner party. Will definitely make it again.'),
        ],
        cookingSteps: [
          CookingStepModel(
              stepNumber: '1',
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
'''),
          CookingStepModel(
              stepNumber: '2',
              utensilsID: ['ute-4'],
              ingredientsID: [
                'ing-2',
                'ing-3',
                'ing-5',
                'ing-7',
              ],
              imagesUrl: [
                'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg'
              ],
              fontSize: FontSize.large,
              paragraph: '''
Preheat your oven to 350°F (175°C).__nlRemove the chicken from the marinade and place it in a single layer in a large __utensil_ute_4 or roasting pan.
Scatter the __ing_ing-2, __ing_ing-3, __ing_ing-5, and __ing_ing-7 over the chicken.
Pour the remaining marinade over the chicken.
'''),
          CookingStepModel(
            stepNumber: '3',
            utensilsID: ['ute-4'],
            ingredientsID: [
              'ing-8',
              'ing-9',
            ],
            imagesUrl: [
              'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg'
            ],
            fontSize: FontSize.large,
            paragraph: '''
Pour __ing_ing-8 evenly over the chicken.__nl
Sprinkle __ing_ing-9 over the top of the chicken and other ingredients.
''',
          ),
          CookingStepModel(
            stepNumber: '4',
            utensilsID: ['ute-5'],
            ingredientsID: ['ing-3'],
            imagesUrl: [
              'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg'
            ],
            fontSize: FontSize.large,
            paragraph: '''
Place the dish in the preheated __utensil_ute-5 (oven) and bake for __timer_40m, basting occasionally with the pan juices.__nl
The chicken is done when it reaches an internal temperature of 165°F (74°C) and the skin is golden brown.
''',
          ),
          CookingStepModel(
            stepNumber: '5',
            utensilsID: ['ute-6'],
            ingredientsID: [
              'ing-2',
              'ing-3',
              'ing-6',
              'ing-10',
            ],
            imagesUrl: [
              'https://i.pinimg.com/236x/c6/51/f1/c651f16a0b7154beedc9890491d66109.jpg'
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
            'https://i.pinimg.com/736x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
        usersEngagement:
            EngagementModel(rating: 4.7, ratingCount: 2890, likesCount: 1200),
        creator: CreatorModel(
          id: 'creator-2',
          name: 'Giulia Rossi',
          profilePic:
              'https://i.pinimg.com/474x/f2/ec/bc/f2ecbcde9918a1b5f0806fd001c6fd7a.jpg',
          profession: 'Chef',
          portfolioLink: 'giulia-rossi.com',
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
              baseUnit:
                  MeasuringUnitModel(name: 'clove', abbreviation: 'clove'),
            ),
            IngredientModel(
              id: 'ing-6',
              name: 'Black pepper',
              baseUnit:
                  MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
            ),
            IngredientModel(
              id: 'ing-7',
              name: 'Salt',
              baseUnit:
                  MeasuringUnitModel(name: 'teaspoon', abbreviation: 'tsp'),
            ),
          ],
          baseNutritious: [
            NutritionModel(id: 'nut-1', name: 'Calories'),
            NutritionModel(
                id: 'nut-2',
                name: 'Protein',
                baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
            NutritionModel(
                id: 'nut-3',
                name: 'Fat',
                baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
            NutritionModel(
                id: 'nut-4',
                name: 'Carbs',
                baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
          ],
          servings: [
            PortionBasedRecipeModel(
              id: 'ser-1',
              portionCount: 4,
              difficulty: 'easy',
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
            id: 'rev-1',
            userID: 'userID-7',
            userName: 'Marco',
            userProfilePic:
                'https://i.pinimg.com/236x/e6/22/fb/e622fbfee64bbe2a9ea36adb7a1620b5.jpg',
            imagesUrl: [],
            rating: 5.0,
            publishedAt: DateTime(2024, 5, 4),
            description:
                'Perfect recipe! Tastes just like my grandmother’s carbonara.',
          ),
          ReviewModel(
            id: 'rev-2',
            userID: 'userID-8',
            userName: 'Sophia',
            imagesUrl: [
              'https://i.pinimg.com/236x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
            ],
            rating: 4.5,
            publishedAt: DateTime(2024, 5, 3),
            description:
                'Delicious and easy to make. I added a bit more cheese for extra flavor.',
          ),
        ],
        cookingSteps: [
          CookingStepModel(
            stepNumber: '1',
            utensilsID: ['ute-1'],
            ingredientsID: ['ing-1', 'ing-7'],
            imagesUrl: [
              'https://i.pinimg.com/236x/00/08/b2/0008b2e89b6bb952492a81d47be284c0.jpg',
            ],
            fontSize: FontSize.large,
            paragraph: '''
Bring a large pot of salted water to a boil.__nl
Add __ing_ing-1 (spaghetti) and cook until al dente. Reserve 1/2 cup of pasta water, then drain.
''',
          ),
          CookingStepModel(
            stepNumber: '2',
            utensilsID: ['ute-2'],
            ingredientsID: ['ing-2', 'ing-5'],
            imagesUrl: [
              'https://i.pinimg.com/236x/d5/16/8b/d5168b74359b82489f77bf14968b6adf.jpg',
            ],
            fontSize: FontSize.large,
            paragraph: '''
Heat a skillet over medium heat.__nl
Add __ing_ing-2 (pancetta) and cook until crispy.__nl
Add __ing_ing-5 (garlic) and sauté for 1 minute.
''',
          ),
          CookingStepModel(
            stepNumber: '3',
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
            stepNumber: '4',
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
            'https://i.pinimg.com/736x/bb/6a/6c/bb6a6c91c579bac5e3088de29299b459.jpg',
        usersEngagement:
            EngagementModel(rating: 4.9, ratingCount: 4500, likesCount: 2500),
        creator: CreatorModel(
          id: 'creator-3',
          name: 'Sophie Laurent',
          profilePic:
              'https://i.pinimg.com/474x/f2/ec/bc/f2ecbcde9918a1b5f0806fd001c6fd7a.jpg',
          profession: 'Pastry Chef',
          portfolioLink: 'sophie-laurent.com',
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
                baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
            NutritionModel(
                id: 'nut-3',
                name: 'Fat',
                baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
            NutritionModel(
                id: 'nut-4',
                name: 'Carbs',
                baseUnit: MeasuringUnitModel(name: 'gram', abbreviation: 'g')),
          ],
          servings: [
            PortionBasedRecipeModel(
              id: 'ser-1',
              portionCount: 4,
              difficulty: 'medium',
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
            id: 'rev-1',
            userID: 'userID-9',
            userName: 'Emma',
            userProfilePic:
                'https://i.pinimg.com/236x/e6/22/fb/e622fbfee64bbe2a9ea36adb7a1620b5.jpg',
            imagesUrl: [],
            rating: 5.0,
            publishedAt: DateTime(2024, 5, 4),
            description: 'Absolutely divine! The molten center is perfect.',
          ),
        ],
        cookingSteps: [
          CookingStepModel(
            stepNumber: '1',
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
            stepNumber: '2',
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
            stepNumber: '3',
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
    ];
  }
}

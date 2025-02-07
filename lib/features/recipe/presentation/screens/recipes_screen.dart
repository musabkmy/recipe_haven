import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes/get_recipes_cubit.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetRecipesCubit>().getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
        builder: (context, state) {
      debugPrint(state.toString());
      if (state case GetRecipesSuccess()) {
        return SafeArea(
          child: Center(
            child: GestureDetector(
              child: Text(state.recipes.first.title),
              onTap: () {},
            ),
          ),
        );
      } else if (state case GetRecipesFailure()) {
        return Center(
          child: Text(state.errorMsg),
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}

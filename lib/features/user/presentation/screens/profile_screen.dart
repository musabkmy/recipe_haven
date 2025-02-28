import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const id = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state case UserDataSuccess success) {
            return Center(child: Text(success.userData.name));
          }
          return Center(child: Text('something went wrong'));
        },
      ),
    );
  }
}

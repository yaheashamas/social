import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/components.dart';
import 'package:social/core/icons/icon_broken.dart';
import 'package:social/layout/cubit/home_cubit.dart';
import 'package:social/layout/cubit/home_state.dart';
import 'package:social/modules/new_post/new_post_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getUser(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetUserLoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoveToAddNewPostState) {
            navigateTo(context: context, Widget: NewPostScreen());
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: const [
                Icon(IconBroken.Notification),
                SizedBox(width: 5),
                Icon(IconBroken.Search),
                SizedBox(width: 10),
              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndexNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chart),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Upload),
                  label: "Post",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.User),
                  label: "Users",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: "Setting",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

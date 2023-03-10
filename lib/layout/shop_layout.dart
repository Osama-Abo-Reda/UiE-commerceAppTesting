import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/products/search_screen.dart';
import '../shared/components/widgets.dart';
import '../shared/cubit/shop_cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
            ),
            actions: [
              IconButton(
                onPressed: () => navigateTo(context, const SearchScreen()),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: BlocProvider.of<ShopCubit>(context)
              .bottomScreens[BlocProvider.of<ShopCubit>(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: ((value) =>
                BlocProvider.of<ShopCubit>(context).changeBottom(value)),
            currentIndex: BlocProvider.of<ShopCubit>(context).currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            useLegacyColorScheme: false,
          ),
        );
      },
    );
  }
}

import 'package:appdevassignment/feature/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:appdevassignment/feature/recommend/presentation/widgets/recommended_for_you.dart';
import 'package:appdevassignment/feature/recommend/presentation/widgets/top_app_bar.dart';
import 'package:appdevassignment/feature/recommend/presentation/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _getUserMobile(authState) {
    if (authState is AuthLoadSuccessState) {
      String? mob = authState.user?.mobileNumber;
      if (mob != null) {
        return mob;
      }
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: [
            TopAppBar(
              scaffoldKey: _scaffoldKey,
            ),
            UserDetails(
              authState: authState,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding:
                EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Text(
                  "Recommended For you",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const RecommendedForYou(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(_getUserMobile(authState)),
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

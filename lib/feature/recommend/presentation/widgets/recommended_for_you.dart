import 'package:appdevassignment/core/screens/something_went_wrong.dart';
import 'package:appdevassignment/feature/recommend/presentation/blocs/tournaments/tournament_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedForYou extends StatelessWidget {
  const RecommendedForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentBloc, TournamentState>(
      builder: (context, state) {
        if (state is TournamentLoadingState || state is TournamentInitial) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is TournamentLoadSuccessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 200,
                width: double.maxFinite,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  state.tournaments[index].coverUrl),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    state.tournaments[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          state.tournaments[index].gameName,
                                          style: const TextStyle(
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 0,
                                      child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Colors.grey,
                                            size: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              childCount: state.tournaments.length,
            ),
          );
        }

        return const SomeThingWentWrongPage();
      },
    );
  }
}

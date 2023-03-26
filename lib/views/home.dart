import 'package:bloc_implement/bloc/activity_bloc.dart';
import 'package:bloc_implement/bloc/activity_event.dart';
import 'package:bloc_implement/bloc/activity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 110, 44),
      appBar: AppBar(
        title: const Text('Shemsu Suk'),
        foregroundColor: Color.fromARGB(255, 255, 253, 253),
        backgroundColor: Color.fromARGB(255, 59, 58, 58),
      ),
      body: BlocBuilder<activityBloc, ActivityState>(
        builder: (context, state) {
        BlocProvider.of<itemBloc>(context).add(GetDataButtonPressed());
          if (state is ActivityLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ActivitySuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * .88,
              child: ListView.builder(
                itemCount: state.grocery.length,
                itemBuilder: (BuildContext context, int index) {
                  final asbezaVal = state.grocery[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(asbezaVal.image))),
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .3,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 5),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(asbezaVal.foodTitle),
                                    Text(
                                      "${asbezaVal.foodPrice}\$",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

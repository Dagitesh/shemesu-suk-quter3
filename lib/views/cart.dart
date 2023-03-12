import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';
import '../bloc/activity_state.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('ASBEZA'),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white),
      body: BlocBuilder<activityBloc, ActivityState>(
        builder: (context, state) {
          if (state is TestInitialState) {
            return const Center(
                child: Text(
              "NO Purchase.\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ));
          }
          if (state is ActivityLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ActivitySuccess) {
            if (state.purchase_History.isEmpty) {
              return const Center(
                  child: Text(
                "NO Purchase\n TOTAL: 0\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ));
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var element in state.purchase_History) {
                  TotalPrice += element.price;
                }
              }

              _incrementCounter();
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * .84,
                    child: ListView.builder(
                      itemCount: state.purchase_History.length,
                      itemBuilder: (BuildContext context, int index) {
                        final value = state.purchase_History[index];
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
                                              image:
                                                  NetworkImage(value.image))),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 5),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(value.title),
                                          Text(
                                            "${value.price}\$",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}

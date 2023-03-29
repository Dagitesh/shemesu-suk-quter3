import 'package:shemsu_suk/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shemsu_suk/model/item.dart';

import '../bloc/activity_blocc.dart';
import '../bloc/activity_event.dart';
import '../bloc/activity_state.dart';
import 'cart.dart';

class item extends StatefulWidget {
  const item({super.key});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Groceries',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 132, 121, 236),
        actions: [
          IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 17, 221, 51),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Color.fromARGB(255, 17, 221, 51),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => cart(counter)));
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 161, 233, 199),
      body: Center(
        child: BlocBuilder<itemBloc, itemState>(builder: (context, state) {
          if (state is itemInitialState) {
            BlocProvider.of<itemBloc>(context).add(GetDataButtonPressed());
          } else if (state is itemLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is itemFailState) {
            return Text(state.message);
          } else if (state is itemSuccessState) {
            return Column(
              children: [
                Container(height: 50,
                width: 100,
                color: Color.fromARGB(255, 8, 127, 196),),
                Expanded(child: 
                ListView.builder(
                      
                      itemCount: state.activity.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = state.activity[index];
                         
                         
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Row(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 360,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromARGB(248, 255, 255, 255),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  child: Image.network(
                                                    items.image,
                                                    width: 100,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  .4,
                                                              child: Text(
                                                                items.title,
                                                                style:
                                                                    TextStyle(fontSize: 16),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  .1,
                                                              child: Text(
                                                                '${items.price}', // Replace with actual price
                                                                // ignore: prefer_const_constructors
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    // ignore: prefer_const_constructors
                                                                    color: Color.fromARGB(
                                                                        255, 7, 202, 209)),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                
                                                                ElevatedButton.icon(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          padding:
                                                                              EdgeInsets
                                                                                  .all(10),
                                                                          minimumSize:
                                                                              const Size(
                                                                                  50, 8),
                                                                          alignment:
                                                                              Alignment
                                                                                  .center,
                                                                          elevation: 10),
                                                                  onPressed: () {
                                                                    BlocProvider.of<
                                                                                itemBloc>(
                                                                            context)
                                                                        .add(
                                                                            PurchaseHistoryEvent(
                                                                                asbeza:
                                                                                    items));
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons.add_shopping_cart,
                                                                    color: Color.fromARGB(
                                                                        255, 0, 0, 0),
                                                                  ),
                                                                  label: Text(""),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  
            
                )
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}

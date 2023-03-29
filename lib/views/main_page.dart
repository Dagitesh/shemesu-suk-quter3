import 'package:bloc_implement/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shemsu Suk'),
        foregroundColor: Color.fromARGB(255, 252, 252, 252),
        backgroundColor: Color.fromARGB(255, 128, 128, 128),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 17, 221, 51),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 59, 57, 57),
      body: 
      ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Color.fromARGB(255, 214, 214, 214),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180,
                                    child: Image.network(
                                      'https://media.gettyimages.com/photos/golden-onions-on-rustic-wooden-background-picture-id480134211',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ONIION',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Description',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                '\$10.00', // Replace with actual price
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 36,
                                              ),
                                              ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(10),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 223, 40, 7),
                                                    minimumSize:
                                                        const Size(50, 8),
                                                    alignment: Alignment.center,
                                                    elevation: 10),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/cart');
                                                },
                                                icon: const Icon(
                                                    Icons.add_shopping_cart),
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
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Color.fromARGB(255, 214, 214, 214),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: Image.network(
                                      'https://media.gettyimages.com/photos/golden-onions-on-rustic-wooden-background-picture-id480134211',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ONIION',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Description',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                '\$10.00', // Replace with actual price
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 32,
                                              ),
                                              ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(10),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 223, 40, 7),
                                                    minimumSize:
                                                        const Size(50, 8),
                                                    alignment: Alignment.center,
                                                    elevation: 10),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/cart');
                                                },
                                                icon: const Icon(
                                                    Icons.add_shopping_cart),
                                                label: Text("."),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

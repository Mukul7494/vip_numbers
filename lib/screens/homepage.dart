import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
import 'package:vip_number_app/model/numberModel.dart';

import '../widget/square.dart';
import 'drawerHeader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
// late List<Number> numbers;

class _HomePageState extends State<HomePage> {
  final numberIndex = 0;
  String search = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final numberGetter = ref.watch(numberProvider);
        return Scaffold(
          floatingActionButton: const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.call),
          ),
          appBar: AppBar(
            title: const Text("VIP Numbers"),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    const MyDrawerHeader(),
                    ListTile(
                      onTap: (() {
                        null;
                        // context.go('');
                      }),
                      title: const Text("Filter"),
                      leading: const Icon(Icons.filter),
                    ),
                    const ListTile(
                      title: Text("Contact Us"),
                      leading: Icon(Icons.contact_page),
                    ),
                    const ListTile(
                      title: Text("About Us"),
                      leading: Icon(
                        Icons.person_pin_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        search = value.toString();
                      });
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search..',
                        border: const OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          child: const Icon(Icons.clear),
                          onTap: () {
                            searchController.clear();
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: numberGetter.getNumber.length,
                      itemBuilder: (BuildContext context, int index) {
                        String number2 =
                            numberGetter.getNumber[index].number.toString();
                        // print(number2);
                        if (searchController.text.isEmpty) {
                          return Square(
                            index: index,
                            price: numberGetter.getNumber[index].price,
                            number: numberGetter.getNumber[index].number,
                          );
                        } else if (number2.contains(search.toLowerCase())) {
                          return Square(
                            index: index,
                            price: numberGetter.getNumber[index].price,
                            number: numberGetter.getNumber[index].number,
                          );
                        } else {
                          // ignore: avoid_unnecessary_containers
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget buildSearch() => SearchPage(text: query, onChanged: searchNumber);
  // void searchNumber(int number) {
  //   final number1 = numbers.where((number) {
  //     final search = numbers.iterator.current.id;

  //     return search.contains(number);
  //   }).toList();
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
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
              child: Column(
                children: [
                  MyDrawerHeader(),
                  ExpansionTile(
                    title: Text("Filter"),
                    leading: Icon(Icons.filter),
                    children: [
                      Padding(padding: EdgeInsets.all(0)),
                      ListTile(
                        title: Text("All"),
                        visualDensity: VisualDensity(vertical: -4),
                        onTap: () {
                          search = '';

                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        title: Text("786"),
                        visualDensity: VisualDensity(vertical: -4),
                        onTap: () {
                          search = '786';
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -4),
                        title: Text("ABC ABC"),
                        onTap: () {
                          search = "ABC ABC";
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -4),
                        title: Text("AB AB AB"),
                        onTap: () {
                          search = 'AB AB AB';
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -4),
                        title: Text("12345"),
                        onTap: () {
                          search = '12345';
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -4),
                        title: Text("AAA BBB"),
                        onTap: () {
                          search = 'AAA BBB';
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text("Contact Us"),
                    leading: Icon(Icons.contact_page),
                  ),
                  ListTile(
                    title: Text("About Us"),
                    leading: Icon(
                      Icons.person_pin_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
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
                            setState(() {
                              searchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
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
                        String filterNumber =
                            numberGetter.getNumber[index].filter.toLowerCase();

                        if (search.isEmpty) {
                          return Square(
                            index: index,
                            price: numberGetter.getNumber[index].price,
                            number: numberGetter.getNumber[index].number,
                          );
                        }

                        if (number2.contains(search.toLowerCase()) ||
                            filterNumber.contains(search.toLowerCase())) {
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
}

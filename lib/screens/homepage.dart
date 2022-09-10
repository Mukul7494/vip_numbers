import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vip_number_app/model/numberModel.dart';

import '../widget/square.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final numberProvider =
            ChangeNotifierProvider((ref) => NumberProvider());
        final numberGetter = ref.watch(numberProvider);
        return Scaffold(
          appBar: AppBar(
            title: Text("VIP Numbers"),
            actions: [
              IconButton(
                  onPressed: () {
                    context.go("/Search");
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          drawer: Drawer(),
          body: ListView.builder(
            itemCount: numberGetter.number.length,
            itemBuilder: (BuildContext context, int index) {
              return Square(
                price: numberGetter.number[index]['price'],
                number: numberGetter.number[index]['number'],
              );
            },
          ),
        );
      },
    );
  }
}

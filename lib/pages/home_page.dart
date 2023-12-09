import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_login_screen_test/models/data_model.dart';
import 'package:pin_login_screen_test/widgets/details_container.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Future<List<User>> fetchLocalJson() async {
    String jsonString = await rootBundle.loadString('assets/users_list.json');

    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> usersJson = data["Response"]["Users"];

    List<User> users =
        usersJson.map((userJson) => User.fromJson(userJson)).toList();

    return users;
  }

  @override
  Widget build(BuildContext context) {
    //final querry = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: FutureBuilder(
          future: fetchLocalJson(),
          builder: (context, snapshot) {
            //print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Text("error");
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: .7),
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          return DetailsContainer(
                            image: data.image,
                            email: data.email,
                            location: data.region,
                            name: data.name,
                            number: data.mobile,
                          );
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
// 

import 'package:flutter/material.dart';
import 'package:pin_login_screen_test/provider/home_page_provider.dart';
import 'package:pin_login_screen_test/widgets/details_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userListProvider = Provider.of<HomePageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (query) => userListProvider.searchUsers(query),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: .7,
                ),
                itemBuilder: (context, index) {
                  final data = userListProvider.displayedUsers[index];
                  return DetailsContainer(
                    image: data.image,
                    email: data.email,
                    location: data.zone,
                    region: data.region,
                    name: data.name,
                    number: data.mobile,
                  );
                },
                itemCount: userListProvider.displayedUsers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

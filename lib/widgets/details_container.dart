import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final String number;
  final String location;

  const DetailsContainer({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    required this.number,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    //final querry = MediaQuery.of(context).size;
    return Container(
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    image,
                    width: 100.0, // Adjust the width and height as needed
                    height: 100.0,
                    fit: BoxFit
                        .cover, // Ensure the image covers the entire CircleAvatar
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  number,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

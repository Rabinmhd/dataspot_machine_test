import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final String number;
  final String location;
  final String region;

  const DetailsContainer({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    required this.number,
    required this.region,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    //final querry = MediaQuery.of(context).size;
    return Container(
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
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: const EdgeInsets.all(4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  region + number,
                  style: const TextStyle(color: Colors.black, fontSize: 10),
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
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foot_balls_sport/Widget/favorit_list_team.dart';
import 'package:foot_balls_sport/controller/favoriteTeamController.dart';
import 'package:foot_balls_sport/database/database_helper.dart';
import 'package:get/get.dart'; // Import GetX untuk State Management

class Profile extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final FavoriteTeamController favoriteTeamController = Get.put(FavoriteTeamController()); // Inisialisasi Controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                // Profile Picture
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/v2/D4E03AQG5N80BR9em3Q/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1698369081781?e=1733356800&v=beta&t=lVGzoEdMEG-It0eQUDrsOPhqTwVCVVxxPCoFaHniaC8',
                  ),
                ),
                const SizedBox(height: 16),
                // User Name
                const Text(
                  'Satria Rudi Pratama',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // User Bio
                const Text(
                  'Game Developer wannabe',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Additional Information
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Additional Information',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          'Email: Pratamazone1@gmail.com',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Phone: +62-812-3456-7890',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Location: Pati, Indonesia',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Tambahkan jarak sebelum Tim Favorit
                // Favorite Teams
               const SizedBox(height: 10),
                FavoriteTeamList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

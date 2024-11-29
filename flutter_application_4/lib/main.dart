import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedicalAppHomePage(),
    );
  }
}

class MedicalAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLocationBar(),
                SizedBox(height: 16),
                _buildSearchBar(),
                SizedBox(height: 16),
                _buildPromoBanner(),
                SizedBox(height: 16),
                _buildCategories(),
                SizedBox(height: 16),
                _buildNearbyMedicalCenters(),
                SizedBox(height: 16),
                _buildDoctorsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 8),
            Text('Chişinău, Republic of Moldova'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        CircleAvatar(
          backgroundImage: AssetImage('lib/img/IMG_5617.JPG'),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search doctor...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 190,
      child: Row(
        children: [
          Image.asset('lib/img/baner.png'),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.book, 'label': 'Dentistry'},
      {'icon': Icons.favorite, 'label': 'Cardiology'},
      {'icon': Icons.air, 'label': 'Pulmonology'},
      {'icon': Icons.medical_services, 'label': 'General'},
      {'icon': Icons.psychology, 'label': 'Neurology'},
      {'icon': Icons.food_bank, 'label': 'Gastroentero'},
      {'icon': Icons.science, 'label': 'Laboratory'},
      {'icon': Icons.vaccines, 'label': 'Vaccination'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See All'),
            ),
          ],
        ),
        SizedBox(height: 4),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.9,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length]
                        .shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(categories[index]['icon']),
                ),
                SizedBox(height: 4),
                Text(
                  categories[index]['label'],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildNearbyMedicalCenters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Medical Centers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See All'),
            ),
          ],
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMedicalCenterCard(
                'Sunrise Health Clinic',
                '123 Oak Street, CA 98765',
                5.0,
                58,
                2.5,
                40,
                'lib/img/spi1.jpg',
              ),
              SizedBox(width: 16),
              _buildMedicalCenterCard(
                'Golden Cardiology',
                '555 Bridge Street',
                4.9,
                106,
                2.5,
                40,
                'lib/img/spi2.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMedicalCenterCard(
    String name,
    String address,
    double rating,
    int reviews,
    double distance,
    int duration,
    String imagePath,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath,
                  height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(address, style: TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text('$rating'),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 244, 162, 10), size: 16),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 244, 162, 10), size: 16),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 244, 162, 10), size: 16),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 244, 162, 10), size: 16),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 244, 162, 10), size: 16),
                  Text('($reviews Reviews)'),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.car_crash_sharp, color: Colors.grey, size: 14),
                  Text(' $distance km / $duration min        '),
                  Icon(Icons.medication_sharp, color: Colors.grey, size: 14),
                  Text('Hospital'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Doctor>> loadDoctors() async {
    final String response = await rootBundle.loadString('lib/dooctors.json');
    final List<dynamic> data = json.decode(response);
    return data.map((doctorJson) => Doctor.fromJson(doctorJson)).toList();
  }

  Widget _buildDoctorsList() {
    return FutureBuilder<List<Doctor>>(
      future: loadDoctors(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load doctors'));
        } else {
          final doctors = snapshot.data ?? [];
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return _buildDoctorCard(doctors[index]);
            },
          );
        }
      },
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return Card(
      margin: EdgeInsets.only(bottom: 17),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                doctor.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(doctor.specialty),
                  Text(doctor.location),
                  Row(
                    children: [
                      Text('${doctor.rating}'),
                      Icon(Icons.star, color: Color.fromARGB(255, 242, 134, 33), size: 16),
                      Text('(${doctor.reviews} Reviews)'),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.favorite_border),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String location;
  final double rating;
  final int reviews;
  final String image;

  Doctor({
    required this.name,
    required this.specialty,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      location: json['location'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      image: json['image'],
    );
  }
}

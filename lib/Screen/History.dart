import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildItemProfile(
                title: 'Paket Data',
                subtitle: 'Rp 100.000',
                image: "assets/images/keluar.png",
              ),
              SizedBox(height: 20),
              buildItemProfile(
                title: 'Premium Vidio',
                subtitle: 'Rp 100.000',
                image: "assets/images/keluar.png",
              ),
              SizedBox(height: 20),
              buildItemProfile(
                title: 'Premium Spotify',
                subtitle: 'Rp 30.000',
                image: "assets/images/keluar.png",
              ),
              SizedBox(height: 20),
              buildItemProfile(
                title: 'Makan',
                subtitle: 'Rp 20.000',
                image: "assets/images/keluar.png",
              ),
              SizedBox(height: 20),
              buildItemProfile(
                title: 'Bensin',
                subtitle: 'Rp 100.000',
                image: "assets/images/keluar.png",
              ),
              SizedBox(height: 20),
              buildItemProfile(
                title: 'healing',
                subtitle: 'Rp 150.000',
                image: "assets/images/keluar.png",
              ),
              SizedBox(height: 20),
              buildItemProfile(
                title: 'Uang Bulanan',
                subtitle: 'Rp 2.000.000',
                image: "assets/images/masuk.png",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemProfile({
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20, // Ubah ukuran teks
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 18, // Ubah ukuran teks
              color: Colors.black,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 30, // Ubah ukuran gambar
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                width: 40, // Ubah ukuran gambar
                height: 40, // Ubah ukuran gambar
              ),
            ),
          ),
        ),
      ),
    );
  }
}
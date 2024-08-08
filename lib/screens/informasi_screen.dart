import 'package:flutter/material.dart';

class InformasiScreen extends StatelessWidget {
  final List<InformasiItem> items = [
    InformasiItem(
      imageUrl: 'images/kantor1.jpg',
      title: 'Hari libur tahun baru 2023 diundur ke bulan maret',
      date: '1 Agustus 2023',
    ),
    InformasiItem(
      imageUrl: 'images/bg.jpg',
      title: ' Agenda Libur Bersama',
      date: '16 Juli 2023',
    ),
    InformasiItem(
      imageUrl: 'images/lembur.png',
      title: 'Gajian Bulan ini dipercepat lima hari',
      date: '9 Maret 2023',
    ),
    InformasiItem(
      imageUrl: 'images/kantor1.jpg', // Path harus sesuai dengan `pubspec.yaml`
      title: 'Selamat Ulang Tahun Dorry',
      date: '8 Februari 2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(item.title),
            subtitle: Text(item.date),
          ),
        );
      },
    );
  }
}

class InformasiItem {
  final String imageUrl;
  final String title;
  final String date;

  InformasiItem({required this.imageUrl, required this.title, required this.date});
}

import 'package:flutter/material.dart';
import 'package:pertemuan7/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
                child: const Text("Menuju halaman 2")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second',
                      arguments: "Menggunakan route");
                },
                child: const Text("menggunakan route"))
          ],
        ),
      ),
    );
  }
}

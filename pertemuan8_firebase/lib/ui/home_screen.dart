import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modul6/ui/login.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Note'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  GoogleSignIn().signOut();
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false));
                },
              )
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                              controller: titleController,
                              decoration:
                                  const InputDecoration(hintText: 'Title')),
                          const SizedBox(height: 10.0),
                          SizedBox(
                              height: 300,
                              child: TextFormField(
                                  controller: noteController,
                                  maxLines: null, // Set this
                                  expands: true, // and this
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      hintText: 'Write a note', filled: true))),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          try {
                                            DocumentReference docRef =
                                                await _firestore
                                                    .collection('taks')
                                                    .add({
                                              'title': titleController.text,
                                              'note': noteController.text,
                                              'timestamp':
                                                  FieldValue.serverTimestamp(),
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Note ditambahkan')),
                                            );
                                            Navigator.pop(context);
                                          } catch (e) {
                                            print(e);
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(content: Text('$e')),
                                            );
                                          }
                                        }
                                      },
                                      child: const Text('Save'))))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: const Center());
  }
}

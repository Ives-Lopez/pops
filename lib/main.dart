import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),)
  );
 
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {


    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Resume Info'),
        trailing: CupertinoButton(
          child: const Icon(
            CupertinoIcons.chevron_right,
            size: 20,
            color: CupertinoColors.destructiveRed,
          ),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('List of Members'),
                  content: Column(
                    children: [
                      ClipOval(child: Image.asset('images/ivan.jpg',height: 50,)),
                      const Text('Ivan G. Lopez'),
                      const Text('BSCS-3A'),
                      ClipOval(child: Image.asset('images/ives.jpg',height: 50,)),
                      const Text('Ives G. Lopez'),
                      const Text('BSCS-3A'),
                    ],
                  ),
                  actions: [
                    CupertinoButton(
                      child: const Text(
                        'Close',
                        style: TextStyle(color: CupertinoColors.destructiveRed),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),



      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactInfo(
                imagePath: 'images/ivan.jpg',
                name: 'Ivan G. Lopez',
                address: 'Santiago Sta Ana Pampanga',
                phoneNumber: '0907-568-0924',
                email: 'ivanlopezglm@gmail.com',
              ),
              const Divider( // Add a divider here
                height: 50,
                thickness: 3,
                color: Colors.grey,
              ),
              _buildContactInfo(
                imagePath: 'images/ives.jpg',
                name: 'Ives G. Lopez',
                address: 'Santiago Sta Ana Pampanga',
                phoneNumber: '0907-597-0824',
                email: 'iveslopezf2p@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required String imagePath,
    required String name,
    required String address,
    required String phoneNumber,
    required String email,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Address: $address'),
              Text('Phone: $phoneNumber'),
              Text('Email: $email'),
            ],
          ),
        ),
      ],
    );
  }
}

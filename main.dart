import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Voting System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<int> voteCounts = [0, 0, 0, 0];

  void _incrementVote(int index) {
    setState(() {
      voteCounts[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Voting System'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFD8BFD8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildVoteRow('assets/image1.jpg', 'Mcdo', voteCounts[0], 0),
              _buildVoteRow('assets/image2.jpg', 'Jollibee', voteCounts[1], 1),
              _buildVoteRow(
                  'assets/manginasal.jpg', 'Mang Inasal', voteCounts[2], 2),
              _buildVoteRow('assets/image4.jpg', 'Chowking', voteCounts[3], 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVoteRow(
      String imagePath, String dishName, int voteCount, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFFC0CB),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            color: Colors.pink,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 80, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  dishName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Votes: $voteCount',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: Colors.white),
                    onPressed: () => _incrementVote(index),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

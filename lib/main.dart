import 'package:flutter/material.dart';

void main() {
  runApp(const StreamUXSimple());
}

class StreamUXSimple extends StatelessWidget {
  const StreamUXSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StreamUX Demo",
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: Color(0xFF0D0D0D),
        fontFamily: 'Poppins',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static const List<Map<String, String>> movies = [
    {"title": "Oppenheimer", "image": "image/oppenheimer.png"},
    {"title": "Dune 2", "image": "image/dune2.png"},
    {"title": "John Wick 4", "image": "image/johnwick.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STREAMING31"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      // BODY
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Trending Now",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (context, _) => const SizedBox(width: 12),
              itemBuilder: (context, i) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    movies[i]["image"]!,
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            "Continue Watching",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("image/naruto.png"),
                fit: BoxFit.cover,
                opacity: 0.6,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Naruto Shippuden",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            "Popular on StreamUX",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("image/bleach.png"),
                fit: BoxFit.cover,
                opacity: 0.6,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Bleach",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),

      // BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        currentIndex: selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white60,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

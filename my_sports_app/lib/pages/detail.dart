import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ข้อมูลบุคคล (เพิ่มนามสกุลและจำนวนคนให้มากขึ้น)
  final List<Map<String, dynamic>> people = [
    {
      'firstName': 'สมชาย',
      'lastName': 'รักชาติ',
      'age': 30,
      'weight': 75,
      'gender': 'ชาย'
    },
    {
      'firstName': 'สมหญิง',
      'lastName': 'สมบัติ',
      'age': 25,
      'weight': 55,
      'gender': 'หญิง'
    },
    {
      'firstName': 'ธนากร',
      'lastName': 'ยิ่งยง',
      'age': 40,
      'weight': 80,
      'gender': 'ชาย'
    },
    {
      'firstName': 'อารี',
      'lastName': 'ใจดี',
      'age': 28,
      'weight': 60,
      'gender': 'หญิง'
    },
    {
      'firstName': 'ชูชาติ',
      'lastName': 'มั่นคง',
      'age': 35,
      'weight': 78,
      'gender': 'ชาย'
    },
    {
      'firstName': 'นงนุช',
      'lastName': 'งามพร้อม',
      'age': 22,
      'weight': 53,
      'gender': 'หญิง'
    },
    {
      'firstName': 'บรรจง',
      'lastName': 'เก่งกาจ',
      'age': 50,
      'weight': 90,
      'gender': 'ชาย'
    },
    {
      'firstName': 'แก้วตา',
      'lastName': 'สดใส',
      'age': 33,
      'weight': 62,
      'gender': 'หญิง'
    },
    {
      'firstName': 'ประวิตร',
      'lastName': 'สุขสบาย',
      'age': 45,
      'weight': 85,
      'gender': 'ชาย'
    },
    {
      'firstName': 'สุภาภรณ์',
      'lastName': 'รุ่งเรือง',
      'age': 29,
      'weight': 59,
      'gender': 'หญิง'
    },
    {
      'firstName': 'วิชัย',
      'lastName': 'ก้าวหน้า',
      'age': 38,
      'weight': 72,
      'gender': 'ชาย'
    },
    {
      'firstName': 'วลัยลักษณ์',
      'lastName': 'เริงร่า',
      'age': 27,
      'weight': 56,
      'gender': 'หญิง'
    },
    {
      'firstName': 'ศักดิ์ชัย',
      'lastName': 'โชคดี',
      'age': 48,
      'weight': 88,
      'gender': 'ชาย'
    },
    {
      'firstName': 'พรพิมล',
      'lastName': 'มีสุข',
      'age': 31,
      'weight': 65,
      'gender': 'หญิง'
    },
    {
      'firstName': 'อำนาจ',
      'lastName': 'ผาสุก',
      'age': 55,
      'weight': 95,
      'gender': 'ชาย'
    },
    {
      'firstName': 'มาลี',
      'lastName': 'ศรีไทย',
      'age': 24,
      'weight': 52,
      'gender': 'หญิง'
    },
    {
      'firstName': 'เอกชัย',
      'lastName': 'พิทักษ์',
      'age': 32,
      'weight': 70,
      'gender': 'ชาย'
    },
    {
      'firstName': 'จินตนา',
      'lastName': 'สุขสงบ',
      'age': 37,
      'weight': 68,
      'gender': 'หญิง'
    },
    {
      'firstName': 'พีระพล',
      'lastName': 'มั่งคั่ง',
      'age': 42,
      'weight': 82,
      'gender': 'ชาย'
    },
    {
      'firstName': 'รัตนา',
      'lastName': 'เจริญ',
      'age': 26,
      'weight': 57,
      'gender': 'หญิง'
    },
  ];

  late ScrollController _scrollController;
  bool _showBottomBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_showBottomBar) {
        setState(() {
          _showBottomBar = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_showBottomBar) {
        setState(() {
          _showBottomBar = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // คำนวณจำนวนคน, ชาย, หญิง
    final totalPeople = people.length;
    final maleCount =
        people.where((person) => person['gender'] == 'ชาย').length;
    final femaleCount =
        people.where((person) => person['gender'] == 'หญิง').length;

    return MaterialApp(
      title: 'My List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.anuphanTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: false,
              title: const Text(
                'ข้อมูลบุคคล',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 2.0,
              shadowColor: Colors.black.withOpacity(0.5),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: InkWell(
                    onTap: () {
                      print('User icon pressed!');
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                margin: const EdgeInsets.all(16.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'คนทั้งหมด',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '$totalPeople',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'ชาย',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '$maleCount',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'หญิง',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '$femaleCount',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // <<<<<<<<<<<< เพิ่มปุ่มสำหรับไปหน้าถัดไป <<<<<<<<<<<<
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // ใช้ Navigator.push เพื่อไปยัง NextPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NextPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // สีปุ่ม
                    foregroundColor: Colors.white, // สีข้อความบนปุ่ม
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:
                      const Text('ไปหน้าถัดไป', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            // >>>>>>>>>>>>>>>>>> สิ้นสุดการเพิ่มปุ่ม >>>>>>>>>>>>>>>>>>>>>>>>>>
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final person = people[index];
                  return PersonListItem(person: person);
                },
                childCount: people.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: AnimatedOpacity(
          opacity: _showBottomBar ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: _showBottomBar ? 58 : 0.0,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: 0,
              onTap: (index) {
                print('Bottom Bar Item $index tapped!');
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PersonListItem extends StatelessWidget {
  final Map<String, dynamic> person;

  const PersonListItem({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.zero,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: Text(
              person['firstName'] != null && person['firstName'].isNotEmpty
                  ? person['firstName'][0].toUpperCase()
                  : '?',
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text('${person['firstName']} ${person['lastName']}'),
          subtitle: Text(
            'อายุ: ${person['age']} ปี, น้ำหนัก: ${person['weight']} กก.',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            print('Tapped on: ${person['firstName']} ${person['lastName']}');
          },
        ),
      ),
    );
  }
}

// <<<<<<<<<<<< หน้าใหม่ (NextPage) <<<<<<<<<<<<
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าถัดไป'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'คุณมาถึงหน้าถัดไปแล้ว!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ใช้ Navigator.pop เพื่อกลับไปหน้าก่อนหน้า
                Navigator.pop(context);
              },
              child: const Text('กลับไปหน้าหลัก'),
            ),
          ],
        ),
      ),
    );
  }
}
// >>>>>>>>>>>>>>>>>> สิ้นสุดหน้าใหม่ <<<<<<<<<<<<<<

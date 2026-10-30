import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainTabScreen(),
    );
  }
}

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas Latihan Flutter'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Latihan 1', icon: Icon(Icons.badge)),
              Tab(text: 'Latihan 2', icon: Icon(Icons.add_circle)),
              Tab(text: 'Latihan 3', icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Latihan1Screen(),
            Latihan2Screen(),
            Latihan3Screen(),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// LATIHAN 1: Stateless Widget (Kartu Mahasiswa)
// ==========================================
class KartuMahasiswa extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;

  const KartuMahasiswa({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text('NIM: $nim', style: TextStyle(color: Colors.grey.shade700)),
            Text('Prodi: $prodi', style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}

class Latihan1Screen extends StatelessWidget {
  const Latihan1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 12),
          KartuMahasiswa(
            nama: 'Fajar',
            nim: '3012410014',
            prodi: 'Informatika',
          ),
          KartuMahasiswa(
            nama: 'Stepen',
            nim: '3012410015',
            prodi: 'Sistem Informasi',
          ),
          KartuMahasiswa(
            nama: 'Ujik',
            nim: '3012410016',
            prodi: 'Data Science',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// LATIHAN 2: Stateful Widget (Counter + Reset)
// ==========================================
class Latihan2Screen extends StatefulWidget {
  const Latihan2Screen({super.key});

  @override
  State<Latihan2Screen> createState() => _Latihan2ScreenState();
}

class _Latihan2ScreenState extends State<Latihan2Screen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Nilai Counter:',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _decrementCounter,
                icon: const Icon(Icons.remove),
                label: const Text('Kurang'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: _resetCounter,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.add),
                label: const Text('Tambah'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// LATIHAN 3: Layout (Halaman Profil)
// ==========================================
class Latihan3Screen extends StatelessWidget {
  const Latihan3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pratama',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Mobile Developer',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  Icon(Icons.phone, color: Colors.blue),
                  Icon(Icons.language, color: Colors.blue),
                  Icon(Icons.share, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
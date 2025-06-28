import 'package:flutter/material.dart';
import 'package:new_stocks/screen/BarcodeScannerScreen.dart';
import 'package:new_stocks/screen/multiplees.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> modules = [
    'ncc-items',
    'scout-items',
    'shoes',
    'summer-cap',
    'barret-cap',
    'tshirt',
    'security-items',
    'belts',
    'peak-cap',
    'socks',
    'uniforms',
    'other-items',
    'lanyard',
    'khakhi-fabric',
  ];

  List<String> filteredModules = [];

  @override
  void initState() {
    super.initState();
    filteredModules = List.from(modules);
  }

  void filterModules(String query) {
    setState(() {
      filteredModules =
          modules
              .where(
                (module) => module.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  List<String> getSubCategoriesFor(String module) {
    switch (module) {
      case 'ncc-items':
        return [
          'wingz-green-cap',
          'NCC Tracksuit',
          'Ceremonial Item Ncc',
          'NCC-all-items',
        ];
      case 'scout-items':
        return ['scout and guide all items', ' scout and guide fabric'];
      case 'shoes': //remaining to add the list
        return ['Parade Shoes', 'Sports Shoes', 'Boots'];
      case 'summer-cap':
        return ['summer-cap'];
      case 'barret-cap':
        return [
          'soft-touch blue',
          'khakhi barret cap',
          'attack blue',
          'wingz black cap',
          'air wingz preium blue',
        ];
      case 'tshirt':
        return [
          'Cotton T-Shirts',
          'Dry Fit T-Shirts',
        ]; //remaining to add the list
      case 'security-items':
        return [
          'security t-shirt',
          'security jacket',
          'plain black-tshirt',
          'unknown',
        ];
      case 'belts':
        return ['Leather Belt', 'naylon Belt'];
      case 'peak-cap':
        return ['Police Cap', 'Military Cap']; //remaining to add the list
      case 'socks':
        return ['cut Socks', 'long Socks'];
      case 'uniforms':
        return ['uniforms and safari'];
      case 'other-items':
        return ['Notebooks', 'Flags', 'Gloves']; //remaining to add the list
      case 'lanyard':
        return [' Lanyard'];
      case 'khakhi-fabric':
        return ['G-oswell'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 213, 245),
      appBar: AppBar(
        title: const Text('Dashboard'),
        toolbarHeight: 90,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BarcodeScannerScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search modules...',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: filterModules,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 7 / 2,
                ),
                itemCount: filteredModules.length,
                itemBuilder: (context, index) {
                  String module = filteredModules[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => SubCategoryScreen(
                                title: module,
                                subCategories: getSubCategoriesFor(module),
                              ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Center(
                        child: Text(
                          filteredModules[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:new_stocks/screen/subcat.dart';
class SubCategoryScreen extends StatelessWidget {
  final String title;
  final List<String> subCategories;

  const SubCategoryScreen({
    super.key,
    required this.title,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 230, 248),
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search $title...',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                // Optional: filter logic
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: subCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 7 / 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Subcat(title:subCategories[index] ,)),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        child: Center(
                          child: Text(
                            subCategories[index],
                            style: const TextStyle(fontSize: 12),
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

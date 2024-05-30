import 'package:flutter/material.dart';
import 'package:homework_46/services/category_http.dart';
import 'package:homework_46/views/widgets/drawer_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryHttp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("CategoryPage"),
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder(
        future: categoryController.getCategories(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapShot.hasData) {
            return const Center(
              child: Text("Apidan malumot yoq"),
            );
          }
          if (snapShot.hasError) {
            return Center(
              child: Text(snapShot.error.toString()),
            );
          }

          final categroyData = snapShot.data;

          return categroyData == null || categroyData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: categroyData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 270,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    final category = categroyData[i];
                    return Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: FadeInImage(
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset("assets/images/load.gif");
                              },
                              placeholder: const AssetImage(
                                "assets/images/load.gif",
                              ),
                              image: NetworkImage(category.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

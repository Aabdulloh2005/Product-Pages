import 'package:flutter/material.dart';
import 'package:homework_46/controllers/product_controller.dart';
import 'package:homework_46/views/widgets/drawer_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = ProductController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("ProductPage"),
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder(
          future: productController.getProducts(),
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

            final productsData = snapShot.data;

            return productsData == null || productsData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 35,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 320,
                            crossAxisCount: 2),
                    itemBuilder: (context, i) {
                      final product = productsData[i];
                      return Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            FadeInImage(
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset("assets/images/load.gif");
                                },
                                placeholder: const AssetImage(
                                  "assets/images/load.gif",
                                ),
                                image: NetworkImage(product.images[0])),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${product.price}\$",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          }),
    );
  }
}

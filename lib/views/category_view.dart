import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss34flutter/controllers/category_controller.dart';
import 'package:ss34flutter/views/category_post.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category List"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(CategoryPostPage());
              },
              child: const Text("New Category")),
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.categoryList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1),
                          ),
                        ),
                        child: ListTile(
                          title:
                              Text(controller.categoryList[index].categoryName),
                          subtitle:
                              Text(controller.categoryList[index].description),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

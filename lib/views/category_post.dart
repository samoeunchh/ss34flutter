import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss34flutter/controllers/category_controller.dart';

class CategoryPostPage extends StatelessWidget {
  CategoryPostPage({super.key});
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Category"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              TextFormField(
                controller: controller.nameController,
                validator: (value) {
                  return controller.nameValidation(value!);
                },
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
              ),
              TextFormField(
                controller: controller.descController,
                decoration: const InputDecoration(
                  label: Text("Description"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.formSubmit();
                },
                child: const Text("Save"),
              )
            ]),
          )),
    );
  }
}

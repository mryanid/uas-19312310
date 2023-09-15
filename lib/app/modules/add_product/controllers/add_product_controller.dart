import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String nama, String npm, String alamat) async {
    CollectionReference mahasiswa_19312310 =
        firestore.collection("mahasiswa_19312310");

    try {
      await mahasiswa_19312310.add({
        "nama": nama,
        "npm": npm,
        "alamat": alamat,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data ",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
        },
      );
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}

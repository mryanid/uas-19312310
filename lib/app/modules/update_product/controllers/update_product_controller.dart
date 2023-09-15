import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef =
        firestore.collection("mahasiswa_19312310").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String npm, String alamat, String id) async {
    DocumentReference productById =
        firestore.collection("mahasiswa_19312310").doc(id);
    try {
      await productById.update({
        "nama": nama,
        "npm": npm,
        "alamat": alamat,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data.",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Data.",
      );
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}

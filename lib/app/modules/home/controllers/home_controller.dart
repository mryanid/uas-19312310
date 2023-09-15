import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswa_19312310 =
        firestore.collection('mahasiswa_19312310');
    return mahasiswa_19312310.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswa_19312310 =
        firestore.collection('mahasiswa_19312310');
    return mahasiswa_19312310.snapshots();
  }

  void deleteProduct(String id) {
    DocumentReference docRef =
        firestore.collection("mahasiswa_19312310").doc(id);

    try {
      Get.defaultDialog(
        title: "Infor",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }
}

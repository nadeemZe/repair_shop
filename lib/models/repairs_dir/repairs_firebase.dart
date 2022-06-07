import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_repair/controllers/app_state_controller.dart';
import 'package:shop_repair/models/repairs_dir/repair_model.dart';
import 'package:shop_repair/models/repairs_dir/repairs_repo.dart';

class RepairsFireBase extends RepairsRepo{

  @override
   Future<List<RepairModel>>getRepairs() async{

    AppState.firstLoading=false;

    await FirebaseFirestore.instance
          .collection('users')
          .doc(AppState.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String,dynamic> data=documentSnapshot.data() as Map<String,dynamic>;
          var repairsList = data['repairs'];
          for(int i=0; i<repairsList.length;i++) {
            RepairModel repairModel=RepairModel(
            subject : repairsList[i]['subject'],
            description : repairsList[i]['description'],
            category : repairsList[i]['category'],
            street : repairsList[i]['street'],
            city : repairsList[i]['city']);
            AppState.repairs.add(repairModel);
          }
        }
      });
      return AppState.repairs;

  }

}
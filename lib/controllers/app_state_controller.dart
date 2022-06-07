import 'package:shop_repair/models/repairs_dir/repair_model.dart';
import 'package:shop_repair/models/repairs_dir/repairs_repo.dart';


class AppState {

  static String? uid;
  static bool firstLoading=true;
  static List<RepairModel> repairs=[];
  RepairsRepo? repairsRepo;

  AppState({this.repairsRepo});


  Future<List<RepairModel>>fetchRepairs()async{
      return await repairsRepo?.getRepairs();
  }

}


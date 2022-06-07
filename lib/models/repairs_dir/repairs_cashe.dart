import 'package:shop_repair/controllers/app_state_controller.dart';
import 'package:shop_repair/models/repairs_dir/repairs_repo.dart';



class RepairsCashe extends RepairsRepo{

  @override
  getRepairs() {

   return AppState.repairs;

  }


}
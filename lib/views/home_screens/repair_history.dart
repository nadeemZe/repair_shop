import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/controllers/app_state_controller.dart';
import 'package:shop_repair/models/repairs_dir/repair_model.dart';
import 'package:shop_repair/models/repairs_dir/repairs_cashe.dart';
import 'package:shop_repair/models/repairs_dir/repairs_firebase.dart';
import 'package:shop_repair/views/repair_view.dart';
import 'package:shop_repair/widgets/custom_app_bar.dart';
import 'package:shop_repair/widgets/custom_bottom_navigator.dart';

class RepairHistory extends StatefulWidget{
  const RepairHistory({Key? key}) : super(key: key);

  @override
  State<RepairHistory> createState() => _RepairHistoryState();
}

class _RepairHistoryState extends State<RepairHistory> {

  //dependency injection
  //bool firstLoading to decide using firebase or cashe
  AppState appState=AppState(repairsRepo:AppState.firstLoading?RepairsFireBase():RepairsCashe());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: CustomAppBar()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder<List<RepairModel>>(
              future: appState.fetchRepairs(),
              builder: (context,AsyncSnapshot<List<RepairModel>> snapshot) {
                if(snapshot.connectionState!= ConnectionState.done){
                  return const CircularProgressIndicator(
                    color:Colors.blue ,
                  );
                }
                else if(snapshot.hasData){
                  var repairList=snapshot.data!;
                  return SizedBox(
                    height: getHeight(context)/3.5,
                    child: ListView.builder(
                      itemCount: repairList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context,i){
                        return Container(
                          height: getHeight(context)/12,
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.only(bottom: 12,right: 12,left: 12),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side:const  BorderSide(
                                color: cusBlue
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.home_repair_service,color: cusBlue,),
                              const SizedBox(width: 3,),
                              Expanded(
                                child: Text(
                                  (repairList[i].subject)??'',
                                  style: TextStyle(
                                      color: cusBlack,
                                      fontSize: getWidth(context)/25,),
                                ),
                              ),
                              TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(cusBlue),
                                    elevation: MaterialStateProperty.all(3),
                                    fixedSize: MaterialStateProperty.all(const Size(77,17)),
                                  ),
                                  child:Text("view",style: TextStyle(color: cusWhite,fontSize: getWidth(context)/25,fontWeight: FontWeight.bold),),
                                  onPressed: () {
                                    Navigator.push(context, PageTransition(
                                        child: RepairView(repairModel: repairList[i],),
                                        type: PageTransitionType.rightToLeftWithFade,
                                        duration: const Duration(milliseconds: 500),
                                    )
                                    );
                                  }
                              ),
                            ],
                          ),
                        );
                      }
                ),
                  );
                }
                else{
                  return Container(
                    color: Colors.transparent,
                    child: Center(
                        child: Text("Check your Internet",
                            style: TextStyle(
                              fontSize: getWidth(context) / 25,
                              color: Colors.red,
                            ))),
                  );
                }
              }
            ),
            SizedBox(
              height: getHeight(context)/7,
              width: getHeight(context)/5,
              child: Image.asset(logo,),
            ),
          ],
        ),
      ),
      bottomNavigationBar:const CustomNavigationBar(),
    );

  }
}
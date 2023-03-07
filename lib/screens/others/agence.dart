import 'package:bestvoyage/controllers/agenceController.dart';
import 'package:bestvoyage/screens/others/lignes.dart';
import 'package:bestvoyage/utils/asset_image_name.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:bestvoyage/widget/bigText.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

import 'package:get/get.dart';

class AgencePage extends StatefulWidget {
  const AgencePage({Key? key}) : super(key: key);

  @override
  State<AgencePage> createState() => _AgencePageState();
}

class _AgencePageState extends State<AgencePage> {
  TextEditingController searchController = TextEditingController();

  AgenceController agenceController = Get.put(AgenceController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBacmkground,
        automaticallyImplyLeading: false,
        title: BigText(text: "Agences de voyages",color: Colors.white,size: Dimensions.fontText15,),
        leading: IconButton(
          onPressed: (){
            Get.to(()=>LignePage());
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),),
      ),
      body: Container(
            padding: EdgeInsets.only(top: Dimensions.height10),
            height: Dimensions.screenHeight,
            width: Dimensions.screenwidth,
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesName.background,),
              fit: BoxFit.cover
        )
      ),
      child:Column(
        children: [
          Container(
            height: Dimensions.screenHeight/7,
            width: Dimensions.screenwidth,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: Dimensions.height45,
                  width: double.maxFinite,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: " Rechercher ",
                      prefixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.search,color: Colors.grey,),),
                        suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.mic,color: Colors.grey,),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht10),),
                      gapPadding: 0)
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                BigText(text: "Nous sommes prêts de vous, ensemble allons plus loin",size: Dimensions.fontText15*0.8,isCenter: true,line: 2,)
              ],
            ),
          ),
          Expanded(
              child: Obx(()=>Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                child: agenceController.agences ==0?Center(child: CircularProgressIndicator(color: Colors.purple,),) : ListView.builder(
                    itemCount: agenceController.agences.length,
                    itemBuilder: (context,index){
                      return Stack(
                        children: [
                          Container(
                            height: Dimensions.height100*1.7,
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(vertical: Dimensions.widtht10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                image: DecorationImage(
                                    image: NetworkImage(agenceController.agences[index].image!),
                                    fit: BoxFit.cover
                                )
                            ),),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10*0.5),
                            margin: EdgeInsets.only(top: Dimensions.height45*1.5,left: Dimensions.widtht10,right: Dimensions.widtht10),
                            height: Dimensions.height45*1.5,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                            ),
                            child: Column(
                              children: [
                                BigText(text: agenceController.agences[index].ville!,color: Colors.white,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.place,color: Colors.white,),
                                        BigText(text: agenceController.agences[index].address!,color: Colors.white,size: Dimensions.fontText15*0.6,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.phone,color: Colors.white,),
                                        BigText(text: agenceController.agences[index].contact!,color: Colors.white,size: Dimensions.fontText15*0.6,)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),


                        ],
                      );
                    }
                ),
              )
              )
          )
        ],
      ),
    )
    );
  }
}

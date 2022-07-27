import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/create_task_screen.dart';
import 'package:todo_app/shared/components/constants.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/styles/colors.dart';

class  CustomTextField extends StatelessWidget
{
  final TextEditingController controller;
  final String hintText;
  final String FieldName;
  final Widget? suffixwidget;
  final TextInputType textInputType;
  bool IsSuffixWidget =false;
  CustomTextField({
    Key? key,
    required this.FieldName,
    required this.controller,
    required this.hintText,
    this.suffixwidget=null,

    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(FieldName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),),
          Padding(
            padding: const EdgeInsets.only(top:  15,bottom: 15),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color:Colors.grey.shade100)

              ),
              child: Expanded(
                child: TextFormField(


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText:hintText,
                    contentPadding: EdgeInsets.all(20.0),
                    hintStyle:TextStyle(fontSize: 15,color: Colors.grey.shade500,fontStyle: FontStyle.italic ),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon:suffixwidget,

                  ),
                  autofocus: false,
                  readOnly: suffixwidget !=null? true:false,
                  controller: controller,
                  keyboardType:textInputType,

                ),
              ),
            ),
          ),
        ],

      ),
    );
  }
}

class  CustomTextButton  extends StatelessWidget
{
  final String text;
  final VoidCallback onPressed;
  final Color textcolor;

  const CustomTextButton({Key? key,required this.text,required this.onPressed,this.textcolor=defaultColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed, child: Text(text,style:TextStyle(color: textcolor ) ,));
  }
}

class CustomButton extends StatelessWidget
{
  final double width ;
  final double height ;
  final double borderRadius;
  final Color color;
  final  double fontsize;
  final String text;
  final VoidCallback onTap;
  final Color Fontcolor;
  final Color borderColor;
  final double borderWidth;


  const CustomButton({Key? key,this.borderWidth =1,this.borderColor=defaultColor,
    this.width=double.infinity ,this.height=55,this.borderRadius =15 ,this.Fontcolor = Colors.white ,required this.text,this.fontsize=16,this.color=defaultColor,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 25,),
      child: Container(
        width: width ,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            width: borderWidth,
            color: borderColor,
          ),
        ),

        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          //color: color,
          hoverColor:  Color(0xFF8D8E98),
          onPressed: onTap,
          child: Text(text,
            style: TextStyle(
              fontSize:fontsize,
              color: Fontcolor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget
{
  final VoidCallback onTap;
  final Widget Widgeticon;
  final Color color ;
  final double iconSize;

  const CustomIconButton({Key? key,required this.onTap,required this.Widgeticon , this.color=defaultColor,this.iconSize=25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: color,
        iconSize: iconSize,
        onPressed: onTap, icon: Widgeticon);
  }
}

class EmptyScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text ('You do not have any Tasks Yet ..!',style: TextStyle(color: defaultColor,fontSize: 20),),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BounceInDown(duration: Duration(seconds: 3),child: Square() ),
                BounceInUp(duration: Duration(seconds: 3),child: Square() ),
                BounceInLeft(duration: Duration(seconds: 3),child: Square() ),
                BounceInRight(duration: Duration(seconds: 3),child: Square() ),
              ],
            ),


          ],
        ));
  }
}

class CustomAppBar extends StatelessWidget
{
  final  Title;
  final bool isFrist;
  const CustomAppBar({Key? key, required this.Title, this.isFrist=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   AppBar(
      title: Text("$Title") ,
      leading: isFrist ? null : IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
        NavigatePop(context: context);
      }),
      actions: [
        isFrist ?IconButton(onPressed: (){

        }, icon: IconButton(icon: Icon(Icons.menu),onPressed: (){
          NavigateTo(context: context,router: CreateTaskScreen());
        })) : SizedBox.shrink() ,
      ],

    );
  }
}

class BuildTask extends StatelessWidget {
  final Map item;
  final Color color ;
  const BuildTask({Key? key ,required this.item ,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15,right: 25,left: 25),
      child: Dismissible(
        key: Key(item['id'].toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.shade400,
          ),

          child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Delete item',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.delete, color: Colors.white, size: 28),


                ],
              )),
        ),
        onDismissed: (direction) {
          AppCubit.get(context).DeleteItem(id: item['id']);
        },
        child: Padding(
            padding:  EdgeInsets.only(top: 15,),
            child:   Row(children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: item['status'] == 'completed' ? true : false,
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 2.0, color: color),
                  ),
                  splashRadius: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  onChanged: (value) {
                    if (value! == true) {
                      AppCubit.get(context).MoveDataBaseScreen(status: item['status'] == 'completed' ? 'unCompleted' : 'completed', id: item['id']);
                    } else {
                      AppCubit.get(context).MoveDataBaseScreen(status: item['status'] == 'unCompleted' ? 'completed' : 'unCompleted', id: item['id']);


                    }
                  },
                  checkColor: Colors.white,
                  activeColor: color,
                ),
              ),
              SizedBox(width: 10),
              Text('${item['title']}'),
              Spacer(),
              CustomIconButton(
                onTap: (){
                  AppCubit.get(context).SetIsFav(item);
                },
                Widgeticon:item['is_fav'] == 'true' ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                color: item['is_fav'] == 'true' ? Colors.red : Colors.grey,
                iconSize: 30,
              ),




            ],)),


      ),
    );;
  }
}

Widget Square()
=> Container(
  width: 50,
  height: 50,
  decoration: BoxDecoration(
    //color:defultColor,
  ),
);

class  MyDivider extends StatelessWidget
{
  final double height;
  final Color bgColor;
  const MyDivider({Key? key,this.height=1.5, this.bgColor=const Color(0xFF8D8E98)}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return  Divider(
      color: bgColor,
      height: height ,

    );
  }
}
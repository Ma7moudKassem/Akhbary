import 'package:conditional_builder/conditional_builder.dart';
import 'package:filkhaber/modules/webview/webview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//b7dea8285f761bdd8f22c7dcad019c2
Widget homeNewsItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen('${article['url']}'));
      },
      child: Column(
        children: [
          Container(
            height: 300,
            child: ConditionalBuilder(
              condition: article['urlToImage'] != null,
              builder: (context) => Image(
                image: NetworkImage(
                  '${article['urlToImage']}',
                ),
              ),
              fallback: (context) => Image(
                image: NetworkImage(
                  'https://media.istockphoto.com/photos/breaking-news-world-news-with-map-backgorund-picture-id1182477852?k=6&m=1182477852&s=612x612&w=0&h=X-UipiiX5xcMw9dBhzKZWG7UcWjEOARl2s_oTVV8rtE=',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${article['title']}',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(
                  height: 10,
                ),

                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                ConditionalBuilder(
                  condition: article['description'] != null,
                  builder: (context) => Text(
                    '${article['description']}',

                    textAlign: TextAlign.right,

                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),

                    overflow: TextOverflow.ellipsis,

                    maxLines: 10,

                    // maxLines:10
                  ),
                  fallback: (context) => Text(
                    'لمعرف تفاصيل الخبر اضغط هنا ',

                    textAlign: TextAlign.right,

                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),

                    overflow: TextOverflow.ellipsis,

                    maxLines: 10,

                    // maxLines:10
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget buildArticleItems(article , context,{isSearch = false} ) =>  InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen('${article['url']}'));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        ConditionalBuilder(
         condition: article['urlToImage'] != null,
          builder: (context)=>Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    '${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          fallback: (context)=>Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('https://media.istockphoto.com/photos/breaking-news-world-news-with-map-backgorund-picture-id1182477852?k=6&m=1182477852&s=612x612&w=0&h=X-UipiiX5xcMw9dBhzKZWG7UcWjEOARl2s_oTVV8rtE='),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(

            height: 120,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.headline2,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(color: Colors.grey),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

void navigateTo(context , widget)=> Navigator.push(context, MaterialPageRoute(
    builder: (context)=>widget));

Widget articleBuilder(list, context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItems(list[index], context),
      separatorBuilder: (context, index) => Container(
        color: Colors.grey,
        height: 1,
      ),
      itemCount: list.length),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);



Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required IconData prefix,
  @required String lapelText,
  Function onSubmitted,
  Function onChanged,
  Function onTap,
  @required Function validate,
  bool isPassword = false,
  IconData suffix,
  Function suffixPressed,
}) =>
    Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primarySwatch: Colors.pink,


      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.grey,
        ),
        controller: controller,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        obscureText: isPassword,
        validator: validate,
        keyboardType: type,
        onTap: onTap,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1,color: Colors.grey),
          ),
          prefixIcon: Icon(prefix,
          color: Colors.grey,),

          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffix),
          )
              : null,
          labelText: lapelText,


          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          ),

        ),

      ),
    );


import 'package:aio_pc_controller/Custom.dart';
import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

List<String> tableList;
class LoadCustom extends StatefulWidget{
  @override
  LoadCustomState createState() => new LoadCustomState();
}

class LoadCustomState extends State<LoadCustom> {

  @override
  Widget build(BuildContext context) {
    
    List<Widget> rows = new List<Widget>();

    for(var i = 0; i < tableList.length; i++){
        rows.add(new Container(
          child: Card(
            child: ListTile(
                title: Text(tableList[i]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: (){
                    customLoader(context, tableList[i]);
                  }
                ),
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    deleteTable(tableList[i]);
                    refresh(context);
                  }
                ),
              )
            )
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Load Custom Layout"),
      ),
      body: ListView(
        children: rows,
      )
    );
  }
}

void loadCustomBuilder(context) async{
  tableList = await getTables();
  Navigator.pushNamed(context, '/loadcustom');
}
void refresh(context) async{
  Navigator.pop(context);
  loadCustomBuilder(context);
}

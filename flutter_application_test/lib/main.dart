import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:namer_app/app_theme.dart';
import 'package:namer_app/components/buttons/basic_buttons.dart';
import 'package:namer_app/components/buttons/floating_button.dart';
import 'package:namer_app/components/list/basic_list.dart';
import 'package:namer_app/components/navigation/bottom_tab_bar.dart';
import 'package:namer_app/models/todo_class.dart';
import 'package:namer_app/components/stats/progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

void main() {
  const String connectionUrl = "mongodb+srv://paullemonnier:m6MkMTIm1HMWKtpO@cluster0.yqiwa.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

  initializeDateFormatting("fr_FR", null);
  mongo.Db.create(connectionUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoList>(
      create: (context) => TodoList(),
      child: MaterialApp(
        title: 'dza App',
        theme: AppTheme.theme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  double getProgressValue() {
    final todoList = Provider.of<TodoList>(context);
    if (todoList.items.isEmpty) {
      return 0.0;
    }
    int completedTasks = todoList.items.where((item) => item.isDone).length;
    return completedTasks / todoList.items.length;
  }

  void addItem(String title) {
    final todoList = Provider.of<TodoList>(context, listen: false);
    todoList.addItem(TodoItem(title: title));
  }

  void deleteSelectedItem() {
    final todoList = Provider.of<TodoList>(context, listen: false);
    todoList.deleteSelectedItem();
  }

  bool hasSelectedItem() {
    final todoList = Provider.of<TodoList>(context, listen: false);
    return todoList.hasSelectedItem();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().format(now);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddFloatingButton(onPressed: addItem),


      bottomNavigationBar: CustomBottomTabBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft, // Aligne le texte à gauche
                                      child: Text(
                                        "todo.",
                                        style: Theme.of(context).textTheme.displayLarge,
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.centerLeft, // Aligne le texte à gauche
                                      child: Text(
                                        formattedDate,
                                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          color: Theme.of(context).colorScheme.fontGray,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),



                              Align(
                                alignment: Alignment.centerRight,
                                child: BackgroundIconButton(
                                  disabled: !hasSelectedItem(),
                                  onPressed: deleteSelectedItem,
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).colorScheme.fontContrast,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),
                          CustomProgressBar(value: getProgressValue())
                        ],
                      ),
                    ),
                  ],
                ),
                ]
              ),

            Expanded(
              child: BasicCustomList(),
            ),
          ],
        )
      )
    );
  }
}
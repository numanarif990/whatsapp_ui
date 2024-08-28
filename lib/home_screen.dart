import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Whatsapp"),
            bottom:const TabBar(
              tabs: [
                Tab(child: Icon(Icons.camera_alt)),
                Tab(child: Text("chats")),
                Tab(child: Text("status")),
                Tab(child: Text("calls")),
              ],
            ),
            actions:[
            const  Icon(Icons.search_rounded),
             const SizedBox(
                width: 7,
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) => const[
                    PopupMenuItem(child: Text("New group")),
                    PopupMenuItem(child: Text("New contact")),
                    PopupMenuItem(child: Text("settings"))
                  ]),
                // SizedBox(width: 15,)
            ],
          ),
          body: TabBarView(
            children: [
              Text("camera"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),

                child: ListView.builder(
                  // itemCount: 100,
                    itemBuilder: (context, index){
                    return Container(
                       margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey
                        )
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        ),
                        title: Text("Nancy"),
                        subtitle: Text("How are you my love?"),
                        trailing: Text("6:59pm"),
                      ),
                    );
                    }),
              ),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.green
                          )

                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        ),
                      ),
                      title: Text("Nancy"),
                      subtitle: Text("35min ago"),

                    );
                  }),
              ListView.builder(
                itemCount: 7,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600"),
                      ),
                      title: Text("Nancy"),
                      subtitle: Text(index ~/2 ==0? "You missed an audio call" : "You missed a video call"),
                      trailing: Icon(index~/2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ],
          ),
        ));
  }
}

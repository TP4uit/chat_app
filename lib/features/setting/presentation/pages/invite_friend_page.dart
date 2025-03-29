import 'package:flutter/material.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Invite friend',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 36,
              ),
              Container(height: 30, child: _searchBar()),
              const SizedBox(
                height: 28,
              ),
              _friendList(),
              const SizedBox(
                height: 30,
              ),
              _labelFriendRequest(),
              const SizedBox(
                height: 30,
              ),
              _friendList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return const TextField();
  }

  Widget _friendList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Phan Quốc Tuấn",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                width: 70,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(0, 30),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Invite',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 5);
  }

  Widget _labelFriendRequest() {
    return const Text(
      "Friend Request",
      style: TextStyle(fontWeight: FontWeight.w600),
    );
  }
}

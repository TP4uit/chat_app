import 'package:flutter/material.dart';

class DetailsChatItem extends StatelessWidget {
  final int index;
  const DetailsChatItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Khi người dùng nhấn vào item, chuyển đến màn hình chat riêng
        Navigator.pushNamed(
          context,
          '/person_chat',
          arguments: {
            'name': 'User $index',
            'avatarUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s',
          },
        );
      },
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Transform.rotate(
                angle: 0.7854, // Góc -45 độ (1 radian = 57.3 độ)
                child: Icon(Icons.push_pin, size: 20, color: Color(0xffFFE03E)),
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "User $index",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Text(
              '$index mins',
              style: TextStyle(
                  color: Colors.white60, fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              "message $index aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90), color: Color(0xff00C608)),
              child: Center(
                  child: Text(
                index.toString(),
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
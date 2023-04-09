import 'package:flutter/material.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          buildOwnerWidget(),
          SizedBox(width: 20),
          buildRepoWidget(),
        ],
      ),
    );
  }

  //
  Expanded buildRepoWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Repo name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          const Text(
            'Repo descreptions',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          //
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // star-count
              Row(
                children: [
                  const Text(
                    '3k',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.yellow.shade800,
                    size: 18,
                  ),
                ],
              ),
              SizedBox(width: 20),
              // language
              Row(
                children: const [
                  Text(
                    'Java',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.donut_large_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                ],
              ),
              // have-issues
              SizedBox(width: 20),
              Row(
                children: const [
                  Text(
                    '12 issues',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.question_mark, color: Colors.black, size: 18),
                ],
              ),

              //
            ],
          )
          //
        ],
      ),
    );
  }

  Column buildOwnerWidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: Image.asset(
            'assets/images/sook_img.png',
            width: 30,
            fit: BoxFit.fill,
          ),
        ),
        const Text(
          'Owner',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  //
}

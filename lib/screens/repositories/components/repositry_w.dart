import 'package:flutter/material.dart';
import 'package:sookps/models/repo.dart';
import 'package:sookps/screens/widgets/cash_image.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({super.key, this.repo});
  final Repo? repo;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      // padding: EdgeInsets.all(16),
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
  Widget buildRepoWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  repo?.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${((repo?.watchersCount ?? 1) / 1000).toStringAsFixed(1)} k',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.visibility,
                    color: Colors.yellow.shade800,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            repo?.description ?? '-',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          //
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // star-count
              Row(
                children: [
                  Text(
                    '${((repo?.stargazersCount ?? 1) / 1000).toStringAsFixed(1)} k',
                    style: const TextStyle(
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
              // const SizedBox(width: 20),
              // language
              Row(
                children: [
                  Text(
                    repo?.language ?? "",
                    style: const TextStyle(
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
              // const SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    '${repo?.openIssuesCount} issues',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.question_mark, color: Colors.black, size: 18),
                ],
              ),
              //

              //
            ],
          )
          //
        ],
      ),
    );
  }

  Widget buildOwnerWidget() {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: CashImageW(
              imageUrl: repo?.owner?.avatarUrl ?? "",
              fit: BoxFit.fill,
              w: 30,
            ),
          ),
          Text(
            repo?.owner?.login ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  //
}

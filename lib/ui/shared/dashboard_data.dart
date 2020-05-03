class Assignment {
  String title;
  bool status;

  Assignment({this.title, this.status});

  Assignment.copy(Assignment from) : this(title: from.title, status: from.status);

}

class Course {
  String title;
  String lecturer;
  String pictPath;
  List<Assignment> assignment = [];
  // int progress = calProg(assignment);

  Course({this.title, this.lecturer,this.pictPath,this.assignment});

//   double get prog{
//   int counter = 0;

//   for(int i;i<assignment.length;i++){
//     if (assignment[i].status){
//       counter++;
//     }
  
//   }
//   if (counter>0){return (counter/assignment.length);}
//   else {return 0;}
// } //end get  prog

double get prog => assignment.length > 0
      ? (assignment.fold(0, (sum, item) => item.status ? sum + 1 : sum) /
              assignment.length) *
          100
      : 0;

Course.copy(Course from)
      : this(
            title: from.title, lecturer: from.lecturer, pictPath: from.pictPath,
            assignment: from.assignment.map((assignment) => Assignment.copy(assignment)).toList());
}

final  mockDataDashboard = <Course>[
  Course(
    title: 'Software Quality Assurance',
    lecturer: 'Dr. Ell', 
    pictPath: 'assets/images/c.png', 
    assignment: <Assignment>[Assignment(title: 'Assignment Testlink', status: false)
    ]),
  Course(
    title: 'Mobile Application Programmig',
    lecturer: 'Dr. Carl',
    pictPath:'assets/images/b.png', 
    assignment: <Assignment> [Assignment(title:'Exercise lab1', status:true),
     Assignment(title:'Project proposal', status:false),
    ]),
  Course(
    title: 'Web Technology',
    lecturer: 'Dr. Simon',
    pictPath:'assets/images/b.png', 
    assignment: <Assignment>[Assignment(title:'Assignment Testlink',status: false)
    ]),
  Course(
    title: 'Software Engineering',
    lecturer: 'Dr. Ong', 
    pictPath:'assets/images/c.png', 
    assignment: <Assignment>[Assignment(title:'Assignment Testlink',status: true)
    ]),
  Course(
    title: 'Computer Network',
    lecturer: 'Dr. Ming', 
    pictPath:'assets/images/c.png', 
    assignment: <Assignment>[Assignment(title:'Assignment Testlink', status:true)
    ]),
  Course(
    title: 'English for Education',
    lecturer: 'Dr. Aliff', 
    pictPath:'assets/images/b.png', 
    assignment: <Assignment>[Assignment(title:'Assignment Testlink', status:true)
    ])

];


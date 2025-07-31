namespace db.schema;


entity Student {
    
    key StudentID : UUID;

    @mandatory
    FirstName : String;

    LastName : String;
    
    FullName : String =  case when LastName is null then FirstName else concat(FirstName, ' ', LastName)  end;
    
    @mandatory
    @assert.format : '[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$'
    Email : String ;
    
    @mandatory
    RegisteredDate : Date;

    Courses : Association to many Enrollment on Courses.StudentID = $self
}

entity Course {
    key CourseID : UUID;

    @mandatory
    CourseName : String;

    Description : String;

    @mandatory
    @assert.range:[1,7]
    CreditHours : Integer;

    @mandatory
    InstructorID : Association to one Instructor;

    FeedbackID : Association to many CourseFeedback on FeedbackID.CourseID = $self;

    Students : Association to many Enrollment on Students.CourseID = $self;
}

entity CourseFeedback {
    key CourseID : Association to one Course;
    key FeedbackID : UUID;
    Comments : String;
    CreatedAt : DateTime;
}

entity Instructor{

    key InstructorID : UUID;

    @mandatory
    FirstName : String;

    LastName : String;
    
    FullName : String =  case when LastName is null then FirstName else concat(FirstName, ' ', LastName)  end;

    @mandatory
    @assert.format : '[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$'
    Email : String;

    @mandatory
    // @Common.ValueList : {
    //     $Type : 'Common.ValueListType',
    //     CollectionPath : 'expertise',
    //     Parameters     : [
    //             {
    //                 $Type             : 'Common.ValueListParameterInOut',
    //                 LocalDataProperty : 'Expertise',
    //                 ValueListProperty : 'Expertise'
    //             }]
    // }
    Expertise : String;

    Courses : Association to many Course on Courses.InstructorID = $self;
}

entity Expertise {
    key Name : String;
}

entity Enrollment {
    key EnrollmentID : UUID;
    StudentID : Association to one Student;
    CourseID : Association to one Course;
    EnrollmentDate : Date;
    Grade : Integer;
}


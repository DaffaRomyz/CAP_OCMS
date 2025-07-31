using { db.schema } from '../db/schemas';

service MainService {
    @odata.draft.enabled
    entity Student as projection on schema.Student;
    @odata.draft.enabled
    entity Course as projection on schema.Course
    actions {
        action enrollStudent(
            @Common.ValueList : {
                $Type : 'Common.ValueListType', // tipe = value help
                CollectionPath : 'Student', // ambil data dari table Student
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut', // parameter yang return ke input field
                        LocalDataProperty : student, // nama input parameter di action
                        ValueListProperty : 'StudentID', // nama fields di table
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly', // parameter yang display only
                        ValueListProperty : 'FullName', // nama fields di table
                    }
                ],
                Label : 'Choose a Student'
            }
            @Common.ValueListWithFixedValues : false
            student : UUID);
    };
    @odata.draft.enabled
    entity CourseFeedback as projection on schema.CourseFeedback;
    @odata.draft.enabled
    entity Instructor as projection on schema.Instructor;
    @odata.draft.enabled
    entity Enrollment as projection on schema.Enrollment
    actions {
        action setGrade(grade : Integer);
        action giveFeedback(comments : String);
    };
    entity Expertise as projection on schema.Expertise;
}
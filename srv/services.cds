using { db.schema } from '../db/schemas';

service MainService {
    @odata.draft.enabled
    entity Student as projection on schema.Student;
    @odata.draft.enabled
    entity Course as projection on schema.Course
    actions {
        action enrollStudent(student : UUID);
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
}
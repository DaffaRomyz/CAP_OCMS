using MainService as service from '../../srv/services';
annotate service.Enrollment with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : StudentID.FullName,
            Label : 'FullName',
        },
        {
            $Type : 'UI.DataField',
            Value : CourseID.CourseName,
            Label : 'CourseName',
        },
        {
            $Type : 'UI.DataField',
            Value : EnrollmentDate,
            Label : 'EnrollmentDate',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General',
            ID : 'General',
            Target : '@UI.FieldGroup#General',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>StudentInformation}',
            ID : 'Student',
            Target : '@UI.FieldGroup#Student',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>CourseInformation}',
            ID : 'i18nCourseInformation',
            Target : '@UI.FieldGroup#i18nCourseInformation',
        },
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : EnrollmentDate,
                Label : 'EnrollmentDate',
            },
            {
                $Type : 'UI.DataField',
                Value : Grade,
                Label : 'Grade',
            },
        ],
    },
    UI.FieldGroup #Student : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : StudentID.FirstName,
                Label : 'FirstName',
            },
            {
                $Type : 'UI.DataField',
                Value : StudentID.LastName,
                Label : 'LastName',
            },
            {
                $Type : 'UI.DataField',
                Value : StudentID.Email,
                Label : 'Email',
            },
            {
                $Type : 'UI.DataField',
                Value : StudentID.RegisteredDate,
                Label : 'RegisteredDate',
            },
        ],
    },
    UI.FieldGroup #i18nCourseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CourseID.CourseName,
                Label : 'CourseName',
            },
            {
                $Type : 'UI.DataField',
                Value : CourseID.CreditHours,
                Label : 'CreditHours',
            },
            {
                $Type : 'UI.DataField',
                Value : CourseID.Description,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : CourseID.InstructorID.FullName,
                Label : '{i18n>InstructorFullName}',
            },
            {
                $Type : 'UI.DataField',
                Value : CourseID.InstructorID.Email,
                Label : 'Email',
            },
        ],
    },
);


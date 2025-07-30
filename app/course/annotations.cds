using MainService as service from '../../srv/services';
annotate service.Course with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : CourseName,
            Label : 'CourseName',
        },
        {
            $Type : 'UI.DataField',
            Value : CreditHours,
            Label : 'CreditHours',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.enrollStudent',
            Label : 'enrollStudent',
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
            Label : 'Instructor',
            ID : 'Instructor',
            Target : '@UI.FieldGroup#Instructor',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EnrolledStudents}',
            ID : 'Students',
            Target : 'Students/@UI.LineItem#Students',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Feedbacks',
            ID : 'Feedbacks',
            Target : 'FeedbackID/@UI.LineItem#Feedbacks',
        },
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CourseName,
                Label : 'CourseName',
            },
            {
                $Type : 'UI.DataField',
                Value : CreditHours,
                Label : 'CreditHours',
            },
            {
                $Type : 'UI.DataField',
                Value : Description,
                Label : 'Description',
            },
        ],
    },
    UI.FieldGroup #Instructor : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : InstructorID.FullName,
                Label : 'FullName',
            },
            {
                $Type : 'UI.DataField',
                Value : InstructorID.Email,
                Label : 'Email',
            },
        ],
    },
);

annotate service.CourseFeedback with @(
    UI.LineItem #Feedbacks : [
        {
            $Type : 'UI.DataField',
            Value : Comments,
            Label : 'Comments',
        },
        {
            $Type : 'UI.DataField',
            Value : CreatedAt,
            Label : 'CreatedAt',
        },
    ]
);

annotate service.Enrollment with @(
    UI.LineItem #Students : [
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
    ]
);


using MainService as service from '../../srv/services';
annotate service.Student with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : FullName,
            Label : 'FullName',
        },
        {
            $Type : 'UI.DataField',
            Value : RegisteredDate,
            Label : 'RegisteredDate',
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
            Label : 'Courses',
            ID : 'Courses',
            Target : 'Courses/@UI.LineItem#Courses',
        },
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FirstName,
                Label : 'FirstName',
            },
            {
                $Type : 'UI.DataField',
                Value : LastName,
                Label : 'LastName',
            },
            {
                $Type : 'UI.DataField',
                Value : Email,
                Label : 'Email',
            },
            {
                $Type : 'UI.DataField',
                Value : RegisteredDate,
                Label : 'RegisteredDate',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://account',
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Enrollment with @(
    UI.LineItem #Courses : [
        {
            $Type : 'UI.DataField',
            Value : CourseID.CourseName,
            Label : 'CourseName',
        },
        {
            $Type : 'UI.DataField',
            Value : CourseID.Description,
            Label : 'Description',
        },
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
        {
            $Type : 'UI.DataField',
            Value : CourseID.CreditHours,
            Label : 'CreditHours',
        },
    ]
);


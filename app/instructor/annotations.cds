using MainService as service from '../../srv/services';
annotate service.Instructor with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : FullName,
            Label : 'FullName',
        },
        {
            $Type : 'UI.DataField',
            Value : Email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : Expertise,
            Label : 'Expertise',
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
                Value : Expertise,
                Label : 'Expertise',
            },
        ],
    },
);

annotate service.Course with @(
    UI.LineItem #Courses : [
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
    ]
);

annotate service.Instructor with {
    Expertise @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Expertise',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Expertise,
                    ValueListProperty : 'Name',
                },
            ],
            Label : 'Expertise',
        },
        Common.ValueListWithFixedValues : true,
)};


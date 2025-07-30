sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'student/test/integration/FirstJourney',
		'student/test/integration/pages/StudentList',
		'student/test/integration/pages/StudentObjectPage',
		'student/test/integration/pages/EnrollmentObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentList, StudentObjectPage, EnrollmentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('student') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentList: StudentList,
					onTheStudentObjectPage: StudentObjectPage,
					onTheEnrollmentObjectPage: EnrollmentObjectPage
                }
            },
            opaJourney.run
        );
    }
);
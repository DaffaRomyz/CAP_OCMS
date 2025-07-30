sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'instructor/test/integration/FirstJourney',
		'instructor/test/integration/pages/InstructorList',
		'instructor/test/integration/pages/InstructorObjectPage',
		'instructor/test/integration/pages/CourseObjectPage'
    ],
    function(JourneyRunner, opaJourney, InstructorList, InstructorObjectPage, CourseObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('instructor') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInstructorList: InstructorList,
					onTheInstructorObjectPage: InstructorObjectPage,
					onTheCourseObjectPage: CourseObjectPage
                }
            },
            opaJourney.run
        );
    }
);
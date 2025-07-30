sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'enrollment/test/integration/FirstJourney',
		'enrollment/test/integration/pages/EnrollmentList',
		'enrollment/test/integration/pages/EnrollmentObjectPage'
    ],
    function(JourneyRunner, opaJourney, EnrollmentList, EnrollmentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('enrollment') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEnrollmentList: EnrollmentList,
					onTheEnrollmentObjectPage: EnrollmentObjectPage
                }
            },
            opaJourney.run
        );
    }
);
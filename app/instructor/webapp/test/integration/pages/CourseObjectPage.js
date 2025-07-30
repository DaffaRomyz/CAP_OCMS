sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'instructor',
            componentId: 'CourseObjectPage',
            contextPath: '/Instructor/Courses'
        },
        CustomPageDefinitions
    );
});
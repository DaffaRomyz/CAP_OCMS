package com.daffa.cap.CAP_OCMS.handler;

import java.time.LocalDate;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Course_;
import cds.gen.mainservice.Course;
import cds.gen.mainservice.CourseEnrollStudentContext;
import cds.gen.mainservice.Enrollment;
import cds.gen.mainservice.Enrollment_;

@Component
@ServiceName("MainService")
public class EventsHandler implements EventHandler{

    @Autowired
    private PersistenceService db;

    @On(event = CourseEnrollStudentContext.CDS_NAME, entity = Course_.CDS_NAME)
    public void enrollStudent(CourseEnrollStudentContext context) {
        
        Enrollment enrollment = Enrollment.create();
        enrollment.setStudentIDStudentID( context.getStudent()) ;
        
        Course course = db.run(context.getCqn()).single(Course.class);
        enrollment.setCourseID(course);

        enrollment.setEnrollmentDate(LocalDate.now());

        enrollment.setGrade(0);

        CqnInsert insertSql = Insert.into(Enrollment_.CDS_NAME).entry(enrollment);
        db.run(insertSql);

        context.setCompleted();
        // throw new ServiceException("OKCODE");
    }
}

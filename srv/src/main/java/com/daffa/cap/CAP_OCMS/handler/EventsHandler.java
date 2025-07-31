package com.daffa.cap.CAP_OCMS.handler;

import java.time.Instant;
import java.time.LocalDate;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.draft.DraftNewEventContext;
import com.sap.cds.services.draft.DraftService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Course_;
import cds.gen.mainservice.Course;
import cds.gen.mainservice.CourseEnrollStudentContext;
import cds.gen.mainservice.CourseFeedback;
import cds.gen.mainservice.CourseFeedback_;
import cds.gen.mainservice.Enrollment;
import cds.gen.mainservice.EnrollmentGiveFeedbackContext;
import cds.gen.mainservice.EnrollmentSetGradeContext;
import cds.gen.mainservice.Enrollment_;
import cds.gen.mainservice.Student;
import cds.gen.mainservice.StudentDraftActivateContext;

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

    @On(event = EnrollmentSetGradeContext.CDS_NAME, entity =  Enrollment_.CDS_NAME)
    public void setGrade(EnrollmentSetGradeContext context) {

        if  ( !(context.getGrade() >= 1 && context.getGrade() <= 100) ) {
            throw new ServiceException("Grade must be within 1 to 100");
        }

        Enrollment enrollment = db.run(context.getCqn()).single(Enrollment.class);
        enrollment.setGrade(context.getGrade());

        CqnUpdate updateSql = Update.entity(Enrollment_.CDS_NAME).entry(enrollment);
        db.run(updateSql);

        context.setCompleted();
    }

    @On(event = EnrollmentGiveFeedbackContext.CDS_NAME, entity =  Enrollment_.CDS_NAME)
    public void giveFeedback(EnrollmentGiveFeedbackContext context) {
        CourseFeedback courseFeedback = CourseFeedback.create();

        Enrollment enrollment = db.run(context.getCqn()).single(Enrollment.class);
        courseFeedback.setCourseIDCourseID(enrollment.getCourseIDCourseID());
        courseFeedback.setComments(context.getComments());
        courseFeedback.setCreatedAt(Instant.now());

        CqnInsert insertSql = Insert.into(CourseFeedback_.CDS_NAME).entry(courseFeedback);
        db.run(insertSql);

        context.setCompleted();
    }

    @Before
    public void onCreateStudent(DraftNewEventContext context, Student student) {
        student.setRegisteredDate(LocalDate.now());
    }
}

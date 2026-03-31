# Canvas LMS

## Overview:
* [LMS Infrastructure and Migratorial Control](#lms-infrastructure-and-migratorial-control)
	* [DevOps & Cloud Architecture Compliance](#devops-and-cloud-architecture-compliance)
	* [Content Modularity for Scalable Development](#content-modularity-for-scalable-development)
	* Open Source:
		* Plugin Support
		* Plugin Creation
		* Process Automation
		* Internal Process Integrations
* [LMS Features](#lms-features)
	* Content Types
	* Content Control and Scheduling
	* Roles and People
	* Grading
* [Issues & Areas for Improvement](#areas-for-improvement)
	* User Interface Isn't the Most Appealing


<hr><hr>

## LMS Infrastructure and Migratorial Control

### DevOps And Cloud Architecture Compliance
* Canvas can be Instanced in the cloud, allowing complete programmatic access and control over the system.
	* This enables [`PaaS`, `IaaS`, `SaaS` capabilities](https://brainhub.eu/blog/cloud-architecture-saas-faas-xaas/).
	* Courses can be converted to [LTI-Standard-Compliant format](http://www.imsglobal.org/lti-fundamentals-faq#WhatIsLTI) (`.imscc`) to be [imported into other LMSs](https://support.schoology.com/hc/article_attachments/360008617274/MoodleExport.gif) (in the case of migration to Blackboard, Schoology, Nearpod, etc.) and even other systems (ig. Github, AWS S3, Google Drive, etc.) for [disaster recovery](https://www.barracuda.com/glossary/disaster-recovery).

### Content Modularity For Scalable Development
* Courses can be [Templated and Imported into other Canvas Courses](https://community.canvaslms.com/t5/Question-Forum/Modules-within-Modules/m-p/447078/highlight/true#M152709); "Super-Modules"
* Courses can be Instanced
* Courses can be separated by Modules
	* Modules can be separated by Topics
		* Topics can be separated by Posts
			* Posts can be sorted by Post-type:
				* File
				* Page
				* Quiz
				* Assignment
				* Discussion
				* Announcements

### Open Source<br>Plugin Support, Plugin Creation, Process Automation {#open-source}
* Very large ecosystem for external application support: [Google Apps and Google Ecosystem](https://northwestern.app.box.com/s/petojupmbdg7k0u1vns9d3urmg5278t3), Zoom, Skype, AWS Educate, and much more.
* Applications which do not have preexisting plugins, can have [plugins created to be integrated into Canvas](https://community.canvaslms.com/t5/Developers-Group/PlugIn-for-canvas-lms/m-p/206123#M5626).
* Canvas is **[completely open-source](https://github.com/instructure/canvas-lms/wiki)**!
	* Canvas can be [instanced on a private server](https://github.com/instructure/canvas-lms/wiki/Quick-Start), allowing programmatic integration at every level.
* Canvas has a massive community of more than 1.2 million users, and [an intranet for querying](https://community.canvaslms.com/) common questions, concerns, and curriculum development issues.


<hr><hr>

## LMS Features

### Content Control and Scheduling
* Announcements and Upcoming Due Dates
* Control of Timing for Publishing (Revealing to Learner) Content
	* Unpublished Posts
	* Unpublished Modules
	* Unpublished Courses
	* Scheduled Posts
	* Copy Link (to share for direct pathing)
* Add comments within discussion-type resources exclusively
	* not every resource can be commented on

### Roles and People:
	* Teacher, Student, TA, Designer, Observer (access privileges)
	* Ability to add & remove individually throughout course
	* Email student, selected students or all (selector control box)

### Grades:
* Assignments can be Graded / Ungraded
* Workflow: Read Article / Discuss Article / Receive Exercise / Submit Exercise / View Submission / Grade / Return / Private Msg Log / Resubmission possible
* Has grading interface which auto-populates with assignments, learners, and their respective grades.
* Shows lateness and no-submit at a glance
* Grade is override available
* Grades can be exported as `.csv`


<hr><hr>

## Areas for Improvement

### The Default Interface Doesn't Look Entirely Appealing
* compared to modern LMS UI styles like Schoology or Google Classroom, the **default** view of the Canvas LMS presents itself with older-looking UI styling. However, the view is completely **customizable**.
* Because of the amount of features that are visible when using the Canvas LMS, it can become overwhelming to identify the few areas of importance depending on different use-cases and work-flows.



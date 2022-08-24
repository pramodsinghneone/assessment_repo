# assessment_repo
# Assignment_3

I] Add Employee Form

1. Create a form to save employee details Fields as
     - Personal Details:-    
   First Name,
     Last Name,
     Gender (radio),
     Phone number,
     Email,
     DOB (date field)
     - Qualification:-   
       Post Graduation(select), % (numeric textfield), University (autocomplete textfield),
       Graduation(select), %(numeric textfield), University (autocomplete textfield),
       HSC, %(numeric textfield), University (autocomplete textfield),
       SSC, %(numeric textfield), University (autocomplete textfield),
       Other(textfield)
     - Work Preference Location:-
     WFH,WFO,Hybrid (checkbox)
     Shift: 1st shift, 2nd shift, 3rd shift (select)
     Type of employment: Part time, Full Time, Weekends.
     Available on weekend: Toggle
<img width="315" alt="1" src="https://user-images.githubusercontent.com/110881874/185556616-285c5845-ca68-4622-a424-e604984e6d42.png">

<img width="324" alt="2" src="https://user-images.githubusercontent.com/110881874/185556657-1682f986-0dcc-432c-805d-dbd88b6d58b8.png">

2.Add proper validations on form and save the information to hive database. Every item saved should be uniquely identified. Also save created_on and update_on in the database and update accordingly on every update. After adding the same should reflect in the list on home page.
<img width="332" alt="6" src="https://user-images.githubusercontent.com/110881874/185566385-6e6a5759-5aaf-468d-b83a-ccd860e62a63.png">



   
II] Home Page

1. Display list of employees from database.
  <img width="321" alt="3" src="https://user-images.githubusercontent.com/110881874/185567748-bab382c8-fc2b-4fa4-b5a6-042442e78114.png">
<img width="319" alt="4" src="https://user-images.githubusercontent.com/110881874/185567768-b4d36c92-c1b4-4547-8478-9cfe121d5f9d.png">
<img width="312" alt="5" src="https://user-images.githubusercontent.com/110881874/185567834-7c542151-891e-4510-bba8-2a7d071e1246.png">

2. Search form will have search field and check options of all fields in add employee form. User can enter in search field and check the items he has to search for. In case if any of the fields are not checked, check for all fields in database.
   If no results found display appropriate message.
3. Filter bottom sheet
   Filter results on the basis of all fields inside add employee form.
4. Sort bottom sheet
   Sort by last added, first added, first name, last name
5. Export
   Export results to excel sheet and option to share excel file via intent
6. Select
   Option to select, deselect, select all and deselect all.
7. Options
   After any item is selected, display option to delete, export, share (share as text)
8. Details
   On click of item, display information and option to edit.
9. Long Press
   View popup menu to edit and delete information. For delete, proceed after a confirmation popup.
<img width="364" alt="7" src="https://user-images.githubusercontent.com/110881874/185570865-1b6c3856-a6d4-4511-a5cc-317f6f3af2ba.png">
<img width="356" alt="8" src="https://user-images.githubusercontent.com/110881874/185571613-e1490757-e65e-457b-ac5f-d75959fbcf51.png">

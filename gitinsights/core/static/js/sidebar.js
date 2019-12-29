document.write(`
<div class="container">
<div class="row">
  <!-- Left column: logo and menu -->

   <!-- Side navigation -->
   <div class="sidenav">
    <div class="tm-logo-div text-xs-center">
	  <img src="https://i.ibb.co/3C5Wg1h/tm-neaty-logo.png" alt="Logo">
      <a href="/api"><h1 class="tm-site-name">Git Insights DB</h1></a>   
 </div>
    <button class="dropdown-btn">Commit
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addCommit">Add Commit</a>
      <a href="searchCommit">Search Commit</a>
    </div>

<button class="dropdown-btn">Issue
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addIssue">Add Issue</a>
      <a href="searchIssue">Search Issue</a>
    </div>

<button class="dropdown-btn">Organization
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addOrganization">Add Organization</a>
      <a href="searchOrganization">Search Organization</a>
      <button class="dropdown-btn">Repo
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addRepo">Add Repo</a>
      <a href="searchRepo">Search Repo</a>
    </div>
    </div>

<button class="dropdown-btn">Team
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addTeam">Add Team</a>
      <a href="searchTeam">Search Team</a>
    </div>

<button class="dropdown-btn">User
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addUser">Add User</a>
      <a href="searchUser">Search User</a>
      <button class="dropdown-btn">Repo
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a href="addRepo">Add Repo</a>
      <a href="searchRepo">Search Repo</a>
    </div>
    </div>

    <a href="contact">Contact Us</a>
       </div>

<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>


`);

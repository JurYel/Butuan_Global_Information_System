<% 
	if(session.getAttribute("name") == null) {
		response.sendRedirect("login_signup_form.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Butuan Geodata</title>
    <!-- JavaScript Bundle with Popper -->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <!-- CSS Bundle with Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Bootstrap Select -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>

    <!-- YearPicker -->
    <link rel="stylesheet" href="static/css/yearpicker.css">

    <!-- Paparse For CSV Reading -->
    <script src="static/js/papaparse.min.js"></script>
    <!-- Stylesheet -->
    <link rel="stylesheet" href="static/css/test_style.css">
    
</head>
<body>
    <header class="navbar navbar-expand-md navbar-dark bg-dark mb-4"  role="navigation">
        <a href="main_gis.html" target="_self" class="navbar-brand mx-5">Butuan GIS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" 
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a href="main_gis.html" target="_self" class="nav-link">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">GeoData</a>
            </li>
        </ul>
        <a href="logout" class="btn-logout">Logout</a>
    </header>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2><b>Butuan</b> Geodata</h2>
                    </div>
                    <div class="col-sm-6">
                        <button type="button" class="btn btn-success js-upload-csv-geodata"><i class="material-icons">&#xe2c6;</i> <span>Upload CSV</span></button>
                        <button type="button" class="btn btn-success js-add-geodata"><i class="material-icons">&#xE147;</i> <span>Add Geodata</span></button>
                        <button type="button" class="btn btn-danger js-delete-geodata"><i class="material-icons">&#xE15C;</i> <span>Delete All</span></button>
                        <!-- <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
                        <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a>		 -->
                    </div>
                </div>
            </div>
            <div class="table-container">
                <table class="table table-striped table-hover" id="data-table">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" name="" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Barangay</th>
                            <th>Population</th>
                            <th>Employed</th>
                            <th>Unemployed</th>
                            <th>Underemployed</th>
                            <th>Hectares</th>
                            <th>Square Km.</th>
                            <th>Year</th>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Add Modal HTML -->
    <div id="addGeodataModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST" action="static/dbase/insert_geodata.jsp" class="js-add-geodata-form">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Barangay Geodata</h4>
                        <span class="close" data-bs-dismiss="modal" aria-hidden="true" ><i class="material-icons">&#xe5cd;</i></span>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label for="brgy">Barangay</label>
                                <input type="text" name="brgy" id="brgy" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="populate">Population</label>
                                <input type="text" name="population" id="populate" class="form-control" required>
                            </div>
                        </div>
                        <div class="row my-3">
                            <div class="col form-group">
                                <label for="employ">Employed</label>
                                <input type="text" name="employed" id="employ" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="unemploy">Unemployed</label>
                                <input type="text" name="unemployed" id="unemploy" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="underemploy">Underemployed</label>
                                <input type="text" name="underemployed" id="underemploy" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label for="hectares">Hectares</label>
                                <input type="text" name="hectares" id="hectares" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="sqkm">Square Kilometers</label>
                                <input type="text" name="sqkm" id="sqkm" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col form-group">
                                <label for="year">Year</label>
                                <input type="text" name="year" id="year" class="yearPicker form-control">        
                            </div>
                            <div class="col form-group">
                                <label for="class">Class</label>
                                <select name="class" class="selectpicker" data-style="btn-outline-primary" id="class">
                                    <option value="Urban">Urban</option>
                                    <option value="Rural">Rural</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancel" class="btn btn-danger" data-bs-dismiss="modal">
                        <input type="submit" value="Add Geodata" id="add-submit" class="btn btn-info">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Update Modal HTML -->
    <div id="updateGeodataModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST" action="static/dbase/update_geodata.jsp" class="js-update-geodata-form">
                    <input type="hidden" id="hd_id" name="">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Barangay Geodata</h4>
                        <span class="close" data-bs-dismiss="modal" aria-hidden="true" ><i class="material-icons">&#xe5cd;</i></span>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label for="brgy">Barangay</label>
                                <input type="text" name="brgy" id="brgy" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="populate">Population</label>
                                <input type="text" name="population" id="populate" class="form-control" required>
                            </div>
                        </div>
                        <div class="row my-3">
                            <div class="col form-group">
                                <label for="employ">Employed</label>
                                <input type="text" name="employed" id="employ" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="unemploy">Unemployed</label>
                                <input type="text" name="unemployed" id="unemploy" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="underemploy">Underemployed</label>
                                <input type="text" name="underemployed" id="underemploy" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label for="hectares">Hectares</label>
                                <input type="text" name="hectares" id="hectares" class="form-control" required>
                            </div>
                            <div class="col form-group">
                                <label for="sqkm">Square Kilometers</label>
                                <input type="text" name="sqkm" id="sqkm" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col form-group">
                                <label for="year">Year</label>
                                <input type="text" name="year" id="year" class="form-control">        
                            </div>
                            <div class="col form-group">
                                <label for="class">Class</label>
                                <select name="class" class="selectpicker" data-style="btn-outline-primary" id="class">
                                    <option value="Urban">Urban</option>
                                    <option value="Rural">Rural</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancel" class="btn btn-danger" data-bs-dismiss="modal">
                        <input type="submit" value="Update Geodata" class="btn btn-info">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <div id="deleteDataModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST" action="static/dbase/delete_geodata.jsp" class="js-geodata-delete-form">
                    <input type="hidden" id="hd_brgy" name="">
                    <input type="hidden" id="hd_year" name="">
                    <div class="modal-header">
                        <h4 class="modal-title">Confirm Data Deletion</h4>
                        <span class="close" data-bs-dismiss="modal" aria-hidden="true" ><i class="material-icons">&#xe5cd;</i></span>
                    </div>
                    <div class="modal-body">
                        <p id="confirm_delete">Are you sure you want to delete this geodata?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancel" class="btn btn-danger" data-bs-dismiss="modal">
                        <input type="submit" value="Delete Data" class="btn btn-info">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Delete ALl Modal HTML -->
    <div id="deleteAllDataModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST" action="static/dbase/delete_all_geodata.jsp" class="js-geodata-delete-all-form">
                    <input type="hidden" id="hd_brgy" name="">
                    <input type="hidden" id="hd_year" name="">
                    <div class="modal-header">
                        <h4 class="modal-title">Confirm Data Deletion</h4>
                        <span class="close" data-bs-dismiss="modal" aria-hidden="true" ><i class="material-icons">&#xe5cd;</i></span>
                    </div>
                    <div class="modal-body">
                        <p id="confirm_delete">Are you sure you want to delete all the data?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancel" class="btn btn-danger" data-bs-dismiss="modal">
                        <input type="submit" value="Delete All" class="btn btn-info">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="uploadDataModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
	                <div class="modal-header">
	                    <h4 class="modal-title">Upload Geodata CSV</h4>
	                    <span class="close" data-bs-dismiss="modal" aria-hidden="true" ><i class="material-icons">&#xe5cd;</i></span>
	                </div>
	                <div class="modal-body">
	                	<input type="file" class="form-control" required name="chooseFile" id="chooseFile" accept=".csv" multiple/>
	                </div>
	                <div class="modal-footer">
	                    <input type="button" value="Cancel" class="btn btn-danger" data-bs-dismiss="modal">
	                    <input type="submit" value="Upload Data" id="upload-submit" class="btn btn-info">
	                </div>
            </div>
        </div>
    </div>
    <!-- Prompt Modal HTML -->
    <div id="promptModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Prompt Title</h4>
                    <span class="close" data-bs-dismiss="modal" aria-hidden="true" ><i class="material-icons">&#xe5cd;</i></span>
                </div>
                <div class="modal-body">
                    <p id="message">Data updated successfully!</p>
                </div>
                <div class="modal-footer">
                    <input type="button" value="Okay" class="btn btn-info" data-bs-dismiss="modal">
                </div>
            </div>
        </div>
    </div>
    <script src="static/js/yearpicker.js"></script>
    <script>
        $(document).ready(function() {
            var fetch_url = "static/dbase/fetch_geodata.jsp";
            $.getJSON(fetch_url, function(data){
                var result = "";
                console.log(data);
                for(var i = 0; i < data.length; i++){
                    result += "<tr>";
                    result += "<td>"
                    result += "<span class='custom-checkbox'><input type='checkbox' name='options[]' class='checkbox1' id='checkbox1' value='"+data[i].id+"'>";
                    result += "<label for='checkbox1'></label>";
                    result += "</span>";
                    result += "</td>";
                    result += "<td>" + data[i].id + "</td>";
                    result += "<td>" + data[i].brgy + "</td>";
                    result += "<td>" + data[i].population + "</td>";
                    result += "<td>" + data[i].employed + "</td>";
                    result += "<td>" + data[i].unemployed + "</td>";
                    result += "<td>" + data[i].underemployed + "</td>";
                    result += "<td>" + data[i].hectares + "</td>";
                    result += "<td>" + data[i].sqkm + "</td>";
                    result += "<td>" + data[i].year + "</td>";
                    result += "<td>" + data[i].class + "</td>";
                    result += "<input type='hidden' id='data-"+data[i].id+"' value='"+data[i].geom+"'>";
                    result += "<td class='btn-group'>";
                    result += "<button class='edit js-update-geo' data-url='"+data[i].id+"' id='edit-tool'><i class='material-icons' data-bs-toggle='tooltip' data-bs-placement='top' title='Edit'>&#xE8B8;</i></button>";
                    result += "<button class='delete js-delete-geo' data-url='"+data[i].brgy+"&"+data[i].year+"'><i class='material-icons' data-bs-toggle='tooltip' title='Delete'>&#xE5C9;</i></button>";
                    result += "</td>";
                    result += "</tr>";
                }
                $("tbody").html(result);
            });

            // url 
        });
    </script>
    <!-- <script src="static/js/functionality.js"></script> -->
    <script src="static/js/crud_functions.js"></script>
</body>
</html>
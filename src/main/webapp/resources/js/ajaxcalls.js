/**
 * 
 */

 $("#adminBtn").click(function(){
		$.ajax({
		    url: 'getAdmin',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#AdminTable').find('tbody');
		    	  tableBody.empty();
		    	  
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.userid),
		    	        $('<td>').text(item.name),
		    	        $('<td>').text(item.email),
		    	        $('<td>').text(item.userStatus),
		    	        $('<td>').html("<a class='btn btn-success' style='color:black;' href='editAdmin?id="+item.userid+"'>Edit</a>")
		    	        		/* +"&nbsp&nbsp<a class='btn btn-danger' style='color:black;' href='deleteAdmin?id="+item.userid+"'>Delete</a>" */
		    	      );

		    	      tableBody.append(newRow);
		    	    });
		    	    $('#myTableBody').hide();
		    		$('#AdminTable').show();
		       
		    },
		    error: function(xhr, status, error) {
		        // Handle errors here
		        console.log(status + ': ' + error);
		    }
		});
	});
	
	$("#userBtn").click(function(){
		$('#AdminTable').hide();
		$.ajax({
		    url: 'getUser',
		    method: 'GET',
		    dataType: 'json',
		    success: function(data) {
		    	console.log(data);
		    	  var tableBody = $('#AdminTable').find('tbody');
					tableBody.empty();
		    	    $.each(data, function(index, item) {
		    	      var newRow = $('<tr>').append(
		    	        $('<td>').text(item.userid),
		    	        $('<td>').text(item.name),
		    	        $('<td>').text(item.email),
		    	        $('<td>').text(item.userStatus),
		    	        $('<td>').html("<a class='btn btn-success' style='color:black;' href='editAdmin?id="+item.userid+"'>Edit</a>"
		    	        		 +"&nbsp&nbsp<a class='btn btn-danger' style='color:black;' href='deleteUser?id="+item.userid+"'>Delete</a>")
		    	      );

		    	      tableBody.append(newRow);
		    	    });
		    	    $('#myTableBody').hide();
		    		$('#AdminTable').show();
		       
		    },
		    error: function(xhr, status, error) {
		        // Handle errors here
		        console.log(status + ': ' + error);
		    }
		});
	});

var stateID;

//AJAX CALL FOR INSTITUTE LIST
		function setState(){
			stateID = document.getElementById("state").value;
			//document.getElementById("admissionDetails").appendChild("<select name=institute id=institute>");
		 	xmlHttp = GetXmlHttpObject();
            var url = "institutes?stateID="+stateID;
            //alert(url);
            xmlHttp.open("POST",url,true);
            xmlHttp.send(null);
            xmlHttp.onreadystatechange = stateChanged
        }
   
//AJAX RESPONSE FROM BACKEND
		function stateChanged()
		{
			var showdata = xmlHttp.responseText;
			//alert(showdata);
			document.getElementById("institutes").innerHTML = "<label>Institute</label><select class='form-control' name=institute id=institute onchange=setInstitute()>"+showdata+"</select>";
			document.getElementById("divSubCategory").innerHTML = "<label>Physically Challenged</label><select class='form-control' name=subCategory id=subCategory>"+subCat+"</select>";
			//console.log(subCat);
			document.getElementById("divStateQuota").innerHTML = "<label>HomeState/OtherState</label><select class='form-control' name=stateQuota id=stateQuota>"+stateQt+"</select>";
			$("#showChartsButton").show();
		}

//CREATION OF XMLOBJECT FOR DIFFERENT BROWSERS
		function GetXmlHttpObject()
		{
			var xmlHttp=null;
			try
			{
				//Firefox, Opera 8.0+, Safari
				xmlHttp = new XMLHttpRequest();
			}
			catch(e)
			{
				//Internet Explorer
				try
				{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				}
				//Google Chrome
				catch(e)
				{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
			return xmlHttp;
        }
				
<%@ include file="connect.jsp"%>


<%

String company=(String)application.getAttribute("cname");
String prjname="";
int i=0,count=0;
try
{
			


%><html>
<head>
<title>No. of Projects a developer is working on..</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<body>
<div id="graph">Loading graph...</div>
<script type="text/javascript">
var myData=new Array();
var colors=[];

<%
	
//String query1="select prjname,count(developer) from developer_project where company='"+company+"' GROUP BY prjname "; 
String query1="select developer,count(prjname) from developer_project where company='"+company+"' GROUP BY developer ";
Statement st1=connection.createStatement();
ResultSet rs1=st1.executeQuery(query1);
while ( rs1.next() )
{
	
	prjname=rs1.getString(1);
	count=rs1.getInt(2);
	
	%>
	
	myData["<%=i%>"]=["<%= prjname%>",<%= count%>];
        
	<%

	i++;}
	%>
	
	var myChart = new JSChart('graph', 'pie');
	
	myChart.setDataArray(myData);
	myChart.setBarColor('#FF0000');
	myChart.setBarOpacity(0.8);
	myChart.setSize(400,400);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#000000');
	
	myChart.draw();
	
      
</script>

</body>
</html>
<%

}
catch(Exception e)
{
e.printStackTrace();
}
%>






<%-- 
    Document   : matches
    Created on : May 18, 2018, 10:36:36 AM
    Author     : Divya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.MongoClient,
        com.mongodb.client.MongoCollection,
        com.mongodb.client.MongoDatabase,
        static com.mongodb.client.model.Filters.*,
        com.mongodb.client.model.CreateCollectionOptions,
        com.mongodb.client.model.ValidationOptions,
        org.bson.Document,
        com.mongodb.BasicDBObject,
        com.mongodb.DB,
        com.mongodb.DBCollection,
        com.mongodb.DBCursor,
        com.mongodb.DBObject,
        com.mongodb.client.MongoCursor,
        com.mongodb.client.model.Projections,
        com.mongodb.client.model.Indexes,
        com.mongodb.client.model.IndexOptions,
        com.mongodb.client.model.Filters,
        java.util.Arrays,
        java.util.Scanner,
        java.util.Iterator ,
        java.util.ArrayList,
        java.util.Collections"

        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

        <title>Statistics </title>
        <style type="text/css">
            .horizontal { display: inline; background-color: whitesmoke; }
        </style>
    </head>
    <body>
        <%!
            MongoClient mb = new MongoClient();
            MongoDatabase md = mb.getDatabase("football");
            MongoCollection mc = md.getCollection("players_extra_data");
            MongoCollection mc2 = md.getCollection("teams_stats");
            FindIterable<Document> fi;
            Iterator<Document> it;
            Document doc;
            String[] arr = {"Goals", "Shots on Target", "Total Shots(inc. Blocked)", "% Goals to Shots", "Shooting Accuracy (5+ Shots)",
                "Penalty Goals", "Penalties not Scored", "Hit Woodwork", "Headed Goals", "Shots without Scoring",
                "Shots Off Target", "Passes", "Assists", "Touches", "Crosses", "Chances Created", "Dribbles", "Corners Taken", 
                "Tackles", "Passes Completed", "Passing Accuracy", "Clearances", "Clean Sheets", "Blocks",
                "Clearances off Line", "Goals Conceded", "Interceptions", "Saves Made", "Saves to Shots Ratio",
                "Fouls Won", "Fouls Conceded", "Offsides", "Yellow Cards", "Red Cards", "Subs On", "Subs Off"};
            ArrayList list1, list2, list3;
            ArrayList<String> list;
            
        %>
        

    <div class="row">
        <nav id="navbar-example2" class="navbar navbar-light bg-light">
            
             <div class="row">
            <div class="col-xl-11">
        <a class="navbar-brand" href="#asdsd"><h2>Statistics</h2></a>
            </div>
            <div class="col-xl-1">
         <form action="main.jsp">
              <button type="submit" class="btn btn-primary btn-lg">Home</button> 
        </form>
                </div>
        </div>
            
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[0]%>">Goals</a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[1]%>">Shots On target</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[2]%>">Total Shots</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[3]%>">% Goals to Shots</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[4]%>">Shooting Accuracy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[5]%>">Penalty Goals</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[6]%>">Penalties not Scored</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[7]%>">Hit Woodwork</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[8]%>">Headed Goals</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[9]%>">Shots without Scoring</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[10]%>">Shots Off Target</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[11]%>">Passes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[12]%>">Assists</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[13]%>">Touches</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[14]%>">Crosses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[15]%>">Chances Created</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[16]%>">Dribbles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[17]%>">Corners Taken</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[18]%>">Tackles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[19]%>">Passes Completed</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[20]%>">Passing Accuracy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[21]%>">Clearances</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[22]%>">Clean Sheets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[23]%>">Blocks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[24]%>">Clearances Off Line</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[25]%>">Goals Conceded</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[26]%>">Interceptions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[27]%>">Saves Made</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[28]%>">Saves to Shots Ratio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[29]%>">Fouls Won</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[30]%>">Fouls Conceded</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[31]%>">Offsides</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[32]%>">Yellow Cards</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[33]%>">Red Cards</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[34]%>">Subs On</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%="#" + arr[35]%>">Subs Off</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#stats">General Stats</a>
                </li>

            </ul>
    </div>   
</nav>

<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
    <div class="container">
        <div id="stats">
            <h2>MAX-MIN Stats</h2>
            <table class="table table-bordered">
                <thead>
                    
                    <tr>

                        <th>Category</th>
                        <th>Maximum</th>
                        <th>Team</th>
                        <th>Minimum</th>
                        <th>Team</th>
                    </tr>

                </thead>
                <tbody>    
                    <%
                        fi = mc2.find();
                        it = fi.iterator();
                        ArrayList team;
                        Document t;
                        ArrayList<Integer> list2=new ArrayList<Integer>();
                        //Document t;
                        //ArrayList list1, list2, list3, list4, list5, list6, list7, list8, list9, list10, list11;
                        while (it.hasNext()) {

                            //System.out.println(it.next());
                            t = it.next();
                            System.out.println(t);
                            Integer j, k;
                            System.out.println("chava");
                            team = (ArrayList) t.get("Team");
                            System.out.println(team);
                            //System.out.println(t.get("Group A"));
                            //list.clear();
                            list = (ArrayList) t.get("Goals");
                            System.out.println(list);
                            for (int i = 0; i < list.size(); i++) {
                                System.out.println(list.get(i));
                                System.out.println("yes");
                                list2.add(Integer.valueOf(list.get(i)));
                                
                            }
                            
                            /*or (String s : list) {
                                System.out.println(Integer.valueOf(s));
                            }*/

                            //intlist.add(Integer.valueOf(s));
                            System.out.println(list2);
                            j = Collections.max(list2);
                            k = Collections.min(list2);
                            System.out.println(list2.indexOf(j));
                            System.out.println(list.get(0));

                    %>   


                    <tr >
                        <td >Goals</td>
                        <td ><%=j%></td>
                        <td><%=team.get(list2.indexOf(j))%></td>
                        <td><%=k%></td>
                        <td><%=team.get(list2.indexOf(k))%></td>
                    </tr> 
                
                    <%
                        list.clear();
                        list2.clear();
                        list = (ArrayList) t.get("Shots on target");
                            System.out.println(list);
                            for (int i = 0; i < list.size(); i++) {
                                System.out.println(list.get(i));
                                System.out.println("yes");
                                list2.add(Integer.valueOf(list.get(i)));
                                
                            }
                            
                            /*or (String s : list) {
                                System.out.println(Integer.valueOf(s));
                            }*/

                            //intlist.add(Integer.valueOf(s));
                            System.out.println(list2);
                            j = Collections.max(list2);
                            k = Collections.min(list2);
                            System.out.println(list2.indexOf(j));
                            System.out.println(list.get(0));
                    %>
                    <tr >
                        <td >Shots on target</td>
                        <td ><%=j%></td>
                        <td><%=team.get(list2.indexOf(j))%></td>
                        <td><%=k%></td>
                        <td><%=team.get(list2.indexOf(k))%></td>
                    </tr> 
                    <%
                        list.clear();
                        list2.clear();
                        list = (ArrayList) t.get("Passes");
                            System.out.println(list);
                            for (int i = 0; i < list.size(); i++) {
                                System.out.println(list.get(i));
                                System.out.println("yes");
                                list2.add(Integer.valueOf(list.get(i)));
                                
                            }
                            
                            /*or (String s : list) {
                                System.out.println(Integer.valueOf(s));
                            }*/

                            //intlist.add(Integer.valueOf(s));
                            System.out.println(list2);
                            j = Collections.max(list2);
                            k = Collections.min(list2);
                            System.out.println(list2.indexOf(j));
                            System.out.println(list.get(0));
                    %>
                    <tr >
                        <td >Passes</td>
                        <td ><%=j%></td>
                        <td><%=team.get(list2.indexOf(j))%></td>
                        <td><%=k%></td>
                        <td><%=team.get(list2.indexOf(k))%></td>
                    </tr> 
                    <%
                        list.clear();
                        list2.clear();
                        list = (ArrayList) t.get("Tackles");
                            System.out.println(list);
                            for (int i = 0; i < list.size(); i++) {
                                System.out.println(list.get(i));
                                System.out.println("yes");
                                list2.add(Integer.valueOf(list.get(i)));
                                
                            }
                            
                            /*or (String s : list) {
                                System.out.println(Integer.valueOf(s));
                            }*/

                            //intlist.add(Integer.valueOf(s));
                            System.out.println(list2);
                            j = Collections.max(list2);
                            k = Collections.min(list2);
                            System.out.println(list2.indexOf(j));
                            System.out.println(list.get(0));
                    %>
                    <tr >
                        <td >Tackles</td>
                        <td ><%=j%></td>
                        <td><%=team.get(list2.indexOf(j))%></td>
                        <td><%=k%></td>
                        <td><%=team.get(list2.indexOf(k))%></td>
                    </tr> 
                    <%
                        list.clear();
                        list2.clear();
                        list = (ArrayList) t.get("Clean Sheets");
                            System.out.println(list);
                            for (int i = 0; i < list.size(); i++) {
                                System.out.println(list.get(i));
                                System.out.println("yes");
                                list2.add(Integer.valueOf(list.get(i)));
                                
                            }
                            
                            /*or (String s : list) {
                                System.out.println(Integer.valueOf(s));
                            }*/

                            //intlist.add(Integer.valueOf(s));
                            System.out.println(list2);
                            j = Collections.max(list2);
                            k = Collections.min(list2);
                            System.out.println(list2.indexOf(j));
                            System.out.println(list.get(0));
                    %>
                    <tr >
                        <td >Clean Sheets</td>
                        <td ><%=j%></td>
                        <td><%=team.get(list2.indexOf(j))%></td>
                        <td><%=k%></td>
                        <td><%=team.get(list2.indexOf(k))%></td>
                    </tr> 
                    <%
                        list.clear();
                        list2.clear();
                        list = (ArrayList) t.get("Yellow Cards");
                            System.out.println(list);
                            for (int i = 0; i < list.size(); i++) {
                                System.out.println(list.get(i));
                                System.out.println("yes");
                                list2.add(Integer.valueOf(list.get(i)));
                                
                            }
                            
                            /*or (String s : list) {
                                System.out.println(Integer.valueOf(s));
                            }*/

                            //intlist.add(Integer.valueOf(s));
                            System.out.println(list2);
                            j = Collections.max(list2);
                            k = Collections.min(list2);
                            System.out.println(list2.indexOf(j));
                            System.out.println(list.get(0));
                    %>
                    <tr >
                        <td >Yellow Cards</td>
                        <td ><%=j%></td>
                        <td><%=team.get(list2.indexOf(j))%></td>
                        <td><%=k%></td>
                        <td><%=team.get(list2.indexOf(k))%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>  
        </div>
    </div>
    
    <%

        fi = mc.find();
        it = fi.iterator();
        //Document t;

        int count = 0;
        while (it.hasNext()) {

            //System.out.println(it.next());
            t = it.next();
            //System.out.println(t.get("Group A"));
            list1 = (ArrayList) t.get("Player");
            list2 = (ArrayList) t.get("Team");
            list3 = (ArrayList) t.get("Value");

            //System.out.println("chava");
            System.out.println(list1);
    %>
    <div class="container">
        <h2><%=arr[count]%></h2>
        <div id="<%=arr[count]%>">
            <table class="table table-bordered" >
                <thead>
                    <tr>

                        <th>Player</th>
                        <th>Team</th>
                        <th><%=arr[count]%></th>

                    </tr>

                </thead>
                <tbody>
                    <%for (int i = 0; i < 10; i++) {
                    %>
                    <tr >
                <div><td ><%=list1.get(i)%></td></div>
                <div><td><%=list2.get(i)%></td></div>
                <td><%=list3.get(i)%></td>

                </tr>      
                <%}%>
                </tbody>
            </table>
        </div>
    </div>

    <%
            count++;
        }
    %>    


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

</body>
</html>
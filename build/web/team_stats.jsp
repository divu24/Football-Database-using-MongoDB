<%-- 
    Document   : main
    Created on : 26 Apr, 2018, 10:12:06 PM
    Author     : HP
--%>

<%@page import="com.mongodb.client.AggregateIterable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.MongoClient,
        com.mongodb.client.MongoCollection,
        com.mongodb.client.MongoDatabase,
        com.mongodb.MongoClient,
        com.mongodb.client.FindIterable,
        java.util.Iterator,
        static com.mongodb.client.model.Filters.*,
        com.mongodb.client.model.CreateCollectionOptions,
        com.mongodb.client.model.ValidationOptions,
        org.bson.Document,
        com.mongodb.BasicDBObject,
        com.mongodb.BasicDBList,
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
        java.util.ArrayList,
        java.util.Collections
        "
        %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

        <title>Euro 2012</title>
    </head>
    <body>
        <div class="row">
            <div class="col-xl-11">
        <h1>EURO 2012</h1>
            </div>
            <div class="col-xl-1">
         <form action="main.jsp">
              <button type="submit" class="btn btn-primary btn-lg">Home</button> 
        </form>
                </div>
        </div>


        <%!
            MongoClient mb = new MongoClient();
            MongoDatabase md = mb.getDatabase("football");
            MongoCollection mc = md.getCollection("teams_stats");
            MongoCollection mc2 = md.getCollection("matches");
            FindIterable<Document> fi;
            AggregateIterable<Document> ai;
            Iterator<Document> it;
            Document doc;
            int n;
            DBCursor cursor;
            ArrayList<String>  list= new ArrayList();
            ArrayList<Integer>  intlist= new ArrayList();
        %>

        <%
            String temp = (String) session.getAttribute("teams");
            /*Document innerdoc30 = new Document("$lt",-65.754168);
                             Document innerdoc31 = new Document("$gt",70);
                             Document innerdoc32 = new Document("$ne","American");
                             doc = new Document("address.coord.0",innerdoc30)
                                                .append("grades.score",innerdoc31)
                                                .append("cuisine",innerdoc32);
                             fi =  mc.find(doc);
                                it = fi.iterator();
                                while(it.hasNext())
                                {

                                    System.out.println(it.next());
                    db.teams_stats.aggregate([{$project:{index:{$indexOfArray:["$Team","Denmark"]}}}])
                                }*/
            //String[] arr={"$Team", temp};
            System.out.println(temp + "Ganesh");
            Document t;
            //JsonObject j = new JsonObject();
            //JSONArray myArray = objJson.getJSONArray("arr");
            ai = mc.aggregate(Arrays.asList(new Document("$project", new Document("index", new Document("$indexOfArray", Arrays.asList("$Team", temp))))));
            fi = mc.find();
            it = ai.iterator();
            while (it.hasNext()) {

                t = it.next();
                System.out.println(t);

                n = t.getInteger("index");

            }
            System.out.println(n);
            
 
            it = fi.iterator();
            while (it.hasNext()) {

                t = it.next();
                System.out.println(t);
                list.clear(); list= (ArrayList) t.get("Goals");
                for(String s : list) intlist.add(Integer.valueOf(s));
                Integer j= Collections.max(intlist);
                Integer sum = 0;
                    if (!intlist.isEmpty()) {
                        for (Integer mark : intlist) {
                            sum += mark;
                        }
                        System.out.println("AVERAGE="+(sum.doubleValue() / intlist.size()));
                        System.out.println("MAX="+j);
                        System.out.println("index="+intlist.indexOf(j));
                    }
                System.out.println(list.get(n));
                //System.out.println(arr[0]);
        %>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-xl-6">
                    Goals
                    </div>
                    <div class="col-xl-6">
                    Tournament Average
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=list.get(n)%></h5>
                    </div>
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=sum.doubleValue() / intlist.size()%></h5>
                    </div>
                </div>

            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Shots on target");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Shots On Target
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Shots off target");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Shots Off Target
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Shooting Accuracy");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Shooting Accuracy
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>    
        <%
                list.clear(); list= (ArrayList) t.get("% Goals-to-shots");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                % Goals-to-shots
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div> 
        <%
                list.clear(); list= (ArrayList) t.get("Total shots (inc. Blocked)");
                intlist.clear();
                for(String s : list) intlist.add(Integer.valueOf(s));
                
                 sum = 0;
                    if (!intlist.isEmpty()) {
                        for (Integer mark : intlist) {
                            sum += mark;
                        }
                        System.out.println("AVERAGE="+(sum.doubleValue() / intlist.size()));
                    }
                System.out.println(list.get(n));
                //System.out.println(arr[0]);
        %>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-xl-6">
                    Total shots (inc. Blocked)
                    </div>
                    <div class="col-xl-6">
                    Tournament Average
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=list.get(n)%></h5>
                    </div>
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=sum.doubleValue() / intlist.size()%></h5>
                    </div>
                </div>

            </div>
        </div> 
        <%
                list.clear(); list= (ArrayList) t.get("Hit Woodwork");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Hit Woodwork
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>  
        <%
                list.clear(); list= (ArrayList) t.get("Penalty goals");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Penalty Goals
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Penalties not scored");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Penalties Not Scored 
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>   
        <%
                list.clear(); list= (ArrayList) t.get("Headed goals");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Headed Goals
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Passes");
                intlist.clear();
                for(String s : list) intlist.add(Integer.valueOf(s));
                sum = 0;
                    if (!intlist.isEmpty()) {
                        for (Integer mark : intlist) {
                            sum += mark;
                        }
                        System.out.println("AVERAGE="+(sum.doubleValue() / intlist.size()));
                    }
                System.out.println(list.get(n));
                //System.out.println(arr[0]);
        %>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-xl-6">
                    Passes
                    </div>
                    <div class="col-xl-6">
                    Tournament Average
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=list.get(n)%></h5>
                    </div>
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=sum.doubleValue() / intlist.size()%></h5>
                    </div>
                </div>

            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Passes completed");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Passes completed
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Passing Accuracy");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Passing Accuracy
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Touches");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Touches
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Crosses");
                intlist.clear();
                for(String s : list) intlist.add(Integer.valueOf(s));
                sum = 0;
                    if (!intlist.isEmpty()) {
                        for (Integer mark : intlist) {
                            sum += mark;
                        }
                        System.out.println("AVERAGE="+(sum.doubleValue() / intlist.size()));
                    }
                System.out.println(list.get(n));
                //System.out.println(arr[0]);
        %>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-xl-6">
                    Crosses
                    </div>
                    <div class="col-xl-6">
                    Tournament Average
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=list.get(n)%></h5>
                    </div>
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=sum.doubleValue() / intlist.size()%></h5>
                    </div>
                </div>

            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Dribbles");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Dribbles
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Corners Taken");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Corners Taken
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Tackles");
                intlist.clear();
                for(String s : list) intlist.add(Integer.valueOf(s));
                
                 sum = 0;
                    if (!intlist.isEmpty()) {
                        for (Integer mark : intlist) {
                            sum += mark;
                        }
                        System.out.println("AVERAGE="+(sum.doubleValue() / intlist.size()));
                    }
                System.out.println(list.get(n));
                //System.out.println(arr[0]);
        %>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-xl-6">
                    Tackles
                    </div>
                    <div class="col-xl-6">
                    Tournament Average
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=list.get(n)%></h5>
                    </div>
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=sum.doubleValue() / intlist.size()%></h5>
                    </div>
                </div>

            </div>
        </div> 
        <%
                list.clear(); list= (ArrayList) t.get("Clearances");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Clearances
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Interceptions");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Interceptions
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Clearances off line");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Clearances off line
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Clean Sheets");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Clean Sheets
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Blocks");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Blocks
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Goals conceded");
                intlist.clear();
                for(String s : list) intlist.add(Integer.valueOf(s));
                
                
                 sum = 0;
                    if (!intlist.isEmpty()) {
                        for (Integer mark : intlist) {
                            sum += mark;
                        }
                        System.out.println("AVERAGE="+(sum.doubleValue() / intlist.size()));
                    }
                System.out.println(list.get(n));
                //System.out.println(arr[0]);
        %>
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-xl-6">
                    Goals Conceded
                    </div>
                    <div class="col-xl-6">
                    Tournament Average
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=list.get(n)%></h5>
                    </div>
                    <div class="col-xl-6">
                    <h5 class="card-title"><%=sum.doubleValue() / intlist.size()%></h5>
                    </div>
                </div>

            </div>
        </div> 
        <%
                list.clear(); list= (ArrayList) t.get("Saves made");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Saves made
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Saves-to-shots ratio");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Saves-to-shots ratio
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Fouls Won");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Fouls Won
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Fouls Conceded");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Fouls Conceded
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Offsides");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Offsides
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Yellow Cards");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Yellow Cards
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Red Cards");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Red Cards
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Subs on");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Subs on
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Subs off");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Subs off
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>
        <%
                list.clear(); list= (ArrayList) t.get("Players Used");
                System.out.println(list.get(n));
        %>
        <div class="card">
            <div class="card-header">
                Players Used
            </div>
            <div class="card-body">
                <h5 class="card-title"><%=list.get(n)%></h5>


            </div>
        </div>        
        <%
            }

        %>



        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    </body>
</html>

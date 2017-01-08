<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ include file="/WEB-INF/jsp/includes.jsp"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
	<head>
		<!-- URL and variables -->
		<spring:url value="/resources/css/menu-deathnote.css" var="pluginMenuCSS" />
		<spring:url value="/resources/css/form.css" var="formCSS" />
		<spring:url value="/resources/js/menu-deathnote.js" var="pluginMenuJS" />
		<spring:url value="/resources/js/panelAdminController.js" var="controlMenuJS" />
		<spring:url value="/resources/img/icon/forms.png" var="formsPNG" />
		<spring:url value="/resources/img/icon/timeline.png" var="timelinePNG" />
		<spring:url value="/resources/img/icon/user.png" var="userPNG" />
		<spring:url value="/resources/img/icon/mail.png" var="mailPNG" />
		<spring:url value="/resources/img/icon/database.png" var="databasePNG" />
		<spring:url value="/resources/img/DeathNote_Wallpaper.jpg" var="wallpaperPNG" />
		<spring:url value="/resources/img/shinigami-eye.png" var="eyePNG" />
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>DeathNote - Panel admin</title>
		
		<!-- CSS references with JSP variables -->
		<link rel="stylesheet" type="text/css" href="${pluginMenuCSS}"/>
		<link rel="stylesheet" type="text/css" href="${formCSS}"/>
		
		<!-- JS references with JSP variables -->
		<script src="${pluginMenuJS}" charset="utf-8"></script>
		<script src="${controlMenuJS}" charset="utf-8"></script>
	</head>
	<body style="background:black;">
		<!-- MENU BAR -->
		<span style="position:fixed; left: 10px; top: 10px;font-size:10px;cursor:pointer; color:white; z-index:66;" onclick="closeStickyMenuNavigation(event);">&#9587;</span>
			    <div id="mySideBarnav" class="sideStickyBarNav">
			      <span href="javascript:void(0)" class="closebtnSticky" onclick="openStickyMenuNavigation(event);">&#9654;</span>
			      <a href="javascript:void(0)" onclick="openWrapper(event)" menu-value="wrap_forms"><img src="${formsPNG}" menu-value="wrap_forms"/></a>
			      <a href="loadEvents"><img src="${timelinePNG}"/></a>
			      <a href="javascript:void(0)" onclick="openWrapper(event)" menu-value="wrap_database"><img src="${databasePNG}" menu-value="wrap_database"/></a>
			      <br>
			      </br>
			      <br>
			      </br>
			      <a href="javascript:void(0)" onclick="openWrapper(event)" menu-value="wrap_mail"><img src="${mailPNG}" menu-value="wrap_mail"/></a>
			      <a href="javascript:void(0)" onclick="openWrapper(event)" menu-value="wrap_user"><img src="${userPNG}" menu-value="wrap_user"/></a>
			    </div>
		<!-- END MENU BAR -->
		
		<!-- WRAP MAIN -->
		<div id="wrap_main">
			<div id="wrap_forms">
				<h1 class="notifier">Element "${previousTitle}" added.</h1>
				<div class="modal form-event">
			<div class="modal-content">
				<span class="modal-closer" id="closeIdentifier" >&times;</span> 
				<form:form class="form-new-event" method="post" commandName="event" action="panelAdd">
					<div class="modal-event-title">
						<form:input type="text" path="title" placeholder="Title of the event" required="required"/>
					</div>


					<div class="event-picture taped">
						<img src="${wallpaperPNG}"/>
					</div>

					<div class="event-informations">
						<div class="event-period">
							<div class="event-date">
								<form:input type="date" path="date" required="required"/>
							</div>
							<span> at </span>
							<div class="event-time">
								<input type="time" />
							</div>
						</div>
						<div class="event-location">
							<form:input type="text" path="location" name="location-of-event" placeholder="Place of the Event" required="required"/> 
						</div>
					</div>
					
					<div class="event-description">
						<form:textarea name="event-description" path="description" placeholder="Describe the event here" required="required"></form:textarea>
					</div>
					
					<div class="event-point-view">
						<span class="pov-title">Event Category :</span>
						<div class="event-pov">
							<form:input id="principal-view" path="pointOfView" type="radio"  value="" required="required"/>
							<label for="principal-view">General</label>
							<form:input id="kira-view" type="radio" path="pointOfView" value="false"/>
							<label for="kira-view">Kira</label>
							<form:input id="police-view" type="radio" path="pointOfView" value="true"/>
							<label for="police-view">L / Police</label>
						</div>
					</div>
					
					<div class="event-episode">
						<span class="question-episode">Click on Shinigami Eye if you want to add a Memory</span>
						<div id="shinigami-eye">
							<img src="${eyePNG}">
						</div>
						<div class="episode-picker">
							<label for="event-episode">Choose the episode :</label>
							
							<form:select class="select-episode" path="episode" >
								<c:forEach items="${episodesList}" var="episode">
									<option value="${episode.id}" >Episode: ${episode.number}, Season: ${episode.season}</option>
								</c:forEach>
							</form:select>
						</div>
					</div>
					<input id="save-event" type="submit" value="Add this Event to Timeline"/>
				</form:form>
			</div>
		</div>
		<script type="text/javascript">
			var button = document.getElementById("shinigami-eye");button.onclick = function(){
			        this.classList.toggle("opened");
			        this.nextElementSibling.classList.toggle("show");
			  }
		</script>
			</div>
			<div id="wrap_database"></div>
			<div id="wrap_mail"></div>
			<div id="wrap_admin"></div>
		</div>
		<c:if test="${previousTitle !=''}">
			<div class="notifier">
				<p>Notification:</p>
				Element: ${previousTitle} has been added.
			</div>
		</c:if>
		
		<!-- END WRAP MAIN -->
	</body>
</html>
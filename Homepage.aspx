<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>


<!DOCTYPE html>
<html>
<head>
<title>Home page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    	@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');
body,h1 
{	
    font-family: Raleway, sans-serif;
}
body, html
{
    height: 100%
}
.bgimg {
background-image: url("bg1.jpg");
      min-height: 100%;
  background-position: center;
  background-size: cover;
}

.desc{
    text-align: center;
    text-size-adjust: auto;
    bottom: 0;
    right: 0;

    margin: 20px;

}
.proceed-button {
       	background: #fff;
      font-style: normal;
	font-size: 14px;
	margin:auto;
	padding: 16px 20px;
	border-radius: 26px;
	border: 1px solid #D4D3E8;
	font-weight: 700;
    align-content:center;
    width: 30%;
	color: black;
	box-shadow: 0px 2px 2px #5C5696;
	transition: .2s;
}

    .proceed-button:hover {
        border-color: #6A679E;
        background-color:  #6A679E;
    }
</style>
</head>
<body>

<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge w3-animate-zoom">
      <asp:Image ID="logo" runat="server" Imageurl="~/logo.png" />
  </div>
     <div class="w3-display-middle">    
    <h1 class="w3-jumbo w3-animate-top">
        WELCOME
    </h1>
                <div class="desc">
    Where your financial needs<br /> meet convenience and security
           </div>
              <hr class="w3-border-grey" style="margin:auto;width:60%"> 
              <br />
         <p style="text-align: center">
         <a href="main.aspx" class="proceed-button">Proceed</a>
    </p>
           </div>

</div>
</body>
</html>

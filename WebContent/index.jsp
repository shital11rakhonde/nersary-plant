<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, entity.Plant" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Plant Nursery - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: #f4fff4;
    }
    .carousel-item img {
        height: 400px;
        object-fit: cover;
       
    }
    .card {
        border-radius: 15px;
        transition: transform 0.2s;
    }
    .card:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 20px rgba(0,0,0,0.2);
    }
    .section-title {
        margin: 50px 0 20px;
        text-align: center;
        font-weight: bold;
        color: #2e7d32;
    }
</style>
    <style>
        .plant-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-bottom: 20px;
            transition: transform 0.2s;
        }

        .plant-card:hover {
            transform: scale(1.03);
        }

        .plant-img {
            max-height: 180px;
            object-fit: cover;
            border-radius: 8px;
        }
        
        
        /* 🌿 Animated Title */




.marquee {
  overflow: hidden;
  white-space: nowrap;
  width: 100%;
  background: transparent;
  
  position: fixed;
  top: 56px; /* adjust: equal to navbar height */
  left: 0;
  z-index: 1020; /* above content but below modal */
}
*{  padding: 0;
  margin: 0;}
/* the moving track */
.marquee__inner {
  display: inline-block;
  animation: marquee 20s linear infinite;
  /* 👇 remove ANY margin/padding */
  padding: 0;
  margin: 0;
}

/* text style */
.marquee__inner span {
  display: inline-block;
  font-size: clamp(1rem, 2.5vw, 2rem);
  font-weight: 600;
  color: #2e7d32;
  letter-spacing: 0.5px;
  padding: 0;     /* 👈 no padding */
  margin: 0;      /* 👈 no margin */
}

/* smooth infinite loop */
@keyframes marquee {
  0%   { transform: translateX(100%); }
  100% { transform: translateX(-100%); }
}

.space{margin-top:90px}  







.video-container {
    width: 100%;
    height: 80vh; /* 50% of viewport height */
    position: relative;
    overflow: hidden;
}

.video-container video {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4); /* Dark overlay for text readability */
    z-index: 2;
}

.hero-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #fff; /* Make text visible */
    z-index: 3;
    text-align: center;
}

.hero-content h1 {
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 10px;
}
.hero-content p {
    font-size: 1.2rem;
    margin-bottom: 20px;
}
.hero-content .btn {
    padding: 10px 20px;
    font-size: 1.2rem;
}


      
    </style>
    
    
    
    
</head>
<body>


   <!-- Continuous moving welcome text 
<div class="marquee me-0 ms-0 mt-3 bg-light">
  <div class="marquee__inner">
    <span>🌿 Welcome to Our Plant Nursery</span>
    <span>🌸 Fresh arrivals • Best prices • Fast delivery</span>
    <span>🌿 Welcome to Our Plant Nursery</span>
    <span>🌸 Fresh arrivals • Best prices • Fast delivery</span>
  </div>
</div>
-->




<div class="video-container">
    <video autoplay muted loop playsinline>
        <source src="video/218870_small.mp4" type="video/mp4">
    </video>
    <div class="overlay"></div>
    <div class="hero-content text-center">
        <h1>Welcome to GreenLeaf Nursery</h1>
        <p>Your plants, your happiness.</p>
        <a href="#home" class="btn btn-success">Shop Now</a>
    </div>
</div>

   
    
  <div class="container-fluid px-0 py-5"> <!-- full width, no padding -->
  <div class="row g-0 "> <!-- g-0 removes gutter spacing -->

    <!-- 🌿 Image Slider (col-8) -->
    <div class="col-12 col-lg-12">
      <div id="plantCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
           <img src="img/caro2.jpg" class="d-block w-100" alt="Plant 3">
           
          </div>
          <div class="carousel-item">
            <img src="img/caro1.jpg" class="d-block w-100" alt="Plant 2">
          </div>
          <div class="carousel-item">
             <img src="img/caroRose.png" class="d-block w-100" alt="Plant 1">
          </div>
          <div class="carousel-item">
            <img src="img/caro3.avif" class="d-block w-100" alt="Plant 4">
          </div>
          <div class="carousel-item">
            <img src="img/caro4.jpg" class="d-block w-100" alt="Plant 5">
          </div>
          <div class="carousel-item">
            <img src="img/caro7.jpg" class="d-block w-100" alt="Plant 5">
          </div>
          <div class="carousel-item">
            <img src="img/caro8.jpg" class="d-block w-100" alt="Plant 5">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#plantCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#plantCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
      </div>
    </div>


<!-- <div class="col-12 col-lg-12">
 <video autoplay muted loop playsinline class="w-100 h-100" style="object-fit: cover;">
        <source src="video/218870_small.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
</div>
-->

    
  </div>
</div>

   

    <!-- Category Filter Form -->
    <form method="get" action="home" class="row g-2 mb-4 " id="home">
    <div class="col-auto mt-5">
        <select name="category" id="category" class="form-select" onchange="this.form.submit()">
            <option value="">All</option>
            <option value="Medicinal" <%= "Medicinal".equals(request.getParameter("category")) ? "selected" : "" %>>Medicinal</option>
            <option value="Indoor" <%= "Indoor".equals(request.getParameter("category")) ? "selected" : "" %>>Indoor</option>
            <option value="Outdoor" <%= "Outdoor".equals(request.getParameter("category")) ? "selected" : "" %>>Outdoor</option>
            <option value="Flowering" <%= "Flowering".equals(request.getParameter("category")) ? "selected" : "" %>>Flowering</option>
        </select>
    </div>
</form>


    <!-- Plant Cards -->
    <div class="row">
        <%
            List<Plant> plants = (List<Plant>) request.getAttribute("plants");
            if (plants != null && !plants.isEmpty()) {
                for (Plant plant : plants) {
        %>
            <div class="col-md-4 col-sm-6">
                <div class="plant-card">
                <img src="<%= plant.getImage() %>" alt="Plant Image" style="width:450px;height:300px;">
                    <h5><%= plant.getName() %></h5>
                    <p>₹<%= plant.getPrice() %></p>
                    <a href="plantDetails?plantId=<%= plant.getId() %>" class="btn btn-sm btn-outline-success">View Details</a>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <div class="col-12">
                <p class="text-danger">No plants found for this category.</p>
            </div>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Wrap text in span dynamically (so you don't repeat manually)
    document.addEventListener("DOMContentLoaded", function(){
        const h2 = document.querySelector(".moving-text");
        h2.innerHTML = `<span>${h2.innerHTML}</span>`;
    });
</script>
</body>
<%@ include file="partials/footer.jsp" %>
</html>

document.getElementById('login-link').addEventListener('click', function(event) {
    event.preventDefault(); // Prevent the default anchor behavior
    console.log('Login link clicked');
    this.style.display = 'none'; // Hide the login link
    document.getElementById('login-form').classList.remove('hidden'); // Show the login form
});


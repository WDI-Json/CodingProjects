const header = document.getElementById('header')
const title = document.getElementById('title')
const excerpt = document.getElementById('excerpt')
const profile_img = document.getElementById('profile_img')
const name = document.getElementById('name')
const date = document.getElementById('date')

const animated_bgs = document.querySelectorAll('.animated-bg')
const animated_bgs_text = document.querySelectorAll('.animated-bg-text')

setTimeout(getdata, 2500)

function getdata() {
    header.innerHTML = '<img src="/Users/wutu/Desktop/JavascriptProjecten/fotos/DE BOYS.jpg" alt="" />'
    title.innerHTML = 'Lorem ipsum dolor sit amet'
    excerpt.innerHTML = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, voluptatum.'
    profile_img.innerHTML = '<img src="https://randomuser.me/api/portraits/men/45" alt="">'
    name.innerHTML = 'John Doe'
    date.innerHTML = 'Oct 08, 2020'

    animated_bgs.forEach(bg => bg.classList.remove('animated-bg'))
    animated_bgs_Text.forEach(bg => bg.classList.remove('animated-bg-text'))
}
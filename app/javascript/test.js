function tagsVisibility() {
    const buttonItems = document.querySelector('.M_FilterSelect.Items')
    const tagListItems = document.querySelector('.M_FilterSelectDropdown.Items')
    const crossItems = document.querySelector('.Q_Icon.Cross.Items')
    const buttonTech = document.querySelector('.M_FilterSelect.Tech')
    const tagListTech = document.querySelector('.M_FilterSelectDropdown.Tech')
    const crossTech = document.querySelector('.Q_Icon.Cross.Tech')
    const buttonMat = document.querySelector('.M_FilterSelect.Mat')
    const tagListMat = document.querySelector('.M_FilterSelectDropdown.Mat')
    const crossMat = document.querySelector('.Q_Icon.Cross.Mat')


    buttonItems.addEventListener('click', (e) => {
        e.stopPropagation();
        tagListItems.classList.toggle('show')
    })

    buttonTech.addEventListener('click', (e) => {
        e.stopPropagation();
        tagListTech.classList.toggle('show')
    })

    buttonMat.addEventListener('click', (e) => {
        e.stopPropagation();
        tagListMat.classList.toggle('show')
    })

    document.addEventListener( 'click', (e) => {
        const target = e.target

        const ItagList = target == tagListItems || tagListItems.contains(target)
        const ItagButton = target == buttonItems
        const ItagListShow = tagListItems.classList.contains('show')

        const TtagList = target == tagListTech || tagListTech.contains(target)
        const TtagButton = target == buttonTech
        const TtagListShow = tagListTech.classList.contains('show')

        const MtagList = target == tagListMat || tagListMat.contains(target)
        const MtagButton = target == buttonMat
        const MtagListShow = tagListMat.classList.contains('show')

        if ( ( !ItagList && !ItagButton && ItagListShow ) || ( !TtagList && !TtagButton && TtagListShow ) || ( !MtagList && !MtagButton && MtagListShow ) )  {
            tagListItems.classList.remove('show')
            tagListTech.classList.remove('show')
            tagListMat.classList.remove('show')
        }
    })
}

function addLike() {
    const like = document.querySelector('.Q_Icon.Like')
  
    like.addEventListener('click', () => {
        like.classList.toggle('active')
    })
}

function postOptionVisibility() {
    const button = document.querySelector('.Q_Icon.Options')
    const menu = document.querySelector('.M_PostOptions')
  
    button.addEventListener('click', () => {
        menu.classList.toggle('show')
    })

    document.addEventListener( 'click', (e) => {
        const target = e.target

        const menuA = target == menu || menu.contains(target)
        const buttonA = target == button
        const menuShow = menu.classList.contains('show')

        if ( !menuA && !buttonA && menuShow )  {
            menu.classList.remove('show')
        }
    })
}

function createNewPostVisibility() {
    const button = document.querySelector('.A_NavigationButton.NewPost')
    const menu = document.querySelector('.M_NavCreateNewPosts')
  
    button.addEventListener('click', () => {
        menu.classList.toggle('show')
    })

    document.addEventListener( 'click', (e) => {
        const target = e.target

        const menuA = target == menu || menu.contains(target)
        const buttonA = target == button
        const menuShow = menu.classList.contains('show')

        if ( !menuA && !buttonA && menuShow )  {
            menu.classList.remove('show')
        }
    })
}

function mobileMenuVisibility() {
    const button = document.querySelector('.Q_Icon.MenuMob')
    const menu = document.querySelector('.M_MobileMenu')
  
    button.addEventListener('click', () => {
        menu.classList.toggle('show')
    })

    document.addEventListener( 'click', (e) => {
        const target = e.target

        const menuA = target == menu || menu.contains(target)
        const buttonA = target == button
        const menuShow = menu.classList.contains('show')

        if ( !menuA && !buttonA && menuShow )  {
            menu.classList.remove('show')
        }
    })
}

document.addEventListener('DOMContentLoaded', () => {
    if (document.body.classList.contains('tutorials_page')) {
        tagsVisibility()
        addLike()
    }

    if (document.body.classList.contains('ideas_page')) {
        addLike()
    }

    if (document.body.classList.contains('post_page')) {
        postOptionVisibility()
        addLike()
    }

    mobileMenuVisibility()
    createNewPostVisibility()
  })
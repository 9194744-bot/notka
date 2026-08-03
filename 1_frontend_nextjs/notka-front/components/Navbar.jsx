import Link from "next/link";
import Image from "next/image";
import { useRouter } from "next/router";
import Bar from '../assets/images/bar.png';
import { useEffect, useState } from "react";
import Bar1 from '../assets/images/bar1.png';
import Logo from '../assets/images/logo.png';
import UZ from '../public/locales/uz/common.json';
import RU from '../public/locales/ru/common.json';
import EN from '../public/locales/en/common.json';
import { CloseRounded, ExpandMore } from "@mui/icons-material";

const Navbar = () => {

    const router = useRouter();
    const { id } = router.query;

    // scroll animation

    const [scroll, setScroll] = useState(false)

    useEffect(() => {
        window.addEventListener("scroll", () => {
            setScroll(window.scrollY > 10 ? true : false)
        })
    }, [])

    // navbar menu or navbar-nav

    const [showMenu, setShowMenu] = useState(false)

    // language

    const [language, setLanguage] = useState(false);

    const t = router.locale == "uz" ? UZ : router.locale == "ru" ? RU : EN

    function changeLocaleLang(item) {
        const { pathname, asPath, query } = router
        router.push({ pathname, query }, asPath, { locale: item })
        setLanguage(!language)
        setShowMenu(false)
    }

    return (
        <div className={`Navbar ${!id ? scroll && "scroll-navbar" : scroll && "scroll-navbar-light"} ${id && "light-navbar"}`}>
            <nav className="navbar">
                <Link href="/" className="logo" onClick={() => window.scrollTo(0, 0)}>
                    <Image src={Logo} priority={true} alt="logo" className="img" />
                </Link>
                <div className="d-flex align-items-center">
                    <div className="stick">|</div>
                    <div className="menu" onClick={() => setShowMenu(!showMenu)}>
                        <Image src={id ? Bar1 : Bar} priority={true} alt="bar" className="menu-bar" />
                        <div className="menu-title">MENU</div>
                    </div>
                </div>
                <ul className={`navbar-nav ${showMenu && "show-menu"}`}>
                    <li className="nav-item">
                        <Link href="/#categories" scroll={false} className="link" onClick={() => setShowMenu(!showMenu)}>{t.category}</Link>
                    </li>
                    <li className="nav-item">
                        <Link href="/#topproduct" scroll={false} className="link" onClick={() => setShowMenu(!showMenu)}>{t["top product"]}</Link>
                    </li>
                    <li className="nav-item">
                        <Link href="/#about" scroll={false} className="link" onClick={() => setShowMenu(!showMenu)}>{t.about}</Link>
                    </li>
                    <li className="nav-item">
                        <Link href="/#news" scroll={false} className="link" onClick={() => setShowMenu(!showMenu)}>{t.news}</Link>
                    </li>
                    <li className="nav-item">
                        <Link href="/#tour" scroll={false} className="link" onClick={() => setShowMenu(!showMenu)}>{t[360]}</Link>
                    </li>
                    <li className="nav-item">
                        <Link href="/#contacts" scroll={false} className="link" onClick={() => setShowMenu(!showMenu)}>{t.contact}</Link>
                    </li>
                    <li className="nav-item language">
                        <div className="lang-title" onClick={() => setLanguage(!language)}>{router.locale.toUpperCase()} <ExpandMore className="icon" /></div>
                        {language &&
                            <div className="lang-menu">
                                <div className="lang-items" onClick={() => changeLocaleLang("uz")}>UZ</div>
                                <div className="lang-items" onClick={() => changeLocaleLang("ru")}>RU</div>
                                <div className="lang-items" onClick={() => changeLocaleLang("en")}>EN</div>
                            </div>
                        }
                        {language &&
                            <div className="contrast-0" onClick={() => setLanguage(!language)}></div>
                        }
                    </li>
                    <CloseRounded className="close-icon" onClick={() => setShowMenu(!showMenu)} />
                </ul>
                {showMenu &&
                    <div className="contrast" onClick={() => setShowMenu(!showMenu)}></div>
                }
            </nav>
        </div>
    );
};

export default Navbar;
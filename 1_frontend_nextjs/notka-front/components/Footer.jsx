import Link from "next/link";
import Image from "next/image";
import { useRouter } from "next/router";
import Logo from '../assets/images/logo.png';
import UZ from '../public/locales/uz/common.json';
import RU from '../public/locales/ru/common.json';
import EN from '../public/locales/en/common.json';

function Footer() {

    const router = useRouter();

    // i18next

    const t = router.locale == "uz" ? UZ : router.locale == "ru" ? RU : EN

    return (
        <div className="Footer parent">
            <div className="top-footer">
                <div className="col-5 tool res-main">
                    <Link href='/' onClick={() => window.scrollTo(0, 0)}>
                        <Image src={Logo} priority alt="logo" className="logo" width={1000} height={500} />
                    </Link>
                    <p className="text">{t.footerdesc}</p>
                    <div className="icons">
                        <a href="#" className="icon">
                            <i className="fa-brands fa-facebook-f"></i>
                        </a>
                        <a href="#" className="icon">
                            <i className="fa-brands fa-telegram"></i>
                        </a>
                        <a href="https://instagram.com/notka.uz?igshid=ZDdkNTZiNTM=" className="icon">
                            <i className="fa-brands fa-instagram"></i>
                        </a>
                    </div>
                </div>
                <div className="col-7 tool links">
                    <div className="col-4 res-logo">
                        <Link href='/' onClick={() => window.scrollTo(0, 0)}>
                            <Image src={Logo} priority alt="logo" className="logo" width={1000} height={500} />
                        </Link>
                        <p className="text">{t.footerdesc}</p>
                        <div className="icons">
                            <a href="#" target="blank" className="icon">
                                <i className="fa-brands fa-facebook-f"></i>
                            </a>
                            <a href="#" target="blank" className="icon">
                                <i className="fa-brands fa-telegram"></i>
                            </a>
                            <a href="https://instagram.com/notka.uz?igshid=ZDdkNTZiNTM=" target="blank" className="icon">
                                <i className="fa-brands fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <ul className="col-4">
                        <li className="title-li">{t.foot1}</li>
                        <li>
                            <Link href="/#about" className="link" scroll={false}>{t.foot2}</Link>
                        </li>
                        <li>
                            <Link href="/#tour" className="link" scroll={false}>{t.foot3}</Link>
                        </li>
                        <li>
                            <Link href="/#infografics" className="link" scroll={false}>{t.foot4}</Link>
                        </li>
                        <li>
                            <Link href="/#news" className="link" scroll={false}>{t.foot5}</Link>
                        </li>
                    </ul>
                    <ul className="col-4">
                        <li className="title-li">{t.foot6}</li>
                        <li>
                            <Link href="/#categories" className="link" scroll={false}>{t.foot7}</Link>
                        </li>
                        <li>
                            <Link href="/#topproduct" className="link" scroll={false}>{t.foot8}</Link>
                        </li>
                        <li>
                            <Link href="/#adv" className="link" scroll={false}>{t.foot9}</Link>
                        </li>
                        <li>
                            <Link href="/#gallery" className="link" scroll={false}>{t.foot10}</Link>
                        </li>
                    </ul>
                    <ul className="col-4">
                        <li className="title-li">{t.foot11}</li>
                        <li>
                            <a href="https://www.google.com/maps?q=41.293376,69.171515&ll=41.293376,69.171515&z=16" className="link">{t.foot12}</a>
                        </li>
                        <li>
                            <a href="tel:+99871-217-40-00" className="link">+998 71 217 40 00</a>
                        </li>
                        <li>
                            <a href="tel:+99890-943-38-38" className="link">+998 90 943-38-38</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div className="bottom-footer">
                {t.foot13} © NOTKA | {t.foot14} <a href="https://www.instagram.com/abba.uz/" target="blank" className="brand">abba marketing</a> - {t.foot15} <a href="https://www.instagram.com/abba.uz/" target="blank" className="brand">ABBA</a>
            </div>
        </div>
    )
};

export default Footer;
import Image from "next/image";
import { useState } from "react";
import Slider from "react-slick";
import { dataLenta } from "./api/Api";
import Modal from "../components/Modal";
import { useTranslation } from "next-i18next";
import Contacts from "../components/Contacts";
import Side1 from '../assets/images/category1.png';
import Side2 from '../assets/images/category2.png';
import { serverSideTranslations } from 'next-i18next/serverSideTranslations';

export async function getStaticProps({ locale }) {
    return {
        props: {
            ...(await serverSideTranslations(locale, ["common"]))
        },
    };
}

function About() {

    const settings = {
        speed: 5000,
        dots: false,
        autoplay: true,
        infinite: true,
        slidesToShow: 7,
        autoplaySpeed: 0,
        slidesToScroll: 1,
        cssEase: "linear",
        pauseOnHover: false,
        responsive: [
            {
                breakpoint: 767,
                settings: {
                    slidesToShow: 5,
                }
            },
            {
                breakpoint: 500,
                settings: {
                    slidesToShow: 4,
                }
            },
        ]
    };

    // modal

    const [showModal, setShowModal] = useState(false)

    function changeModal() {
        setShowModal(!showModal)
    }

    // i18next

    const { t } = useTranslation();

    return (
        <>
            <div className="About parent">
                <Image src={Side1} priority alt="image" className="side-img1" width={1000} height={500} />
                <Image src={Side2} priority alt="image" className="side-img2" width={1000} height={500} />
                <div className="wrapper">
                    <h1 className="title">{t("abt")}</h1>
                    <p className="desc">{t("abouttxt1")}</p>
                    <div className="video col-10">
                        <iframe src="https://www.youtube.com/embed/0R1tRhO_jLE" title="YouTube video player" frameBorder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowFullScreen></iframe>
                    </div>
                    <p className="desc">{t("abouttxt2")}</p>
                </div>
                <Slider {...settings} className="lenta">
                    {dataLenta.map((data) => (
                        <div key={data.id} className="partner">
                            <Image src={data.image} priority alt="image" className="lenta-img" width={1000} height={500} />
                        </div>
                    ))}
                </Slider>
            </div>
            <Contacts changeModal={changeModal} />
            {showModal &&
                <Modal changeModal={changeModal} />
            }
        </>
    )
};

export default About;
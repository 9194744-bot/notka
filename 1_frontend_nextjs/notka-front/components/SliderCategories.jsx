import Link from "next/link";
import Image from "next/image";
import { useState } from "react";
import Slider from "react-slick";
import { useQuery } from "react-query";
import { useRouter } from "next/router";
import { Skeleton } from "@mui/material";
import { useTranslation } from "next-i18next";
import BackImg from '../assets/images/slide-back.png';
import TextBack from '../assets/images/text-back.png';
import { fetchCategoriesApi } from "../pages/api/Api";

function SliderCategories() {

    const router = useRouter();
    const [slideIndex, setSlideIndex] = useState(0);

    const settings = {
        speed: 2500,
        autoplay: true,
        infinite: true,
        slidesToShow: 1,
        centerMode: true,
        cssEase: "linear",
        centerPadding: "22%",
        autoplaySpeed: 6000,
        className: "center",
        pauseOnHover: false,
        beforeChange: (current, next) => setSlideIndex(next),
        responsive: [
            {
                breakpoint: 900,
                settings: {
                    centerPadding: "19%",
                }
            },
            {
                breakpoint: 600,
                settings: {
                    centerPadding: "10%",
                }
            },
            {
                breakpoint: 400,
                settings: {
                    centerPadding: "5%",
                }
            }
        ]
    };

    // i18next

    const { t } = useTranslation();

    // data of header-slider

    const { isLoading, data } = useQuery('header-slider', fetchCategoriesApi);

    const dataCategories = data?.data;

    // skeleton loading

    if (isLoading) {
        return (
            <div className="SliderCategories parent">
                <Slider {...settings} className="carousel">
                    {[1, 2, 3, 4, 5].map((data, index) => (
                        <div key={index} className="category">
                            <div className={`body bg-white`}>
                                <div className="col-8 tools">
                                    <div className="texts">
                                        <p className="slogan">
                                            <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="100%" />
                                        </p>
                                        <h3 className="name">
                                            <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="100%" />
                                        </h3>
                                    </div>
                                    <div className="links col-12">
                                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="50%" />
                                    </div>
                                </div>
                                <div className="col-5 imgs">
                                    <Skeleton variant='rounded' sx={{ bgcolor: 'grey.700' }} width="80%" height="80%" />
                                </div>
                            </div>
                        </div>
                    ))}
                </Slider>
            </div>
        )
    }

    return (
        <div className="SliderCategories parent">
            <Slider {...settings} className="carousel">
                {dataCategories.slice(0, 4).map((data) => (
                    <div key={data.id} className="category">
                        <Link href={`/category/${data.id}`} legacyBehavior>
                            <div className={`body ${dataCategories.indexOf(data) == slideIndex && "active-body"}`}>
                                <div className="col-8 tools">
                                    <Image src={BackImg} priority alt="image" className="back-img" width={1000} height={500} />
                                    <div className="texts">
                                        <h3 className="name">{router.locale == "uz" ? data.title_uz : router.locale == "ru" ? data.title_ru : data.title_en}</h3>
                                        <p className="slogan">{t("slide-slogan")}</p>
                                        <Image src={TextBack} priority alt="image" className="back-img" width={1000} height={500} />
                                    </div>
                                    <div className="links col-12">
                                        <Link href={`/category/${data.id}`} className="explore">{t("slide-btn")}</Link>
                                    </div>
                                </div>
                                <div className="col-5 imgs">
                                    <Image loader={() => `${data.slider_photo ? data.slider_photo : ""}?w=500&q=500`} src={data.slider_photo ? data.slider_photo : ""} priority alt="image" className="img" width={1000} height={500} />
                                </div>
                            </div>
                        </Link>
                    </div>
                ))}
            </Slider>
        </div>
    )
};

export default SliderCategories;
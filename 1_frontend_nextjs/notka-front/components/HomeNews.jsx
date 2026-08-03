import Link from "next/link";
import Image from "next/image";
import Slider from "react-slick";
import { useQuery } from "react-query";
import { useRouter } from "next/router";
import { Skeleton } from "@mui/material";
import { useTranslation } from "next-i18next";
import { fetchNewsApi } from "../pages/api/Api";
import { ChevronRight } from "@mui/icons-material";
import BackImg from '../assets/images/news-back.png';

function HomeNews({ lang }) {

    const router = useRouter();

    const settings = {
        speed: 2000,
        dots: false,
        // autoplay: true,
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 2,
        cssEase: "linear",
        autoplaySpeed: 4000,
        pauseOnHover: false,
        responsive: [
            {
                breakpoint: 1000,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            }
        ]
    };

    // i18next

    const { t } = useTranslation();

    // data of news

    const { isLoading, data } = useQuery('news', fetchNewsApi);

    // skeleton loading

    if (isLoading) {
        return (
            <div className="HomeNews parent" id="news">
                <div className="wrapper">
                    <Slider {...settings} className="carousel">
                        {[1, 2, 3, 4, 5, 6].map((data, index) => (
                            <div key={index} className="new-card">
                                <div className="body">
                                    <Skeleton variant='rectangle' sx={{ bgcolor: 'grey.600' }} width="100%" height="10vw" />
                                    <div className="texts">
                                        <h1 className="name">
                                            <Skeleton variant='text' sx={{ bgcolor: 'grey.600' }} width="100%" />
                                        </h1>
                                        <p className="desc">
                                            <Skeleton variant='text' sx={{ bgcolor: 'grey.600' }} width="100%" />
                                            <Skeleton variant='text' sx={{ bgcolor: 'grey.600' }} width="80%" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </Slider>
                </div>
            </div>
        )
    }

    return (
        <div className="HomeNews parent" id="news">
            <Image src={BackImg} priority alt="image" className="back-img" width={1000} height={500} />
            <div className="wrapper">
                <Slider {...settings} className="carousel">
                    {data?.data.map((item) => (
                        <div key={item.id} className="new-card">
                            <Link href={`/news/${item.id}`} className="body">
                                <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="new-img" width={1000} height={500} />
                                <div className="texts">
                                    <h3 className="name">{router.locale == "uz" ? item.title_uz.slice(0, 17) : router.locale == "ru" ? item.title_ru.slice(0, 17) : item.title_en.slice(0, 17)}...</h3>
                                    <p className="desc">{router.locale == "uz" ? item.description_uz.slice(0, 46) : router.locale == "ru" ? item.description_ru.slice(0, 46) : item.description_en.slice(0, 46)}...</p>
                                </div>
                            </Link>
                        </div>
                    ))}
                </Slider>
                <div className="bottom-texts col-12">
                    <div className="col-5 btns res">
                        {t("batafsil")}
                        <Link href="/categories" className="explore"><ChevronRight /></Link>
                    </div>
                    <div className="col-7 titles">
                        <h1 className="title">{t("news")}</h1>
                        <p className="text">{t("newsdesc")}</p>
                    </div>
                    <div className="col-5 btns res1">
                        {t("batafsil")}
                        <Link href="/news/0" className="explore"><ChevronRight /></Link>
                    </div>
                </div>
            </div>
        </div>
    )
};

export default HomeNews;
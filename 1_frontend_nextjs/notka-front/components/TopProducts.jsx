import Link from "next/link";
import Image from "next/image";
import Slider from "react-slick";
import { useQuery } from "react-query";
import { useRouter } from "next/router";
import { Skeleton } from "@mui/material";
import { useTranslation } from "next-i18next";
import { ChevronRight } from "@mui/icons-material";
import { fetchProductsApi } from "../pages/api/Api";

function TopProducts() {

    const router = useRouter();

    const settings = {
        speed: 2500,
        dots: false,
        autoplay: true,
        infinite: true,
        slidesToShow: 1,
        cssEase: "linear",
        autoplaySpeed: 6000,
        pauseOnHover: false,
    };

    // i18next

    const { t } = useTranslation();

    // data of products

    const { isLoading, data } = useQuery('products', fetchProductsApi);

    // skeleton loading

    if (isLoading) {
        return (
            <div className="TopProducts parent">
                <div className="wrapper">
                    <h1 className="title d-flex justify-content-center">
                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="50%" />
                    </h1>
                    <div className="carousel">
                        <div className="product col-12">
                            <div className="col-6 imgs">
                                <Skeleton variant='rounded' sx={{ bgcolor: 'grey.700' }} width="70%" height="20vw" />
                            </div>
                            <div className="col-6 texts">
                                <h1 className="name">
                                    <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="100%" />
                                    <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="50%" />
                                </h1>
                                <div className="top-type col-12">
                                    <Skeleton variant='rounded' sx={{ bgcolor: 'grey.700' }} width="80%" height="5vw" />
                                </div>
                                <div className="desc">
                                    <div className="keys col-12">
                                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="70%" />
                                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="70%" />
                                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="70%" />
                                    </div>
                                </div>
                                <div className="btns">
                                    <Skeleton variant='rounded' sx={{ bgcolor: 'grey.700' }} width="50%" height="3vw" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    return (
        <div className="TopProducts parent" id="topproduct">
            <div className="wrapper">
                <div className="title">{t("top product")}</div>
                <Slider {...settings} className="carousel">
                    {data?.data.filter((c) => c.is_top === true).map((item) => (
                        <div key={item.id} className="product col-12">
                            <div className="col-6 imgs">
                                <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="img" width={500} height={500} />
                            </div>
                            <div className="col-6 texts">
                                <h1 className="name">{router.locale == "uz" ? item.name_uz : router.locale == "ru" ? item.name_ru : item.name_en}</h1>
                                <div className="top-type col-12">
                                    <div className="body">
                                        {/* <div className="circle">TOP</div> */}
                                        <p>{router.locale == "uz" ? item.subtitle_uz : router.locale == "ru" ? item.subtitle_ru : item.subtitle_en}</p>
                                    </div>
                                </div>
                                <div className="desc">
                                    <div className="keys">
                                        <div className="key">{t("weight")}:</div>
                                        <div className="key">{t("deadline")}:</div>
                                        <div className="key">{t("uglevod")}:</div>
                                    </div>
                                    <div className="values">
                                        <div className="value">{item.weight} {t("kg")}</div>
                                        <div className="value">{item.artikul} {t("oy")}</div>
                                        <div className="value">{item.carbohydrates} {t("g")}</div>
                                    </div>
                                </div>
                                <div className="btns">
                                    {t("batafsil")}
                                    <Link href={`/product/${item.id}`} className="explore"><ChevronRight /></Link>
                                </div>
                            </div>
                        </div>
                    ))}
                </Slider>
            </div >
        </div >
    )
};

export default TopProducts;
import Link from "next/link";
import Image from "next/image";
import { useQuery } from "react-query";
import { useRouter } from "next/router";
import { Skeleton } from "@mui/material";
import { useTranslation } from "next-i18next";
import Hover1 from '../assets/images/hover1.png';
import Hover2 from '../assets/images/hover2.png';
import Hover3 from '../assets/images/hover3.png';
import { ChevronRight } from "@mui/icons-material";
import { fetchCategoriesApi } from "../pages/api/Api";

function HomeCategories() {

    const router = useRouter();

    // i18next

    const { t } = useTranslation();

    // data of categories

    const { isLoading, data } = useQuery('categories', fetchCategoriesApi);

    // skeleton loading

    if (isLoading) {
        return (
            <div className="HomeCategories parent" id="categories">
                <div className="wrapper">
                    <div className="cards">
                        {[1, 2, 3, 4, 5, 6].map((data, index) => (
                            <div key={index} className="category col-4">
                                <div className="body">
                                    <Skeleton variant='rounded' sx={{ bgcolor: 'grey.700' }} width="100%" height="10vw" className="img" />
                                    <h1 className="name col-12">
                                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="100%" />
                                        <Skeleton variant='text' sx={{ bgcolor: 'grey.700' }} width="50%" />
                                    </h1>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        )
    }

    return (
        <div className="HomeCategories parent" id="categories">
            <div className="wrapper">
                <div className="cards">
                    {data?.data.map((item) => (
                        <div key={item.id} className="category col-4">
                            <Image src={Hover1} priority alt="image" className="hover1" width={1000} height={500} />
                            <Image src={Hover2} priority alt="image" className="hover2" width={1000} height={500} />
                            <Image src={Hover3} priority alt="image" className="hover3" width={1000} height={500} />
                            <Link legacyBehavior href={`/category/${item.id}`}>
                                <a className={`body`} style={{ backgroundColor: `${item.color}` }}>
                                    <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="img" width={1000} height={500} />
                                    <h3 className="name">{router.locale == "uz" ? item.title_uz : router.locale == "ru" ? item.title_ru : item.title_en}</h3>
                                </a>
                            </Link>
                        </div>
                    ))}
                </div>
                <div className="bottom-texts col-12">
                    <div className="col-5 btns res">
                        {t("sweets")}
                        <Link href="/categories" className="explore"><ChevronRight /></Link>
                    </div>
                    <div className="col-7 titles">
                        <h1 className="title text-left">{t("products")}</h1>
                        <p className="text">{t("prodesc")}</p>
                    </div>
                    <div className="col-5 btns res1">
                        {t("sweets")}
                        <Link href="/category/0" className="explore"><ChevronRight /></Link>
                    </div>
                </div>
            </div>
        </div>
    )
};

export default HomeCategories
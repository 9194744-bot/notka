import Link from "next/link";
import Image from "next/image";
import { useQuery } from "react-query";
import { useRouter } from "next/router";
import { fetchNewsApi } from "../../api/Api";
import { ChevronRight } from "@mui/icons-material";
import UZ from '../../../public/locales/uz/common.json';
import RU from '../../../public/locales/ru/common.json';
import EN from '../../../public/locales/en/common.json';

function News() {

    const router = useRouter();
    const { id } = router.query;

    // i18next

    const t = router.locale == "uz" ? UZ : router.locale == "ru" ? RU : EN

    // api data

    const { data } = useQuery('news', fetchNewsApi);

    return (
        <div className="News parent">
            <div className="wrapper">
                {id != 0 &&
                    <h1 className="title">{t.news}</h1>
                }
                {id != 0 &&
                    <div className="links">
                        <Link legacyBehavior href="/">
                            <a className="link">{t.home}</a>
                        </Link>
                        <ChevronRight className="chevron" />
                        <a href="#" className="link">{t.news}</a>
                    </div>
                }
                {data?.data.filter((c) => c.id == id).map((item) => (
                    <div key={item.id} className="body">
                        <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="new-img col-12" width={1000} height={500} />
                        <h3 className="name">{router.locale == "uz" ? item.title_uz : router.locale == "ru" ? item.title_ru : item.title_en}</h3>
                        <p className="desc">{router.locale == "uz" ? item.description_uz : router.locale == "ru" ? item.description_ru : item.description_en}</p>
                    </div>
                ))}
                {id != 0 ?
                    <h3 className="other-title">{t.news1}</h3> :
                    <h3 className="other-title mt-0">{t.news2}</h3>
                }
                <div className="other-news">
                    {data?.data.filter((c) => c.id != id).map((item) => (
                        <div key={item.id} className="new col-3">
                            <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="new-img" width={1000} height={500} />
                            <h3 className="name">{router.locale == "uz" ? item.title_uz : router.locale == "ru" ? item.title_ru : item.title_en}</h3>
                            <p className="desc">{router.locale == "uz" ? item.description_uz : router.locale == "ru" ? item.description_ru : item.description_en}</p>
                            <Link legacyBehavior href={`/news/${item.id}`}>
                                <a className="explore">{t.batafsil}</a>
                            </Link>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    )
};

export default News;
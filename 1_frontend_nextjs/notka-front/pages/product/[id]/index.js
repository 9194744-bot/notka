import Link from "next/link";
import Image from "next/image";
import { useQuery } from "react-query";
import { useRouter } from "next/router";
import { fetchProductsApi } from "../../api/Api";
import UZ from '../../../public/locales/uz/common.json';
import RU from '../../../public/locales/ru/common.json';
import EN from '../../../public/locales/en/common.json';

function Product() {

    const router = useRouter();
    const { id } = router.query;

    // i18next

    const t = router.locale == "uz" ? UZ : router.locale == "ru" ? RU : EN

    // api data

    const { data } = useQuery('products', fetchProductsApi);

    return (
        <div className="Product parent">
            <div className="wrapper">
                {data?.data.filter((c) => c.id == id).map((item) => (
                    <div key={item.id} className="col-12 prods">
                        <div className="product col-5">
                            <h1 className="title">{router.locale == "uz" ? item.name_uz : router.locale == "ru" ? item.name_ru : item.name_en}</h1>
                            <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="res-img" width={1000} height={500} />
                            <div className="composition col-12">
                                <h3 className="value-title">{t.prod1}</h3>
                                <div className="col-12 cards">
                                    <div className="value col-4">
                                        <p>{t.calory}</p>
                                        <div>{item.calories} {t.kkal}</div>
                                    </div>
                                    <div className="value col-4">
                                        <p>{t.uglevod}</p>
                                        <div>{item.carbohydrates} {t.g}</div>
                                    </div>
                                    <div className="value col-4">
                                        <p>{t.fat}</p>
                                        <div>{item.fats} {t.g}</div>
                                    </div>
                                </div>
                            </div>
                            <div className="desc1 col-12">
                                <h3 className="value-title">{t.prod2}</h3>
                                <div className="col-12 cards">
                                    <div className="keys">
                                        <div className="key">{t.country}:</div>
                                        <div className="key">{t.deadline}:</div>
                                        <div className="key">{t.weight}:</div>
                                    </div>
                                    <div className="values">
                                        <div className="value">
                                            {t.country1}
                                        </div>
                                        <div className="value">
                                            {item.artikul} {t.oy}
                                        </div>
                                        <div className="value">
                                            {item.weight} {t.kg}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-7 imgs">
                            <Image loader={() => `${item.photo ? item.photo : ""}?w=500&q=500`} src={item.photo ? item.photo : ""} priority alt="image" className="img" width={1000} height={500} />
                            {/* <div className="col-12">
                                <div className="gradient"></div>
                            </div> */}
                        </div>
                        <div className="col-12 desc2">
                            <h3 className="value-title">{t.prod3}</h3>
                            <div className="cards">
                                {router.locale == "uz" ? item.description_uz : router.locale == "ru" ? item.description_ru : item.description_en}
                            </div>
                        </div>
                        {data?.data.filter((k) => k.category == item.category).length > 1 &&
                            <div className="other-products col-12">
                                <h3 className="value-title">{t.other}</h3>
                                <div className="cards">
                                    {data?.data.filter((k) => k.category == item.category && k.id != id).map((post) => (
                                        <div key={post.id} className="product1">
                                            <div className="body">
                                                <div className="imgs1">
                                                    <Image loader={() => `${post.photo}?w=500&q=500`} src={post.photo} priority alt="image" className="img" width={500} height={500} />
                                                </div>
                                                <p className="name">{router.locale == "uz" ? post.name_uz : router.locale == "ru" ? post.name_ru : post.name_en}</p>
                                                <Link legacyBehavior href={`/product/${post.id}`}>
                                                    <a className="explore">{t.batafsil}</a>
                                                </Link>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        }
                    </div>
                ))}
            </div>
        </div >
    )
};

export default Product;
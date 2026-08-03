import Slider from 'react-slick';
import CountUp from 'react-countup';
import { useRouter } from 'next/router';
import { useEffect, useRef, useState } from 'react';

function Infografics({ lang }) {

    const router = useRouter();

    const [number1, setNumber1] = useState(0);
    const [number2, setNumber2] = useState(0);
    const [number3, setNumber3] = useState(0);
    const [number4, setNumber4] = useState(0);

    const observer = useRef(null);

    useEffect(() => {
        window.addEventListener("scroll", () => {
            if (observer.current?.offsetTop ? window.scrollY > observer.current.offsetTop - window.innerHeight : window.scrollY > 100) {
                setNumber1(100);
                setNumber2(5);
                setNumber3(150);
                setNumber4(18);
            } else if (observer.current?.offsetTop ? window.scrollY < observer.current.offsetTop - window.innerHeight : window.scrollY < 100) {
                setNumber1(0);
                setNumber2(0);
                setNumber3(0);
                setNumber4(0);
            }
        })
    }, []);

    let dataNumbers = [
        { id: 0, number: number1, text_uz: "xodimlar soni", text_en: "workforce", text_ru: "рабочая сила", description_uz: "100 dan ortiq ishchi kuchi tufayli bozorga sifatli va Jahon standardlariga to’la javob beradigan mahsulotlat yetkazib bermoqdamiz", description_en: "Thanks to more than 100 employees, we supply the market with high-quality products that fully meet world standards", description_ru: "Благодаря более чем 100 сотрудникам мы поставляем на рынок качественную продукцию, полностью отвечающую мировым стандартам." },
        { id: 1, number: number2, text_uz: "xorijiy davlatga eksport", text_en: "Export to foreign countries", text_ru: "Экспорт в зарубежных стран", description_uz: "5 yildan ortiq vaqt davomida Jahon mamalakatlaridagi hamkorlarimizga mahsulotlatlarini yetkazib berishda yetakchilik qilib kelmoqdamiz", description_en: "For more than 5 years, we have been leading the supply of  products to our partners in the world", description_ru: "Уже более 5 лет мы лидируем по поставкам  продукции нашим партнерам по всему миру." },
        { id: 2, number: number3, text_uz: "tonna (oylik ishlab chiqarish hajmi)", text_en: "tons (monthly production volume)", text_ru: "тонн (месячный объем производства)", description_uz: "Oylik ishlab chiqarish hajmi bugungi kunda 150 tonnani tashkil qiladi", description_en: "Today, the monthly production volume is 150 tons", description_ru: "На сегодняшний день месячный объем производства составляет 150 тонн." },
        { id: 3, number: number4, text_uz: "yillik tajriba", text_en: "years of experience", text_ru: "лет опыта", description_uz: "Sohada 18 yillik tajriba va professional ishchi xodimlar tufayli shu vaqtga qadar hamkor va mijozlarimizni mamnun qilib kelmoqdamiz", description_en: "Thanks to 18 years of experience in the field and professional employees, we have been satisfying our partners and customers until now", description_ru: "Обладая 18-летним опытом работы в этой области и профессиональным персоналом, мы по-прежнему удовлетворяем наших партнеров и клиентов." }
    ];

    const [activeId, setActiveId] = useState(0);

    const settings = {
        dots: true,
        infinite: true,
        autoplay: true,
        slidesToShow: 1,
        speed: 2000,
        pauseOnHover: false,
        slidesToScroll: 1,
        autoplaySpeed: 6000,
        cssEase: "linear",
        beforeChange: (current, next) => setActiveId(next),
    };

    return (
        <div className="Infografics parent" id='infografics' ref={observer}>
            <div className="wrapper">
                <div className="rectangle"></div>
                <div className="numbers">
                    {dataNumbers.map((data) => (
                        <div key={data.id} className="number col-3">
                            <div className="body" onClick={() => setActiveId(data.id)}>
                                <h1 className={`count ${activeId == data.id && "active"}`}>
                                    <CountUp start={0} end={data.number} duration={3} />+
                                </h1>
                                <p className={`text ${data.id != activeId && "d-none"}`}>{router.locale == "uz" ? data.text_uz : router.locale == "ru" ? data.text_ru : data.text_en}</p>
                            </div>
                        </div>
                    ))}
                </div>
                <Slider {...settings} className='carousel'>
                    {dataNumbers.map((data) => (
                        <p key={data.id} className="desc">{router.locale == "uz" ? data.description_uz : router.locale == "ru" ? data.description_ru : data.description_en}</p>
                    ))}
                </Slider>
            </div>
        </div>
    )
};

export default Infografics;
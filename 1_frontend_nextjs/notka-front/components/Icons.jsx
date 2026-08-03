import Image from 'next/image';
import { useTranslation } from "next-i18next";
import Icon1 from '../assets/images/icon1.png';
import Icon2 from '../assets/images/icon2.png';
import Icon3 from '../assets/images/icon3.png';

function Icons() {

    // i18next

    const { t } = useTranslation();

    return (
        <div className="Icons parent" id='adv'>
            <div className="wrapper">
                <div className="col-4 icon">
                    <div className="body">
                        <div className="img">
                            <Image src={Icon1} priority alt="image" className="icon-img" width={1000} height={500} />
                        </div>
                        <div className="texts">
                            <h1 className="name">{t("utp1")}</h1>
                            <p className="desc">{t("utptxt1")}</p>
                        </div>
                    </div>
                </div>
                <div className="col-4 icon">
                    <div className="body">
                        <div className="img">
                            <Image src={Icon2} priority alt="image" className="icon-img" width={1000} height={500} />
                        </div>
                        <div className="texts">
                            <h1 className="name">{t("utp2")}</h1>
                            <p className="desc">{t("utptxt2")}</p>
                        </div>
                    </div>
                </div>
                <div className="col-4 icon">
                    <div className="body">
                        <div className="img">
                            <Image src={Icon3} priority alt="image" className="icon-img eye" width={1000} height={500} />
                        </div>
                        <div className="texts">
                            <h1 className="name">{t("utp3")}</h1>
                            <p className="desc">{t("utptxt3")}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
};

export default Icons;
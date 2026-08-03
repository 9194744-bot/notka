import Image from "next/image";
import { useTranslation } from "next-i18next";
import Degree from '../assets/images/degree.png';
import BackImg from '../assets/images/showroom.png';

function ShowRoom() {

    // i18next

    const { t } = useTranslation();

    return (
        <div className="ShowRoom parent" id="tour">
            <Image src={BackImg} priority alt="image" className="back-img" width={1000} height={500} />
            <div className="circle">
                <Image src={Degree} priority alt="image" className="degree" width={1000} height={500} />
                <div>
                    {t("tour")}
                </div>
            </div>
        </div>
    )
};

export default ShowRoom;
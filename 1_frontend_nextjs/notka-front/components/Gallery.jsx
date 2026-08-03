import Image from 'next/image';
import Slider from 'react-slick';
import { useQuery } from 'react-query';
import { fetchGalleriesApi } from '../pages/api/Api';

function Gallery() {

    const settings = {
        speed: 2000,
        dots: false,
        autoplay: true,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        cssEase: "linear",
        autoplaySpeed: 6000,
        pauseOnHover: false,
    };

    // data of gallery

    const { isLoading, data } = useQuery('gallery', fetchGalleriesApi);

    return (
        <div className="Gallery parent" id='gallery'>
            <Slider {...settings} className='carousel'>
                {data?.data.map((item) => (
                    <div key={item.id} className="imgs">
                        <Image loader={() => `${item.photo}?w=1500&q=1000`} src={item.photo} priority alt="image" className="gallery-img" width={1500} height={1000} />
                    </div>
                ))}
            </Slider>
        </div>
    )
};

export default Gallery;
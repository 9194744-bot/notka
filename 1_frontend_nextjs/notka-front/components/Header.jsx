import Image from "next/image";
import { useRef, useState } from "react";
import BackImg from '../assets/images/header.jpg';
import { VolumeUpRounded, VolumeOffRounded, PlayArrowRounded, PauseRounded } from '@mui/icons-material';

function Header() {

    const video = useRef();
    const [play, setPlay] = useState(true);
    const [volume, setVolume] = useState(true);

    function playVideo() {
        setPlay(!play)
        video.current.play()
    };

    function pauseVideo() {
        setPlay(!play)
        video.current.pause()
    };

    return (
        <div className="Header">
            {/* <Image src={BackImg} priority alt="img" className="back-img" width={1000} height={500} /> */}
            <video autoPlay playsInline loop muted={volume} ref={video} src="../video.mp4" typeof="video/mp4" />
            <div className="side-buttons">
                <div className="volume" onClick={() => setVolume(!volume)}>
                    {volume ?
                        <VolumeOffRounded className="icon" /> :
                        <VolumeUpRounded className="icon" />
                    }
                </div>
                <div className="play" onClick={() => play ? pauseVideo() : playVideo()}>
                    {play ?
                        <PauseRounded className="icon" /> :
                        <PlayArrowRounded className="icon" />
                    }
                </div>
            </div>
        </div>
    );
};

export default Header;
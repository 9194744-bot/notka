import React from 'react';
import '../styles/News.scss';
import '../styles/Modal.scss';
import '../styles/About.scss';
import '../styles/Icons.scss';
import '../styles/Navbar.scss';
import '../styles/Header.scss';
import '../styles/Footer.scss';
import '../styles/Loader.scss';
import '../styles/globals.scss';
import '../styles/Gallery.scss';
import '../styles/Product.scss';
import '../styles/HomeNews.scss';
import '../styles/ShowRoom.scss';
import '../styles/Contacts.scss';
import '../styles/Category.scss';
import '../styles/HomeAbout.scss';
import '../styles/TopProducts.scss';
import '../styles/Infografics.scss';
import '../styles/ScrollTopBtn.scss';
import '../styles/HomeCategories.scss';
import '../styles/SliderCategories.scss';
import Layout from '../components/Layout';
import 'bootstrap/dist/css/bootstrap.min.css';
import { appWithTranslation } from 'next-i18next';
import { Hydrate, QueryClient, QueryClientProvider } from 'react-query';

function MyApp({ Component, pageProps }) {

  const [queryClient] = React.useState(() => new QueryClient())

  return (
    <QueryClientProvider client={queryClient}>
      <Hydrate state={pageProps.dehydratedState}>
        <Layout>
          <Component {...pageProps} />
        </Layout>
      </Hydrate>
    </QueryClientProvider>
  )
}

export default appWithTranslation(MyApp);

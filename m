Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC326ED5F
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764159782; cv=none; b=Th4yL2ETZrYiebw4vqgfADlsm9sXdVXEuLhtwx5p3tUDTs3VUKpX1yNiIL+LCEzmWHCB0bL7n374kJ3xaTjwQ5B10HFoKZ9mgPzs2uVf87ygJ3OPND4fw33JH6AscDPz+ga83RT0Jpbc2Lw8wtcKN+0e+arFh9o1SsuzInLkPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764159782; c=relaxed/simple;
	bh=5Bjmur9hZ08ziy25qQcJGmQC0qf9yMwsggo2nJpX+CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UofpscPmWAKlxL0yYWUR/Fl8LS0VP/UZTJfeYPoWkPDKj2mdE4kGJ2cPA8wdXomN2U8JqMnHaO/GT8hgF4NA1BpiolXvd714vqJjqzejM/+re0GPVK3GrBTfl7YZc6uWeSjYKsUBsoC+yg5mHstqE7vFD+hD0zOilR4d+EZ+2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOEXw-0008R1-7h; Wed, 26 Nov 2025 13:22:56 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOEXv-002ba0-2u;
	Wed, 26 Nov 2025 13:22:55 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8EEBF4A8BE0;
	Wed, 26 Nov 2025 12:22:55 +0000 (UTC)
Date: Wed, 26 Nov 2025 13:22:55 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: broonie@kernel.org, frank.li@nxp.com, hawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
Message-ID: <20251126-loyal-lobster-of-virtuosity-0aa824-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-6-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myitqgaobs22g25h"
Content-Disposition: inline
In-Reply-To: <20251125100618.2159770-6-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--myitqgaobs22g25h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
MIME-Version: 1.0

On 25.11.2025 18:06:17, Carlos Song wrote:
>  static int spi_imx_pio_transfer(struct spi_device *spi,
>  				struct spi_transfer *transfer)
>  {
> @@ -1780,9 +2112,14 @@ static int spi_imx_transfer_one(struct spi_control=
ler *controller,
>  	 * transfer, the SPI transfer has already been mapped, so we
>  	 * have to do the DMA transfer here.
>  	 */
> -	if (spi_imx->usedma)
> -		return spi_imx_dma_transfer(spi_imx, transfer);
> -
> +	if (spi_imx->usedma) {
> +		ret =3D spi_imx_dma_transfer(spi_imx, transfer);
> +		if (transfer->error & SPI_TRANS_FAIL_NO_START) {
> +			spi_imx->usedma =3D false;
> +			return spi_imx_pio_transfer(spi, transfer);
> +		}
> +		return ret;
> +	}

Why do you do this? AFAICS the framework already does this for you see:
spi_transfer_one_message().

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--myitqgaobs22g25h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm8RwACgkQDHRl3/mQ
kZxM9gf+PBn8M993Y6DCSCAzs3Or4xmLeazQrHUS5Ra5UOOnjL0TCCZed0OwCmMp
hlcBXsu8PyapENJ5eimk1pG33l6ZjqSSYjgk2tcZ1r9e9Eswle00Ra9F6Hw3Rpbx
DxBHoiJDH/rJhPYBCaIR4HzTu3eoVIBnFL+sQGLPjdR7LTuYEjKBwNY6l9TPQVjf
VFgEGsioB0dpuKjR3MO9pb5BQpLJI1iblrdoBr1lwjvvg1NYe+ZBwAklpRinQhPv
rlgeV9yaP0x89MQM19/DflbnikD2a+ryFOymsGBiLxnsB1f8JosPtPIvjM6i6E5P
fKpE1CVTHbe3WBe6AtVOT+htRwWRmA==
=ymDj
-----END PGP SIGNATURE-----

--myitqgaobs22g25h--

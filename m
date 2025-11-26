Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF814F125
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764159497; cv=none; b=rEZOT62tSmIqtFN94BuiChig0rR+wwYAgFQCX8Zc9hqSbsjOzmwN9Fp98UFRA035KEhJAxVbm0rDo+hYbQgRyOo7mDtNbTTkG3dvHmHBZCEhSfS8UF/Iu40DikKg7T1BECGPulyC4VRK2rpjNYbPm+FPUSIODSPL/hNBL4pih/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764159497; c=relaxed/simple;
	bh=vAlUByylf5CqxOC0I1+7OPsdHU9pfWQ32pU6r0KDsgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B47HyS9FfB7+8iFqRV8YbfL2kbxJFm8/4ploVKJwQvgM3+AMyifHJ/EgvTOF0sHqg7GJzkUGNHegsD53RRWnetVFx6d6m/Wei1AJwxld/iKn3OFRE3Bu3joucZiyyhSMQES1TXefHGzD6i9Nh/USYXGegC1r2yjVXYEuXjbTXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOETL-0007u2-Dh; Wed, 26 Nov 2025 13:18:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOETL-002bZg-01;
	Wed, 26 Nov 2025 13:18:11 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id AB5144A8BC2;
	Wed, 26 Nov 2025 12:18:10 +0000 (UTC)
Date: Wed, 26 Nov 2025 13:18:08 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: broonie@kernel.org, frank.li@nxp.com, hawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] spi: imx: enable DMA mode for target operation
Message-ID: <20251126-bulky-mega-beaver-de575c-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-7-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5df52gksb7am3vhl"
Content-Disposition: inline
In-Reply-To: <20251125100618.2159770-7-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--5df52gksb7am3vhl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/6] spi: imx: enable DMA mode for target operation
MIME-Version: 1.0

On 25.11.2025 18:06:18, Carlos Song wrote:
> @@ -1895,10 +1920,16 @@ static int spi_imx_dma_package_transfer(struct sp=
i_imx_data *spi_imx,
>  static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
>  				struct spi_transfer *transfer)
>  {
> -	bool word_delay =3D transfer->word_delay.value !=3D 0;
> +	bool word_delay =3D transfer->word_delay.value !=3D 0 && !spi_imx->targ=
et_mode;
>  	int ret;
>  	int i;
>
> +	if (transfer->len > MX53_MAX_TRANSFER_BYTES && spi_imx->target_mode) {
> +		dev_err(spi_imx->dev, "Transaction too big, max size is %d bytes\n",
> +			MX53_MAX_TRANSFER_BYTES);
> +		return -EMSGSIZE;
> +	}

If there is this limitation, this check should go into
spi_imx_can_dma().

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5df52gksb7am3vhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm7/0ACgkQDHRl3/mQ
kZwSxwgAo3CvZ95SVpWaSCshyMvZJ6w2bXoMQtzSgXTCg+abeLF0ICK/dY3phk8H
4GVrJ1LQwsHERHkMui7ufs+gvKFp25Ba7sGif7k9ag0c3Bc4z6T0fPAjWuGH2joM
6WvuuqTnoY1lGKl9s1aclIEx6fG96ll0NsbJ00iqQKk8VvwmjwUt47v+FAnLLmIf
sqFuBsH1Te/qcaMmYqvzbukJjFRJR2Wy+HsiJpOFTt7IASa6M6T/cr4FiF/qhIBa
z+iEj7+841qhFryMV96P8to4Bnh+p/v63mHPoByhCS5622oJKMANjKbhJXWm778C
rGS15gbb2HxMR6lwFULY4zQqi4FS1g==
=VliQ
-----END PGP SIGNATURE-----

--5df52gksb7am3vhl--

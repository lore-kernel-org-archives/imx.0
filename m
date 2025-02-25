Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301720F070
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515516; cv=none; b=LZuurUOQfx8ZZNoYjNmu/OFbsZDx/3sz0/5xmlVb1AulfsktsB87JAQ6KZ2lknmCW0qQ9ZUIZukGezX8fo4EjxcvgMUhWHGz4gmJceT1PCjVVoDMVAB6axvkBpdfDyl+hYzCRJXE+3TpW3VtsYPc7UmM8YgCUf/ONtUL7lzoS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515516; c=relaxed/simple;
	bh=AnV9E20w8fH87HjCFEs/ikMWlCvzcwL2df9gCfjDD9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kg2+MfLPNa3DUyy04gQAV29waPSBXHuixmOapN7XqKUpewbzgYOPSkL758/9h9PQ0OhOZUaT0aAGU6nWOO0ExhNYgJwmbB5+DniTbvuPy6ez4UEeGnnyMqwBfc/XBMTwabpXsQZKbL85S8Ru5jV53sFXmNP8O4YKkDzAY4RMB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsnUB+Ai; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsnUB+Ai"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb81285d33so42696366b.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515512; x=1741120312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=;
        b=lsnUB+Ai4HrclAnYLYYTvZ9/N9ZoSJHKSIqXAZmTOQHhtzogRZS5ISPEi0Nmql7eaS
         UMiRTIEqVgufGjAgXd75prLne2e/hAmdHoqiTdTE4OZigTsMaCLuN3W1zJKWXIKA6/kQ
         cR2HCDMXzwxg4tO/biDWjZg2ltlHPdcx1rwR1qlQvDYMbYp090JTTRk5vQK+oHt8yfdd
         bGpiVrEUnT0TsQaWsYew4yYuNJ7jGYmaXV/Da7e7GTfmaZImz+SLT7JXCjJ6r2CUTwRu
         uu9TqiLZ9+DohoPSFtBrzukNpmuFygN/V+tGRQL3rhkemN/krOJxxSQ4hS/MOL711Z+l
         6/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515512; x=1741120312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=;
        b=Tck9jCf5C2Npzu53Q1nEERsR7mTWFjlBWG2veP+bXBt8usSkeSbxnGgaCUy/J7GcK3
         7pzQB8/Lizu7KK5BYrfz4PJiYuqG0chpmK5Mv5KVsi6UnBSO7ZOuqRHlDj5+QbRyDOHq
         xqEJLz3xijVmo1665jSFduqbQcc6lfsJlw2HF1nQ/Q0+RQ8rrU7sD2i9wgTEBwapNePa
         5SE2ZNA+vD5QFsZPfw75lMlgAjdKckKmkJP1znFmIoDPSHyVJFqoZrtw/mvBZCmkxsoq
         qbZ5slcDgaQy5U3RdnmDsu6XC7jSCgNbco1MRzfP3dZb53iKXpeYxeDRdAtmqJmi/Moo
         Wu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn88/vgNowaAutl0oRmUjRewnOfHyHwMd6+ULxCoC/TzN7vbPay0GycrksWaXkpkH+RL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzrLg1hwQw9SJoNnMtLad/e7IsawgjEmIpCATlNiPenOA9plpl
	Cfh9/xxkwVQ+IbqXD/1xT1kBKB8vAht5WQ3DKAgMO/UjSUwNyalj
X-Gm-Gg: ASbGncv6QiZM8URUqN/gGBWOCk/KYzqABBjhsZMAjXg6pGpKd9BZpF8PZxa88XdvSrI
	dkSrfSHzpsVNE5fXJayRVSG2CkXKfdxC1VyFW8xIQ3f/peM0dRq6Lp7SHs4cA0URTEuh7bDiGiL
	knb/7OLQJDImlwWp6534M+kbEf/a0NxYuD2TtcyQrX/iX8xgnYoKI9CdK7pjbcPAfHUHJdk/QPB
	DHwQKbecU0rhHJqPhhkepCalStS4bJNKDSIF4/pxco/TgRCvj//SupJm03XiF3PnLOsgrbULIsw
	U+wGCo1HdPWugnm38EHdwSZCafAqF94JX4SbWonVdrveC4MChY0PzpMD/bbBeuXMRYlXzscwrfv
	Ax4lYihbqcJ3g
X-Google-Smtp-Source: AGHT+IEJuXnWIMGDBSBMqOav7bVwcobNvyp7gvPMLJMccBBO8pTepVY+1CQtODf0snXMlUdT+6giVQ==
X-Received: by 2002:a17:907:72d1:b0:abb:e7de:f2a6 with SMTP id a640c23a62f3a-abc09e35401mr2167544866b.53.1740515511788;
        Tue, 25 Feb 2025 12:31:51 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdc46bsm197935666b.20.2025.02.25.12.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:31:50 -0800 (PST)
Date: Tue, 25 Feb 2025 21:31:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <o5ww56n7e5sfck737uwasx7o4zlhog47abfvfptcegikyheegu@6gapje5hr56b>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3ccr5lq2mt5twat"
Content-Disposition: inline
In-Reply-To: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>


--o3ccr5lq2mt5twat
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 22 +++----------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-s32.c
> index 6a498833b8ed..b76bfa41af82 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -100,24 +100,6 @@ static void s32_gmac_exit(struct platform_device *pd=
ev, void *priv)
>  	clk_disable_unprepare(gmac->rx_clk);
>  }
> =20
> -static void s32_fix_mac_speed(void *priv, int speed, unsigned int mode)
> -{
> -	struct s32_priv_data *gmac =3D priv;
> -	long tx_clk_rate;
> -	int ret;
> -
> -	tx_clk_rate =3D rgmii_clock(speed);
> -	if (tx_clk_rate < 0) {
> -		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> -		return;
> -	}
> -
> -	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
> -	ret =3D clk_set_rate(gmac->tx_clk, tx_clk_rate);
> -	if (ret)
> -		dev_err(gmac->dev, "Can't set tx clock\n");
> -}
> -
>  static int s32_dwmac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat;
> @@ -172,7 +154,9 @@ static int s32_dwmac_probe(struct platform_device *pd=
ev)
> =20
>  	plat->init =3D s32_gmac_init;
>  	plat->exit =3D s32_gmac_exit;
> -	plat->fix_mac_speed =3D s32_fix_mac_speed;
> +
> +	plat->clk_tx_i =3D dmac->tx_clk;

I noticed this while building, the "dmac" above should be "gmac".

Thierry

--o3ccr5lq2mt5twat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KLQACgkQ3SOs138+
s6G2dg//XEAP/SNRmlbm/Whtc1ed1XDDGWzN1eqPHb22h85AkhBzo3dyiGlai3KM
acTcFFS5ngfi1FO+bSmjLeGRcAiGJimDRpNSomDWy7XFwDaA8oWg4bkWSk29PGom
kWOv51f5QlkqJYvK5iYCr37vIThe9KQwQXurR7TbcMZjXggL/paw0o8fbU23+I5A
KF0Y2OLjg4OGfAISzc3SN7B4DKa1uomft05iVkSWcougkQH7N6wmfLTQwfMvXG11
yfIZYOPVd99SiSYR7CT6HLO4JCFDdVYQdJS58v61VvRgyOZlPEG9hCPNNHT+uTeF
Ld4SXrtSywR5WuoJC+B5tJwZ28HNAleCf/5iBxCmxj6AMfftiTaA9LR9K1Myhn9P
4WEXnvBIhw44yyVy6lVbARgSycNXbXey1zdzsCHoOC7vDyxRAsY6eZqcU0Gsaxhp
ARAEdhyVHL8C22q1FsgLUa7pvqavet9mLUz/tKBhM1s7ryQdeS9qzqx3D7VhEY5o
kVJ0ivva6sHgzLK5DkXKN/Tr34R4iBclkR2GAIK4KCFJbnJBMPMf3zeMAJA7v3rD
u8KwPspfNZnP2P1+D26kVX+6oBTXpLFjtKc4vHs3fZcMQ4SrATeeBPD7hOxZOOfL
n20+ZxoKnMcnqlukoxG157V1kl9eNk4ROaDJ8dljbEctRWfbUJU=
=QnMs
-----END PGP SIGNATURE-----

--o3ccr5lq2mt5twat--

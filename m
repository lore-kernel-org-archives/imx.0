Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64920DD40
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515811; cv=none; b=C/okNyz/NQXyHBHUuhw+1lceJJpslI2p4a71hNqDwiX/m/D9kALiNTsoCZK9V0EFsVqyGDo6Kht4w+bJ5885tnDFCs7vmDYclUAJDpy5f4/ttmvUozUC1IZ4rdxFuvjUXB6DHFQdJJwHLwnHSNr2wEDvPQI7OoxpsN1iyGz2lXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515811; c=relaxed/simple;
	bh=UCjaUYNwA7gkdeo7z/kfqp3ddYxARZ2+9UWe4SoPsMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciildS3mMVFCsfpRFhIEWQXl47jAGDkuFsJfdoEODqo+aKzFzlv152hZlfr/xROPFG+Nkp9Mj7h3tJ6BKRtmghhLXRfornUrP4EHPjd8HGe9AAkAPCFxHtil/6I9o9Lm6VOtUM7bXz4isUa2f1J81Z5xh9bs5Jmn+c4RugLKzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3tNJH5O; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3tNJH5O"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb999658fbso751363766b.3
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515806; x=1741120606; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=;
        b=F3tNJH5OUqrQwM7i/WQalUQmw//ULHtTun/+rN2eJVi21Xm+riLJBYAfLPB8tUiM6d
         yYtODlpCCrPDwsOfS3j2ijZ0NZyOfzhLohiigNJFHVPWrkUG1vRiEaTtqvYVYjvrgba7
         HDYAMn8Nr2hUwUckVoEabqnTscRlWOyxTbJdpAzBwbx2KnedDslugoIfooeCY819mhAd
         hER+hi6q/MUD8lX6LNhiNRHI5K64X69KUx5JNl6kyA6nSwQl5z7ZdCN/gfsIPFL45tt/
         22C6wY0heJzz9i1iK/FUNMEv3yiu00+hDyVZc+Y4U5uUJWq3cZztojPJBleIyUCLsN1w
         j7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515806; x=1741120606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=;
        b=NKUBOyvSESskaRxdshMNKAW6FGTPCvfba8P4wxg3NbiJPg/NbCBy89G4I4CUjpc2dt
         bdhPNJUyJ6cc/vFLwNZlsyb3TXYSaSCYufacnfDKwF1+qC/RhMyCfYCMkcfAnKQVEMXl
         2bkNFdGiP0XvghPoNxex7fWEO+EZPIpsyhVcXjyqykhTCULMiM5uFbEWl7fXKqCVJ13x
         7c4WgwdF12nfxlSYMnP8aiDLnqt1ECqKBCiMR8kcfUWbP1XFT+Cga3bwPqbyDR6a/mSg
         SFSP+yv+xYRDCnK2IniUM51IXb/76FsK6tRdgK2MCRzMWTxnMNkEKL1/unIn+91A66Qz
         etDw==
X-Forwarded-Encrypted: i=1; AJvYcCVoWf6eLkZKJDrlsUAhw2gkqQG+/2yU83WgGWZFpho6Dts2bgTwMNL/tFWpZlbLHzn3ReY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhOiD+WIscaBrfGSj66Hm+vdMeU2H4vX6gPjvu/SXFPQsmuFWR
	QVChr8ucSsj6Lf+Nn6VcYWEtG57wfR2WAJAlePINKdy7+aplmDxe
X-Gm-Gg: ASbGnctDol+w/5kQ5tkYvOk26+XOFMy6NCTp8lbr7kOZcYu4PjVmsRDRaPangG/5cCa
	7fBET7rywZw18nHjho5yjICi3beRpO6tb++J2lUyKVFdx6CF2mVPrNHkx75PGuy8DCAtiKO4K34
	l3LKqxsdrN88nSrHFkRveFORVl8Qfe3gjddUhl9SMCO6yEnyRSR3H/WnR9ccYY5kGToscwtwpZf
	NPifpEh6vgav3+FXYGpkmkJaT3Vr9mKpuH8g/IynXLc82aL7VGpYjr/j+ptOigMr/Vg3SHkBA5v
	/ZoF4F/tRLH8vRix7bS1qMy9mEF4NI1RVsCr5fsEW004oMWcUaReg8m3JIMJCmLqlOk7ES7ZIqU
	9dNvLVg94U6QR
X-Google-Smtp-Source: AGHT+IFncxJntu78FR7b4qYIZj+yv/K48D2ocZTvPMdxZVQ+iCvW4E3ccfSm9iifNVJPhsHG3qsgrQ==
X-Received: by 2002:a05:6402:3512:b0:5dc:ea7e:8c56 with SMTP id 4fb4d7f45d1cf-5e44a256cc9mr9383487a12.22.1740515806327;
        Tue, 25 Feb 2025 12:36:46 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205c7efsm199478066b.149.2025.02.25.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:36:45 -0800 (PST)
Date: Tue, 25 Feb 2025 21:36:42 +0100
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
Subject: Re: [PATCH RFC net-next 4/7] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <auqbgnqka3hdrwbxoaa3so6caju6jzzpsbr5yufaqgbqmhjmap@nbawhyq3nz6q>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npnnru3ejcetrulh"
Content-Disposition: inline
In-Reply-To: <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>


--npnnru3ejcetrulh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 4/7] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:54AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 26 +++----------------
>  1 file changed, 4 insertions(+), 22 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--npnnru3ejcetrulh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KdoACgkQ3SOs138+
s6E3eA//VXPPJ389lkM7hL4gCsrCvhxDMVKpYPMFI55f6tZgLN36yUUjjp/67nLz
TWhWj74unoSnThtfJlOzxs/l/n6/XM23PEtj+TVrBk507ao3hEWLWY0KPW7fHU0/
kb7Jfe85CfqmkzrtLINfqpxvbb7bgSxP5yALfculXlykp61GY0aPIHUAXXWWUn2u
SdgqTvYdA3oTDBJ2Cc+unBpVTSuH84RpMvnPLvtLu2+0t0ppjAf4MYJG09t3f/jr
Ku7m1c9zlNWDrv1fSsIJ4kd8YakZsB9aDGxcP4rQhr/73uBetaUFfz92tTvMPAvn
/vTqP75LzOPXu88BGK7ZV6SvdOBstrxxMOTM2/7/DSyCHv2V1Yt3xvplbP5YCble
ORxVJNlzH0JweLWggg9xcvDlwas+jagLOYYp5If3cqsae9CFLxJr7zywxu+UaVT1
DIpGMI0dnVaJcwOc01nlEWCzeOy0oe0lG9UZkUPKWbxoBB9Eit4ZibSmoTCf3l3q
fjPgZBKRJa1hHMBEecD7gQja1zqMg0ZOcdXowP67ZIF9AkfCQHZNorMqQwicvA69
w8x2PvFSXgexu6zDEAZ/5SMc7+iLQQ8gTR1SZHpna+9pl5S2X/CiYK4Ihvzs4EPY
uXWe3lJzBecVr9TdDq5tgbk7cTqduZOS4Yvc1XkGEGgKA/JT4c8=
=slen
-----END PGP SIGNATURE-----

--npnnru3ejcetrulh--

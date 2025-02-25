Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6213D211A07
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515461; cv=none; b=ndx1Fuj6hz6wEKJQgASJMnGm6wS7Ms4QFq89Q3LUPoATrUCezLhxCZDdqEXgivUEe1qu8kNXtMSmTShOOVBnrbTzUwt4L+ug4LIlVAIccRFRJ+OZu2Q1Y1NA8z6bPOVM2+iZ0jyq6RYm9vFqbfkTYHvmTiz0epk/n/OqNSOeX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515461; c=relaxed/simple;
	bh=bc5+/o6iBvr99fApSP5qumW8aozgvy5KA2eg/uLLKLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2E7ixQcKkRnrmwsuJxHzyXXcURhmCUg1UlAbViJs7MnDeeuW5D9FGdCn4xpVfb6Z7lLOVEg857qzgExkU+kjZaBAYCpG9gLEvS63IoZnLFcHFgMfPyX+spomkcyiUnMfXcVdqfoDhQ0ycFbJEA2STQSOkslhSl1OC7L5iR6tKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFW6qUZn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFW6qUZn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4399d14334aso53152555e9.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515458; x=1741120258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=;
        b=LFW6qUZn7FRYrvKATUqph4xKPSwXaGuLisJZ6EfjdppR8xzgkk29hBsDUsgolYmS7n
         sGJSVxi2/QIvR7y1b5wpA67QaGhsQD8XyD9WOu8g6s1JjmXueWPZ/p99KdR9adgFnG4i
         kLtRsRVfdc7qAWWQ4VCbwMmaxnz2XOG5v9ng1E6CP3xBnXNtcHZPZnZcH7HZhZPRY7oF
         22YX4YW8/Nzpbl5LbUVhDdxfoNPETj2Tck4ulqFCEsWNY0TwM9pHU2xkyHBVT9wOzXFv
         e0e6+4hMxfHQupRepEc9uFQJyp6sBCGjvyPDL3CpN54XEQOn+fAdTLCNwI6mGytgmSMW
         Cx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515458; x=1741120258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=;
        b=T3SIMWSpH7SUaFzeqs8ULs24ELWBII5LWSCJmUVE+D9jnahqgmX9Cv1/5F6Dbh4jSF
         NnYZiKn2ugRvCEtV9OZBy2v/3k4CUuLcQt+e+4gHCdjTozt2ib4LZAH+nuOnv6go+rWJ
         OSAumpMNV9rxvWBG1kaOCNgdvfowQ2apfGIWLDy/kvqlXcgcVfSPbrfbk64V3OH/5OOd
         JpyOmxqEd2tARaiy4cZaAPXgUPc/iCImG6MZdKWGKwKCG6n21saD871m22/43ujYoIsv
         +yIXVfBiPI3XvQJ7pSWuPU9IoeGoLMDUWiFV483T7RIfs+kxgWy+bImE3fWHkWXeLLME
         jZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLphyQD9noHU767h0DABt1vLZWa8/cWUnLEN2WZSjhceDCe9ex76rssNDYwKKZGgk6q/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YypyIcI4ySaGMhVggQX9MCh+KVKahU82ZUMlvJrSa/NnKkLVBJK
	hTOOlokD3R6LH734nEcLri41a6giPRh1Pp7AtU+LIT5ht3zU3ERt
X-Gm-Gg: ASbGnct3X+SKs3k6re9/qBamOFlW9Lr1TmoXJ4/D5nVqxT7yORv3vjsPEvOxrD0tJTc
	cLKN8u2+uB+Qw82TAbA4uH3z29Wk1PHAYdlcILIscxXiwM0Qb9t2B3U5LenBs9mi37UbGkC8G57
	hlPWtXSTQybEm+hdeo0KA4b8Mh16AyI9IWlKeqeGS2bpm5n6sZ/WnpqSAhPR1vZSGMVezRuvGHy
	tb0ajCj3ElOrKgelOsbYDrYSF3R35oWCiY/X+5Mm8TnsLefFO97oP3uPyT0XvizEdXa/1GJb0YD
	9d67ZaxrWHKb8PJB7xodiYJokCtWsBQuQAT4+wct42pEBxY2pyFiGDTZBVNQF3PL5yMKSI7PG/a
	8gw9xYFUnSwq1
X-Google-Smtp-Source: AGHT+IGMx5pU7RRODJDtq0qCQl84I8Udv96NunCF2+SS/JZM7mWzu9hAPxehyg/ka5oYvjP72VnZ3Q==
X-Received: by 2002:a05:600c:4688:b0:439:63de:3611 with SMTP id 5b1f17b1804b1-43ab901d6b4mr6206895e9.24.1740515457376;
        Tue, 25 Feb 2025 12:30:57 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a136sm38626675e9.35.2025.02.25.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:30:55 -0800 (PST)
Date: Tue, 25 Feb 2025 21:30:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH RFC net-next 0/7] net: stmmac: cleanup transmit clock
 setting
Message-ID: <deshe54mqty6ozlcbncliwxfxtszubrn44onswjlmo62lltcvx@42piilxcqwba>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4erhebjcgk6jk4go"
Content-Disposition: inline
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>


--4erhebjcgk6jk4go
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 0/7] net: stmmac: cleanup transmit clock
 setting
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:39AM +0000, Russell King (Oracle) wrote:
> Hi,
>=20
> A lot of stmmac platform code which sets the transmit clock is very
> similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
> and then set a clock to that rate.
>=20
> The DWMAC core appears to have a clock input for the transmit section
> called clk_tx_i which requires this rate.
>=20
> This series moves the code which sets this clock into the core stmmac
> code.
>=20
> Patch 1 adds a hook that platforms can use to configure the clock rate.
> Patch 2 adds a generic implementation.
> Patches 3 through 7 convert the easy-to-convert platforms to use this
> new infrastructure.
>=20
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 +----
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  5 ++-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 24 ++----------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 22 ++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 ++-----------
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 43 ++++++++++++++++=
++++++
>  include/linux/stmmac.h                             |  4 ++
>  8 files changed, 65 insertions(+), 71 deletions(-)

Seems to work fine on Jetson TX2, so patches 1-3 are:

Tested-by: Thierry Reding <treding@nvidia.com>

--4erhebjcgk6jk4go
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KHgACgkQ3SOs138+
s6FT4w/9GoN6QrYW3VP35tGhx3VaNaXACzYRu4GB5krW+p4Ixhq8LfnSKek6/MHu
SkB1lalSpNyFg9ZHeBHeLUMG0bulJzaqUNj38OnTv2YFI+hGXs4rkoLWKf1L+T9k
5Ci+UCoA5wGzrt+eKHixzKsu9V9oVexQOq0gp8AW+4dO8SQxqRgkTL5meN+ArqLr
O1F9jGuCNvJSIOeI4wFQ97s18GRHYTIJeq832LftTqIcJlGGT0dn59tcbLBLm+2f
2vbEqND6mv4cSADvXn1VbUqvCPFO+8p/U75Edy2D9hkl7ZjEjLv31bNQusqiPLFX
gq+JtMbP82gkdQEUDM/K1Ld5CVG5tioTgxWkBBLgU6Ly9TJZBLhN8V+FKJwUhswr
bpBS+gia4bBuu+04aiqgt4Klwb3o4opietJt5ZtJy7r1THx3kGXC/xfl6LVPyLEK
Rbtfv8c61+QmD75lC4Ydatoam55Gu1wjcct4SeqDWO/OiyJRRduoJWvOfCl7h4AI
bDjKuBvoOOTaTOMV70s65FghmyDlNLSyuOGpTMGlTqXgSNYMMehxHPsdo46S2N/5
SYZPImYOXvYaja3UcCYl8mqZn2/yFYPaI0Y8B6v08nof4iYiKdlL+sS7cK1XAkeF
emLTs/BQbziyTrK2sMmeZsY/Yiyr2y53PIxFvgAfnxNEIyl9+ZQ=
=A0bt
-----END PGP SIGNATURE-----

--4erhebjcgk6jk4go--

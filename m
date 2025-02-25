Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2FE1624D4
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740516423; cv=none; b=docu8GgqmGkZ2zfE23C2yCWmpfWAdyF+/fCd26akuV3VD2BQrgzGMWKLMZdZtGo27WCTQ+ClslB8y3QixZlSwRWhK7YvOc6VCuAZUQ/Q9yRactr+gq0mQyTQy3zuBws4ieizgHezN1gQ8HWOWQhFL7DN8SwVmBMKy2zW5eKnXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740516423; c=relaxed/simple;
	bh=Act62FROw5FKgMdYrI/D7fctk9vB8HfEjrEmQQTWIAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKZv8LhjQZ/4G6GwUl0FmHM8z7i62TBGsIWWLHYX7n5zbazvM1j8h7P2v7stSBgMaXl1s3MLYm5ukwEWnPkvspnUug3kSYC4ZVDaiU4dgtM77ZVGGCCHprMdKAe+PkfgqROkJG0MMtritt+XCtYuqpn51XZhj78YwnYbqb8Si9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDKWrd6Q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDKWrd6Q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f24fc466aso4478573f8f.2
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740516420; x=1741121220; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=;
        b=DDKWrd6QZ/eePUrnKGsR07XGbIEF+pWmWw9rp8sXSQcMhybzJ76TwLae4Tm1clPhbK
         qBWsVbiJVJMQjrSR8m7CAyfT2TzAcNO3bWL6zPBjMhFCRV8tnO6+ug2nqe3Q5Qgu38VP
         qTLLlj2pc1uR5kr7SPO/mXrqGDQImNu7Hm0yljzRw7WdfWoe4opTeuoo0GEyp91eLZyT
         2+lCYHEhjG+ENslZUIdU5vufHvV+jDSRT1OzzV4efoalYafp504Po1oMGI7LnfpwagRk
         tE346WF3K7KBhV7AitvFu/6+tOdGh4ehpsxAbqRmDGIrA8baua/CrmSlyJ+nZ5IhFKgz
         h1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740516420; x=1741121220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=;
        b=Zs0zyQDDsGFVYFPtvtxuYCPcQcLPvwTNZKVfp0KYEcHjSSVPpWOECQuksQbykzOW0A
         S/kstrQl4uJfzPgL562ZA6hM3RrFm8Vg6hwrSo2YL5msofk3lL7YPEOPFKVr9UB+r7jM
         J09TeqouK9sE+d/7PP0Va2mcgsT27eyDRU6vzpe0riOhD02L1Sak4clHT6wJoO7vv19f
         ge9Xye+qzw9NlLlP5a46ihbciBpC4fWaeKXoBMBJr1UJQhXCEoPVL13i0hNBKlu9+7yQ
         eTlwlAjIqbxdhaCGLiZUbfb2r+OizudoyFGvSOk460/f7qoeDLWTqyGzeoGuNHdVHcF0
         wr2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNyMuphNj6mgfVw6b86ISVgH4ZCSIC92YOG2jf18E007OmweU/M/61fTj+oReF22yGr3c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWpa+9hC05hUvdukPZ0PT3m5sSPHxrYcBvwSOiLh9azBOY05fp
	Hu3JsJ4wlGnKh/w3EfsnD14CED/G9G1sJEFCUsUNs7OGRXoFxRt6
X-Gm-Gg: ASbGnctGIJNnfsCk4uTz8i74L5+RbzUngbGvT3ma8kEX+OCUA283QT1puq1ySpcPggO
	iApRUs2JlVa2CBHnaHpnryCViAK0Qx+7BqUQr6vOA459/IjaZbIkxP5CqonQdHoJzEWiUU6OX2t
	EBRLAYybRBSU7NfCYOAoaRFkIxGbMApyOQS6BI/U89F76DPh1vRhs2TvKVr02keVPhPDCGyw4YA
	L6hDMqMhenBcIXpcU8PYhmm4/EOhRDBbb0Do40z2wjUYukLNYjVjzXePS+YnIwYMctZPx4850W+
	MiOLvSi8RuqgHd8NSRqG5nZyqXZd1wyosElWz+WXmwxOX97MvaJ/9cyvgy5Fx/LM9tkcg/o0sSp
	FLdefKwcBEcFF
X-Google-Smtp-Source: AGHT+IEmw7lSBpfSNj3LhieZeCNYI4bj4PCJf7zwnwb1ygbIuUippUUYOdeYMqmm611SGM3iLvGYVw==
X-Received: by 2002:a05:6000:4010:b0:38f:6697:af6e with SMTP id ffacd0b85a97d-38f7077dc73mr14301433f8f.1.1740516419999;
        Tue, 25 Feb 2025 12:46:59 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a11bsm38026395e9.36.2025.02.25.12.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:46:58 -0800 (PST)
Date: Tue, 25 Feb 2025 21:46:56 +0100
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
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4kydm3gogek2i4nx"
Content-Disposition: inline
In-Reply-To: <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>


--4kydm3gogek2i4nx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:05AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
>  1 file changed, 3 insertions(+), 21 deletions(-)

This isn't quite the same code, but the result should be the same since
clk_set_rate() will be ignored if the clock is NULL, which would be the
case for !dwmac->data->tx_clk_en.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--4kydm3gogek2i4nx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+LEAACgkQ3SOs138+
s6FCDhAAscpV7eVp/AZQnvvZ4nw0Ad/YhFSj9yZtfDGHgapuDwrpMtuoI8uo9AXY
D8+01yo35J7QfixSJ8u9vwrs2sZQLQsWQ1a90UudQueW5LuaW+Mjp7ErJgrh4B4C
lsm3cUuv+/GblfCX4FgnceY9YHJGqoZNDzYAb+e6xmZCgFzRpT4emSCYCyVHnyS8
sELpHrLTdgJlso7x8hWn3GsSgG6te0ToqLcru4HZ+gl4zRjh8ljfx+5tUkiCSdIf
53t4tdRo/qhu/4EurhryxxJEsXSju1iYV57knOQp0QsplHARC7c4D10xVHFiYi4j
M3mTMnRYGY/d9MMsd0pr193DktSogHur2k7zUdccpE7X34CPZcmfg5wLPO/qYK0S
rJvto6QcJqqB4XagVfuoXoANvAOzlMXUviQBUHFFSumHmnwerkU0ntPzQdk5oQqt
7I+TFMNlEiKA1VpLGbTWw8cEbvj7ZPGHnVd3EQIQp24lYqK/6IZiNB5ZOC0Q9ayk
ydkm9PWQzIdlL3MFh/nho8iZ43nJF3rkTsML1leqt1/CdjHPHi+csCYATi2TqGEp
GhcrScX9mxWkBZ7xWzFfETX610z1DwlzZDuZSlLtc1ZbyxLacU8EDIqY8bha661b
8Irrrgzw/UAFApkCGAQxQ3NsIsc87T+t10FfEW8cdTCjolZd+hU=
=eyD5
-----END PGP SIGNATURE-----

--4kydm3gogek2i4nx--

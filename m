Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680619E7ED
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515664; cv=none; b=s0+GhzcUIFo3ZdTQJUfg5c1f4zW8Bac6zFoKZ/V3pZUxZrZAzmJj/0eCWu+YfNpZhtdi2kdinRJD8gDppvTLmkzV5BCoh1p840QDt7ifrlih5TdFJ01B/MsQk28bGRM0StG9WSNveoDnZcaCnQHBhX7ly0k837CdTOTyDMu5chk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515664; c=relaxed/simple;
	bh=wO6gTDBz/P29n3Bnp+RwMhO5+vhL1z74WiB9k3Xfdjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4Dz4hH5l+126IMcdPfnbrOywUjDSfxSnKnjp3e3a9nrG31B1wqos1BqqFmyJ/23kWi5V1RQrvvPyAeHskZ+k7hEr1+f/AwT2h9agFgIMJNHSCO04Ja1pjdIE4/sbqNJ3LXDX7SaAk1Yl3IEutKmtUZmeGg6XjgIjl0p3fBORXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMWec+Cg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMWec+Cg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4399deda38cso37571565e9.1
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515661; x=1741120461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=;
        b=lMWec+Cgy/8pMIWPbsQdpgRhzvEdGcAy6MwNI0+//ucd48caDS/5cMbrwft0/UJ6ll
         zvD6roT5zP8Dw31wVix+lp0Vy4Ly6oDLrAL1HDCqpw+ITF6pRtkVP5bg8Zrahz2jh96q
         li/O1uHTy4gykMYFG5YYmswXxhN8O9R5FcNEHXcQUkZ3+cd/sIijcGb0xq5TCShbnojN
         WIV9PdBpuNJXelOJf0e86wWjVkUU9Dh6dpubhUpeQSUVn1uvsahkr18gXOlmCg1XgfTa
         Th7WodLvDLYrcHsUpHa8YU1aPilTFXSsMJd1xuRvZz/pSkTjSGFL3y3F7rSSSKnL0hBE
         ko8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515661; x=1741120461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=;
        b=QRL4bGrhppKlqYi58W/9scpMy4RhlzzDaPyZKyQdLwgBij0RncwKLE7XflXh23MfY/
         AOFZca8d48KpZP4zf+ht1AvElhBKd1O0CwwrJgPXeppeuFYHynDODhQbFu3SjyPBr5Dn
         p034cLOOlQIw5Qo9J1aG54RHEmboImUk2k6jU2M1qGimP6mLWaoXPeRcWl7o2REvVMu3
         2ULHV9DI3ocMfs3XN9347TVIKXitbDyuulyFTjYIXAiJccC6Ak741WdPx02CWBfGjPJC
         tBhOUStpi0ZLo0w8t8++bx7nZ7d4g/cXc+uTQyO54HqActE/mbXdKKTDc+0dTM+zm5q1
         C4sw==
X-Forwarded-Encrypted: i=1; AJvYcCVx0oHpt8Eil6FPUWfuN6WTU3kEpuWclvexV6BRo3xwvuzPYNolsy/Eg4YpKpZkexiy+Kg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2CvjjAShJnI/rSuQ0vwtUIR4HqhK8eox0T79AsKljEsiuc55n
	YHpoFsA+f4Mh4DCk3gmlAZiWQ2UgJa7cG0YrGRqYzD+Y1NlktHRR
X-Gm-Gg: ASbGncvyMCL6OhlsaTb3I0rHOll9AzWOpZ8z82FfVOtexFTzqzusknGbZrv7rFJ7XNh
	WJUWRiJsQHswnBqzN7itcSw1M20iv8eJjLBB8+2mQrcHnuDKif6ZCK7hQuBKmNhhO0pSmVmEUFO
	vYTVOXnOKpQuo2P2vOBO45vMldDkQ4Sk+9ZtItPGHLLmD0QDSufLVQqAub0b8zncdBcOkVqx3pP
	b8uRxd91iRy8lijcQrZSzJe2fWn3NCCKpTYF00ro9/eeagKDiO7Zk+sSEF2b55HAFsVL4luKlXM
	KYeS1h3G3q7L3BhPUJMcwHhypcl5d4AioUAWHsJlhCuK8C77Xt0PjT3YGKI/1O9jTn2Hz4aa3bf
	XZidsJT1ptxd/
X-Google-Smtp-Source: AGHT+IH4PaS/thx0o4a7besZweYaotUTeodWY36gLy1s0OvXS5nmZXjt97njg+FlwYzzfUDwC/lzFg==
X-Received: by 2002:a05:600c:468e:b0:439:9828:c44b with SMTP id 5b1f17b1804b1-43ab0f3ccddmr50953145e9.14.1740515660513;
        Tue, 25 Feb 2025 12:34:20 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a10fsm37694025e9.37.2025.02.25.12.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:34:19 -0800 (PST)
Date: Tue, 25 Feb 2025 21:34:16 +0100
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
Subject: Re: [PATCH RFC net-next 2/7] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
Message-ID: <qnxvliijwsx7p7xht5mklsbpywgsx5kchsv4gagjmiuphwgoqa@tr2gidpfktxp>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ub7wq6jvawxv6zt3"
Content-Disposition: inline
In-Reply-To: <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>


--ub7wq6jvawxv6zt3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 2/7] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:44AM +0000, Russell King (Oracle) wrote:
> Provide a generic implementation for the set_clk_tx_rate method
> introduced by the previous patch, which is capable of configuring the
> MAC transmit clock for 10M, 100M and 1000M speeds for at least MII,
> GMII, RGMII and RMII interface modes.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ub7wq6jvawxv6zt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KUgACgkQ3SOs138+
s6G1TxAAi/NDxcQZKCI10VHrxMsf1JqDQf5d16ugQYy/sfomsGLksVt7u4qo01eJ
56Nwsp31cLXit8KO6fh7kBhXbkKaozzFKpgvAeTCQyHM7KOmEKrIfrs7oo1fyFdR
brnyzTSp5r301ED3wgPNAwg1lbSOFDX0JhSHF4lrQwkIu7TB7FC0gMlrNVuX4ll1
6Jsi4x3YBtz+7zJh5KWFXlYnaGy2LCaYeR1JJsO5RxHtoL1QriSwcn0v8Z4GuaKN
euINPJQL8ERPhMWzGY9KhUbUyR8CY3q87LBq1+cWzCZ4G5oO7zCKe1nuWuaUMZUR
6eSfVvvpoa1DYRU7hlkllxD8WFE6adoOv9MR+5KUpMxDUN+fpGB+9kFfInnHJeOH
QagK5nVlC+2WiXyfdATHT4Kef8m++YGZPuDeEtBgzHnOZ4IK+zvlsyf69cONycCU
7oOrEmojJxKMK0A3o4/kFNccQNaPB3ZVdoRXJkZvdBjTuRZ2uvpKvYpoRb4bhAmE
CF0avGa67oZSPuTTSizHZinbOmwpUsl6RhBS6rnqsWBohLzE0gGLAtWHs7lkyI4+
wyEduelKoxYTYtcniJXK9RPPT59d5AajwDvEoA3uu3PLLfSY6FKP3Yg1eELMZS4u
0XC+px/bSRP76lDB7td0YPQFcgCAmpRW4bJgB1oK8/OGDNh1V1Q=
=85N8
-----END PGP SIGNATURE-----

--ub7wq6jvawxv6zt3--

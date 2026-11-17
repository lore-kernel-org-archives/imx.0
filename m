Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923444;
	b=0qPq9iwg+RgrW4/KDVbfV+sO1HZp/lzWEfV3+gfemWcXvpPqKfjWq8KeJRe9s8GXuSX6
	 CnwYYdl4nrk567cJ+exIBYzE86A3IX5Wcq5/wv9iQip5V/Y4MYV9rDHSwxI8X4Gdc4jMf
	 jHJYU1TvgCL5xVIBR/HtNTgmCU4Z686LZ54npWvzzsJBWAanmhVpThvo7GkMvzprA3u+V
	 Xm8vXBZEcByNLROppUE6I5RgoIxMXu7U2mmiE4fLcZOeSP5XE0lrRs8F3zAjE6DhpxRh4
	 S/MLHdN6d/a+FE54zvtXN4aW2anR5/mLvzV7LU3u5TqQbdLtqenvANCnT4B+vK0a+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923444;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wmFVfvCnnhAnhNO4rEUhI4H5IUGmRAkPA7MnRyun0Wc=;
	b=gT9KBGIxx9NIbAn0Kg8aSIUCw4daspCYIwQPGMKsNJTl8zoIyKmxW5xIYXBFupFvVpLE
	 cd/ESvCwjCcMMdlJhSviUEn+fiUCI0xTYoVP/pG1zDSincdi0lQMM6GLsl4v7a8Iciufa
	 PA6x9Hu2bHgWi35jWNAJi6pCFIHCOSF7IbHqpUkSKhvYF5HP6pzuhDxq8O5jTt7lXIQnX
	 mH+eDdyynoLnsQYZxVvbEL+cIstukMogm9UmEWKchBjGYFY89o9kVZ0Ss2HpdyrKV+k5A
	 ODdKd9t+WCJJEhOzifKqMSMs/fvPB1Uqcz50BTpl9ngnXWmUv1pIqDr8CeOJiIkpwQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oxUoMaS4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C07606A31C;
	Tue, 17 Nov 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oxUoMaS4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2B61F000C4;
	Tue, 17 Nov 2026 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923444;
	bh=wmFVfvCnnhAnhNO4rEUhI4H5IUGmRAkPA7MnRyun0Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxUoMaS4JxJax7gMzNM29ujPcZ312rmGTno7FlycYRef95xdhYkED8UxMgYIKp7km
	 HPUDBgDyLO6W0a8REVW5VZRdgmeZEZgqv8d/Hc6k+2DknVonUNyHfqetezN0Is2adh
	 9A0XSVQDKBZiL0ZL6aaDIew0V5fYmOs96kcN/LPgL6iQJ4C+r87v8eMv6OOkURnjBQ
	 q0p/z4WoklLbWXQ+SnPQTyyLV/TzGW2fMBXU9Rdlbw134hLX5VfJRKuAjhL8MoAa7s
	 3cYg4A7qo9xBhw9RBxQk52YQ/rhV96VZKOMqRyGsmTe+CPLpsQiqjeUE2e0vTozaNL
	 KN7B2YLVG5J8w==
Message-ID: <sashiko-outbox-218905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: freescale: fsl: Remove undocumented,
 unapproved aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, imx@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:50:43 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: freescale: incomplete alias cleanup in
  fsl-ls1046a-qds.dts
--

commit 54e57023b3aee0e459e326a808c4fb4cbc55b171
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: freescale: fsl: Remove undocumented, unapproved aliases

This commit removes undocumented custom aliases such as dpmac, rtic-,
qsgmii-, sgmii-riser-, rgmii-, and emi1-slot* from several Freescale
Layerscape devicetree files.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm=
64/boot/dts/freescale/fsl-ls1043a-qds.dts
> index e850551b16acb..ea4863c9686c7 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> @@ -24,22 +24,6 @@ aliases {
>  		serial1 =3D &duart1;
>  		serial2 =3D &duart2;
>  		serial3 =3D &duart3;
> -		sgmii-riser-s1-p1 =3D &sgmii_phy_s1_p1;
> -		sgmii-riser-s2-p1 =3D &sgmii_phy_s2_p1;
> -		sgmii-riser-s3-p1 =3D &sgmii_phy_s3_p1;
> -		sgmii-riser-s4-p1 =3D &sgmii_phy_s4_p1;
> -		qsgmii-s1-p1 =3D &qsgmii_phy_s1_p1;
> -		qsgmii-s1-p2 =3D &qsgmii_phy_s1_p2;
> -		qsgmii-s1-p3 =3D &qsgmii_phy_s1_p3;
> -		qsgmii-s1-p4 =3D &qsgmii_phy_s1_p4;
> -		qsgmii-s2-p1 =3D &qsgmii_phy_s2_p1;
> -		qsgmii-s2-p2 =3D &qsgmii_phy_s2_p2;
> -		qsgmii-s2-p3 =3D &qsgmii_phy_s2_p3;
> -		qsgmii-s2-p4 =3D &qsgmii_phy_s2_p4;
> -		emi1-slot1 =3D &ls1043mdio_s1;
> -		emi1-slot2 =3D &ls1043mdio_s2;
> -		emi1-slot3 =3D &ls1043mdio_s3;
> -		emi1-slot4 =3D &ls1043mdio_s4;
>  	};

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm=
64/boot/dts/freescale/fsl-ls1046a-qds.dts
> index 48a6c08fcea82..8c095aafd5968 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> @@ -24,10 +24,6 @@ aliases {
>  		gpio1 =3D &gpio1;
>  		gpio2 =3D &gpio2;
>  		gpio3 =3D &gpio3;
> -		qsgmii-s2-p1 =3D &qsgmii_phy_s2_p1;
> -		qsgmii-s2-p2 =3D &qsgmii_phy_s2_p2;
> -		qsgmii-s2-p3 =3D &qsgmii_phy_s2_p3;
> -		qsgmii-s2-p4 =3D &qsgmii_phy_s2_p4;
>  		serial0 =3D &duart0;
>  		serial1 =3D &duart1;
>  		serial2 =3D &duart2;

[Severity: Low]
Should the emi1-slot* and sgmii-s* aliases in this node also be removed, as
was done for fsl-ls1043a-qds.dts above?

Because the aliases in fsl-ls1046a-qds.dts are sorted alphabetically around
gpio0..3 and serial0..3, only the middle qsgmii-s2-p* group was dropped,
leaving the other undocumented MDIO mux and PHY aliases introduced by
63c396414bfc ("arm64: dts: ls1046a-qds: add mmio based mdio-mux nodes for
FPGA"):

arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts:
	aliases {
		emi1-slot1 =3D &ls1046mdio_s1;
		emi1-slot2 =3D &ls1046mdio_s2;
		emi1-slot4 =3D &ls1046mdio_s4;
		...
		serial3 =3D &duart3;
		sgmii-s1-p1 =3D &sgmii_phy_s1_p1;
		sgmii-s1-p2 =3D &sgmii_phy_s1_p2;
		sgmii-s1-p3 =3D &sgmii_phy_s1_p3;
		sgmii-s1-p4 =3D &sgmii_phy_s1_p4;
		sgmii-s4-p1 =3D &sgmii_phy_s4_p1;
	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117133842.2452=
62-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2943D4FB;
	Tue, 14 Jul 2026 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041287; cv=none; b=PIYOZbp2xK9MzPLuzQhmnkTa3yuK8QBeHlqe8vsS1o/gWXPrisMlfa2nVBPvJG33wDtG+NY0NjBnQXRFeJsYG2SayR7R06rzPdGwSdBKweyaqiiVDTM0HluWFyBiUrhvaJjYeNgzzegj2a1EBE4XGvLC2Rub691cNvevfifaP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041287; c=relaxed/simple;
	bh=zhKUymbyn2XI0RpSVfZER57bToodZaTi8vYChB4P30E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHLon9jn7XZaP6EzQ51uENRqSSGQqCVWFJMomIhr+L/24m1eWeM6FF/jytZ77x3GEbNZVY9MBm0vmjOSIcRwp6HVg7sbxHBW3Y7OPqglNHJIdNJyyQ/C4/CueSKYfU+8b9xmTKVhS65s33VWfoeBOx2m75Zu0pXVV2E1nY88mDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU9kFY2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU9kFY2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D971F000E9;
	Tue, 14 Jul 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784041286;
	bh=ImhKZQMKXk5ZApz5zrH0n0GDyTq3bugLvwuOMGz8W3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nU9kFY2N1ZDSJNcvimDfEKa86meiWwnJ5Hl/QTCYWabRmrW1StFQqQjp6y21+uOdw
	 lv1YRr2kQrBYsgdwiSLSae6IqhSH4BooDYng1o3Xtn+S0EU0eWUT9BiDfefFDEeuoI
	 SDsz85D17qUwd452+O3agaU9MDPowOibu3TZMmJSpOQSKZxZhmAflUDo7Vwsr//eIA
	 vYwA/YSDvj77zMTwIRn8ireeTnIVhOVklBJpYvO3dEM0p3HBYqmD6Ez00K6wIlM0oz
	 suNaKpmeSHv4ZZFnT7xyud3bFa1M5TCPZAoXEi4+b4wyrmfXcm2Y3K1gtOA9H4085f
	 JXQnZVcWBhluQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
References: <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 15:01:25 +0000
Message-Id: <20260714150126.09D971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unreferenced 10G SFP regulator will be unconditionally disabled =
by the regulator core.
--

--- Patch [1]: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca ---
commit b7aa596cf679be039938abc33965834ed28f5c60
Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>

arm64: dts: add tqma9596la-mba95xxca

This adds support for TQMa95xxLA modules, designed to be soldered
on a carrier board. MBa95xxCA is a carrier reference board / starter kit
design.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts=
 b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> new file mode 100644
> index 0000000000000..1d745d66997cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts

[ ... ]

> +	reg_3v3a_10g: regulator-3v3a-10g {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3V3A_10G";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander2 15 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us =3D <2000>;
> +		enable-active-high;
> +	};

[ ... ]

> +	sfp_xfi: sfp-xfi {
> +		compatible =3D "sff,sfp";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_sfp>;
> +		i2c-bus =3D <&lpi2c7>;
> +		maximum-power-milliwatt =3D <2000>;
> +		mod-def0-gpios =3D <&expander1 3 GPIO_ACTIVE_LOW>;
> +		tx-fault-gpios =3D <&gpio2 30 GPIO_ACTIVE_HIGH>;
> +		los-gpios =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
> +		tx-disable-gpios =3D <&expander2 2 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: Medium]
Will the 10G SFP regulator be turned off by the regulator core?

The reg_3v3a_10g regulator is defined without regulator-always-on, and the
sfp_xfi node seems to be missing the vcc-supply =3D <&reg_3v3a_10g>; proper=
ty
to link the SFP to its power source.

Since it lacks consumers, won't the regulator core automatically disable th=
is
unused regulator at the end of boot and unconditionally turn off power to t=
he
10G interface?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714143154.7878=
25-1-alexander.stein@ew.tq-group.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6231CD1E4;
	Fri,  3 Jul 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090847; cv=none; b=hlNRwt2Cvei7Wqf4ATmlQsCj8FyRnzUJoEz44nmHDeCxPvX6eSxFiD4ehozDiOf11M8Mvje5ydq9GrAn9tNJAhFXs+pIH/SoLUFpQVAe3m6dxoGSyN2UpctaJ4Yc13+5TTkZQpQpM401DM1c/6H9ZxS/KFxjt8q0i+Sl8iNz2cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090847; c=relaxed/simple;
	bh=sNrXTrOlExO1YdFrGnDjUpRBIy/Zo5hygxKbO575b1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ju8fn0D/L2IQNclktcafNBG7j66HziGrYXy6PnWsU996rwPN3+sAQ2V0HtihKp7V9uQrcS3Co4hbPl4mLhE90BzoF29W6DxHk1gdNvTDApJg52Mw0CzEBhosCntCUPJTYFKGCLvlYpv83DHMFe1Qco+pV9MRFCSNHQY5YypllHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5xE219E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5xE219E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971DB1F000E9;
	Fri,  3 Jul 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783090846;
	bh=TfcbdupBAy3B/BO8CtatzQ/bunBeI+zhBkmksX3kLSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C5xE219EAA5v8yXvL8HFv2lx3YP4pKKLLFIOJhjjwfKG7zzfwPmg82K0JecJIDuTd
	 SZdnn4UcVpnWG95fnQpCKwtlAfjyjJnezLRLns9HIskgvKGCmRZ7eVY145C7CjHUN5
	 sC8W7hZoQbpheW/nXx/uoEVFajAQ/b0lqdg6IFuJc3jMe88SOFgK5SSFh3yzdkfjok
	 gTyYC7N2iNR/jF/9XUU3HO+2tt6nIS4IyYTJ0dD3zzinWvSsGVs56RY33dqUPbCbzy
	 BVNIqOizERq219y1X3RglyF3TBj0FAspP5TWn7LetSkFO/XuXB4lREC7ez4VK8VH/U
	 pA4r64Hfw6Ucg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx95-var-dart: enable
 NETC block control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703144922.231608-1-stefano.r@variscite.com>
References: <20260703144922.231608-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 15:00:45 +0000
Message-Id: <20260703150045.971DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing dependency for `netc_blk_ctrl` causing a potential system =
hang on boot.
--

commit 14e353bd1da7516058662c0b4b79b720409b4211
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx95-var-dart: enable NETC block control

This commit enables the NETC block control node on the DART-MX95 SoM,
which is necessary for the NETC Ethernet ports to function.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm=
64/boot/dts/freescale/imx95-var-dart.dtsi
> index a20fadacaa6d8..7c29082a40c5b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
> @@ -176,6 +176,10 @@ &mu7 {
>  	status =3D "okay";
>  };
> =20
> +&netc_blk_ctrl {
> +	status =3D "okay";
> +};
> +

[Severity: High]
Does missing the netcmix_blk_ctrl dependency here risk a system hang on boo=
t?

The nxp,imx95-netc-blk-ctrl driver maps the netcmix memory block and writes
to it unconditionally during probe. Accessing this region safely requires
the IMX95_CLK_BUSNETCMIX bus clock to be enabled.

Since that clock is exclusively requested and managed by the
nxp,imx95-netcmix-blk-ctrl clock controller driver, leaving netcmix_blk_ctrl
disabled means the kernel won't enable the required bus clock.

If the bootloader leaves the clock off, this will crash with an SError /
asynchronous external abort during netc_blk_ctrl_probe(). Even if the
bootloader leaves it on, clk_disable_unused() might turn it off later,
crashing the system on any subsequent accesses.

Should netcmix_blk_ctrl be enabled alongside netc_blk_ctrl to satisfy this
hardware dependency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703144922.2316=
08-1-stefano.r@variscite.com?part=3D1

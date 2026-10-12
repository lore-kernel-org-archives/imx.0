Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3B43CE58;
	Mon, 12 Oct 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788492; cv=none; b=ERhr007w75AdIwKEO5rf9ZBpSkrGLmRurqsIclGfmC5R3wIYJVmSmN7Wed2T6TYQWVAkptNW7pCGLUKMsJ9Mg/CfHW+rknLt4bA1Ms1XsfBdPyE9OqZTvkpDDa9enGAR2kToHTMgFSAWkPfGFIZUMJmTm/H13VGPOa8/EMHYc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788492; c=relaxed/simple;
	bh=g4bC95k/83YDAhQySELPrFvvlVbK4HTHelRMPJQ/tss=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ecsAVm5yBQlwEY30+1l5PXa0oherFRbu9wS/Bp3Wfwd0vaRLalawy6GzA9DozrgjnHOWhtcTAWAOYbCKvfiAwhGVM1WHSm33znoKeZA8k6cPLPFaaqlf1H1mX8MSA++nYi8VWyLXZePZhEsr0BmFFY00weJ+8NYnKQ2SRe3wALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2kRR14Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2kRR14Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799901F0089C;
	Mon, 12 Oct 2026 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788490;
	bh=Q+rhVFXjcCRwUhLz1zsT4v7aj7XIDp3JgKgImaUAzWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i2kRR14YMdaGSvFlZYDf9/hB9g3zynzMH1hV7uIOoUSDwYzja4+k7lGjYhMu9qW5F
	 QUKz9dm5jW68fM/EQJAU0ecoGUZIbnp0YjCnRPScADoLizrn5QhwHG3buq0kAfakOg
	 Tg9TWh6VvpvY93cMjcbR5HAZXEgzjyZ0i3vNHW64DPCG22ZQahUKVDuu/luJypWX6Y
	 /OKAgGX6CZGfoahlRdiRl3GHQDaBwfVfo1Yf/n1UJccok4V42RyxkKCuvk2aEDWtpM
	 fkJ15aSdA2sAiPHP6sFQEsfklH7eNHINk7V2KAGY/2q+a3eqeN5auitFvWgDSXvCX/
	 rJj3A0jjHRJJA==
Message-ID: <sashiko-outbox-167770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-frdm-pro: add boot phase
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm9zZXBoIEd1byAoT1NTKQ==?= <qijian.guo@oss.nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
References: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:01:30 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: Missing bootph-pre-ram for gpio3 breaks early SD card access
--

commit dc22078eb20524e315ef0d520678ff9336ed179e
Author: Joseph Guo <qijian.guo@nxp.com>

    arm64: dts: imx95-19x19-frdm-pro: add boot phase properties
   =20
    Add boot phase properties to essential resources during boot phase.
   =20
    FRDM-IMX95-PRO need UART, SD-Card, eMMC access during boot process.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arc=
h/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> index 1f62d729a5e77..8dc1134f8d24d 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> @@ -180,6 +180,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		regulator-min-microvolt =3D <3300000>;
>  		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> +		bootph-pre-ram;
>  	};

[Severity: Medium]
Will this regulator be available in the SPL phase without adding bootph-pre=
-ram
to the gpio3 node?

Since the fdtgrep tool extracts nodes tagged with bootph-pre-ram but does n=
ot
automatically trace and retain phandles for nodes lacking the tag, the
gpio3 controller node will be entirely stripped from the SPL device tree.

Could the gpio3 node also be marked with bootph-pre-ram so that
reg_usdhc2_vmmc can resolve its GPIO dependency?

[ ... ]

> @@ -996,6 +1008,7 @@ &usdhc2 {
>  	pinctrl-3 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>  	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
>  	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +	bootph-pre-ram;
>  	status =3D "okay";
>  };

[Severity: Medium]
Similarly to the regulator, usdhc2 relies on gpio3 for card detect during t=
he
boot process (cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>).

If the gpio3 node is missing from the SPL device tree, will usdhc2 fail to
probe during early boot because it cannot resolve the cd-gpios property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-bootph-frd=
m-imx95-pro-v1-1-6757c5f04a17@nxp.com?part=3D1

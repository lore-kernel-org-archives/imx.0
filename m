Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8F417BDB;
	Fri, 14 Aug 2026 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692631; cv=none; b=pTd2iS1CQ/V5eVQHQ81lTIPECl10hUaIU6lk543jVpP3HoutiS4uxUioxeA6skczV6TW6aiXp+gXJx0rY38W/vbrhkJctfZVSou9w9pgpCwFDnn/q4BphS5niCMSABULxqsvwZyINAJ1+uDD0SK1iNx9/9FfSUB+REg7D5wTcBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692631; c=relaxed/simple;
	bh=wOvzelKoy9aZ4VWnbJr+FS/TviYluQTGlQ2hE5QWMd0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T1OBxl6Iu4PjaH0X1phIcHXlu+VaoxXUus8n1b3GVC6fVMVyOWwBDcZ7Y4XVm0JEbgHXCZs/GWd8NkF4K7tgrjUXEFnxeIJq9pXW/KhlRTTDv4tkMHxnxCRDOMzcbBp5jBdl1Q8S+lk4cbzrIX/9Mqi06TSZ660HNtgf0b91yiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FadpztLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FadpztLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4F21F000E9;
	Fri, 14 Aug 2026 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692626;
	bh=UQedycFrWv9lBgmJONnaro5GPQfFG+tknJ5QD8cjHkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FadpztLztI1nfFA7zN0x7aPTkGCakVPh2mNlaN7ng1zYOAW9dbf6lqtonwTmb7Opr
	 jwEA4wA3sRAlJhjGGZwbLmUr4ssOJku0RfNVpD2obGA4ZHrosTmp672IdOuQGkqQup
	 DNTP1bAjOREp5YrzIbaqvHmMhrmvyoGapkP4rMgVCGXJCNmm7yMYm9Xs9Ht0uWv3i4
	 wXTXkNoufYaFFapkvSEre1ZVfUJP9x5Zc+YkvvBnJU1Fx8T/GHb4+AXPhZTHYkl52e
	 i8pActROUcUW1cDOwtlsKHb+bGnzoF0V+PheVaiLXxpm4RqWTVqXl5wmbVKGbNs/C8
	 6dw+FpmwqFsRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/17] arm64: dts: imx91_93_common: Add clock and
 sound-dai-cells properties for MQS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260814072022.4064009-2-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-2-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:30:22 +0000
Message-Id: <20260814073023.0B4F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete refactoring leaves duplicated property definitions in=
 board files, mismatching the stated commit intent.
--

--- Patch [1]: [PATCH 01/17] arm64: dts: imx91_93_common: Add clock and sou=
nd-dai-cells properties for MQS ---
commit 3f3b7186dd0d4a7ad6f02447032fc2e5538b3ca5
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for M=
QS

This commit adds the mclk and #sound-dai-cells properties to the mqs1 and
mqs2 nodes in the common imx91/93 dtsi. The intent is to define these fixed
SoC integration properties centrally rather than duplicating them across
individual board files.

> The "mclk" clock provides the MQS oversampling clock, and #sound-dai-cells
> describes the node as an ASoC DAI provider. Both are fixed SoC integration
> properties rather than board specific, so add them here in the common dtsi
> instead of duplicating them in each board dts.

[Severity: Medium]
The commit message mentions adding these properties here instead of
duplicating them in each board dts. Should this patch also remove the
existing duplicated properties from the board files?

It appears clocks and clock-names are still defined for the mqs1 node overr=
ide
in arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts:

&mqs1 {
        clocks =3D <&clk IMX93_CLK_MQS1_GATE>;
        clock-names =3D "mclk";
...

These duplicate properties also still exist in the mqs1 node override in
arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts.

> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/ar=
m64/boot/dts/freescale/imx91_93_common.dtsi
> index a1a7e6a0571bd..a68ffd04ee084 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -100,13 +100,19 @@ gic: interrupt-controller@48000000 {
> =20
>  	mqs1: mqs1 {
>  		compatible =3D "fsl,imx93-mqs";
> +		clocks =3D <&clk IMX93_CLK_MQS1_GATE>;
> +		clock-names =3D "mclk";
>  		gpr =3D <&aonmix_ns_gpr>;
> +		#sound-dai-cells =3D <0>;
>  		status =3D "disabled";
>  	};
> =20
>  	mqs2: mqs2 {
>  		compatible =3D "fsl,imx93-mqs";
> +		clocks =3D <&clk IMX93_CLK_MQS2_GATE>;
> +		clock-names =3D "mclk";
>  		gpr =3D <&wakeupmix_gpr>;
> +		#sound-dai-cells =3D <0>;
>  		status =3D "disabled";
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D1

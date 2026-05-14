Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083E37FF74;
	Thu, 14 May 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778185; cv=none; b=Eht4i5tlQIUfK8NCewnLzaJW8Ittuto67eXEjhKHiykj4Q8ajOyD+i4V5OOQ9PRFRtLpvmRRVLH5OJcr4r/5P1iN5zKHA1C0tWRRE1bFXbmDdRjoeBLeh3ZutfAQzdX9ldyBYAwQKhTR0D2N5L5Bs0xjz2lN6jBIiLKs8EXR/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778185; c=relaxed/simple;
	bh=YGbFkeB67cXBnD6gXxxQcrXQaTaB64pkM6u2Iug35R8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+A7MatU4mKhb8+Y6XLYeQFO0vxs0/LgzTXoSKXlRwzEGEv48H09+upOxL5/k7yeVbqbjS7KozhTe+s25qGLB4iKtXZ+X4fkjZqwLfvTeXRudTvLiO8L2Ngz8OsygFjWdRs0KA0aTSU6XBNEoV3Guhg5sy3l/cy2/8Za7KBiFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAT0kZ7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAT0kZ7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADE1C2BCB7;
	Thu, 14 May 2026 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778778184;
	bh=YGbFkeB67cXBnD6gXxxQcrXQaTaB64pkM6u2Iug35R8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NAT0kZ7dXqMcowdXwgSJ6kqDv0/v6a7E41HDuER7VfVCVXoJzbJHbUclUork5zMcJ
	 Nob+p0oAjrIbM5BN0810UicTg4QyiARFDDOE8I8AgowKNoGw5FAprAkQrSvJxxuZga
	 izAP7gRjPaV4j4w6cB5jgycuBjWcI+zzsEjWaO1YVcNDRktUAcY4AhnSYkckn7Awcu
	 /6ga2G7DO2VEPNVxleRJkLPZW8WZ8SSl8A0xwNNm20+eR8Q+xYvihEeLbxC91Ke8g3
	 DSTG1ugc0Myn7N3xVwew7dUFg9l/2ub8yIOtgoiCRiX+ZpWUIiTcmFIYIWlA1WnMk7
	 2tqdpcM81AjmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add SAR ADC support for s32g2
 and s32g3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 17:03:03 +0000
Message-Id: <20260514170304.7ADE1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ADC1 is incorrectly configured to use `edma1` instead of `edma0`, =
breaking DMA routing.
--

commit 3b1b0b80a34f00191fc6241e0894c052fd88edf8
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3

This commit adds ADC0 and ADC1 node definitions for the S32G2 and S32G3 SoC=
s.

> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12deb..6f1952fbbcfee 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi

[ ... ]

> @@ -717,6 +727,16 @@ i2c4: i2c@402dc000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc1: adc@402e8000 {
> +			compatible =3D "nxp,s32g2-sar-adc";
> +			reg =3D <0x402e8000 0x1000>;
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 0x41>;
> +			dmas =3D <&edma1 1 32>;

Is it possible this should be routing to edma0 instead of edma1?

It appears that other peripherals in the 0x402xxxxx memory range use DMAMUX=
 1
on the edma0 controller (e.g. <&edma0 1 ...>). Since the hardware DMA reque=
st
lines for ADC1 are wired to the first eDMA controller's multiplexer, assign=
ing
it to edma1 could result in silent DMA failures and timeouts during ADC1
operations.

> +			dma-names =3D "rx";
> +			status =3D "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible =3D "nxp,s32g2-usdhc";
>  			reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d0..5cfb37c1216a7 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi

[ ... ]

> @@ -792,6 +802,16 @@ i2c4: i2c@402dc000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc1: adc@402e8000 {
> +			compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
> +			reg =3D <0x402e8000 0x1000>;
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 0x41>;
> +			dmas =3D <&edma1 1 32>;

Does this have the same eDMA controller routing regression as adc1 in
s32g2.dtsi above?

> +			dma-names =3D "rx";
> +			status =3D "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible =3D "nxp,s32g3-usdhc",
>  				     "nxp,s32g2-usdhc";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514082639.1181=
240-2-khristineandreea.barbulescu@oss.nxp.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9943E349CDA;
	Thu, 14 May 2026 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737336; cv=none; b=NY4RTr7KKnHFmHCbe0rJcYgQkAgci7U3KUv04Pm8PtHIUhMpm6aft0rmifBLj6RaCz7LQ66UUwGEnMN4pPXFq5m77zJUjDDpJahCxqsQKk9ampJdfiDQt8t9fx/85/VZfNzCip1rRHYXnB3aCiXsQG9z+SvH51cL4GGoEHfRr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737336; c=relaxed/simple;
	bh=Tgej46Oe3U/Kml+LbFnk+xFF7f6p0Xm+8Da/y/+dJPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gnU3PIWZeKzyAMnylj8RLhgNCYdLdVV922xBAgcBAGFSWEmUkzP9E/FwoKq7u4oxNh4WL6I3tQ6IIGnbHxewGELQMrOi8Sgr7h7AjMmr5KzWSvBZzhVgyf/h+G3UfHzZUKlGM62yw7VPQx/I9zOOvlLk1+7/Q/o84uu+kFcE8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qy4Nmy3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qy4Nmy3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51B7C2BCB7;
	Thu, 14 May 2026 05:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737336;
	bh=Tgej46Oe3U/Kml+LbFnk+xFF7f6p0Xm+8Da/y/+dJPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qy4Nmy3mH9ViXVxMYw98D5cy1ywv9hoZjpOsZ9lYGju8dM+OQzultXYnCZ8jS4nsX
	 noW1Z0S1tbOzVn07llm66TguI+QUxqGpRqzeHi7KijZU3bqGW3zMCm0N7NNdNB50Md
	 3Mt+d80KcHu+QUY5/L9erH6oJCaSK1BVapRFL1zmc3wH7MAqW1RTZZGGP/e/90nCiT
	 od2Hd2MGiOoAEASnoBBT7yL8AReU78UNf0GFPKf9KeExCu36iAIK6IHWYd5yY6r2Lt
	 5FyYW7VTZagT0J8lJDjVwxKtaXh4URzXZfG/3BIIAgADORoNPOxIN/NooEpTIqmo1E
	 ZIbzd9T6s5m+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: s32g: add SAR ADC support for s32g2 and
 s32g3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513142948.640057-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260513142948.640057-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:42:15 +0000
Message-Id: <20260514054215.E51B7C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The 'vref' property included in the 'adc0' and 'adc1' nodes violate=
s the devicetree binding schema for 'nxp,s32g2-sar-adc' and will cause 'mak=
e dtbs_check' failures.
- [Low] The 'adc1: adc@402e8000' node is placed out of order by unit addres=
s in both 's32g2.dtsi' and 's32g3.dtsi'.
--

commit 7673e90a3952520a499f13a94f36f7b0fd2320e8
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3

This commit adds ADC0 and ADC1 nodes for S32G2 and S32G3 SoCs.

> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
[ ... ]
> @@ -554,6 +554,28 @@ i2c2: i2c@401ec000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc0: adc@401f8000 {
> +			compatible =3D "nxp,s32g2-sar-adc";
> +			reg =3D <0x401f8000 0x1000>;
> +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 0x41>;
> +			dmas =3D <&edma0 0 32>;
> +			dma-names =3D "rx";
> +			vref =3D <1800>;

Does the vref property violate the nxp,s32g2-sar-adc devicetree binding
schema? The schema sets additionalProperties to false and does not define a
vref property, which will cause make dtbs_check failures. The standard
practice is to use a vref-supply phandle rather than a raw integer value.

> +			status =3D "disabled";
> +		};
> +
> +		adc1: adc@402e8000 {
> +			compatible =3D "nxp,s32g2-sar-adc";
> +			reg =3D <0x402e8000 0x1000>;
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 0x41>;
> +			dmas =3D <&edma1 1 32>;
> +			dma-names =3D "rx";
> +			vref =3D <1800>;
> +			status =3D "disabled";
> +		};
> +
>  		swt4: watchdog@40200000 {

Should the adc1 node be placed after the swt4 node to maintain ascending
unit address sorting? 0x402e8000 is greater than 0x40200000.

> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
[ ... ]
> @@ -617,6 +617,28 @@ i2c2: i2c@401ec000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc0: adc@401f8000 {
> +			compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
> +			reg =3D <0x401f8000 0x1000>;
> +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 0x41>;
> +			dmas =3D <&edma0 0 32>;
> +			dma-names =3D "rx";
> +			vref =3D <1800>;

Is this vref property intended? Similar to the s32g2.dtsi file, this will
trigger schema validation errors.

> +			status =3D "disabled";
> +		};
> +
> +		adc1: adc@402e8000 {
> +			compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
> +			reg =3D <0x402e8000 0x1000>;
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 0x41>;
> +			dmas =3D <&edma1 1 32>;
> +			dma-names =3D "rx";
> +			vref =3D <1800>;
> +			status =3D "disabled";
> +		};
> +
>  		swt4: watchdog@40200000 {

Does this adc1 node placement also violate ascending unit address sorting
rules here in s32g3.dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513142948.6400=
57-2-khristineandreea.barbulescu@oss.nxp.com?part=3D1

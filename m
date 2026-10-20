Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536644;
	b=YCxD0w6qlxHWVXtCLup3J8lkaSmU+CxBtPiqqec1yq1FnzKAncjsoEzI1yQrNbNT/+eU
	 7VafhutjY6d/tFGtlFKAOrNn5F7n09jBj9X3RfpVd5ctjlzP6ECMv79FgtPBBasXEVBFa
	 nvm+87aVConsUIyBdGB6hzwgqDKKpt4WYHDj+OYLhKZbPXS5f1YGGkvy/6J/CIyGKjosu
	 P3uamkQg/6o37Q/Ko7MGzBKEIqZ6gVNWCyV9brIxi/3E1L0tjJjtq761r3+SZHkrWx7af
	 eekg5S6Zc9vBKKBfdcnt9sHaKcC7Bmz4n8gkRgsvqgsX4gDnr0cNdfplt8pqkuEd6IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536644;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2GOH7mXarglmENabRvw20M2lBiWKpshFtyUnlHT7A6Y=;
	b=Tap/Ue1g8Cc5Cfl1uWOINPNOeLM5+EZUQzidit3DW+Ari/0ASqUx8H+zkWF/Ig+kkdWL
	 tHj0tgb4go945o0BR9cl2zCY2Jz6y0zWjwz9T+tICxklbXjcamI7eVQhG0ROPtq0Q61jv
	 M/RxmaCg1KCE0oTCj/mFSzi6QFxo8HwXaEmI/IuyVg4KNW1EhxXh8xzJVRSfViaNCjafB
	 1iFX9yx2bOPOg7HzdgPMgxVKrBwtCEuP+rV4scTG44MKApK+Y058ij8Ip5GSsJK2iXgJ2
	 CDsUTDxD7GMJxbrJ/ZlFENE0b93t63WXTzTNuiPGSuGmsU5AlJdteTvUMqvb2odcJiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6ZLrLVg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA5606A31D;
	Tue, 20 Oct 2026 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6ZLrLVg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D545A1F000C9;
	Tue, 20 Oct 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792536644;
	bh=2GOH7mXarglmENabRvw20M2lBiWKpshFtyUnlHT7A6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6ZLrLVgEJ3IYOE1v/68J4dKPQAIz1E9KKAwh/I8P2uMS3roNIZqTTpg/5AJCN8S0
	 +MI9Yq/hEr6kWFoxmG4OV4PQBQUOrCY65yRIP01eFDCC2RybHekbix1WLUapzhbKx4
	 x/RVkrsLwNXFa9VKEMgfrMCnA/nqiJXJjj4HaarKo/wRRFl2AADzaRiApWCBuji2LG
	 fCeIRz/+uBRR21klBvqQECWhGF+EtirxhKSIX+kGbObh78oTok1dK+FI73ywLqjGcL
	 DXD6F+ddA5Y4f+na30rzSVC3zU9FKfEAg9anqjG8DecooJSJH3uuy1f9+GBEcjz+Jg
	 /4HEjvXd0e/8A==
Message-ID: <sashiko-outbox-179581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] arm64: dts: imx8-ss-dma: Add lcdif support for
 i.MX8QXP and i.MX8DXL
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261020-dxl_lcdif-v3-4-adc944659e14@nxp.com>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-4-adc944659e14@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:50:43 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: imx8: missing adma_lcdif and lcd_clk_lpcg deletion o=
n imx8qm
--

commit 90895a7ff82b0903e1aaa5301959b704913e49e1
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8-ss-dma: Add lcdif support for i.MX8QXP and i.MX8DXL

This commit adds the adma_lcdif and lcd_clk_lpcg device tree nodes to
imx8-ss-dma.dtsi for i.MX8QXP and overrides the compatible string, clock
rates, and interrupt in imx8dxl-ss-adma.dtsi for i.MX8DXL.

> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/=
boot/dts/freescale/imx8-ss-dma.dtsi
> index 4de78f870c05c..87082c3fa9338 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> @@ -149,6 +149,24 @@ lpuart3: serial@5a090000 {
>  		status =3D "disabled";
>  	};
> =20
> +	adma_lcdif: lcdif@5a180000 {
> +		compatible =3D "fsl,imx8qxp-lcdif", "fsl,imx6sx-lcdif";
> +		reg =3D <0x5a180000 0x10000>;
> +		clocks =3D <&lcd_clk_lpcg IMX_LPCG_CLK_0>,
> +			 <&lcd_clk_lpcg IMX_LPCG_CLK_4>,
> +			 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>;
> +		clock-names =3D "pix", "axi", "disp_axi";
> +		assigned-clocks =3D <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
> +				  <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>,
> +				  <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>;
> +		assigned-clock-parents =3D <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL=
>,
> +					 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_BYPASS>;
> +		assigned-clock-rates =3D <0>, <24000000>, <804000000>;
> +		interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains =3D <&pd IMX_SC_R_LCD_0>;
> +		status =3D "disabled";
> +	};
> +
>  	adma_pwm: pwm@5a190000 {
>  		compatible =3D "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
>  		reg =3D <0x5a190000 0x1000>;
> @@ -298,6 +316,17 @@ uart3_lpcg: clock-controller@5a490000 {
>  		power-domains =3D <&pd IMX_SC_R_UART_3>;
>  	};
> =20
> +	lcd_clk_lpcg: clock-controller@5a580000 {
> +		compatible =3D "fsl,imx8qxp-lpcg";
> +		reg =3D <0x5a580000 0x4>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
> +			 <&dma_ipg_clk>;
> +		clock-indices =3D <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
> +		clock-output-names =3D "lcd_clk_lpcg", "lcd_ipg_clk";
> +		power-domains =3D <&pd IMX_SC_R_LCD_0>;
> +	};

[Severity: Medium]
Should arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi also delete
&adma_lcdif and &lcd_clk_lpcg?

arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi is included by
arch/arm64/boot/dts/freescale/imx8qm.dtsi:

	#include "imx8-ss-img.dtsi"
	#include "imx8-ss-dma.dtsi"
	#include "imx8-ss-conn.dtsi"
	...
};

#include "imx8qm-ss-img.dtsi"
#include "imx8qm-ss-dma.dtsi"

i.MX8QM does not have the adma_lcdif peripheral or the IMX_SC_R_LCD_0 and
IMX_SC_R_ELCDIF_PLL resources (which are omitted from
imx8qm_clk_scu_rsrc_table[] in drivers/clk/imx/clk-imx8qm-rsrc.c).

For the companion adma_pwm and adma_pwm_lpcg nodes,
arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi explicitly removes them
(added in commit e07c4c0a5972 ("arm64: dts: imx8: delete pwm nodes in dma
subsys for imx8qm")):

/delete-node/ &adma_pwm;
/delete-node/ &adma_pwm_lpcg;

Without deleting &adma_lcdif and &lcd_clk_lpcg in imx8qm-ss-dma.dtsi, all
i.MX8QM and i.MX8QP device trees inherit both nodes, and lcd_clk_lpcg
(clock-controller@5a580000) is enabled by default.

On i.MX8QM, does this cause U-Boot resource partition ownership warnings
and cause Linux probing of 5a580000.clock-controller to fail power domain
attachment in imx_scu_add_pm_domain() -> imx_scu_pd_xlate() (-ENOENT) and
clock lookup in imx_clk_scu_alloc_dev() -> imx_scu_of_clk_src_get()
(-ENODEV) for IMX_SC_R_LCD_0?

> +
>  	adma_pwm_lpcg: clock-controller@5a590000 {
>  		compatible =3D "fsl,imx8qxp-lpcg";
>  		reg =3D <0x5a590000 0x10000>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-dxl_lcdif-=
v3-0-adc944659e14@nxp.com?part=3D4

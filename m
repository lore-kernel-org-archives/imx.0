Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564258;
	b=d9u47SXe6hpj3GXjfB1Q+IiNslvofjh0XuMdK1ZNskVaqxjx13LaA5uZFiCbYQytYXto
	 LBROuWMyVsGTxHFomT3JfDW+kSM1OeijyOZv9nnn/4qPnUq/VXNu2PLOCEn12bj0nnuZo
	 NLYwYy8fQsNbfg1HeZiW3n4jtOweBOlsPSruY7G0AD+0Q7o/TZySRi6dFUmu94yo7mVCj
	 Ipi1qlT7X/uisquB4UU/exnH32K6ka4RlCwsBfykM5ayD9238UBy1XjSOLDPm8IJs1LVS
	 EUC0WgTwdrDRx8zoSX/dvQdVImBAPazH8vY2V8wLtxaUACfsBnbZabF4nhjCRSmJd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564258;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nWcrASPBn8pnf+hzTwSmfuYEIY/HgAsgp1V6nelmFD4=;
	b=unCUG423kwMcGK8LfezQO79EMyq2sAtqT5cTkx1lsxyth3Q1sUuU+LdUfJqHdrVYM8cI
	 UyVUogG6Qknmc2Vw5VjOiWWg2v0E9rrc/YJH9b7kxjVzpy0/jk219B/+gzo/ZT0XUuwJ4
	 ajK27x9p8dZxbaJwhhzp3L3YTqPEmSAsozp714tAcUA+OGagsuzZdC5KmsEIf1YOYPteU
	 FtG8edp9jU934aS/+Fr3wHqxjIn9Jz/LDSetIeDADvpuka9uXMSaP/3A5daX50L7TWMTq
	 WAfyLwVqc++IvIIjol3CofbANf9ibSLBr4bq62Kfhxe7VVcwtX0z3NDZEDfdJCiN6Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9VIh10l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AC3606A324;
	Sun,  1 Nov 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9VIh10l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC191F000C1;
	Sun,  1 Nov 2026 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793564257;
	bh=nWcrASPBn8pnf+hzTwSmfuYEIY/HgAsgp1V6nelmFD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N9VIh10lTkVlGK97cnbls45ZJeg/cXyUZi0IwWkxZJcByT0zh6bgaA9TKXYC1qbrv
	 qUCD/mHwSPcEqFc0JzFMh3WRHsDzyLXbWEZcCaAqxGvJwdDCm+W/pLePlUEw+R4V3C
	 hv2wwvadKWpgR29cnlIfeR395yUbZR1Cko4jST8a5EOiaXjshnRTznLPnCSuAGWcg0
	 RLjpOKuQnqUp/rSqu+hN8k2gr8sRGNg9V7dLGRDD/spG0hnzq03LEoEtbHstfhvbir
	 sxCjYqrThWMgqUKUpULHwTX8FnSizGmvxdcgNHuro2rKdF3AAEo1DUNu0v7X/l2stM
	 WS6wD4hk+bm/g==
Message-ID: <sashiko-outbox-192661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: imx91_93_common: Enable BBNSM NVMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20261101200140.141642-4-wahrenst@gmx.net>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-4-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 20:17:36 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: imx91_93_common: invalid #address-cells/#size-cells =
on bbnsm_nvmem
- [Medium] nvmem: imx-bbnsm: select MFD_SYSCON instead of REGMAP_MMIO in Kc=
onfig
--

commit 0a2632d30940d432e106da0e2de92818ce87b154
Author: Stefan Wahren <wahrenst@gmx.net>

arm64: dts: imx91_93_common: Enable BBNSM NVMEM

This series adds devicetree bindings and an NVMEM driver for the i.MX9
Battery-Backed Non-Secure Module (BBNSM) general purpose registers, and
enables the BBNSM NVMEM node in imx91_93_common.dtsi.

> diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Docum=
entation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> index b1ade64a15541..4c4b7c3fff2a2 100644
> --- a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> @@ -31,6 +31,20 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  nvmem:
> +    type: object
> +    $ref: /schemas/nvmem/nvmem.yaml#
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx93-bbnsm-nvmem
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
>    rtc:
>      type: object
>      $ref: /schemas/rtc/rtc.yaml#
> @@ -88,6 +102,12 @@ examples:
>          compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>          reg =3D <0x44440000 0x10000>;
> =20
> +        nvmem {
> +            compatible =3D "nxp,imx93-bbnsm-nvmem";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +        };
> +
>          bbnsm_rtc: rtc {
>              compatible =3D "nxp,imx93-bbnsm-rtc";
>              interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/ar=
m64/boot/dts/freescale/imx91_93_common.dtsi
> index a1a7e6a0571bd..12a505a2c1546 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -357,6 +357,12 @@ bbnsm: bbnsm@44440000 {
>  				compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>  				reg =3D <0x44440000 0x10000>;
> =20
> +				bbnsm_nvmem: nvmem {
> +					compatible =3D "nxp,imx93-bbnsm-nvmem";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <1>;
> +				};

[Severity: Medium]
Should the nvmem schema in Documentation/devicetree/bindings/mfd/nxp,bbnsm.=
yaml
use unevaluatedProperties: false instead of additionalProperties: false, and
should #address-cells and #size-cells be dropped from both the binding exam=
ple
and bbnsm_nvmem in arch/arm64/boot/dts/freescale/imx91_93_common.dtsi?

Because properties.nvmem in Documentation/devicetree/bindings/mfd/nxp,bbnsm=
.yaml
references /schemas/nvmem/nvmem.yaml# via $ref and specifies
additionalProperties: false with only compatible listed under properties, a=
ny
other property inherited from nvmem.yaml (such as #address-cells, #size-cel=
ls,
or nvmem-layout) is rejected during dt_binding_check and dtbs_check.

In addition, imx_bbnsm_probe() in drivers/nvmem/imx-bbnsm.c registers the
device without setting add_legacy_fixed_of_cells:

drivers/nvmem/imx-bbnsm.c:imx_bbnsm_probe() {
	...
	priv->cfg.stride =3D 4;
	priv->cfg.word_size =3D 4;
	priv->cfg.size =3D gpr_words * sizeof(u32);
	priv->cfg.reg_read =3D imx_bbnsm_read;
	priv->cfg.reg_write =3D imx_bbnsm_write;

	nvmem =3D devm_nvmem_register(dev, &priv->cfg);
}

Since nvmem_register() only parses direct child cell nodes when
config->add_legacy_fixed_of_cells is true (and nxp,bbnsm.yaml does not
reference nvmem-deprecated-cells.yaml), cells defined directly under
bbnsm_nvmem are ignored at runtime, while defining cells inside an
nvmem-layout subnode will trigger dtc avoid_unnecessary_addr_size warnings =
if
#address-cells and #size-cells remain on the parent bbnsm_nvmem node.

[ ... ]

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b7..8d492d05f1602 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -185,6 +185,18 @@ config NVMEM_BRCM_NVRAM
>  	  This driver provides support for Broadcom's NVRAM that can be accessed
>  	  using I/O mapping.
> =20
> +config NVMEM_IMX_BBNSM
> +	tristate "i.MX BBNSM general purpose register support"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on OF
> +	select REGMAP_MMIO

[Severity: Medium]
Should NVMEM_IMX_BBNSM select MFD_SYSCON (and depend on HAS_IOMEM) instead =
of
selecting REGMAP_MMIO?

In drivers/nvmem/imx-bbnsm.c, imx_bbnsm_probe() obtains its regmap via
syscon_node_to_regmap(parent):

	priv->regmap =3D syscon_node_to_regmap(parent);
	of_node_put(parent);
	if (IS_ERR(priv->regmap))
		return PTR_ERR(priv->regmap);

If CONFIG_MFD_SYSCON is not enabled, syscon_node_to_regmap() falls back to =
the
stub in include/linux/mfd/syscon.h that returns ERR_PTR(-ENOTSUPP), causing
imx_bbnsm_probe() to fail at runtime. Selecting MFD_SYSCON (which itself
selects REGMAP_MMIO and depends on HAS_IOMEM) also avoids selecting
REGMAP_MMIO on architectures without HAS_IOMEM under COMPILE_TEST.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101200140.1416=
42-1-wahrenst@gmx.net?part=3D3

Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE691F8692
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736331353; cv=none; b=StHVN4fA6Xd4w3a1Nw580SldniFOU50aXEIyLQaCI2Z8i2ntYbXiU2iNxD4S7eQeceQrIqGmWp6TpGRN7oyfNH75h3r/+ai3vlZwL0z8YkgRC/Kk2BeUp5OtSHWhnugXuBI+5YdKZtrAfzgSPXbrtoenYv3Pkz2VCrjl3++FxWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736331353; c=relaxed/simple;
	bh=IKzCuduos1YFeIU4aNXD11QZvENF1IVeQH2pxGjAtRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VuaBYP1gCdVBRxpJ9iXjHY8PPnihhfO3LUYbtvuaWSOeNeAH/KYeqFzeevJ/RzWHamJ4jtcUNxYpvnBPRJN3w0PEbj0q8ko/abyZ4fX7zWV1p9jZHfq1hPVarX15d2CxnFqxehiS7TekY8OCXqGcN/MCASZIYkzJcnNlDXGzp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Y0/KsGfb; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=P2uQifsd reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Y0/KsGfb";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P2uQifsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736331350; x=1767867350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rqUpwoDA+wnL7XDmIleta7smYCcZ7eiI2bxGZ/nAG9I=;
  b=Y0/KsGfbuWE3Ikl8mjvCNHgfLJXSK6d2GlvM03uHO0uEQzrwEGdxwWbb
   MJKfTRwQFuYsaE2jCNqQZSVONycGCqtgoI8Kirolf/l2FhQCGtam02m6V
   0UgML4drxI0nM4x6E66gF0SuIcav2DCdXEngwsOksOigOZxseRVB3PHSW
   IgyfCsTsoGWHhIc9J+vXzSexeomm97cqpA/QcmRJizLXr690EMQ+mH8lx
   8Cc2dImeb2xktHVFET1FHC5acM9VlMqLmE0Rt+DpZu1HwTZLcfPk8gHTq
   LC6AzKVCYfrH2VUB6Xo/eHG6pNSyq0yI3N4DorhRteXIh/mJffmAjDw/L
   g==;
X-CSE-ConnectionGUID: Ivxew5whSU2AHU/10MTWUw==
X-CSE-MsgGUID: aULauu6RT+mzPRLeeAG+4g==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; 
   d="scan'208";a="40917071"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 11:15:47 +0100
X-CheckPoint: {677E5053-29-C6D8D88D-F91F9E6B}
X-MAIL-CPID: FB0D07F9AF1E531774E54C986082FCB8_2
X-Control-Analysis: str=0001.0A682F1E.677E5053.00D7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 941801661C3;
	Wed,  8 Jan 2025 11:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736331343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqUpwoDA+wnL7XDmIleta7smYCcZ7eiI2bxGZ/nAG9I=;
	b=P2uQifsdWvuLxnJ3LKeSnx2AOHu2MJdlDbZQbQhhEaJMxPaQEJoueeTkDsvwYf7nnKTdFg
	XtuGx6MaU6Ovw8ucl4I8U43rjk3+m3i6NqUPxSJTqGmlEYoSPNZeQubAW7/BRF0YzSKOW2
	sFO5j46TDBw13ga5TopR9v3KdWmWXIuLroCyenf8/GinUnQve12zEut6iTkxvV6ky9WCWr
	bNYEswYXfCwDVwWMQgCkvSZmhmpR2FT5xJDCTeukav7fI36p6ZkjnG+rkRhkMzuNLORVLw
	+Gj5UWlKibgRTHQTFwG3KlDTwbIpjnb/VrR9ooC3SLHkUgJ+r3/LMH02agAJkw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Wed, 08 Jan 2025 11:15:40 +0100
Message-ID: <3823142.MHq7AAxBmi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250108-imx-ocotp-v5-2-a6d90e18ebe9@nxp.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <20250108-imx-ocotp-v5-2-a6d90e18ebe9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Peng,

Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce ocotp_access_gates to be container of efuse gate info
>  - Iterate all nodes to check accessing permission. If not
>    allowed to be accessed, detach the node
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 172 ++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 171 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760eeed44a989=
992fb35c462c0b4 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -5,6 +5,8 @@
>   * Copyright 2023 NXP
>   */
> =20
> +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -27,6 +29,7 @@ struct ocotp_map_entry {
>  };
> =20
>  struct ocotp_devtype_data {
> +	const struct ocotp_access_gates *access_gates;
>  	u32 reg_off;
>  	char *name;
>  	u32 size;
> @@ -36,6 +39,20 @@ struct ocotp_devtype_data {
>  	struct ocotp_map_entry entry[];
>  };
> =20
> +#define OCOTP_MAX_NUM_GATE_WORDS 4
> +
> +struct access_gate {
> +	u32 word;
> +	u32 mask;
> +};
> +
> +struct ocotp_access_gates {
> +	u32 num_words;
> +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> +	u32 num_gates;
> +	struct access_gate *gates;
> +};
> +
>  struct imx_ocotp_priv {
>  	struct device *dev;
>  	void __iomem *base;
> @@ -131,6 +148,82 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvme=
m_device *nvmem,
>  	cell->read_post_process =3D imx_ocotp_cell_pp;
>  }
> =20
> +static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 i=
d)
> +{
> +	const struct ocotp_access_gates *access_gates =3D priv->data->access_ga=
tes;
> +	void __iomem *reg =3D priv->base + priv->data->reg_off;
> +	u32 word, mask, val;
> +
> +	if (id >=3D access_gates->num_gates) {
> +		dev_err(priv->config.dev, "Index %d too large\n", id);
> +		return -EACCES;
> +	}
> +
> +	word =3D access_gates->gates[id].word;
> +	mask =3D access_gates->gates[id].mask;
> +
> +	reg =3D priv->base + priv->data->reg_off + (word << 2);
> +	val =3D readl(reg);
> +
> +	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask=
);
> +	/* true means not allow access */
> +	if (val & mask)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struc=
t device_node *parent)
> +{
> +	struct device *dev =3D priv->config.dev;
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_args args;
> +		u32 id, idx =3D 0;
> +
> +		while (!of_parse_phandle_with_args(child, "access-controllers",
> +						   "#access-controller-cells",
> +						   idx++, &args)) {
> +			of_node_put(args.np);
> +			if (args.np !=3D dev->of_node)
> +				continue;
> +
> +			/* Only support one cell */
> +			if (args.args_count !=3D 1) {
> +				dev_err(dev, "wrong args count\n");
> +				continue;
> +			}
> +
> +			id =3D args.args[0];
> +
> +			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
> +
> +			if (imx_ele_ocotp_check_access(priv, id)) {
> +				of_detach_node(child);
> +				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n=
",
> +					 child);
> +			}
> +		}
> +
> +		imx_ele_ocotp_grant_access(priv, child);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
> +{
> +	struct device_node *root __free(device_node) =3D of_find_node_by_path("=
/");
> +
> +	if (!priv->data->access_gates)
> +		return 0;
> +
> +	/* This should never happen */
> +	WARN_ON(!root);
> +
> +	return imx_ele_ocotp_grant_access(priv, root);
> +}
> +
>  static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -161,14 +254,45 @@ static int imx_ele_ocotp_probe(struct platform_devi=
ce *pdev)
>  	priv->config.fixup_dt_cell_info =3D imx_ocotp_fixup_dt_cell_info;
>  	mutex_init(&priv->lock);
> =20
> +	platform_set_drvdata(pdev, priv);
> +
>  	nvmem =3D devm_nvmem_register(dev, &priv->config);
>  	if (IS_ERR(nvmem))
>  		return PTR_ERR(nvmem);
> =20
> -	return 0;
> +
> +	return imx_ele_ocotp_access_control(priv);

In [1] you mentioned devlink should solve the probe order. How does this
play when the driver is compiled in (e.g. ethernet for NFS boot) but
this OCOTP driver is just a module?
I'm not well versed with devlink, but is
> access-controllers =3D <&ocotp IMX93_OCOTP_ENET1_GATE>;
already enough to create that link?

Best regards,
Alexander

>  }
> =20
> +struct access_gate imx93_access_gate[] =3D {
> +		[IMX93_OCOTP_NPU_GATE]		=3D { .word =3D 19, .mask =3D BIT(13) },
> +		[IMX93_OCOTP_A550_GATE]		=3D { .word =3D 19, .mask =3D BIT(14) },
> +		[IMX93_OCOTP_A551_GATE]		=3D { .word =3D 19, .mask =3D BIT(15) },
> +		[IMX93_OCOTP_M33_GATE]		=3D { .word =3D 19, .mask =3D BIT(24) },
> +		[IMX93_OCOTP_CAN1_FD_GATE]	=3D { .word =3D 19, .mask =3D BIT(28) },
> +		[IMX93_OCOTP_CAN2_FD_GATE]	=3D { .word =3D 19, .mask =3D BIT(29) },
> +		[IMX93_OCOTP_CAN1_GATE]		=3D { .word =3D 19, .mask =3D BIT(30) },
> +		[IMX93_OCOTP_CAN2_GATE]		=3D { .word =3D 19, .mask =3D BIT(31) },
> +		[IMX93_OCOTP_USB1_GATE]		=3D { .word =3D 20, .mask =3D BIT(3) },
> +		[IMX93_OCOTP_USB2_GATE]		=3D { .word =3D 20, .mask =3D BIT(4) },
> +		[IMX93_OCOTP_ENET1_GATE]	=3D { .word =3D 20, .mask =3D BIT(5) },
> +		[IMX93_OCOTP_ENET2_GATE]	=3D { .word =3D 20, .mask =3D BIT(6) },
> +		[IMX93_OCOTP_PXP_GATE]		=3D { .word =3D 20, .mask =3D BIT(10) },
> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D 20, .mask =3D BIT(17) },
> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D 20, .mask =3D BIT(19) },
> +		[IMX93_OCOTP_LVDS1_GATE]	=3D { .word =3D 20, .mask =3D BIT(24) },
> +		[IMX93_OCOTP_ADC1_GATE]		=3D { .word =3D 21, .mask =3D BIT(7) },
> +};
> +
> +static const struct ocotp_access_gates imx93_access_gates_info =3D {
> +	.num_words =3D 3,
> +	.words =3D {19, 20, 21},
> +	.num_gates =3D ARRAY_SIZE(imx93_access_gate),
> +	.gates =3D imx93_access_gate,
> +};
> +
>  static const struct ocotp_devtype_data imx93_ocotp_data =3D {
> +	.access_gates =3D &imx93_access_gates_info,
>  	.reg_off =3D 0x8000,
>  	.reg_read =3D imx_ocotp_reg_read,
>  	.size =3D 2048,
> @@ -183,7 +307,53 @@ static const struct ocotp_devtype_data imx93_ocotp_d=
ata =3D {
>  	},
>  };
> =20
> +struct access_gate imx95_access_gate[] =3D {
> +		[IMX95_OCOTP_CANFD1_GATE]	=3D { .word =3D 17, .mask =3D BIT(20) },
> +		[IMX95_OCOTP_CANFD2_GATE]	=3D { .word =3D 17, .mask =3D BIT(21) },
> +		[IMX95_OCOTP_CANFD3_GATE]	=3D { .word =3D 17, .mask =3D BIT(22) },
> +		[IMX95_OCOTP_CANFD4_GATE]	=3D { .word =3D 17, .mask =3D BIT(23) },
> +		[IMX95_OCOTP_CANFD5_GATE]	=3D { .word =3D 17, .mask =3D BIT(24) },
> +		[IMX95_OCOTP_CAN1_GATE]		=3D { .word =3D 17, .mask =3D BIT(25) },
> +		[IMX95_OCOTP_CAN2_GATE]		=3D { .word =3D 17, .mask =3D BIT(26) },
> +		[IMX95_OCOTP_CAN3_GATE]		=3D { .word =3D 17, .mask =3D BIT(27) },
> +		[IMX95_OCOTP_CAN4_GATE]		=3D { .word =3D 17, .mask =3D BIT(28) },
> +		[IMX95_OCOTP_CAN5_GATE]		=3D { .word =3D 17, .mask =3D BIT(29) },
> +		[IMX95_OCOTP_NPU_GATE]		=3D { .word =3D 18, .mask =3D BIT(0) },
> +		[IMX95_OCOTP_A550_GATE]		=3D { .word =3D 18, .mask =3D BIT(1) },
> +		[IMX95_OCOTP_A551_GATE]		=3D { .word =3D 18, .mask =3D BIT(2) },
> +		[IMX95_OCOTP_A552_GATE]		=3D { .word =3D 18, .mask =3D BIT(3) },
> +		[IMX95_OCOTP_A553_GATE]		=3D { .word =3D 18, .mask =3D BIT(4) },
> +		[IMX95_OCOTP_A554_GATE]		=3D { .word =3D 18, .mask =3D BIT(5) },
> +		[IMX95_OCOTP_A555_GATE]		=3D { .word =3D 18, .mask =3D BIT(6) },
> +		[IMX95_OCOTP_M7_GATE]		=3D { .word =3D 18, .mask =3D BIT(9) },
> +		[IMX95_OCOTP_DCSS_GATE]		=3D { .word =3D 18, .mask =3D BIT(22) },
> +		[IMX95_OCOTP_LVDS1_GATE]	=3D { .word =3D 18, .mask =3D BIT(27) },
> +		[IMX95_OCOTP_ISP_GATE]		=3D { .word =3D 18, .mask =3D BIT(29) },
> +		[IMX95_OCOTP_USB1_GATE]		=3D { .word =3D 19, .mask =3D BIT(2) },
> +		[IMX95_OCOTP_USB2_GATE]		=3D { .word =3D 19, .mask =3D BIT(3) },
> +		[IMX95_OCOTP_NETC_GATE]		=3D { .word =3D 19, .mask =3D BIT(4) },
> +		[IMX95_OCOTP_PCIE1_GATE]	=3D { .word =3D 19, .mask =3D BIT(6) },
> +		[IMX95_OCOTP_PCIE2_GATE]	=3D { .word =3D 19, .mask =3D BIT(7) },
> +		[IMX95_OCOTP_ADC1_GATE]		=3D { .word =3D 19, .mask =3D BIT(8) },
> +		[IMX95_OCOTP_EARC_RX_GATE]	=3D { .word =3D 19, .mask =3D BIT(11) },
> +		[IMX95_OCOTP_GPU3D_GATE]	=3D { .word =3D 19, .mask =3D BIT(16) },
> +		[IMX95_OCOTP_VPU_GATE]		=3D { .word =3D 19, .mask =3D BIT(17) },
> +		[IMX95_OCOTP_JPEG_ENC_GATE]	=3D { .word =3D 19, .mask =3D BIT(18) },
> +		[IMX95_OCOTP_JPEG_DEC_GATE]	=3D { .word =3D 19, .mask =3D BIT(19) },
> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D 19, .mask =3D BIT(21) },
> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	=3D { .word =3D 19, .mask =3D BIT(22) },
> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D 19, .mask =3D BIT(23) },
> +};
> +
> +static const struct ocotp_access_gates imx95_access_gates_info =3D {
> +	.num_words =3D 3,
> +	.words =3D {17, 18, 19},
> +	.num_gates =3D ARRAY_SIZE(imx95_access_gate),
> +	.gates =3D imx95_access_gate,
> +};
> +
>  static const struct ocotp_devtype_data imx95_ocotp_data =3D {
> +	.access_gates =3D &imx95_access_gates_info,
>  	.reg_off =3D 0x8000,
>  	.reg_read =3D imx_ocotp_reg_read,
>  	.size =3D 2048,
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



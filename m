Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A32BAEC
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159555; cv=none; b=f2YntwqGT6vXxrTCX1syW0fDGy7TupPxEsVYYF7XHYNhxCHmzVRkbUSKyQ9UX5sQQ1tPynURnYZXiYPjbHjxY3YufcKQ5mleMIGcwgH13pLdDCCIdxMyMKWD79tQuGjSXFJj2DLOLjoTC8kG15fxozw1sW1tgqjv8DvExLK2E0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159555; c=relaxed/simple;
	bh=lYTZq2bMqMlctyxARaclRj0U75z5r/HBAXfV4eGRaMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwV8qb9WQozL81E0EbrNX7zQRpQwNnaQTSw4o+Yu2ORwv1yMVdle4mWDdGUJirJ69G0PiBfnWVifrQEhaWnQj4fukY7QTMymzQ8ESXMfDrOsBScUXdjM3SCYJxZP/goPOhcTcaU23A1QDWGCNfOsD9Pm7HcPRN8uJh7zJVyJD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1tUkPG-0006cA-5y; Mon, 06 Jan 2025 11:32:22 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1tUkPF-0079Mx-05;
	Mon, 06 Jan 2025 11:32:21 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1tUkPF-007Zgy-2D;
	Mon, 06 Jan 2025 11:32:21 +0100
Date: Mon, 6 Jan 2025 11:32:21 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Message-ID: <Z3uxNZLM6-HHnRZM@pengutronix.de>
References: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
 <20241223-imx-ocotp-v4-2-f504c1420640@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-imx-ocotp-v4-2-f504c1420640@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mon, Dec 23, 2024 at 08:46:14AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce ocotp_access_gates to be container of efuse gate info
>  - Iterate all nodes to check accessing permission. If not
>    allowed to be accessed, detach the node
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 184 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 183 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5a07d8b780ecfc13874cff338d6926d0e2a87c8a 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -5,6 +5,8 @@
>   * Copyright 2023 NXP
>   */
>  
> +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -27,6 +29,7 @@ struct ocotp_map_entry {
>  };
>  
>  struct ocotp_devtype_data {
> +	const struct ocotp_access_gates *access_gates;
>  	u32 reg_off;
>  	char *name;
>  	u32 size;
> @@ -36,11 +39,26 @@ struct ocotp_devtype_data {
>  	struct ocotp_map_entry entry[];
>  };
>  
> +#define OCOTP_MAX_NUM_GATE_WORDS 4
> +#define IMX93_OCOTP_NUM_GATES 17
> +#define IMX95_OCOTP_NUM_GATES 36
> +
> +struct ocotp_access_gates {
> +	u32 num_words;
> +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> +	u32 num_gates;
> +	struct access_gate {
> +		u32 word;
> +		u32 mask;
> +	} gates[];
> +};

Make gates[] a pointer so you can use ARRAY_SIZE() for determining the
number of gates rather than having to define num_gates manually.

> +
>  struct imx_ocotp_priv {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct nvmem_config config;
>  	struct mutex lock;
> +	u32 value[OCOTP_MAX_NUM_GATE_WORDS];

'value' is a poor naming choice. Is storing the register values in the
private data necessary at all? You could read the values when you need
them.

>  	const struct ocotp_devtype_data *data;
>  };
>  
> @@ -131,6 +149,97 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  	cell->read_post_process = imx_ocotp_cell_pp;
>  }
>  
> +static int imx_ele_ocotp_check_access(struct platform_device *pdev, u32 id)
> +{
> +	struct imx_ocotp_priv *priv = platform_get_drvdata(pdev);
> +	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
> +	u32 word, mask;
> +
> +	if (id >= access_gates->num_gates) {
> +		dev_err(&pdev->dev, "Index %d too large\n", id);
> +		return -EACCES;
> +	}
> +
> +	word = access_gates->gates[id].word;
> +	mask = access_gates->gates[id].mask;
> +
> +	dev_dbg(&pdev->dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
> +	/* true means not allow access */
> +	if (priv->value[word] & mask)
> +		return -EACCES;

priv->value[] is an array with 4 entries whereas 'word' is some value
between 17 and 21.

As said above, just read needed register value here instead of storing
all register values upfront in an array.

> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_grant_access(struct platform_device *pdev, struct device_node *parent)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_iterator it;
> +		int err;
> +		u32 id;
> +
> +		of_for_each_phandle(&it, err, child, "access-controllers",
> +				    "#access-controller-cells", 0) {
> +			struct of_phandle_args provider_args;
> +			struct device_node *provider = it.node;
> +
> +			if (err) {
> +				dev_err(dev, "Unable to get access-controllers property for node %s\n, err: %d",
> +					child->full_name, err);

You can print device nodes with %pOF

> +				of_node_put(provider);

On error it.node will be NULL. No of_node_put() necessary here.

> +				return err;
> +			}

You don't check if the provider actually matches the fsl,imx9x-ocotp
node, otherwise it breaks when multiple access providers are in the
system, i.e. do a

			if (provider != dev->of_node)
				continue;

> +
> +			/* Only support one cell */
> +			if (of_phandle_iterator_args(&it, provider_args.args, 1) != 1) {
> +				dev_err(dev, "wrong args count\n");
> +				of_node_put(provider);
> +				return -EINVAL;
> +			}

When there's a node that has he wrong number of arguments in the
access-controllers property then there's no need to fail the others.
Just continue instead of returning an error.

> +
> +			id = provider_args.args[0];
> +
> +			dev_dbg(dev, "Checking node: %s gate: %d\n", child->full_name, id);
> +
> +			if (imx_ele_ocotp_check_access(pdev, id)) {
> +				of_detach_node(child);
> +				dev_err(dev, "%s: Not granted, device driver will not be probed\n",
> +					child->full_name);

It's not an error when a specific unit is not present on a particular
SoC. This should be dev_info at maximum.

> +			}
> +		}
> +
> +		imx_ele_ocotp_grant_access(pdev, child);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_access_control(struct platform_device *pdev)
> +{

Use imx_ocotp_priv *priv as context pointer to this function and to
imx_ele_ocotp_grant_access().

Sascha

> +	struct imx_ocotp_priv *priv = platform_get_drvdata(pdev);
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
> +	void __iomem *reg = priv->base + priv->data->reg_off;
> +	u32 off;
> +	int i;
> +
> +	if (!priv->data->access_gates)
> +		return 0;
> +
> +	/* This should never happen */
> +	WARN_ON(!root);
> +
> +	for (i = 0; i < access_gates->num_words; i++) {
> +		off = access_gates->words[i] << 2;
> +		priv->value[i] = readl(reg + off);
> +		dev_dbg(&pdev->dev, "word:%d 0x%08x\n", access_gates->words[i], priv->value[i]);
> +	}
> +
> +	return imx_ele_ocotp_grant_access(pdev, root);
> +}
> +
>  static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -161,14 +270,43 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
>  	mutex_init(&priv->lock);
>  
> +	platform_set_drvdata(pdev, priv);
> +
>  	nvmem = devm_nvmem_register(dev, &priv->config);
>  	if (IS_ERR(nvmem))
>  		return PTR_ERR(nvmem);
>  
> -	return 0;
> +
> +	return imx_ele_ocotp_access_control(pdev);
>  }
>  
> +static const struct ocotp_access_gates imx93_access_gates = {
> +	.num_words = 3,
> +	.words = {19, 20, 21},
> +	.num_gates = IMX93_OCOTP_NUM_GATES,
> +	.gates = {
> +		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
> +		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
> +		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
> +		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
> +		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
> +		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
> +		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
> +		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
> +		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
> +		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
> +		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
> +		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
> +		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
> +		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
> +		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
> +	},
> +};
> +
>  static const struct ocotp_devtype_data imx93_ocotp_data = {
> +	.access_gates = &imx93_access_gates,
>  	.reg_off = 0x8000,
>  	.reg_read = imx_ocotp_reg_read,
>  	.size = 2048,
> @@ -183,7 +321,51 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
>  	},
>  };
>  
> +static const struct ocotp_access_gates imx95_access_gates = {
> +	.num_words = 3,
> +	.words = {17, 18, 19},
> +	.num_gates = IMX95_OCOTP_NUM_GATES,
> +	.gates = {
> +		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
> +		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
> +		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
> +		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
> +		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
> +		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
> +		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
> +		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
> +		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
> +		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
> +		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
> +		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
> +		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
> +		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
> +		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
> +		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
> +		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
> +		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
> +		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
> +		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
> +		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
> +		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
> +		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
> +		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
> +		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
> +		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
> +		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
> +		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
> +		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
> +		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
> +		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
> +		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
> +	}
> +};
> +
>  static const struct ocotp_devtype_data imx95_ocotp_data = {
> +	.access_gates = &imx95_access_gates,
>  	.reg_off = 0x8000,
>  	.reg_read = imx_ocotp_reg_read,
>  	.size = 2048,
> 
> -- 
> 2.37.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

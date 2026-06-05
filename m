Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6D3CFF45
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673343; cv=fail; b=JqPLPJe0sjIkJxVZbG6f1yz1ke6juu6NQFWsP6Q/XUDH2lB1MlLSG4WcMLSKxR1BWdAekijrZ96YH38D+VTem+aZEwN8IRVjG5T5KbpVSzWV2ecta0UKoqvNqDySz/wK77MBaVk3i6xeMMcL32novk2cuTOGBENe4NTOU/CXP/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673343; c=relaxed/simple;
	bh=GY/AIadpHD1tfk26DJWY7YtJz/wuZJTCMfHuHOfYSYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YcU756szJKPOWOLfEOruaaUxA/pe1q/DwJMfxan0/Vx4IaSYeQJqJG0m79efWkul+HQ1TmQy0Y6qGr+ozRElGDV5wnvVtJy4LwQKo18C8RrtpJgB3Ewmn29rBOMbCGAchaPO5g2xtNF5dt+r1WeMvJvgeXLDKvNhJyh6kXVplfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Oc3EAkTv; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Oc3EAkTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wyg830CjUdP0My0Emx/SbPsYWrsf//ssD4rQgqLexeG/Al6K0qtsM8mI/UDPI9QXtZY1AFpqQP3qL866bx4ua2lFQ0xe11cYvnOsNfI1pfqCK33a9SuBiPI+ZCw0IXHfutcXvqRyYOD3/5+44WwEiNHvORytG4RoIUEazkXFFGAbbYnURoOnSB71uzwpmf/07sHsuUjeZdYTsP8oZhNWW1+vz0S5wh67RiWrOnY9QtbUqMFysYm3feezJsG7ATWGP04X4eWdNMAZXzBSC0L9rni+EGSKzVET5KRRgLPB/G5cQtGD0kGQUSRDWoAFhCZWGbh5aqg3M4AEMccykomPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UXJ/HopNlJ1dodXDsMMfvnVhL/sLMHEDiwXVO+UtHI=;
 b=ADtDEPuKVuJPYK/EdPLEltHzKw25h7hmgpqI/F2dPXYpNcKSOrDI64trGwtBFedMNeGDbE7OzLzBaNEmo+2Ekt3Ww/JFSCm0EWHR8INxtWQ5UH1eGMamaa50fJH4hkxzYgebSBPpbQsDkl5LbRwDiMc/M7N4CgGWdvB2hi5VCRN6gC+cC6rTkLD95K/6gTe46s1vyLEhIU7Oz00+TaP0nkEIS88RJKd7Pw0BfbkGLoaJrRdCTwQlEtK+E98/QUsE8zRgm76eTeqmRP5wFkuE8Tjz3KVjY206UFTJV5/kMI+hV67dEC87NrN6KnAGyXy5JVXD6Xz7taesHCmhzF9UYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UXJ/HopNlJ1dodXDsMMfvnVhL/sLMHEDiwXVO+UtHI=;
 b=Oc3EAkTvk/5qROWDP2tEWynP2v8xLeu2gfERd4aPdGjRIAgw4t1IKHRT19FPH7bXUrG0/cGg0XP34UIa+ZM+fveDctHAIUyNKyOY2FHcWmqKJBIDQ1XROUTo6/80C0vtXQw2pzIVVvg2REqruqter9F1fG2020/0G0wKzYuzofwuSjBAD6vfXujCYs6aGnwdQIr0LNs780BlAKBjAUXtVKUq8N4H80rMifbWaMtM/1TnSqg1IXG6tu6i0zZnzbar3uM+wAqCbO32gnl0kGCY0ldUlXb8Q7IrDK4Tk6BkJD9LesyPtUQeom6TXBtf675LOfZklk58G0a4FKf+IdKwXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7454.eurprd04.prod.outlook.com (2603:10a6:800:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:28:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:28:57 +0000
Date: Fri, 5 Jun 2026 11:28:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 4/5] phy: fsl-imx8mq-usb: add control register regmap
Message-ID: <aiLrMs7AMECq7U66@lizhi-Precision-Tower-5810>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
 <20260605-imx8mp-usb-phy-improvement-v4-4-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-4-b2ddf2f3862c@nxp.com>
X-ClientProxiedBy: PH7PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:510:174::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd54411-605c-4198-8147-08dec31728e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|4143699003|11063799006|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	kUJChZh0rGl7hYGRLtMVLdao9C/S8bMm7eYZ4y4iCNAHBZUPdS0A0cUxZKz0ahnrPbE0kQv3696huOmsd3MbEMv/gKBrihawXZ/kHMtzErJqoAfXrS50IGTowGym9Fd9Z+ovzpsm2GseaDCFZV7lmuWecbHmJAQ4yb8N0d/i0VPwCHN0Sv+AqKSd7tn90sjm8NhgWmUJYufi8uPIbS8CaainKpHW0Bf7CZlY9Kez5/oHz/YA6FDyb4wxGXdq+VTSOb/xmbOU3n2QIAewVc1Jnu3OWZv41k2U+RBRKJ8ktSiTiQdU/8Oyk2WD1peCXU/tks4nQTaaae07nPULOcU21/iDzp+43ly/90w2V50wSW3KbX1beoXnvF5HNaXxAoK5XwJ0inT6pTFpts9GpOsPS/VFh4NY/ueeASJOj9fk+yKhNr77UQQkhfui1YdpGtA+YTO5xoEh9pwJefglYqqN1uIsU1Ey2+a7QjUUf/pBv4D5YWHUdcbVqmye0Gono2qGPLwq5LDys2BRWSXgDyElrdWhw7nmWsv3Zl4/EiP6WLYNIYf/eS4hfGRg3RuQVyGfWN/Sis8Qzkja4RvChGC7yZ8vGRgsADIsvlvxuMD0xSPMNo7DNUZDCGNcADDQnDrHecafMeUnMPVlGJ5mtPazd2NLyTtQYbHeAS+5uXyIJ8qIQOCRqum136xM5ljDBvAxOlGWqdPtJL+legPBE/pSWlnFfJQFfaKpsvwdHpKdeUkXciS6hNMbOWfu+SQIO0K1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mw6kjDtHQS2/L7K1tAY5M8u1YN1V+J2ZlRfaj5Ho6GlCYsXlhjpl2rUTSDc6?=
 =?us-ascii?Q?qIs/ht5odGOh8QSYSzkSz/5tZC0gRz+iFPL1ltMCu+tOK0lziy4F1VUewJWu?=
 =?us-ascii?Q?gX68EpywAifgLur3T3Bfz+VK58rIIig+H4MIITWmA432IoOOQQqERPylg49X?=
 =?us-ascii?Q?XD7o/wRd1Ik/1BJKroBxSHybSRvpM0PLER8Er5WKOv7PacqvDBdFeGCf8tVv?=
 =?us-ascii?Q?kaimqinPqYL72SlMxPMTMgZyZ5LlFo/0Sje4+y9KXhnpY9m8vACVSG4VnjOG?=
 =?us-ascii?Q?aS7BP31oufsfs0ifd6I19p9ZDyQN/sim7it0op5HfmrPZQOpgbqjNPJHinKR?=
 =?us-ascii?Q?YbQ6SLw72lhRmgCRqJ7qbPerpap5KLmREOx9fl1Iw0NGfcatAjCBtW8RSuAI?=
 =?us-ascii?Q?KwGQc847Q3QiOKhxG4r4PV+IFNnMIGwtAH9TH5GAiP6H8gXM1WFtAk1w+YSt?=
 =?us-ascii?Q?jpn2nBUtbmEfpV6RKkC1s5unar1Iboa9J5hR7YNfTQwV0OtijJjv4k6jPLv/?=
 =?us-ascii?Q?lL3hWD41/UECbNkVFaPoB39M6mttkFtopZ7Yj7JbJDJVwxe/x9qUqiqxkx3w?=
 =?us-ascii?Q?GWB3Ycfr+7GIPLXzlQdqMgf/ninEcLJ14Xnn4bXp5CfsWqT573Hf0EEstRlM?=
 =?us-ascii?Q?6hMcqQWWmlJZzt1r0PT2EGzHE9gnVknKXj7r+IazmHpx2L+moIV+cxC17ecK?=
 =?us-ascii?Q?qWTQaABbs3zVNGiP76MHiqPJX2OXx8yvpnFZ+A9V2FMiW9sYMPK8xNSeL4d6?=
 =?us-ascii?Q?59MOFWYvZfzFR2E5XlPovXxy/CGqIBUz9TZPotaKxLrvmWAF+/vhr3VfgpOo?=
 =?us-ascii?Q?I6p45kF5Okq5XAQhqahSszv2elgU1XXf3tcKrxa3B3MqJPKODdpgK8LKGHIg?=
 =?us-ascii?Q?yifR9nSmDra6E408oBSTydKxk+DwavADK5u9i3prYYes5jBkg+XTaGppJfCk?=
 =?us-ascii?Q?hoRo9BJekDJunR++s2kbvRuUdBZ0zqY9H23lD5dsJRbdjefT3ZfmzJQ1uHwV?=
 =?us-ascii?Q?VwvL+l4l3tjVF2PjMbMGKiVi+zhbivlcGX0kLTh5IqT98PlB5UrXItqTzPCs?=
 =?us-ascii?Q?3VAygVusJz0tD3N24CfRy4cRzHDOx1bCATCNjpp2AHUaVDU+s5CQwnXtoDZD?=
 =?us-ascii?Q?9DzaunTL4/Yv8DKW0B37oJ6mOQR6sAr4/5I8zPXq/XgixqZM0Q9bex/XSQDJ?=
 =?us-ascii?Q?L880/16zCxDN/nDAcL36hfydbXuLEVKeEepwLmAXoMXqJPUezfeLykOn1EsG?=
 =?us-ascii?Q?qIDeX4Vw0VEp04QqogknO9uf8MDSVXDsHOnYUk2oGU4zQanu3AU7BBrd1VSa?=
 =?us-ascii?Q?mNJQGG/GlmNz4MPhoXPDQEP82+huw4jys2lfNLsaQn33lKcXfEQhfdAbtYO/?=
 =?us-ascii?Q?5siPMD9H4J3wDI0I29IiS399voNEqjc/Det8/FYrt9nsmaOPTxPI8ENAwfC1?=
 =?us-ascii?Q?rT6bB0UWz6GRbuGGzqHMAn2/eosOEzSp5IBQKQUyiCc6m7HOgh/0ZqNw+g4y?=
 =?us-ascii?Q?SU6Lv4jXhmuWHjfxk5r1ymfsl4NHd+a+u0EhjY6JCNlD1m08E8zcJasPjjnI?=
 =?us-ascii?Q?B8vYIRuxGtEovLdnQvrFrPSgnywIbzNAzqttE1FIhw4r+l4OMjT3R49GBoQm?=
 =?us-ascii?Q?R1wIek7h+dpoXf20laaR5uC2ogY4KZ+8x5/vGnByLTC5qtk1XcQOT3MRbPAI?=
 =?us-ascii?Q?tn+akVH8lPLO0ax4+WVPPnSLB4jWIBK8QYbos1b+pQEtTW95?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd54411-605c-4198-8147-08dec31728e0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:28:57.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ue7gIpm8yy8yEFevvicIs6XLUeIcbEVeMh/BxZiydcA8mPjl/v9BZyguG8tR/7ZjqYMhYZ/u8HQrGrc7fv33SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7454

On Fri, Jun 05, 2026 at 07:13:05PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> The CR port is a simple 16-bit data/address parallel port that is
> accessed through 32-bit MMIO registers for on-chip access to the
> control registers inside the USB 3.0 femtoPHY. Add control register
> regmap and export these registers by debugfs to help PHY's diagnostic.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v4:
>  - improve commit message as Haibo's suggestion
> Changes in v3:
>  - drop Frank's tag because it includes other changes
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 27aa696f5dd4..e24f46d7924b 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright 2017-2026 NXP. */
>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/regmap.h>
>  #include <linux/usb/typec_mux.h>
>
>  #define PHY_CTRL0			0x0
> @@ -56,6 +57,8 @@
>  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
>  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>
> +#define PHY_CRCTL			0x30
> +
>  #define PHY_TUNE_DEFAULT		0xffffffff
>
>  #define TCA_CLK_RST			0x00
> @@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
>  	void __iomem *base;
>  	struct regulator *vbus;
>  	struct tca_blk *tca;
> +	struct regmap *cr_regmap;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
>
> +static const struct regmap_config imx_cr_regmap_config = {
> +	.name = "cr",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x7,
> +};
> +
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
> +						   &imx_cr_regmap_config);
> +	if (IS_ERR(imx_phy->cr_regmap)) {
> +		dev_warn(dev, "Fail to init debug register regmap\n");
> +		imx_phy->cr_regmap = NULL;
> +	}
> +
>  	ret = devm_pm_runtime_set_active_enabled(dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> @@ -731,6 +750,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
>  {
>  	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
>
> +	if (imx_phy->cr_regmap)
> +		regcache_cache_only(imx_phy->cr_regmap, true);
> +

I think this common problem, is possible to change
regmap_read_debugfs(), let it call runtime_pm_get(), there are already
have runtime_pm in regmap field.

So you debug fs always to get update value, instead cached value?

Frank

>  	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);
>
> @@ -752,6 +774,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>
> +	if (imx_phy->cr_regmap)
> +		regcache_cache_only(imx_phy->cr_regmap, false);
> +
>  	return 0;
>  }
>
>
> --
> 2.34.1
>

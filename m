Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D53FC5B8
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471571; cv=fail; b=Lc+949tWA+y6RZDssMjYvphHQYa5jD0dZQfxraElWhuY7GSKzYd8y8KCFBFN9UQQI8RrKL8IRhYaxPqqFSB5+//ckGgcc+PzXW893GuuNFjuG1ebLi4PcUmzcvIhf+WJcgTG8dhX/aTeOJtZfzJ4ZJqW3eRSJXkVKe8DP50w1nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471571; c=relaxed/simple;
	bh=6oeaTKMZelZgqVzwqjypOmo+CKPi0cNXEeo+xWEC75U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UhX/1Aj4aVwgrKdmNyDFi1MaOHgR7lYFWrUamOLzBj0KfZKRy3wTuo5AKYftc3bp0KLSBYPlqjw6Xd1b4aWWF/qGnVTI18na00IZukLv6I+h5aQQYm4yhsNNIHZw7bpx7bRcSvfzaWvZpFhz3uYyHc7VIa8PMHMe0lglk4xbRTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Mci6BkE3; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Mci6BkE3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFOWy0/PB8E+mdGHiVtnP4xW/axfNWTkhNI0rkwKgivpP8D8KmkSU/2PTYiXtHLvIQ2qRlJlwTqpfY+0MvyokyQ6M5z2jPkp76uGPlSLlpWN4xjHqJBinnVYA6vhWvTAyjK6eAhY0encgkPQVMIgxVMo0SgcVLSINdlc5TJbFIGaYqOXc4MJZT8OuE2iwbo3lirx5Gb0OYjgHUen8ejCeJcx7DfuGKUvCMuLeo8No6zwYyAOKa40FkJhJu6cseRwSDdHdKmLgex4ZuymwltbcQ9of78Dfr1WVhT07bWNzOE3O+00K7m5b2q1zHhYdd13wuP3z4U2MG8o+45VNkevDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeWyXD/dr7ykIMyGGLoumDBn0/im4yH+BpC7DCd4kuk=;
 b=ibJQ6SJsX9IEHsxMQYAvcHYJQ3p6V5kYx2bAJZcWqXaq4xcMJtg7BioD3Dwye2iVW0e0czSOYvDip3zQNgyCTpcH9Uz0TXNOKwY/V51WdJrknFc9Xw6cKrE3oULTor4X/xQ36F5lhV+ecu0yvMkionslakDmwv1eNpBVhObqGO91Pw7UkjD/7G5dSeNPVWy+D9ZhN6xP2DLNGkOhjS3OWBiS7LBqgd3lVyzD1ZTTxo3e+4fUX3A2051HlSufriXPxYjmxwluz2qlJT34uj/e79sGCU21XwOK0OqCeaDtts3zth5AYwSMx+dDU6ZyDNvXquyTQYTh2yQB2xYQ/dyqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeWyXD/dr7ykIMyGGLoumDBn0/im4yH+BpC7DCd4kuk=;
 b=Mci6BkE3FZPx6TJxokx60PkIxg2XlW5p1ssOZuTccP7n9DWlE2a08zZwJ5FYYq3SEDnUo9EJKIIReqZYDxFHhm3MBK8ZQ0FBlyo6bYpOzQt4M/kIfDg2qcDHLct7XT7dvtREf8eDuHuFG8/VfFJLibT0MJuQKj65vhpSsaJBmNpl2eHvFhZ+AIRglW/XE5nyU9CxSXiMY18vYbP1aO7kxvWgEoqoddR5JRR60HuE7p+1EQuFT088OfkFGiIKSb7pq75T6tx3n4l05rkH4OJCo87o0mq/bWtds1Gbj8GU4teVXB83cQXgACUAFdsBO/oA3NqYmuW6lZyKi70IRJG+UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PAWPR04MB9765.eurprd04.prod.outlook.com
 (2603:10a6:102:389::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:26:06 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:26:06 +0000
Date: Wed, 3 Jun 2026 15:21:07 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 4/5] phy: fsl-imx8mq-usb: add control register regmap
Message-ID: <20260603072107.xhrzxrgbrb7q6fhe@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
 <20260603-imx8mp-usb-phy-improvement-v3-4-7afb8f89abc6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-4-7afb8f89abc6@nxp.com>
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PAWPR04MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ecf33d8-7563-4abf-1a9d-08dec1415fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|56012099006|18002099003|22082099003|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gDtn7KEAeUpHqiWIG+3DNSTiqaH88c2s9wf8diqpx4xjWXs6Edlk9/MBq7eO4y8S3qgnPrV9hZSicb20n1oFr6ve/JB8u8Xn3qD1EQfCOSptg/oAVV/mzRsjxlx6ia60OEm6Bd6rDMNCgt+i4P7DOecPQ3e8QTQcjBUi/VYyj4l0sNhjz9C4PgkQRfCAnJMTEpo8I7Da0Iw1lBzk0ll/TEPAqrMCpkJrwZ0l5dpOXuw2wvm5z8MfyEaRqQvx/45ORlPGotG2sWXr9CSyhwctcL+rcAOCQ3vcYfTgEzZlxBxIatqcWPKGQVsX8JDMnOx5r+6fnLMnwpVHuNuQUSxst91P5VwZ1QvPvg4sVFPtaJkiq1uDiRdD2Cp41XmiCWLDv1FVJzHulfvhfbPPlKw+IffsIo9jXnT0+Mm6ld5W+ybebeYm6MI1y68Oa/0lBCAQe0Al3YAdTVcVLFkeyWU/yrFuYIObgM09X5GzZq+/6jkMs6gbhCUcMBYE6nJINzm7UR/oo85ioX0LtBUhxWzH8tu/J6btmHwiaBT5K5GtSAbt02cORwPNycpK6CZApt5A1/qkGWMRdpJ69vrx558iTO/O9oHsrIHGroUBjzgThFiMuZPBH6ToDQiEpUQXfa3bpnXaOZBTrU3svQw4Ygu4CNvxvWIQ48EMb1qvDy6w45Q/xF/POAOj1D9XTOi7jpsA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7o0oDvxdCM1Zt5FzR3PpyM4BYeWeLyQC24ZEG1M3bxVryQRzvqBb6PxqJjdb?=
 =?us-ascii?Q?Y/2xGEhcg8fKWC50lVIqsEDhmux64Uufofk5E8DXQjdQ01fOky4jIsMXjWUF?=
 =?us-ascii?Q?em30C0N3eO3jjG+sX6aR1RaS3mftF05GqUo1u0EPPtGRgdl4DOKimNAWobPy?=
 =?us-ascii?Q?qdmrvf3CJ6OaRQy4W/RH4HjP9rlWqYW+0pBJIgrJgnPn5HFTpa1qoLY55PUH?=
 =?us-ascii?Q?ff/dURVb8R5ZVpYRXj+JsuppDXr6ALJUs0OC8wKICN1wPNJlldAFRVcgdwAm?=
 =?us-ascii?Q?LXCBm38Z9wefSnaoGTsZY4Xch1K7gRWW6g4kos270T+TWoA0BZifpRgy8tns?=
 =?us-ascii?Q?pe7OuDFnfxHKSpqk9m64XLn85aXvX6Tiw7mKH2mf3VfD9aaDIyQJVyrs665v?=
 =?us-ascii?Q?PghoLzDAPXYRp5qG7bm9gUbCOeKnpbXMoBUii5whAwA9YCBhpp8TWwXbzqti?=
 =?us-ascii?Q?QkpzTeX416WvFN38XrpGlZLaUfjsWh2tl5jW2UVFOyKzwk2+iG0V1qfX+O8V?=
 =?us-ascii?Q?kRwuvWmdNe9nP3jPmEBWiPy4PYVMxcnRhzctYg9+LSN8xekX+TuWwYxFzsiz?=
 =?us-ascii?Q?FCLFnmSYXl6YcjvzXyTS5spKOogQMWoN6DZBW/Pq1px1sprDFr+WD5BL1tC+?=
 =?us-ascii?Q?5sggLaImuTibNqU4u0u0u/jt5EgZrd3EZux9UjcBGKX/YzOrMOZDZt2sKE8Z?=
 =?us-ascii?Q?cRooiZx+ch0BsNn9wisgNXqdV9kgqHEIM99iMyL/UHMBAXIca+FCSl08oqx9?=
 =?us-ascii?Q?j04gQYZjO25YZdujJq0KxH9uOR3ulSHYmeHriSHc0jQO7Z06tpq2tDesjxPV?=
 =?us-ascii?Q?6+z5V7r/TCCxESB6dMqiLOltuahRo4dhqoc4juSnp7sWhO9Rh9ai+YkDogUr?=
 =?us-ascii?Q?AjHO4V7q2SU8y8ok1bXgQwSSUGHqnyitG6Rkq8ArDrHiMmUnlzOkD6r6GTsu?=
 =?us-ascii?Q?5QIhBbcKif71Hh8Qy05n98WZ8zL6QzcOMc8sob1cXxyu8YaLAFW8OSdMumyR?=
 =?us-ascii?Q?dMA0vE/LcFGRYrcdBltNTfsCyDNd8pM8j1l3xciATlUZrLyqrhbn2MHfjNJ0?=
 =?us-ascii?Q?0WZjSmDL5tbB82F9eLN0VY0CRqkeTUXw7FeOBkbNsdfFO14grQfddl+W0kdL?=
 =?us-ascii?Q?aUlhhd7KXPttgapYwR825SGIiTsBAGkinX4EHvD2S3qmPoF4X6K7aHqAcdxG?=
 =?us-ascii?Q?SN0q3c3wfYgH8KYIs1kPmE5a42gtpKJvbbN/nZtZZoMA+IVfawH/cycLinAq?=
 =?us-ascii?Q?9xLrpnEKUrSnIPMUNVIraVtZ0qYdbk2uy0XmLy0GEMhbbUKId0KIMLHW5u9n?=
 =?us-ascii?Q?UfO3urSaPw6pV337t4Q3ypTmusMlb+kPU718odXDmlEizgZNH8JRLEgSQ1Q4?=
 =?us-ascii?Q?VRloeThu0TWGJAFC9JXSFm7HJEnr8aAC4sWaSWDTaFcsVfm41pSe9WFthfmz?=
 =?us-ascii?Q?ygLjPcNSU1MqYESS58LKVEeVUkebd6ZVi8ArQaS0+IGblnYxdkyzHp7UNBEz?=
 =?us-ascii?Q?PV1WN7RRoNw+DrhEN6++zYnk9dehWp8qxSDgEvM2HksgH62qbH9wEjAIR7GC?=
 =?us-ascii?Q?7ZJtATS+6u16xbQ6IItLd1zyn9Fi1gKqHQgR2GthSW3yQSY+4Dw4HwJ3u8wD?=
 =?us-ascii?Q?rkxNYFX7mdKLUi6Lhx1s79vn2tiNANApWXWfiVE6Z7hb6GxXGpOawCm3tzUE?=
 =?us-ascii?Q?Uf3kKCLKdRmuX9NT6g52G+kEIXTVr29xFnMjxbjZ4SGL9leH7cAeVz2OB3NS?=
 =?us-ascii?Q?PQcyRuJ1BizmdaFOqQohSpKaRlq6SPpQ70nQm55wJmaZzExehiS7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecf33d8-7563-4abf-1a9d-08dec1415fc2
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:26:06.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW/4loapVZU1ubFTvZqVLDVXOanmGpfchIi0du1lvx6fuacWUyKMFqNXQIuFsWKQCZD6lYrAjseBTxU8dc2G9CvfKiazloWNfnX3M0cBHPc+9mCsbC8yYsPdBeK1bRZZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9765

On Wed, Jun 03, 2026 at 01:37:17PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. Add control register regmap and export these
> registers by debugfs to help PHY's diagnostic.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - drop Frank's tag because it includes other changes
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b0092c34416e..cda88ea1f12d 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright 2017-2026 NXP. */

Should be : Copyright 2017, 2026 NXP.

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
> @@ -665,6 +669,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
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

Your commit message says: The CR port is a simple 16-bit data/address parallel port
But here you use 32 bit mmio, which is a bit confuse to reader. 
Maybe you can add the following comment before the regmap config:

/*
 * CR Port MMIO Register Map
 * 
 * The CR (Control Register) port uses a 16-bit data/address protocol,
 * but is accessed through 32-bit MMIO registers:
 * 
 * Offset 0x0: CR Control Register
 *   [31:16] - Control/Status flags
 *   [15:0]  - 16-bit CR Address
 * 
 * Offset 0x4: CR Data Register
 *   [31:16] - Reserved/Status
 *   [15:0]  - 16-bit CR Data
 */

Or change your commit log like this:

The CR port is a 16-bit data/address parallel port protocol that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

Regards
Haibo Chen

>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -694,6 +706,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
> @@ -729,6 +748,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
>  {
>  	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
>  
> +	if (imx_phy->cr_regmap)
> +		regcache_cache_only(imx_phy->cr_regmap, true);
> +
>  	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);
>  
> @@ -750,6 +772,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
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

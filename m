Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193236AB54
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597999; cv=fail; b=f7gkLG3IpURGH1H/gwuB0Rkn3A2kt2a2ZuUJ0rHKkUBb7hryeAwutN2OmTGtYmpNUsRKQTCOYjKr8APXSubVw/is4NzGQWyospj3+qWlMrIKX7Iy+oFC/ptbvimex9flUwuTjTydTDSwWdN4MEzuBoYqSRgM+BglOLRTwqZ35d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597999; c=relaxed/simple;
	bh=JgQ4avXrEkZifnkXCYWyun4r+7zxuwoArLJxJ8+qObA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mJ0kJ7pYt6MZGEOlrQYYV+8Db7PhC89xAMxo/+KGHB1vx9OXl1yjKK21uYh2IkAp3ZtrWXl9T7+9Mow6LiIM0vCZX2UENtuVoDZJ0r6w8yVFUn6uPmxJpKQ/aPtNNUztwT62qvJ3GOMDbzE6TsAQwJpBXAMa1O1G520uNZLKkSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YeYBESjt; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YeYBESjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN1BKAKFJypF8C2b5B/p7PNJFciqsSAIntiNfVc2i8Wmw1zkP+pPIKV9iLJQARbEsiE/ts8DVRuHrlNM0rpH32guA7jZTYreXrFibXoA7aiAY/2hLDY3yZFryEHCuaZUqUiIILxupIpvHhrg0BKq+91ON6gS3z4UGZcUbrSqabPj/3xG2lD9WOyB+nbjPc5mYjTr4x0UH1Iwz1YDxOyh1RJ32ipSvj7YUVe5q9uioiIROxcwjKGxwuswOrmjNLzbhblvbGU/ZArryhTORHGgo/VjWu3sfyp4IFXpO5Rc8gOimNcQPqfST4g4u6fWZY4ZJpeB4J0s/1LpsLD8IPaAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFiZAZLEKYd0K8SdQldw2CuoZmogpx3UzG232rIKVrg=;
 b=au8NKTCSgLW8AX80PmTqnMgMC+xmRsTyMRNRlPeh3WYEsjkuedGAiGHcLWnveDKyQi3H7uP0t4SLV0Vbxj5+IuuVQ3bAXQe0Vcjg9uoYShUhEII3I+Wl/tJr98fFHSikUZX8CVyp7Bh8wzzZkRf5Eif4FNPQ4eLQJLEGW0RdUrEfBo/Ahp/oGifJOvix6aDRzky8RpHL4zyRbLm4CkxumTmlKanglC9HwBo9IU3BY+CUtzv2gnmQuq3N5Hg9jAYeLsHM8ydXev9nfFAvqwuvx3CvW+ZZufiSkf5HDACeBQMWuYMTi5bXNJkcgmTUVfFeKE9o2JGe1zl0r1eHYe0CDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFiZAZLEKYd0K8SdQldw2CuoZmogpx3UzG232rIKVrg=;
 b=YeYBESjtG84Cp49OAU8vKV9L619GoXdUvoj6dV1I7ZtBuQc66vaSp+1RZbBdpUd7nK9Tm4/XT4G5yntgz7svuMzyLPqG5sq2di7eoMQLgWyvztKlQIuiRLjZTM69gUQIlfPby05GtXwaiknyb7fYwt8XxL931VHxxuJS06PmRPbLJSJWuZHjW0jxbPl6WkntmvJxT0ki0owGWJDPugDIpg37vakij/o4xDwHIecspn8S+L8N9PhAWE98GU1BFAkdZth68Nac7l3VQOYT9coaQTEghPiweffOk26ecdxk/vDC3PkIyCkjmxRKBimAftM6i1Wfz0HXWanR4AfeN8W/gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB11609.eurprd04.prod.outlook.com (2603:10a6:102:50d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:59:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:59:54 +0000
Date: Tue, 12 May 2026 10:59:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	a.fatoum@pengutronix.de, franz.schnyder@toradex.com,
	stefano.radaelli21@gmail.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add control register regmap
Message-ID: <agNAY48qIjUcywUd@lizhi-Precision-Tower-5810>
References: <20260512101212.1498223-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512101212.1498223-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SA0PR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:806:d0::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB11609:EE_
X-MS-Office365-Filtering-Correlation-Id: 68cecf92-10b0-4374-20f6-08deb037204c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|22082099003|18002099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	USaRAlJKS7AgYj0ND4F75kzdrG12DaiyUOUTTTTT+sN9FKYpL+a5Y1BiADA/JwaA0gC8KtO27WDbCItx3ozHrhHYCqGInQBMPqj7hQw+l42yjnCDO3tO/uGYMPmkyPB7uPJE/3caLHMltoDfvfexH42S9DnA477YZdIJTTBQLT1Q1Y4JheMoLuJvABncuv7bT1iDKuVzQij+TkGJRWjGkO/QMCpjUtofeVDVFuN2KAWNUsnFt1QY0FEgXu0V+b02IF2yPFM3X5Y9MAF3/11z1a/pFnBiDjKz1GNBJphjTePEyoyB7VgD0ZLAeB9gIp7sLJulYTfAajFSC5koSPwCjmhEE9Hv0iYlT9Rwhkoo539JfQf/XjAjKtkblhasmUN22xboG0elXJOtKl1LjGKL2Vp/w3onv8LMgV2Hv58dyWrX9TSbRgsH9z5306lIsIMR3UPXQg19/T8I9X8jHm2Ddti6/EBYH+d5h5MV1bzQmk4xCrG8Na9Jb2FLp0ifvhTP81usesvKbb1uFHZCdLpOtwKdCUrAx2fulOMFg/siZVPLZnGjdPKJnuorVLt5SJuPVwWWOHVt0meKuA0448KrefZ0ak5veY7U8C4/2heAWVUWh/seIrRjiFug4PHHuIh5z8QGTSSiYTcyssodzBqnDToBWuY3gTlJKukDf8Y/glB/AN6wkDE3nxmM5mTan7czZvhZAbvp8dCYl1XaNdkgKSI2YV+/Vk3x2lMloqH5mS6spfBq/lL0VjKvoICuXuCZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(22082099003)(18002099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CAk9YM1KEejdYfPRVcguaqTEnSrLwqKYnJpSLd1XlxRouJfVuOCzYrZp/0xw?=
 =?us-ascii?Q?1clJgJUk2Gl23mfrQW8UBPgFkOLI+HtRRqLsVjs6aeLujL0Qlq5lH423hjwO?=
 =?us-ascii?Q?d3v7i45pZi6DBTd/OvpHfGaNURCtWX7tyn60M+YIJ4IMu16bKG5XuVATAoHq?=
 =?us-ascii?Q?M+YkRlBsW02OoEMbDL4ppxPm3ds06dxUXI3PB47ZpGJUJbrmlz+AfjnrC8dV?=
 =?us-ascii?Q?WGQy8wKsm0QTOYr30BnnxXG7Jcql8I6AIRv09lRK6iSF34eM88uEOAH2eIlG?=
 =?us-ascii?Q?WzRi67XlWAvSFV2ahyzWIi7sypps3KdEau1HCYjqsflUbxI9oofc9XB9aQ95?=
 =?us-ascii?Q?PcedcpwkUQNGumhlGoUMV9fRcS0nd+yjs7QukhjbjW2X9rRMAr9Jg2dLvHcR?=
 =?us-ascii?Q?mPkNnaq93q4PsPq4Qe1jhAtQNQ5f/epX2/C5f0uI4VagLpXjlv/XAuFxWREq?=
 =?us-ascii?Q?83QCWK1L66pw3MLg2vLoDo7FW8Oh/11IDJ6h9ZIBO/HLw5SMwx2ZbmVTshDO?=
 =?us-ascii?Q?eO/VlqSPJfaNGAbOAhmp4zGJ49R692ivxEZCCvR1qD5Q4+gKUAyaUL+75Fpq?=
 =?us-ascii?Q?Va/QoObZf+FkrZj6JbTCbT3JK1G3maa/q1lQIQphnvhzUXGMCJA0xymKvYo5?=
 =?us-ascii?Q?h3L7kv0CFEJB5mqKa/kSo1I9Vla0JSmc9rtWo6fk26J6/FUBLZRm/xXPy66s?=
 =?us-ascii?Q?KsazF1E+f1e6yR35iD9X+zojrnKcZ4kJLTWg+7cYzJ7xkRm4RhgHbcLrh6+9?=
 =?us-ascii?Q?XDM0mKMOJ63K9Fil6VuU/wzvG3UwOdVKAs8yfVvoaLufc4+6lQ8Epr9R0maV?=
 =?us-ascii?Q?YiRalaMxR+QnQPnWawIjnj7y0ocWoL+WCFiPqMtoA3iAGnzt7/RbMi/ynRYV?=
 =?us-ascii?Q?IP0e18hCmZW7TVWhNK3/KASzjXbYDapD8dYHu7HarMYVkaRPd9UsXpJc2Ya/?=
 =?us-ascii?Q?DeYz2/NTzrUY5syXeziIrIR/wqEfI7JLeQB8l3j+jPZHZRf0bKvDoPZtw5cW?=
 =?us-ascii?Q?QdkEd+RCLEnm3jbUuOxbrMrC8Y6KM4tGpW240HNG+b38ZfjkdiaLznLIrm7l?=
 =?us-ascii?Q?SzL6ag0gHCJ3qKqZh02vib0rvGvWjm2O1yHBnNeJJa18+sF6YWNArXhCUuj2?=
 =?us-ascii?Q?p/HL5kfOi8TdM7ghGMKbWVz1ZoXY3088XwFd6Fed7KPLHDvpV27jgQOhpmDO?=
 =?us-ascii?Q?mb0xIKZNiuDQXFxtloE7EBEJHoRtwXiczo6A0ybOXDdB8qdwXA2jCcLMfzIn?=
 =?us-ascii?Q?RrvS1Rm9f/4CYA7QZvQl8mW0rV9Lev89PzG/15cqr3xFjvZn7XG/TrQcNCCl?=
 =?us-ascii?Q?4QPTkv8Rqn9agP9x/uADTEJbip6B++/wt+V9SLNgTQqDdvtgbj1F8RVGi/3j?=
 =?us-ascii?Q?jY+RqXrb9PQnabZeDvfAg1KDtM9oxODTkuD3h60lJhuokR6JzrrcNm9MApu5?=
 =?us-ascii?Q?icoz9q6Od5OwvoT7bDzftVON25Gb24IakCy60fO1I75A2jj5ngZqkCmGSGCy?=
 =?us-ascii?Q?9/7FRY1feqDzaft1pyNQQaGjVpgtcd6RRFnzjKckaIHhLdfWuAKOg01K5Zuj?=
 =?us-ascii?Q?3P06K52hqbakTUdAuJ5zSlg0KOMyDKSo0SA5zV7kRBpQyV2/BRq9XWk44k4V?=
 =?us-ascii?Q?cU5+HamCeI8/NEQr9TTQ9r6z2IVyMnpAQAxKLZXlzsyvNhVOQyqKh4+imDJb?=
 =?us-ascii?Q?W5O+K8fYlyubkGfGNVdTxwyHrABhinLUdaWJVd3YTTQ0yG4PIBdofXIvJ/FV?=
 =?us-ascii?Q?X0tcBF7Vaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cecf92-10b0-4374-20f6-08deb037204c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:59:54.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8DZ7LuP3PWcgqdBxMFTuHzUKNMnTu1nGHqNB9tT/7TYA9ebXj/qn6PVVagHobgdvjj96476koNZomqmkeId9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11609

On Tue, May 12, 2026 at 06:12:12PM +0800, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. Add control register regmap and export these
> registers by debugfs to help PHY's diagnostic.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - no changes

Do you means "resend" because not change in v2?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..958d114b0c83 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright 2017-2026 NXP. */
>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/typec_mux.h>
>
> @@ -55,6 +56,8 @@
>  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
>  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>
> +#define PHY_CRCTL			0x30
> +
>  #define PHY_TUNE_DEFAULT		0xffffffff
>
>  #define TCA_CLK_RST			0x00
> @@ -118,6 +121,7 @@ struct imx8mq_usb_phy {
>  	void __iomem *base;
>  	struct regulator *vbus;
>  	struct tca_blk *tca;
> +	struct regmap *cr_regmap;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -685,6 +689,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
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
> @@ -713,6 +725,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
> +						   &imx_cr_regmap_config);
> +	if (IS_ERR(imx_phy->cr_regmap))
> +		return PTR_ERR(imx_phy->cr_regmap);
> +
>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;
> --
> 2.34.1
>

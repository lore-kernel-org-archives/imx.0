Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33A2F6577
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406547; cv=fail; b=tdcGr7SOq8jm+/WabMLBlFH2GnaB9c8S/iyNis64MhB6l+ABbL15Z5Sv1QgVqqIi11Wuqdvd9h8U+4NH7/6dl8S/AE2s6HzeizSg3XiAmCCZJ9eka55KDRPpIQoMAVw4j9ugjSQ4dyQRwxjXZ5E9k0KfF66cRadjkqZ3jQcBG08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406547; c=relaxed/simple;
	bh=nxdv5I2KTBSTzQ6HDr+smMXfugKc2VpB++6SwwYA+UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c0QdD5bo++59wT9FfWdmPwaLUbhIP/bHaeJratyiW0lN05rt/+V62FImznyph1RkBZvyyYNoYredWbomf05pACpK7s8y6f+VdxQ0DPl9UBbAP5iw5BE6btMlMDHCXUG2wcCsBxfulMKSqHyhy+17KYB5CreVDUu5RosDi617uck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JRUwY1C3; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JRUwY1C3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrInHiNirwltngvpuVeXOutgPKhmOtpCxOUWdCPdFLQD+zerVObxWv9iKYI5Pyr3MO3F9FRjjtbx0r/XlsJIhwN5pVJQvLj/4Sz3WqbiuXnVFP6YPir7LexvfdrmIj0mhOHpOqKSQWesjeFLR6EdS1t+n74ektMxUvnFyeCLuk2Xy1iOb7OYahh2sFuLJURzE84TY2W9YwViWctNED+x6tWIeXrRSIfFb6vYkr+DnNxtjt2AKb0Xp2hI+c5iPNAVngY2mpe0Zx3bsW3pCjNjjCR65Qd8yEg9JHkuJfguaUwHNOJ89jQ8vsuPF7eEl2ewkGUSvdVWeZpHLW0+HsqBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tBd5qtlQQM6qlQnK4AAZQbphq/ZXnGIATGeRrlMWqc=;
 b=qa6JchrIu8o+0C4RqKjxdbgQCqqrBKO5QQZl3wkHFH+7JF5wE1PI5NqLo2tJDZRZV/NBMeBw6DM+blfRLFCgxXBHivSV6vg1zC54ahfwzOpsiz8Fm9Hhu52QhGyLSvDSFxMYWv3qvIK3L5eZZI1WaewQNOqFuhbqVyuqF5yeXSzNS2UDBSFVZYnjp5wT3EQ5C0oceXuuIAaTrI/hdNqZ5GCYhPTleuQgj5xISgCOt/KsDzvr57HQoZz8/Hw843cDDiJyeNXSQCyHSUVzLxd0skbMWrAQu0rp4LgO9NM9GUviawqXCkVyRP4eUzLX9mZFAc/qkzS3nrY7VWJ9a9T1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tBd5qtlQQM6qlQnK4AAZQbphq/ZXnGIATGeRrlMWqc=;
 b=JRUwY1C3vSNQNVFa2lRUcMf1O49l/6nht/j2c6eBukJ4f6SgQ1TUpkvasa5Iarx0u+zZuFhma+CwBdMv+gvzdhkzFN9VmPCtMnFYvq74RTLUpOrUxDehp/r5NqALVxqb6+y3QHLotHuytRq/MlN24bkfY3OgsYmnz1SKppldwAe+5sPbU/ibWpy/3BWwiAdE2d4nyrKI1TC3C0mnckBqJBHiSS++je4XUMcyKJF5viECbtbxqvjDCwpUNukemlxaNtQ1srB33sedSaQlIqSsUawZOfDsqCBJRIM5YDL+INSwBbnXDmNcrv25OvG/DlwSYE8EGKapTiys7BK9epotsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11591.eurprd04.prod.outlook.com (2603:10a6:150:2b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:22:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 13:22:22 +0000
Date: Tue, 2 Jun 2026 09:22:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: fix vbus regulator leak on error
 paths
Message-ID: <ah7ZB308_yD7aomh@lizhi-Precision-Tower-5810>
References: <20260602-imx9mq-v1-1-e58b912923d2@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-imx9mq-v1-1-e58b912923d2@gmail.com>
X-ClientProxiedBy: SA9PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:21::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11591:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6aaf11-22c3-427a-a0d3-08dec0a9fa8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|38350700014|18002099003|3023799007|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bMkBW565VfdZGfKFhWLIBhQOvl7miLl7r5e1Sib90doVMXeXWl1OT8TPMVxx4afm0dUwhV6Ko4KeWK+TlkKtM8Rp7Sj7HNR66uoaeiCekLwCfCa86/1XGzRsTpXeEAxRi0xxASRWwKcb3niFoFZW/JwMEfZddpSbJaCH+M7sUP+bIMQiZz/2MM/WcRikzIJCjjoa9JKS2FMtcrf5vrpAtjmj+hqm+wL7NKH2whPlqkIuXXEnu/5buFjyf7najpzFpu0x+Q4cZZIzYgvx+1XpmD43E1KIy1gF/4ifI50WMapb42klTxkWrpRzK/fp969AUP6STc+KhWcQ17xAYVgF2rdcSO4ba61DCQx/hzk3AnG9e33yn1TPi1Otx6fZtz5iGkPraSzG13HjbodmzrwTr/WPUJYmMFzmzJw4O8BV5erEVvL19v4PC3WIHY/etgOlSmJ9RTz3a//TWaHcQSGMwAlj2tnyy95XLxXBe+MZKv3heVMWpJo4OvPkz2PJ4ox6KM6ZAY91EQmJ4jlWZx7r3lQauu6849ViMD8Pr4PXDe9Dll4IIXfpOchIFjs4jm8MVXdpgKHmb/IN4RpeHfsLKWl9rPcRv8CqubpD9u1fSO23Fn9NH9W1gxyrE5q15OG+jvq3vwI9lXey2oi1A9FkYOzvLACp5X5YEw6VCSfdcFjrM+IQqd5YeTw/RC8+yVMqpa5b4WzaPfT2tnSdyIgW/4Vj61IBCl3PsD87tYn6EO871oYflbAk0BDWAEdpyROl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(38350700014)(18002099003)(3023799007)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ACqeLoxl22BwfxLtLwCQHy/yEnBYlD/eSrvktj/ATtv0NaOHfIJL8QEdxAIR?=
 =?us-ascii?Q?qUhsGJbLSXALifbqsvj7NpP5qmaGQX6wBR95sqe6DEMsgn1/W8I1CBmZZ152?=
 =?us-ascii?Q?knCREFZHq5J/9yJf6YDfwN7jVitvHobM1C6W1OOZpqEs4+MJLLV+qY8ynKLa?=
 =?us-ascii?Q?ubt8nB6kjNuiYouz7RgRzDQMXtQ+Vo5+12uZSjVpiVurvdxjb9kRRxSjwjjl?=
 =?us-ascii?Q?g5lg9KGWbWsDNBFhePKRuerDsa2GammmF7/C3uT4jYzQNFyVyaoSncAnR4xT?=
 =?us-ascii?Q?v2618aNiHUkhT2X/Xiz1bvXZIillgiz75HwwgsicNd8JF+zSoVso615yAHJr?=
 =?us-ascii?Q?DX9FSUVgqohoUt2s6q0Hz09odJiolmYb4BYdWNb89Be+kAjyJZybUXTMr8yq?=
 =?us-ascii?Q?/YALm6La91qaqMpW7ojd1LX5z4berl/sSxbAI/kulnJWvUzZ4rNQ4n2aFghf?=
 =?us-ascii?Q?QsOm8/D481CqVo1OSzbzHw2dN/2+35UvFCFky15TT1xL7aXYiUdGa0Ldm4nJ?=
 =?us-ascii?Q?w6c4kgI0KxC06UhxuQ96tptnflulkFM8uR06qgmIbDbCNOc0yOE+3h56z+sP?=
 =?us-ascii?Q?FDnMr9hM5QsuMUl4H4qyE5Gj2GzkrofNnKphqhT+Zli5JIjCu3GILq/ng8t8?=
 =?us-ascii?Q?w3jJzdLtMv6tE+IhmCMs2Oj75RDdVnhNx0zlvUlsbnhPx0M2m1YaXlAhyhOs?=
 =?us-ascii?Q?ltwUlI3rRGIIotn/tOg/oaIZZsxBvXLWa3KbVVXSp9IdiqJDjHqmwqlMXDiK?=
 =?us-ascii?Q?DonyIbkOnFx+pK9cUqSenad/i8+hdschUdM5uDBPYkfX1afmKST1ShCJ4+4f?=
 =?us-ascii?Q?oG3DouG1LOXOOcZE/rGJi2TK+qqrneg0zO7iOWEle32ftTvHNBk1d2T/uoDW?=
 =?us-ascii?Q?mo8iUkCkWzD7cC8PQMSuTDdcOiKkvvaWr3wX5SF5frofLvpGr6/YzXTpvisa?=
 =?us-ascii?Q?Lo/ITqH1HXD998OPql+ZJRXArYUHUL00yaMrqxUbgIqF3CiFJHchU85vNOga?=
 =?us-ascii?Q?uTW+iPc2FEsX+Fn7+rMCLBmNNMp8jTUoycGxEvDyozN2SNtDppkK2Nm6h/QL?=
 =?us-ascii?Q?MwKdUjtvSxelhn4WknqlF5Eg63OgWt5PF7q3jv/JykDnxEci/JxqfGAnfQ65?=
 =?us-ascii?Q?ApWpQl0sgTfjYW6Ll4TSqCcUDcko3jy7vV/+XWo1LGmiqNhlnhxuX/025eVb?=
 =?us-ascii?Q?GOFm2HGM1x7WjW/9ygu6MIuMlshtd/n42C0NJ2bQRkgF1F8So2DGrC5Zndmv?=
 =?us-ascii?Q?Mtddc8ngrSqomM3BjQHqkQIh2I3blvdTF+KFg0UzqeG0i+eBP35oplZUAo5M?=
 =?us-ascii?Q?ktG4bXzdUavXF/NTvfSvWzCz6UcMzbOjNATtD1i5EXTIrPO7jnAj8LfUd8iT?=
 =?us-ascii?Q?UBYRLNGhKETvT5gjogfaj67nyuiifos4ywkpm7riC+QloqPa5fN+X//U5FHr?=
 =?us-ascii?Q?Rymqq0sR+xBgW9pp/w0FeXmhHywgAed5l3MaBADd9U2h1l0NxYd7ZPKnZpXZ?=
 =?us-ascii?Q?PlKyR/WMkuQhxb6G3BXdX6Af2XLhmWyTBwm9dlk3JEIJg9rFMKyJ94ksSp/W?=
 =?us-ascii?Q?eG8Cbj9Gc3Ab4P2FH+wmLEf43jkMQcERloODP85TfaV4vjqOuDl9K1MfbAMK?=
 =?us-ascii?Q?WNHJyGSNqDeERGfauTWeROya2VbLVYHpVXOtbNDFXO3alkoqTrz0/UsMhW34?=
 =?us-ascii?Q?c6USxygV1d7abRk4U/IW3maTwBhbQ0f8A6PjGSPXcScK+Rzv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6aaf11-22c3-427a-a0d3-08dec0a9fa8e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:22:22.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HerZrxx2AI2JWzRHSZ3qoFhri4SQa+WG3BQgVmjGiJAIXUAGd1UyYA2EpulcPEa6vxsDehEH1A31Yn/pgcwigA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11591

On Tue, Jun 02, 2026 at 09:14:33PM +0800, Felix Gu wrote:
> In imx8mq_phy_power_on(), if clk_prepare_enable() fails after
> regulator_enable() has succeeded, the vbus regulator is left
> enabled. The same issue exists for the alt_clk error path.
>
> Fix both by converting to the standard goto-based cleanup
> pattern, ensuring the regulator is disabled when any
> subsequent step fails.
>
> Fixes: 3b64ea4768e7 ("phy: fsl-imx8mq-usb: support alternate reference clock")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..e45e4f16057e 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -627,13 +627,11 @@ static int imx8mq_phy_power_on(struct phy *phy)
>
>  	ret = clk_prepare_enable(imx_phy->clk);
>  	if (ret)
> -		return ret;
> +		goto disable_vbus;
>
>  	ret = clk_prepare_enable(imx_phy->alt_clk);
> -	if (ret) {
> -		clk_disable_unprepare(imx_phy->clk);
> -		return ret;
> -	}
> +	if (ret)
> +		goto disable_clk;
>
>  	/* Disable rx term override */
>  	value = readl(imx_phy->base + PHY_CTRL6);
> @@ -641,6 +639,13 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  	writel(value, imx_phy->base + PHY_CTRL6);
>
>  	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(imx_phy->clk);
> +disable_vbus:
> +	regulator_disable(imx_phy->vbus);
> +
> +	return ret;
>  }
>
>  static int imx8mq_phy_power_off(struct phy *phy)
>
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-imx9mq-30169239b590
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

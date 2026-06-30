Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B53A7F50
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846826; cv=fail; b=dl/ZaoVTeszRTCWIipQ4y8KQ9veA5WlGrCbl+mmSHzBUtuXGih16WUBLthh5s0IZffSikMnQrU4Slefrqz/3tiXNcJrxDQIEif+SXDlRGNjohn2IjPZYD72PQ7c46hSCTDNpEN6GGCB66yhXRg6S7D55mmUIZc2adKdzT7iVRiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846826; c=relaxed/simple;
	bh=306TJYK6arytHdBZgX6lBd3aOWXqHJrXzHrwBuVqOBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CtQZgoyspqknos7A8Vh7ENP160JgU4QGU4OORrtQx+d1nJBY0jmEw8zpJJEJnn2sUwDEn2P+K0g6Ycul2//6t2J0xVOAfUQzWWlcN3OE/Gv5tzyAKG/gIuQLBbaAe2t+FZAvzUnE38rxJBPDMYwzlah4TyFnzlBAnyu0XOsuz0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BNsbdD+U; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BNsbdD+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgYCiP7oCrfuNEY1zlKefbCFgh6fRaYUpQmMLCb/XjYFiMttemdWc7zuE3cAnwMPbGgmLazeO6uCZgkSDCP4pGKXMPBroSpnFSYnfy1t9B7QgwK4paUpGWaakCBZiJkg1zBs+peAF0bTKMsyQGo44Kh/ID2mCjRQDggpgqV7H403CB0NGfPsiPFvnOPpab784XJ1/CdWsAVYTIgYOas3JyfGSwDMYNzJL32GHpDQEDRgFehFLvHGtHlAUF4a5CkRm4QFrKLxyP7m5V+z3/FEjjqRgoTd0B0Ml/6HRWvdiFDR9EaNxhYHBQ9sRxX589Yiznj4Muta3k3i/YBq7GrqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFIAhGsRYfvYI7/ZjMGWZLtYo3mclXkaptiFLvD5wtY=;
 b=gUJtq8WQiC5IQSDjp9Ly97PwQA3zLCswMhTYTYyUosL2EgJkqv1hFkyXeFHV8+xZozby3uSWG8wnrOkdcWn6y1NModcu2M4rpMbW5K1/x1I3DRJFXaw1u1d3Xdb8VoRvhD1j/BLe/lHFzmoMX/9mTLpN7yf/2hMKZPVuGlRKYsoYsBmE/sa6KeEqVopCynS86GXXQQrnCoUu0jP3nQ3LbeAsxM7fVA+5fMsgT+LUWL/onXOXnDO6VEEggvljW9KAsL4St+T62pv1C4eblZjJWcnQOmgz1UyZ6aefwcTbx13rANTPz1v4IVEQXIE48/B++XGOV0zJZ2+DpWehqUi+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFIAhGsRYfvYI7/ZjMGWZLtYo3mclXkaptiFLvD5wtY=;
 b=BNsbdD+UzbG+y1+7fNinNgvoVqCM0S49+ZTjisE67ln8ssO7+1fwnpnpSrULA3WL9yR5ph5NURXEvhuMCj81yYS9GumO6aWlFDcULWmi4JindRSTRkPfN9tOXYCGlLmwzyZmfaHk4JZoGEvEPHPfEDJ3+KjvTcg5g6EEm4nZvwssAG0DgN1QXDjthwpukq0b7bC9geJMiZ3jM4lRKOntBZOO+AMipTAw0hhEX12RxjBi9Z0uX1Gt2XWnfZxX7YFlSfOkiCmPa/U2hargvrHiERobqzLDGa2qh4MMjL+Yt+kMKZGF3dIrQCoWNp7nccG0JOtqGzTetyiPisjp+24enA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9981.eurprd04.prod.outlook.com (2603:10a6:10:4d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 19:13:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 19:13:41 +0000
Date: Tue, 30 Jun 2026 14:13:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v5 5/5] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <akQVXYu27qG-SobS@SMW015318>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-5-25d616403844@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-5-25d616403844@nxp.com>
X-ClientProxiedBy: SA0PR11CA0021.namprd11.prod.outlook.com
 (2603:10b6:806:d3::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: 959af54e-8d73-4e22-4508-08ded6dbb287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GyP5AiWaMMksa1Cm7l7K9dWDlylwiyarWT8cK7dmm0Jmh2NpUpClu3PNx9wfwqvj57GKxumUJPcAyjhsV1DWhdZCtPJp3X1gdjG/NIS80q6UXWIKUkdwOu9HiZNlapcd+rTMaGsu8aPr/WsiMbzjnl0H85lWbe5pCYXHNBY/CQG112tS3N1O4aBYljXBCUlLMUfNI6WBMWOxfKuL1smDKkvfwi2n3p/rheauAdTpJUy4rCmVrFiGUUpYgMiLdtbfC7seSN4ZpX6lVmQAywHs9VG8w8767GB3hQMW0MEBK9FSmUkB772nVRW4x23woIYcgFTQ364xbNi1WGHhaltX7/JzzuwiiRQKg/61px5Mq+TO6q6g/Vq3f7iiSi7H8M0Pi2aCLVvI0pILGUPkV2+SpxGtPwI22OqrebfSKYdz+BCU1yO0JlSh/v7qwJoE2fYozhHtOLLLYs6C/H77EaPD4AMTk41lnkpy3TJt3/bvDo0vLhuBzKGK36whXdiV73NDGwETSETqOLIKbYclp45AVxwhr8Hn0iYoiY6CD96rn8QpWGKpSDKb7OUxqQmVrC5fWtYsstggecGa4wJfV3jGO7X+lXvVVXsm1ZNKgkhg4aPrB01+ELTBVSWg+jtKEorEafsihk3nw87dq3hnta0F21zUORRjHGaFZ0XF4Zm9yoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?19CRXGQ+AmzvJWJOvj9gfSL81d+cGfX8DiZPam6begLrBfTJ5F3o3RzrTdY5?=
 =?us-ascii?Q?kn9EnOsUdxj2HIHsRji9H5uW8UkcA42znkc92gG9+jVqmuH7PFjo93k5BNTn?=
 =?us-ascii?Q?p41NzJzICycecZxGePofd0S+8Sn8fV4x6c0I+rhHZG4LF4r3fq4nBcprCwGS?=
 =?us-ascii?Q?P8IHCXF6SwnrV/mlp+c/zLrTuaYB3K0sXgmXP0maRq9Z0w2bA62//tsgRUNC?=
 =?us-ascii?Q?FKwQ9nPdPnx7XDft2FGaJjU29ftdH3UGKBTElXTnhGSF4FoioF7ziACDyyen?=
 =?us-ascii?Q?LZ3RKi90cIKzq39BDsetad3YVSoN4gRr3M9wQR/KjP0idPAynmP4wTWI49hB?=
 =?us-ascii?Q?xMelAdny5qDjYlzsogROuu5z7hDIplxDNqqanLf4LzFEGY9iwkuvKidtBj/D?=
 =?us-ascii?Q?bq27a+kJtY0cFMxIMyhY42A5cPj1nU7hFI6CY0M+gpZQh1wCFgs6yRj28L/D?=
 =?us-ascii?Q?CmHcBsQwuZVlko+0eTH/KrQ2iaItJLzQSgS7FKAWdEKpHgt1+zmitM/9/xeJ?=
 =?us-ascii?Q?SA5oapTHjofvKbwu5Qkj6nLVq+LZntXLfZ7QabNDYA8RNNeNxBZnBfU+9Oem?=
 =?us-ascii?Q?S/aFBLeclyK74ZqJEEknUz7kHl/3LXAnD0uJKbxHNvAet0X4ZF57LnArfWou?=
 =?us-ascii?Q?BWOcv/D3AgEfegkGox03dWV0QHZTOQjVce0O2sg7Xciw3EBntDrQxL+0bjPx?=
 =?us-ascii?Q?HmAo//Cm5PLADPJgcoxlm6bfMBftPxeq7898kb5X1D3nIoyzqrOWTznYyx/m?=
 =?us-ascii?Q?g3hWUXqa3cD2gi36HnpV2qBeJbRahX6ixT+l7NGnHt1v460CpEX0ZIVukVWe?=
 =?us-ascii?Q?XtRYY340tr0HOdIU2mo9sS090o9cfR8xMyZ5s+lQJTT+U1wkuiu18kp5Qz2X?=
 =?us-ascii?Q?iwPs7H8SMT4cd92riq4d9701i/40nY1i2qzDI28LX/960/DABC9m8328tE0b?=
 =?us-ascii?Q?M56KkgnaE1vkleUGI+p7iz5fLn/dj9ZB6KI1nvP/py1TIslh9B89Nz/3cvYK?=
 =?us-ascii?Q?D/+SFGnzcDpzlV6zmOOjHiwTrymeSCrE8CZ8VwBJoz8I+WiL17D/i8XaWeUL?=
 =?us-ascii?Q?+qiahuh6sRCOGQu0ot+Iyg3DcVvwgnBqgoxk9R+iaqeiyHEyyrYrT4hhfN/j?=
 =?us-ascii?Q?KqhQGAU3/DiflEbrJFQLRa/DtFG+jb+bjvaWPLhkMVoFyuKtb4bwIQExph5L?=
 =?us-ascii?Q?pU8hE7YX5EvqU/D8onjhiPXFHNHxlCkPSUqXOU9OyW4HGOft25ACd/O221p5?=
 =?us-ascii?Q?npOBjFKtVAdc73rSqJHYniASh+nbNt9kwwir9IzNGI3HGZnLqUxmN1w4t7DD?=
 =?us-ascii?Q?FdJh7owfxRCisUBRiN51M8S+rkXdpluysznvv3vWA5JEtw30JwzFXGvsaiYg?=
 =?us-ascii?Q?3YjfcXTtsJZ05l4aZPqVyV4t46IqJk4wrTGIoTVdx1iOxnfmp5bE5+p1Krk/?=
 =?us-ascii?Q?NKKXGyXLoLcUT56XglPBOatkKWvb4t5zwRX175NulTu2KbiMDN9iRtsKDlGm?=
 =?us-ascii?Q?urw0fOch1VoXNuqBu4eL3ZrlHBy+mOhVV0WPJ5MpU1CjGPqVZfcqcvrFeLsm?=
 =?us-ascii?Q?GsQFCaT8GW3D8xbYth7H442LtvVyb/5S3hRHCRvRApGhWTcfJUcHoZk7Cyz5?=
 =?us-ascii?Q?zhFMvRee4E+TKUEBt/BsajWw1hh6bgFeU9Mi5RKY+swiWKMWyvOsr7uhH4Xy?=
 =?us-ascii?Q?4dVzX4ZFbbdHsCEvJakD+1UBkBR1dsNgBcGYtbi3S8EPQ3kw7pD53MxmybQd?=
 =?us-ascii?Q?7ZochGEv52kU2DlNsWQqG2hFUqVKKqvp5zvPRAGRCmc9b3s9qGAT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959af54e-8d73-4e22-4508-08ded6dbb287
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:13:41.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oiSixa5GTQS/2Qth9W02O2bHZ9XumTMVndI6iUj5pyFLQdDdg5mHLKzf+/pTb07R84iGR6uCqw+cB/W0a6dkDG+3WnJdaW/uFYOTxai/XcgIvBSC8/kWeMWsBmZEUI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9981

On Tue, Jun 30, 2026 at 06:11:32PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> never powered off at runtime. With the introduction of runtime PM support,
> the power domain will be powered off if the device is runtime suspended,
> which breaks USB wakeup functionality.
>
> To preserve wakeup functionality, mark the PHY power domain as runtime
> always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
> new imx95_usb_phy_ops for i.MX95 and introduce usb_phy_is_imx8mp() helper
> to identify i.MX8MP PHY instance.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v5:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 4949ec78d304..c9741b532663 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regmap.h>
> @@ -660,13 +661,20 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>
> +static const struct phy_ops imx95_usb_phy_ops = {
> +	.init		= imx8mp_usb_phy_init,
> +	.power_on	= imx8mq_phy_power_on,
> +	.power_off	= imx8mq_phy_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
>  static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	{.compatible = "fsl,imx8mq-usb-phy",
>  	 .data = &imx8mq_usb_phy_ops,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
>  	 .data = &imx8mp_usb_phy_ops,},
>  	{.compatible = "fsl,imx95-usb-phy",
> -	 .data = &imx8mp_usb_phy_ops,},
> +	 .data = &imx95_usb_phy_ops,},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -679,6 +687,11 @@ static const struct regmap_config imx_cr_regmap_config = {
>  	.max_register = 0x7,
>  };
>
> +static bool usb_phy_is_imx8mp(const void *data)
> +{
> +	return data == &imx8mp_usb_phy_ops;
> +}
> +

It is not good direct use drvdata as it.

Can you add new drvdata

drvdata
{
	phy_ops ops;
	bool always_on;
}

in follow probe check

if (always_on)
	...

it is more extendable in future.

Frank
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -721,6 +734,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (!phy_ops)
>  		return -EINVAL;
>
> +	if (usb_phy_is_imx8mp(phy_ops))
> +		dev_pm_genpd_rpm_always_on(dev, true);
> +
>  	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);
>
> --
> 2.34.1
>
>

Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764822773F7
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432103; cv=fail; b=g9VTuWl1HUH7CFqOQ+HbYwBhQ4fv4he6sAwczDLq5/YBj1m8vybHJshNvSKdQZKSeN9Sj9ymp5uE7evzHX10lPj/vo+ZXQxFRy58C5LeZdWb6BH6OtRv02Q3MG4OUhhRZO08eHSUb8wz4PbLwxEsdBbGaHWybSGdw2PAti1OflY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432103; c=relaxed/simple;
	bh=vK+ixTEtfiGyFu+ePJ+wH73ufar4raZl95I4yn+9hoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n82lYKndxIezBpJziclyrkJqS5Zc38SO/ZkRQSOHaTgFAO6VG95IxNLnCbqUF3KLrme7FaNQYGK7Rh0Qqu6bWpemMELOKZUxPJn0uMLH4X1f8xgez80ZZRKLjybPbUidZq+6Yk4kEJnubduevkGGtrENJ+TYK3IfxDSNZkkzLXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GuWPWk2z; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GuWPWk2z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Riav05vCnsPxdsyS6LrQX/qoORDEgSzgVL975BddYienF0LBGE7HWkklZhJONKKycgDg9xSlEjBruWwTMRoUOkOYDRAVX4ilcacG4HJkx9skNvqR2wjOitLhTsg/q3mggsicVTd08zASea1L3WWRBxT6bP19A3C9jA4VKzyjSHRpb8WGNhcsdteKP1tlCvoCiXXlgVohhgTpC+LHKZ7wVXKam+qPqud6S78s3hIh2I2+AYOdMOfoMe363LfTRI92vc6plbm36svqCYLM2NWiq+ueZlX+ilMRCs+2Uxx8fkZpNYP4uSScWtZMeJJLkKbnadiZN4oNXcMvqMXxkGFccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umRqQ+AXF9kAqx4ob6CKOS1CjIQKRTVRkLILA0pQLAs=;
 b=psKGTCnlPSdslzlnZhtkL5+OoKZpxRCCAwCw1liLoj4sh5j8n2+uVoUO4xgLK51gIySPG7YhouFDLkN43JR7G+UVzI+ia4ZlyoMsqO6NzhTcohZXyCDA5adoPubEn/i6eXwQ01FO4ztdNvI4I8D8CMA4DpI5OBE8wGSXs2RrqJMUd+49YG5Ap2XBpSr2Rn0Hszj4Ey1mSsa18k9S6K71AQPGM3N6wK/41En07+ddsd4LGCT3Cscommk8/Tpu39w/Z+zDNEGpZuvND0gxAkReLu4DS+daG2JJAXf9+gaYPYpEfRAx14x3uy/EjNcMd4Rp5JTfJpPgbM48wFlGfXaZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umRqQ+AXF9kAqx4ob6CKOS1CjIQKRTVRkLILA0pQLAs=;
 b=GuWPWk2z5/711fSAyvygGRPDl3GwN1+qJvCO+8OrzNE4sgw9RcpWvE20wOCCr1VRN3lJCtcPeBSwF/g9tDBSny6cLejLtbn4haKjIJ/qc8ucZ/CsvwV/9para1jm5Rmt+7cpqOEdorlPyAd2Mu3AJGON7OPTyD/4WL8t+1swbP1lqs2TXa5I24FQ/BX+QDb9GdJ6+geuWbewEbwSt2jvEcbm4Ytx5Ib0+7o4GfeLGcTz3iM+jCIUzycTLwBkov5Es6vxSB3SQDx8KJ3Ztj/Hew69oMcplYfKF13gij6yKZ9LzN8oO2vamdloEaCfmlug64TngPZ1xMUQDZXsxDJPlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7388.eurprd04.prod.outlook.com (2603:10a6:102:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 20:28:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 20:28:19 +0000
Date: Tue, 2 Jun 2026 16:28:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>,
	Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: fix typec switch leak on probe
 error path
Message-ID: <ah883AEhSZvxmgqg@lizhi-Precision-Tower-5810>
References: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
X-ClientProxiedBy: SA1PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: d60a1c64-9146-47fa-4e3e-08dec0e57bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	XWqHjCVmngAAGHK5F/yL9/p0VH/hDijOqm5zzY00QipWFMBda/cxl+rgXzg9FfUIKHjCHU1I2Swvp5qEXNKS4scMaw6x9n4+XnsYdQXdV4o6x7qO1XlH09pJAS7yChSX3WEUxZdlJYqa0bAtRnAVLcTng2i6wzhgGNF3ltmTNbQxZcKiiC5GiFYcT5IlVCksB/i+K1d0F7tvPUvWCoHmJiOZwV+bQiOCeUV/HVoGqtNsSvg1I9EEYmgXDZq9+SqeIE8y66+xdNjS9lImJIjtMKYLiXin1HraSlxMGDpHFp4Z4Y49ChaXw1/r+fL45ROFTZuv4M/v5jcrA6HHGN1sEJCiFzGvonr1jxCeMW6oF97Zkt8J141RjvtwCZEYBzHHixJDRujdo6WgRAJRNIazfHjwZSkk2Y2gSe6dxA4BLSIWpRyezVL3FGoyBrXEwzpQkdXMx8nHkMLyaewL+UHX8XqK3edFYZ6gtBGSkp/C+oCARMxbYLqd96O1W5AZzJqLoXzlv3tFnA5BFMpFUKvgTrQi108ngt4MLIU9BGs5ZLIvHh50jKBvuTUPxT+7mumOzEif3iX3c1+UFPZmEhNK4xLsfpRaGUjGVg2U0yFqUtJT3reEH3b4Cb4eH9iegtaYWjVvMjPNIe0UZ+T+3NOoJvJA4bND2Mwbnd0c/03J0Lm6MEX37J9owRXTGs/GutyAIH1gCMLNYxo5EgpQ2moEBDjzVNA40QVY1yB9Jfcuwyno9mvPRoKDn9VsaUuodHuC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sNbyoFIOZDYa9djq3Od5G7D1bA2QnnkQels8b7di4IUiqBRdJGFtgnCONroJ?=
 =?us-ascii?Q?TotdCoA1NloV7nlGIgV7yiM6hcPDOdJ0PENx8FkZbp3cHHiWvfkIZlO0my4W?=
 =?us-ascii?Q?ixz4HCosMPkSg6sjF3bOPnleZ5tT5Hd1ZsBfjiiDZs/G5+NShOkqU65EHWn+?=
 =?us-ascii?Q?5MDxO52sZXBAEaLddAXTCbzgNtfTjYIccEOnFO/RerRoZudHdrERZ9DtIWZW?=
 =?us-ascii?Q?keIV0bJXuIElD6Ees78xbqgMM7W3tvOB4Dy4TSiNqcQ4uqAedORroVL6cVZ4?=
 =?us-ascii?Q?XIKFs+LuLwryQ7rNWO7hfNt64gujKCIb+H6622bHljaXmBFqh/R6mWppMDcE?=
 =?us-ascii?Q?nkr6/+SmRL+7QCVG7ywMUujfUxqWvPUb4Bn5qhk+BAfZhcvWJ13yLGOYDgKM?=
 =?us-ascii?Q?pDLH8pQU/VrQks86woAmhqwQYGBqtDQK67pqlq5dvT7kZoawM3tW9LB8dXAV?=
 =?us-ascii?Q?2ezbPIi+TdJvR/GZPWsXONGozk5LaA74SuTpv1ALRRBFZI46ddoZ+7TVs7Ao?=
 =?us-ascii?Q?6yC+SNJWiPjAC42fqdm7DYDtB6c8X9oU9X01e1eW0w5L35YDLjOIQQwWWEE6?=
 =?us-ascii?Q?RV6e8pTVtKzRwykwdPEbi/3e0z+DDHZlFChEV/mwFP1/J/gT4brkKOMMezSw?=
 =?us-ascii?Q?2slqMKG2WxHywM95HP1gh+DMZBl8lRPl3TUwweD1MGRenOfdXJTjgR8LLGc2?=
 =?us-ascii?Q?6WsJU5zFZsBT7BnpQJ/3I73ih/hHlO1MDucOB06HSNUr+kp7rdFj5aFpDH6H?=
 =?us-ascii?Q?zS+7uJF2YX7yVxDROgVYeOMmgL43TIenK2yBTJgWnawNVAoDkkR308A72FqD?=
 =?us-ascii?Q?2VXy/CMx7dxXfKZnaxUL8gnZO8+g11Bth0yD8a+GU9DMU0xIfklvSQ359XC7?=
 =?us-ascii?Q?tmJnFsFE5ek70YGfHmH0vyMA17fAdR6+R360Y1RNhpynAWP/3ObQ80stU26/?=
 =?us-ascii?Q?54kSfMEIiQS3IwhSHQB6YGV4H4i65bQ1qNNXzB/aT+kmp9WVXKZ8O/0Hze19?=
 =?us-ascii?Q?4qj5kHkgD54mjOpU29A2gFS8RuxhL3jdq1unk1du3kVggG75DpuFMaXnYREq?=
 =?us-ascii?Q?MhUNlaDkqyfnxJbyt7iyaToBNgd38idDyhRDdHghpkoUW0vETqCRy5sthCS/?=
 =?us-ascii?Q?JGD1UWEIF/r5O4Z0GKUMEiVrqiKFSQZhzTr+6YupyVTlR5hAl3IKSn9PBbeK?=
 =?us-ascii?Q?ZnjiIW5Qg2417kvsMoSjRiGHNdQK5ypv6gzmQDp6VsH29pjCeOiHWoiVl/RO?=
 =?us-ascii?Q?UgWnrFHTP1PfAvqVU4GfQMnbs5xh35tVcPqOuzb+C6ltQ95H0B4L+din1kPk?=
 =?us-ascii?Q?k20DhhY35NA3h/xLgsbUYzGCs5Nu0BUwavYRkCiGwJmBJT576Jh9Fr6C00ui?=
 =?us-ascii?Q?WRtq7CsHe8Qt9OHHj5CZ1HwYADrjX3erPRgM7dSlqCnL6SQBdsGSQTCn17Qn?=
 =?us-ascii?Q?vwJrsoTdc0eXriR34vjaLRHfqNYu8pWXmpDsOcEzcxnhri9Z8aYSHY4AjOze?=
 =?us-ascii?Q?wXdRTwjYJ9TI30OSeyPWf4CjGbqrwa0MlevxnksSjH2gAICgF7pu0bRX4pGL?=
 =?us-ascii?Q?JQSQWlg8ENvNQ+tf1TY6YLLwbJGbMp6epghg0d2Rt45zdyqcG+uNprmA3vgp?=
 =?us-ascii?Q?uWY79D/affXxGQSSk77ZTuskymPo8p1Z0Vg1Qdm2E1X//6+TNQ0tYnRx1yAu?=
 =?us-ascii?Q?oEWjZmp+ZtTG1z71P8eLzO6WrAFbYuju4E+scQlC15RzU+YOHzWepGNAUdqs?=
 =?us-ascii?Q?bKnzqqdGew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60a1c64-9146-47fa-4e3e-08dec0e57bcb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 20:28:19.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owLp06EsJfsSgAv+mi9S9NuxLSnodoFHsG+/P8saaSpx4VAJIwKvR3bLUEutb+1br2i+4BNMX6YJU2FTA+CZtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7388

On Tue, Jun 02, 2026 at 10:12:41PM +0800, Felix Gu wrote:
> If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
> switch leaks because the only cleanup path was in .remove, which
> never runs on probe failure.
>
> Use devm_add_action_or_reset() so the switch is cleaned up on both
> probe failure and driver removal.  The .remove callback and
> imx95_usb_phy_put_tca() are no longer needed.
>
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..8af5a4f85698 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -173,8 +173,10 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
>  	return sw;
>  }
>
> -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +static void tca_blk_put_typec_switch(void *data)
>  {
> +	struct typec_switch_dev *sw = data;
> +
>  	typec_switch_unregister(sw);
>  }
>
> @@ -248,6 +250,7 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct tca_blk *tca;
> +	int ret;
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	if (!res)
> @@ -266,17 +269,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
>  	tca->orientation = TYPEC_ORIENTATION_NORMAL;
>  	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
>
> -	return tca;
> -}
> -
> -static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> -{
> -	struct tca_blk *tca = imx_phy->tca;
> -
> -	if (!tca)
> -		return;
> +	ret = devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, tca->sw);
> +	if (ret)
> +		return ERR_PTR(ret);
>
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }
>
>  static u32 phy_tx_vref_tune_from_property(u32 percent)
> @@ -739,16 +736,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>
> -static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> -{
> -	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> -
> -	imx95_usb_phy_put_tca(imx_phy);
> -}
> -
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> -	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
>
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-imx8mq-typec-20a6f1d1900f
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

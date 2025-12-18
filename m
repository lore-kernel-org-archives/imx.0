Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F134C145
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072609; cv=fail; b=kFXZsVNP9YEmL1hcXhgK+JQLvcOz18bEd7Am9ErKlkwe5miHLg70g84/gmhn9WT7P1bEJJvowWuKVO4qJc3E3ysl35iGwhtzKQO9E45rfXnSGhvJh7KjIPWZR4hTyS/hqTJMVOT7Dv6oLkpuIpue2fwwdTKpq0qoXXL19ZI6Eh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072609; c=relaxed/simple;
	bh=Fup8xjS532w0k0AkWyxdo0fZffVmFbXPTtw1B4oX+EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UB7+kwCbXjyKuyFrG/doo9hHyUPYuCuuj6498IphRT9LsqrYWHSsG9OzGsZCsYpWwbpGytebvqs9SaQ8+PcashnIerUwfeLoCe6s5Q7BYJI+d7qwAF2zw2ZxuhHCMvUyspDvQ9IFUqdAx8bo0N+KeNtetAmBgWQ38LtgOo6Cuak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mHJrWKe+; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mHJrWKe+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiRiYnd7LwfL3+GR9BGAy517WyL7saDVPjHREPAhwRZ9bDwWLXum7w5G7wwZ6ViYsXz8PaUkV12zOswqciAN4i1BaP0s7CakfzzkCi9WPl3sJcncd/WmBNbC7tpHqE2BljLO4Ny2BrKbS4EOAHnOiWmTYD8T7bsbUeNDb+/aY3phhAGyrs2tFvDYWqdhTcVPqonhuQT0zT+dkJp38hCQxvTk7TZO1CySyfcWD+2t6hkIbr3J2zEK6CKuKNxq824huKw1zTikuvy0PYQKD+wFiE+toLdcRSvAiVKWWEcLcdPKr0NHSX+Q1lk6Tj3fkHBOfm7A9IzXWE8z1lQh/UDCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgnY2LDpwCEHVfHDzx6Mpz6oO/Y3tX9Qvr8TXBm5FVM=;
 b=zOvG3gvteHwNQz9BbKhfgFSOIs/FuGkFoS4NGxVoZZuPvQzKmEpsqUQd27E41DAbNPLSzMlVN/E5OM71oYXPWOKFMKfY5+NgkCw5cHrWt7UfVrFDifMGLVGjBmmcXclgxTaat/Y9838rbbaw0g6G/wQVoXxGTYlpmnqWHZcJvYS0HoPRrtX5RpasqTZ8engdYF01M7H0O7clmeFckWebhaF0EAnTew4EbRiA7ayhZqZ+Ko7kFGa2/9PMb/cPAs/d1tnMLHeAnvzxOGnRIikBl2L7fnIrIlhhZ1UXKTntK3tlyCGmyl4BuM9p11eFpBvj8nuNVG0GaHMpKWvES7V23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgnY2LDpwCEHVfHDzx6Mpz6oO/Y3tX9Qvr8TXBm5FVM=;
 b=mHJrWKe+Nd3tocai3q8WPb8yS0N8BYEeAROBtSq7qsLvXOR1KO8NrEB5yqetY/KS9aI0P+3scSfkOBsrBxy70qyYeLX1mtsb0xoU2ZD8YKZi4BndNif0hnGjDm/Dcbym8dA/WnCmYEv21v8dklJvkuA70Vi5AY+8nCDZt4TFVc4tpaxLD0Fj+1Sr8riQ2LgYaI6sljNGeCkQIm+KjrvkuAFaIM3pTHeeZaX/hhy+kxmXmZ+GsObEyV2i6zezscfNjLic9oXKuN1O95ZwX86gh+FzFnKYHu5AQNFsQV55kvA7dWpJbRtSLW4e4RxcH7w/RoDSPcOWq1QoQPmyG/2QFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 15:43:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:43:18 +0000
Date: Thu, 18 Dec 2025 10:43:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/3] soc: imx: Use dev_err_probe() for i.MX9
Message-ID: <aUQhDwPP1nNAPG0b@lizhi-Precision-Tower-5810>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
 <20251217-soc-imx9-fix-v1-2-0c763c2dbe29@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-soc-imx9-fix-v1-2-0c763c2dbe29@nxp.com>
X-ClientProxiedBy: PH8PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:510:23c::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d08f6be-49da-4218-ad40-08de3e4c2a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Si3PBiJiEJXMDNZZ2a3pP9LZfXmDP6TGWWychjoITCPxe0SvceBQXWBMkEFU?=
 =?us-ascii?Q?u0LT8REPloCtJucikqD6+Y+65OnOs5M+3hkBw0fELgpH6NHd3ziWZtZ4RwPa?=
 =?us-ascii?Q?/5p3RsACd3B0Es2pDxCGCez6pPcIwTt85OYQHa8cRInfVAlhZTxEIR6v8tUS?=
 =?us-ascii?Q?iZ4ER9e+YTsD1KADl93Nxd1JC7lYyfZ/upaQsE64lYIEX4oBjVJMR+2minxp?=
 =?us-ascii?Q?t3FnIzJTua12M7MKE9uxnNLHT5fBuhpzcK4r4Zj5gOqqYn+rES84+TYEdreP?=
 =?us-ascii?Q?cbWf5zpPVVEhtoaG+lZXQEMN0Kt4WOAr+FASEwJI142h/vz3L1nh8IVseAel?=
 =?us-ascii?Q?vq4vUBxJCWD5XtmUJnH6NBFdCQ6Bq2GK7koZCybJQNwLHA0ZKedXMAkxpvF1?=
 =?us-ascii?Q?BjmxsHJwamzwcWON7VLcrJPryEzEeCJQgpi4eWntFtN1ff8tDLaby1dYteQ9?=
 =?us-ascii?Q?gI5u63TNFUZixQo6aq5fFNx+LIbkTpbyl9UWMsL8LCLWTQ27UijITF/UtCcz?=
 =?us-ascii?Q?Rn8W8qE5sruVk1GzDQLAa1Vw48oH6v2H/MRT3MeEOLeoipkr3BicCKWPvBsC?=
 =?us-ascii?Q?sC/p873Y7Fh/JBKUDOVNN9oUXgba6vXzN0wIj5ZpAkZ0ewhBJRvBk+DPwypa?=
 =?us-ascii?Q?CJQJkaUZJd4nDG/C2+fEROTkhjQy1TqEQPjBsPZSJJ9UNAkLOLSktterAyoP?=
 =?us-ascii?Q?UFbXOUfg3zhmjUfx0O1WZJA9C0ukIEhN1XQtrRYO+fasm/dEud6mMXnosqiW?=
 =?us-ascii?Q?OHJIZ4Ewl/sqmGXZq7WmxTQx0EnjALUHqjyEytt+SyVvpBqC/qQLfhHOrEka?=
 =?us-ascii?Q?P3+FK9QqcMQlejyZhgQbqyopHkRkUDx1T7vyFK+yeVfoA9a2xiMm29nFG0JQ?=
 =?us-ascii?Q?lwG2f8GUA2HMAakjJ9qT1TgcJA2HOZIVXmx4Ua3ku+zxfbCAHHb9EVXPoHFv?=
 =?us-ascii?Q?0Nwql6k+EWlhz/QpeVIkMXbD78nGIEc9Iz7R9GKLy9r/PLAGqaRwU5IUfZv2?=
 =?us-ascii?Q?j5g35WZEW+S4J3tmTHBuK/pYSRJ8W03SU75bxbCxCXQz42JTEf+YACMpzxdS?=
 =?us-ascii?Q?yfMQPg7A4HPKoIIlN+eE8nKVxMTY2E+MGZXv6/2k2z8k0bYPLhYXPlW98qjg?=
 =?us-ascii?Q?TcnL0bMcgFddk6n6x3KXS9eWHZjhKMds4YagXJNcJrrLEBHolCG04e6uODMt?=
 =?us-ascii?Q?OWowzIHOnsJK5BGzmyfKDQj+5+oSdFlglgz6UsL3djkJ2i+SwTkFJQZv1T6K?=
 =?us-ascii?Q?AMdy3FU3HvAZs0kwkCtE2tc7mlbZCukDgEygYZoHIJj5U+uDIq83plpGZDRz?=
 =?us-ascii?Q?fwc+fC7Cfv6BF71H3GOpTbhTvy/Sj0S1+Y2EFFE4oSg/WmVSrQ03askvpQm+?=
 =?us-ascii?Q?lBnHvGWYD31evOyQ4tFaRVl70A2sIXFlKfNZ+NJz2WN/nKtaraoMO09qOsrR?=
 =?us-ascii?Q?TSTP8P83ctnIxuywybnrDGH0TdIqWxsV+d+oATpfKmcQu8hcaUyj2RxLpeXa?=
 =?us-ascii?Q?F6EhEOPdhU2j87G2C9LujbDKSDY0r0ox5TEf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OurBA984MGLO2/vzpLPnoCnenDoTNy/ztzChiSGvZ+Apo2PKPo5VpQ7bzj1y?=
 =?us-ascii?Q?/HRQiqr8kGse8j1fp4lP6UeBLSIJvymbveCun+nJ2AIDrkqe4l82MQb/do24?=
 =?us-ascii?Q?DrWSGGqHibdA+ycZHKWNl4GV6T6Re1lEHERuRb7Ez4X2t5mp0VtOGEQi+swp?=
 =?us-ascii?Q?hvT5eZQOYWDqEd/7YFFMAXRHGTc1Mg1C/IpYkngZZfGU6ejPme26k6ChVPfq?=
 =?us-ascii?Q?CNupjqsPspzATegwJ/qdLIakzslmuwl5XSZcyoVN3vT2msdKBNmsa0TROjjf?=
 =?us-ascii?Q?6VuZPHmHJSMOtl+Agg10AFgM09bNv7mbUt3GEdxbtnI1WrkWcK55CqI35tnt?=
 =?us-ascii?Q?rg3C5sx+I4UMsWOJaLB2CBLTH0ATXsVYYpWCvyefbwWC3HXvFk0LXiXHqWJI?=
 =?us-ascii?Q?Fc/cWjmZq6Ho752pwV/D2LdbKJU3+zFnZjDzOJJz+OyR4tj8Z2zMFqGiH+37?=
 =?us-ascii?Q?+nImBwY1u+GoG5JJymWcmXWSBOanEqGIE72mycXnqDTo8S0ou4s8MBstnVr3?=
 =?us-ascii?Q?Qn08Sy6nyq1SSLcwzkQjQggwsTMle/Nhuym8ltwoKlmpPfruA1IiRe9U76Nv?=
 =?us-ascii?Q?fIjdY4GbNEIQEKoOghGHP/qbkp5iUf0mVLXtKOz4He5D/0vjb/qkS7WU6+xg?=
 =?us-ascii?Q?+5vdohvqv5AAJ3A8RnDJm1jTAQcMLrRVmbpwg4P9LNnzZoqBmF1SXnB8F+27?=
 =?us-ascii?Q?dMbKUKvhEWUTmCFwznYZ+us21pW5G/CLtjXQWgx9H2Qy4/fY0UQLKR2UHi1Z?=
 =?us-ascii?Q?Q3mG18ZihYjM7Ymy/Xt/0SCB53YYpnLuYkFbDIfdG2UwM/vFVZws9loeWz3L?=
 =?us-ascii?Q?C/7OaVXwhShyheww2LhAu5Ph89qleBVm5kdWrobMymc5V1JAR4jfFBO3qdkA?=
 =?us-ascii?Q?vapBeynDRaXJ/ZBW0TswCWufp5WAIYFlh4NA/AoBA2s7cZCikvhWsJMUKynh?=
 =?us-ascii?Q?qB9Rwl8wO8cTki/uRuK0si/QWjnazNw7+rY0DQ4PDk7eodhv+KKJC7DsiFtK?=
 =?us-ascii?Q?pUC0r6Rubc2W3SFMYUCKeKZzCDj6xiB3xLf8kIUBfqLX58gNQRJqcHtZp9Ue?=
 =?us-ascii?Q?gsxNbwmYZlvzrCB4Uqg3r2sF6R/coAhC0h8DCNbYtC5oRORbyI9oaWuaxvQ2?=
 =?us-ascii?Q?6ug5+SnjrWjoY0S4AUkH/GuWJG0gfs9QqUeihOYtl/qJNKjB/05jj9cjjsi+?=
 =?us-ascii?Q?TP7a7fZ08OQQ5xZjVW4KXUMKcqRV/jrP+6K++kyRFshOgl1FP73czWkwtcTN?=
 =?us-ascii?Q?BNL5lfA6XaTMvjPBc1CWpQb4O1IGT4xIrB7ui9d0jqAGXDr01MRE4C+dTt6I?=
 =?us-ascii?Q?i9QPEsH4Z9LgFoXOGAobyvUgk3D55gUOFp/csY6xd2t0Ipzu0Ao4MoE0dbaf?=
 =?us-ascii?Q?pNO/xuVGJ54vnwqHRtyAe6kG5yBXMkQpuazMxCLjCPqPQOWaq6ZMod0i57bu?=
 =?us-ascii?Q?GiWNA9aBRTmxR0Sf2Mrol98wJO74nOpXeFAVcZ89mt/xJqNN4xER2AffTyXK?=
 =?us-ascii?Q?FEOFL8LtXwQnABwkCy+VTwCRrmI0LAe1tjx3yCZFOXuu//adAQq17iF1YoIQ?=
 =?us-ascii?Q?cmTDqOlKBW0vbsIH1wixT18QXbYspW+8wKFvBgd3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d08f6be-49da-4218-ad40-08de3e4c2a9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:43:18.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOKG9ftat9ZLGTmw24RtHe3y3rvEsszVb+X4TnePHaG2KHI9yhafhbRmE/Z1qOglnjWvXinHmLwl/sFD5g+p/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On Wed, Dec 17, 2025 at 08:42:08PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use dev_err_probe() to simplify code. No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/soc/imx/soc-imx9.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> index 0b1c59c7ddb244549bfeedc47ae6e8d83c20b39b..d9a686299c5f710bb9988c55ed601fc9d9f19229 100644
> --- a/drivers/soc/imx/soc-imx9.c
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -31,10 +31,8 @@ static int imx9_soc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	err = of_property_read_string(of_root, "model", &attr->machine);
> -	if (err) {
> -		pr_err("%s: missing model property: %d\n", __func__, err);
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
>
>  	attr->family = devm_kasprintf(dev, GFP_KERNEL, "Freescale i.MX");
>
> @@ -46,10 +44,8 @@ static int imx9_soc_probe(struct platform_device *pdev)
>  	 * res.a3: uid[63:0];
>  	 */
>  	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
> -	if (res.a0 != SMCCC_RET_SUCCESS) {
> -		pr_err("%s: SMC failed: 0x%lx\n", __func__, res.a0);
> -		return -EINVAL;
> -	}
> +	if (res.a0 != SMCCC_RET_SUCCESS)
> +		return dev_err_probe(dev, -EINVAL, "%s: SMC failed: 0x%lx\n", __func__, res.a0);
>
>  	soc_id = SOC_ID(res.a1);
>  	rev_major = SOC_REV_MAJOR(res.a1);
> @@ -63,11 +59,9 @@ static int imx9_soc_probe(struct platform_device *pdev)
>  	attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
>
>  	sdev = soc_device_register(attr);
> -	if (IS_ERR(sdev)) {
> -		err = PTR_ERR(sdev);
> -		pr_err("%s failed to register SoC as a device: %d\n", __func__, err);
> -		return err;
> -	}
> +	if (IS_ERR(sdev))
> +		return dev_err_probe(dev, PTR_ERR(sdev),
> +				     "%s failed to register SoC as a device\n", __func__);
>
>  	return 0;
>  }
>
> --
> 2.37.1
>

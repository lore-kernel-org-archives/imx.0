Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DDA3587A9
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072495; cv=fail; b=hgLKpoLJVgtivXR3Mr1EcfafHLARS5FsJE0rTSS8hvFz9gH4bJalwN9AtHk26m5aChOPnZOFJKWBxcRlS8idAQYA4HKxtC2xahTSbhd2l8UkRqafBQHv/1tg+KQ7tkiQCmkjFyrZyTqluWIohG8122RQnTEIo+YPAAceqlD5EsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072495; c=relaxed/simple;
	bh=mGkYf9cQF/tGc4Hw8hvKvfFxMYdYmYs/AUKdmix38AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BvHKlHq7Z5WJSEHwHNYsX/BCnhYt9rajUc14fegu2M1OIL1y1JxKA6Tjm9hiDRDQOAbKpg/czXu+vUQmZaiT+fYFKjXVAWCrLtH/1cuuEC4l2ddDJmuXDrJeo8FuhuYgEoO+Talw5LtQa7dX1Xp5FFP3AIryuhXVd0A1rxvR9qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D7uNDk71; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D7uNDk71"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzz5/7V1gLxkmHNeoHPc0f0cGGZCszk1Xe+dUGfbIbT/xV842++FhCBFpJHJubddTE16TEKSVzBhhHCN387ZmU5R3adLU15ZoP6Hd3uLvjM09gLHLtbD4vRmILHOm3DNLF1vwVzTOIYka2gxdgJKZWslspPl5ghptGVCg6eueSKWMBJkMU6WFnke6PHBHd1Onbq2VuFsFLMzKUROHE3B3IQGtJan4ZDxics04zyggOEzOJAJ0DIE+Vyidxg6vUVsp+QNxLjkAKH7IEI9hMEYKqwJryQVpVee4oaRBXFb8w4byBYKYO6raYCkggwTSzlIv9FMwJHtCr+GAodG/uX4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wTFIWTfPnejMlmKpG9Keds058wIKbXF8CsicxIJkHw=;
 b=A+q9hmU65IDiLtJDBLaZXP7/puRk3M5BwvrYsnbkK/T5sbMd7rXWjEgtRG5J/dQWn7mwvpwQTDUB3lLf+69KfbagjYJqFO50tHmouDxxuVPtfs9h26epezWOujvRXyh/AhsxhMOwUYmT0jKj1lZar+fNY0DhwZ/T7dAY2FGzlSKuNOeJZWculD+cU7dylziOZ/VtdQ5XSNM9VxrqrIrFpf3GihrHIxEDVwNlBeC4V+bcLSay8R9p08bymDKkJ9HLk8oTWuWHrAo5VQ1uwaI1iplnyjAssanmLWj4vscWXY66CIoD4PheW5rmzkuS44GqBL/hoAcyrUAYp5Hsh0Iekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wTFIWTfPnejMlmKpG9Keds058wIKbXF8CsicxIJkHw=;
 b=D7uNDk71mDAzBIsHE68VE24wuV2MU4DXsiYV0EDVmZtt/DohX9hLzhmZIVBcyUYMBHYaF21rgp1C94yDeTVbAkiStO2ZOGV1fdNPp6ouSKQ1rfesRa0HNXyMFyncdl5luQ7PW+7GJr790gYs6O/mrJBG6F02kIx3oaEi9qxrWOb0I5beC351n1uXGa1GLMsg6uT1Hs6cfGiEX42oQbBcvcVNSHPX8isvHOzu+jOE0Hvz6EqZYecfx2wb23kAjOFSCSAxSjYfBrjsoLrFGiv4uGxZtFLDf22qH83hvTn/GVg2WWUA4efx/bpKAPr3n2P2VgNSjVQ7Ms5KFe3OkyWdqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAWPR04MB11569.eurprd04.prod.outlook.com (2603:10a6:102:50a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:41:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:41:19 +0000
Date: Thu, 18 Dec 2025 10:41:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] soc: imx: Use device-managed APIs for i.MX9
Message-ID: <aUQgmApH5fTmOXkq@lizhi-Precision-Tower-5810>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
 <20251217-soc-imx9-fix-v1-1-0c763c2dbe29@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-soc-imx9-fix-v1-1-0c763c2dbe29@nxp.com>
X-ClientProxiedBy: PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAWPR04MB11569:EE_
X-MS-Office365-Filtering-Correlation-Id: 08576a13-37d7-43fa-ba9d-08de3e4be336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oSWPApervZQWSzDGS66rLvs8xwfcKGT/yLAKBX9hLXQTcKVruGX+E+f15zQj?=
 =?us-ascii?Q?Nu6bwXFFv+u3wXftKyv8GNOdns64kiz+zVBev19bCFiHu0dYWtGrtY/zEHoh?=
 =?us-ascii?Q?WO1ymFhrq7e+7c4HAW1MDIsu6TzDPaDJOh+zOfd7g2fxCZbU9Aik5TZjut6O?=
 =?us-ascii?Q?yU0bE0BkLgtZLIMFKsaS2vp7IzjK+QL3ekl6hEp/T9jB6LinpzzxBB0sDTFH?=
 =?us-ascii?Q?Tzic8ct/Fi5xH+cj5Cns3seDNMCazBXkki+BKCVZ/tW/9+c/vdfs+kfurUyP?=
 =?us-ascii?Q?gXB75H7VNhi2AkqWkLQj7nuZUdbdeV+WaHK4yMwrXJLoIE94hcUL5poh/eAs?=
 =?us-ascii?Q?olHn8ie6pUQdWNs81OQ5Y4I0dqv/nwrgHPfl6Wtf2uUCYsX3K0YZgg8zBMfq?=
 =?us-ascii?Q?iC7uzkV1Q6pcJRmQmQCbm2coeN27YZoSrfzPrwqSdrqwEZ9+h3A3WYyWJkRt?=
 =?us-ascii?Q?EpP+6eOWfcWYGJo2dfYFUEJwsOS94WXFdEpHILvUsGldJ9JloSH6AAAfY7EU?=
 =?us-ascii?Q?Wqw9FT7xqEw/wSz5aWitA+VF5LiwXJ5+W3qeBz8x3tFVcT7ZEM5dQQGzPKSR?=
 =?us-ascii?Q?VZHAdoH+qY9GEOe8WnTnZ/7ncXsy0FBmdUvzFHp5pnvkVSxLDYoUuxJUUnDU?=
 =?us-ascii?Q?SAgK3HElIIlKL7hGwCNg79QstO1MfuuIEXv3Cmn7W0StEG8vPwkCfSnsv0Kl?=
 =?us-ascii?Q?hFNkGjoI5Y73xf9qPmJf1g53v11twUeNilt9RuVe+S9jHqnr79nBJGamiKn7?=
 =?us-ascii?Q?0gFip5dQhSuEx8tA+BkcrrcIosOyEu66LIIqgTXri3UtkxYaPWYMmgXca02Q?=
 =?us-ascii?Q?8V5SInvIcf2LFGBvqSxmc67wzkoV+4PceGRyGHX8kbWggnJEh9XYPPz3hA80?=
 =?us-ascii?Q?Ay6fK+wi/QwMeLqwJ1KGnhClVIDljcHKkluCSLjYgJL+b2Og+toSxdhnvxFW?=
 =?us-ascii?Q?nQYwQo14I/E5qU3kqsQ3FI5du5PinfoaywHhut2JmoSC9p3edgI2+kZc4P60?=
 =?us-ascii?Q?LslL5PSE1n31OOWsmdZwX1rr8s67jSsxriIT6iXI+63oOuWb8mvtQL80ALj3?=
 =?us-ascii?Q?Xo0HRvB1dX45oktDOINLA2otkpvdWBFTDVTwqLXWjMZd6cVZfB2fpnFQcwqd?=
 =?us-ascii?Q?DD6IIz1PPbYjS+8gk9TAcbf2GcbK6N8NevBZXbEKQL9RZasrOuDrzETfQ1PO?=
 =?us-ascii?Q?ih7hM7uxOsAbEkB71qOVIhvUW9I/v3hEy6jMClseDTr2knjOJrCN9o5iwuqv?=
 =?us-ascii?Q?YoYv7v/YieQP3EE461MDq2OFEtQtTZTjvaa3YLauIQx0jWqzIXNMNnjSbyg7?=
 =?us-ascii?Q?T5FsIp1uS2SGl63mgCVu+kX/rA+kvmIRp1draKPUZ2su6c7w/8oKTMee6A8i?=
 =?us-ascii?Q?ch/38xsgEKGQ9/N0uh0NIt9mGxbbuLWddyc4kWAI2UD+HRuWmehaxEDHrZcR?=
 =?us-ascii?Q?Aig+WpQeirLp6IDVfrRr+vTTII560179AktqeOSh0GF+AHmeQjCZVaU3a8bZ?=
 =?us-ascii?Q?E81CVm6DKo91CHARUMrslf0vmFFmlbobWAV2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DEabk0KCLn1wPRtoOEnoCoQh9V7Q38jWUpqovAhyINdm4fEcqPahHXjXF2EY?=
 =?us-ascii?Q?okBfqLqUCVtkGqauxAR5OX4GQpvSwdJtZEimgT5sd23W+LH7n6H8AjMi2vcl?=
 =?us-ascii?Q?qYZQah6uxpWAQwpSxD6aaU3ziimyVBTLid92ytK2oLWuY5ZSdMkgkuBK0TEC?=
 =?us-ascii?Q?fF4zans3WH0FLdLXOWkKX4Ynx+7XF7uRsyZ7oifTA0ND/n9N/M+kc0/XyYiT?=
 =?us-ascii?Q?GZrN2thfBm1bhOt7V4r+nCnTera9/08mRT2hKivzwMd9G5OEH2BheI425mXB?=
 =?us-ascii?Q?gqnVhS3RZkuvR44QAY6cMXbEidCelZOMZLHt8GG/AgGtcE+CqvYsZB4ioknX?=
 =?us-ascii?Q?r5xdHOVlRGYZBdsosS4s2ycseXrKvE0KTHx29nzOPS88UzD4MSHgZpLaACRO?=
 =?us-ascii?Q?l3GeigpnN4DndMlIdGqj2YbIhiXfvpqzQGiC6/gXTQqE6kCMwg/7pO0nVY8l?=
 =?us-ascii?Q?BP/JQV5yft4cPj2TZw/8UIkVXTG7ZGeAA96xJkB414n5zLkhzq25yK1Y06Gy?=
 =?us-ascii?Q?fxaU0FcZyrI5osZygc5ASVuvWnosQcn9mH/WaG6FKEDs0soS40gfAeJwgbRk?=
 =?us-ascii?Q?hJF8kI4eEwnNXRLD/3wbcDGmop3LdH1nmzxkCeQQ2yn4EMoSuKA/oKPf+hhH?=
 =?us-ascii?Q?U2J/oG2Nms9ws3vxgmAv2I14cbOEdD6dIKhGXAojJirA3Z2Eq6pwBXD3NnKq?=
 =?us-ascii?Q?cgxdN6eeQInOXGg3Ywn9CgQxewuSoF9mXvl6PxEjbd1V+3Ihy7ikaB+R7+AJ?=
 =?us-ascii?Q?rTXLxBcoVB7IZDu5iZGAvgOTSmLmXEHUirjAahC46xkyF3vkTrGHzuYjSGzU?=
 =?us-ascii?Q?X+GVgpwe1wRXuO6Ry6s66n2sjx6i7diQ8nbXokpoDmCBlVOnZ9KH9fCPzCtS?=
 =?us-ascii?Q?KPccbavAidGArjAT2hw9L6sZ3SxWM9AAbG53IXBEJQvAE9gyv5BVH/gSXKK5?=
 =?us-ascii?Q?Fg0KqgMQNcw5fKz+gGhW4sM9mqEJhmkVJe5q+cV3VlzKzx4bGxRAmlHbwTM9?=
 =?us-ascii?Q?MaJk7TIYCAHN3DzszBMXt9/zlz8EJxK6/XPCQZGFWdUjm4uyT7ORScZN0q/c?=
 =?us-ascii?Q?DllbkZJmPit5DXDvAg6JGiJBgKS/FDq8WQZMmcFqE4MXSFzOKwGQUrVR/NOO?=
 =?us-ascii?Q?h8B1VYHEAxMyKLqB/KWGjK8jA3aBDNuZghjRfoJ8XkXdpZ/sGndzhGyD5dpP?=
 =?us-ascii?Q?EzY50HyDyKh0ll7AWkQbBoLTJL7mtrexERnqvAyXj5uJrdX/KzzvX1tHPN8L?=
 =?us-ascii?Q?3SBGXCwsvpCowB4zzYLosujNXzg9tad+WLMY/2oG2wHXthfKQO4rvH5D+kjk?=
 =?us-ascii?Q?3Mpu3p4ZR2dEENAMW4a88r91A8qEw3yo9hF9m9SzOR6yPhP4jCSx/jAjrp0+?=
 =?us-ascii?Q?tn0DycabNW9yM5lzvg5Suw28K9s1UlkOQNEs2Bh5JXPMflffhBKdqBS8R/YT?=
 =?us-ascii?Q?hpIDN0+c/R5IGDX1midV/CO9jpgFPllW28fj9PAB/uBwg/pmKm5QITbWrP0D?=
 =?us-ascii?Q?GYRNgBqzCdTxySlsSNYJV0mCLM/78OrC+9E4rj7l+PcQKvIpRGvc7xxCzZBq?=
 =?us-ascii?Q?UbzAeR21oK1aTishcwmuyLtOh2gWyAvdf5OM2l6l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08576a13-37d7-43fa-ba9d-08de3e4be336
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:41:19.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFD0YMGz7n7nDUZGLPWjnkUa/7AAuh1f9WyLRj5wQOpCFEANq4JFV79AgXZoYRsPjcN5dTpneDkHOO2ZwznSBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11569

On Wed, Dec 17, 2025 at 08:42:07PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use device-managed APi to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/soc/imx/soc-imx9.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> index b46d22cf0212c3f40f61ec5be85ca11e5d3207ac..0b1c59c7ddb244549bfeedc47ae6e8d83c20b39b 100644
> --- a/drivers/soc/imx/soc-imx9.c
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -18,6 +18,7 @@
>
>  static int imx9_soc_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct soc_device_attribute *attr;
>  	struct arm_smccc_res res;
>  	struct soc_device *sdev;
> @@ -25,17 +26,17 @@ static int imx9_soc_probe(struct platform_device *pdev)
>  	u64 uid127_64, uid63_0;
>  	int err;
>
> -	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
> +	attr = devm_kzalloc(dev, sizeof(*attr), GFP_KERNEL);
>  	if (!attr)
>  		return -ENOMEM;
>
>  	err = of_property_read_string(of_root, "model", &attr->machine);
>  	if (err) {
>  		pr_err("%s: missing model property: %d\n", __func__, err);
> -		goto attr;
> +		return err;
>  	}
>
> -	attr->family = kasprintf(GFP_KERNEL, "Freescale i.MX");
> +	attr->family = devm_kasprintf(dev, GFP_KERNEL, "Freescale i.MX");
>
>  	/*
>  	 * Retrieve the soc id, rev & uid info:
> @@ -47,39 +48,28 @@ static int imx9_soc_probe(struct platform_device *pdev)
>  	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
>  	if (res.a0 != SMCCC_RET_SUCCESS) {
>  		pr_err("%s: SMC failed: 0x%lx\n", __func__, res.a0);
> -		err = -EINVAL;
> -		goto family;
> +		return -EINVAL;
>  	}
>
>  	soc_id = SOC_ID(res.a1);
>  	rev_major = SOC_REV_MAJOR(res.a1);
>  	rev_minor = SOC_REV_MINOR(res.a1);
>
> -	attr->soc_id = kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
> -	attr->revision = kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor);
> +	attr->soc_id = devm_kasprintf(dev, GFP_KERNEL, "i.MX%2x", soc_id);
> +	attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d", rev_major, rev_minor);
>
>  	uid127_64 = res.a2;
>  	uid63_0 = res.a3;
> -	attr->serial_number = kasprintf(GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
> +	attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
>
>  	sdev = soc_device_register(attr);
>  	if (IS_ERR(sdev)) {
>  		err = PTR_ERR(sdev);
>  		pr_err("%s failed to register SoC as a device: %d\n", __func__, err);
> -		goto serial_number;
> +		return err;
>  	}
>
>  	return 0;
> -
> -serial_number:
> -	kfree(attr->serial_number);
> -	kfree(attr->revision);
> -	kfree(attr->soc_id);
> -family:
> -	kfree(attr->family);
> -attr:
> -	kfree(attr);
> -	return err;
>  }
>
>  static __maybe_unused const struct of_device_id imx9_soc_match[] = {
>
> --
> 2.37.1
>

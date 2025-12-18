Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F12D5419
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072718; cv=fail; b=oliYtVQT4N0+AuwoaHmYM9HbezDw9snlFf3NFcIkOuuXeyxKzOkTs67O7lD37A6KJpimD0X8aJeu82hH+dFchwdD1lQOwliqN+3r//7UDEm2nntuSQszql04ioCEqgpAl74xvlWgtJ/XYc4iUZsPZubrktIjyI2pZgjUv0UJs0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072718; c=relaxed/simple;
	bh=wDg0iSpzZaLaxiSrB6zpfOu+Np4ugqemYu1rxszSMIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sxsf0dvxIoCRWeJcmHSU0qHFiu3j3+6vZghTWXqaoDpD0hj7XMSRgQSkMx9nthS/lzTXjQQjlOPxG+amL0OCMZilqlXeCB+FofzjmuMrYO2Dgm+qNHj55sXUz2NoViu5nD2HcLTYNzlg16fgA9LjKCRPottniW30uUXcoFfUDQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NOHLBMil; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NOHLBMil"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLRBRpsUQ0JxQDOjnF4C2rU7ULnPXqUViuuv4CJBZW4gpBJHs6wd8TcpUk/E7R2IkFDPdUhIcbvgycvgYcq+zNU3Bq7p/Yd0FIyHKEJPKlWldw2cR35rqpTWXrnvS4N7buHBi3rTMPNwPNNIxrY2Ni6ujtqGgyAAVTAZr1TYeT9ii8zzmN129E+HXvl+KQry/heX8b6nF4ezSI4d8K8P1h9JQrhBvkCSc3KPuedsm1o6FilVpT7r4boQ/QBMLDGsdJvZbCC09wQ+rvYK1CY+60EoQCLTf5KKwcztf7DSp50q1X262uQw8SO68pqMBqJTWu7GKqeqMNndDbpmz253Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y7y/9UeXsHkXYZxiLTfda2OKuW4mOPwtVNKQeR4Ajk=;
 b=zLRpJyXgWoVRYaJMwHT6GZ2xN/kx3NMNE3OXU2QZc6qdyC/X6UKClTmu/5NZ1s/wJa0bySGa1mPrMyOMJBNbRRvnxsHb5iUgxxj+VZ+iHMvQN1ivF4RQUCLX3Mv/KBPXOYvUshPIjhJFQE5nmCR2tA5unpIFQLtXiGLRyHw3pV7i7qDdJSs9A6PSpUEIxJHXckQ27ti+nR3Nn9oOgw/s0uZy8s+ORIq+o5rNV3k6WXUSqdtgHUezP+W0xPX1qq2Wdnt5VXJHz79vDNHWqLQIThTzAOqet1/Kaooilkgg/ewo6/hUxXRC5ibpdTYdOCIbyM+Q0ufmWskImIGlFe5R1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y7y/9UeXsHkXYZxiLTfda2OKuW4mOPwtVNKQeR4Ajk=;
 b=NOHLBMilgROkYKVXnRUKXyca2nycejPjOPmUlXcae2CKRwDZO94pIyy+YR3vYI9DbB5ts6a5XgI+GS1V0xOLsVB7Jzw9k5632ECcaDZ+gX+CDpzHxnDjBvlvflhAQ1t2AgcyGN1wa7Q+0fkWo6PzFVVJpvmVlL9BeZfffaEwcGzBJsDQ2up48dNaEz+xcSR20jy9+9aCt68UfTDzqIsP8udTddjcNpZ2ZnzOoF4s7YuxJO32vKjLDCGh2wTbkhtmC+OKuGxZoK2i+yB6943rtNNjzTk/H8GFL8S1bwTJ8Oi2GeGese416/rWlYC5NHjGTqiBAH4DWH7dngjauMR1Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 15:44:54 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:44:54 +0000
Date: Thu, 18 Dec 2025 10:44:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 3/3] soc: imx: Spport i.MX9[4,52]
Message-ID: <aUQhbjs8WF9cYmPL@lizhi-Precision-Tower-5810>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
 <20251217-soc-imx9-fix-v1-3-0c763c2dbe29@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-soc-imx9-fix-v1-3-0c763c2dbe29@nxp.com>
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf44b2f-76b1-4adf-3e04-08de3e4c63c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QG/rX6KQpTYpPe4pLbtu5SgZiJd4rCnlqzs8m4NIsHpy+gmQIqlC/xsHOjd9?=
 =?us-ascii?Q?N3cpYX2Uju1rBmXX3iNq6c5vG40/zhkIDmc2Bm/gU2Zw7VD7dy0YzURBADkx?=
 =?us-ascii?Q?k2DJd2g8BdE6XdVkTPKWnmQIt2QceBfUGjAmQvlYiq6kwOr2E28xio811Scy?=
 =?us-ascii?Q?t+72VJUsb8np1BXJnFyQWtOvUhW2lDp+CDe79+feMd0QhyOJu8j8tzd9HJNB?=
 =?us-ascii?Q?Al7qtB3svJ1LlT9MagWOvj+A/ULFv7qwZ4LwCzx5hlDPnPGL3MIui7MJXrp/?=
 =?us-ascii?Q?bMPKldnDZ2rh4er2LBiodbUnf9XI1GwPbVtCOC9qD4DkFODu5ZKwWh9RCPao?=
 =?us-ascii?Q?bxNg/u9VDwMYCNd27tRAAf/qj/R9KU0F0296KhzIF5bP1CUgH9X47bi8C4w7?=
 =?us-ascii?Q?6fQmSraXdjjxDLM+YuLNTPg9E2aA5CsW3KKBNHOEN4YHhB+Cy3qh0RzT1FzY?=
 =?us-ascii?Q?/EGt3mM3G3I2rTipiB+qt2j5EUq5Y2XCg+q+fbB+rdRamv2jE3GqkZMkBwNy?=
 =?us-ascii?Q?byQN+Q8YRs+F2F4AkBx9fvsou1I8umWnwVFn6AMOuKJuFMiydAJvpurzQP8x?=
 =?us-ascii?Q?CIzel6zZHPoP8e6UzHtPVk2h5LzBuTU0J9JP0iH3B969Tk635MmgELC1ci1a?=
 =?us-ascii?Q?yyEhYsLYPXXYx63bQDSjudCxsN1qM8yXzjmMQENwDnYO4NWsNlKtvNR+u35b?=
 =?us-ascii?Q?Cxs0DlKJjUTdQ8AefYsrnjTOa5QYXbVJ5UkVXdentDfPIc/0x/XAvVF/hCFH?=
 =?us-ascii?Q?rn2w2OWKtm5et8ObrBTmQ21cOaq8HBZsvQpJcMPzv+HmzlLVTld9KOiRdkIe?=
 =?us-ascii?Q?FAdI3RU2tS5v1YYj8TofFd3WyllW0SJstQIioj3IuTe9OSXoiqY0vjaZlU1q?=
 =?us-ascii?Q?2Mn5slkbQWtEDHKZyQARjzIuTgf9T7e342oLoyuoy4ZRf50aaIItSic4TS8c?=
 =?us-ascii?Q?e5jrU87ErGlreFY2BqBSQF+tx6HoSjlsaVuPpZw0Z85bRZz1Ih1ybM7SzltX?=
 =?us-ascii?Q?p0E9AGADSynilXYJkpv5pvHaTjm//Z5ZVSbDpsCAG6K/shPcPLx5yculUIJK?=
 =?us-ascii?Q?GduL3u/AbQaHpYa0Opb10F017NWWv1SUIl4s7OOgDGHqo4Vq7cvdMsj3w79h?=
 =?us-ascii?Q?5bN8aUWhliODIu0NjsF5IyAsAzCs2CNDDTrJOogS2jm0JQR5TEjeUNUb0uxP?=
 =?us-ascii?Q?5oGvc22kas/cfkuw2QOe+qSYm9xbS/k/wCwHLN4uoULK3xSTrlJpEBB8rN8T?=
 =?us-ascii?Q?jVBtAGwrpD4uoBLkNOphe4hz8n1x7PQXJjEDAtkWcMuiOcNap+YtbXYc3cnx?=
 =?us-ascii?Q?s+MgdlyVSZkKtNOYD5paDjpNhVie+qmdn12V1MROcL9fjVPrhkRNJz730zeS?=
 =?us-ascii?Q?srxEwUHb78+107HqKLznKiCokLJRlOx8ZXURcMt9jP4yxQFrCqjIBkBl1SIn?=
 =?us-ascii?Q?WZ0rnW0U/mClc9EVNlBRVCZTH/FZDzT1EVr8DgNdtuJGyDNcODMQ92Em/vNf?=
 =?us-ascii?Q?9jKWH+IVSCu8X6Ek/FXDNDhVRm5F4bBqJPwL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M2DVgYAgPDOmuS59nf3kT/Muc5zgj24aWKuFC4Fe24cQvUhpG/awTcC2I+6t?=
 =?us-ascii?Q?zIYjKMCCWo9V37mZz+qhsPiLDrKO2Eber3UX2oC29FxL10Sec+9CpspFRR+V?=
 =?us-ascii?Q?ZiTFfxMly5CbjipQbVjvU5nFkTy1hhu2nffZ/5bwMXN/zrGB+czhRdyg3aVW?=
 =?us-ascii?Q?HwR1uTyo+juPykhzxq1i94FKKLDsWboSUdE/FpUPrMazyjodRWd1H77PCgGi?=
 =?us-ascii?Q?M4nCX8ZPZbgkiPH3Q++3gs60nr12vLAf3VW1/+f8ECXmYkqh3AuHM679nAOn?=
 =?us-ascii?Q?YMZo3TYoQL62JYyS8WRkLFNH36IuwTmps1IUUbcD+/zjKtwcYTtENsqptsg+?=
 =?us-ascii?Q?EhqZlF5xb+x6XIAV0/T6o9pTnUfnTkPgnsw6jE3Xsz8sYZsbcSy+P6rMHfEF?=
 =?us-ascii?Q?OpGEQMbEOdeWZ74/oLB8HxIDizvC1DMEWskT5Mk25+iOlb6bibJQo+ZCenDC?=
 =?us-ascii?Q?Ivr0MSMWj6ec8xkmBQZn2Gwj8T86sDO6ufhnlm76QkgyCcJcVwt7anwZ13Fs?=
 =?us-ascii?Q?nUlZ3mY1GlrKb/r5/oNgfnjmbsFIkphdr7Vza3gb9RUVhuwWR7xj/CJwQmqC?=
 =?us-ascii?Q?3P+t+/WPgv/UxP5+upeO1roVff1iKes8SNS4ICAtGq7ZSADbafUgFmJmh2Fx?=
 =?us-ascii?Q?tcqomQ3MzfuiwGy+hFyIlIFP+DDJvFQJVPmJHuEVEZytP+jouh6RfuQyNlS8?=
 =?us-ascii?Q?WASaWn0Uarn8LqXMiH2B/mCNeCyk6hYnfLpFtbBnxHI06LwCizumQ+ilpKqv?=
 =?us-ascii?Q?zqJI+BQjMCCXCcMGjPFrk9Buxv/uLUQz+K7H2tVH71yTWMZpAzt0h0LCZbTZ?=
 =?us-ascii?Q?C2PvIL0KI76oUkwbCmTBsp+i5CVsx7eH5Gjsm3ev3HXEVcbi2CfCau9sXZvV?=
 =?us-ascii?Q?2UIASooUeMdCQ56AYv/9N2HYGHFh7hFPwWaFT6agDZ5z06HY5le1sagRwmce?=
 =?us-ascii?Q?mBLhaJKSCAFkFFXMi2BVLUzN0lybFL5W92a8KqQdIkVLN7u4AKCr/Nqfwcra?=
 =?us-ascii?Q?NtnVzKdcqz5G90LusDo6B1ulWXgTN4OF3HDKasJ+TyEkPl/Yk01ukcelidna?=
 =?us-ascii?Q?8Iv3DkPOBZny5FyV1SXBjIgm/d/QT8mVL4j72b9PlXE9qTo6UThXDaxTNT7y?=
 =?us-ascii?Q?Q8tUxcwe1Lqu9eeW58QlHiihlw6NYC4wlufWrw/sJudvlUVkSVFRo7h+DI1Y?=
 =?us-ascii?Q?KUzTGRcpT51UmtalFnkL01cHVwHdGZFND8SD8DQwNGsNmzBdonwIafSiFn+s?=
 =?us-ascii?Q?BSgB9i2wl3JTZolZJIWFb+KlZgtxd1FbvABBxdNzh5bqtLVaWkuX0bIwxGck?=
 =?us-ascii?Q?epR2/pDo4k592XCMq0Akd6O8fl1wyydW+SmNKdFlu8cQqyD4fXJDAaDbpGB9?=
 =?us-ascii?Q?zEoELMsVwzNATDAXlXY4xtLb3meiOLDi11UjG4ZaZdzk6jNmJXmR0mQBePGC?=
 =?us-ascii?Q?G7YvqpceUapS4ONDP0oWNauSJQ3F8LVfCLiQw4a2FGMCh7XFU9tKsg+sRajF?=
 =?us-ascii?Q?FHStwYUf2xYpaEqiQkSAKuO42bn3KM/QFV/OQ5KE3Ad89pA/YqZR56KSxMjL?=
 =?us-ascii?Q?e7KJVXeDVwLA9NSVD5TrHnLONZhvICHyrbl+RUo0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf44b2f-76b1-4adf-3e04-08de3e4c63c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:44:54.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2bZWAmCWkbr/BTJGPZm+/+cnb8KosHiaQStywzZ2CMjkEWEZuleZEuO8Ens5Rglf7UZFNMHb8R6VDtdrv7XAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On Wed, Dec 17, 2025 at 08:42:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add i.MX9[4,52] machine compatible to allow soc device could be created.
>
> SOC_ID is 16bit format data:
>  - i.MX943: 0x9430
>  - i.MX952: 0x9520
> Update SOC_ID macro to get the accurate data.
>
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/soc/imx/soc-imx9.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> index d9a686299c5f710bb9988c55ed601fc9d9f19229..d67bc7402b10e2966ff77cbf3b15c087540bd377 100644
> --- a/drivers/soc/imx/soc-imx9.c
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -12,7 +12,7 @@
>  #include <linux/sys_soc.h>
>
>  #define IMX_SIP_GET_SOC_INFO	0xc2000006
> -#define SOC_ID(x)		(((x) & 0xFFFF) >> 8)
> +#define SOC_ID(x)		(((x) & 0xFF) ? ((x) & 0xFFFF) >> 4 : ((x) & 0xFFFF) >> 8)
>  #define SOC_REV_MAJOR(x)	((((x) >> 28) & 0xF) - 0x9)
>  #define SOC_REV_MINOR(x)	(((x) >> 24) & 0xF)
>
> @@ -68,7 +68,9 @@ static int imx9_soc_probe(struct platform_device *pdev)
>
>  static __maybe_unused const struct of_device_id imx9_soc_match[] = {
>  	{ .compatible = "fsl,imx93", },
> +	{ .compatible = "fsl,imx94", },
>  	{ .compatible = "fsl,imx95", },
> +	{ .compatible = "fsl,imx952", },

Does bind doc already applied?

Frank

>  	{ }
>  };
>
>
> --
> 2.37.1
>

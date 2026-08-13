Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC6137F72F
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638897; cv=fail; b=AFXzr5QG4x7dTO3l8jByinjcufDZjFAvX4iJdkTRKZZBvYBOludpRGU/A8/Tig2LZVdi/e/CQN+yhnwxlW9NQ6R+aNK/PQLMq6kw+NAMMBwHfBosZZ1xEdKWr8upVhGGBIvDNF/VcLD5W89exNomppksUqKTzCiBkbe0cR5ydqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638897; c=relaxed/simple;
	bh=Q3ODK/ylBeaM/LDfvhVGXe02slaMkzTWuM/k+Aj17u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nqNizXdDoDSD4lB64RJCyc724M2o4cvQq9trEiCfBnjjPeOXRIFkuZNFsnBDuWbw2KVShLK9+c15ozojss45yU5Wu0NgvasEvo/uoKndEASQMCrTOrvLfiL8EjOkS9Qcop7Cegjg0HO2CaPdDGZ21eIXCjVAAmwKGtwdgFc4M8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B5nZ2Am8; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B5nZ2Am8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6DWRTZ56PijV/+6J4m0kfng3QNBRaIUjoiYi6diMNHHPeUazdqJR/USGVK5IiVPDd8/54bolgooNnDI5LWvPdyecc+NV2IqgedTs/XXwwsNXCgJmMIQDdrY8LQ1dFY0h3RGyY8dyDGNMOFvrN+tpLqKr1VIX3J9VNOf0gC5nOhNVekewJB/JD47vu91w+/2zLjyVxLeYyafwqVI2BciRjJ0JEiIyaN6T2YqENhrxpN5xvWpIVdJDN4RQdP6z0ate617JbxtwDi6Lsji82ouSh0tUGoX2OsWB3Ha8HSelxKKizmRFYLLKS5mxQjAD7CETrpoj5jegKzZIVgrMGpY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmzKZxbBZQAZVBbivjXpFuJ1wfqEPZEA6kerZaLv1Zk=;
 b=ozXEcp6gqfyh+zyYiIzlb0nEOBihptbyEdY++a32fz64gZb+pA08lKX6kCMfTWuF/ZLcmdMfyWl/C3UmbLdmgn81qC344Smkprn9Iob++ZTrHiMWO6oibTwx6CgqLiXS1Ln8UeFkdkLOjyHDmg/lXZsZ02JaILLdwvhkl1KvNbH4xtE6U4UYdsqiwyJuKZiB0wASvDOaLIma97RHmlnr9toFABHfOigZY6yG9zkKhFVno8MXcjKiuBJCxt02O6YekMKQgcwMSRJAHL18xF0AdwVf73HSi3DayMxuX7KvHm17vlBDGwHjH1VXTOp24gTDi09BBlXS90uZJ6Z4PrqggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmzKZxbBZQAZVBbivjXpFuJ1wfqEPZEA6kerZaLv1Zk=;
 b=B5nZ2Am8OGfPJMshZSGPNXmT/+5PiQzvKKP5DGpgtGG5xN5wGW/CY4twyzkWZE1GzuCHv5IIsXM2p8Ip8PE+S57XfogRaQL/3OTfMZhlyaYUVQRt8zgv3G6FnIDj01Li9f2RJCBNc06lbj2CmeSyfthFu1eno6Z0/F3ra504oZwGmQC12NwzDb6HmdLQq/Fmc18Ykl8Kl5D887fJXtqgdW0NVqd/P0/Y7FvaHHe+DqC6XEjXcCKKk27gAQonbs1Tv2xNnrm72142EE9lB1lMD9Db+GCy/QTXKrx6mEGnFbCIY/GPvPuAE5vipYxfktIiwFZSOqH7BmNNuU0DKVpV4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:34:53 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:34:53 +0000
Date: Thu, 13 Aug 2026 11:34:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: imx1-core: fix device_node refcount leak
Message-ID: <an3yJxpt_DvIYLXC@SMW015318>
References: <20260813110938.1512-1-manushprajwal555@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813110938.1512-1-manushprajwal555@gmail.com>
X-ClientProxiedBy: SA1P222CA0178.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::26) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d04df3d-6dc6-4418-07cb-08def958cd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rDtwywVXXzgMyZdNsBDbXnXVi2RD0sdW777QBKLLTg/VsSXjz3/GcagiZzTaD4Y+y8CGSqp3vsvCwGTLXtObdBXddrjYHtNvWqGPw2GaF3V7i5qZxjhfkOUsfaXHpN+S8meh3dt33YEw6mY2wC8xZamKXIXR3VTIq2Ofa9kAv72l07a9z51TxDRMWXRrm8cv/GJCsp5OWfG8lizneWUpnh5B3PnvX6vPfOewv6uirQmFYOsLS45xCS7u5JqdPW4MVbM2caUy3scOnuqL521A2i9QyAVqLW27LxIgn2BrT7elJRGfV6SlCQ3EymTbG9idpFQMm0gSNcbchNkjcOzUD6On0sUmdOnxymylrpcLLhqikaFPvzglTW1FY0LznQiLvwg5JV/1T4SDF50uwfmd4P7DoaSxV6LCzn45NAwQV9WxhTvriKPGPVGE+SL8RwO1ql+Z3GcpeKCYL8ggVwOEGMdNmzh6OzBq41XIE/Z+uZKqYrb9pq4javETik6/MCLIdf/tybmUsTHXl9e1DJR2XMaGRkjrItsVn35pC2YnbpU3kFS5ohfm8Lup+4QN2czlmhfOZuAe3WsBHCsS7Nx2VphPRXABFbiWG2R2pQxsSg/mGxMF8xwREt+wsKmDe2KByqLng0IZg8aZQu4+TzrxuMImNLfh6YIoqQOwfl+eKi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y4PSZkcZWIii7Z6q+mKJuMEB26w+TzCz/oimB7RifCWt6MLmqZ0h91ux9e2g?=
 =?us-ascii?Q?HRPj+fTRhwrn9bfDBOcUr2FX5vrORkwWXG5FqenjArQ0AtAkDpm5NKF9kdtP?=
 =?us-ascii?Q?R+p+jPZs8gUYzm0tpoikN8i2k9dYkgpqCVBhmIPYG4B0DKpb9lP3kPMjPWEj?=
 =?us-ascii?Q?Ct91kounVmFnZ0gYmFUyP+3cCqfaqOZRVa2ur+/Nili3Nl8OqvfXCCBZ6rZZ?=
 =?us-ascii?Q?57Iglgd/tcaUcksQsBs5bqO+OyiddM5zUaIVGqDcY/H1+Xbj03y0TNOzpZ+m?=
 =?us-ascii?Q?R1GrBh1aG7aJ7oY9Yd43+zTiIsw5MXGv12/xQR1cOfRGcPQK4GRJZPsBr0iY?=
 =?us-ascii?Q?Ko+fGpAQyfkUiVhrbF3N9Rp0fZz8mppFeHjmQdNoZ7xhr6VaEzIrCa6rkWCE?=
 =?us-ascii?Q?TK+9JhuaHBLx3xzDEoLULN0FiTagqtZt7QfNanVDSyK+hpgPYzRTQPlFBzve?=
 =?us-ascii?Q?+i6mgPNgyXzWiIgKMUMDLvokVxCs68EP4xwH7YV0+OQvjPP912YUTaPzUACS?=
 =?us-ascii?Q?sFwyyzb7eTn+hTGKVVx3hm9b6vjYQmU4zim1bMVUSBK2w6v3STuoxdPKqFZ+?=
 =?us-ascii?Q?ltDfa6CAwUe/PjFFWyztSleKIoLKbl+oJPR5X8ttMYYEHfr6jUee79E00u+y?=
 =?us-ascii?Q?qwXz2tZLR/a4/mnYYjsixoBsAk9C6FkFxiB7PptuAdC5/NnzU9vJKSphgIIB?=
 =?us-ascii?Q?VAKca+7jBn1maQdAfDVZw66Dh1kSHAgNAo0uJ77OxW0GAr38m4ArW6OKplBj?=
 =?us-ascii?Q?rpmR3ojnzHSdcrhCvPzDKml+M0aDAI3zHGSoxjjXyqBixWVbQ5vzQw6p13JK?=
 =?us-ascii?Q?YH4anVkOjDDibgy/OtCI/x5c0wkdeQLcMV55u8njKRiAJLuTcOV8cfEQ4bF1?=
 =?us-ascii?Q?Bw+DFyoIG+28s3A34FgC0h5RRiWKxyvS5wv0y8mUjmkidDxdGdotI53StGBs?=
 =?us-ascii?Q?ZjrAIYEC1PkoAeiCfrKPCgUqD6s1rjTtOR3M6tI1tQMvCQmBOrr3mxkMtpFK?=
 =?us-ascii?Q?JeglpsTOuGKU5MiVNfEr1lUa1T5Lw/dXDmSjPQ1cg1qD+eLYb+N2TvQgqfb7?=
 =?us-ascii?Q?DlhLh38ABHNzsR5hMeEclgd2fAU5KgRHe41Ky0DOQKGWdvR1t2Llq4ziFZQq?=
 =?us-ascii?Q?oTUpf1SlRl6PHBtanu2LvrGJqYS/rBdyxxPfXi70RmSRsP3HPsUH7KCqzdpf?=
 =?us-ascii?Q?UgikP8f+RUx0TNJxCdImuegnFzxeICjC0jrkopsjWJuNuX0w8ppSQvs6mTry?=
 =?us-ascii?Q?ZDQNNc19scXoH12dt02zHRIizo7pUwZGUr5Uptrm6U/kn2vtD9QNFeLon1Sy?=
 =?us-ascii?Q?3J4CCfAbOkSF1CESmOGdgF/uFAjvFGzdZtJlQCvp07Asu+G5V9J9hYKKwuBW?=
 =?us-ascii?Q?xOuXA44Zg/7G5R0D3f/ixg32KVJ1GwFCQbQZc89sk2Nb0CrQNS8I5t6+qTa4?=
 =?us-ascii?Q?aIjeiC2rpXiazE4wXxFaIj4RTbH5wggXNhZjd2Fpi6lymBbd9tjy91LGkvdG?=
 =?us-ascii?Q?iKA5zZOvUFGGtd8qAzEN8WHLyYnb2ggtv2XDqMYt6G6iZWaK58GZ4i3Hw9AF?=
 =?us-ascii?Q?W9vbuumVxGQ/vMQSSuS8EskhVwq6K9AXkmfnklA2WTxA26coWZWTyeGTNSKg?=
 =?us-ascii?Q?3T/aPLK13YG61EieiTYM2ZIn0WLz9F6BMZLy8RhJXEskOT4omffby1k+uw1m?=
 =?us-ascii?Q?DLbyWQh1ZppcXymY9l1dq06F6U35i5IhONHX340C0hcSYVIgeqJZW//KFgTA?=
 =?us-ascii?Q?BCFUjjxxPIFCzqp+Nkse/0PnbFPNJg8MzrJLvQNFsSQSiwbqw/1x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d04df3d-6dc6-4418-07cb-08def958cd34
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:34:53.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSChVTDuY8Sl4NZwb4uUqOQAhct4P1k/yq4sm37r1dHDYP00M6ELEWKlEXdmLBQjGpad/sXEH9DOzqg97GjiN+Cm7Hv9TCwOwWmQs+J+vl4qHrGzs910xiH2tQE2t8PC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552

On Thu, Aug 13, 2026 at 04:39:38PM +0530, Manush Prajwal wrote:
> [You don't often get email from manushprajwal555@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> imx1_pinctrl_dt_is_flat_functions() iterates child and grandchild
> device nodes with for_each_child_of_node() but returns early from
> inside both loops without dropping the reference the iterator holds
> on the current node. Since the function returns a bool rather than a
> node, there is no legitimate reason to keep the reference: call
> of_node_put() on both loop variables before the early returns.
>
> Found by inspection; the sibling helper in pinctrl-imx.c avoids this
> by using for_each_child_of_node_scoped() instead.
>
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b7bd4ef9c0..fa8f6a7e03 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -551,12 +551,17 @@ static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
>         struct device_node *pinctrl_np;
>
>         for_each_child_of_node(np, function_np) {

use for_each_child_of_node_scoped() to fix it.

Frank

> -               if (of_property_present(function_np, "fsl,pins"))
> +               if (of_property_present(function_np, "fsl,pins")) {
> +                       of_node_put(function_np);
>                         return true;
> +               }
>
>                 for_each_child_of_node(function_np, pinctrl_np) {
> -                       if (of_property_present(pinctrl_np, "fsl,pins"))
> +                       if (of_property_present(pinctrl_np, "fsl,pins")) {
> +                               of_node_put(pinctrl_np);
> +                               of_node_put(function_np);
>                                 return false;
> +                       }
>                 }
>         }
>
> --
> 2.46.2.windows.1
>
>

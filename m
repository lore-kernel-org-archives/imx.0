Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841F5369223
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613884; cv=fail; b=H1HvF8v7rnWydmZf7YZd36MAQ422zlu3gPIczJ3fgBY0K2Ng8KZgvOy9R2BfDiAL+i3q0gv2Jj5AtXyUGbENMmIjE4BrQzWr6D7ihWqB838C6q6uCSb+Se0zZBi4H7OHMm6EcIu4w5FTpUhQvukr+pS97Q5eMle4EoEyDaQ+3II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613884; c=relaxed/simple;
	bh=MNgio+3HyihnMQtWP9Gxc9biDYvWliB1N+AwZL/sKhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rg/OkHNPpr4QRDPTrYZ8UOKN7R6Ko7FADPM4tnOwJUpeyh0yfgIogtJgxca/D43DkcCpcdMXFvQJQCVzexQc6xa1t3W/STMeLF7D7HRBomylitSMf4+Lbp1Hgu4TDvwrHuL+p/CwICNw+wfCmkgA8xREAPO53MzBrmo9B6XRtkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LCOFYNou; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LCOFYNou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR5GnHZpRHdqRrDnFujZwL/Hs6O2LpOuj8fo01qQlUWm6AfopGPVdxrFwWkAV14w2RWOuFBxKa+9l4K8d847suLGVhFRdopRmMrecG2phKhvSZXKY/bjmoJLmZckqf7AlR5nUb/a27mkNaerOLxhlcP1uSPKw+2oAatfpma08P/eHj+pPHMOgcQm1ZTxhFDNGpvp+jGSR8/ljUB2PndfFekek4zu4PCUY4OK69eCR6R5pmdvClHrZK/gqZdi3Bgw8z2qNfSmJZaCpSxPxPRWAyNuJPBcLVvY+UsuVzJjD+9c/CGY0TP7svWzs+c1GJUoJ2wrPHmxlrP/c+tKsHvu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8g50lr9ahcwDFL2MccPqtuuAdsIb6D8UEyJNnhmjUs=;
 b=tzfvUvPv0kMNpP5M9nGt7S8Vald+NrYNAg1eeRqlKEqZoY3nk/xJLkES7yDYreyQlI3LCwjlckV1NtlymdLQ5yBWJEcIEzHKg5lF9JdACfi63QtHyVL8fmxvvFJ3N9mNoPj/v4FDUNOiCNGVo/9XcpMUKOtpa9+xE4vHZRwRx4y+5eOPvRV6zT7xMbfTEgjtiBkwmnK7NyU1kqzG+nu0myuMKllPZsLHhZDfir9zgwxeL0k3eZrgSvY81AlAzeRq/WgfjVlU/mGCoYPW+mA8Lr7Rtg46dPHmzsvbtjucTivjTEB6R+r3UwE42yB4meKBZWdtnjCvbj+vfGs4aonShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8g50lr9ahcwDFL2MccPqtuuAdsIb6D8UEyJNnhmjUs=;
 b=LCOFYNouDzCa0jSrU/7JEA1JnSPysilXtlNBR68b46E/H0MyVh613aZHsdDW/BTcEXo4Cu4RQbYF6cKEt/GKuN0Q0CGSxwwAetqH3qNDnkcVMi1o+DiQ8XSGU/Y3ceOGt96jQI6uj0l3hWx3eU5j7WflzAjAEZ30m61mLwVBpKxMDzHNxS3lITlgi2dXEdSR+ExgR2CKt7sx1QbmMD27mnueJ6+kal9t45x+ODRQL58OR+eQzQdSgDyBwTtSW0IMqSyUbTFkO5ta9KnphdSJphbPG8vTVUv2ltF1IeNColfuwo1n+T+w9aBKdjkU2W3PmDcQwiIwzQlHKajqe1frkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10662.eurprd04.prod.outlook.com (2603:10a6:800:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:24:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 15:24:36 +0000
Date: Wed, 28 Jan 2026 10:24:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: ziniu.wang_1@nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step
 for eMMC and SD
Message-ID: <aXoqLd1QngxAzkz4@lizhi-Precision-Tower-5810>
References: <20260128073532.2904161-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128073532.2904161-1-ziniu.wang_1@nxp.com>
X-ClientProxiedBy: PH8PR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10662:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a3a33c-424c-4bf9-b36e-08de5e81588d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5j2R+a/mxFm4TnSTINFamVE/2w/bGmGs4d+R0gNFohbMIP9eUnESfnAmnfCQ?=
 =?us-ascii?Q?Md+tPwlnQJpl9Yxk9etlZm4rBIno5xG6UVr3CGGAjW8bWYUGG40xuAbkJo7O?=
 =?us-ascii?Q?ho3AedupKUk9laHD5JYAB0OTDQ6PW/X+hj9CGdmWKeXa/LXiHHRRC9T+xlBf?=
 =?us-ascii?Q?aJaqqcVcEvh93EJnx0sjD/V374TePU7ria+OhdLsZmPuGY4Yf74K+dJgBuGl?=
 =?us-ascii?Q?lUYOv4YqvBXL0LUuHb0F1IujZoTfwTXvZFP81SZMHZVwPD2KJ6OgqPUTT7ND?=
 =?us-ascii?Q?m5we8WtOm7ELL74efCnD9zH5hYpvfNtQyVO3yDPAWKuDDWZlQYo0VtXNGSLL?=
 =?us-ascii?Q?zVWrsl6wn24D4xha3L8grTfsS/5hRGeXzcs5NMva1w8iUq1zwRlUg9qaBsGN?=
 =?us-ascii?Q?q8bezC/mCBUGfe5ObRO7fyxpDKbH2IWpRGhReILEUe04DDo5lFmfqP9IayQe?=
 =?us-ascii?Q?92SMpCiBZoq7doeTHLnXWm0BuZJ1nvU8ZNLenji8fGFnjrfmmD5EOH0epRm3?=
 =?us-ascii?Q?owidJTPmTx+oCqlpvsAja1URW2+SZvluFrh4jsqug8ePXx2fVksDpY0UtAuV?=
 =?us-ascii?Q?G96Fmr9qYfmZ1zMubhOr+AWvbUHbbno9ozSWmgdNaRWtzMgQtxndNeaihN28?=
 =?us-ascii?Q?Kzj5BqqGmxkviHvbh06baLDhsCPbHdU5ZZstbZx6OESOJEmOZylUN57n9ger?=
 =?us-ascii?Q?4cwprvTO4Qnls7/odpwstMYLse2qRuW87+LMIELBrwPfFrekMNVZU+zE6x4w?=
 =?us-ascii?Q?1IEyrZvUT2RZJnzR14kNqXj+kjJYr6ROm93wmvhHNzPkNCeQqqNUWSvPAUzi?=
 =?us-ascii?Q?lB1bNZvBJQKBHUzEqDgO9YuPCQOIObQje6XTM/cEWxJuK0fespcY9EWgCezl?=
 =?us-ascii?Q?9Hg7EO2sWQntsb0oQ88T671IfBznzYrqxgdEmw0HyQQ797m5Da6i7UixEmxM?=
 =?us-ascii?Q?Fxw4x+bLOgQs9dBwwXyWrsXyntNc1XXDDd1pROxS4W//WUxZHpnidHhZ26Xm?=
 =?us-ascii?Q?E7ouWRh/4L8uOpL3cp4OgCR6U1x5fIcoGjrMdmbJqDrqFzT7NRulk85iwvjX?=
 =?us-ascii?Q?Hut4cXca1NGBmFrTaLMHjEDajwTY01Ts1UqYi6+4hui5lA1xyOcwMkuOpMBh?=
 =?us-ascii?Q?tcDw1bKAoqXenY0HHuJDuKG1E8KyLCsG4nxVzdzHL/FzQtsA9STv9uf6B1yZ?=
 =?us-ascii?Q?klWSlSySZqnXEtMK/Ato1LXoE71tweBn1yk6NIBgfavFbDJVTlTzR8+S2cQa?=
 =?us-ascii?Q?pTktOh8ZWb0kT47e9fB2xjrsGXWe2bvBDWcLmRSuz741BIGqJk97lfgLWw/o?=
 =?us-ascii?Q?ngzrEFLLXk4lTYv8w10YDYMGcblxaXzqVKL6wfGt7j6nzb8bFGLDwLpiEauV?=
 =?us-ascii?Q?4IvitwYuU6iC3ht6qQN0h2eW7cGj+XR2CVTO+8eAW+BY4wXDwM0TuLPqnKw1?=
 =?us-ascii?Q?c0/4acmkScF3qQebFrxy8cB8p39DyYMidbFDu8uMDIscefJfmSe0TMhQS26x?=
 =?us-ascii?Q?XWuvd5dRlJHfbPlrTRPS/HmUBVKFotIgD/Y9i+EQZkkoc43tyRbaKNWrEmny?=
 =?us-ascii?Q?hy3R4dgXcpo6EMrY9DRF3E73DH/WRerHDp65FN5iBwy78wp5HB/Vv3UDUvG6?=
 =?us-ascii?Q?xr/FKkY7DbfnilIEhbEYOoo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K03xKAZEw6CNpoflV2hnacgZCi6M4chYhQ8Tdpf7tCft+HoWfkA4ytMnUJ1b?=
 =?us-ascii?Q?DjkHIlFE5J2CEvbkVVZxs9nDc3dcM8A0rF6Byco1IRqef060A4/Xj2XmA6Kb?=
 =?us-ascii?Q?tQ2BEFD7yWjSD+f5fvTOr2OKs1LEHiwl+6FFbtlXDZyshOQ3zBSzGbEAJkIO?=
 =?us-ascii?Q?oDr8BNon6SMwByY6ypd9np9nd0DljsrSyhS5oR95NVU4GJC9a3bHn3d8rDim?=
 =?us-ascii?Q?zgTppSHutVFOBA/4vTa+iRBPLNDcUkg3STjlDok4M4y3hYG9f0ZBy0rueB/r?=
 =?us-ascii?Q?4cz1gLmDLInP00aTLcgo6pnhhJqGcx8+FIsTGQsse5I1rjaB6ub7Lfq0+zJB?=
 =?us-ascii?Q?vqgz/KcnsMfqYRlnrNXAJPwlxqraHVfP2crNi1pHA4MecdeFSgMwJn9eIIiX?=
 =?us-ascii?Q?lUFxFvh4JO/1yBhiwJr26X6Om3DpkUHD0/ZUnk3EgdAVwW8vC0TZ+Y6Lpv10?=
 =?us-ascii?Q?8TI7ti2aIlso6UVqz5K9C6/tYpB8LFVeWUk/VKYrR5Rfp7Qpxovi3jWkN0wb?=
 =?us-ascii?Q?siphANso1ulewu/u5mWFwwQyWFm6XTs2gkMNh06dUqbaMjshdCHvwB8wGd4W?=
 =?us-ascii?Q?HJkmkSNtwvwT+s5c71PigfeSiG0L3mrKoP3g0U84jHnOeF6ABCbAaWsdHsrw?=
 =?us-ascii?Q?ZRb9SMmg5HCad2N4E5BJQnAtsZp78QIIifYVzQNvzLRWUrHpHBhyegsH+9kF?=
 =?us-ascii?Q?M8iPmj6JWuZZnTDTlhpguK/33H+H3CDo5t0OjTXJdNRqK5E+jJ2sMcaK33al?=
 =?us-ascii?Q?PKuCUA67pTQiGxwXtY5V98ndTLMnRnSEgI3ZnBs+zpsW6uqwJkmhLoqrV5lb?=
 =?us-ascii?Q?WSQ7T6dXHPdEhD3O3aLxlXR5ZE11SpU2Dv3VKQt6y2DTcbGjuckKZiT49kfj?=
 =?us-ascii?Q?9zm9BMA8dHXEDxs/k5BqTgGw1UvBWhYjtG0CjypJkkueW/F9T1tEPGLFAc75?=
 =?us-ascii?Q?PRDGWZcDBgpM6rVgH5P1RZMiLMy5/i4ZfDm4ur+g77oKJCbRfNwN87klqEuX?=
 =?us-ascii?Q?Em1s4NkQeycv6WFS84Rb3Y8Nzx9qKxkkanrT68NYnhIztfkJRtiaj3K641kK?=
 =?us-ascii?Q?fkmDHjR1Gcw19JofTaM2NhFGvZtn01huNg79Q4advdWhsCr5Y2bbuYxUz+Ki?=
 =?us-ascii?Q?237VNZ2gXIARt0Gr4L/fTHa04vjv+ukmb0PxPvxdgavyH5haCoEn0eNRKX9O?=
 =?us-ascii?Q?Wa8sk6aeO4aKi4+Q1yzR1wJEi5EtM+rUEw3jM5g1gDHf1lXitIbyx0QEizG8?=
 =?us-ascii?Q?/R6xTwjdnlG4kB8dCn/El9W1a7LdBx4W5vOMOfs91C3BVF5jRa145dFFpaN4?=
 =?us-ascii?Q?Uund1zKHXbkFXgxqpSsLW+YxL9UqyharyKnqKD1mU9w4lDg8Y+1eiyRoCE3I?=
 =?us-ascii?Q?TVxOk6zHDdS7ipN8X88hENnqkS3RPbtQSsgN3Vumz0h1EEuM81BqrfEm0VJV?=
 =?us-ascii?Q?7hEd1t3RvJ6iJNUw5uKYqZ9Slb6GSOgUaNamgqCwZnRjSFPP8sWH2WU/qHXl?=
 =?us-ascii?Q?Gj5iKYxC4PUVv+NYsIKHfXV97oKXSo5UT1qbrxM3kEYJcri7ENUWbg9QGWKJ?=
 =?us-ascii?Q?HMakrRwdeSJLd85QER+jclMTFRRSCKaaHN0ykytBpdSz/5QOX2S1htSWBBlR?=
 =?us-ascii?Q?K4UIvFNIa6fZcBlIkje5KykyjCSLUdXDJT4Yy/QidfX/JGUYtdN4VBfOWwE4?=
 =?us-ascii?Q?0qiKhxA+rAm53UDLTiD3v31YPZLGLo6zLx96bReQ61NCxECTDLrc0kmjY0Fs?=
 =?us-ascii?Q?WHW2XDSanQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a3a33c-424c-4bf9-b36e-08de5e81588d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:24:36.4103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZzKY+CIyPX91NiegWCy+zz9yy31TzzfY72YN84lwIW8O+PZb2t5sL7qYBhFmkkTBjJif0gx6TtxAfrwfjSRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10662

On Wed, Jan 28, 2026 at 03:35:30PM +0800, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> For eMMC and SD, there are two tuning pass windows and the gap between
> those two windows may only have one cell. If tuning step > 1, the gap may
> just be skipped and host assumes those two windows as a continuous
> windows. This will cause a bad delay cell near the gap to be selected.

Suppose you meet problem with default settings. It'd better descript what
problem you met.

>
> For SDIO, the gap is big enough, default tuning step is fine.

For SDIO, the gap is sufficiently large, so the default tuning step does
not cause this issue.

>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> index 0852067eab2c..197c8f8b7f66 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> @@ -507,6 +507,7 @@ &usdhc1 {
>  	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>  	bus-width = <8>;
>  	non-removable;
> +	fsl,tuning-step = <1>;
>  	status = "okay";
>  };
>
> @@ -519,6 +520,7 @@ &usdhc2 {
>  	vmmc-supply = <&reg_usdhc2_vmmc>;
>  	bus-width = <4>;
>  	no-mmc;
> +	fsl,tuning-step = <1>;
>  	status = "okay";
>  };
>
> --
> 2.34.1
>

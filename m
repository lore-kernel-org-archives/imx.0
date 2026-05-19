Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0533624BC
	for <imx@lists.linux.dev>; Tue, 19 May 2026 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214608; cv=fail; b=Pxf0hhNS+qE6ZAGHo7IF2GlfNavcVqQHPyVKdrs1guQ6Zha02C7+xA9RftIU5zpkNb9MI5qCKVEcxYqh30zRNQGaZ0Kl58m77XCwkntyu/BEblwk6ByBzcFebC7MJDELpailLETy6q2sxRuZ3effl6jvDrj/T2/t6yNvP5igbPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214608; c=relaxed/simple;
	bh=h49DM/g+7CoqZpYflcLFm23UmxxNo3c487AEHwdva1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mk/ylfdWkUeDAoqFyf2CPLpbtfhBa7LmcDDzzjvW8+rGYFmff3+MvO3VzJptzLvL3TKEKh2OOx6PMyxI0Zbs2WrZ1NRXnoKv/WCa76KX5VXF33UdStwgpd+YbeBFn65HZw3hwspliWIOzhNaJ73CZS4K2PtxDTTXps7k+qsvfOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Il3MruNA; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Il3MruNA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMFakxArasja68gV9vWzJegwfo/ZC3fuNPn0PS+ExwCliabK2gWlPym39j6WrvdUQR/mCsEsFAUgefhpkMniL01QdAm22dKz5yt7UlsZbfC8of+CpqAVh7Flg1wXCZCS8uFFEThndSmelUrBbeHKZFoIS1zCflWwQ77paLtD0H43K+ooM0uPw/5XnN4r71p+AXHBympAMyCkX76mRVi8eDEnvcIPXAu/lRQGDzk9IbXn3+UQ1vOB0pFLsf5tQE+zFPDdQcz1EtNd+Dbvbi8G7H0Dk3TpsWfJTgf8Si42QR+gaHFf2BR+p9Z8bwKyo4yUJkk4QVNEpZUi2gSQC8sNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsU7XpeOs7+/lLAhXFbEfOaYapbO5JfABsjCokZnvpk=;
 b=ACdSdsp4W6r2ZtaGQ6cQyt4dzeZgFbqhVoPwMPimrAEWAYNCQH/MNuReSS4pro2/BksctHvCshxtY/o/kBoBBW6QKakFFNI0Iaob+UvQGfkRVLlLe9gTpwXDC7KMtF/z/yGfu1si7Xe+Pqd1A6JOTRBPkJdj0L5JAyhcjAauZXJXt7gnhVaMmJEONRJG4177eXr7Uu436baIaZgcRS9PV8eV/OdsaAMiu1TKAuU14vASdhILCBkjnrg1d3QDi9Eh5J3hJyjsYJjspM7YrVmb6RB7g6TRY2T00d9BmbfK4EqxjGCPwBI61b5jODJGG3fD3OAW6x3aJ7UpK01dcBp3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsU7XpeOs7+/lLAhXFbEfOaYapbO5JfABsjCokZnvpk=;
 b=Il3MruNA58fRgcq9fEAcq+HBwik2y7LwajqctYkczlu5ZQR5NHEX3vXXNGZ0sTy1uga6lUfydSBlrlfPnECb09dMEdcGgO9zIMfAWJT96gbQf1RinbrI4onL6HrN9V0N0B+lg5xMeD5VmGzROq6K1wA6Hy/TSdVzGZ6svKEvaKjd/MLwKT6Q46GqHOQyTRpJmL7gKjg9PsZgFO3bIapSPLDkZFHw+IFXBQ2d762N/NKAXRnVZD6L2w8mLep1VFck0AgwROUMXQeY4aYlc6e9BysrgK2yVvQd2DegJcJ0GVKOZLf2RH9gBXudKvXgQ9cTr+2mabm8k4K4GJ++3cc7HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB5PR04MB12226.eurprd04.prod.outlook.com (2603:10a6:10:64a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 18:16:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 18:16:42 +0000
Date: Tue, 19 May 2026 14:16:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx95: Add iommus property and enable
 SMMU
Message-ID: <agypAmk_rvQXDEfK@lizhi-Precision-Tower-5810>
References: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
 <20260409-imx95-s-dts-v1-3-858e83ae1a37@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-imx95-s-dts-v1-3-858e83ae1a37@nxp.com>
X-ClientProxiedBy: SA9PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:806:24::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB5PR04MB12226:EE_
X-MS-Office365-Filtering-Correlation-Id: 14955372-d76f-4d5f-62ff-08deb5d2c72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|7416014|52116014|3023799007|11063799006|38350700014|56012099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	0WPY3/umhta2+DeIlFt+tftfkVP7/uS4Na2w8A8gYWgz4oAGboQq2DsRVxjprpLMea3aqW5v1TBhCUI4v9OU0S/0GlXjthA8vXwPSUZXRReT0xpvW9XGnlKtoNmMie5WkjiRLgPeqOIvY0kc4Xqohfqdms4UNw9f4f6nCtWL/Aw21GkwQ87MhfxYx0lod/tjJxOaftij6fFyHkgGp+qW8VwcPSN/ycUF9jebOcFvJ7am2oll0V18rskLeAkIuLdczHb6eb35+s/ysxs13lywPWZ0iS4+8qt8POaYbFgzMQvqQ09SrQDadPWqnZ1HAoImpfsBY3rQ8nZYqse6jI84OqrAqq/dW4M1Yk/XHD4ty5Q+UuU4rwXwjSX0qg5EQjYmNhRLXJ3HCoOwG07RAYPk7VGHUnRbLWzFAQq67zibotJJzaPiTnpSDPvyob+jqsGCnBPs/bNb6CfiBPb39nqoqYFuTIjL195dZfEjYJe7W7nG5fezoRwgDcm7kg1EMO/dCM9aASasasKTWLV+A5hXbSdvcKMCcLv/pwoCzRIISmbvEy3/fRfZRetaDpUEgbWADkEk+TxtpXgIElYNagoPMx7DQpDCmAOUDBuxCBJwUVOQ68hORFe+wrk379e+FDYUwZhy72jMzNWx+ugoSyp61n2iYwCeVZhvuk85LNryf1mqfUlEQXlnJa9SwDHNczWmfOPj2EIiGGY5sSONsc+/dd7Le8UPWRTUX0Hgxm+8XRsFc0XjFV74Pvn7X7DHfV6o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(7416014)(52116014)(3023799007)(11063799006)(38350700014)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0W/Jk5ftdUTCOsHW60mML41sRIeNKXoGnmTUnXkeQilStQ+uD2YLL9yiXIuf?=
 =?us-ascii?Q?I/tlJCKo3BAcbeY5Ht4fdZWt1l3b9cnZXOhNh9JXjyQ5XTQl/6bI0ECZMq+l?=
 =?us-ascii?Q?Zv/BiljABf/g0EobVZ47d1gK5Uu1eX+VXMmwl0gRGOQyh8/tNpsynXNPeA8d?=
 =?us-ascii?Q?BJpLdy+SNkY5zDNu+uBvi3ujZ3OrH8cAtIjo6guVLhEjkTCX3tclBfwNZACY?=
 =?us-ascii?Q?DxjfLLnXkR53kOvK9pgVxTHrS/nZhEvSdlZ+pdK6/SdrDKeERH1n6aEwN7eE?=
 =?us-ascii?Q?v+uulup2AUVZV2h90xzshH4qNyzqtvgUNU5yFiaPM5mePxxBUJDoFFOk5UEB?=
 =?us-ascii?Q?pFm/dsxlnAyOKSA90s0FR7OGvrD9rmL7ITAz5LY9dOVycvcZmPxvWCR7r9SM?=
 =?us-ascii?Q?p7CUJSasRpFuK9Y5J8qlE0nK4oHxq3Q7cx0v4hdpcIOjATfT3WL1tf2WUqwN?=
 =?us-ascii?Q?5woROMlnKsI6Ee1Fm4M0XnfnSwQwohGOfp6KL/O0YphHbRnSZ7yA+MwTtwxH?=
 =?us-ascii?Q?IrHcS6iH3tKdFBznF7Pl85AdQbrCijDEyXBAM3WhzgPBAHgrmLxD1/kSawlg?=
 =?us-ascii?Q?wtsHqyFQE85Ki9YmecWGxxXGF9g3Eqg1GXyK3mH7w4BsIaO0R93cPtR5j9zz?=
 =?us-ascii?Q?13ru6BXBoHdTUmhecUme5g76BNZ23oDOq8XIJceD8hmWQYY5izJU1jE1D+bw?=
 =?us-ascii?Q?u4E25R4kA4+aLLo6Y7sg9wRT0zbH00pfeEiwgU4N9y2FsJGODTjXoqIRB1RH?=
 =?us-ascii?Q?6Vm3iBVVBPy7icMY4cx6q2Feu0MDvV65jRa0uJUs7TgeestMyKIu02J3dm9f?=
 =?us-ascii?Q?HGy7+bAcZQ1u+p9GFJs7KArXVgQHht2Y7BM5QM2ZKELk4OthBUwppJwRtKsX?=
 =?us-ascii?Q?qAgcQS051M0r52dG9UyXSeuUtc148t77Ozl/j0tXzbd8NCjPSeH1HpIHCN+I?=
 =?us-ascii?Q?ceAztiiLReEKVUUE0MbkUf8p4fGCVPVzhIQuycKCLYzymWTw5OmDFGIVL/Jh?=
 =?us-ascii?Q?/av1kxA2TH7AdChBifBQRDFdD6P29VxIIOfd+9zoGaAYSZu/v2ljsZCR5p1P?=
 =?us-ascii?Q?9yONFW5Pw9t2PA5DEI/TjzZpupkB5hIF2rDhdXPZZcp0CFJ8OejP9o+4/Zmu?=
 =?us-ascii?Q?eYuPlWkvqNydZO1Rtw5yXhPhsmOD5XZiAvCo/uZE7YSjPDb6GWIS4RpN8OMo?=
 =?us-ascii?Q?JxKNrciKIhcTuptF/Nc4v59y2oZHn/sQJMmsxlfdOV9ZSA5VHO/L+CyfiuVX?=
 =?us-ascii?Q?XrosqJTp8BWRGH8Xeulmxj6Ugg8KMhmEqpp1uAuchJ0WE23PPIQ49C9B07Hq?=
 =?us-ascii?Q?gyfBsEfwyjM3NsJYR7AAIHwXauwhMJd6vVre6PlmTLhlzj1EIIXH99z0AdDI?=
 =?us-ascii?Q?ElCPUG9L3H21CISrvGcjbDO2SkFlh0w2diQyoaO3kUxn/hBKdhP1iqzmKGTG?=
 =?us-ascii?Q?z1MH/5sz8YDHLPwCFVvVAkvGoLs0q3SwcHVD8Z8Ins7usYVPemaZu5XVynrA?=
 =?us-ascii?Q?79X6s9Jj5RLTwik+ifsGzLAem2LJXXHpOd80Qy617ZpKy3qO/pWlFiAmYO5x?=
 =?us-ascii?Q?Q73N+LIRuMnV0bJo9leWBuYEr0BtHzEHaoEGMjtCcvtYuCcAxwk9L26NW5Ym?=
 =?us-ascii?Q?mr1dhml7rqpRaNkzTtUneWyW2BJQjruAbi7goF6Ti8CjUE3g7i9XUbnsj10y?=
 =?us-ascii?Q?cE/zeO2ifLQ4YNyTpVVK8jY6lJnnOrpqJ6d5u1hcVLoPYRsf7YKa//k1aahY?=
 =?us-ascii?Q?sw5HadohQg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14955372-d76f-4d5f-62ff-08deb5d2c72b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:16:42.6508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdFaAdsQXRsfm5/FJTttrajrppuePTsfz+4fKmdq5+3/H7jMY/nLVxWcpvW4qNqNQmypfL8r4qGW9lOl7fiUag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB12226

On Thu, Apr 09, 2026 at 08:00:03PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add iommus property for SDHC and EDMA
> Enable SMMU by default.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Peng:
	I have to drop this patch because it cause below CHECK_DTB warnings
arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml


Frank

>  arch/arm64/boot/dts/freescale/imx95.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 3e35c956a4d7af88310b3dfaef7e3d064f530e07..adcc0e1d3696b93250ab97fcac7c181b187d3d10 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -777,6 +777,7 @@ edma3: dma-controller@42210000 {
>  					     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
>  				clock-names = "dma";
> +				iommus = <&smmu 0x0>;
>  			};
>
>  			mu7: mailbox@42430000 {
> @@ -1242,6 +1243,7 @@ usdhc1: mmc@42850000 {
>  				bus-width = <8>;
>  				fsl,tuning-start-tap = <1>;
>  				fsl,tuning-step = <2>;
> +				iommus = <&smmu 0x1>;
>  				status = "disabled";
>  			};
>
> @@ -1259,6 +1261,7 @@ usdhc2: mmc@42860000 {
>  				bus-width = <4>;
>  				fsl,tuning-start-tap = <1>;
>  				fsl,tuning-step = <2>;
> +				iommus = <&smmu 0x2>;
>  				status = "disabled";
>  			};
>
> @@ -1276,6 +1279,7 @@ usdhc3: mmc@428b0000 {
>  				bus-width = <4>;
>  				fsl,tuning-start-tap = <1>;
>  				fsl,tuning-step = <2>;
> +				iommus = <&smmu 0x3>;
>  				status = "disabled";
>  			};
>  		};
> @@ -1768,7 +1772,6 @@ smmu: iommu@490d0000 {
>  					     <GIC_SPI 326 IRQ_TYPE_EDGE_RISING>;
>  				interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>  				#iommu-cells = <1>;
> -				status = "disabled";
>  			};
>
>  			pmu@490d2000 {
>
> --
> 2.37.1
>

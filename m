Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D456342510
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916038; cv=fail; b=t5q1paIokGirnyF0FIzuBys362JDkl57ZkYs0++WpmO4hPVX439dVwPNgy5bUa69FOOQmMqRzv+4McCf2jyU7Tq6wCk30Atg1iz0CN9IwhdTgWtKNFG/AtX6XEOlOuwb9Msz3FmorPaBmSrIGh9Io3+eWNHRr+/AFv6twT8KxFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916038; c=relaxed/simple;
	bh=0Ah15O4lP0dswmFc++kM2cFcwrqgocsgs3ylygx23qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ihu1CeW8ZA3wKjeM16N/EbnfenvrMVwhtHLMVqtb+bzGTSz16w7LR1VjYp9bPqE/59T6Qr4slNUkUShp8FlpVxrcwAYADfLuplIoJuZJWSn33QzaXj1bdDxx1kFXB0Y19lHMv1Lf1fSFJKXd8zE2o1h8+wHCrIiVy98do4iZMHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tQknxcJV; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tQknxcJV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nI0kTsAo7PI94iHLFSuwwhk9Oyw2AKRRTxViI3cOpsvXWjFaQXkAl6gD1JVmd1mZfqM+lAg0irLA3IPjNsYOPLXhE7yiDKcv8gmZMvG+5K5o/uae1I7FWCfkMsq9rkVgASuBwNsdVebzpXZt2JQQ3Qmdzu0IzjjmCBneuqJ+Ygbf5yyeCIL1Nrjzi1uRydkbA2otAojhjDLRbmbuTFtIMuxXe/XU5g/+FAc4RNqjJlK7fJb2QbX1tElJQa2OVhnNXO98Rq0ti5ztnGC2Lals9FyWjX7hoEVyV8Wp+TpPXw7Bkogkid702x0WtfgJ+oV3LrFItTF4NuviQQUH4akwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9KLtpA1OYRz5CRbdM5Z97ti/AlXd/L0OITQB0Tauqw=;
 b=m/juC6pqRfE1GTwfutOxq6xRbM5uFg4wxQy688dqiu2WpkfZK+pBns9GrC5wFrTvuN/B4EY+UgFw55Hg2jUvWusAs01STzAeXeYW94iNG4dtxoPFMDL/dr1B1SRy1IkH/CLns9VTCjfxzqpTVq/UMGrcO5Ix9osolkb8dzeT3IqxJJuHki+TnUODBzUIH8mgMJmpL2n/QQAr/vj8eXe5fj5nuOO3GcdiKUd4Cl87K7eVHUOxZCKVQ0MsUmV1afT8dBVBgKNuwU/U9man57qiLhSjx+8YZBeu8oc5WeBcmZabDJ/uT4v6eMNO8J+nvm0LkQXncBqkLJKO6TM2oLP2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9KLtpA1OYRz5CRbdM5Z97ti/AlXd/L0OITQB0Tauqw=;
 b=tQknxcJVfLku9C6SJbcaxwQa2Rw0+VmjGdTGHt/P//MGyekTphelWjhd8oU6/FEzqzxE5psFldNkaPmd0Ij47dgMmNmW10ul4Zdmejo0KwN64Sqvp1GnrLd0ysqwmvh1W76Bi7TnQdZ/rbYyKcJti3R1Hg5wR6vFJ8Dpbrl8eCy/bfI+uVCkw+qTcM/201SblBYYAJGIFR1s775C/93Gz2IgeCVO5RpNBTTP5i1YrJaNHWTP7JXDplNd6eglEwulpSFbGQp0DPzXdI+h/TJaQehm+Yz6c6VdH7oSU3RI0kFM5jCTO+gcSZtCv+s24KEDTG5ZXODsOVm8At/cLjjvTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMDPR04MB11649.eurprd04.prod.outlook.com (2603:10a6:20b:71d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 1 Jul
 2026 14:27:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 14:27:13 +0000
Date: Wed, 1 Jul 2026 09:27:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] arm64: dts: lx2160a: transition to
 device-specific SerDes compatible strings
Message-ID: <akUjt5OPiO5cJ1D9@SMW015318>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
 <20260701131137.940145-2-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701131137.940145-2-ioana.ciornei@nxp.com>
X-ClientProxiedBy: SJ2P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMDPR04MB11649:EE_
X-MS-Office365-Filtering-Correlation-Id: 1316cc75-585b-4ebf-4a10-08ded77cd808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	gs4b78QEaTDoWy/tKjOgzrfbU3JUYCTvP2bTQziGgFrksbhQGeRvlLSVzI24qSv1cVCo0+iF6jTNFtNhzOeZ0mbaFfiUTeHIssVa3rMb5s9fCMGlWKGC4U6rLn049cl1CbEE1lWEAJCtj8VJhvh9E8atvWnq3D1qo1nMPdhHQ16phWHE7dCmRCY7emLCcgbW/xMMG9Ed0hn/CJUVz/U0wLlykgRDCDWTXP+ROq2YVF4abtN7yP6D1UCBoqH7hVJz/IoYHWtp54jdbfa8agbeDv0fDzsAsliG3IeVp2IjELlz7WMSV50YOY6grFQUpNfyAzOKotXqRGgcMqqH9QgwCU5JYeQwDjOJj56TkWBiaMvEZAYMpDv2KgXinPAHo1CLXKMqa7anEV8Dz25e2qwZLoejX17id8OOrUTcGdjdd3m39cDysj9m7N7Ha5g75wKpubFw/uCJ6M+y4VCgoPy+90vrO3pZVATNF2HMjPiYC2qhBXU6yyGqelT+jDhbNKtz1EqhYVm0kVnI5y2Qg1P5QCulq3J1XI/OCyAZD6QDqAEvJXQ4ec02NfUJfbV4nE6da5ikw1T2wW4/0DVDB08aEnWT+WWAZx41lp4DbH3FxaMmAwy4bKaLmlORdqKYVFwkValdzvy76rKW8aeOLbze32BYzTdgZa30ZBgLnfmjTz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BFEnqUy281VSEF1kJIJ/fKBZCvu117ZNgdkdJgT7k3pYq6k02hq6BxofsX6G?=
 =?us-ascii?Q?Bwi8PI1zOz5Zdr6Se2NxFNEPdkY5sy0Kd2TX7UtYn2+v+s6PETCGu2+2fbTA?=
 =?us-ascii?Q?r+3YKzQ85PPQmgbberbjUgIYkg+TyJHlVDkEiQxrOlDTnq2Es06F6jFpph/M?=
 =?us-ascii?Q?9/npjDgxotVneoLkR7AgQ4NTB6U8cmGDFDD/J7/N/FGrY4qWXrzxWVCn52i0?=
 =?us-ascii?Q?jVRfhi4FzG60jO1FvWxjIyx/HhBhtLiKHW2JqfhXdJw2obFJUxmF6glfHCyl?=
 =?us-ascii?Q?jkfIestAexQH48hVJwof2tZAP6s641Qdtefsg2qvgqWkm2kumo2LIgCQb9qc?=
 =?us-ascii?Q?eHpvTd52LOA3+BmgnT56ZPSdOWPSntfcZ0vJFQLIj5SW1J5touoWfQEo1x0P?=
 =?us-ascii?Q?c/sLtfHvmjDEYjvw1/xyiUSfs03krU1eE/frUG8wq5cIxr7W3bg3/+PVJIHg?=
 =?us-ascii?Q?chHSJjIKIPd8A7eKIz8t23+bZGYUwqG3Mah3KJDA08JzyDTMdB3MbyAeVIf9?=
 =?us-ascii?Q?xbtC48spe2bIiNF8XTHUESl+ejd6PgJD43aoYWGMp58RXoI4e1ckOTwhIK4v?=
 =?us-ascii?Q?KFm5yqXPZfwr2D2220ViSvDsdIxzyDTRevmebdX47A0/vW6+0hynZ7zPz/7a?=
 =?us-ascii?Q?DsxmXQJJfhGaYz+PVdGk/9DIQlokbFwqk3Q9bRAc1B3bJ2q4ilDm8pGsXyrr?=
 =?us-ascii?Q?/twRp+puMpEyt2P2jig9VAWqWgpkskNpSugMpDctchZ4NMyj1gmwOPa+M16B?=
 =?us-ascii?Q?jpQZ8K2hE6SioBgi9jao/rGAIdbqwp7zZhv7aZhjEvt4ElMvEviX3u6ODjE4?=
 =?us-ascii?Q?mFRvLhdzN7E4VTMYHoNBs2Vy5q91MbdHEp2R986wwILx0/HkE/r9w8kB2Jdh?=
 =?us-ascii?Q?4YdFojTxFDP0y6aOkT7NWYSvDuUBhMVyBlvl/OPxFBr8bh925IuvoJBVEmVI?=
 =?us-ascii?Q?6804EE2RBpJobKd8UvCa1ZtZh7tcNP5i6GULrrsOQVZelbcuLW9qVIKb+rEb?=
 =?us-ascii?Q?CcPPe8u5lWDX8or7bsTtIR7n/3GtpzsJU/BaHJKU40Ufxlh5CagJs3OxJyrf?=
 =?us-ascii?Q?PkRB96FztqgSXKyd0RdoTHF85Ehq9um3tqymZHuPw76/9f0sJ4KPU42J90+c?=
 =?us-ascii?Q?GVPyUg67njiXFHKMX87a+iNaDk1BTXHjpvZhSq2SoMbi6NjWcqn7uH/SxMrq?=
 =?us-ascii?Q?BDQdkMWgnzn0EQ2yjSS2i5mu1WAJJDpPrXDLOztZKsIjHAnV6+RQwySTsslK?=
 =?us-ascii?Q?iy8a089urMlPjoF1Nb8XjWe4eEuk04FPwbXyF1K4/9bxjZyevbp+hweXvkeY?=
 =?us-ascii?Q?jV/SWyOY8hbIRxZI0DXVUwIW0o+5xolqRIYM5MCwPYPoQixS+3TWaAoOvmHM?=
 =?us-ascii?Q?6M399//nZaza6rj5a0JM7cVO0+RPZkg2SSZNPI8x/rGvL5SJDUhvHNdShlI6?=
 =?us-ascii?Q?h0uV20y8y+f6DjCuAECOk7yfVXT2TscEZOGx8azaNzS8v7EOtoc5CxbqluJQ?=
 =?us-ascii?Q?nAnDRQiJu7C1w1ixbO+C25Cez5uNj43RAm9H9xp+71/YeEyrtbgE7cQeWngf?=
 =?us-ascii?Q?9/0a6FjFr7c3E476wobFWm4tpJM64LZ0s09Uauo/vy6VlMJU0UY0RGDwCGHP?=
 =?us-ascii?Q?lb6KUTGSbZ/OoqWxffsa/yl0E1t8nU0B/21dAJ+sGBLe8+OTw651LJzx2uE7?=
 =?us-ascii?Q?UkrbJTfEAKfZFPBYpQ1AkfDIsPh6SJ6+sv9+MMQYhhmZq12uGqdTQlO/cWLM?=
 =?us-ascii?Q?/JXIucODH3F+aYXOhuBHSoqWzr0yyFK3RGrOaSt8dmyVsfdJeyzu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1316cc75-585b-4ebf-4a10-08ded77cd808
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:27:13.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcJbCjHgxnebN7bJCG04UtoLoyqLMvwvUQLQimrrLv6XsMbKD5VUMW1ypiC1EaTIoBzyy27MknKQsJWA5g9TgGFtXZ4HtrmwJw/5o9mBZJ2Bh4Cc/R7HJlxsYEBaRN2w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11649

On Wed, Jul 01, 2026 at 04:11:33PM +0300, Ioana Ciornei wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> Align to the modern fsl,lynx-28g.yaml binding, where the SoC and SerDes
> instance is present in the compatible string, to allow reliable per-lane
> capability detection and per-lane customization of electrical properties.
>
> The modern bindings are backward-incompatible with old kernels, due
> to the consumer phandles being either in one form or in another, as
> explained here:
> https://lore.kernel.org/lkml/20250930140735.mvo3jii7wgmzh2bs@skbuf/
>
> One of the major differences between the LX2160A and LX2162A is the
> SerDes. So far, LX2162A has used fsl-lx2160a-rev2.dtsi, but we need to
> split that up even further, and derive a fsl-lx2162a.dtsi which
> overrides the SerDes properties.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Enable serdes_1 on all board DTs that has consumers for it.
> - Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
> - Remove paragraph from commit message which mentioned some consumer
> changes that are no longer needed nor part of the commit.
> ---
>  .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
>  .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
>  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
>  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
>  .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
>  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
>  .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
>  7 files changed, 190 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
>
...
>
> +&serdes_1 {
> +       status = "okay";
> +};
> +

Can you try keep alphabet order? may old file is not ordersed, but try
best, at least should before &uart0

>  &uart1 {
>         status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 1d73abffa6b7..a687eb3e3190 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi

Please split chips dtsi and boards dts to two patch.

> @@ -621,17 +621,163 @@ soc: soc {
>                 ranges;
>                 dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
>
> +               /* Note on the interpretation of SerDes lane numbering from
> +                * LX2160ARM lane mappings for RCW[SRDS_PRTCL_S1]:
> +                * The letters (A-H) correspond to logical lane numbers in the
> +                * SerDes register map (lane A's registers start with LNAGCR0),
> +                * while the numbers (0-7) correspond to physical lanes as
> +                * routed to pins.  SerDes block #1 is flipped in the LX2160A
> +                * floorplan (logical lane A goes to physical lane 7's pins),
> +                * while SerDes blocks #2 and #3 are not.  The lanes below are
> +                * listed right to left when looking at that table.
> +                * Both the numbers and the letters are according to the logical
> +                * numbering scheme, and do not account for the flipping.
> +                */
...
> +                       compatible = "fsl,lx2160a-serdes3";
> +                       reg = <0x0 0x1ec0000 0x0 0x1e30>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";

status should be last property

> +                       #phy-cells = <1>;
> +
> +                       serdes_3_lane_a: phy@0 {
> +                               reg = <0>;
> +                               #phy-cells = <0>;
> +                       };
> +
...
> +
> +#include "fsl-lx2160a-rev2.dtsi"
> +
> +&serdes_1 {
> +       compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
> +
> +       /delete-node/ phy@0;
> +       /delete-node/ phy@1;
> +       /delete-node/ phy@2;
> +       /delete-node/ phy@3;

Now, do not perfer delete-node. if ver2 is not include phy@0, ...

create ver2 files, let ver2 include it. Now most people like A + B, not
A - B.

Frank

> +};
> +
> +&serdes_2 {
> +       compatible = "fsl,lx2162a-serdes2", "fsl,lynx-28g";
> +};
> +
> +&soc {
> +       /delete-node/ phy@1ec0000;
> +};
> --
> 2.25.1
>
>

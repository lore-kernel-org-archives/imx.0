Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A532C939
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769026778; cv=fail; b=Mdlek21ZGstk+EDHXVloUzL2Mvsed1MHW8YPSk31JNNOzTd7pH3p68UoIf3Ct5ccKsItaE/ejYlDihw7JQrRAIgT9b0bIJvO0Ux9FzkoRSpMW1XnUTS9oywlIIjGUEsHI+MjRHmtT+26ZnC2P3cFf7Fxwf7n29jHObNWm7ovzQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769026778; c=relaxed/simple;
	bh=hkUpqIqKQ9rapFGi/r/RGiZ9nWQD9/8HdDItWo+QA88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=egJsumSNnYP4QSCfCwDsWnEk4aoblaX5da/zsfRT7RDc3ze7/pYh2Y+f4ZDRC/IsIUkK98OYKFLLm1aNtMVu5KG6ech9dFnZdCYRt+H9npSivvaiunxeBkJ/VhbCi0AOAcqYUdrs4buxJijJ8ydR1VHIOvogdwqhylZ344xqu9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WFDgTDDh; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WFDgTDDh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfS8fz8fDjuWrS1d8MnUaZFvMWKWUmn/pZIcyuCJ0QGt7W29T6+CNrf6PKO/NwQhypimxPcq11FHamiFjot13w+dFFOK64E+IxWXX+nk+x0mxBBc2VO+wuI6MEekDOit54hgJypQgHm/DGinw7Ini34X4CqGRY0vd4mKJmlmoi6Lx3KIP++547MR9y0RLs8qhF+jSBfj6VQSqFW1NBjxoa23QPWnAznVm26NhK8eDTsefnf3+IOylIkK6Faq71o//UHPOSoPEiBfZ8GTbFZ6UIn5UfIAmE1U2EWNCLlM/jFiyv38x3ZgOTZVGcJWCibJs8KydxYVD+F2ftwFqcVjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+rDPbHQJhaKL8pDBrR5Ocm1yUOd/hbakBMnaRaRt+U=;
 b=DUBDRrI/LfDTRKDDkEGaEoBJjKfBgHzPezhYIg42W9tJMfE+ibSHjmMd1zzCjN5LvE0wcS+nRkwUDUMbC6b2HNtPM+iJXr0W8BvQ7Yr9/zz4943JIkxofufNTyP0zWWGk4VvAULWskZNIsjeJezNc3ZFdnn4NCzCM9K7IxEvkGM6WxfR+WHXLEO+riGq22Y+iaR9xxcdT0Pz/nCgGf2WBQT4FnQL3+U66i8rmNPSxatkpwv+YC2GcfKotD7DexfA93/eTGceWs46QTUenQ0uKfZ/w0KM+xlVxp+GKWOR6rd34mmkjtfV9Cvrm90HkAQYQrMzPic9fUj9RaMW+s3QfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+rDPbHQJhaKL8pDBrR5Ocm1yUOd/hbakBMnaRaRt+U=;
 b=WFDgTDDhGlSUWHdIKvWsxqMpAKtxYJ88CJTqU6hm4/NiGIgrthb3Hlx7VjOCs66Z5qpu0zsg+OIF6WUOW+aQ6Iz5wDJXY2Ls2/vKiTZJoqraCjlYWfw3sKuOzTQ45wbX8eJN5G0te88FNHI0W29ssBfARMDiT6x8vcIaynAn08t1n0tSI0s9rkAgL8G/FcH+c44Y4hLA1QpbBD/2Gzxf/ttTxYLdvs1QT+K/woC1EY6n+WqhVNThpQPhc3Zc9ivC0Oqc+Pul0oiutKeWruCIZsPIEMPIXC5wUfCHcO0ooyAwzN2wTDNQOsE8dSnvfcEWaoCq8q3UklG/baYq/+QvcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10281.eurprd04.prod.outlook.com (2603:10a6:102:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:19:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 20:19:30 +0000
Date: Wed, 21 Jan 2026 15:19:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Message-ID: <aXE0ysscZGJnYYxK@lizhi-Precision-Tower-5810>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
 <20260118-imx8mp-hb-iiot-v7-3-ef1176119a8e@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-3-ef1176119a8e@solid-run.com>
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10281:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3abf6a-bcc2-46c0-d872-08de592a6244
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?vCpeXZEDxaSZCR+UwZgledgmKXvjK5MkF0iAv5Ln81CHnwAOA5rGIo9uj/e4?=
 =?us-ascii?Q?fLqd/SLIZwSeWSqT683mPhds8TzPOlIeNeBQTjRVfemIF3FMU9IrwtmtoiR3?=
 =?us-ascii?Q?z+bnmc5YErX5SR/YDC0NUUDcBB/gIbVc3K8EhfCe0mfbNsnJbpp1DmAy7mm6?=
 =?us-ascii?Q?U9A+Y8rFu8JQK8f7ZYy4V8H5vK/in9fzPVmIfHoc47OCdck/R3amOZugU8Vz?=
 =?us-ascii?Q?DfdeiyGZBkYDn44vuvQZB8aTaOqzofVvPkQXBsZ7C6WRowj1QHyD7Mybezlk?=
 =?us-ascii?Q?zQpESIAVMtciiNO9G3mc/E7W+6LbHjaG6HkeVgjXAndjmKUqik4qTAy4PcDg?=
 =?us-ascii?Q?bSX1wO3Vr7Bo2ABoiy+1D2ZvztINsKAOLMf1dijkQt2hyCHzIAE/XOaBJpzM?=
 =?us-ascii?Q?aGVC0bSN0saca/dknZez55f6ustNdr/TQeSjZgunthKriLDLvdCPo9Mnt22Z?=
 =?us-ascii?Q?SrpQM2DhW7NZTrKxosf5FMQv/HNBYGnrQ9FoGINrxRFTVtnbG0nuErV5pqDd?=
 =?us-ascii?Q?Ce6Xd4eFq3dFIISL+GA2MUl3LucKQtOXkEhIppJbTXwLt13wtIct8j6fPej1?=
 =?us-ascii?Q?6KE2e/QZ6docIYGxOq98SC9s2NF4l46l21+zJNWrGozhcnVkJAQ7PPQOFkHz?=
 =?us-ascii?Q?a6KR4iRPwalEEWrTWyijmUlO2EoetJxzS/FBgLouHmRBsii5a2wWa4aTYqYv?=
 =?us-ascii?Q?0CuphBzpEyWe3xrLaWnuWHO/J3qbr9D2J1hCN1/lvSfTpuTXGe9hIG/2QPHP?=
 =?us-ascii?Q?13hJXKk/YtWygrU3qMJ5FonO2CQZ8m7LAszNJho+4YhsOxzsha3cIt3fjLfI?=
 =?us-ascii?Q?7Q+IP8/6ALb7IOL6bYc4DgPQb14mbzKV3l8QcM9alm5Tp+Ce3b26k7Icn58R?=
 =?us-ascii?Q?lqWZlCJdD9/gvFw9X9kIvrYHyQ38hW4woyedDjnX0Rqgz4ShvoHNMJ2gSCad?=
 =?us-ascii?Q?j1/TclN/WiSZL3mnNboLSHdKPpa6dDRq0SdW23m37Idm4ZsiXtuOPJzQ5NmR?=
 =?us-ascii?Q?MD+bO4Xk91hGUhy5LZeUrFjoMQxf+TlqKzQfYD5WgESInZt/OxDNYVwh+keI?=
 =?us-ascii?Q?58gFBDG0uSBiD1bQXkOE717x2us9t7/RaUWZTzFgLac4hdxR/TmPYXU8DDVr?=
 =?us-ascii?Q?QjNxrVLGGkYa3VFvRmGJit3og5G06LBbO+3mgmiEqMmkzSYgb97BQePlvtJl?=
 =?us-ascii?Q?jmBlPL3dbI8s4NcfTVhLDrK/nowCu3/y3rbgcii7s+qGT3jbhntymU79Ymkl?=
 =?us-ascii?Q?nlwgcd3008gqqFZFbIOEfGpx5kPNOKKs4m2n7TI3jHfK+bL1Jmc5/JgybMt3?=
 =?us-ascii?Q?DiqT4Dk+isrAYfZzO3zrJQK6/HVYCkjYuEE0DV0mXX4fbTbnhlWTRdg1h+SD?=
 =?us-ascii?Q?BocgMWEunH1afCaoUAP8aHUHAj/PckS/r8WA7cyy8+WkDNeMYQ+fITwKfr7E?=
 =?us-ascii?Q?MosE3D/CPX0zXCMteKDwcDHOqKUA2qQKj45h2tZ3zGVRM8g6XfnBeNRW6hDI?=
 =?us-ascii?Q?SrEYU7HiWCA7RXe/VpiXgyOL29Gue+VO0eignamPFY75/6bhrJxeg7i35XhO?=
 =?us-ascii?Q?N3v/kMOWylNjgHtOA6DH52Ie+MgP11VlhNvFeZRTQNUldlyepwfLTBEm7edY?=
 =?us-ascii?Q?UHaZQ1yGK5yzJd7w7Y8Ov88=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/h03N6TX2rwp2ma23Y7kkl9kdchL+/J3Ewsyze248bpYmu6PEzsfh4aegA5k?=
 =?us-ascii?Q?UER+tBx6fDn3tkx32XF2AVS1EMPNGXc4fyxwCfPl+cMiWTj4Cp7cbl7Qwz5+?=
 =?us-ascii?Q?HMhzKjDhv4Mpme8VK6Q3iiYRFeCO7z82ku6ljmlx5jJTPTgVXLfbmm7tS8NU?=
 =?us-ascii?Q?UUvJHoOvUUnmoXglcBGJ6NQ0Bp8Mg+QQM8y3NZa5TvBersFeTEB7YkFcoIqO?=
 =?us-ascii?Q?qpDJOT/cD0QVRw5cYGT1fzSxgPOZDNgnqP583WrCD0ErJptkVNdxieSC/cTm?=
 =?us-ascii?Q?FgD7I6yEJlt+SRZxRgutSBP6DOB6OsUukI8bUT688BtNdgoYSsMC1JiF6ZFc?=
 =?us-ascii?Q?iWgIcRbWZ+EW7CvIjV65ufhSl60hrveF+2oRVmHGJWiDb7KeIIg9kehxJY1V?=
 =?us-ascii?Q?k4nQ6oUsh/sydW+8mJg/AiEmR6TZtJB0GaMfhMpZsAHScPC/GIXXhbcvjwO8?=
 =?us-ascii?Q?EuakHEvfm4F98PdP36O3gElDK4FPqN5QV5wVfuQRNyR8Ye6Z1Ft+nrOKnr0o?=
 =?us-ascii?Q?+5pATHofiH82QMXFHCCss2x+zYfwA+02PNMC/cji+LD0v9Q3wb3OMlm+iN8y?=
 =?us-ascii?Q?E3cGSehMT0AJ3QnbhagXHG26V4mCdPZQY8JoTgcHRH8ZzLCrNe3VCLFJ0tli?=
 =?us-ascii?Q?G77VKfJYxwKDh8iqTcFgxnccgXUf9vULhnKaLNx6F9wOonmk5WCeTx71QuVR?=
 =?us-ascii?Q?8H1FRDIrgKPyP0yyMHPDSNBAEhGOPDPIaruViP4T5U0IO7Wt8QVDqQ0T2bDy?=
 =?us-ascii?Q?JdxhMQfz3Sy9o8krsudymRC1cgdg6AsMkAzwCr530ClhsCRQ0ry2NQcsSUk+?=
 =?us-ascii?Q?WQfJiCUFrBSN9AR25pqffQkJUV2qmg1rppgtHlpcblPRVMvw+14G1BN8Ct2Q?=
 =?us-ascii?Q?1Zt/AsYDcBnS3ag9ohgtjtG1pERpB/RpcOyLbaVI3vfYOw1OHdjJ2zStkKhd?=
 =?us-ascii?Q?j9aXY5Ao9faTMGULGmRH1pmcsIRwncTjEXz8rgO/ZWpAS1tden77noWqGw7V?=
 =?us-ascii?Q?oJFeRBIGUpjTFY4572kD+jHKrXN2GdHpZMnOaMHPJ+koq3L8Kg2Z8KkGjfr6?=
 =?us-ascii?Q?2G0X+kuvVZgliSO+NTlAjF6slnzoMSdi8bHFGgCULNdZDQlzhdWWaGLkAxIs?=
 =?us-ascii?Q?Iem1Nc0OAs2Bi5OQZG3vhF8rc/IxW1LIF9AeNo97ciioJQYymOkqFTYVCMN4?=
 =?us-ascii?Q?8z5i7aD0QvhLxZZsIwH7wK3/NTGdG+r2V05YdeamW4Zjx9sJGWtAb8wkqnSX?=
 =?us-ascii?Q?xbWU9RGXhwNepONmAudhp24A00w8+RCPiHFWohqFktUYcKxJYl2YlnKNi3SI?=
 =?us-ascii?Q?bcG3y85t6gwCROqjCKVxtUk4qPi2nM9ZHd9BdwhpALxoX9zJBsqQiCV09mCd?=
 =?us-ascii?Q?FYIWRnT+xnU3yTl7DDt5tveBJ2plVMXbT4kK090ZiUxuUvVwzUYuG2VrY3uK?=
 =?us-ascii?Q?MpjJcXbAIjlaoUnMg+Gsm3/5vlVMP5dJBhhL+flUTV2lWt6pmIruSdQ5i514?=
 =?us-ascii?Q?waU3K5gWyBIQNkY60V3lfEQlWIzMq39aWCYw+BaT4yT8oN+dM+r9HR8NVS1y?=
 =?us-ascii?Q?bN/gvXAfGmmTidlgQ7N582v+V9tNn9hrexM615JC83tRZSfMa9WSHNkd3VU5?=
 =?us-ascii?Q?aR+WY/JAeQg/ndE/qIDXpEQP8pVQkUeQBmQoPbyl60fe1WQ4/84OwjEm3Gih?=
 =?us-ascii?Q?Je7bdDVj6PJCB5y1rNLFQloILpIY1detZWzamJcKD7SgHHhpK5TtrzLYGLQP?=
 =?us-ascii?Q?u6EFjFzuJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3abf6a-bcc2-46c0-d872-08de592a6244
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:19:30.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vq+nhYO3UA1dOFm2tieGbiEZ14id1BX3rWekaQ8G2bqbJOzUaVlMR9g80MdmUEc5kt43bYQQpkqklFROBt9lAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10281

On Sun, Jan 18, 2026 at 02:51:40PM +0200, Josua Mayer wrote:
> imx8mp.dtsi includes a default port@1 node with an empty placeholder
> endpoint intended for linking to a dsi bridge or panel.

Add empty line between Paragraphs.

> HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
> another endpoint.

typo "brodge", bridge?

Frank
>
> This duplicate endpoint can cause dsi_attach to fail.
>
> Remove the duplicate node and link to the one defined in soc dtsi.
> Further remove the unnecessary attach-bridge property.
>
> Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
> Signed-off-by Josua Mayer <josua@solid-run.com>
> ---
>  .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
> index 46916ddc0533..0e5f4607c7c1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
> @@ -41,7 +41,7 @@ port@0 {
>  				reg = <0>;
>
>  				adv7535_from_dsim: endpoint {
> -					remote-endpoint = <&dsim_to_adv7535>;
> +					remote-endpoint = <&mipi_dsi_out>;
>  				};
>  			};
>
> @@ -71,11 +71,8 @@ &lcdif1 {
>  &mipi_dsi {
>  	samsung,esc-clock-frequency = <10000000>;
>  	status = "okay";
> +};
>
> -	port@1 {
> -		dsim_to_adv7535: endpoint {
> -			remote-endpoint = <&adv7535_from_dsim>;
> -			attach-bridge;
> -		};
> -	};
> +&mipi_dsi_out {
> +	remote-endpoint = <&adv7535_from_dsim>;
>  };
>
> --
> 2.43.0
>
>

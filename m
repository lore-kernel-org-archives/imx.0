Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19619F421
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628822; cv=fail; b=XVlVG6IIEIco4AFSGIO7gPHaipd+RX4f3Sjkm//i9Sh+kgSQhS5K5sfxTSlz51XGL4eRkO4/wyhnfRTICfjZoVJNmDcAUHA1r1Jz3XYikAQNXkvrFNyPzywt8P65dthMDCUblLh0W7GhcXiYiwtO1w0MXAvBjSF8ZF5ET9BMDJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628822; c=relaxed/simple;
	bh=qJ+CPFOVOF5ZGGC2mFDvYp1KvVo/edsDVbpS1SXSGF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZtFcTVDkVIe+Wr17rekPBWOHFE1lOTcXdZfRzrH4iWBMGAwWE5vHTPcdMPODwPqnbx8WBWcXn1jwgz1abZfnAMIKuUIPyugF6ofn7+ypccvnwWnR8GnAW89bUIwTkhwEB3E2FiHWUV0kQEGrgtHZhFFCFXhaAXjH/CoZC99Irc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fhlGiZ4E; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fhlGiZ4E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvjWni6NJos6Xle+b/QNBh7qQPngHA3e45cCBc1YZbdLU8eNmYIP02jgp5KDqhbWUH4Ue73lsfxp/7ixf3p1VJ2BtwUWj4s79zulJ0wdbJdCVrQsFi4HeZ6fbUFAQgnXCc9VpEHIhhjTStEWMM6bNoaMf5MPx3qOBuC3M2RoxKWAYSqktaPV0XiJRwOmoEGpYfmRvjDH13zMd1VtqjQQko7IbQZA2vGEc1mOfHL9RAWFXQpFVLF5jRUiP/9gOJHlfWQFq0YYGgsT47Cflzh7BOeOLxYEKBRawSl5conNxOJbYVL0VRc3nx5htZ+1ONPz9DW3nFIY1BwkfWRzX6VBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbqig+iPIrtlMtxj1Ww5p8xy6/58hStiX9iRhnsVMmc=;
 b=GJmubek5XnKe2dItAntrCXP+sjJFV0rRUaajZhTXfdMrsnT8+hBeZp65CVIoQqVleyGSgVcj3hVW8A0g2CVGut/7fbW2tlTC6uNmw74zGcB/J6Z1FuBkysVpo61J9AH/Y/kznj0nPK+DbVzw0ewcePa1rAubIJQ+J8CJetnU+xouaFLOFCS9U9B7chCCfpnytePgz11cXwGgEMaPvCCusCgJGfxnQcKNEKGYSWeyglHvzxnN60fsuREuoTYLbo5cvZ1zInBeEm9oct4KWtVCRJPLwVYvYfLzf89IsyY/u8qMGuyfz0Ddv2jI8qcinSAn0BRw/yKtaAw/Zj99wM+1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbqig+iPIrtlMtxj1Ww5p8xy6/58hStiX9iRhnsVMmc=;
 b=fhlGiZ4EF0ueKKAm4z9T7j58Lp7rP2wq9kHtpbOpxIAaeTmjspeB+pc5HGLDUIX4SPkWolKeU5vdHf/Uoq6cZpAFK+gyMwKw/ZxmO8jcR9/OncVjH4So49r+mS2Os7fVFoN+OIMZ0lwu8r0ycMzLcAQNTX9LtTKhMdrxXV6RSGK2/eResRKHeg5qZRJZkDHuyp6eD5lDcbW20FfFZq08K1joHZjrOdbJxToO/1cTT4/7DWSKpMKbhxNPPRnWT/HYvGV/CaQL/aXP8Nhz/AP8G8hsabQeTUaFd6nZI8xbwjFUov/6F7eodS6+Bi0LLUiSpQe4IMQM5NkXGBksTeXrBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB11066.eurprd04.prod.outlook.com (2603:10a6:150:224::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 17:20:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:20:17 +0000
Date: Thu, 19 Dec 2024 12:20:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: s32g: add common 'S32G-EVB' and
 'S32G-RDB' board support
Message-ID: <Z2RVyO05WvIQUmX4@lizhi-Precision-Tower-5810>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
 <20241219131029.1139720-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219131029.1139720-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: BYAPR01CA0033.prod.exchangelabs.com (2603:10b6:a02:80::46)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB11066:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da1be6a-30e2-45a6-a0f6-08dd2051686c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DWSrPgeESXTGnyVwUo97HmSvQp4CQYYNZ2HzOcr+QujX/jjtZ/5N2HHd2BWw?=
 =?us-ascii?Q?+nTBkQayrMNNDcMktz+yjyAi16mpiRGw4AP4qxTq4ahL/Yc41DyKcv/45FHA?=
 =?us-ascii?Q?nggTFjgPRHrPbiHn/kBIAHdUdNFbbW1/skwSpoTiCu63UbJ5OmksEH0iqCxA?=
 =?us-ascii?Q?+Duti4BkylPQVp3boC7YNL4L29WEaOtlT8GbA0mRuiXolREC4gKx4hZwRDZX?=
 =?us-ascii?Q?Ze1Xw9lVsQH8Kxolu77MtULoo0wHKajv0RRchvv0MQD06BatpYNQKYeaqir4?=
 =?us-ascii?Q?Y9HDlXLpdKeGQkPx/3O13d7YdaIMWivfRiFyMu5rhb7Ly57pGBJkRNmg13ty?=
 =?us-ascii?Q?jN3hoZrMhS0QBQdfLYM1qGDXbe4Y/DCxs1dYVmcAs6aSjge9qRwO2vK8ZRZ8?=
 =?us-ascii?Q?ocz2WuJplx4DeDJaBtkGe4as8fC1hrTdtEn+qbbN3OgPJgR5lZJwNYyG3WJh?=
 =?us-ascii?Q?2lbnlBbZElPWUPmvv3KlPzuSbVmQAHVKsCldspJbok/eZOTnGZVWTcSYjs4O?=
 =?us-ascii?Q?O6sVvzF4Vhp/KdVoC7TeT5vN0xsb9LFU3vtMEgLLeYX7FKvPeYmA+s1nUsbo?=
 =?us-ascii?Q?K4iCp4tHP1dMWdrDtbSwyevgm/WNCg6lVz7KFqOiBNTkWj/8qgOzrCVu88/W?=
 =?us-ascii?Q?tHkvK5W2yYxuAC84ABqS/IOB7LUetriJXC4PGFjov/pxYwQkSaQkzeAYyEk7?=
 =?us-ascii?Q?lprC4VDGuXDxGK8H4VjbF0Q9x1F43dfaQZVYCggbaxRcNmilDksc90ii0U11?=
 =?us-ascii?Q?nU6CfjRIKQEqZ7mJsQUQ7gLHCxCJWaJ8CntPbAh5KeKIQi+yha+B5jKuBg77?=
 =?us-ascii?Q?XzcZ/Ru3AL5my5SY05h2cWjvCcpMU7sNtUrGEV/1crg5cxhcrKVnbGJyqoNo?=
 =?us-ascii?Q?+0nANfpz8NrTjuNk4a9mQlV9RMgdwzhB1RFsnBKMMxzqY1v4r5ujgTq1vMmC?=
 =?us-ascii?Q?MV/mnZz19O5ljCa3LGmro+vtqfQgPwMZRhk6inCJJEb8mxheRInyOs6CkqeH?=
 =?us-ascii?Q?ussJb8KaRQDixJVha6AGoBs2y5oNOyooyRsJ0PVs7ETWo7KzIlI0xSkpAm8J?=
 =?us-ascii?Q?HS+afHciSz8HRQi5WHZcPHsW8MRysJ2Y32LsMnrHvItgZAfsRSDb8WVu73uf?=
 =?us-ascii?Q?6FoPVG/2682cYof2DgTK/tsC1H7575pOFfnEE2X/S4QQzCKSVCWjvZwM7qEr?=
 =?us-ascii?Q?KjzYBvoSy8wXY9XyVsojVo2+olIDDBeCkbmm7essrLAnynKqiqSzx5OnlXkK?=
 =?us-ascii?Q?YLpcowicZ5rx+y4dghy5KZ5U/Mon51CaJRe2cGxfvaNdKQhwxnQZZoszjjWL?=
 =?us-ascii?Q?TBXteFEvxAz2GPqahUqkUEIiwzdlTbV0eWAawaMotizQXPrTSCKSpGD3YZN7?=
 =?us-ascii?Q?TBYuuD8SheSayMxqXqE8ONFSvPvpP9hH8yOTkA1wrcfgqBhywqjQq8UD2vC2?=
 =?us-ascii?Q?emctmiYSLUVCQZ/98jzoHk3ll/s4KefR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hCwOBt9cZnCUgnoHQcUwoCRTVlRss5aTrapS0orLh0R6xSyyEJoIpzekABYi?=
 =?us-ascii?Q?YKqH51sbKNOe9nkOfGyEXfYp4yvxsnqlqmfM7qctxtDERWZhbzanbj+W3Qeo?=
 =?us-ascii?Q?pPmA2aqAxMKp0Au93vR7QfO/HWIR/yCMDnIHEWyLdUrlDO0Kz/u/pOrN6M3m?=
 =?us-ascii?Q?JCUb6+4ntnVLAJIYfDFP5dHnNh+oiMNpuO9VymdB6a4tUFg9c1thmuzpnS3s?=
 =?us-ascii?Q?qV/a5oeCOSDh3cf5zWQliT2yXNpkzzbahh+ezJjqKPA8YXe+OLkEknFDDImd?=
 =?us-ascii?Q?WsZu1x34fdVDGhw2Q2r1+G+i3O3szVn6GcQmocUD1p+GcPTv2968bdpj/d0b?=
 =?us-ascii?Q?cnhumCnj3tAenBm2qzsu0hzeVKsOTkzxlRpZPZYbUdo1Bs9H1dQfEd5RMG96?=
 =?us-ascii?Q?PinAO5XhC8ED+pABnvhDzI/Ru68/LxdF8ssPJOpLmov8EDoBhWyRtR+Wva/W?=
 =?us-ascii?Q?nVGKHdaK2g/ljfnsHp2xjdv79EwhsGPEK0ePugOOZmnJrfZRJuDblp0EbTSX?=
 =?us-ascii?Q?DeAwzzSjZjZMtBbXyExVzNrlera+YRR0HfeJCJnS5r3raXJKbnBYqdd4YP/v?=
 =?us-ascii?Q?vO+TX8mrqJjazxSzsKc/31D4JGdlQAi+67JMCQZpKna+FLtxZRKjhxf3Hnu1?=
 =?us-ascii?Q?eJQ66RU2IJydIvuFpGCzTxbCV9pYkR4HO7Ts08dJZeXId8SUpqyb23DjUHZt?=
 =?us-ascii?Q?BsJPXoGRv0gITogSh2aW5jIN9U3GWoellXvorL55UWRw2x/ePU6VqH4cVL63?=
 =?us-ascii?Q?grIvZNDyT4GjuqT3kNmGsCk1fAzDYzk9098UeFedcA+h/Q/40HQ8z8tT2n/A?=
 =?us-ascii?Q?GTOnB0O5qIfDyBzeoIexkdn1cBxGIbkCAecfuvlD3lAWJMPojevuQFVLYcld?=
 =?us-ascii?Q?1S47Hr4VDfMZKQpooRLRk5d2+MOZ9jlPHrJMvnsBQyuLi3t8PcC3aFd28F4S?=
 =?us-ascii?Q?4Pcy8ZAoxZHfTyI+JwO4IzPcpLPrNf0jeX2ueED250clHF/sAjUinAt6TMmf?=
 =?us-ascii?Q?zt+jLW+JDWQsxJvjj4wc7lhE4VL2FUdoqW6oXLPfz7gBWkF8DMGuErJcGIkF?=
 =?us-ascii?Q?V8MK3/LOjW/mGxfNiIg39T/VujYNU+kkKjEu0FZ0+mdg72vk+/uQByOhE7lj?=
 =?us-ascii?Q?FJvWBr1rZj6w97CCAh1QCHoP+0e9ckP6To5ngb8gA63NrXqR0Rl5FPphl6YE?=
 =?us-ascii?Q?68cnBAEOIyW8q0Kofai67tBs3whP2t9F2e5X1Vi2XkzQp0tTUbLJRhyRYkcy?=
 =?us-ascii?Q?+cz8NkJ5IZjKo42IhMnU2NfsKWOeKClmqnN/Iz1Tg3P4Gv7Z4or8sqfbBd1r?=
 =?us-ascii?Q?wKLwReHOi4LRiDT+kV7AEPCqZ7r1ZBnZcfiuosmFjFowKMxMTDBalU/NSsSW?=
 =?us-ascii?Q?AIYi4wChXlniY2rBPLm48anYN0SGwxRvjtGVNPr3FGAfoPr+JHPT+Wqu7XBo?=
 =?us-ascii?Q?eWk52qqvpbsTUtJOE4WQRtHCnQEFlBOjrrINDuJDSppp5xQviDmtbYQ+KeLk?=
 =?us-ascii?Q?Yz+aWebm3aHzAlfOoYI+W6leJWpmMeXinWlzkF7Mtz76NRx8ZrKSKTNzEC8N?=
 =?us-ascii?Q?uoiPQUlfF0zdLI/Vpa4C6ZkDqxGioGS9ASWgplt9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da1be6a-30e2-45a6-a0f6-08dd2051686c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:20:17.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyP7AViW3+UvJnCH9i5fkANyjY7+LR/IZ9rD+U0TELvfaUVUAC4DRLj8L6TjrtOCZWl8T28Mf1vP9pWadLJ2pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11066

On Thu, Dec 19, 2024 at 03:10:27PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
> (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
> are quite similar. The common part for the EVB revisions will be
> centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
> be placed in 's32gxxa-rdb.dtsi' file.
>
> This refactor will also serve for other modules in the future, such as
> FlexCAN, DSPI.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 126 +++++++++++++++
>  2 files changed, 276 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> new file mode 100644
> index 000000000000..a44eff28073a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright 2024 NXP
> + *
> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> + *          Larisa Grigore <larisa.grigore@nxp.com>
> + */
> +
[...]

> +
> +&i2c2 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-1 = <&i2c2_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;


I have said many times, these should be in common part.

Frank

> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c4_pins>;
> +	pinctrl-1 = <&i2c4_gpio_pins>;
> +	status = "okay";
> +};
> --
> 2.45.2
>

Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4079C2DCBFA
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738692; cv=fail; b=UReUTMD86yI+8F2uvdBXanwSklNMEpqFz6OlCDx4WBYcyM7l8qhU3hZOyn8l1DZeyzRt1rLI/uUui9A05QLSaLw2z5LrVWLy9otd0G2t4TIbyR6sOHnrBdrAEtpugXcemw1Jc0OtP3XCb3dz6pmoA3PHjxUNdnsulPYccc5cqhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738692; c=relaxed/simple;
	bh=0S2Vmoa4PNYSc46x+WWhQiBEkiTlGV74s9AfT8rWadc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f/6PUCBj4pdGYthpFKQ6yIAlzZzoessatmHEcckqg6eM1UKrugIqQxd4yHebkmeSpNGbLWt+jOAjvVjuhH8yObWTAkL1PNd1uAU4TwDvNW9dV8pZ0Gov6CUf7es6uhGImmoi4q31RsWPXHmcjdrN25mNqJ/ejmfv9VNhME2C3KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E6Rf1WMV; arc=fail smtp.client-ip=52.101.83.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E6Rf1WMV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmqQ1Cr3GhyCnV61OBKcJ0CnScBY3+Yq4GzuhMc3e0BBvqispzTU3EFsNqgqWLj1jQ4wLzwPxHczPnA4vb9tNXPwElad8GVMJURZId8NM2KU/W4ZL3206x0gIi0hfFJtfXNqmB7+xhS2BjCRGdYIOM8xBPTqD3MpU7inexlJ/dUylHcjr5Yn2X8bnDlhhjN5ysSVOP0QRku8bDCCMtjLigC+QLU/y5foJWsMlpZnVlNpGRXxDn7fbX5nmIn76nBG+PuqVYlnynCfWG8DHqAeIWh4q4Qa1S9WbVB6OSKv3pAsZTUxWyf3oFUiDiwOxyA8hHzdrV7Bmn0yE5nbejQeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt/7j8264IYGjUiKXXInFJps5ba7hZP3OVZVFYi+GFY=;
 b=ZxmPts7qAbxOpz+rM2680yWYwc7OwvVa6S2OhQL2Ngc1oo7KxTtqnte4bvxAdW9xsy5sZfEOSLCn8BYUuDx7Aii0lNpm/xxJRjx0XiBSfHWoHAQ5o4eTQ+NfkYlzkXPZtYYQlu0SRl+k3XnJVjZGpJTCP2HzJJTk0lJe6XcpWDH0IC+crqG4Mjx0szj0sdl/VNwVUGlndcDnD7kNQsnzutlc1kkKpp+DRPSrpvWWy4j+3j41l1AQr0bhtym+i+9FjfOKK1BiS/cnSWHPvrpKS9ZFuF1cprN4XhuAG4DI4OfHad4KGow8D1yVvOwvcDtb6t6cp4gU7arBNG8suETzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt/7j8264IYGjUiKXXInFJps5ba7hZP3OVZVFYi+GFY=;
 b=E6Rf1WMVGYJiIC+Pbiwz3vWnpkXDl1/4kFNS2wkw/vk7bZJcnwxMYz9DmKUnxoUdbSIMp3mQlIT/MLu7HMYPS+5A0GmxdvyWN/3setE+WVcONqaTOsvUOyQ+4/4E2pSVO2T8X8kcfwo8RDVbZ3/gCn8UO5fl/03hF0x3TGF8RvKulQxB2wzsmyPEk2TguJVQZoePyzO0B5FNgI9P2kAStjyKkbj1OOA7tldDEF37KOVjjA41JHqkzJLRAQEK/jI2+BPVFcV2/rSRpVLGQpqzQMJSHxGy+/5iePwS3j0Sd4a3ByK94t+V9nC2vFXYNGWgMA8X43KAQirV4nyOSV0w2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:51:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 15:51:26 +0000
Date: Tue, 10 Feb 2026 10:51:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aYtT9vOAYTYuTsC6@lizhi-Precision-Tower-5810>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
 <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
X-ClientProxiedBy: PH7PR17CA0038.namprd17.prod.outlook.com
 (2603:10b6:510:323::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 607e2d55-b61c-4f20-0507-08de68bc3f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZrWKa6f4KGtGEIenA+SKjWT8u/mORO4nZMWQhQ3cTNVhbgim+x8fD5cAY2q9?=
 =?us-ascii?Q?/HWprstfJGwzDpjtJ8J0xR0q1EiG5pi1iuRohp0ioeyoPWMNoull/z5odwo1?=
 =?us-ascii?Q?WQs4VdBintWlyH+/QfU7WiieomunTfytHSrDyZaQMTLWtuu869T0O9OW8u7j?=
 =?us-ascii?Q?zBWhvmhFQsm8UwZxmy7rTkzLuNvMGS4R1vwWnaGgRRaHJd4OK/SoDv3mVVTE?=
 =?us-ascii?Q?3s/CRqbusRauJOLZUJTsjAoeqYaNYlCXTxJvQ8D1X7NGbGaNKSj75XJupphX?=
 =?us-ascii?Q?RDXcuyTll3h4RTNSpziXxz1uwMfFvmtNZ9bXwvoW3iSi+OL+oQAnU7PLv0x9?=
 =?us-ascii?Q?ut7YAKsbsPYWq+2rN8HQoQ179ugrBZgLftHaXrtA7liFtENtK1Pf0WFdrJwi?=
 =?us-ascii?Q?o5zjD4aIiP8rTvjNMA3NKNmXtp7+aVfb2rk1VsdQHzvLo9bE8ggNV1U+T5Hi?=
 =?us-ascii?Q?m4xLX3CrayknK/qtQJA22l0Z7kCFd3nFbaC2pd3jh4lMiH7UlaLPK6Kc5x5J?=
 =?us-ascii?Q?MEV84izP2tZx9MZJHvOH1Rs7NUNDwNjCswtf0hw+1WaAvkQAsRDo2jO6Rh/E?=
 =?us-ascii?Q?pcAUc2AfTuNvAXsBw7Wk8Qzqmb0xlF/MldCz30L2hYNt/sX9MH06qYKTGuLv?=
 =?us-ascii?Q?YJWjuHUnk+NR63Q+VSx0fvn89Rw817xsG5fxZQQB38umUkn5lZ7S9E76P5Wl?=
 =?us-ascii?Q?LTgvaOgJGY4zLxwaVAYP/7caVoWP872EYy3ZkW7+2qN/150403y34dIR0dAX?=
 =?us-ascii?Q?DOakaNH2VwboYez9RhQ8+mfnd4hdvMvh3raapYqTGD+B6PJZtxol5BDZZXCr?=
 =?us-ascii?Q?xOMVOAP3tLQSfyBmBXC46hOcIqCNM2UWpo3oF0R567kqgXRtiYLwT1Kc/3rK?=
 =?us-ascii?Q?J+jKXBuCNP2BvccJDdqhC2SI3NdPcJeAhame1XHOXdGN+w/xQVzaEk382HdV?=
 =?us-ascii?Q?sa9HG4Ve22WY6ab79hqA2+fcpsVpjZBILM0ZQaWEJ7LyatztdZPNSmSGGmAE?=
 =?us-ascii?Q?5SE/4DUUW1duHMRyYdzTV27Kn0sOQZjQfv6xbaUNbOgOAo2pZdQWY4aATiT6?=
 =?us-ascii?Q?w5s7hHD6ySM6fdF5GVQeujj8CezTgrDSkFJ0WuM6E1ulSjSkWBiHY89yzSOt?=
 =?us-ascii?Q?8jJwvSCAm4h7vXdEab+GxmBnYSX2SL8/+L/kvBahwxnzEAu4rMDnvyOXMybk?=
 =?us-ascii?Q?a4uUL5Z+7t7FJc9X+eC6FvLDJNYAaH4/1YO9+/XnpGwLOL/Gtms+OumRUiEx?=
 =?us-ascii?Q?jc4ffNqhVwbuFNG9CxdcukeXe8EFRxAsXzfzceA5b58Ly6igJ/YGsSLToxTN?=
 =?us-ascii?Q?4JMm/sbhcOUUOFlGhOezvpykahx6iy0Fqqd/vVZob7PCb06843nOgcSIjnw5?=
 =?us-ascii?Q?l7T7zUISKqEgYuaWWK1vnkVr6JFWIupp1AYrm0R2Oh3DysXeNxNlrArQDNJR?=
 =?us-ascii?Q?eyUAlckCHAsLRhYB6vtf3bvGNfoidNftIB9+zfqHe9daZINgNh2A3GGLjtyr?=
 =?us-ascii?Q?JtzwdCkd6bgMt1q3HA6Ey+hJMAXBdufgR9cxvUaBgwlQv4jjUzM+c4EOKoV7?=
 =?us-ascii?Q?ySlm8WLA7PdSVqJ+xds+kSWj27M/g7zuq3RUwAW5dzJUDMp88NWS//LXptrN?=
 =?us-ascii?Q?fQ1YdmmIpmxdFW700g29gFo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YaXg6+GwQI8Cyeqn7MgbMNoH5kaW0ijtfybKJ1A27rwHH3hu5gHTUbzJJA01?=
 =?us-ascii?Q?PR/gqS8K18ZXydLAihIaSNakJlcv9VBOYT6V9dkLUe9ia/sb1/fUSPpB+O8t?=
 =?us-ascii?Q?X2wIEZKvH/K1Hce9bmaXph9W0x4TXZQv4MOYviSWq7UsFPOj9z7LMzkRWEX2?=
 =?us-ascii?Q?D4lmgG2U7bHRzblG8T8/mb/U+UQF8f8FNAERCc1qYi8vcVZvEatU5pjRw6nv?=
 =?us-ascii?Q?uzsyLlQ9bvbIejxhrUvrjot1VBPtS0Lu6ZawnJJz4tb71wvDyW/Nhb2lip33?=
 =?us-ascii?Q?z/nk9YsLeFhTLiBSQgFNUPmuJ9J6r4tOxXdzD+63B1XDh+WCFc8MaiYHV3sc?=
 =?us-ascii?Q?fwvPNhrDrzpExr7c5svJGtu/2AcmRAPWQ1A/Vbb30on5Ywm14w6nWy8uRRrB?=
 =?us-ascii?Q?bFCwV3RlzkpYqyQgGPpjSRwAGpko4xS3rvpbBZw+QRPUqanTnWe1MkYqzRiX?=
 =?us-ascii?Q?Qo3MudPaXeCnTX9wjKeDdXTLAiJjDhSlmuYUmLyRmB2wbM3GbZ+jf3c95f/D?=
 =?us-ascii?Q?s1aNozg077nOLDKkx8RCNH/BTXl4NA5xsVWfwxCsgLOuM64rLYcVEaX0suGS?=
 =?us-ascii?Q?Ewmiq1w7PtH8ev+bFtgFxtL8tUB5B3XoGeVoHyi6DxIcCUmm6e9aHwAKaa+v?=
 =?us-ascii?Q?IlhrU1m8PHSx3M/l+tQVxo5dWO1nl7YKeSrEBMyuyZVUEdHnI3LCoSLyf+9t?=
 =?us-ascii?Q?7Gs9yVXfYwO3rac8J3uzs2+jL3mA9OY0E0TbjROwlfBzNbHlT0Sjya2taqlO?=
 =?us-ascii?Q?1EdRdcniGVz3HA/Kver/UQ3Qq+VEnkSNxhPcJewrreNKbZ/fdN8bK3UD9gQd?=
 =?us-ascii?Q?cVY6ZzFUyxGcjKnuMKVzeVsPAoaIVrbqZERH/+HSgiYa/e0mZNPQ+dBRImJw?=
 =?us-ascii?Q?AXRR42HVWZ+dvtb+yxigdK00SILawjcPZDsrMCrOir121Q2PR1S/mYyk0e4o?=
 =?us-ascii?Q?L5NZddaOwQWlZTmhLb69fN7G2+tof2oZnmwwcDJ1KnD54Cj1juApLZv4nv/h?=
 =?us-ascii?Q?EQMqs5lfI42We9lvj+SyATe+2oLVM+8y9hIct7OMqg983x3NsceFeFctudIh?=
 =?us-ascii?Q?pdyObxqPZerRHvDmURtKaAecfkYThCl+rLdOzYdvsIcoF41kg+wEvkPS0TSp?=
 =?us-ascii?Q?hpwRjXUwHASq4Ws3szJ7wLiOy3pIxYZkdRfirgw3F2HB6I5CLdy1f1vs9sHJ?=
 =?us-ascii?Q?7veaJiNwviipthTxxLfFZhqb6GDCBaMuDSCY8pPxwjbGulMQbU75ggYcHcuQ?=
 =?us-ascii?Q?EO68k7wviBkCgcGzGaMwKIj8mlV/W4fDakGTAuqBxqFvLAqCFoRf9ywpmQlt?=
 =?us-ascii?Q?g0tjJf+445rFhI0SdcNohJZPSSLAHYjtbp/31s5tMnO80EORlcgnrkQh14m0?=
 =?us-ascii?Q?3vSQOOuanDmCSMNoGLVVkf2HtWzh0lPt2YxxpIGYzgIQPnaOB6ZtPumYzb25?=
 =?us-ascii?Q?j05Gq4AXeHOvtbgjrGYClcFayjHedDwXdhFcTvz2V468ET6CfvMAa2dIwtqU?=
 =?us-ascii?Q?/v1aOUPvrfgtwuWcVlhj5r0hUtJMzYnvEvreo5AROfY8E92oS514B8XglC90?=
 =?us-ascii?Q?9i6HSIZ4ctYt429Oxj9edLOByxJF9kTdI0EP3lYJdZvYrRuvJwHyfGyxzt0y?=
 =?us-ascii?Q?vMeJcAZfKkaWMBiR48+wqrPTPCydE29dp2El5S7Gfx2hemR9m7mRRNtJhFJG?=
 =?us-ascii?Q?vBIhFJlcLEUTgUvIhkE0ZuxZVITckLHjDVB5rkJp58LZb3ae+DuK/upzygzw?=
 =?us-ascii?Q?2FmObklufg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607e2d55-b61c-4f20-0507-08de68bc3f5f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:51:26.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0gg0IGvYntdHPTBxGtK2Fo5oDRfYF2rcOy5c14vI18Sv6WRWKLIzN4+kOXRuf8kfsPrKn4lJqW9+VxLjXkIzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On Tue, Feb 10, 2026 at 07:47:55PM +0900, Yanan Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

Look like it is very similar with imx91-11x11-frdm boards.

Can you create common dtsi for both boards

imx91-11x11-fdrm-common.dtsi

then imx91-11x11-fdrm-s.dts and imx91-11x11-frdm.dts included
imx91-11x11-fdrm-common.dtsi.

You can refer below method
https://lore.kernel.org/imx/20260204083551.2867263-1-sherry.sun@nxp.com/

Frank

>
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
>
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> (FRDM-IMX91 board page)
>
> Co-developed-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
>
> ---
> Changes in v5:
> - Replace space with tab in IOMUX
> - Rebase to latest linux-next tree
>
> ---
> Changes in v4:
> - Remove the board-specific "fsl,imx6sx-sdb-mqs" compatible from the sound-mqs node
> - Remove redundant address and size cells from lpi2c2 node
>
> ---
> Changes in v3:
> - add bootph- property for nodes should be kept in bootloader phase
>
> Changes in v2:
> - Correct author name: removed extra period in "Yanan.Yang"
> - Removed aliases pointing to disabled nodes from DTS
> - Add "rtc0 = &pcf2131;" in aliases to make external RTC the primary device
> - Fix DT node name: change
>   "usdhc1_pwrseq: usdhc1_pwrseq" to "usdhc1_pwrseq: usdhc1-pwrseq"
> - Renamed LED node from 'status' to 'led-0' to comply with gpio-leds binding
> - Replace regulator-based transceiver (reg_can_stby) with CAN PHY (nxp,tja1051)
> - Replaced 'xceiver-supply' property with 'phys' in flexcan1 node
> - Adjusted alignment in fsl,pins property: used spaces between pin names and values for proper DTS style.
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 769 +++++++++++++++++++++
>  2 files changed, 770 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..77cd061bf416 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -406,6 +406,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> new file mode 100644
> index 000000000000..62dc1dedfb0e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> @@ -0,0 +1,769 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx91.dtsi"
> +
> +/ {
> +	compatible = "fsl,imx91-11x11-frdm-s", "fsl,imx91";
> +	model = "NXP FRDM-IMX91S board";
> +
> +	aliases {
> +		ethernet0 = &eqos;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		rtc0 = &pcf2131;
> +		rtc1 = &bbnsm_rtc;
> +		serial0 = &lpuart1;
> +		serial4 = &lpuart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	flexcan1_phy: can-phy {
> +		compatible = "nxp,tja1051";
> +		#phy-cells = <0>;
> +		max-bitrate = <5000000>;
> +		silent-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&pinctrl_gpio_key>;
> +		pinctrl-names = "default";
> +
> +		button {
> +			interrupt-parent = <&gpio3>;
> +			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +			gpios = <&gpio3 26 GPIO_PULL_UP>;
> +			label = "User Button";
> +			linux,code = <BTN_1>;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			default-state = "on";
> +			gpios = <&pcal6524 7 GPIO_ACTIVE_LOW>;
> +			label = "green:status";
> +		};
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "vref_1v8";
> +	};
> +
> +	reg_usdhc1_vmmc: regulator-usdhc1 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "WLAN_EN";
> +		startup-delay-us = <20000>;
> +		gpio = <&pcal6524 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		off-on-delay-us = <12000>;
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VSD_3V3";
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	reg_usb_vbus: regulator-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "USB_VBUS";
> +		gpio = <&pcal6524 15 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x20000000>;
> +			reusable;
> +			size = <0 0x2000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	soc@0 {
> +		bootph-all;
> +		bootph-pre-ram;
> +	};
> +
> +	sound-mqs {
> +		compatible = "fsl,imx-audio-mqs";
> +		model = "mqs-audio";
> +		audio-codec = <&mqs1>;
> +		audio-cpu = <&sai1>;
> +	};
> +
> +	usdhc1_pwrseq: usdhc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 18 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +&aips1 {
> +	bootph-pre-ram;
> +	bootph-all;
> +};
> +
> +&aips2 {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +};
> +
> +&aips3 {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +};
> +
> +&clk {
> +	bootph-all;
> +	bootph-pre-ram;
> +};
> +
> +&clk_ext1 {
> +	bootph-all;
> +	bootph-pre-ram;
> +};
> +
> +&eqos {
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy1: ethernet-phy@4 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	phys = <&flexcan1_phy>;
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	pinctrl-1 = <&pinctrl_flexcan1_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +};
> +
> +&flexspi1 {
> +	pinctrl-0 = <&pinctrl_flexspi1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <104000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				reg = <0x000000 0x800000>;
> +				label = "bootloader";
> +			};
> +
> +			partition@1 {
> +				reg = <0x800000 0x800000>;
> +				label = "env";
> +			};
> +
> +			partition@2 {
> +				reg = <0x1000000 0x2800000>;
> +				label = "kernel";
> +			};
> +
> +			partition@3 {
> +				reg = <0x3800000 0x20000>;
> +				label = "dtb";
> +			};
> +
> +			partition@4 {
> +				reg = <0x3820000 0xc7e0000>;
> +				label = "rootfs";
> +				linux,rootfs;
> +			};
> +		};
> +	};
> +};
> +
> +&gpio1 {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +};
> +
> +&gpio2 {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +};
> +
> +&gpio3 {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +};
> +
> +&gpio4 {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +};
> +
> +&iomuxc {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__ENET1_MDC				0x57e
> +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x5fe
> +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
> +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
> +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqossleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
> +			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
> +			MX91_PAD_ENET1_RD0__GPIO4_IO10				0x31e
> +			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> +			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> +			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> +			MX91_PAD_ENET1_RXC__GPIO4_IO9				0x31e
> +			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
> +			MX91_PAD_ENET1_TD0__GPIO4_IO5				0x31e
> +			MX91_PAD_ENET1_TD1__GPIO4_IO4				0x31e
> +			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
> +			MX91_PAD_ENET1_TD3__GPIO4_IO2				0x31e
> +			MX91_PAD_ENET1_TXC__GPIO4_IO7				0x31e
> +			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6			0x31e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__CAN1_TX				0x139e
> +			MX91_PAD_GPIO_IO29__CAN1_RX				0x139e
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10			0x31e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1_sleep: flexcan1sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__GPIO2_IO28				0x31e
> +			MX91_PAD_GPIO_IO29__GPIO2_IO29				0x31e
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10			0x31e
> +		>;
> +	};
> +
> +	pinctrl_flexspi1: flexspi1grp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__FLEXSPI1_A_SCLK			0x3fe
> +			MX91_PAD_SD3_CMD__FLEXSPI1_A_SS0_B			0x3fe
> +			MX91_PAD_SD3_DATA0__FLEXSPI1_A_DATA0			0x3fe
> +			MX91_PAD_SD3_DATA1__FLEXSPI1_A_DATA1			0x3fe
> +			MX91_PAD_SD3_DATA2__FLEXSPI1_A_DATA2			0x3fe
> +			MX91_PAD_SD3_DATA3__FLEXSPI1_A_DATA3			0x3fe
> +		>;
> +	};
> +
> +	pinctrl_gpio_key: gpiokeysgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO1__GPIO3_IO26				0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__LPI2C1_SCL				0x40000b9e
> +			MX91_PAD_I2C1_SDA__LPI2C1_SDA				0x40000b9e
> +		>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C2_SCL__LPI2C2_SCL				0x40000b9e
> +			MX91_PAD_I2C2_SDA__LPI2C2_SDA				0x40000b9e
> +		>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__MQS1_LEFT				0x31e
> +			MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT			0x31e
> +		>;
> +	};
> +
> +	pinctrl_pcal6524: pcal6524grp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO2__GPIO3_IO27				0x31e
> +			MX91_PAD_SD1_DATA5__GPIO3_IO15				0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_RESET_B__GPIO3_IO7				0x31e
> +		>;
> +		bootph-pre-ram;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX91_PAD_UART1_RXD__LPUART1_RX				0x31e
> +			MX91_PAD_UART1_TXD__LPUART1_TX				0x31e
> +		>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
> +			MX91_PAD_DAP_TDI__LPUART5_RX				0x31e
> +			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
> +			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x1582
> +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x1382
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x1382
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x1382
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x1382
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x1382
> +			MX91_PAD_SD1_DATA4__GPIO3_IO14				0x31e
> +			MX91_PAD_SD1_STROBE__GPIO3_IO18				0x31e
> +		>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x158e
> +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x138e
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> +			MX91_PAD_SD1_DATA4__GPIO3_IO14				0x31e
> +			MX91_PAD_SD1_STROBE__GPIO3_IO18				0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x15fe
> +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x13fe
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
> +			MX91_PAD_SD1_DATA4__GPIO3_IO14				0x31e
> +			MX91_PAD_SD1_STROBE__GPIO3_IO18				0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0				0x31e
> +		>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0				0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK				0x1582
> +			MX91_PAD_SD2_CMD__USDHC2_CMD				0x1382
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0			0x1382
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1			0x1382
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2			0x1382
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3			0x1382
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__GPIO3_IO1				0x51e
> +			MX91_PAD_SD2_CMD__GPIO3_IO2				0x51e
> +			MX91_PAD_SD2_DATA0__GPIO3_IO3				0x51e
> +			MX91_PAD_SD2_DATA1__GPIO3_IO4				0x51e
> +			MX91_PAD_SD2_DATA2__GPIO3_IO5				0x51e
> +			MX91_PAD_SD2_DATA3__GPIO3_IO6				0x51e
> +			MX91_PAD_SD2_VSELECT__GPIO3_IO19			0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			MX91_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK				0x15fe
> +			MX91_PAD_SD2_CMD__USDHC2_CMD				0x13fe
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY			0x31e
> +		>;
> +	};
> +};
> +
> +&lpi2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c1>;
> +	pinctrl-names = "default";
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +	status = "okay";
> +
> +	pcf2131: rtc@53 {
> +		compatible = "nxp,pcf2131";
> +		reg = <0x53>;
> +		interrupt-parent = <&pcal6524>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&lpi2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	pinctrl-names = "default";
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +	status = "okay";
> +
> +	pcal6524: gpio@22 {
> +		compatible = "nxp,pcal6524";
> +		reg = <0x22>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		pinctrl-0 = <&pinctrl_pcal6524>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	pmic@32 {
> +		compatible = "nxp,pf9453";
> +		reg = <0x32>;
> +		interrupt-parent = <&pcal6524>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +
> +		regulators {
> +			bootph-pre-ram;
> +			bootph-some-ram;
> +
> +			buck1: BUCK1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3775000>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK1";
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK2";
> +				regulator-ramp-delay = <12500>;
> +			};
> +
> +			buck3: BUCK3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3775000>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK3";
> +			};
> +
> +			buck4: BUCK4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3775000>;
> +				regulator-min-microvolt = <600000>;
> +				regulator-name = "BUCK4";
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <800000>;
> +				regulator-name = "LDO1";
> +			};
> +
> +			ldo2: LDO2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1950000>;
> +				regulator-min-microvolt = <500000>;
> +				regulator-name = "LDO2";
> +			};
> +
> +			ldo_snvs: LDO-SNVS {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-min-microvolt = <1200000>;
> +				regulator-name = "LDO-SNVS";
> +			};
> +		};
> +	};
> +
> +	ptn5110: tcpc@52 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x52>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec1_con: connector {
> +			compatible = "usb-c-connector";
> +			data-role = "dual";
> +			label = "USB-C";
> +			op-sink-microwatt = <15000000>;
> +			power-role = "dual";
> +			self-powered;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec1_dr_sw: endpoint {
> +						remote-endpoint = <&usb1_drd_sw>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&lpuart1 {
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +	status = "okay";
> +};
> +
> +&lpuart5 {
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&mqs1 {
> +	clocks = <&clk IMX93_CLK_MQS1_GATE>;
> +	clock-names = "mclk";
> +	pinctrl-0 = <&pinctrl_mqs1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&osc_32k {
> +	bootph-all;
> +	bootph-pre-ram;
> +};
> +
> +&osc_24m {
> +	bootph-all;
> +	bootph-pre-ram;
> +};
> +
> +&sai1 {
> +	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <24576000>;
> +	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	adp-disable;
> +	disable-over-current;
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +
> +	port {
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb_vbus>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	bus-width = <8>;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&usdhc1_pwrseq>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	vmmc-supply = <&reg_usdhc1_vmmc>;
> +	wakeup-source;
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	pinctrl-names = "default";
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
>
> --
> 2.43.0
>

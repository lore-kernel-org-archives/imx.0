Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4792BD586
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181586; cv=fail; b=m+vCL2LaBIxPAc0ovvEI8wVjAv2+w1D41lZldpx7rzzrvKQ5UPdJVDiinMOCdBhT7W1ua066UasGfwUDAuot2oEy1ht9rzKUvYaH9+qxyw0rds++hapDAgpdKoVTeOKdQ2t5zb/HN2NO0kdqAd35oGCF3ZJ5WGzzm0rcElriGpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181586; c=relaxed/simple;
	bh=1QEkNnK/fxzi9XaNJZXZFDt8ZViZsaDRm6gn3tVmJFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KHehcQ7nhDSgFcJJcdxtOD2WgK/DkgJo5Hi7KzGYP4sZwtqjpEmeSqjQkGyFSXlVB2PmN6Dhc3RF0Ks8swE6aR3IZxmMOj7ZkDS4zxVbYgiUriB5d73dA3J4KxjNapbY3sCu3uzIhc+kTTUWPcbC8iCi+pwJiR5N6bb0RaPBdN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NGdpDjxr reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NGdpDjxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUAx3a/L4SVS8w89C8dfjfknSUlKT4mTmCd9+JSgJpSkCyS4JVDhEdEJuT0Dp+mzuJI688i+0FFuSWoDZFh7ikbjwrJ7qboGxnev9rr9P+kc0ZJH5Zisn/Dt602NSFa10IxsKU6KCEkb6U9qhyWXaq1tBYS5yCx9fujGQ6XhU6+66epmTBHsvqdSD+MeKAtoAlmPS826j/UVAbntts2buj3H1EFyen9OnWdxKKjB0FlRrCHOoSrPyaGJyiuwtcIiTCbUpN2bLtRETFOmgAiBcR/PCpKM5M9KPCi3AVtSVgWcsFfQYFwihHWSVjFT99CumHxLTPj/6ydIwfCyFUqLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIcWriwUEVQY+QilFdVZ1VeDRl4uc4kSCxCKdM7G0I8=;
 b=McxVEI6wOy3NJLCc5xPf1e4R42U0+O2S4n94WfkgdXwk+TnRBrKoyWCK90ll0itcyekU+BxTU9uwj2Qf1ibxR5vmMAQjVplnyw/j1HEDPpQ+RqohyUKvC6dC0xkFlAU7EWkvKOFb0U0ik9FdCg84qd51QLENm+Pue1v+oxAnq+5705F6bYJJeAQX1lTzykbGNQevSw6FbOePCwtJ5SVzmZrf4/x0dsGYZjTjsG+LkKUauN/yEDjojP6nXAPYHEsyVS+ukOqKgbcIorh4XCBPstITp3toYliabJU+OUuAYvzj0ufyljCqrGaDbEUCufSWLHxHvtUd3xVoaJ9wCU5p8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIcWriwUEVQY+QilFdVZ1VeDRl4uc4kSCxCKdM7G0I8=;
 b=NGdpDjxrCM1Lj8sQB4KYbYtXgWkdQTOTPSP65YPGbwjpUkB+kAdyHbi/g5/XSqMgrSmr++eL/1lC2g/mbFUB2Y4tgfaI8iU4enpjFsbUN80O/J4qIj997uV4H0zKHAFdiBYGnQqGS6l2iKABo8soSD/ZUw1/HyegFw6GkEWEdBTMoMdjPX3/zPY37qzzTwwNjGvhP8MZ3K2ZijYP+fOh0QVerPgjqwM7j2/oVZ6UPFJzbR3KpdACnfVy+0il/ybDlZiLP1ddf5dFJbmVpfvwiaEP/AzVVXomgp+mLAt38PTiR9VhrTBpzbtTyny87J6PeKifgE/HhO11za+fmQ5R5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:19:31 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 15:19:30 +0000
Date: Fri, 23 Jan 2026 10:19:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
Message-ID: <aXORedjdeUNoA1Al@lizhi-Precision-Tower-5810>
References: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
 <20260123-mini_iv-v5-3-29bef040f236@gocontroll.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123-mini_iv-v5-3-29bef040f236@gocontroll.com>
X-ClientProxiedBy: PH7P220CA0173.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::6) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e85c5f-0237-4cbb-ae91-08de5a92cdde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?G/TEXEaLpU4BR2YOi7LOd1jXlxLcN+LmWL0dpLhZwXNhw9FO1YoZJOfXzH?=
 =?iso-8859-1?Q?hsaES2YfVtEA+pwTepcK0pFvbkajDdg9AxKrlY0G8pPwzCV37XdfthbfzF?=
 =?iso-8859-1?Q?pQgtkTd0s5d3HRlKqqP6gKq2nMvO6pjCGa9VyMifHDXVJsS2o1GaDrasan?=
 =?iso-8859-1?Q?Xxfs+w9cuRIc0DcUBHCPcWx9Oq1gj+fHQujFjk1RNOl4MemTYvAKhYnt9p?=
 =?iso-8859-1?Q?fg8Dz50FDHrHykfZUMkJ80Uhl27/KoRUG2Xf9TNwgFhw1630l7x5mcbCRe?=
 =?iso-8859-1?Q?/3nkAxTzQAak/sDv9AxIT27xmeFaE1EYR4gxnGzGb3bvJW0D2GOhrT3HxW?=
 =?iso-8859-1?Q?eGeooJAtIW6gFPUjRrrMCbHdniqrI+seSV2lVYj9BY2mrilJ7UHhUltXs2?=
 =?iso-8859-1?Q?g4PkBmGX34+RFyJJI1P8usb+dKY9xTsz6tWBugDy60dCAzyNCQW7aiUOao?=
 =?iso-8859-1?Q?H12Qghs32bNqsffn7y5MZbMVlT5lGxRj5o2aXDl6VKOa3B1eBEQjbPz9tX?=
 =?iso-8859-1?Q?8I7WGfQVaFVcWvHJL4tq1XLoPHex0qMeAMbUGvqchP6hETnPiUNctLsE5p?=
 =?iso-8859-1?Q?eKmZkqFMmWNS8WAKTAv2tXFhkk5DTTclTY0x5xwiqTE8W8iHJC+Bjf/PCm?=
 =?iso-8859-1?Q?zAifdCaJ+TI6nS4pQMOQx/OsuovDEEfcYmf/MaG3RnuAGOWPlb4/ER3S7Z?=
 =?iso-8859-1?Q?4Dx0BqEmXSA1haNpgOqe+zc4jBtlEeAxvrVz1QLyiOmSkkKo64vlnJnG37?=
 =?iso-8859-1?Q?nuoWLHH6lV21z2tmQM7PZAxxXVME97eXlFWvc1/sO6Pxah3T9wOi0EMCCL?=
 =?iso-8859-1?Q?0nsKnT/YCevD9J795e0DCbkooPEHTMmx4x3mePVcpmCzRzTziFkp3H5adr?=
 =?iso-8859-1?Q?FnSZNQPH34esB46lLgDzsutuGIElLCDP3oqltyvPzRi5Y2TeqQDmgn6f+D?=
 =?iso-8859-1?Q?NCuhpDUhYNKVW6cN7AOUhNeMAVyVHkU8fRdOTTPZANRyi50ydBvhg01LzN?=
 =?iso-8859-1?Q?2Yfw9uvp3wUf5JbHd8KlTKXDQ/C9Q0LozMBH+G02gw4kshY2MJwDC9I+4A?=
 =?iso-8859-1?Q?fbS2b+hDK7sOzLTabnaLyzaG9DmC+9HrJq1Dp+3dj+DhGJm010LnPQPPvP?=
 =?iso-8859-1?Q?nKGnM1ychAW5/yBU1Dp380ywMudxz4ch72TkIHB+cjGxfvGmbtYNPZsjki?=
 =?iso-8859-1?Q?NhZzKaE1Ulr0uOkUHamWToktwKwRzm8NDMpfNCaUdZcVBM2L0soI9RFrWk?=
 =?iso-8859-1?Q?RRLXYqFDziSfF7UNY5/aAKPzWM01gEtrMOXB1KQo6DtkE8nnNRgOKLi2kA?=
 =?iso-8859-1?Q?mfjmfkJ42AWGPKQspAilpzUF2ycrCjalMR0qk/asMfTINcyhoh2ipSk0yN?=
 =?iso-8859-1?Q?g+oVEQVlwjtcBLpxwPU5XG2IIFkdMZ9K2Ns0589b8IQ9Cb7i37+HCzV6i4?=
 =?iso-8859-1?Q?rsItUZKdKS351Ha4wvO++e66tI48t1z66e73UTFfpmOxUfngboBCmzVYg9?=
 =?iso-8859-1?Q?X5WY+dHPhbl3E+M36zv9NgMPWfYcO49ZmCIv6kH7MiloU8OrMkn2qMdolm?=
 =?iso-8859-1?Q?VE2wmexssy5mPe/l11+zTeUeVxJDobey4KgJzhRgdsxSBZ6yWKUBrVHJhz?=
 =?iso-8859-1?Q?+76WAieuJ3cX6nKRNbKuCTwwi8HYrpSWQq5ZPq9gxxR4VNL3Zfeg48bQQs?=
 =?iso-8859-1?Q?qnGOVqgaz+ygUycaAKo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?xwkMpx5nEpO5G3020EE4TcnmQNWMm4BnJeaaFg6RfL+RB/8wFeYVfgIaM7?=
 =?iso-8859-1?Q?Cjt73JTw96AmYs+R2dQcWURhBY0dC9qUP/TdmNKPpaVaoY3C7YlZQoqv/Q?=
 =?iso-8859-1?Q?1xDANuZF0x8/69bHAxWczesCVpneq1SXP0OETZzxFNSKoF6cgyoQODD2qI?=
 =?iso-8859-1?Q?2A/zu1I0uEjR8eFUUPNbTAfNUsHOhKXIGCuc+RRcPrCcZIqskp/5oJHEpn?=
 =?iso-8859-1?Q?GoTNF4l5xQrDF7rZYs/gU+8sRCP6Ml04WO43Za9azWI+9lR1u823vzsqiC?=
 =?iso-8859-1?Q?w/BZlJKp593Zd8DB3fRnV9NysPmozdrtvhaoupUqFIFEki4QJ0dwyZ/5b8?=
 =?iso-8859-1?Q?etTI+nKJTypDUc3ijKi0fibIHfTi7ksx99qoArXQzrWCMbvqy9uqjv7EI8?=
 =?iso-8859-1?Q?rXnAlWUTPRBwInvTN6Z/+SQD2QNKc6MrhiYpPkp29qLaK6ParH973mmFvQ?=
 =?iso-8859-1?Q?Cysuqjpvj7UeopaKF+IgOKHutsd7+aNUXq3INy7LQuYWo8LYHwrTheMjiB?=
 =?iso-8859-1?Q?KSHrmhVhto83xF81F/6kCH6g7LZTN1n+94VP7e3faT7iqSRRiEs9lFrAZg?=
 =?iso-8859-1?Q?TSyPechq5Lna/+5jTjCLQJSuGkfk2J99ZZIMHrV6pT40jGjZ/S0OgudvWB?=
 =?iso-8859-1?Q?8lVX/0rub532ZLRjhTDxBVEbsY4EefETLGd/Y3FFu6eopIt2q08eh9Z8GC?=
 =?iso-8859-1?Q?QciwkI3LAbvObLVLJkz4tCXmyjM1orQ8+iYM8nZrSZNL5bcXhIYCCgpfFg?=
 =?iso-8859-1?Q?QheyuX3ac1lbfQvzCtHJ7Zf+QhQio8DyI4ic7Dkv/stHMnHeUI1rMlPKHO?=
 =?iso-8859-1?Q?haiQchfQXxWN8CSyoOc2uOoKxvdnkaKImKGAaUNOInCulmhQpE17o8L43n?=
 =?iso-8859-1?Q?0nJ9O/41aEU0tAc6Yu4izEZSVr1VmIbV2q0LjVdXHPeCY3OJf3+eu3GwPj?=
 =?iso-8859-1?Q?pFezpnhYtEXxqSRr8120khkVpvLlpnCOAgD0gJFF7/Sgl4UbE4X3EQQaPt?=
 =?iso-8859-1?Q?47+K+pyrO4wi9xSpBqbPbnWUNmfVewVLjIN+juqYvMQJM8ftXMmlfAqYk8?=
 =?iso-8859-1?Q?KrtlyANyHGX13R02PxpgSjskqOujWnK1T3lQ679bLE4TWd86p7mPAbzzmP?=
 =?iso-8859-1?Q?TqCRItNveIq8UpOha3jsICL0Fpzt/9oYNM1PK/9H0wxz05ezoQjOAmZLvZ?=
 =?iso-8859-1?Q?4Tvu4x8JGS/NPJ7QoCRnprPYSKmhHPPLSzL4sUsSUo3c+vtnk/8TRbtrAX?=
 =?iso-8859-1?Q?vJLYA2tqS9X18LIymVeBOnVQuvlr3PAO5n38ZNmrtitvsiQAWXe6ZlWJN9?=
 =?iso-8859-1?Q?4+irHzBWnk7uSI03Y+lwlXQ+ucWySeYxeQDTFu7CpOPiK853AV402JM0mQ?=
 =?iso-8859-1?Q?X0hK6BSctLAxjc2Nma6vWKK91zkWIvuhygc05VSc86sBql7QrsU7GNPZIo?=
 =?iso-8859-1?Q?Vfm4GI4HHrkgu5+W7psxpczNFnNN+rO+xBEN9EfvR5cC+St2vZsVdnIW4Y?=
 =?iso-8859-1?Q?yJRt7OHR/VpNQs3GexktvGuu3eGXsFwgRNpVxuGrEktPDPMPkm9pQRP9x6?=
 =?iso-8859-1?Q?esLcGxOLe8FK1kEWCOoJZ99mNFx57ieC5y98844yVahf1esUGawitXjAsN?=
 =?iso-8859-1?Q?mP/pzbBTGHrZxl7Ib5XgPC4hNzs3gvMmps0p0+Z/+nj8VJfjUpEYaM+vdR?=
 =?iso-8859-1?Q?GooMQlVWr9uSLSO+Q/dO9ocVvLxAFYzWz2z4E+iOaucRxMAE7TnwyeZ3Wg?=
 =?iso-8859-1?Q?b3i+1UUxnHswafFxqn3d4CEJDXlQiQQb+KPsEcvr4WYiL9kjDTg2Q2snzB?=
 =?iso-8859-1?Q?oFFWKV3Pqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e85c5f-0237-4cbb-ae91-08de5a92cdde
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:19:30.0195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXg2Fk9IzwMubefXB4FtEugx0DrBlAOJlWFTpTCmyF2xlyl+emalkZNya6km4Uu6z7s+7S+mhQItzxksXH0PQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051

On Fri, Jan 23, 2026 at 09:30:30AM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Ka-Ro Electronics tx8m-1610 is a COM based on the imx8mm SOC. It has
> 1 GB of ram and 4 GB of eMMC storage on board.
>
> Add it to enable boards based on this module
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 +++++++++++++++++++++
>  1 file changed, 444 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
> new file mode 100644
> index 000000000000..44d863c8d930
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 Lothar Waﬂmann <LW@KARO-electronics.de>
> + * 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include "imx8mm.dtsi"
> +
> +/ {
> +	model = "Ka-Ro Electronics TX8M-1610";
> +	compatible = "karo,imx8mm-tx8m-1610", "fsl,imx8mm";
> +
> +	reg_3v3_etn: regulator-3v3-etn {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 23 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3v3-etn";
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&reg_vdd_arm>;
> +};
> +
> +&ddrc {
> +	operating-points-v2 = <&ddrc_opp_table>;
> +
> +	ddrc_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +		};
> +	};
> +};
> +
> +&fec1 {
> +	assigned-clocks = <&clk IMX8MM_CLK_ENET_AXI>,
> +			  <&clk IMX8MM_CLK_ENET_TIMER>,
> +			  <&clk IMX8MM_CLK_ENET_REF>,
> +			  <&clk IMX8MM_CLK_ENET_REF>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +				 <&clk IMX8MM_SYS_PLL2_100M>,
> +				 <&clk IMX8MM_SYS_PLL2_50M>,
> +				 <&clk IMX8MM_SYS_PLL2_50M>;
> +	assigned-clock-rates = <0>, <100000000>, <50000000>, <50000000>;
> +	clocks = <&clk IMX8MM_CLK_ENET1_ROOT>,
> +		 <&clk IMX8MM_CLK_ENET1_ROOT>,
> +		 <&clk IMX8MM_CLK_ENET_TIMER>,
> +		 <&clk IMX8MM_CLK_ENET_REF>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rmii";
> +	phy-reset-duration = <25>;
> +	phy-reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
> +	phy-reset-post-delay = <1>;
> +	phy-supply = <&reg_3v3_etn>;
> +	pinctrl-0 = <&pinctrl_fec1>, <&pinctrl_ethphy_rst>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			reg = <0>;
> +			clocks = <&clk IMX8MM_CLK_ENET_REF>;
> +			interrupt-parent = <&gpio1>;
> +			interrupts = <28 IRQ_TYPE_EDGE_FALLING>;
> +			pinctrl-0 = <&pinctrl_ethphy_int>;
> +			pinctrl-names = "default";
> +			smsc,disable-energy-detect;
> +		};
> +	};
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "SODIMM_152", "SODIMM_42", "SODIMM_153", "PMIC_IRQ_B",
> +			  "SODIMM_154", "SODIMM_155", "SODIMM_156", "SODIMM_157",
> +			  "SODIMM_158", "SODIMM_159", "SODIMM_161", "SODIMM_162",
> +			  "SODIMM_34", "SODIMM_36", "SODIMM_27", "SODIMM_28",
> +			  "", "", "", "",
> +			  "", "", "", "ENET_POWER",
> +			  "", "", "", "",
> +			  "ENET_nINT", "ENET_nRST", "", "";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "SODIMM_51", "SODIMM_57", "SODIMM_56", "SODIMM_52",
> +			  "SODIMM_53", "SODIMM_54", "SODIMM_55", "SODIMM_15",
> +			  "SODIMM_45", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "SODIMM_103", "SODIMM_104", "SODIMM_105", "SODIMM_106",
> +			  "SODIMM_107", "SODIMM_112", "SODIMM_108", "SODIMM_109",
> +			  "SODIMM_95", "SODIMM_110", "SODIMM_96", "SODIMM_97",
> +			  "SODIMM_98", "SODIMM_99", "SODIMM_113", "SODIMM_114",
> +			  "SODIMM_115", "SODIMM_101", "SODIMM_100", "SODIMM_77",
> +			  "SODIMM_72", "SODIMM_73", "SODIMM_74", "SODIMM_75",
> +			  "SODIMM_76", "SODIMM_43", "", "",
> +			  "", "", "", "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names = "SODIMM_178", "SODIMM_180", "SODIMM_184", "SODIMM_185",
> +			  "SODIMM_186", "SODIMM_187", "SODIMM_188", "SODIMM_189",
> +			  "SODIMM_190", "SODIMM_191", "SODIMM_179", "SODIMM_181",
> +			  "SODIMM_192", "SODIMM_193", "SODIMM_194", "SODIMM_195",
> +			  "SODIMM_196", "SODIMM_197", "SODIMM_198", "SODIMM_199",
> +			  "SODIMM_182", "SODIMM_79", "SODIMM_78", "SODIMM_84",
> +			  "SODIMM_87", "SODIMM_86", "SODIMM_85", "SODIMM_83",
> +			  "SODIMM_81", "SODIMM_80", "SODIMM_90", "SODIMM_93";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "SODIMM_92", "SODIMM_91", "SODIMM_89", "SODIMM_144",
> +			  "SODIMM_143", "SODIMM_146", "SODIMM_68", "SODIMM_67",
> +			  "SODIMM_70", "SODIMM_69", "SODIMM_48", "SODIMM_46",
> +			  "SODIMM_47", "SODIMM_44", "PMIC_SCL", "PMIC_SDA",
> +			  "SODIMM_41", "SODIMM_40", "SODIMM_148", "SODIMM_149",
> +			  "SODIMM_150", "SODIMM_151", "SODIMM_60", "SODIMM_59",
> +			  "SODIMM_64", "SODIMM_63", "SODIMM_62", "SODIMM_61",
> +			  "SODIMM_66", "SODIMM_65", "", "";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic: pmic@4b {
> +		compatible = "rohm,bd71847";
> +		reg = <0x4b>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		pinctrl-names = "default";
> +		rohm,reset-snvs-powered;
> +
> +		regulators {
> +			BUCK1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <780000>;
> +				regulator-name = "buck1";
> +				regulator-ramp-delay = <1250>;
> +			};
> +
> +			reg_vdd_arm: BUCK2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <950000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "buck2";
> +				regulator-ramp-delay = <1250>;
> +				rohm,dvs-run-voltage = <950000>;
> +				rohm,dvs-idle-voltage = <810000>;
> +			};
> +
> +			BUCK3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "buck3";
> +			};
> +
> +			reg_vdd_3v3: BUCK4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-name = "buck4";
> +			};
> +
> +			reg_vdd_1v8: BUCK5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1950000>;
> +				regulator-min-microvolt = <1700000>;
> +				regulator-name = "buck5";
> +			};
> +
> +			BUCK6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <(1350000 + 100000)>;
> +				regulator-min-microvolt = <(1350000 - 67000)>;
> +				regulator-name = "buck6";
> +				rohm,fb-pull-up-microvolt = <0>;
> +				rohm,feedback-pull-up-r1-ohms = <2200>;
> +				rohm,feedback-pull-up-r2-ohms = <499>;
> +			};
> +
> +			LDO1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1980000>;
> +				regulator-min-microvolt = <1620000>;
> +				regulator-name = "ldo1";
> +			};
> +
> +			LDO2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <760000>;
> +				regulator-name = "ldo2";
> +			};
> +
> +			LDO3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1890000>;
> +				regulator-min-microvolt = <1710000>;
> +				regulator-name = "ldo3";
> +			};
> +
> +			LDO4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-min-microvolt = <855000>;
> +				regulator-name = "ldo4";
> +			};
> +
> +			LDO5 {
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "ldo5";
> +			};
> +
> +			LDO6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1260000>;
> +				regulator-min-microvolt = <1140000>;
> +				regulator-name = "ldo6";
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_ethphy_int: etnphy-intgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ENET_RD2_GPIO1_IO28
> +				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_ethphy_rst: etnphy-rstgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ENET_RD3_GPIO1_IO29
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_fec1: fec1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC
> +				(MX8MM_DSE_X4 | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO
> +				(MX8MM_DSE_X4 | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_ENET_TD2_ENET1_TX_CLK
> +				(MX8MM_FSEL_FAST | MX8MM_SION)
> +			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST)
> +			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST)
> +			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0
> +				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1
> +				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ENET_RXC_ENET1_RX_ER
> +				MX8MM_FSEL_FAST
> +			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL
> +				MX8MM_FSEL_FAST
> +			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST)
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1-gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3
> +				(MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_reg_3v3_etn: reg-3v3-etngrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ENET_TXC_GPIO1_IO23
> +				(MX8MM_DSE_X4 | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK
> +				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA4_USDHC1_DATA4
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA5_USDHC1_DATA5
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA6_USDHC1_DATA6
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_DATA7_USDHC1_DATA7
> +				MX8MM_USDHC_DATA_DEFAULT
> +			MX8MM_IOMUXC_SD1_STROBE_USDHC1_STROBE
> +				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD1_RESET_B_USDHC1_RESET_B
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA4_USDHC1_DATA4
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA5_USDHC1_DATA5
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA6_USDHC1_DATA6
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA7_USDHC1_DATA7
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_STROBE_USDHC1_STROBE
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD1_RESET_B_USDHC1_RESET_B
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA4_USDHC1_DATA4
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA5_USDHC1_DATA5
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA6_USDHC1_DATA6
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_DATA7_USDHC1_DATA7
> +				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD1_STROBE_USDHC1_STROBE
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD1_RESET_B_USDHC1_RESET_B
> +				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +};
> +
> +&usdhc1 {
> +	assigned-clocks = <&clk IMX8MM_CLK_USDHC1>;
> +	assigned-clock-rates = <400000000>;
> +	bus-width = <8>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	vmmc-supply = <&reg_vdd_3v3>;
> +	vqmmc-supply = <&reg_vdd_1v8>;
> +	status = "okay";
> +};
>
> --
> 2.52.0
>
>

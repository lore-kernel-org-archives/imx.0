Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B023054EB
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608195; cv=fail; b=Q/gKAQz9vl1spErsdPG204A3DHo6a0511b6tHedoBjQ9jfJ0uJjwSeCGFSvfA5d2o3pFUYkCQkcMynnxxxM8ml76Zi5iRb1U6ThgXFTUjkhb+pa8519mnss6K0/m4NeYA8dsMB/6l6uTw8wfonnTNZ+wX6ec3szOVyK7ZfyeQKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608195; c=relaxed/simple;
	bh=qcRW6mi44enfHp/hmJ43c/GWSl+uO1C7MvESMLIkZDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qk2obPHFvJZq18u87+Ccl2SGPqDlNGymCmjxVYkKTMh30KfsRs5hRl32Ac0IgDAnLUXxrq2EzusABXCzRfqtbfHbQMeAZMWVpwI8GSJTVVqCSoYkVcU6tmpzH+A0qwbDt4tnLNklyMEKmy6eDLno9un4QverMj64NrXGs0ihESk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F8QGX/Zr; arc=fail smtp.client-ip=40.107.130.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F8QGX/Zr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgTlBfdNpig/WztNQnYLUEjtTRIT5LmaJ9XDlcLcMbPJMZ2MxfGqUU/HqUtyo8rGS1QAhsSaCzlMso+R+K9iSSM4pH9ZFhclWUefF1CrC+CtnRxAjcb94i+GswI5+0q1E0iVh2Vo9bRCU6WOXBwZG9DlhscIcl1mKkcxMPSUR3M53dWuv8LNjfK12SgPdEIo7EcbUQVANMgrozDUbAuB7sSrkcVFjjzgiTZy+2oybl+iJAg9cG4bVAZRNmUetVq3a/EhrSrDpfycGxDfKCfaliGawU+Tm8L2uSPDVLa9HPim2YbvFY2AyuHDRduMYI18OkPbN81MGDnvZslqZS/rQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlhinemTcZXSv5HIUdxvyX/ng3h0ons5BTPRkH8Nw/s=;
 b=v9qMVpPVKGePf8siACuEQOwKXd1J4u4Y3TzJ46PZdP4DPEIpdKsf1aIRxg9bfy71r5iEETrJMUkPLk+bKqYEak/+KHAczWFePrwLCV8GTM7CC63lnzXmnkgIRRHp8uWMR+fRERC2Ytdu0mLTih53JMGdsG7dwOnoIeYEx8Ds+svHUyc/NC3XaC98kBhJVmR4fskTBg37OCpumg/l4/ODwf0W3wr+oKO5Nq5peh7kjCnpE7HG/zWjZxdRxccZKDEnZfj2xlZqY4S2si/SLsHu/itiljNbNROxA9K+bD5ASTbbrrS6TPQKq9Czw+wvWm/oEbE+9etCaz0uFl2q0akcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlhinemTcZXSv5HIUdxvyX/ng3h0ons5BTPRkH8Nw/s=;
 b=F8QGX/ZrfX+nNHQdxODH7EsRpku0s7KcEbdCRXiOVXH8s2RfLTbGHTxPF0Ap1MeamrQnTnbqHCX6j/Xs8qlJQptfT+BcXqeDE8lE+iKhRQOxItSSmlOLQz+6QtFUL1qVlqW4Be0HxSQmpY/F3gnJYXl1GypmMDb3rdHEi3Z/7jaqd4Vve9kkbFWJjMXppGrgsN4PiT8k61uTA/QrHZ48sKU16DX2ccmT2RMaBGmXwLqa9XwAiQpFwQ7/RKHzWUPf3mqKmh2+cyXDpH2RoiMpOTOwweRUJCunAwRjd2ATJJL35PzwBbk6MRnGNREntjOhD5LWy5iKKYXMkOYeuxP9Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB11747.eurprd04.prod.outlook.com (2603:10a6:800:2ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:56:29 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:56:29 +0000
Date: Mon, 1 Dec 2025 11:56:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx93-14x14-evk: Add audio XCVR sound
 card
Message-ID: <aS3ItlvCiaqBbsxd@lizhi-Precision-Tower-5810>
References: <20251201065844.3823323-1-chancel.liu@nxp.com>
 <20251201065844.3823323-3-chancel.liu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201065844.3823323-3-chancel.liu@nxp.com>
X-ClientProxiedBy: PH8PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB11747:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce6b863-4df3-47d8-2d9e-08de30fa92c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DfdAwihBavCELIA6WIskA5YRmRmEiZI68UeQhCbOeuT5uaGeA8NcMpxEeTZz?=
 =?us-ascii?Q?8252DYIo09KXJPCX3bXg3cYLt6rNFdzuD/MPLm2dKXeUoYmPZ1/edLAdC8Fa?=
 =?us-ascii?Q?sP1SJYEy1V5mhQ9v4owSvq70gjyyW6x/Yb7CHzimrFhy+h8wp34wcwraEkzc?=
 =?us-ascii?Q?wGKrTvVPtZHoSWoI02jilEAruwX12shCQV7Azxc+Egknj+kNlzrlLvDSO4ij?=
 =?us-ascii?Q?eTW/UJ/QPeZLeqZ7HHaDNPkXTGxIEr9kznE1pZHwqRFRZfgbLOqbNF5Km0Ge?=
 =?us-ascii?Q?GGI4rouD16bNr6mPfFDjpFOeKwyMra/w7G8LfdFmvzW4avXpbGeurL7IUKoR?=
 =?us-ascii?Q?TLkTE7DjF+CjmyZx3QAqFbcgMCnyZSDM920r29XYsbcp3qdSZaY0lhMJRDvj?=
 =?us-ascii?Q?Rm1AVg08fVmgLcp8H5q5MyF9CnrPLCx5Ygcz841Mtpr0RzN8qoWSfIq47ZEW?=
 =?us-ascii?Q?8gfvx5c1xgUGH6N1XoiJ4BcEWYbQrbmyADyawTPItLych9xSFAELMl5sv3cH?=
 =?us-ascii?Q?hNBGk+5nHVPSk6vaBj6HQb4IjwdkwPUyg7ltCOrVaIMG5eHdwimBpHSFxU+z?=
 =?us-ascii?Q?FecIf2I+OQjkSc5b1JwnbL8wHhAnCGVvDzCwap9VanT4IwUPqmrA1GUQ2K9n?=
 =?us-ascii?Q?XL7pzRGs6vBC7tk8aVkkqtA1eMG9Z09UQe5bijCawz5Ie8+Wb4/bc/UdP5IA?=
 =?us-ascii?Q?zIoYR+cWIDrjXPriqbYO7KPf6F3RzJ726GPrUM5N7Lcg2vsk+rH4fVW/7e6C?=
 =?us-ascii?Q?QztrJHhZ2QizGNzieqDxdNja6Awnc0pDets22JtRE1gXzf7r3SxOsgXAc6Ae?=
 =?us-ascii?Q?gFhohdx+vLU/1VcXE2+unOPiqed5x8a7lygIkO3MvV/rqQM22T8ekO1aA38E?=
 =?us-ascii?Q?fIh8XcBYyNcnbNZ0+CicnqISRucI1NK1lneq5QT8T9h0fMLuaIkiE5mJEBEE?=
 =?us-ascii?Q?MI5CA2ZRU6MWCtJkon2WKZ+EHK6ZKtzFy9NeXNk1AnHRhJM0tOE0T3839LAR?=
 =?us-ascii?Q?zpruAhjnYUOTqZma2NiV5XygkfFXtP+DsuflbM3K908FI3pRG971srFQ2+Ho?=
 =?us-ascii?Q?zhhAFrQAay6BrxK99f4kBIKuTjhdfWytOwTRq3fDhv7FfPd004TLyYfcTY5G?=
 =?us-ascii?Q?VUGXx3aAu+VGjguM3kDG8oJB8gYevAH9tbjrKzmEOhUHzoIgY/107KtQoVz0?=
 =?us-ascii?Q?3cQcZZqKtDoq+P8ojj+sW4IVP1NhiR/QUINCk/Etrh00EkMiI1N0GdlGpRp4?=
 =?us-ascii?Q?90+lRKCxQSUK+eYk0SbL12EEJt9T1jtXy8GEmPQZRYOUSZp4HoDz2sfkRgpH?=
 =?us-ascii?Q?3Z5kZAUkAz9uYC/8lmSCMVWVoCI95kaHfWybpvzOi502eqW1SK0gR6k6eeqQ?=
 =?us-ascii?Q?GUZ/XvIeW9OuiS93PfUFs32mRhpSQiTk3mM2tCMyYQzJmXXLN2Zv8K1erx9Y?=
 =?us-ascii?Q?prHHMBBXPSowKOz8FlNN5lxS+Oqw/IsMWCuwaUTjVzqI7urWojUrX85CDw9N?=
 =?us-ascii?Q?YQrNKgTWEq0eyQy4e57tFMojAp7T42V5BuFo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B8ZW6muUpepi8WljS5MwIlvMFktMCohd8CHb51N6S0R9KQiaLXIqiJw/EO3b?=
 =?us-ascii?Q?s18/mjpWmSQN+7ubQYxUwI/057RcMt+0RQmYbL2JgQPZXQkp2pkSV1nG9c16?=
 =?us-ascii?Q?3mlDfgFqlIvyp/1KQNvoX2WZrgzsPYtHmmbdp7fbrU/uVBXlsvHzdwCmNpdw?=
 =?us-ascii?Q?gU5re57eACYIS+7URqb2BA7EPz2QHIInaacS2TveXSHJFRsZl2XZUEwS9lXo?=
 =?us-ascii?Q?YThXXEOHXKqiP9NEMscuUMBrI3uQBpwwy0O+6bOBSLUJqfNT/FSUeHPEClPp?=
 =?us-ascii?Q?LI3W/7+Km3eFAKBYo672DYiAGA+mfklq12JtcSrvozubnQUhyTTcaYIMiRZ2?=
 =?us-ascii?Q?CCfdDOIliWT6A7UAWD7LFeVICyKECyjk7tNvU3ZOPEBCoPVsp7oaq8Mdd+0V?=
 =?us-ascii?Q?er1pOW4y3zXKYrhVHPEGbDHE4TPRzgFeAuOeY8khJn6SEGkF4fx1R0AG02/o?=
 =?us-ascii?Q?O4rZtW65V+fmMsk2mRXUNoh+kV0NUiG+MBQssJ/RbuZr9f+RoiI+HbDIwlUw?=
 =?us-ascii?Q?Z6N2sLYumQrEEklbK0SJ/GoHy21rvKCXCLRl5AwUZ8ytS4+kjDYhAZVCDQhC?=
 =?us-ascii?Q?DNNBNmQcEjzha4hs0YKGS1PW9i8SeuD/kBxUJpoJpXyEsxnYcpsmNlakC2Q+?=
 =?us-ascii?Q?lwjOmSS00ugtwGUvSnRYF1BznAXPXQl8mNLQlgOU2d7UiT4tPDa56izlqDJe?=
 =?us-ascii?Q?oo9FH/Bj1uTD1NbZf4R4jRH8/elijUr4x/K9+39NKcvv+FIwQkDamnYc9Tgg?=
 =?us-ascii?Q?27c7U/LdUV/GyDQ1oLHgHtI5q711QxsnEm0MEBc2j/dDJoHdPeCqKsm8X0jN?=
 =?us-ascii?Q?E5uJC6jRpyktRj29W2u3WLYO8rmDn1WFJNObmJVWR/pNx1z1x4ALlBJ8vmTu?=
 =?us-ascii?Q?kGrKVgfcqU9SXt38EHNmhWIEg7mN+gOGPoj7qosxNZZNLMC7I66LdkwHdpL1?=
 =?us-ascii?Q?3gDILPa481ohzBli+LWQU1PpTFRASZv2SoCCFKS7K2R7JsuCGxMtcJcUH4DF?=
 =?us-ascii?Q?5dvTXIlBiprbvuNthz9GKETODi1qX7TL2JMGSZjd1cQh97DF9iNYuGOKWbnl?=
 =?us-ascii?Q?Hju2xwbWFet6l4I6KYYZsAwMbhMlSpVmnHjgMLQd8wgFnktoApDCX8GJiv+D?=
 =?us-ascii?Q?bd1jicDSTSxs6thz6RgpIvLClik8BXzYE6J6kldlZPI5AjLv1lXurwTB6Za8?=
 =?us-ascii?Q?dajfpLNyykpDU1xYVECxJGLY/PAe9mIUVdjTpuGfGxsiFg4J4E5SKFJ+BaSF?=
 =?us-ascii?Q?tv83ZLQY06Ju57pcGp24uA7lZvdGIOqwPRmwVf1DgTXU2kGSfkZrlKV6BhSQ?=
 =?us-ascii?Q?EVmmo/mlz83qSp7RB+1UnfT3j6l1kwKhqffrZHm5UJXrf7glw9tG3TyPWwuw?=
 =?us-ascii?Q?GRri852MoryiQkyPgg40LFiXf59TUmGc4cQPxxa8peseT5SdRo6K3QgUXIVa?=
 =?us-ascii?Q?T/b09PW5nrkz4gAUlKG7mPaRJBWntVGWVLsyukL/hpllqaSBWxbmZ/QU6MNs?=
 =?us-ascii?Q?daf5AxCX0n9nyxTlGLpK5DDd4zmOODhMS1XC/71Y4gEX+uYmEHFpwLJEb7eS?=
 =?us-ascii?Q?+wS+x/JEp+1RovpdVnA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce6b863-4df3-47d8-2d9e-08de30fa92c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:56:29.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Se39XXWvROXcKVq2DcOQCUqAW+K27nclw7mXtiyCf2VoVsALv1nIQVNgQoY2lL/2Pd9Rvn9sH7FRRY1MsRBWrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11747

On Mon, Dec 01, 2025 at 03:58:44PM +0900, Chancel Liu wrote:
> Add audio XCVR sound card, which supports SPDIF TX & RX only,
> eARC RX, ARC RX are not supported.

nit: next time, wrap at 75 char.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../boot/dts/freescale/imx93-14x14-evk.dts    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> index e47fee24471a..61843b2c1b1b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> @@ -192,6 +192,19 @@ btcpu: simple-audio-card,cpu {
>  		};
>  	};
>
> +	sound-xcvr {
> +		compatible = "fsl,imx-audio-card";
> +		model = "imx-audio-xcvr";
> +
> +		pri-dai-link {
> +			link-name = "XCVR PCM";
> +
> +			cpu {
> +				sound-dai = <&xcvr>;
> +			};
> +		};
> +	};
> +
>  	usdhc3_pwrseq: usdhc3_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> @@ -468,6 +481,17 @@ &wdog3 {
>  	status = "okay";
>  };
>
> +&xcvr {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spdif>;
> +	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
> +			  <&clk IMX93_CLK_AUDIO_XCVR>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> +	assigned-clock-rates = <12288000>, <200000000>;
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_flexcan1: flexcan1grp {
>  		fsl,pins = <
> @@ -611,6 +635,13 @@ MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x31e
>  		>;
>  	};
>
> +	pinctrl_spdif: spdifgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
> +			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> --
> 2.50.1
>

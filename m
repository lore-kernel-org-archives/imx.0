Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044B1A76DA
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630450; cv=fail; b=hXpg+UIAMXyEYti7kJB0iUL/Xob8j6ffBpEl6rW21WZDtel5DmOumNpNfJuQ2WzLSWLOecSOL6S3ENpQJ4jBFplac4hLe7QJ2cR+1LJZGgeRvBLoiNbuTPvatP4CfEr2JrWfmBxHwAPdJLtiFN6tPQLO+F99NeQXMI57ypLm7No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630450; c=relaxed/simple;
	bh=pxWdDYvhMZUhxK0kEoPDkd2TrmNXaiIKeVuaZNPupGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JBq29rmd36PxGZlQkIltPoEAT5VCM+mQav/DDa5LjNVM2xGVqFDIKz/Uf7yqZrTmkmEU/FATXZFN/tPbiq53HO2+eOM5b2kKcW3uW0TkqPIQsNrwIkrAkIEAJMgac+fnhOG7hZsVqg6n2ki4wzvTh57NRzhr/rgecBcRJFfOZTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L2vziEPI; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L2vziEPI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZZYJh/gZ/EnaHU32B2ltkodpAENuYuJQZSmSZp3Xd2WwUvQHGpKqk3U4M8gxli+RlQosXFRzxAjEvPtIYxjNksY3YKwASM0jr4cHCEa6/ED01k15AsbaUfj80hrEmJmJoMrho0CB2wRTD2bom0YPl/rOQxSuZ8F2kkpR2nNHdIFZQfwLQO89EQ0wVq4nO1Sou46CvFGb/Oc44pzG4SshqdAq8Izw6pr82heGTtjZ7844K1sbXFAkV0CcEOLqV/ARopogZ0YQEs8+lp5youyjLmhYqdKo6APmwnz+/gRWSGwkudJuE5NR0TzdRN/Q1ZH8LlB30dcZulFrpWPN1gQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWdMD4ENnxGg3lYKRyRWfDodfnMw+RrkrpEv3CyFzhg=;
 b=Q0UClFzeNGWPkM4AXiU+37YxLIiL//PZ3G4nfibn2V+2+TWLjQVTRHtE/ksJ2yhWRzMe5NnWlTD3z91k7KFWAtmHObak2CSwKhp5sU87g1yCWNV0pjKGuLUotSvdXrKC1Yn0eyZs6UMV7Tw6eolEWIVNdyN7sOd4DV769GcvczvNO6VeFuIhLNO/3nDfnfC4LpIHAPMT++2NalB24+3hJi2KCdl6znW0dL2zBQKixKK6Iu8Do8zgtay/HHmaJ9NQrhHghJx1wPL2+ASwcBir3qmF3nthV0W8sN2E7YYM1PhJmsfMb/j3B48KHpi3D1cVhVb8NTi5P+u+KI+ZYmPhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWdMD4ENnxGg3lYKRyRWfDodfnMw+RrkrpEv3CyFzhg=;
 b=L2vziEPIikP3jbOFyIm4pbWjCPnDf5Uc/2nrtYqrBbwHCZQn/zVB0z3SAiNxCnZwbMCDS9ur2OL4v9Oz1al5eIVoTP/Hd/h4x0GjrO9ZRGr21g3NVmz0784zvunfkFlXPc1cxmIIpp3gKwTyJaOyfq3IqFzB93yI67KeS4BN6yjZ2kGo+T17qFohfCc4RlWwXr9N8iqK72djhra0GYvL4EKtGN/9f/e1zXB1OFku70dOmsMW8FutaZwxkCznDAqjftN3ixZ860m/HsriiAQQgKibPerX9FlFqjEo9rSgjx7Ih6fI9kDzv4ygfWAFxp7f+Slk3jnTxUeQmBwlqHkQ5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 17:47:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:47:24 +0000
Date: Thu, 19 Dec 2024 12:47:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] arm64: dts: imx8mp-skov: increase I2C clock
 frequency for RTC
Message-ID: <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: BYAPR08CA0057.namprd08.prod.outlook.com
 (2603:10b6:a03:117::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: c0dd7961-b093-4fd5-19d1-08dd20553215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xkjhJwp9wTKx+nvjJjO69x9frjatPwYEv5xmlaWFKhvGRZDr6qZo8VZWh86D?=
 =?us-ascii?Q?fBdl4tT930v9ZAC37RRH8rDP8/fwPR1hyPerOlhNFXwE/r1wpvoVIdGgA5Qf?=
 =?us-ascii?Q?wcCLCzwLUV9z2VesNc+NhLM/sqM6U0dl374oFpSV1rsxmlnC02pBiCRiDHup?=
 =?us-ascii?Q?Rbj1P3oKvhOvpNZgfCX1r2cbdmyOI6Th88JHeXdKNJF9gs5WG7E+7FBP/NLk?=
 =?us-ascii?Q?WqPuSA36As1oN3BlU2bFRdjEkVwOc1+AKoLMhDowE9qPUWgTqSEXOCR5fCo5?=
 =?us-ascii?Q?0Pjpuf1/l11BJD1n7y6ZJeI4KCps1nFLY5/tFezqFzVZ15HBCUwSQofOIglJ?=
 =?us-ascii?Q?xhJouA0t4GIt+o3wgvtKuZiIGlaseWCpnprLunrPFguJSWil2HTi9K2N8B98?=
 =?us-ascii?Q?8dat/MPXAxRBqFqbdTgAJehlo0WzIj6DkV5diHUJnpRTPgG6Bb/KO+mTKRR6?=
 =?us-ascii?Q?xfwtkqL81kQz7DoHGyrdKlsdQ4knom7AXU6wgYum2qgs/IuzwaA0XqYxgI2O?=
 =?us-ascii?Q?/IdMAZ9Ykk1Ep0cLEayLKaTJoy0gaOzfCqRnhra8nHPJAwu/L72LHfp0GyVB?=
 =?us-ascii?Q?fNBQce1sSJ9ANa2J2y8twSYsIM2JImKuN5k3qFFjMn4TMARpNt1h0RDdzy2K?=
 =?us-ascii?Q?b2dlD6dFDOMGjQrqnMCp9Dp1WgXHTzlX/cf7nJc1aPbJBSG1NK0azv0nYkg6?=
 =?us-ascii?Q?IwamdYd/LT0Hp2lxcNhrH2QLjDoHz6tHJDsIgvi55HtQJTcXTa5rah1vyRF2?=
 =?us-ascii?Q?Xh6QjeUt+V9trHlU9xWY7thN7LCyUfxmXPv3k6sd9jrdRbJuFoU6jyzDvMrL?=
 =?us-ascii?Q?2ErS38VhkZQOEBeB74d1eAEYiESz9SLOPFbT4ikJfj3Jy1EmCZ+MftC9N9dm?=
 =?us-ascii?Q?cQ1y63Dtf7HpHvQESLJyPptH3FoKs/oRVFmq4vQL2az9WnewEQCvmh3d8gYV?=
 =?us-ascii?Q?w0p2m3I8RnRwmXaXZOBwD0ktlEP8gJg4tsSZWAMGMDobc5U5OfUMAUd9oHqE?=
 =?us-ascii?Q?7CBf2roMibFYox3fhGMYtoWGEwFNgK3lF3QzTV6gpLG82nB/xXOE/SZgQ+zY?=
 =?us-ascii?Q?gfqUjne8pmINPRtA0f+In7PIf/Rh90YhJE33UAbI8fUGoZAqBqnnKEsqGb4p?=
 =?us-ascii?Q?+M5mcSvSrHzqmG9/0TcDukM2qmqgwien1b4UHfJC3mTh+EY/+xudBzTrcjhT?=
 =?us-ascii?Q?gosdix7bouJm+8tUA9H5Z3WZv0Kv2m8CrmdUtRArbtqJE8E/qu8712EFwJty?=
 =?us-ascii?Q?Fe1d2JZp4kUZjEQtOYw16KFUPo+SibTfz2qOK33WzOi7QwhmvQKCSrUKSfCE?=
 =?us-ascii?Q?IvMJzPE2m/0FeNT3KR0NmeEzyhhI9rUriC5b+A0cTfgEr96xaIFzUWRyivsJ?=
 =?us-ascii?Q?qwQ1HTXDlZIUcK11jelwsZvveArVEBCrGVOmFR9vuUHmLpHGiSVQetFYmIPL?=
 =?us-ascii?Q?uz+l5Lh2NVVfXCaHTd2VAYILlha0nxpI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ya+FADD7qDkuXrS69jXxURz7Q0DO9epl6yKPmLkH8QjJVXqnoQvpn6V2yUe2?=
 =?us-ascii?Q?4TWOvjWrE/fiH3+kgvKjqbRFgDISp4hoT2P6Ohs24QUiRjVztz1+OJGD92DS?=
 =?us-ascii?Q?RQQYLszTCe3flHbqkxYDNxw+TDbIA0ONaIKN7VPBqD1X+41iYIl9C+c6LpbD?=
 =?us-ascii?Q?CMVu/VKws0rH7fnlPNtibxR+RBvOX2urbfnn+mRrsY14Dxs2SB9A9Lq0eYRg?=
 =?us-ascii?Q?t/xvcl1wrwkC0GHITeUKgVtzpiTCerv9igXjvHSEaDabAXmLqKHVBgo1kvZh?=
 =?us-ascii?Q?svRwYoHFPTlOUSJ8ub5DmXvFz2nc1Ts/0+D3PtRNuf4xLyChTJG4YZqmI5pA?=
 =?us-ascii?Q?12MYOz6qU5wSRczv5fq2yTC0bQiRakLfqIZrszwYrkGZfsROLhPZUvt85NGu?=
 =?us-ascii?Q?nSigLOhvUO663vmQWf7e0eDNORleGVp8QSq43DNnuhz+aXnHH9rkq0iyXniU?=
 =?us-ascii?Q?Y+TQxEMVZkHkRdu8ohoqfSBGVKKyZkMw2KIJL7DMC6MTzkISdyTwrwv0FldL?=
 =?us-ascii?Q?Ywku2dLFW0Lmf4UW068LOWJ2MOdS4YnwL0PhKs192MZESGOo86Xv+lH6g99y?=
 =?us-ascii?Q?245Ko8nS/HGRjEue0KQH7nK/Yrk8c7R2t50cJvXOk6rnHVx3wXWI0Rgs0NiT?=
 =?us-ascii?Q?OXnFVoHa87tWO52wmU7BhvbcwKOqftTEgbmb91kFV1N6Xiar76PfPvJEZsM0?=
 =?us-ascii?Q?ihtZsLmX0KTsredmasxjyu4iUdWMEZSoFy4j4Mi0yj2iAGsqWf+b25a5KOXp?=
 =?us-ascii?Q?ptH52NjDx//OElZiBmZMDeptu+zQdzziXQHKsSeOiuokX2lWz4e7jDfrj51G?=
 =?us-ascii?Q?8X7WW4P0YfdO8gIT1yxBvUPGX380gRVUWrCcQHTRIVCmCeCc0/uIh9y22jeG?=
 =?us-ascii?Q?VA9I1eP0Y2Zg0yRO/6nCx/pv1Fj+tUkB/masNWCjhkkISxGXcNp187N/sqbB?=
 =?us-ascii?Q?T6QRmVe25iNxOn9vW6UnxYQ3YvYrWM5rBtnZW/Kg+Q7FJvLmvIb89FDnn0v/?=
 =?us-ascii?Q?hO4IEczH9tnK7Y098zvO+xrO7ohjoe0XnuQlF2EiVobMuYC91MA1xWl/c/4w?=
 =?us-ascii?Q?mRm6hHl4FcpPETcft88coqif+OnomeQ6+G0b0PzjqbowXtaQzqCc3V46qZUR?=
 =?us-ascii?Q?o2HMmPHNi0KglRIpmw7m7fyVEEQg9w4JHQe24mzf6R/1CWGVihJu+7rOA3nY?=
 =?us-ascii?Q?mqS4jWU53pC2oLAuJ74keFCx6diG1yHfCKRizQDSQrPrezKRr3q6Z6ZnCaa4?=
 =?us-ascii?Q?SG0Mj8Xrjk5+r22j14Nb+/OvaKQb5NXDOnbBrbyWVorNA7VyIbBtUsxgKBnt?=
 =?us-ascii?Q?w6pBJhprOY0kAYfIeUgHJ86Dn+/LHpNFBgzb7IB37MgX6EAyDcCq8jlPSrU4?=
 =?us-ascii?Q?pEcRNGHZnqHWLAZfKYdcWq1zNx1f1TMKQ9ti/C/uENrc0C+DaWhLfKO916ID?=
 =?us-ascii?Q?4f1SJ4oBgUoyyNuG6bGaP25JPB5HuJ1mWNcpIYenQEbJJxOoAoGCyZY9A4/j?=
 =?us-ascii?Q?lTABmJUfSyUcv3emizAM19AhodH3+/7o1utrchmQYs8tZvCq3DdQwl6RZric?=
 =?us-ascii?Q?m7xRDXJa4W+cl8QTZu9VumqmLE0zKEss9IksK3pP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0dd7961-b093-4fd5-19d1-08dd20553215
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:47:24.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkM4qnGBj6y8eyzvtMTkRKNwIRvv11yeUJJLdOvKuXDZKgjBlvdgRf439bhvxny/ry2pgZRsu6a6n629jBLxtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
> From: Oleksij Rempel <o.rempel@pengutronix.de>
>
> The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
> frequency, so let's make use of this instead of the 100 kHz bus frequency
> we are currently using.

Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
support it.

Frank

>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> index a683f46fcbab..ec7857db7bf0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
>  };
>
>  &i2c3 {
> -	clock-frequency = <100000>;
> +	clock-frequency = <400000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c3>;
>  	status = "okay";
>
> --
> 2.39.5
>

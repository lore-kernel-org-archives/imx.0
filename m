Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F8347535
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 21:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717769; cv=fail; b=iE4xfqcWGfqomOqKkCX5l8WXaUZN0zRmSVgNQdZoxxOpsHjlym625MOP1zLrZJL0OcS/k/rBbQTaWCfOW+Ju/fr4UjpgUl/4jBvbrhzuFAVqneDX1EvATI/p813UThvBn6CBi3eWj3fktsmLp0SgwUSkJBiSfNmWA75ENXiskdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717769; c=relaxed/simple;
	bh=jlUOT1fQ97H8rfvXxH6HHN7KlPZmbL3c6+aFyvMJ8X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qZjhkfHw2dig4TYGdLlSkqlMG4xatNZousDhRDjwaGjmUi1hLEVJ4GLAhrnXsdb1pxFlRv3zDgM4xNT6UaJapAPjVpmEFDoxbKzdb2PuNvPa7Nf99VUDMXGlsrDSQpkNKGiR8vxdfKjp4KL65o/ZzlxAeIMyeoLGxhzZwHTFCf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CRxRQaHS; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CRxRQaHS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcusBZqd9sHVe8dwEN/CctMepvfS8yNhfkI0S0aaXraCwsBVRqQI//nW1UwLnjNNTFu6TNkn3KJeP7asCVgR27VVv3VHRcU7+4hLkH0eghePDT79IZavY4QFzxW1fIN1sex1bp7K9F0OC6qEHVjL0/uFQhTpOw3udkVRx17B5cepWmIhVFAp5qrti7f69NStpVS8ztkvm5BSnHYL9K3q7Vu9MiPxJzUpd/KpTeqkSiOrmeKqaLIkLRw1zDZwaWS8IF8DJCd0SCQ4SAIwIkuDz+/QsC8Y1uOmBJeTOjV26IJVYx1KNn6pjf8o+FzeLVOOUS6fVzeFl1+IRvQXcAW/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ6iqvoMgSKA8njIldwfk5dhfCpW1ru5Wmn6M0680rY=;
 b=DQ0WUO6T5YmGn58RmuePx8+SCPQ00zQMBXWkRX7GvkN41jyyJCdOMXi3AA3QqgLrGaJhjPZSdEaC5ob+U3kRXanjbYM76lKkp1Nq3BiAieR0IpC7kcnn5lsR0hT1wssaMlhSvi5HuTDYfpf56aCk+thzru3ROkfam52mk2iv7+m58jCDlROuayT/9wl9LDMsgw0xmA5lQBZwFkMANYbNBImXJ50i+WSAP3E9Wmg66j/BcE8p7lXYACkckfOwtHWkUHyR7puRN5fORkb5cifvN0CqtysRIkSc3YCHKrcLRt2Ucgn2EyOAi4gtFQN6cFQGqhARiOqJzuOy0h3rybDFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ6iqvoMgSKA8njIldwfk5dhfCpW1ru5Wmn6M0680rY=;
 b=CRxRQaHSUPoMi+Xsb8p1VAwKrv1pn6Fn6/rlFKecpgJk5yxD+C8COhXdkPdmvPD2COSuR1kTCqGxQZaSv2py+K1GrRbVsRzgaMxZhNxDVa5gOELvATtUIjmvaLZtkrE2LTJlqyV4F/jcEyQJqVJ4SMkyc64qKboilX/9rht4riEQ+cwcsS91yL2CgMu1oxEqMzxIwYIaiwx2jAzEOzZmEVufq9S6lKcx2J/wPSJVT0DBEK5+yBQODEg44Fzo+UlMDuTptayn+k8mfADJQha/6JOFDgb28aGkhRSrNUoTdKKSYBYqRk0Md2N2qqIbOO7DnIx0AjSld1ID0Fc60h0RIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9375.eurprd04.prod.outlook.com (2603:10a6:102:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 21:09:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 10 Jul 2026
 21:09:24 +0000
Date: Fri, 10 Jul 2026 16:09:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
	Tom Rini <trini@konsulko.com>,
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: freescale: Import optee node from u-boot
 device trees
Message-ID: <alFfeOFz2UA7hAbK@SMW015318>
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
 <20260710-mathieu-uboot-dts-import-v1-1-ffe0210e50c9@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-mathieu-uboot-dts-import-v1-1-ffe0210e50c9@bootlin.com>
X-ClientProxiedBy: PH7PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:510:33d::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: a7992953-0b39-4c42-b3fa-08dedec784a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|19092799006|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DgleR1dEoffZGnYGWvLtsb6e8+KF1k+76IfXsvYpYCUBvoA+/gNU4bEKeqiXC/AF3uO9Mh7/57FFGl5V2GyrQFp8S0XJn/lLfJ0BSBbvUUcDN+WYGNO/v3JfUL31ah0D7LEJ4iaGu/H4THIts8WbhYxHNKYjbLRIAVjUbyGHSOWJjgz+Lxm56NhaYFLPwWtLXT+cyUtpc6iC5TDoVJyPm+Lyd2WHRPWlm8rNuxbqTcqYo9FM9H6CgnKeNpn5ajTyrVXe9DOdKO1lBAqQ7FjjznuWtLAdVWF9ccdSnueFh59iJOe4fMyVLluBBFhY9fGARjTn8ysXrqyW5QSB3N92Kp6yGkaOF+u7NfDW9eNn6sbw9SpzsfS338OuFhObJb6bfWGXL2MMvGrp9MJKxBAVXJTap5Hv281SNWbVfkSbbtTcMgOU3EKtJL0Nq6JYKWU4QIv1rYQa0Ouayp/kTdLTfPFtSjpmdWZ1MR0GUnX7aoZ7eV/roznOBmxMAqJpnBwr4rB258UyswfFfTvCT7m0uf52ZRgGWTipBjUSkxTz/Ihbc8FKWE/mT36btlYWFzXaVYt53orhLoczxElO7NulumqQ9eLIfBjqDOiEEQ1dly+DbMEHbySHVgASnpWsYeaf3XD62lw80YeHCzr8TUjVKpFOVOSMSZMdou+qYQzZVMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMkMvUjV78IT0PTEmqPWxmEQIshwD9C4CY2ORd+IMhPlVpMD0ter0ylG9Pca?=
 =?us-ascii?Q?j6/pBzgXzEZNpdjfWhWgbSbcdNx9DeOFc7rsjAt1+4BPySSFaZmysHWC/tuW?=
 =?us-ascii?Q?mDXmtX2Zu7+mGBuJI+k6VRUTV5J1jCKMc6qUTzflTRXBiL/yOT2xniR3U9Ng?=
 =?us-ascii?Q?VKeJZzAD3EQuJOxorKKAnv7t9VyfXJgK2hm0UABbgRegjKX9ZPvMks6yfM56?=
 =?us-ascii?Q?SrtncF7uSn1p6AbQQs8Fd07yZ09NRck9FcxCUs/rNfuWsu1Y8jcnCCk+X6Hy?=
 =?us-ascii?Q?7SekQihb2/4zMnjri+kiweQsj2lVXNBI/YxcdZoxPOLuBtwtwShJUZVlV60a?=
 =?us-ascii?Q?kF3ncj+UBiQLkFZ3Q0fyZExoRIJGHcYjzGuf4PY1qr5xOZu28BmAbmixUzk4?=
 =?us-ascii?Q?mvewnLgCyfW2ft6GtzJah1ONI3SQIQcFXUssx7rG9S02otm9W61fiCMxgLAJ?=
 =?us-ascii?Q?UmJlfEluoQyBi3MKImzZapQtfjTlN+B01iJljh+9DKKdwn6JHfbSE9aYvrRX?=
 =?us-ascii?Q?SFPXePAT+xpRV1Nqf/mfwvlKUtn5+04hIx6+khBmbZKVB0MbHUDrBW0xZmwz?=
 =?us-ascii?Q?QrP+VHG439dHkwlG3GGKeVn9/XnmXHQkp0thQbYXFFT4uhSzvNNLBgPxYpKE?=
 =?us-ascii?Q?c7uPYUXqxTJugZ6HEEFLlmf+GRzaSxxcK7LyMieEaQptyqTnG9lvaJPdzBvW?=
 =?us-ascii?Q?9ZHSaAZXxsWIF1WPAkqrEPrlqQ/9dRWg4G1mfrvc1yipeUwqo8JINlNHtkbn?=
 =?us-ascii?Q?VPbUlEqzZvvx/+U289+kmY1WS6cDTayX5gGZ8bdkXxH5gsnGPjxO3dc/JG2/?=
 =?us-ascii?Q?hgmSR1aRCjkDYYoZXMuqEGOPMfPl2Df+JnHzl+g6IKwOEjXSyAm3odZEcolP?=
 =?us-ascii?Q?JTT1l7ikQhfzyJfBk3suuuqFeP8JoXYLUi8ccjOjYPa9kfyRNl9CCOv9qxqR?=
 =?us-ascii?Q?2XMyF5uyBi2r7xhMjCLpkFox8ue0/hblgB7KabOSwE5N8WvRDDUCRUUJrXu7?=
 =?us-ascii?Q?Fx0MTqoXjIB3rALSRpD6XfuLX+08O/jBDr2C1E/u6vZ+ZLhwRTIl+n1JnV5g?=
 =?us-ascii?Q?qY/Fo0AUyfl+znEx4pFN67by1wGiQURrWW+5AT00XwNnS1oaFAkCM+EBbUND?=
 =?us-ascii?Q?0wNo2VaqmapxDBmYicgSIn3zxoGZXmyNptf9uVyCN2k/5CcTyqbERjXLdefK?=
 =?us-ascii?Q?Jk8g6uNKOY89u3kQLb2YJy9atmDpYA1OQ6R409MMeHdfrE7dhAo+SPkB0eg4?=
 =?us-ascii?Q?tqQxNa//M0F3VVFaj0gi2EjGk9AQYJ4hivP94AHDk/Ou26hVY5ra/gNoUt09?=
 =?us-ascii?Q?Ygjwi2XPxXDD9WSrI1X28m9D/1LeUCQhocnnK1g7br6jhBfDTLxe6FDtsiYe?=
 =?us-ascii?Q?AHIa7b9ysYxL6ZrIUhXdZYrB9e6F+DRJd631O9fQ6FfwEo4ZFm4PJ+hegJhI?=
 =?us-ascii?Q?fA9iT1FuefRiDPwJQLCP8LsdT97vuDvMU1zvmJqvLzdziTvgMZmpU1ryf2rZ?=
 =?us-ascii?Q?/ebVhtD5XoMplCQ+YeC/g0azN+hlNTGdh1P/A9H8vXKHCT4GiTkTI1HpkSBK?=
 =?us-ascii?Q?+9iU/j5XXip36PSuM0NSViYxdKif9IpqZoGBze7gaI8LhCCkWcb+W9k9RsLc?=
 =?us-ascii?Q?qwYq3DTfhmrw53hzj6MuBcYHQrhVOq19F5pzU6LbhDsx9ueL/7gMqmETiBsA?=
 =?us-ascii?Q?sANCdAM7r1bRknkh7Lc++IxfqVr1RkjK1UHZ5ibPUo0uRpSlUaeJkQomXjbL?=
 =?us-ascii?Q?Qpn4+bRfhlxd5ZVPRMwTGxYGeA4TDBdaxKwkkYvzgoG60grAK4Jb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7992953-0b39-4c42-b3fa-08dedec784a5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 21:09:24.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0Txg4TyT0RmUNZQ112XyRZ5xCmdv0SsL1prYLz3/gPRDzo+QgjHcCJLLjssJWODYYepVWMigK9CEWXJJp6lQ3Pm2iMi5Kv88dkXGWftvvafjk0dtddnTA0ARRu35lBJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9375

On Fri, Jul 10, 2026 at 05:31:34PM +0200, Mathieu Dubois-Briand wrote:
> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> U-Boot is importing kernel device trees for these platforms, but adding
> a firmware node to enable communication with OP-TEE. Importing
> changes here will allow to remove these additions in U-Boot.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi                | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi                | 7 +++++++

Please split soc dts change to new patch.

Frank

>  arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts        | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts       | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts   | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts        | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts          | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts   | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 7 +++++++
>  11 files changed, 77 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index 5cf2998d396d..4a55464e8a6f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -233,6 +233,13 @@ timer {
>                 arm,no-tick-in-suspend;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         thermal_zones: thermal-zones {
>                 cpu-thermal {
>                         polling-delay-passive = <250>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> index 79b169b07c4f..c3b4560ec9b4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -265,6 +265,13 @@ timer {
>                 arm,no-tick-in-suspend;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         soc: soc@0 {
>                 compatible = "fsl,imx8mn-soc", "simple-bus";
>                 #address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 5ce2825182fd..285b98384255 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -404,6 +404,13 @@ timer {
>                 arm,no-tick-in-suspend;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         soc: soc@0 {
>                 compatible = "fsl,imx8mp-soc", "simple-bus";
>                 #address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> index 5716febb5a50..c7050bafacae 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> @@ -110,6 +110,13 @@ linux,cma {
>                 };
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         sound-wm8962 {
>                 compatible = "fsl,imx-audio-wm8962";
>                 model = "wm8962-audio";
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
> index c25561574d3f..c0156921414f 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
> @@ -152,6 +152,13 @@ linux,cma {
>                 };
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         soc@0 {
>                 bootph-all;
>                 bootph-pre-ram;
> diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
> index 022e9c6841ef..62b6eff013f1 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
> @@ -35,6 +35,13 @@ chosen {
>                 stdout-path = &lpuart1;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         flexcan1_tc: can-phy0 {
>                 /* TI SN65HVD234D CAN-CC 1MBit/s */
>                 compatible = "ti,tcan1043";
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index c6db9c85f2ac..0bea169d7029 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -42,6 +42,13 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
>                 enable-active-high;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         usdhc3_pwrseq: usdhc3_pwrseq {
>                 compatible = "mmc-pwrseq-simple";
>                 reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> index 01c11c517986..6b99c0594125 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> @@ -147,6 +147,13 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
>                 enable-active-high;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         sound-bt-sco {
>                 compatible = "simple-audio-card";
>                 simple-audio-card,name = "bt-sco-audio";
> diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
> index 4620c070f4d7..b8fa0cda33b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
> @@ -62,6 +62,13 @@ reg_vcc_panel: regulator-vcc-panel {
>                 regulator-min-microvolt = <3300000>;
>                 regulator-name = "VCC_PANEL";
>         };
> +
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
>  };
>
>  &eqos { /* Second ethernet (OSM-S ETH_B) */
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index d929aa9ff255..e96b8437f922 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -36,6 +36,13 @@ chosen {
>                 stdout-path = &lpuart1;
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         flexcan1_tc: can-phy0 {
>                 compatible = "ti,tcan1043";
>                 #phy-cells = <0>;
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> index 409c7e74ffe3..20eaabc23b49 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> @@ -125,6 +125,13 @@ ele_reserved: ele-reserved@87de0000 {
>                 };
>         };
>
> +       firmware {
> +               optee: optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
> +
>         gpio-keys {
>                 compatible = "gpio-keys";
>
>
> --
> 2.47.3
>
>

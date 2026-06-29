Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD554534A5
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750624; cv=fail; b=JYr16/kHwDFDQxITXv/eZf98RmFJA16fF7Wq8TxkH0HzXyi9fKdfB/3qB31PZRRpQG2T/CrGEagrx65/Y8OqWJvdZdrQCLOQ0ZiybeAzjCitIKFs0n/aBc4tfJjb9CwSlsaWSu/J+c1iELsp5tL9euubaniM310QQOYGo12BSI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750624; c=relaxed/simple;
	bh=yLxmcr5KL33fSeCchymx8tvloqQPsP9yzOZe7vZPrI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FlLqGhCY6E0rScOgintdrh3Mnttxqpswb4CVjheryqECvT73x3KGHSmOJKZwmRUfQkkBIzxJp9IaEzcf4cXNW2lOVc7xbNyzLMUygsv1t2mWRJ98ai+XGh0OSZ6Z736ISnxXrEh+xcq90/0XJJbypU3Yvx4T38EO8tUGJtaLvNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PY83pEo9; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PY83pEo9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqxxeqZrTalxob74VQT1xOqPDWCXqxHyfF+NmMh+75kH9fFbpXKiq4Kf7FWx8at1hpkUokq9GtLNw3zXfNUZb5+DbZmUvgLBS33zbLelajuC1DJz4lv3+ffrOu3XsW9KOpUJijT/1jD2MxfjV+AlYYrqpNfQznea+ElpnQ77xiHLTOVF8GvN0KETPYorKsZvax8Aet9c+M5/EmK6hgIZHL7PnkDBivtTb/s38h8jWWb/aGbFYcmNbHKVwI24riHFoog/rxHdNzZq+Etp6NP1i3xzbYyTCreVg5tf5rAsCwqEZ348uOowgjPQsICRD+tLGtfwkyaNu0y/lI/1W+cwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r51vBflPLPCW6bZheOH7y6x50zxuT3Or9c+D81EvhYQ=;
 b=MsFELGr03pkRzmltXTUE4uj5+7KVov9nKK9k8byxtoYZ3zN12TQS5oEMt4+zFWKY1f7gcWp4+1TBNMoFq7Ab/6cPmYt2goYcMK1/pCP2lzYogazK69RDSAqBwXqOWMlmjkFGNc+pO3XfRXZfP1YgeOhKek9q0mjO7vrLkWw0eRuV8eeP7w88UTYXDjlezOY7c2D7oej6obCT8ozZsf2bbMKHALlI0RoiNIFFxc5DCFDQ/wdYRYo4X1bHbwLLvngDehXgwYmih3PcV1AuLQ7FBlWCPnHGVAbZzjdTFW/0+KIdMvzM4ErfKWSJsHOlqD67DOjTQHJnxdTGEcDKkBoqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r51vBflPLPCW6bZheOH7y6x50zxuT3Or9c+D81EvhYQ=;
 b=PY83pEo9HTi/oYSarBivg2q6vC233GYOHZ6//sxw8f+tGAdxs+GxkFN97pvbyffvWceJ6RYHkMNXGSKTCxECf8DXowckVAHu6SYQ/m1ZaLqqmkiv+NeOeTWJuL9LwJYawF5bh+H2L6Moqc5grq5CThV7eQUQRk/rXk4nCsOsZznvJTiEFbu6kWA20+UDkQgOoO3y5KS9C5f0UQAZg2PtTC1p9XTSnoFLUIMOtNmU/kFbZ5tt1ZtMqDxIBvj/MUwvOJSsdB1fNURavpgaTHgESHKxhdvPmHYcxMg19TT1oDzriO1t30FV7cQw5diKqbpfSVCEIasudewIrcf8fGz9OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:30:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:30:18 +0000
Date: Mon, 29 Jun 2026 12:30:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
References: <cover.1780929317.git.stefano.r@variscite.com>
 <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH7PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:510:23d::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ed2d14-0938-42e4-3b7f-08ded5fbb4ea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|7416014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 Q95WxHrY6lmoJ5lhBl3ncoLRSzrbA5Q+kbKeYFB+bH6dRleNqHw4buWO1veQwUQo6Ntm7qtYoMjEQyR0CT7nlNFoOonh/xwz77m8IiO89pG9n/svkvzMs7iKJt5J1uKqHSpc1RKqqyvHyog884RKYu1kCZFlqbBpwedwSpLqXAdSwJpx23YpvulO4Yf2eft/IruIScqLibHzwEeqBfoiZzwlt0cmrXl8wsMA/y6M17KxjsATg/kOkcIIdBa3TlyWOBWiAVbNF7CnF+t0Y6YroaCGGmXuQOweo1ba1ZdvdY5W9xr8Ixhm70413Hr09pyqkH9g0cvC4Sgq934uKyOaGqpma81IQNulP1k5FYIWd1R658jgHb8l5ktJnx+E9ZGP+lJ1O9Ej4GBxCbJfSLCViCr6WLsuSjdk6NWDd2WRGbZeUSoHgvQjPtURLm2cz+K4RvaQEgBFSTvE+p3wrncw336KzRxvF+49EDke8gc2jjIKRyBdp9ZNeROG+cPL/16CnfXZ0f3HiZuqHCv3MKrt2UInCiIgDNgN/njLb9kCyESuSGK69EY8nB8K19IKvzbMcCsGplpNkgoS2TDaSzS7F3EJ3nvn7NaP2cin4o09flac6kGOT7gfZGUQi/MtPbihm3dfxwFr+OjT9H2VO5iErloUkhYaY9z5gnlajdkfLvI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?8pilMbkCl+o3OJ9e49MGsFOUSQU0aO4X9vZ9tlsSQgCU2sNVY7csXxrz2iDU?=
 =?us-ascii?Q?eJiXzBJF+J9lL6pihTo+1V89qOGYoQ1kkZiMP5mddLwunKlVRu9mkvvSvxKb?=
 =?us-ascii?Q?nYNaOpoma5iJ8YsmVX2HhF9Cz+O8gTwJRF3eFs8vEkbiLGApiVL+nbQlA+5+?=
 =?us-ascii?Q?rvcB5OLkrgHZgEItFdhRndhuILsxgMDKnCb2xBo5wpObgkFtZJHuvFXyYf79?=
 =?us-ascii?Q?UfViBmzbJgjt3yCMrTsX/ZX/XDLrxBPMQ4xOO/i35h9LQssdSnwSQo+IigPj?=
 =?us-ascii?Q?iWWHG0xVstR01ey2hyZ6OfycmfkktRs5T5tF/XsKFfNt8DA6nsz44cwk0sVn?=
 =?us-ascii?Q?7OUr8gHy5UE/UKX1yDdZCRavmnYMksKcvS2Oc4XGlZcD7ZoLl6f0EuEUv4YD?=
 =?us-ascii?Q?YWGul18keK6ySajbGHHGa5hAgoTuYzyopgJRVT+4m2DS6yeHWG6I2sdr2cZ2?=
 =?us-ascii?Q?MPAIVpjki13P77XUQp/1uGhzKJF8YtOiJGjhHZbmRopyNB5LND3A63a5q+Kk?=
 =?us-ascii?Q?U18+osFKlpHS7R7xwj9rUFVXc5L3dkJ8JtjNrgDu3ASDBPzQMCXqFtWx+ziG?=
 =?us-ascii?Q?FeDcEHcyTfIlmi4+eZFfgKoZ8X2S+8IMWq5ollTMCQ71dQKjdJkeZvLInrkV?=
 =?us-ascii?Q?HYcxDfx/u905XLbQD/T2lfhy/0TbDZQ7WGl0pIaBZaCDWec8b1wsCk4IoW9D?=
 =?us-ascii?Q?LU1OEU4sF0vhqUWj4+Drk+jMMtC4pTzQ5LynoqznFeEAe+TvGQPKR4fdAX5i?=
 =?us-ascii?Q?PU2CZD5xzYYi7Qsof8YFRdietr65yGvJQPJj4jVlkrOZE+qH8OxcSFfc9yGr?=
 =?us-ascii?Q?kQZHziHJ1VWB7Iga2k0IILroqicJ99nO25L97U+iA4RYUvVQtQZEnyTSVDnq?=
 =?us-ascii?Q?5+RuFsEheqmaHlX5yGP6GR8SdqRb5CAanEoQwuLMCGbZSoHe4jqEjCsw91i2?=
 =?us-ascii?Q?Fjb/yjEZvmDBd1vt4lgI7+LkeohA4Cgu9p6apk6vmkzmuxN8QU/YYFSS+EqC?=
 =?us-ascii?Q?eG0LWDaj0edcZlgaYQKDTfB6/9BOk/3JxYqpxqmutbVc0BzIbk3cCYoEVydZ?=
 =?us-ascii?Q?POkjX8HmrO2R1wdWFpjaI3JY1PKxPYvRgXFj1DuoDphWrmcBeNq9nwziqyw6?=
 =?us-ascii?Q?4rce059QM5w6m4KbItjbflRUWlt21Y0Y5lgxg8DkdMtpcKlo7u9bgrHCgcIF?=
 =?us-ascii?Q?0fPqKIdqD0hBysf/MDQYdCq3n+bzCEoCzsIAuGpDi+7eSoIGJUb8TorD7++S?=
 =?us-ascii?Q?SiYATbLnlLqThDamPm8fOV+VeckGNW/hMkjjDvSNXF6C0EgiNQnop//VA/YN?=
 =?us-ascii?Q?WyDte919kLjm4kJ26QQ2369C75JBTixXyRkLVsotiN3S3Dd8J+gBLAwzJlKI?=
 =?us-ascii?Q?oeqwMRazUJbfCxVBz4E4Ud7I0ad7hldggcm9BAqfI0JaJGCk3XUz6gqWUYwU?=
 =?us-ascii?Q?TJ7Yz46csbZJpJ6q+UA+EKyiYpBbr8EvXr73JSqJgXWoa8OvtvgPM0seblit?=
 =?us-ascii?Q?arKrCIDVbisQU1HTBfqXnF+3nRlpoIraS05m484uyKQ7gkQBPBfVtfxodHEC?=
 =?us-ascii?Q?sAwUz/b8iqr+NZScWdek8HDTNZpp2vFFgvyMUhO/4B4OyRcB4c6Y09O8v3ad?=
 =?us-ascii?Q?g/d6Sbk18Lb0htWkAD2a84OQ/OHF9JlFl38EhbwjWRSOzOB22Iz4zZNc+oBG?=
 =?us-ascii?Q?q3xbdhlB3toaO+CXHbb9zkkVBg4YNnUVdPcd2qWWH7ZhVUsW0mojZ9KJlOBi?=
 =?us-ascii?Q?fJphZw8i0ITPVX0Rzmin3CpkY0DDU4WdlmSQs37PnPBKykHhhtr/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ed2d14-0938-42e4-3b7f-08ded5fbb4ea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:30:18.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 079eJPTXfIke4lpL2qE3MDqCvpdV8kcXk7iSs8cdwTYd0DuEKM1TFzDQt0pCK5dKT16oXRAFkHXrrd7afnqvLbnFLVdDdOkCMKxI+u4bAbQHhVoCipydbfCFrzT0BN+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

On Mon, Jun 08, 2026 at 04:41:07PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add the PCIe reference clock and enable the PCIe controller and PHY on
> the Symphony carrier board.
>
> Describe the PERST# reset GPIO and configure the PHY to use an external
> reference clock input.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v4->v5:
>  -
>
> v3->v4:
>  - Add pcie reset-gpios instead of deprecated one
>
> v2->v3:
>  -
>
> v1->v2:
>  - Adjust PCIe controller configuration
>
>  .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index fdac4ceb4c19..698f02fc39a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> @@ -48,6 +48,12 @@ led-0 {
>  		};
>  	};
>
> +	pcie0_refclk: pcie0-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VSD_3V3";
> @@ -146,6 +152,18 @@ rtc@68 {
>  	};
>  };
>
> +&pcie {
> +	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	clocks = <&pcie0_refclk>;
> +	clock-names = "ref";

You have to provide all clocks, otherwise, whole clocks and clock-names will
by overwrite with one clock "ref".

suppose CHECK_DTBS should report warning about clocks items.

Frank

> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	status = "okay";
> +};
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> --
> 2.47.3
>

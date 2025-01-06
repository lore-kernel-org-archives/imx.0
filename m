Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A151DF97F
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191845; cv=fail; b=Wd7l1iFX4DGucHqZ7dSplBTyM8JQLRJkdgIWJgwzlzrm6s3Do50r2gJItINewQpftMZL1zoHjCZTMhpJn3DRvLW9GZ95xKZITsgDMDWOQTBc15w93pdN9oNDX5fwMyhiyET8vuEG+TReUYDZxCZh7T2D36CyucAA2N3oy0GkQi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191845; c=relaxed/simple;
	bh=b6GYHGuLvzqXQPIiXA7CI3Sr4ECXjBrEj5aXf07SKUE=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tAXLa87gLg0L9j2enUOX7exf42XH6qn7qnY2SD3cKTACkfJehuro5N5/+bI64J8DQMiFvCKeJYhz3v3HgQrDy6a8qk5zuLiJE+6nT71XMYuiX5HARXt5wylci8O3B8kjzSQo//O1AGCKSl4519AIkqN0v22l4aBKg3XP5xYVT4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HhYi6dvT; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HhYi6dvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0iZg7Z8IKvVWYuxOF5ElG79vkVixoZJfhHmDI7Dng7ImS/S5+0l5S4W6DRNWZRdy6aXR7irHydoVxXWiyxr3drsE/8lLux8NK98VN1r9XniZA2GIIIskMIT2sGt2/nBv8rlBW6bQ3TS75NRCSuGYKpp+R38ddB7HnGr4IBYMnnXOTsbog7fTWYp0rRHm2U3AyfOXQ3HJTkJQjS5A18dyBlKwyaB7CEDuaFGLr7FjIcdlfqF6oBcCwJpYyzoe4Iw8WTPIYthBSqgvNFLJ1O0jPVgMHRu0556QdbfUVaxMsmif65nYhzlHoZz/3GM+o6G2Ud2pkKZihlg8O9AErvGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIMlbOnbm7TmpsBmKA+fkmovpbzutwYBMbquwpDXB80=;
 b=JAZTT1ARcFJwbdCQ6Z4TlyGHedrQddbrddIFDbOx+K6YrwEKSlhyWPGnqOFZQ2S6tRkJ4pIZWShUl+8syNde8QjeAOoWl5rqQrikksnuO/P8W9ZmF0StrisxUima6Pd/erSPgJJY0KbSUj3EGdr2EOVxd/6XmviPd3P0/g7+TssGLd+mbA4tS8YOVebT6yXxtpXk/o51oZOLotmIxIZ36NRShk2BQCEzyDmgV9Zj4/t2mKrg1Wp5I+aYsVdLkzsPjpM3d8DPs4FUxLF5BkDh1q/0PKWUHkJplHSsK3n6PT4J3MsSVvCIvlwb1VndmWD2xOyznI1/7Aokdr+9nhwSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIMlbOnbm7TmpsBmKA+fkmovpbzutwYBMbquwpDXB80=;
 b=HhYi6dvTiQmMKL9vyNY+wJS3E1hPl5xGuUSK3ygNG4hYr+KDKnVZRp8eNvK9T25oLnAQkLCEuQa6GLJJpKwh7vCYhFv+PJuHVC8lV+GgIm0COrHDn6DpZrD/EItqCOYGinkz/ekUB9QVxw1VBNdmo63JJfZZmmpYsAI2lmTkcTUmzW8XZ40bVxQPnKxE94c44jK634jrFuFKXAW5K7f7ILY5KyFX/HH1hMynzt0mDIImzta6wYPkcpE3Kzz9aNPUePWKr85eK13Zy8o6bh3KTn5lOTheqF1Wg2fCrjU4h55z7VJaeDmdkXikbDcnmGIgVlF5KICyN6W1vAkB0dilMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 19:30:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 19:30:38 +0000
Date: Mon, 6 Jan 2025 14:30:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: add audio-codec cs42888 and
 related nodes
Message-ID: <Z3wvWXVnuPQPTw7u@lizhi-Precision-Tower-5810>
References: <20241028220318.2047870-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028220318.2047870-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SA9PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:806:27::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bd9c8e-43e4-43bf-75a2-08dd2e8899d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?THVpD3DWC2APYrrv0A+/Wbcn8ij2UG58zpduoZqEylL7b0yFBc8rDImb7g13?=
 =?us-ascii?Q?3+ks5DW2F9BiP52RPbxqdY97jC694Yc4P7wC0/ua7Z5DJXx1vwnBIpOf12m7?=
 =?us-ascii?Q?7qBxkowSHfuGbg+GBcTmzQPYMqWwdEP0x3/k16RytsP8vx6qQYQCCBuAaBFE?=
 =?us-ascii?Q?aWhyedvJdYWoCndvGuB/upnzQHrk7q3BS3201YZhKjt9K3xeei1VYc2inSRP?=
 =?us-ascii?Q?2HsRVythOQD9LwnRQLTf1otTnMTogfoq0a/LDCm7v+uCOZWpphh0b7p8KlKD?=
 =?us-ascii?Q?J5gpxgZ4IlmIZSuYQTt9ZYrJ4GmAkR9kxUptbOq7xM2F9AfSdEc0bKWe4/u/?=
 =?us-ascii?Q?naglVk9MC3oqW7lUc9CBwPVQRXWKraHFhnov57IdlGChD5fy/IKtRy1HmMYA?=
 =?us-ascii?Q?SykQZjA6/j+MNDlkkmqIWj6tXnASGrZ+AJOeRq6yTsxelErfWMZ9V0zzGnsP?=
 =?us-ascii?Q?vYc28KBMu7UQp4tymEnkgB7oM39fWj733eGM1N9hp+EGFvTVHr1ApnwkwUL4?=
 =?us-ascii?Q?PBSikYxn1+geT6KtYhb1GbMQzVwqhSS7hr38i3Q6jWIf4Drp55MyghEOxKKj?=
 =?us-ascii?Q?lPFFHOj5fwyy0p6xc6r+jzVa3iCq+LzbEKH0sSLgT40L8vUKAuMR312rPpr/?=
 =?us-ascii?Q?hwHvpATnXWpvjbQzlGR7PNlr0Fvgix10iaZBYLQI/4NqTF6HiCV5Cyhw/aWN?=
 =?us-ascii?Q?0MMCVVccDVggVcxrVxC7YyAszqV2n7h2LU7PZYtDC0F5nXF+LEFCJCGJW3sd?=
 =?us-ascii?Q?4tta6+HSyOQ6IHHzhHMFHQMamaFqlH/RHrAgeAdRm/mR7e84Nx+yLGoH7f65?=
 =?us-ascii?Q?Ya2WWja0OK4k4cTPcb/q/IMjAYPy0QVDiocj7NfRCsgMSCeTkgXCqnydWR8g?=
 =?us-ascii?Q?mv8ifZCCMn49lkA9fwfigi/Da3lEKWJlm+gjfKqpbY+DCvjgby7lE9PuVGCb?=
 =?us-ascii?Q?gCHlWs5CEm80Er/1V0Q1TFseraUzZQneo4IUCT76fdHZtUqO+RPWo+vQnRyv?=
 =?us-ascii?Q?hkMjTOAeolY6qA8m3bQuLyP/YaS17sunfSpW80t8AdWvLGLKVM3lBUeZoEOK?=
 =?us-ascii?Q?RA07xXQOQqbi3Eq/z3Wm2fsZmGVh4/WldpqSlNAach90RnjCN2NhXJ5s6HjZ?=
 =?us-ascii?Q?4d+2fDnkntX79zhivc/ZEJvIyZ4GLuYeCldLteYmT6ZzflF77JozY37eIo4S?=
 =?us-ascii?Q?4MiIOCfjbdmB19hLsUHjMgH7aQ2rjHQAidQo5pKcG5jsFPA1e9gD8dGrqYIH?=
 =?us-ascii?Q?SeUrxBAiS94PZsfAgs4dHrb6ohL3GOeoAikr4hznd/xXdckCwd9hIDTus0pY?=
 =?us-ascii?Q?EhcUawRrQ4MgG1QGSuT93ypgjABKt9JFy/ngumelppoNe4EOQHjSuEoT4REL?=
 =?us-ascii?Q?RDeQ94EkXFFNDxcrsYJspUhk8p7HR0xKBxlU1XAW98fOTWELkmJcW/owPFjJ?=
 =?us-ascii?Q?WIXxTOPN45OWlZsr/5pzs+Np6TzBhJFiyXNjNfUAbOzFxDaGt0VyFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BSlIGWgM3hQsXJpkX1wvsHNxNLlFA0sJTzQesg7Y0cubbReCBv2NfqWkKIOm?=
 =?us-ascii?Q?l5lStpNTNLXiFpldly48trx/qdkGAP/qRleb7NRPe3ID5uFL1FlSeJpebY5o?=
 =?us-ascii?Q?Cih3awMyaXGnojp57+curOB0+gASmchEBVRQ2tp4HDcgUF1FSikakt3AK6LE?=
 =?us-ascii?Q?ZnZGE6Lh2i+rL3WCfau3ktaA+TES/MvOZJIrOiN06pTMy9kwb8cMZGJr0i9e?=
 =?us-ascii?Q?+sJ6N9RlFrxZCCIRL5SDJW+7ZX8ta2x5ZtcdANhIhUZWlvcbAN/jOrZ2lNKl?=
 =?us-ascii?Q?R/dlzMybdU55MifpZVOdFv3g75td5v2wH7anct+45HsSCj9+xG2jRJCxAY+v?=
 =?us-ascii?Q?wmaYcHiN7cyHTrvg7gUwX1UkGxmu1O8ncYx9FHLcjdwGvpcGPzkWyDuPsI5z?=
 =?us-ascii?Q?9Mkh8D9pg8PWMcMAu/DxF9WbKw/LHr6AiqdKMDrKRyFU1RiwzbCU/qEREy1R?=
 =?us-ascii?Q?ONyRPNKTx2dThM03yk1Qj9O6Pg7nDwzEwgFHaeH7cjQIENIMP8exi7ex6VBK?=
 =?us-ascii?Q?5ecOvzqOHUgAQqYstTcT51YmEfW1k4jwZ8jpumBt43GMjxW6B4emNCm264ij?=
 =?us-ascii?Q?RsJQVE8xEThOGS95s7rD3t8u+SC3FgWJHpdsDTKACOnuT4yqsk29oQLoZq6L?=
 =?us-ascii?Q?qeXjVTKxDZiQLc1jrIP3BpA6dE7Q/FlkcWoUQDcQcNYzswNqU/iKOxgcQXES?=
 =?us-ascii?Q?FdwS6wFyi15K9HALkihFPDhBdUdcQCSfyqGQ0nRs8bZnGpPGQKpHPESzqAcx?=
 =?us-ascii?Q?GMDOckInl//rq3VsNW1CDyc4bRFpMDL4/zJGGo7J5EBqCgDaWbDBel8IG8Ms?=
 =?us-ascii?Q?/cdY/FeuVHIW5XX2dz71nwWH6CxAbqOS7F7hvUtp2YlZmMXsW2Q1ji/vi9hH?=
 =?us-ascii?Q?aBdXGls8xu7N1XGIcWXcK2v/RNlrviqPxvvjAFgw4AGHyqy/GEsC8j1I7/21?=
 =?us-ascii?Q?+CNBsEYk4HP/rCzenoknx69AXaDiA2mICJxyKqWpCSgRFpRWaqryjTIYpK7g?=
 =?us-ascii?Q?i2WhA6JeAVHGriW7D3zpnvEEPgrjVW9s3BjclUjSFmXAj8yf4W5hRqwCe04M?=
 =?us-ascii?Q?R1l2WVF4diBAPgvx4MUCEu7ufACM6+2WHvDTbSDRR8pxLZIFcwvjWCup/Y8R?=
 =?us-ascii?Q?Qw73E2QQq0yMrCRKX2Wb5k/e+WcQtV4Xk1pwWG3SaZZA8QzGeeLK5G+xYIEG?=
 =?us-ascii?Q?+/O7yWR0KZJduphGSsxjSd4jEpRSjkhQUjFcjOUaQgYsPAZN+OXB9WUZ/waD?=
 =?us-ascii?Q?Sfr6tBUX/dKNOMS81D3JHLs8DuweFRiB1Jd9oYzZOIalGq7WoTWLaxpKjwrU?=
 =?us-ascii?Q?D/bedpIeNMVRO46N1c9OO1EZu5GJGEbg37E2jasMRAX4RK3bG7zW793pUsvZ?=
 =?us-ascii?Q?AEP/y4xENGlNQ00TocaJvMzXbH5SnVSQW407+im03d/4fTY4rWRtMIYNgum0?=
 =?us-ascii?Q?J/OwGSpckDYyvZRQCD8hWBq40q3YRan7dkUAQP0MagMlU6zkAFpSvrBXOKaO?=
 =?us-ascii?Q?PpW1taCNPdXc2ye0WIQ2JuQtqRiB4Lf3StZh1UjuYdlP+v9txKuuWIuBILGX?=
 =?us-ascii?Q?fxNyqNh8FVRmM3cv4HYKVekaqXd6xHVbKIj06oVl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bd9c8e-43e4-43bf-75a2-08dd2e8899d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 19:30:38.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHY7hWG5/6+57O1EUVOcBYo+aaUF8XGD7fqMJ2tIRWeg7rwzQnxD2vNdjW5IUXGoDtqb3r/Tx/eqek4dy5aPJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

On Mon, Oct 28, 2024 at 06:03:18PM -0400, Frank Li wrote:
> Add audio-codec cs42888, enable esai0 and asrc0.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Shawn:

	Any comments for this patches?

Frank

>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 82 ++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index e983633a4bb31..31cf02275ca9e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -134,6 +134,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		enable-active-high;
>  	};
>
> +	reg_audio: regulator-audio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cs42888_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>  	reg_fec2_supply: regulator-fec2-nvcc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fec2_nvcc";
> @@ -223,6 +230,27 @@ simple-audio-card,codec {
>  		};
>  	};
>
> +	sound-cs42888 {
> +		compatible = "fsl,imx-audio-cs42888";
> +		model = "imx-cs42888";
> +		audio-cpu = <&esai0>;
> +		audio-codec = <&cs42888>;
> +		audio-asrc = <&asrc0>;
> +		audio-routing = "Line Out Jack", "AOUT1L",
> +				"Line Out Jack", "AOUT1R",
> +				"Line Out Jack", "AOUT2L",
> +				"Line Out Jack", "AOUT2R",
> +				"Line Out Jack", "AOUT3L",
> +				"Line Out Jack", "AOUT3R",
> +				"Line Out Jack", "AOUT4L",
> +				"Line Out Jack", "AOUT4R",
> +				"AIN1L", "Line In Jack",
> +				"AIN1R", "Line In Jack",
> +				"AIN2L", "Line In Jack",
> +				"AIN2R", "Line In Jack";
> +		status = "okay";
> +	};
> +
>  	sound-wm8960 {
>  		compatible = "fsl,imx-audio-wm8960";
>  		model = "wm8960-audio";
> @@ -301,12 +329,45 @@ pca6416: gpio@20 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	cs42888: audio-codec@48 {
> +		compatible = "cirrus,cs42888";
> +		reg = <0x48>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "mclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_cs42888_reset>;
> +		VA-supply = <&reg_audio>;
> +		VD-supply = <&reg_audio>;
> +		VLS-supply = <&reg_audio>;
> +		VLC-supply = <&reg_audio>;
> +		reset-gpios = <&lsio_gpio4 25 GPIO_ACTIVE_LOW>;
> +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
> +		status = "okay";
> +	};
>  };
>
>  &cm41_intmux {
>  	status = "okay";
>  };
>
> +&esai0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_esai0>;
> +	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +			  <&esai0_lpcg IMX_LPCG_CLK_4>;
> +	assigned-clock-parents = <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>;
> +	assigned-clock-rates = <0>, <786432000>, <49152000>, <12288000>, <49152000>;
> +	status = "okay";
> +};
> +
>  &hsio_phy {
>  	fsl,hsio-cfg = "pciea-pcieb-sata";
>  	fsl,refclk-pad-mode = "input";
> @@ -691,6 +752,12 @@ IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x0600004c
>  		>;
>  	};
>
> +	pinctrl_cs42888_reset: cs42888_resetgrp {
> +		fsl,pins = <
> +			IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
> +		>;
> +	};
> +
>  	pinctrl_i2c0: i2c0grp {
>  		fsl,pins = <
>  			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
> @@ -725,6 +792,21 @@ IMX8QM_M41_I2C0_SCL_M41_I2C0_SCL			0x0600004c
>  		>;
>  	};
>
> +	pinctrl_esai0: esai0grp {
> +		fsl,pins = <
> +			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
> +			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
> +			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
> +			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
> +			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
> +			IMX8QM_ESAI0_TX1_AUD_ESAI0_TX1				0xc6000040
> +			IMX8QM_ESAI0_TX2_RX3_AUD_ESAI0_TX2_RX3			0xc6000040
> +			IMX8QM_ESAI0_TX3_RX2_AUD_ESAI0_TX3_RX2			0xc6000040
> +			IMX8QM_ESAI0_TX4_RX1_AUD_ESAI0_TX4_RX1			0xc6000040
> +			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
> +		>;
> +	};
> +
>  	pinctrl_fec1: fec1grp {
>  		fsl,pins = <
>  			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000020
> --
> 2.34.1
>

Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057D446C18
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667915; cv=fail; b=FjEhBkMJ7dghchc8OLLwB/AUPz69NnfeX0hy3mAyfjxtNqPkB+B+4aNczHzkesPN7/bu7hmlHOMN96HKzfQytEEct6U/t4atS5sXhJx98rc2EAT8ugVFd1E3pv/DDepHG0lOQvJ99geg3wkC7jepwtVSDdtadK3/Xo3xy5Rij98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667915; c=relaxed/simple;
	bh=hv8qLnN6NoIG6/CFFDNhCmuhWLhXbF/SNsPUiKjOxpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n5QhoZ0fG6Yuya4GXzYExK+2rLQr/5MFQYx8FyIo02yJzFRy+rEyvu1R6QUVClFE+McB8QxAr8HcA0IvnKwe3x/ddrBkVv3fMKHW9fDOqP82jLqeKELADzTgBpmWOASv10fWnVMpF2yfk4H0PISijXG1+pQNq0Qs2FaxzIdHdko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mTN3Ac2V; arc=fail smtp.client-ip=52.101.83.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mTN3Ac2V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOJOIdgxQXx7N3Xe2lKio6ySyz2RgJexqqoecfn8ins1hrjN/l04OWHFERD3stiQ7blm67z+QPx42xcOF2eAXgOKlwkoo8GcXzTy/WkEZZ77VDnqSAslt6PKks6wT/A+eiHIIc2YRAblCwL5iyHiJKLvUT+VfNr+GuqsU1Fatz46GJg3ku6UEsX6tn1YKthEWhuWVGkIp/ZMOBJO6tIoLsMEKzFUBrlDhzXm/Oijby6jgxpDSb4v1WBapW4QBVYLHbVCybJHihGIExPG1bB5NUhOGg1SZg4lhFNjJc4ztQjK45AI5otSaqT9we7p8cJ1ecc1GKn4WQHeZIOyk3hbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQrVCh+aQ3FjXa6K4hPx0dVXeZkfDLmRGC2GxEZzb00=;
 b=kkgwGfAuT5d02Cqyx998B9QFY3e8lmsVM/2ChUH7XvguPVtkarxqpNO6Sf17pJ5MTxL7LaqF8fe7v1bvbttdf8xILhBel6K0gvCPt2qYGa4DplQB0y5TULzooRryqPpeN9qmzaHLZKciRYi2VP1a6bc+TFk6kVbE9ZwPiz9n4Bb+f4Vbr7oRVJ61BCoEznbynIzkmCTisyrh3DAGSsGQfKE0QYlxvADwHe1I3O4mVpZTO2tvs/xW+ZdSDoVVU0vaDWtI2zg9+CqsDNp9RlV4ggTXbnMT3rjw1l8/ZC6gQRTP8D47NDsJ24jovCm326peS1lDuRlN19B66GBXFku05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQrVCh+aQ3FjXa6K4hPx0dVXeZkfDLmRGC2GxEZzb00=;
 b=mTN3Ac2V30A5pYGHCd0vlamurIU9ocoaAxPKdMXONqCg+QSj/Kw9vrWsmZqBst+CReTlEBwv32itZZ4/76xbcx8IRuYhZW2nX8omukll9XUVczxzl8PFkozD7z1PbWzp8nWnmarxmlulTybAI7QPaJ/bwciaFZRxZxz6SPqNW6mJV1/i2pTHb9hirRR6kTt94JGbIqj3WkJutRzXWpfA0bgKcShx6OChjrD2Sj/XAL/tcVRdpIPQUQBWBs1l7G7qyyybTWEdu9qajn7G94qKVxq4ZQNKVboAiYT0h50WXEmrI+8iPamxFCaJeb56WIs0ft+kgEHvCsNbd2tuwnaJtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11595.eurprd04.prod.outlook.com (2603:10a6:150:2c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:25:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 14:25:09 +0000
Date: Tue, 25 Aug 2026 09:25:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, elena.popa@nxp.com,
	cosmin.stoica@nxp.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
Message-ID: <ao2lvM8NCV3XmArL@SMW015318>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
 <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SN7PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:806:125::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11595:EE_
X-MS-Office365-Filtering-Correlation-Id: 9449793c-57b6-451c-793c-08df02b4aac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	F5qowynDY7xL4V/OryQKyrupQf2plujk3J6Q8bH02rpmcQnOZGMiKN/KJB52/amjBvhyqU41GMMSaKPgnplp2rIniQg1A0vWunxtPSdAM/DjSgIonn7kOY0bJeyjjvTtA/re/nSmKVoyr2b1MY/h8LNbJHGK/LLlsFw+8+b2VX3fokhPVmn47GeBgRkKtNsiUja4q9RG+jR0olhpyJ9QaOGB7Blr2/gR+iDECvbdagNMChIrGaAxsI1BDYVev7pVi2QFdjQiQx5rDuVNA0XmwuIRDoO1CBd/T5uU7JRB3xo9G03VfOdy5KiJuOhgu1yotdSS2/epsjHBCbnZQ2v+xET3WAZMBuyt4ElZ8OKQY3J8uazWi2gMY4rAcamLd9iW1xRUSDkx3L27nTIaDFMafMuBz7yX3Iw/9I66MA4tcJWM14cxqCV6wFsJy1YIVjkoIqovRlhO3F24ydnyUKIvVmFUzcyK7bkfZXM83RXIrRKvViPNUlPaHgytkX1BzEBuN916eSzjSGJsdgG0R+O4oBF6bX5aBJSFlgXQW44dh0D/1JMsvj/x+YsTrqkSZJVNuvLr+bVC1pF5YeLWssbLwIqiRaBZ1QjUS7NWrlA39bPmhVY59ZacYjAitVLQLfoXdKLmWnlivNHAjdUQLdcTY1KYENHmjX6wkDYc6E7BEhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TUvpxrGcjABMz+UYAU8Vz3dgSRpcIadz7f/P7i7Y7vCsxXVGCOC4+lRFx+ll?=
 =?us-ascii?Q?UsPKa25dHDK/DOi8xMQaCfdg38yV6uNTD+maevLg1/QdrEhh+kWI+hWdBJLB?=
 =?us-ascii?Q?m7SiM2islsVv8E4EVxmLp7u9Bd4C1//q/hOhbYpyLPnV4jbc2EApjdnu14MW?=
 =?us-ascii?Q?JxVdJTfYvnpgIUg6oTluLUJXcVochNvNrL/XaJDdGbrkNFB23eQpYxwRWoC9?=
 =?us-ascii?Q?RhlmQIrPp9I0LZdk7hZ7h36kAJagICjIzUL9JMp14/n9due3y6+7iStOIHsB?=
 =?us-ascii?Q?F+/XMSgVlcD2tUlr3btzNqQib2bkpM08XUfJ84thA5XoIDyslWKsDVkUOnH2?=
 =?us-ascii?Q?c95qGM7l3tChHq35CZg8ovTKvnFzU1B8zSWbSus3ogfJkQ1tNZKGunElgLpP?=
 =?us-ascii?Q?w7HA36yAA8iTPz+WTskClDCrut/enRpKcIBgygYPRqAftY+aABpIC286YoVp?=
 =?us-ascii?Q?JTtcjpyrhfj/Qpr75hzOFJUBZzuoIBew+fU1GXIlOrghc9ovHedZ7HDGnvOK?=
 =?us-ascii?Q?vTOvE/7L7yueUCszF+kzebadjbTcS1gxuF9WEzeyPLmVcx7HxoP7Jt4ZHXVY?=
 =?us-ascii?Q?nZRlmCoxpGEyMjOJ0AVaVhihblNXRdzO1H7k1r1a8D38EkVPHXDVWI6O85mg?=
 =?us-ascii?Q?0pr8nhdDvOlCD9fuRqhdo7TLIWsISoguBEpFYwKoB1sK1HHuejfLU/TrzZql?=
 =?us-ascii?Q?NCLKGbm+3XKeTInpQlqoshRWlZo3dIQdrNNHtTjHEuZ9nYWuim3CPJ6V/Q0N?=
 =?us-ascii?Q?Bik0PkA/j6zIPvaLHlChuZjrin3mX3T9Jd06dnLRKIzuw/2DJTmnTL9idWGs?=
 =?us-ascii?Q?ByW57CdOB4tdcy0xTyFSZb5QauCEOPnXad1IpN2WuurURGRfk4G2ZUM4Ymru?=
 =?us-ascii?Q?Kvz4/Rx+/cyE0yzF7ihv2AlJ1DFQ3IQoqmrgEJ2iv0KK/V9ltEok+LuByAWa?=
 =?us-ascii?Q?S3oACNo158qfrdGkb4XB3NoTEDcbL3g7CrKb0n6JInf5pB4bWw56GFgmUSeX?=
 =?us-ascii?Q?QzYy9+5A6jo9d4/xaD1orNFjVfq/BUDsZc0VL71c+l8RB1zNJZ6jokodoAr+?=
 =?us-ascii?Q?G41eDsyMzqli4dhFGUF4zeRVubLahrDxmZYhNWYw7I8yKkz/PkFBavtZ6FqJ?=
 =?us-ascii?Q?J4qLfdtLt8hzQzMU6tj5J0JSFaTCtbTj/mPJNTmzBqe45hMp7ySFgWzF5iJC?=
 =?us-ascii?Q?CiQ08BgdPZih1TFVykWiyPXugGix6y2zLDNMUlE+wgJSwRouv/uQxJtX3/83?=
 =?us-ascii?Q?GEPVaRvzwGceHXTNKLSFFVh6E9/yEbkkYDv7CGQgHTgrS5Ku0TOZQ5RsX2U1?=
 =?us-ascii?Q?WfqGIsSqJlh25VRS9Bwo+dfA54Oxp3CXPlQMzeNE/rvwIeqIZBPH1LK5BMEl?=
 =?us-ascii?Q?hq71Vdc12RxpQV1ivt+vGd7bHuF7GNhRN6DKs7emVbPVfPiFLHO6C3W0XGUd?=
 =?us-ascii?Q?PY1/sw2Z5yJHC5DY3mQjGZ9NdEHPRebZA0rftTZGYHHHuf21Igu7le0CWjHd?=
 =?us-ascii?Q?yD85E9bhWmBdcr4FxMiNzC0wnCnbyPiMMipk1eN58K6YaQJA9QT8STc8VZdI?=
 =?us-ascii?Q?Yx1ES6YMPemdY4+5+JWYs3QNJjiGfsuqYykBouFfA5Ldfph/7wd/lBgzoeqz?=
 =?us-ascii?Q?m+ODgRcP2nyOxwQgJ8J0ND1vWFmhvRg2SaY0fxENJ0UQvPtdG50H1aryAH4U?=
 =?us-ascii?Q?w5mjFmuj1/JAY4sF5qT4QocoWM8PJPhnHsYDIM77q5hUCEImrxc1Tldde0jf?=
 =?us-ascii?Q?J+Ef1u2/j0Scyd+4pu5hA/nBhk280KheWnkXWQWKJAZsx2nlaHxw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9449793c-57b6-451c-793c-08df02b4aac8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:25:09.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjGUqcmHHIQMs2Rc+IJi7UOe++pnJ3F/Gq59hGe+qZys5ppR69TW2V8sq86skeZPlMZQGsVnpYPnheDxof4RQaVOw5216DeTgcAKHtuTSbJu+X/uWJuEVs2po+bbRcnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11595

On Tue, Aug 25, 2026 at 05:08:12AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
>
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * up to 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
>
> The support targets revision B of the board.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |   1 +
>  arch/arm64/boot/dts/freescale/imx95-navq.dts | 267 +++++++++++++++++++
>  2 files changed, 268 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf..4c5ef83cd857 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -712,6 +712,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
> new file mode 100644
> index 000000000000..f7ddc39f9b21
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95.dtsi"
> +
> +/ {
> +	model = "NXP MR-NAVQ95";
> +	compatible = "fsl,imx95-navq", "fsl,imx95";
> +
> +	aliases {
> +		ethernet0 = &enetc_port0;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		serial0 = &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VDD_SD2_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <12000>;
> +	};
> +};
> +
> +&edma1 {
> +	/* owned by M7 */
> +	status = "reserved";
> +};
> +
> +&edma2 {
> +	/* channels 30-63 owned by M7 */
> +	dma-channels = <30>;
> +};
> +
> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&lpi2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	i2c3_gpio_expander_21: gpio-expander@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
> +	};
> +};
> +
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&netc_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <1>;
> +		reset-gpios = <&i2c3_gpio_expander_21 1 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +		realtek,clkout-disable;
> +	};
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x57e
> +			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
> +		>;
> +	};
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3         0x57e
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2         0x57e
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1         0x57e
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0         0x57e
> +			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL   0x57e
> +			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK      0x58e
> +			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL   0x57e
> +			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK      0x58e
> +			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0         0x57e
> +			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1         0x57e
> +			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2         0x57e
> +			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3         0x57e
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio_expander_21: i2c3gpioexpander21grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET2_RD3__GPIO4_IO_BIT27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
> +			IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
> +			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};

if the value is the same  100mzh, 200mzh and default

Needn't duplicate it.

Just
     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
     pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
     pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
     pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;

Frank
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc1>;
> +	bus-width = <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> --
> 2.53.0
>
>

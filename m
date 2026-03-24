Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF44376465
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368887; cv=fail; b=ufOM7SfpzSywPXe4+WAA1L1zrjfegMJuqOBec8iqic8GtwevuH7pJw0IC0CPYe6MPGPOhSlVMZY0w5mBSY2hzaCK4vLa9ZxdcWJ3VMPf8RmKr/EfTr17d8Yrsif9ifH+tGzmhpl8b2BhskM0BTdw5G5ZJdN6mF4ClLdqIXDT5t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368887; c=relaxed/simple;
	bh=IupwLtTZSzCKdi9EBmVZa3wyy1uxHK6YdqafxJWqlMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G+IRFJuwUv1ZGoKGajFCF2GEqw11jj+KNeVTt1Mzw0eCud2J7t/XcSt+DqmYUP+IbxZqEo7/HkE5u9gpheeJXymTaeibLy3j50auZtiCY22XF2K5wVHtl8s8WGCkJfISA2iEgag3F+e+broRzsRc/NBck6dEhb5GkoKheqdpIFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lkp8t7eW; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lkp8t7eW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUom0rwu6fJpxSSBMiFw9kEcw1XRq8b83CuSEbGYcdLhlk/lKJYix12+PNm8j8ph9y6crWzMW38XJVsO79hNWXDFJYiTjBUay4ZyI2Z33ob6ux+vSeVTbXRJ7/8+zDiO6Ep6C066/lR/CCBDUaxURPETIw158IdPVfQk0Amh2HNKCnJi7bXuWAGEcUGt/2qSyybi1OiDsm3O2FGDL0hGABufzeTfwOtKUdwJzVrGnnTiIJPFx+5i4Sqt7lyv7c1eXVnaut187ZcuTnxtDuUVp/Jzy450eMaRU1h822POv0W5YJG4qoShJSrWVZR4452ZagqWqJhNu9SnJAoy99QJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2K2GjsRwxLUkGBRkDkCHfn9fAMvbwOwhOjBpAp55y8=;
 b=zPS6QC/wv3X+hu+8tbN2Fnu/q5VfACZi2+zULTxMKqRh4xu0IGe7K21P8QQr2DL9NE+1Xzdj4WE/lJBEDjn+ItiOHK8QrfZG+i9qVt6DGk8EC7RCPrjWzTJ9bAvGgEj2+fvJaRYEnedlsddyHURf61e9SKuS+WrFq8Ppk8uvM8KqlpVxu6KnlnewQCRXf5gutcwBkmXSklo6j8G5u9021kypJ1PjMzcm5VhVCDMWhgrHALsLjNyazu4/HMntlTcb3dtlgyUgJVzHD3o5QGtK3dXfpX/ln2LnD5rKbCboa7KlF+n8VWcqfjI0aWcdH/E/QisTUFoUEWz1cucTXRX8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2K2GjsRwxLUkGBRkDkCHfn9fAMvbwOwhOjBpAp55y8=;
 b=Lkp8t7eWHU5CeMPHtsw6om1yObP2cwl5duaH0ue+5SAif0NbhoXHefdKnHjPV196pl5vzJEeD5GDkU5PN4X9jHDGz2f/bHibeYOd2rr/icSKS53StPSI6GrDgASLIQouM1IgIF9PTu29m/1ijW/KolcdzQw5A4iD07lyrMI4wupDzYNZzDj+COw6AIlxuttKY09LoNKbPFM+jmM2Me6VILh5TkOhFc4WTVQiTD0Hk3o8aIIYeZReMb/bCeVWw3rE3oxFfd3j3JIpC0dZqwHai/shanx4DD2Q3UPYaa+SfngDALVn0hOCjb+NezZ7mO8sMLJFGacp9JyZxKBQ8WApag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMDPR04MB11617.eurprd04.prod.outlook.com (2603:10a6:20b:71d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:14:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 16:14:33 +0000
Date: Tue, 24 Mar 2026 12:14:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] arm64: dts: freescale: Add Verdin iMX95 support
Message-ID: <acK4awcokUyCHrG5@lizhi-Precision-Tower-5810>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
 <20260313-verdin-imx95-upstream-frank-li-base-v2-2-bd488be7c699@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-2-bd488be7c699@toradex.com>
X-ClientProxiedBy: SA1P222CA0051.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMDPR04MB11617:EE_
X-MS-Office365-Filtering-Correlation-Id: dd528d1f-1547-4371-dec0-08de89c06fbc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|38350700014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 ZdtoTE4JlTqvrgq84aZCLWp2dVxF7bcnakSalF59eSe7kpt1cjPz3IuERLq1bLDK3zKWGZqGPGUZSMqqyulj/XQjHh+edxcgkbIWIDSubC9okxG9dOrRrVucxCTcfMeqkUOWoSH/ZHwpmxeboGffq3q1ZcZzpfaxdeQHYTjUhgYkaKRUo5vmFXuVHejyEmotz6p/64aoGfXyBoD2/oJvijcEmXlsi7jNhIJs3qWvFpuzqwBOYXL6r0sbif1Wqa8elYnMzzqed2YLwO8+5Czxsl1j6SBs7YD8YzRUFoMDiHO525RjUDzKxPd7v8x6Az0zRic6zk0sclsgU0t2kZwmU490QYP7Pj46QZtKylVMXfWvx1tp5yP82gSLpUkng6WdaG2ZtwVqg47cjG0jyusFPC9GPydS/++W30b/JZvU9cKOyD5AY3Q28hD7tM2P3eIwJcuOJTYvV4HaPYoIIltiHIAyhwFdhkHsdM40RDhdamE44JhpgOs30fgZ03w9ez7mkIxXRTF1P+5LXtxdKeTB+E//2aRu7KkQqbH6rET6fxGIBjhFnpGib2SgFEdtheGBmu/gTVOkuLEgW/3Zs0fLfOr+nrA+k3KatMIgK1jBzBBMurNK70ErfWvSZMCroE9Btax4KpSrebBcSWyYhC5GXhRUgJaXJutmt+1t8d7o8kIN8ii6YIB+JzohkVErQFSew108qt4zYX9HI2Sy1OU0MlS3myIULqWbu7MQaCCNSCBy4nJHe3b/RYtMjWYzeE6jc295BZvsrdtru6a1wrCkn8wIT9P8hl0cuJksYBg//9k=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(38350700014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xY/1ZV9U0XcfDm3ix0ia6xYbH9eLyd01Al5CIa+3BM/c8XighXAmUmVDGCda?=
 =?us-ascii?Q?tpXNJZzH7nFQSHne6nJDzn+xA2MfIFN+XrI9efKvtGNVeAocz9inNB/a2Iz/?=
 =?us-ascii?Q?XKRRVX+Gt3lx1ZIufxlBCe7U0RSxasBLe0waAR1IzCbAW0CsJ/N0r7XSW5QR?=
 =?us-ascii?Q?UTM2TGF2gOh2SWhV7M1bXDDCcDdst/kDsTbAthToS+Zn6iG839HAKIKzVeUo?=
 =?us-ascii?Q?q0NV8BS+Troes2xjGP9v0H9sigxJTxoiL+b4rSyJtceNyqH827f32zGeZsr8?=
 =?us-ascii?Q?aPh6BiODIoXPifv3B2Otf1QoBX5yANZ20V3DeJgm21SUy7VtmDRwePGez8hM?=
 =?us-ascii?Q?oZWiOJimbyMt9NcjBLyzKrIGZBjGI/O8YwdVWy9Fqu7+hkXs2V8TTf01J7DW?=
 =?us-ascii?Q?8SmIwb+VmEyYLrQWasyfipd1Tyqa3KFYHVyjyIwbPFYVY4llBQLNvSGXUFoB?=
 =?us-ascii?Q?Mo5bwRzD3uTMmY3y1CS4hSoTahbaIUSXPDUQLGDzF5OJXkH2p/RWdEGJEIyP?=
 =?us-ascii?Q?uSw3g558twxF39mHBXEFYq7+ubdAvyKaECwXFNN6TZdmzvRgLx1950uvTvaE?=
 =?us-ascii?Q?1Zjo0AUXbtuyVVDotfMYHK716iiq7HpgQistthjKjN/YKztXEjYcE44OwIk1?=
 =?us-ascii?Q?80g9kTR2yuzR//BtETkrFgHAZJ3Luc+b6INOvjetuUEHMeuKjr0s0kTlP69e?=
 =?us-ascii?Q?UeNbkqZcgiOeR52Bvl5b9yYuh+PjGH/RL2laenqPBwmgV7uaKXDMKiVrfwNM?=
 =?us-ascii?Q?zRepxOKS/xt/zo01jxmGbuyxR5fPd32nc2kr66G5a7j2wi8jCqd4TR4EsUZP?=
 =?us-ascii?Q?j5l5bh3lFbjG9V2gTlEj1sMHqnz8Y9boR4GaHmUoMLS0lUqZiTWk2Nr1mQFm?=
 =?us-ascii?Q?InKJMrc22XAlZHxZKsosdoZZPeHzQweKCLQaURuHh08213nPJLmX4SxjxfyS?=
 =?us-ascii?Q?WLfLWocVlwcgwfyvN3m9Ms+1s6tTq68JJAjVfGcqfVHm7EN1mIUhfAz0sLhu?=
 =?us-ascii?Q?OszFGlv7o2frj78KNxUdnFkw6WwLiIE+s9cY8HXjO6SXiCLZH1P+/LGaAAZ3?=
 =?us-ascii?Q?+0rB9ifaAgvhfCCGKi7+yp+uyhYGc+npAeDimaXi6qM3g39uPi20BQcMZXOv?=
 =?us-ascii?Q?EHCMZKAIRFcX0Ggv6cSDsQ6cAl1M/nEjrwh5tG9tNO8o5bju7ggBSarIMFJG?=
 =?us-ascii?Q?oerFVqZNjHHkz/Whn1JLGvJatv/YXwpX0tJOsBXE/bulL9+2gvYKMRUi1Vg5?=
 =?us-ascii?Q?rHR9fIK9+bP5jMeINZc5JZse44JTEPRtxdhyUqijUI9xV4azKxSh4FC+6EGC?=
 =?us-ascii?Q?r0qbwS9up6KkE5Gw2u7qGJeCkYawH2mcpgRMWviS1scoERh4S9aOO2sEBExL?=
 =?us-ascii?Q?n7M3KOtj3FPW0YQyXfKT9b5tSru6bX36k9I0tBMKhbBIFmpqSEYH76zOPBw4?=
 =?us-ascii?Q?QySB0xssA+FRRjDbVJXr/n3tJ+ww4iiv1wAjHMbjSyAO1qV9o7fc6lfYPyb/?=
 =?us-ascii?Q?tGkuDyt/0b4qZjsDyNTrJ9MDbsE6jaBnnUpO3BfqosInLVoGaMXz6smTHQpH?=
 =?us-ascii?Q?DX+PezVzIp6rcDO8ZtCtqHBJnc6LPOECsMxg/9v6bUM/Le1i0FckpA0oK54R?=
 =?us-ascii?Q?7bGDHLc/PkbS9E0T7qSH+QZJjkVy2/FGHXImJqBFsZoQHhLPzNYzIy8tC1uf?=
 =?us-ascii?Q?MRimbbr14cerxah2qqfuUMxiBDSpgkaGL5xc72gUMyZPUdlIuZDEAXnVDHMI?=
 =?us-ascii?Q?nMID4JHZww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd528d1f-1547-4371-dec0-08de89c06fbc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:14:33.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRovOdDR30nSMt3e7yB6zFjxHYdzYzk+KophjZ9TzHTCnJZnLSnuVslFYywo4iumZEgJ7S2gzv8fxDoruv/iPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11617

On Fri, Mar 13, 2026 at 09:57:43AM +0100, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Add support for the Toradex Verdin iMX95 and its development carrier
> board.
>
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
> I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
> interface, one LVDS interface (one or two channels), and some optional
> addons: TPM 2.0, and a WiFi/BT module.
>
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> v2: Reordered nodes alphanumerically by node name
> v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-2-823fad02def9@toradex.com/
> ---
> +
> +/* Verdin UART_1, connector X50 through RS485 transceiver */
> +&lpuart7 {
> +	rs485-rts-active-low;
> +	rs485-rx-during-tx;
> +	linux,rs485-enabled-at-boot-time;
> +

Nit: needn't empty line between status and other property, suggest run
https://github.com/lznuaa/dt-format to speed up process.

Frank
> +	status = "okay";
> +};
> +
> +/* Verdin UART_2 */
> +&lpuart8 {
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	ethphy2: ethernet-phy@7 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <7>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +		micrel,led-mode = <0>;
> +	};
> +};
> +
> +/* Verdin PCIE_1 */
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +/* Verdin I2S_1 */
> +&sai3 {
> +	status = "okay";
> +};
> +
> +/* Verdin PWM_1 */
> +&tpm4 {
> +	status = "okay";
> +};
> +
> +/* Verdin PWM_2 */
> +&tpm5 {
> +	status = "okay";
> +};
> +
> +/* Verdin PWM_3_DSI */
> +&tpm6 {
> +	status = "okay";
> +};
> +
> +/* Verdin USB_1 */
> +&usb2 {
> +	status = "okay";
> +};
> +
> +/* Verdin USB_2 */
> +&usb3 {
> +	fsl,permanently-attached;
> +
> +	status = "okay";
> +};
> +
> +&usb3_phy {
> +	status = "okay";
> +};
> +
> +/* Verdin SD_1 */
> +&usdhc2 {
> +	status = "okay";
> +};
> +
> +/* Verdin CTRL_WAKE1_MICO# */
> +&verdin_gpio_keys {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dts
> new file mode 100644
> index 000000000000..97636ec7c26a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> + * https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95-verdin.dtsi"
> +#include "imx95-verdin-nonwifi.dtsi"
> +#include "imx95-verdin-dev.dtsi"
> +
> +/ {
> +	model = "Toradex Verdin iMX95 on Verdin Development Board";
> +	compatible = "toradex,verdin-imx95-nonwifi-dev",
> +		     "toradex,verdin-imx95-nonwifi",
> +		     "toradex,verdin-imx95",
> +		     "fsl,imx95";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi.dtsi
> new file mode 100644
> index 000000000000..7aba22067de5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Common dtsi for Verdin iMX95 SoM non-WB variant
> + *
> + * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> + */
> +
> +/* SDIO on MSP 30, 31, 32, 33, 34, 35 */
> +&usdhc3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dts
> new file mode 100644
> index 000000000000..345d37247025
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> + * https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95-verdin.dtsi"
> +#include "imx95-verdin-wifi.dtsi"
> +#include "imx95-verdin-dev.dtsi"
> +
> +/ {
> +	model = "Toradex Verdin iMX95 WB on Verdin Development Board";
> +	compatible = "toradex,verdin-imx95-wifi-dev",
> +		     "toradex,verdin-imx95-wifi",
> +		     "toradex,verdin-imx95",
> +		     "fsl,imx95";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi.dtsi
> new file mode 100644
> index 000000000000..256c9ed04605
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi.dtsi
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Common dtsi for Verdin iMX95 SoM WB variant
> + *
> + * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> + */
> +
> +/ {
> +	reg_wifi_en: regulator-wifi-en {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_wifi_pwr_en>;
> +		/* PMIC_EN_WIFI */
> +		gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "PDn_MAYA-W260";
> +		startup-delay-us = <2000>;
> +	};
> +};
> +
> +/* On-module Bluetooth */
> +&lpuart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_bt_uart>;
> +	uart-has-rtscts;
> +
> +	status = "okay";
> +
> +	som_bt: bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +		fw-init-baudrate = <3000000>;
> +	};
> +};
> +
> +/* On-module Wi-Fi */
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	vmmc-supply = <&reg_wifi_en>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
> new file mode 100644
> index 000000000000..d3737956e2f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
> @@ -0,0 +1,1162 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Common dtsi for Verdin iMX95 SoM
> + *
> + * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> + */
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "imx95.dtsi"
> +
> +/ {
> +	aliases {
> +		can0 = &flexcan1;
> +		can1 = &flexcan2;
> +		eeprom0 = &som_eeprom;
> +		ethernet0 = &enetc_port0;
> +		ethernet1 = &enetc_port1;
> +		i2c0 = &lpi2c2;
> +		i2c1 = &lpi2c4;
> +		i2c2 = &lpi2c3;
> +		i2c3 = &i3c2;
> +		i2c4 = &lpi2c5;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
> +		rtc0 = &rtc_i2c;
> +		rtc1 = &scmi_bbm;
> +		serial0 = &lpuart7;
> +		serial1 = &lpuart8;
> +		serial2 = &lpuart1;
> +		serial3 = &lpuart2;
> +		serial4 = &lpuart6;
> +		usb0 = &usb2;
> +		usb1 = &usb3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	connector {
> +		compatible = "gpio-usb-b-connector", "usb-b-connector";
> +		/* Verdin USB_1_ID (SODIMM 161) */
> +		id-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
> +		label = "USB_1";
> +		self-powered;
> +		vbus-supply = <&reg_usb1_vbus>;
> +
> +		port {
> +			usb_dr_connector: endpoint {
> +				remote-endpoint = <&usb1_id>;
> +			};
> +		};
> +	};
> +
> +	verdin_gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ctrl_wake1_mico>;
> +
> +		status = "disabled";
> +
> +		verdin_key_wakeup: key-wakeup {
> +			/* Verdin CTRL_WAKE1_MICO# (SODIMM 252) */
> +			gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +			label = "Wake-Up";
> +			linux,code = <KEY_WAKEUP>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "On-module +V1.8";
> +	};
> +
> +	/*
> +	 * By default we enable CTRL_SLEEP_MOCI#, this is required to have
> +	 * peripherals on the carrier board powered.
> +	 * If more granularity or power saving is required this can be disabled
> +	 * in the carrier board device tree files.
> +	 */
> +	reg_force_sleep_moci: regulator-force-sleep-moci {
> +		compatible = "regulator-fixed";
> +		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
> +		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-name = "CTRL_SLEEP_MOCI#";
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		/* Verdin USB_1_EN (SODIMM 155) */
> +		gpios = <&som_gpio_expander 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-name = "USB_1_EN";
> +	};
> +
> +	reg_usb2_vbus: regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		/* Verdin USB_2_EN (SODIMM 185) */
> +		gpios = <&som_gpio_expander 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-name = "USB_2_EN";
> +	};
> +
> +	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
> +		compatible = "regulator-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usdhc2_vsel>;
> +		gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <1800000>;
> +		states = <1800000 0x1>,
> +			 <3300000 0x0>;
> +		regulator-name = "PMIC_SD2_VSEL";
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usdhc2_pwr_en>;
> +		/* Verdin SD_1_PWR_EN (SODIMM 76) */
> +		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <100000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "SD_1_PWR_EN";
> +		startup-delay-us = <20000>;
> +	};
> +
> +	cm7: remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu7 0 1
> +			  &mu7 1 1
> +			  &mu7 3 1>;
> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux_cma: linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0 0x3c000000>;
> +			alloc-ranges = <0 0x80000000 0 0x7F000000>;
> +			linux,cma-default;
> +		};
> +
> +		m7_reserved: memory@80000000 {
> +			reg = <0 0x80000000 0 0x1000000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@88010000 {
> +			reg = <0 0x88010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@88018000 {
> +			reg = <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
> +&adc1 {
> +	vref-supply = <&reg_1p8v>;
> +};
> +
> +/* Verdin ETH_1 (On-module PHY) */
> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +};
> +
> +/* Verdin ETH_2_RGMII */
> +&enetc_port1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc1>;
> +};
> +
> +/* Verdin CAN_1 */
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +};
> +
> +/* Verdin CAN_2 */
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +};
> +
> +/* Verdin QSPI_1 */
> +&flexspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexspi1>;
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"", /* 0 */
> +		"",
> +		"",
> +		"",
> +		"SODIMM_147",
> +		"SODIMM_149",
> +		"SODIMM_151",
> +		"SODIMM_153",
> +		"SODIMM_20",
> +		"SODIMM_22",
> +		"SODIMM_252", /* 10 */
> +		"",
> +		"SODIMM_189",
> +		"IO_EXP_INT",
> +		"SODIMM_256",
> +		"";
> +
> +	status = "okay";
> +};
> +
> +&gpio2 {
> +	gpio-line-names =
> +		"SODIMM_206", /* 0 */
> +		"SODIMM_198",
> +		"SODIMM_200",
> +		"SODIMM_196",
> +		"",
> +		"SODIMM_15",
> +		"SODIMM_16",
> +		"",
> +		"SODIMM_131",
> +		"SODIMM_129",
> +		"SODIMM_135", /* 10 */
> +		"SODIMM_133",
> +		"SODIMM_139",
> +		"SODIMM_137",
> +		"SODIMM_143",
> +		"SODIMM_141",
> +		"SODIMM_30",
> +		"SODIMM_38",
> +		"SODIMM_208",
> +		"SODIMM_19",
> +		"SODIMM_36", /* 20 */
> +		"SODIMM_34",
> +		"SODIMM_93",
> +		"SODIMM_95",
> +		"SODIMM_210",
> +		"SODIMM_24",
> +		"SODIMM_32",
> +		"SODIMM_26",
> +		"SODIMM_53",
> +		"SODIMM_55",
> +		"SODIMM_12", /* 30 */
> +		"SODIMM_14";
> +};
> +
> +&gpio3 {
> +	gpio-line-names =
> +		"SODIMM_84", /* 0 */
> +		"SODIMM_78",
> +		"SODIMM_74",
> +		"SODIMM_80",
> +		"SODIMM_82",
> +		"SODIMM_70",
> +		"SODIMM_72",
> +		"SODIMM_76",
> +		"",
> +		"",
> +		"", /* 10 */
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"PMIC_SD2_VSEL",
> +		"", /* 20 */
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"SODIMM_91",
> +		"SODIMM_218",
> +		"",
> +		"",
> +		"", /* 30 */
> +		"";
> +};
> +
> +&gpio4 {
> +	gpio-line-names =
> +		"SODIMM_59", /* 0 */
> +		"SODIMM_57",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"", /* 10 */
> +		"",
> +		"",
> +		"",
> +		"SODIMM_193",
> +		"SODIMM_191",
> +		"SODIMM_215",
> +		"SODIMM_217",
> +		"SODIMM_219",
> +		"SODIMM_221",
> +		"SODIMM_211", /* 20 */
> +		"SODIMM_213",
> +		"SODIMM_199",
> +		"SODIMM_197",
> +		"SODIMM_201",
> +		"SODIMM_203",
> +		"SODIMM_205",
> +		"SODIMM_207",
> +		"SODIMM_216",
> +		"SODIMM_202";
> +};
> +
> +&gpio5 {
> +	gpio-line-names =
> +		"SODIMM_56", /* 0 */
> +		"SODIMM_58",
> +		"SODIMM_60",
> +		"SODIMM_62",
> +		"SODIMM_46",
> +		"SODIMM_44",
> +		"SODIMM_42",
> +		"SODIMM_48",
> +		"SODIMM_66",
> +		"SODIMM_52",
> +		"SODIMM_54", /* 10 */
> +		"SODIMM_64",
> +		"SODIMM_212",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"";
> +};
> +
> +/* Verdin I2C_3_HDMI */
> +&i3c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i3c2>;
> +	i2c-scl-hz = <400000>;
> +};
> +
> +/* CTRL_I2C (On-module I2C) */
> +&lpi2c2 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c2>, <&pinctrl_io_exp_int>;
> +	pinctrl-1 = <&pinctrl_lpi2c2_gpio>, <&pinctrl_io_exp_int>;
> +	clock-frequency = <400000>;
> +	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
> +
> +	status = "okay";
> +
> +	som_gpio_expander: gpio@20 {
> +		compatible = "nxp,pcal6416";
> +		reg = <0x20>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +
> +		gpio-line-names =
> +			"SODIMM_220", /* 0 */
> +			"SODIMM_222",
> +			"SODIMM_17",
> +			"SODIMM_21",
> +			"SODIMM_244",
> +			"SODIMM_161",
> +			"SODIMM_157",
> +			"SODIMM_155",
> +			"SODIMM_185",
> +			"SODIMM_187",
> +			"USB_RECOV_CTRL#", /* 10 */
> +			"ENET1_INT#",
> +			"TPM_INT#",
> +			"TPM_CS#",
> +			"",
> +			"";
> +
> +		/*
> +		 * Switch USB to default position:
> +		 *   - SoC USB2 -> Verdin USB_1
> +		 *   - SoC USB1 -> Verdin USB_2
> +		 * Reset configuration:
> +		 *   - SoC USB1 -> Verdin USB_1 (USB recovery)
> +		 *   - SoC USB2 not connected
> +		 */
> +		usb_recov_ctrl: usb-recov-ctrl-hog {
> +			gpio-hog;
> +			gpios = <10 GPIO_ACTIVE_HIGH>;
> +			line-name = "USB_RECOV_CTRL#";
> +			output-high;
> +		};
> +	};
> +
> +	rtc_i2c: rtc@32 {
> +		compatible = "epson,rx8130";
> +		reg = <0x32>;
> +	};
> +
> +	temperature-sensor@48 {
> +		compatible = "ti,tmp1075";
> +		reg = <0x48>;
> +	};
> +
> +	som_eeprom: eeprom@50 {
> +		compatible = "st,24c02", "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +/* Verdin I2C_2_DSI */
> +&lpi2c3 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
> +	clock-frequency = <100000>;
> +	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
> +};
> +
> +/* Verdin I2C_1 */
> +&lpi2c4 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c4>;
> +	pinctrl-1 = <&pinctrl_lpi2c4_gpio>;
> +	clock-frequency = <100000>;
> +	scl-gpios = <&gpio2 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
> +};
> +
> +/* Verdin I2C_4_CSI */
> +&lpi2c5 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c5>;
> +	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
> +	clock-frequency = <100000>;
> +	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
> +};
> +
> +/* Verdin SPI_1 */
> +&lpspi6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi6>, <&pinctrl_spi1_cs>;
> +	cs-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>,
> +		   <&som_gpio_expander 13 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +
> +	som_tpm: tpm@1 {
> +		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +		reg = <0x1>;
> +		interrupt-parent = <&som_gpio_expander>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		/*
> +		 * Maximum TPM-supported speed is 18.5 MHz, limited to 12 MHz
> +		 * here as lpspi6's per-clock (twice the max speed) is 24 MHz
> +		 */
> +		spi-max-frequency = <12000000>;
> +	};
> +};
> +
> +/* Verdin UART_3, used as the Linux console */
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +};
> +
> +/* Verdin UART_4 */
> +&lpuart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +};
> +
> +/* Verdin UART_1 */
> +&lpuart7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart7>;
> +	uart-has-rtscts;
> +};
> +
> +/* Verdin UART_2 */
> +&lpuart8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart8>;
> +	uart-has-rtscts;
> +};
> +
> +&mu7 {
> +	status = "okay";
> +};
> +
> +&netc_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_bus0 {
> +	msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> +		  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> +		  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> +		  <0x40 &its 0x63 0x1>, //ENETC1 PF
> +		  <0x50 &its 0x65 0x1>, //ENETC1 VF0
> +		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
> +		  <0x80 &its 0x64 0x1>, //ENETC2 PF
> +		  <0xc0 &its 0x67 0x1>; //NETC Timer
> +	iommu-map = <0x0 &smmu 0x20 0x1>,
> +		    <0x10 &smmu 0x21 0x1>,
> +		    <0x20 &smmu 0x22 0x1>,
> +		    <0x40 &smmu 0x23 0x1>,
> +		    <0x50 &smmu 0x25 0x1>,
> +		    <0x60 &smmu 0x26 0x1>,
> +		    <0x80 &smmu 0x24 0x1>,
> +		    <0xc0 &smmu 0x27 0x1>;
> +};
> +
> +/* Verdin ETH_2_RGMII_MDIO, shared between all ethernet ports */
> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		reg = <0>;
> +		interrupt-parent = <&som_gpio_expander>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +	};
> +};
> +
> +&netc_timer {
> +	status = "okay";
> +};
> +
> +&netcmix_blk_ctrl {
> +	status = "okay";
> +};
> +
> +/* Verdin PCIE_1 */
> +&pcie0 {
> +	/* PCIE_1_RESET# (SODIMM 244) */
> +	reset-gpios = <&som_gpio_expander 4 GPIO_ACTIVE_LOW>;
> +};
> +
> +/* Verdin I2S_1 */
> +&sai3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI3>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
> +};
> +
> +&scmi_bbm {
> +	linux,code = <KEY_POWER>;
> +};
> +
> +&thermal_zones {
> +	/* PF09 Main PMIC */
> +	pf09-thermal {
> +		polling-delay = <2000>;
> +		polling-delay-passive = <250>;
> +		thermal-sensors = <&scmi_sensor 2>;
> +
> +		trips {
> +			trip0 {
> +				hysteresis = <2000>;
> +				temperature = <155000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +
> +	/* PF53 VDD_ARM PMIC */
> +	pf53-arm-thermal {
> +		polling-delay = <2000>;
> +		polling-delay-passive = <250>;
> +		thermal-sensors = <&scmi_sensor 4>;
> +
> +		trips {
> +			trip0 {
> +				hysteresis = <2000>;
> +				temperature = <155000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +
> +	/* PF53 VDD_SOC PMIC */
> +	pf53-soc-thermal {
> +		polling-delay = <2000>;
> +		polling-delay-passive = <250>;
> +		thermal-sensors = <&scmi_sensor 3>;
> +
> +		trips {
> +			trip0 {
> +				hysteresis = <2000>;
> +				temperature = <155000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +};
> +
> +/* Verdin PWM_1 */
> +&tpm4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tpm4>;
> +};
> +
> +/* Verdin PWM_2 */
> +&tpm5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tpm5>;
> +};
> +
> +/* Verdin PWM_3_DSI */
> +&tpm6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tpm6>;
> +};
> +
> +/* Verdin USB_1 */
> +&usb2 {
> +	dr_mode = "otg";
> +	adp-disable;
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	vbus-supply = <&reg_usb1_vbus>;
> +
> +	port {
> +		usb1_id: endpoint {
> +			remote-endpoint = <&usb_dr_connector>;
> +		};
> +	};
> +};
> +
> +/* Verdin USB_2 */
> +&usb3 {
> +	fsl,disable-port-power-control;
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb3_phy {
> +	vbus-supply = <&reg_usb2_vbus>;
> +};
> +
> +/* On-module eMMC */
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +
> +	status = "okay";
> +};
> +
> +/* Verdin SD_1 */
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_cd>;
> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_cd>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>,<&pinctrl_usdhc2_cd>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_cd>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	vqmmc-supply = <&reg_usdhc2_vqmmc>;
> +};
> +
> +&wdog3 {
> +	fsl,ext-reset-output;
> +
> +	status = "okay";
> +};
> +
> +&scmi_iomuxc {
> +	/* On-module Bluetooth on WB SKUs, module-specific UART otherwise */
> +	pinctrl_bt_uart: btuartgrp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO04__LPUART6_TX	0x31e>, /* WiFi_UART_SoC_TXD */
> +			   <IMX95_PAD_GPIO_IO33__LPUART6_RX	0x31e>, /* WiFi_UART_SoC_RXD */
> +			   <IMX95_PAD_GPIO_IO34__LPUART6_CTS_B	0x31e>, /* WiFi_UART_SoC_CTS */
> +			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e>; /* WiFi_UART_SoC_RTS */
> +	};
> +
> +	/* Verdin CSI_1_MCLK */
> +	pinctrl_csi1_mclk: csi1mclkgrp {
> +		fsl,pins = <IMX95_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1	0x51e>; /* SODIMM 91 */
> +	};
> +
> +	/* Verdin CTRL_SLEEP_MOCI# */
> +	pinctrl_ctrl_sleep_moci: ctrlsleepmocigrp {
> +		fsl,pins = <IMX95_PAD_SAI1_RXD0__AONMIX_TOP_GPIO1_IO_BIT14	0x51e>; /* SODIMM 256 */
> +	};
> +
> +	/* Verdin CTRL_WAKE1_MICO# */
> +	pinctrl_ctrl_wake1_mico: ctrlwake1micogrp {
> +		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x31e>; /* SODIMM 252 */
> +	};
> +
> +	/* Verdin ETH_2_RGMII_MDIO, shared between all ethernet ports */
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins = <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC	0x50e>, /* ENET2_MDC, SODIMM 193 */
> +			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO	0x90e>; /* ENET2_MDIO, SODIMM 191 */
> +	};
> +
> +	/* Verdin ETH_1 (On-module PHY) */
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>, /* ENET1_TX_CTL */
> +			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e>, /* ENET1_TXC    */
> +			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e>, /* ENET1_TDO    */
> +			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e>, /* ENET1_TD1    */
> +			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e>, /* ENET1_TD2    */
> +			   <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e>, /* ENET1_TD3    */
> +			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>, /* ENET1_RX_CTL */
> +			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e>, /* ENET1_RXC    */
> +			   <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e>, /* ENET1_RD0    */
> +			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e>, /* ENET1_RD1    */
> +			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e>, /* ENET1_RD2    */
> +			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e>; /* ENET1_RD3    */
> +	};
> +
> +	/* Verdin ETH_2_RGMII */
> +	pinctrl_enetc1: enetc1grp {
> +		fsl,pins = <IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e>, /* ENET2_TX_CTL */
> +			   <IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK		0x58e>, /* ENET2_TXC    */
> +			   <IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x50e>, /* ENET2_TD0    */
> +			   <IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x50e>, /* ENET2_TD1    */
> +			   <IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x50e>, /* ENET2_TD2    */
> +			   <IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x50e>, /* ENET2_TD3    */
> +			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e>, /* ENET2_RX_CTL */
> +			   <IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK		0x58e>, /* ENET2_RXC    */
> +			   <IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e>, /* ENET2_RD0    */
> +			   <IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e>, /* ENET2_RD1    */
> +			   <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e>, /* ENET2_RD2    */
> +			   <IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e>; /* ENET2_RD3    */
> +	};
> +
> +	/* Verdin ETH_2_RGMII_INT#  */
> +	pinctrl_eth2_rgmii_int: eth2rgmiiintgrp {
> +		fsl,pins = <IMX95_PAD_SAI1_TXC__AONMIX_TOP_GPIO1_IO_BIT12	0x31e>; /* SODIMM 189 */
> +	};
> +
> +	/* Verdin CAN_1 */
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX		0x39e>, /* SODIMM 20 */
> +			   <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX	0x39e>; /* SODIMM 22 */
> +	};
> +
> +	/* Verdin CAN_2 */
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO25__CAN2_TX	0x39e>, /* SODIMM 24 */
> +			   <IMX95_PAD_GPIO_IO27__CAN2_RX	0x39e>; /* SODIMM 26 */
> +	};
> +
> +	/* Verdin QSPI_1 */
> +	pinctrl_flexspi1: flexspi1grp {
> +		fsl,pins = <IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B	0x3fe>, /* SODIMM 54 */
> +			   <IMX95_PAD_XSPI1_SS1_B__FLEXSPI1_A_SS1_B	0x3fe>, /* SODIMM 64 */
> +			   <IMX95_PAD_XSPI1_SCLK__XSPI_CLK		0x3fe>, /* SODIMM 52 */
> +			   <IMX95_PAD_XSPI1_DATA0__XSPI_DATA_BIT0	0x3fe>, /* SODIMM 56 */
> +			   <IMX95_PAD_XSPI1_DATA1__XSPI_DATA_BIT1	0x3fe>, /* SODIMM 58 */
> +			   <IMX95_PAD_XSPI1_DATA2__XSPI_DATA_BIT2	0x3fe>, /* SODIMM 60 */
> +			   <IMX95_PAD_XSPI1_DATA3__XSPI_DATA_BIT3	0x3fe>, /* SODIMM 62 */
> +			   <IMX95_PAD_XSPI1_DQS__XSPI_DQS		0x3fe>; /* SODIMM 66 */
> +	};
> +
> +	/* Verdin GPIO_1 */
> +	pinctrl_gpio1: gpio1grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO00__GPIO2_IO_BIT0	0x51e>; /* SODIMM 206 */
> +	};
> +
> +	/* Verdin GPIO_2 */
> +	pinctrl_gpio2: gpio2grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO18__GPIO2_IO_BIT18	0x51e>; /* SODIMM 208 */
> +	};
> +
> +	/* Verdin GPIO_3 */
> +	pinctrl_gpio3: gpio3grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24	0x51e>; /* SODIMM 210 */
> +	};
> +
> +	/* Verdin GPIO_4 */
> +	pinctrl_gpio4: gpio4grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO32__GPIO5_IO_BIT12	0x51e>; /* SODIMM 212 */
> +	};
> +
> +	/* Verdin GPIO_5_CSI */
> +	pinctrl_gpio5: gpio5grp {
> +		fsl,pins = <IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28	0x51e>; /* SODIMM 216 */
> +	};
> +
> +	/* Verdin GPIO_6_CSI */
> +	pinctrl_gpio6: gpio6grp {
> +		fsl,pins = <IMX95_PAD_CCM_CLKO2__GPIO3_IO_BIT27	0x51e>; /* SODIMM 218 */
> +	};
> +
> +	/* Verdin I2S_2_BCLK as GPIO (conflict with Verdin I2S_2) */
> +	pinctrl_i2s_2_bclk_gpio: i2s2bclkgpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA6__GPIO5_IO_BIT6	0x51e>; /* SODIMM 42 */
> +	};
> +
> +	/* Verdin I2S_2_D_IN as GPIO (conflict with Verdin I2S_2) */
> +	pinctrl_i2s_2_d_in_gpio: i2s2dingpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA7__GPIO5_IO_BIT7	0x31e>; /* SODIMM 48 */
> +	};
> +
> +	/* Verdin I2S_2_D_OUT as GPIO (conflict with Verdin I2S_2) */
> +	pinctrl_i2s_2_d_out_gpio: i2s2doutgpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA4__GPIO5_IO_BIT4	0x51e>; /* SODIMM 46 */
> +	};
> +
> +	/* Verdin I2S_2_SYNC as GPIO (conflict with Verdin I2S_2) */
> +	pinctrl_i2s_2_sync_gpio: i2s2syncgpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA5__GPIO5_IO_BIT5	0x51e>; /* SODIMM 44 */
> +	};
> +
> +	/* Verdin I2C_3_HDMI */
> +	pinctrl_i3c2: i3c2cgrp {
> +		fsl,pins = <IMX95_PAD_ENET1_MDC__I3C2_SCL	0x40001186>, /* SODIMM 59 */
> +			   <IMX95_PAD_ENET1_MDIO__I3C2_SDA	0x40001186>; /* SODIMM 57 */
> +	};
> +
> +	pinctrl_io_exp_int: ioexpintgrp {
> +		fsl,pins = <IMX95_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_BIT13	0x31e>; /* IO_EXP_INT */
> +	};
> +
> +	/* CTRL_I2C (On-module I2C) */
> +	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
> +		fsl,pins = <IMX95_PAD_I2C2_SCL__AONMIX_TOP_GPIO1_IO_BIT2	0x40001b9e>, /* CTRL_I2C_SCL */
> +			   <IMX95_PAD_I2C2_SDA__AONMIX_TOP_GPIO1_IO_BIT3	0x40001b9e>; /* CTRL_I2C_SDA */
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x40001b9e>, /* CTRL_I2C_SCL */
> +			   <IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x40001b9e>; /* CTRL_I2C_SDA */
> +	};
> +
> +	/* Verdin I2C_2_DSI */
> +	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28	0x40001b9e>, /* SODIMM 53 */
> +			   <IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29	0x40001b9e>; /* SODIMM 55 */
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO28__LPI2C3_SDA	0x40001b9e>, /* SODIMM 53 */
> +			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL	0x40001b9e>; /* SODIMM 55 */
> +	};
> +
> +	/* Verdin I2C_1 */
> +	pinctrl_lpi2c4_gpio: lpi2c4gpiogrp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO31__GPIO2_IO_BIT31	0x40001b9e>, /* SODIMM 14 */
> +			   <IMX95_PAD_GPIO_IO30__GPIO2_IO_BIT30	0x40001b9e>; /* SODIMM 12 */
> +	};
> +
> +	pinctrl_lpi2c4: lpi2c4grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO31__LPI2C4_SCL	0x40001b9e>, /* SODIMM 14 */
> +			   <IMX95_PAD_GPIO_IO30__LPI2C4_SDA	0x40001b9e>; /* SODIMM 12 */
> +	};
> +
> +	/* Verdin I2C_4_CSI */
> +	pinctrl_lpi2c5_gpio: lpi2c5gpiogrp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22	0x40001b9e>, /* SODIMM 93 */
> +			   <IMX95_PAD_GPIO_IO23__GPIO2_IO_BIT23	0x40001b9e>; /* SODIMM 95 */
> +	};
> +
> +	pinctrl_lpi2c5: lpi2c5grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO22__LPI2C5_SDA	0x40001b9e>, /* SODIMM 93 */
> +			   <IMX95_PAD_GPIO_IO23__LPI2C5_SCL	0x40001b9e>; /* SODIMM 95 */
> +	};
> +
> +	/* Verdin SPI_1 */
> +	pinctrl_lpspi6: lpspi6grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO01__LPSPI6_SIN	0x3fe>, /* SODIMM 198 */
> +			   <IMX95_PAD_GPIO_IO02__LPSPI6_SOUT	0x3fe>, /* SODIMM 200 */
> +			   <IMX95_PAD_GPIO_IO03__LPSPI6_SCK	0x3fe>; /* SODIMM 196 */
> +	};
> +
> +	/* Verdin QSPI_1_CLK as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_clk_gpio: qspi1clkgpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_SCLK__GPIO5_IO_BIT9		0x11e>; /* SODIMM 52 */
> +	};
> +
> +	/* Verdin QSPI_1_CS2# as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_cs2_gpio: qspi1cs2gpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_SS1_B__GPIO5_IO_BIT11	0x11e>; /* SODIMM 64 */
> +	};
> +
> +	/* Verdin QSPI_1_CS# as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_cs_gpio: qspi1csgpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_SS0_B__GPIO5_IO_BIT10	0x11e>; /* SODIMM 54 */
> +	};
> +
> +	/* Verdin QSPI_1_DQS as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_dqs_gpio: qspi1dqsgpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DQS__GPIO5_IO_BIT8		0x11e>; /* SODIMM 66 */
> +	};
> +
> +	/* Verdin QSPI_1_IO0 as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_io0_gpio: qspi1io0gpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA0__GPIO5_IO_BIT0	0x119e>; /* SODIMM 56 */
> +	};
> +
> +	/* Verdin QSPI_1_IO1 as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_io1_gpio: qspi1io1gpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA1__GPIO5_IO_BIT1	0x119e>; /* SODIMM 58 */
> +	};
> +
> +	/* Verdin QSPI_1_IO2 as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_io2_gpio: qspi1io2gpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA2__GPIO5_IO_BIT2	0x11e>; /* SODIMM 60 */
> +	};
> +
> +	/* Verdin QSPI_1_IO3 as GPIO (conflict with Verdin QSPI_1 interface) */
> +	pinctrl_qspi1_io3_gpio: qspi1io3gpiogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA3__GPIO5_IO_BIT3	0x11e>; /* SODIMM 62 */
> +	};
> +
> +	/* Verdin I2S_1 */
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK		0x11e>, /* SODIMM 30 */
> +			   <IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0	0x11e>, /* SODIMM 36 */
> +			   <IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0	0x11e>, /* SODIMM 34 */
> +			   <IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC		0x11e>; /* SODIMM 32 */
> +	};
> +
> +	/* Verdin I2S_1_MCLK */
> +	pinctrl_sai3_mclk: sai3mclkgrp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO17__SAI3_MCLK	0x31e>; /* SODIMM 38 */
> +	};
> +
> +	/* Verdin I2S_2 */
> +	pinctrl_sai5: sai5grp {
> +		fsl,pins = <IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0	0x11e>, /* SODIMM 46 */
> +			   <IMX95_PAD_XSPI1_DATA5__SAI5_TX_SYNC		0x11e>, /* SODIMM 44 */
> +			   <IMX95_PAD_XSPI1_DATA6__SAI5_TX_BCLK		0x11e>, /* SODIMM 42 */
> +			   <IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0	0x11e>; /* SODIMM 48 */
> +	};
> +
> +	/* Verdin SPI_1_CS */
> +	pinctrl_spi1_cs: spi1csgrp {
> +		fsl,pins = <IMX95_PAD_CCM_CLKO4__GPIO4_IO_BIT29	0x3fe>; /* SODIMM 202 */
> +	};
> +
> +	/* Verdin PWM_1 */
> +	pinctrl_tpm4: tpm4grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO05__TPM4_CH0	0x11e>; /* SODIMM 15 */
> +	};
> +
> +	/* Verdin PWM_2 */
> +	pinctrl_tpm5: tpm5grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0	0x11e>; /* SODIMM 16 */
> +	};
> +
> +	/* Verdin PWM_3_DSI as GPIO */
> +	pinctrl_tpm6_gpio: tpm6gpiogrp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO19__GPIO2_IO_BIT19	0x51e>; /* SODIMM 19 */
> +	};
> +
> +	/* Verdin PWM_3_DSI */
> +	pinctrl_tpm6: tpm6grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO19__TPM6_CH2	0x11e>; /* SODIMM 19 */
> +	};
> +
> +	/* Verdin UART_3, used as the Linux Console */
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX	0x31e>, /* SODIMM 147 */
> +			   <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX	0x31e>; /* SODIMM 149 */
> +	};
> +
> +	/* Verdin UART_4 */
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e>, /* SODIMM 151 */
> +			   <IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e>; /* SODIMM 153 */
> +	};
> +
> +	/* Verdin UART_1 */
> +	pinctrl_uart7: uart7grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO08__LPUART7_TX	0x31e>, /* SODIMM 131 */
> +			   <IMX95_PAD_GPIO_IO09__LPUART7_RX	0x31e>, /* SODIMM 129 */
> +			   <IMX95_PAD_GPIO_IO10__LPUART7_CTS_B	0x31e>, /* SODIMM 135 */
> +			   <IMX95_PAD_GPIO_IO11__LPUART7_RTS_B	0x31e>; /* SODIMM 133 */
> +	};
> +
> +	/* Verdin UART_2 */
> +	pinctrl_uart8: uart8grp {
> +		fsl,pins = <IMX95_PAD_GPIO_IO12__LPUART8_TX	0x31e>, /* SODIMM 139 */
> +			   <IMX95_PAD_GPIO_IO13__LPUART8_RX	0x31e>, /* SODIMM 137 */
> +			   <IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x31e>, /* SODIMM 143 */
> +			   <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x31e>; /* SODIMM 141 */
> +	};
> +
> +	/* On-module eMMC */
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>, /* SD1_CLK    */
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x138e>, /* SD1_CMD    */
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x138e>, /* SD1_DATA0  */
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x138e>, /* SD1_DATA1  */
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x138e>, /* SD1_DATA2  */
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x138e>, /* SD1_DATA3  */
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x138e>, /* SD1_DATA4  */
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x138e>, /* SD1_DATA5  */
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x138e>, /* SD1_DATA6  */
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x138e>, /* SD1_DATA7  */
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x158e>; /* SD1_STROBE */
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x15fe>, /* SD1_CLK    */
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x13fe>, /* SD1_CMD    */
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe>, /* SD1_DATA0  */
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe>, /* SD1_DATA1  */
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe>, /* SD1_DATA2  */
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe>, /* SD1_DATA3  */
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe>, /* SD1_DATA4  */
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe>, /* SD1_DATA5  */
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe>, /* SD1_DATA6  */
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe>, /* SD1_DATA7  */
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe>; /* SD1_STROBE */
> +	};
> +
> +	/* Verdin SD_1 */
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK	0x158e>, /* SODIMM 78 */
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD	0x138e>, /* SODIMM 74 */
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e>, /* SODIMM 80 */
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e>, /* SODIMM 82 */
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e>, /* SODIMM 70 */
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e>; /* SODIMM 72 */
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK	0x15fe>, /* SODIMM 78 */
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD	0x13fe>, /* SODIMM 74 */
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe>, /* SODIMM 80 */
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe>, /* SODIMM 82 */
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe>, /* SODIMM 70 */
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe>; /* SODIMM 72 */
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
> +		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK	0x400>, /* SODIMM 78 */
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD	0x400>, /* SODIMM 74 */
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x400>, /* SODIMM 80 */
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x400>, /* SODIMM 82 */
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x400>, /* SODIMM 70 */
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x400>; /* SODIMM 72 */
> +	};
> +
> +	/* Verdin SD_1_CD# */
> +	pinctrl_usdhc2_cd: usdhc2-cdgrp {
> +		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0	0x1100>; /* SODIMM 84 */
> +	};
> +
> +	/* Verdin SD_1_PWR_EN */
> +	pinctrl_usdhc2_pwr_en: usdhc2-pwrengrp {
> +		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7	0x11e>; /* SODIMM 76 */
> +	};
> +
> +	pinctrl_usdhc2_vsel: usdhc2-vselgrp {
> +		fsl,pins = <IMX95_PAD_SD2_VSELECT__GPIO3_IO_BIT19	0x4>; /* PMIC_SD2_VSEL */
> +	};
> +
> +	/* On-module Wi-Fi on WB SKUs, module-specific SDIO otherwise */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <IMX95_PAD_SD3_CLK__USDHC3_CLK	0x158e>, /* SD3_CLK   */
> +			   <IMX95_PAD_SD3_CMD__USDHC3_CMD	0x138e>, /* SD3_CMD   */
> +			   <IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x138e>, /* SD3_DATA0 */
> +			   <IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x138e>, /* SD3_DATA1 */
> +			   <IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x138e>, /* SD3_DATA2 */
> +			   <IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x138e>; /* SD3_DATA3 */
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <IMX95_PAD_SD3_CLK__USDHC3_CLK	0x15fe>, /* SD3_CLK   */
> +			   <IMX95_PAD_SD3_CMD__USDHC3_CMD	0x13fe>, /* SD3_CMD   */
> +			   <IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x13fe>, /* SD3_DATA1 */
> +			   <IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x13fe>, /* SD3_DATA2 */
> +			   <IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x13fe>, /* SD3_DATA3 */
> +			   <IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x13fe>; /* SD3_DATA4 */
> +	};
> +
> +	pinctrl_wifi_pwr_en: wifipwrengrp {
> +		fsl,pins = <IMX95_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_BIT11	0x51e>; /* PMIC_EN_WIFI */
> +	};
> +};
>
> --
> 2.43.0
>

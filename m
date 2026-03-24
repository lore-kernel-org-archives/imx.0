Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83797391E79
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377107; cv=fail; b=hv8/WE9TgZ62rFTTCrzdcgtbvpt6Qcw3h12ZaSejjhBbMJ+WZhjlvSI6wwz7okL0SA4oCe8hnhDZwy+lBHFzjj1FMWqYRIwxgJaefFjl6df1Cgc791O6wH7zKdkV+L7vLCaSpy0J2ZrFXki9saMBZ3++okonHVUS58pIfjscCDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377107; c=relaxed/simple;
	bh=R2Hti/LfLMqqEkpE9CjpWqK9/76tiLV/IGuPHXsd8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qcq3YIIYfBnChqxl3gkq+P6XDoT8QxK5LOJKZvmrvUL+QgE7hI1yKU16TSTECiRP2qO1nRAF6fhraoEIA8pKfLPr3m/9hao869I7afeIEhTAe8tTb2v6JIRGXsoukFWc7dn9RpvyFGd3g//DF9fuUCL5WNvDQQfob0HKyTiLikA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q0tLMkgq; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q0tLMkgq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2a30f7cxVAWrLB9phgOk1nXGYLuZAVsfy9qJ3qe4is2k9ecjHSMQu5ONoH4PuZ72kzi5HJfiMbXkWb3SGN0eEm3fNJ/vVbNFnB7e1PPyicaEvbEybcY4Fo/9EoXe5E7kWUL1x25wiSZ7x5SKOTUCe4vj8L8pBmO+v3CVDQyXaC1IaM5/m7TDGbuV1/vGrxyikw66Fw34UDii7uzQ2t5dmg67Hll7r7k3jnQQl78/j6PMp575KK9Kmecp/huEvLPgKBUPxsx/zwJJLOg4AgRQ6Q+xOSEP+u5y3UnSFHDSvRdUmMvrsnQPNt1ZahybctNIUsUsTZfD4SKk6qEDKf1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgzx6Eu2z+R9RZQC/y//tQPvl90YZuL3CIhp1dAjSpA=;
 b=tcv8U/8krYRLEfITYHLPhtZnl34ncqljGB2lseZe60m9uyxzUArPIq+yxhguPJ2Ly40S89Xpy5FynGH5WMoZrn9B4wBNDxyhzqyOuEgMR2p11X5iBynkzuoeSjmVXlZJUTn3w6lO9yI0CiSD2k+yaJ5ncsfaqtDv7zqmodVmtwLJMpE2QKP1feK7ObPJjFcFNK+RNA4smS3XwadSPb+mA/QdWluEg+00MIWNxJMmiFTmK/AWDJ2uq48MzDXIJRNqroy9hIwqvT6B8fknOwy6ZhSaiurPyZQLNO440fN5aoqlI9ho+LaWmeJS57LeLnyIHMChrN9EgKa1+0WaonP/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgzx6Eu2z+R9RZQC/y//tQPvl90YZuL3CIhp1dAjSpA=;
 b=Q0tLMkgqS7UJ13JHGhgfNp+BL8Dv4moTvwzyGFQcjW4CbTeu/yGtjbz6JYDW8KEPA4cd+aLOpRV9SyNajBnLrflyPFmqCt8opQOYqJNKviXdyD3yxu2BiLv8UUNk2th0JnoRsjmWke4iA33ly1QYJHw7oNrr1rBU17ylrYLmw72tTWRynLJuPibo+gFLRvRqV866ETmxrly4he8rK80m+lg6/aiGrnfJtJxU+LnLSHNI1Y+TWM7H0G3VYPuwYFEJO9F6EO4TOBmuaLudfzPJKhLr+Z+NKmjreWIYnE/UYfygStPUxp0khSSbqK63Vv88sELlSKLmtBbq8UF7IaH0WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 18:31:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 18:31:33 +0000
Date: Tue, 24 Mar 2026 14:31:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM
 and boards
Message-ID: <acLYhQDb9kYjwFj3@lizhi-Precision-Tower-5810>
References: <20260312233526.200157-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312233526.200157-1-marex@nabladev.com>
X-ClientProxiedBy: PH7PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:510:174::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: e263797b-492f-4e69-2024-08de89d39356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|7053199007|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	KoTJueQnPyT/vsMrPQq80wRt7gMHimST72xfV1YfO1NtV5XXm3YDZXEiqVejQZ9w0Ih9zN46ep+bOIcW7GRhZLiVtIZfMOgjOiWHvrj2cXcfLazP/NzOCBwHlOqrgxUl7ElsGfakYv1Ahu/az6RizrRGsO4z9fcERjoX1Lagla6wo8/c5416gSAKD+xvETmZYjNUgltP8vNcAHni2miJXUQT3JT99x5i7G/bfTS3MSOWipcqwHGqgWa4f0afHHln9rAqiCF0jKiQ6liWuzRuDWXERitMuVXrCuYi/CgH+CHMZvpLUzPHgxOm/TPKA+haqbN4Mh4sFsm6gNXqIpcp6hhlLmw6xIFnyqeuEqP+r9tL5k+mzT8yvPeePrN5zYoyde+lBvE869Hf5rUuhjqwCKrjY6/hXs+fGPaXRYhWNbqFZ+KxcqCTbEefbYsz8RUkN9Yu5UQS7/cldZzSi1YuXVw90KLJq23wbkQjkFcyoAI7BqXjTaDXE4ti1pxrGJQG09SqsRmTehHmWPeWl9wwvgohfjTVPsor+oT6y/aI1LrW0llxYYB4WqnV/emUqpxmTRvH43EFyaiJrHd/lFtAcQ/RuaEiSC64uLX9I99jWqbNjf329xDhkAjKNhljvEJwsFR4eenDAMetnvJTqBTaZ/hpZQjybo5e7J3bF5vsYQOACmjX+Z8FR5hQDmVwstCAilInYXrEGmrsqk0eIKhXFyhBAuxPUjSbqVjD/eEcQ16y2bOzWceb1fTA3Pkd1kkYies5UeGXaUuLR1kUumU8fJ0Zn0ENoucwkegwrbPJ2Mk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(7053199007)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NZRrcJdL1IGP43F5n1AOIT62R1/6rInQupKwFowAzD+V/odC82wLY8Wr7Bpn?=
 =?us-ascii?Q?w25RSTfgTykCL3Pr2HxmW9teC8A/JFSa//XTRYUcPaEnCR7NeZfvirY7GL6o?=
 =?us-ascii?Q?QlNzesyRPG8eRW8IKyYs+kfl5wcrGvU37cdSbHH6VVKbdnUpIA8pA6UGp0fX?=
 =?us-ascii?Q?HXD5dg7LiatmKaznrhjGIDQgSZAlDEYkFWmDUfrwLAutYl6Z89ZWF2ca9L91?=
 =?us-ascii?Q?H9pVE7shbHCVrksNs5JHoBTl8SAby199Tu5sOwQlOahlLQxwrw3Llu/dJF1b?=
 =?us-ascii?Q?5dU/6gOlP/JMpeUbmprkG3/65pdtT5d3oDHW2Z+UT/VdFNUC/utrNxbJPRwS?=
 =?us-ascii?Q?Y+JFs4XOY3vZ5hmR51YpiXusRtgOus5y9zxO0HTpc88x6pOraOG1mqfQ9iUy?=
 =?us-ascii?Q?EBCnGT22v5//eq9dF1bRcLZoKLTa35uk89a9d4w/kqJYEJ1OOnfYFoMnomai?=
 =?us-ascii?Q?ZrKfq6FxPLfFKRpReMKzpr8l84l5daPpEV4Ntp4A4rrN+z/+fZefM67V7EVI?=
 =?us-ascii?Q?H8dmR15CheW+3jn9+C0vcilDw5HJvLcWZV2wxafvaqH3ATuPwisSeMmTtFsS?=
 =?us-ascii?Q?tBu2WVLKkdlGTTpr8Ai66F4BMlMrfg+/KsMgZRYGpEnWUei1CgqGZR78qSmS?=
 =?us-ascii?Q?q2N6IKX51BB53YOgq3YjLJSqdJYFsN5/GJHJTos3vm69KbEENa6PMEg1AVCb?=
 =?us-ascii?Q?UrgyIlnUPScGfYoDkDdGldUdXtCleOFcG8nEZCYTVBWPwguW96BT8Ggc1o2x?=
 =?us-ascii?Q?S8v2Q9SUlWT8+bR6C4KlvVk8twglntYeGa3GF340OLxll1i6vGCtzwzfevMA?=
 =?us-ascii?Q?3y1t7IajyXz8H9KzFkgwwHb/ttYa1wE6iDIvzizq9VIJHCRNuf2pAYguL9y+?=
 =?us-ascii?Q?jDbCadE95WMXr1ZMZ6mIhpOUCcTdp+CF8VXDh8CB3lGn853uVPD7cQ0FPK2X?=
 =?us-ascii?Q?XRmgB3n9kkq+nRA8dTbTiTqKTXOzFUvby9Ge5uxZGgBZxMg5EHpsbmFvXnOj?=
 =?us-ascii?Q?oQz+/9e11QAM2yTB/osK3Yf44EX+pEGywVAOvDk5Gq2QBXHwmcZpUKUGMDcj?=
 =?us-ascii?Q?3gJToMmTbs1MOxOGlV8xUc1COnzHaGj6Pa9qa+Q5H72b+TM2NEaXrFpwlgh6?=
 =?us-ascii?Q?fqISln/RhLFQA+J+tpn+8ir0rT/0wcnoVnw6kCYrnl+NlmOgQ1xznk9vfLwC?=
 =?us-ascii?Q?eLbmtr1JsS2lOGiDqc39C590fGGw8fRyt0Hp8/hg8y9V75iHxHGg2Rx0GpWe?=
 =?us-ascii?Q?pLbMQ0UxUhmVpNGuFHIl9VK0vB+iPtwhHHnLOtLJUWSaey6ShuAPgCzeEnLo?=
 =?us-ascii?Q?4TlEpEF4XEbV5x7aSMHO9aANFTKefec2S9bNsa/nVc8IzOXtI5uzekN8AXHL?=
 =?us-ascii?Q?/WXiT3dRSJjT6XGoVwakkLPhK5X4dd/XCchQloI0OwCWNU7kc3ROgO54qfze?=
 =?us-ascii?Q?wyQ6uzmuSb+KQRojPWN4JTTEP/nEZjCJiv5ne3Q47Dk2wvtnziqsujuzGCA1?=
 =?us-ascii?Q?kWV6xgFW0abm3fgKjqxRYnojXzb8QeeqKKCA55slBMKIjAjuFNJP0m5/Lz7c?=
 =?us-ascii?Q?6Ml3+i40m30n+3J1kJQZWRi25qWAdxUyX+FYl9sGxvo1zdRfD/GHyevh1SC8?=
 =?us-ascii?Q?6dPhA/p1MtliGK86Jm2/TV4cpKcH58oYHPE4W1/HtUUaV9mXV9nSRBfND3+q?=
 =?us-ascii?Q?AiW4kHgIT3uApquf4W/rA0Wsymq9UEBBqbFXT+H/VqYEoANsldA14SQsGwPW?=
 =?us-ascii?Q?nk03WPJU4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e263797b-492f-4e69-2024-08de89d39356
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:31:33.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqrY11n51nYEexJ0USUwn8Xa2nS+IrUcp5H8ZQSzBiSG6vTtmL7kNJh89wmwEwiIDdZNXdMrf/VHhB1MhhLXnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312

On Fri, Mar 13, 2026 at 12:34:05AM +0100, Marek Vasut wrote:
> Add DT overlays to support DH i.MX6 DHCOM SoM carrier board expansion
> modules. The following DT overlays are implemented:
> - PDK2:
>   - DH 497-200 Display board in edge connector X12
>   - DH 505-200 Display board in edge connector X12
>   - DH 531-100 SPI/I2C board in header X21
>   - DH 531-200 SPI/I2C board in header X22
>   - DH 560-200 Display board in edge connector X12
> - PicoITX:
>   - DH 626-100 Display board in edge connector X2
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            | 37 +++++++++
>  ...l-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi | 75 +++++++++++++++++++
>  .../imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi  | 61 +++++++++++++++
>  ...mx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso | 28 +++++++
>  ...-pdk2-overlay-505-200-x12-ch101olhlwh.dtso | 26 +++++++
>  ...mx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso | 32 ++++++++
>  ...mx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso | 32 ++++++++
>  ...mx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso | 39 ++++++++++
>  ...icoitx-overlay-626-100-x2-ch101olhlwh.dtso |  8 ++
>  .../boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |  2 +-
>  10 files changed, 339 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
>
...
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
> new file mode 100644
> index 0000000000000..afdb936f1d4e3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2021 Marek Vasut

2026

> + */
...
> +
> +&panel {
> +	compatible = "edt,etm0700g0edh6";
> +};
> +
> +&panel_in {
> +	remote-endpoint = <&ipu1_dpi0_out>;
> +};
> +
> +&i2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@38 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_dhcom_e>;
> +		compatible = "edt,edt-ft5406";

compatible should first property

> +		reg = <0x38>;

reg is the second one.

Frank

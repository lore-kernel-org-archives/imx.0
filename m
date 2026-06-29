Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578544CF34
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751954; cv=fail; b=rILmFc45TeYI4+U1NffKhUeijSJt3kpTlyOnRjqovn/E6i8ieGRz37+W3yn714rCRNbeN+LhcZxin07OKSGZTDre+nXnSR6vy0S/5plEgQRjwJLc8p9oceg/sLZhAdpF3W7RtapxrwWDeeNRuRP9D5QOrMm9NRYV49xZFbrgic8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751954; c=relaxed/simple;
	bh=1i7IVSnBhMtu0+xqkQLcFZmWFSOhoID4RG0BmvDPmL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o9TsPLttngqXEzq3HuCFvIOiN6mN9smrrwtVOnCdvCbB7s7/GZv/WYjcxyENtxSFjDjaxJHr5vBUMge+Oho9Ds7NfrWJLU0l1Hp1vM0TqBM+N6F/nOpiZrPSnlsY9Pw7oMDiEiMqF9tf34xY0w6wUDOMzYCirKxVWA6QLTO3Ztw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p4wucOot; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p4wucOot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/bw226iDnGsChCiwwOicLM0r3KfKD5T/ByD+yV6P8qJlhVi5anwGcscz0hfe9Cc0is0NTtzhpWd+kT4uJ9rWbQIWdoscdF8yy8cBOe1futkxpaghUXv/Tm4NgI/qp2wgvmSUHjNdfB2oDk/d034gelAMQ1Kg2sqQWxk+rBnyhbmHE6vZ1HSOliiE5hkSwEwyQtntTCcHAyXXj0bYeSYp+1p9aUitlF2XmR6eYiPdqF02fscoXEXYOGENw3hV3VWlQ7Un5mztpBtJEkfe2ytvBFxhuifyQ/IRlHJuG4kDGC2HKVKx+FAFBJ8jLy/3MQowMb8mse0+yUXam7NwBCKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5koF6/kKhbXGE6PkQ89uWyabnSZ4qrsPglHpXYkiVA=;
 b=DJvLORXs0nnlAjVn8jWied9CmNOYf33OSJjL1HzhlAVH/ulq97hHhJdIWuUF4d7qrO2lw8CguMhmwMyQs0HJU1+h0SxNUPkbNlE4qQVoY2oQVm9H8kliOOlj6P5GFUR1oD9wn1zGVZpPtvMn75N6f2/Y4/SobBU6RtGptw+I8xBAoOMBvkBppGnm49lqDVTLvXwHQvRY7wUbch4n6eoQOKFstHTSCnHjbTLEgnaGIwrx2yzesUYlmvzFJASoIrcN+rqTfT7/CkZ8ySQeMGM47hOvc9jmLDW5wze4kVTCBsYqARm853C4lDGoWKZ0eVXqxeN0JW4aD/wc3x4RgQsSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5koF6/kKhbXGE6PkQ89uWyabnSZ4qrsPglHpXYkiVA=;
 b=p4wucOotNJGHcvyaUxa0usKZkJc7P5VycmCDttXynaGvQ/nPeUDp0tVHELpiXhdJ264OxtwOse1O+FLIaMa1wxiKqOoChTh3cwML32tFsKQsea7kNLna90DssYgoH4HghXTRp1sL2aFhgUC+BgM/tKKn9FJ4PdQvfxQ+ZpRrXu/xAKnDjKu5BFW3qeKgYYD/AZ3FoE5he4U0whdKfzXa57OD4HqUKUX0kZt+NJEpx18BAPHtO0anqY2BG8/QQUosndekfRYjDIC8bND7qoJjoPXTIw7kZ4vBzgaoXipI0NJFYyUdAzOBl5txI3c6lFIql3+hyqZ7HL8bYDkOiMYw+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:52:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:52:13 +0000
Date: Mon, 29 Jun 2026 12:52:04 -0400
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
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: imx8mp-var-dart: Add support for
 Variscite Sonata board
Message-ID: <akKitFCYv8D-0xPL@lizhi-Precision-Tower-5810>
References: <cover.1780998600.git.stefano.r@variscite.com>
 <4a43b387ebc5c0d715a2a736094b7544e68018f8.1780998600.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a43b387ebc5c0d715a2a736094b7544e68018f8.1780998600.git.stefano.r@variscite.com>
X-ClientProxiedBy: SA1PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: d6cc4b1b-01ab-4da8-721b-08ded5fec472
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|7416014|6133799003|13003099007|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 bgikC2nS66jlg/Eu2NqW9McGODEG/56+JonHN3gEtF1Aps1MGBAVRWF/5HI/tgDvAgOcSFKg8qlylw+aXva6Tuxe25DrP4LKSBSbbSrVhBb8aI2jtE7COAVdtLmtTbwy3HdynuJKOp9wdWkU8ZDpYiLL44481aqphH6HT3o5SaY4Zu9vSF9tXxFUJGHs2xF3GJon8TJnk6AxECQNnajYVKGZolfJEkj8l2oLWZ+kOU4ziD69L6+UZ6uZbkn4Nuu+rwjoPzRdcpLlfX5yUe0YNMkKL7uQPKAXvHUl6Iu4qqK6Ge0fRBuRnJD9/5WwZuwceXNjp/larALuOtyRshUEX24GYyCG54Ng5dHgd5KNugZlS2h++724Bc/2sXVBGwfzTKvedcAakdJvyAent9kiYC1tUBiC2aLWKbM8FRWRFk8sFtW+WtksSLIpNIcHMBeKxpSnSHpXGCU6XZPCn0Nw/gckvFiB0l6zAdEevS7oDFhB0ONxZM6rBQh8SpfDixXq3FflRXytWnCUgnXkGBbTre3UVDx5qZq4ljGZ5o7t5tw3oy7dci2v5y7cVN6urUX/3oBNxnEN/CtivnRjuOmidwX5ZiA30eMk6yt58ASbZ3g=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(7416014)(6133799003)(13003099007)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?iq9EY9qcIPKReEz45bTo/tDnsnixip/ZOrRk6UBpe4i7XmE4zqYEggT8jfu6?=
 =?us-ascii?Q?cR+pQ1yq4B1XhOCHeQTi+4nWSC81u/kePoSI4TTgM/1kWM50FE61+DI3QioZ?=
 =?us-ascii?Q?CoERBpChCQLDUAY4w2sUm016SMCEBndazHZ495Yn8rywI1AUuPgS1RBDP2Hj?=
 =?us-ascii?Q?uKiQK2Pl81hbDuV1C/OKGHCbx154I+P6AeBpqVRr++RUglEpjt4fAhJZudS5?=
 =?us-ascii?Q?UuZQ/jXGD+Y8EyBY+0p6V8MdsvyjANtt6qWB55RliBN1Rb7XFu4z7cduQOqN?=
 =?us-ascii?Q?ajZ6Rt1I4lLwZccFflx1MkCWZyRJ34tqp3sYWz4tizH605bQoyNdNh+Vlp6I?=
 =?us-ascii?Q?b6DCn7yi2aKO7OlDix7Z76S4lytr55XTD9u91yAR3xY4vV6DVYgUaB2H1CIc?=
 =?us-ascii?Q?dB/AZKHVce1zBC/aTWpKEy2eoeisuF0EK9/ds5L/UAo01W1JuEPlNjC/fmDB?=
 =?us-ascii?Q?fgEvOweOqlvFI7XAAvY+N8NsjwZ8UoMj2kvjwBQ6xD3YrhbLoJJT3IgFg5kl?=
 =?us-ascii?Q?3lHz9qHW8ZirORxA78eKLFQD7W577lLFVD1R8BQEQmIRw7+w0Dzp4usyILx9?=
 =?us-ascii?Q?/Y1S604ZYbmRJTArPrZP5p1p1QjUm8Fl19tnMc26WGWna3eiYv925TALZEEj?=
 =?us-ascii?Q?nSIoSm+0AB8feVkxNl7IP+Ld7lHqT9YRGD9ybIOf9jS1+WDNUtmZbdjoXgy4?=
 =?us-ascii?Q?HL5BSXcLHv5Sh7EunRiB+SIReoQh6d0dtlFTdmPJ6+bg1rgaaPPEtqk/SgSf?=
 =?us-ascii?Q?T273V13mtVT6cOpmiWJMHapRiQh4ZbQQ6nDdOEXlc+5OND4Q91eZIBuUDopz?=
 =?us-ascii?Q?N7Sv0RyHar7/bIlfpJLzI7SZwBOhrUi+JFA39isWGoR6hNIDLNkJhjb7QTlZ?=
 =?us-ascii?Q?iWzTwINTfRqSCDCRGSQrXOKkuuEYjZ6qfDVXVBs/Ni0hi0MhM6b5D+PdyLm/?=
 =?us-ascii?Q?CCCakL+HJj5OFOm7Q1cFBiOsJZCjaD0t29oF7OnHRTogbIo1mQMjriOm2zJ8?=
 =?us-ascii?Q?a72HrL0R2u029fl7OB0Ntpv1JRo6QcDqyFltEbTsR0OcI+4vmueMXYC4MyR+?=
 =?us-ascii?Q?65Cb3LdwQZJzfyRnUy9+hr+CsDXfcRqvKlNktzx+52H95B/ssMXv3zrcNP4Q?=
 =?us-ascii?Q?zBaNJt9by3UDLfjlpf68/AHSZ34NwtRcJEtdckF1+aWGbltdPAKqMMgm+C02?=
 =?us-ascii?Q?hSUioJcWWsR+fFnQg1Iks++xxqltruMmEmbZypqh8q08qUi9gzVekpctLFO4?=
 =?us-ascii?Q?/54+b372fqRC9UNSp2aGnoZfpdT/JjwkuOaBzWgJ5j6kO2OlOr0aLICxxgQN?=
 =?us-ascii?Q?nIX8R/ud7BPByoFLLOfDr4g1NZUoUvqdWJz+EcH/QvZ7QihEuYkIROb2zLuz?=
 =?us-ascii?Q?RClhYz4SMF8RxkJyPMLcEuRV6USsnsBJmmMxfbTssrCuj7rpg3GtwBe8BwLs?=
 =?us-ascii?Q?kduhO3fugTQO1yre2tomVuBFDhlSqNq6axOWiUL/H+GUphKQ/3h+eq/XUBp6?=
 =?us-ascii?Q?eVtI7h+xtuC4Fdtigc8+c/4a6SG09o2B+QkeRS5GOXXy8K54e/o7RYV0a+5I?=
 =?us-ascii?Q?58SI+GgLtDFoojqmWBsauZXpyuMDL13dbOXI4pgiBFHGBd5WlFauuCUYsR1+?=
 =?us-ascii?Q?l9jhE/p9SPN3R6OND4L/L8mfm8yOj5M31d1/5IVfzWWLt9oDszNEB9JMkusQ?=
 =?us-ascii?Q?TTWoBjEeD6ofhHu2NuqzBBmBgIlP6BFJzHWOaVIz3w5u8zL1ZnNjRW2xODPP?=
 =?us-ascii?Q?QT71tUQLN1Ps4SuAXobiAWXiXxose0oOTjcrvelNGRbzY2T/TJMa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cc4b1b-01ab-4da8-721b-08ded5fec472
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:52:13.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgGyY2w47AwkU063TNEK+mv1MKB1xJBddtOfgg3XQtKZHfhoS/7CJSmFybXRkT5+6Uelrwi4YAC8YRhwmZDqeLIxTxcY8taalCPemwQrch0GqoNbNc9GTZ0oz0e6lImT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156

On Tue, Jun 09, 2026 at 11:51:20AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite Sonata carrier board with the
> DART-MX8M-PLUS system on module.
>
> The Sonata board includes
> - uSD Card support
> - USB ports and OTG
> - Additional Gigabit Ethernet interface
> - Uart, SPI and I2C interfaces
> - HDMI support
> - GPIO Expanders
> - RTC module
> - TPM module
> - CAN peripherals
>
> Link: https://variscite.com/carrier-boards/sonata-board/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v4->v5:
>  - Fix nodes order
>
> v3->v4:
>  - Add snvs nodes
>
> v2->v3:
>  -
>
> v1->v2:
>  - Fixed model name
>  - Added new usdhc2 regulator pinctrl
>  - Adjusted irq edges
>
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mp-var-dart-sonata.dts  | 731 ++++++++++++++++++
>  2 files changed, 732 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 03988f0eae30..818e57f54475 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -448,6 +448,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
> new file mode 100644
> index 000000000000..283864b2d4b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
> @@ -0,0 +1,731 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Variscite Sonata carrier board for DART-MX8M-PLUS
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include "imx8mp-var-dart.dtsi"
> +
> +/ {
> +	model = "Variscite DART-MX8M-PLUS on Sonata-Board";
> +	compatible = "variscite,var-dart-mx8mp-sonata",
> +		     "variscite,var-dart-mx8mp",
> +		     "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path = &uart1;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-home {
> +			label = "Home";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-up {
> +			label = "Up";
> +			linux,code = <KEY_UP>;
> +			gpios = <&pca6408_1 5 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-down {
> +			label = "Down";
> +			linux,code = <KEY_DOWN>;
> +			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-back {
> +			label = "Back";
> +			linux,code = <KEY_BACK>;
> +			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		led-emmc {
> +			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
> +			label = "eMMC";
> +			linux,default-trigger = "mmc2";
> +		};
> +	};
> +
> +	native-hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "HDMI OUT";
> +		type = "a";
> +
> +		port {
> +			hdmi_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_out>;
> +			};
> +		};
> +	};
> +
> +	clk40m: oscillator {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +		clock-output-names = "can_osc";
> +	};
> +
> +	pcie0_refclk: pcie0-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_vmmc_usdhc2>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <100>;
> +		off-on-delay-us = <12000>;
> +	};
> +
> +	sound-hdmi {
> +		compatible = "fsl,imx-audio-hdmi";
> +		model = "audio-hdmi";
> +		audio-cpu = <&aud2htx>;
> +		hdmi-out;
> +	};
> +
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
> +};
> +
> +&aud2htx {
> +	status = "okay";
> +};
> +
> +&ecspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	cs-gpios = <&gpio5  9 GPIO_ACTIVE_LOW>,
> +		   <&gpio1 12 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	ads7846: touchscreen@0 {
> +		compatible = "ti,ads7846";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_restouch>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +		spi-max-frequency = <1500000>;
> +		pendown-gpio = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +		ti,x-min = /bits/ 16 <125>;
> +		ti,x-max = /bits/ 16 <4008>;
> +		ti,y-min = /bits/ 16 <282>;
> +		ti,y-max = /bits/ 16 <3864>;
> +		ti,x-plate-ohms = /bits/ 16 <180>;
> +		ti,pressure-max = /bits/ 16 <255>;
> +		ti,debounce-max = /bits/ 16 <10>;
> +		ti,debounce-tol = /bits/ 16 <3>;
> +		ti,debounce-rep = /bits/ 16 <1>;
> +		ti,settle-delay-usec = /bits/ 16 <150>;
> +		ti,keep-vref-on;
> +		wakeup-source;
> +	};
> +
> +	can0: can@1 {
> +		compatible = "microchip,mcp251xfd";
> +		reg = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_can>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> +		microchip,rx-int-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> +		clocks = <&clk40m>;
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
> +&eqos {
> +	mdio {
> +		ethphy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <20000>;
> +			vddio-supply = <&reg_phy_vddio>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&ethphy0 {
> +	leds {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@0 {
> +			reg = <0>;
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_LAN;
> +			linux,default-trigger = "netdev";
> +		};
> +
> +		led@1 {
> +			reg = <1>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			linux,default-trigger = "netdev";
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy1>;
> +	status = "okay";
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	status = "okay";
> +};
> +
> +&hdmi_pai {
> +	status = "okay";
> +};
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			hdmi_tx_out: endpoint {
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pca9534: gpio@22 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		eth10g-en-hog {
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "eth10g_sel";
> +		};
> +
> +		pcie2-en-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "pcie2_sel";
> +		};
> +
> +		/* RGB_SEL */
> +		lvds-brg-enable-hog {
> +			gpio-hog;
> +			gpios = <7 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "rgb_sel";
> +		};

Please provide comments it is safe for these hogs, gpio driver may probe
later than ether net\pcie.

If it is on-boards signal mux, please use
https://lore.kernel.org/imx/20260504-pinctrl-mux-v6-2-8ea858ba3a5b@nxp.com/

which already in 7.2

Frank

> +	};
> +
> +	/* Capacitive touch controller */
> +	ft5x06_ts: touchscreen@38 {
> +		compatible = "edt,edt-ft5206";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_captouch>;
> +		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};
> +
> +	typec@3d {
> +		compatible = "nxp,ptn5150";
> +		reg = <0x3d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_extcon>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +
> +		port {
> +			typec_dr_sw: endpoint {
> +				remote-endpoint = <&usb3_drd_sw>;
> +			};
> +		};
> +	};
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1337";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_gpio>;
> +	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pca6408_1: gpio@20 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pca6408>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pca6408_2: gpio@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg = <0x2e>;
> +		label = "tpm";
> +		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&pcie {
> +	reset-gpios = <&pca6408_2 3 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	clocks = <&pcie0_refclk>;
> +	clock-names = "ref";
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm1>;
> +	status = "okay";
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&snvs_rtc {
> +	status = "disabled";
> +};
> +
> +/* Console */
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +/* Header */
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +/* Header */
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_drd_sw: endpoint {
> +			remote-endpoint = <&typec_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	fsl,phy-tx-vref-tune-percent = <122>;
> +	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
> +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-comp-dis-tune-percent = <115>;
> +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
> +	fsl,phy-pcs-tx-swing-full-percent = <100>;
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
> +	fsl,phy-tx-vref-tune-percent = <116>;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&xcvr {
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_can: cangrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x1c6
> +			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04		0x16
> +		>;
> +	};
> +
> +	pinctrl_captouch: captouchgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14		0x16
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK		0x12
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI		0x12
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO		0x12
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x12
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x12
> +		>;
> +	};
> +
> +	pinctrl_extcon: extcongrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x10
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x1d0
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x00
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x00
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x00
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x00
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x00
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x00
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_RXC__CAN1_TX			0x154
> +			MX8MP_IOMUXC_SAI2_TXC__CAN1_RX			0x154
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_MCLK__CAN2_RX			0x154
> +			MX8MP_IOMUXC_SAI2_TXD0__CAN2_TX			0x154
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: ledgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0xc6
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmigrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x10
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c2
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0x1c2
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0x1c2
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c2
> +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0x1c2
> +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0x1c2
> +		>;
> +	};
> +
> +	pinctrl_i2c4: i2c4grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL			0x400001c2
> +			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c4_gpio: i2c4gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20		0x1c2
> +			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21		0x1c2
> +		>;
> +	};
> +
> +	pinctrl_pca6408: pca6408grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x1c6
> +		>;
> +	};
> +
> +	pinctrl_pwm1: pwm1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT		0x116
> +		>;
> +	};
> +
> +	pinctrl_restouch: restouchgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0xc0
> +		>;
> +	};
> +
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x1c0
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0
> +		>;
> +	};
> +
> +	pinctrl_vmmc_usdhc2: regvmmc-usdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x40
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12		0x1c4
> +		>;
> +	};
> +};
> --
> 2.47.3
>

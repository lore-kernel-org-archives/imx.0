Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB383347520
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 04:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775188831; cv=fail; b=ihyp8lRA/teU/P8bjEIDpndTpv2QGQvTegPY02SW7poh+rEfiuCUH/WJPhejkFvKx8lieX0aYPPxxjDrkcT0jO5DNfTDcH9Knt6LKlXPNTTCmsRMCsOF+ZN2cMW46z43EMzE0GA8Pcso/Vh1QuW2S3BuYWUhBO1xou91ZqcvtvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775188831; c=relaxed/simple;
	bh=OERHyFNR9jFBHJ/rrt5G+wWMTp+vfejMDlzMgaS/cCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a4oGgCMbba7GCD+55pX/n6f/yErWG/L/EInBxgswTHkt9RHjMDK5lpDJmWgagOetgZ3lHPHKEsPOw1jrxAUiB7VMbV+24ljQcBAVR1Vxf9bLMKjglOtc5hlaivzLRb4KbGqMPv9Uzi35uzg3GmxIyMn6B6u0fohA7ewBrUJWrb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SYriPUr1; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SYriPUr1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEwkUv4C8LhSVBea6iJ/ZzMkUTQMDRdRt2EEKMCk/soWX4cM01T9kSjXiUZusn5VM4uuMNRnzyq5cej7s6K+QZYq9fm/0SB9gvXvVdUjY89AYDb1amUJ/iLLibdK9LCUnWS27Ax1YftEdtgQup2K9vbMXqGd+OzMrhGaow2+YCZBFuTNJZBGcEmOz7x+RPuLAuVYdkAUpkzcD/GLJUbqdCg0Xkwot4xK0zaAprJNYbnE4Ls1gecIudlDpjJS/kdx+Lxep6iADK3KDlDEvsvqcqsH68QA3erIwX/HcwQB+GNl0v1pVEGKE46rbDFl/Js4BwCNXUVfJvHu4QW7pCjyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDGH5rnvDjGs2iYXTqzlofiEvEFhDmxQWJNHOYO7zcc=;
 b=h3Vi6/0U0aWTD5VCS5Z2VUweuMXAKfDDMjGspNnvmFLOaxt2gloOATYU80ePnF5W8F5WkWgd6bp0rv/0uSOz0Rd84hSzWrdTlIoDqjwMGB9Er/PZiIoMGXsum8M7nQJ6RCiOWFt7SqHHUgOg9/Ip7KHJ72KxjUILBsOYCKsOwtRpqCr6czAlpW9eYkwPBf1718ept8gQa07uh95lw1MmtygHpmvmatEynYqblouXiuL22zv0gzIWSXAgFfOo7mqAbQz5tsuiVanS+V+Vn42syTMBNwvwRBXHdwxCPrbSKWMxanb8m6UuKWRMfOQsufbmajUKA3TsbxGR3isAc09Mdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDGH5rnvDjGs2iYXTqzlofiEvEFhDmxQWJNHOYO7zcc=;
 b=SYriPUr1wxG87/NqT+MUOqH0ro4J2a5LEKgQS5aWuz2OC8XSfwAEWlYIT4CB4igOl1x8jKPC2z5uZIUIFLEe7vPVfeh/EBbS6tSlkhkEVnJPyqNLHUBAdoUF4YxXVeywMTQM3LkZlI1K84uLZ6/bJgFU0h9DqNeE3Oab198ryROXIrUzE2iKPu2onMiIyqYsuuxUFo1S/yRvonuYMOxTSfAoqAub8LdhUt07261OZBGufpC9TZ3nxQVcc/tIvAOFxcrvaNJ5+3cgReBLbMAKv6sAqkPcdkReIwsRLrSYpCvdho4kbBq/roeAf7TZ9DIbUF0dvV+q/6W9Y7K7VkX8KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8925.eurprd04.prod.outlook.com (2603:10a6:102:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Fri, 3 Apr
 2026 04:00:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 04:00:26 +0000
Date: Fri, 3 Apr 2026 00:00:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Florijan Plohl <florijan.plohl@norik.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18
 overlay
Message-ID: <ac87U9yw-6NcIdkQ@lizhi-Precision-Tower-5810>
References: <20260402070826.970012-1-florijan.plohl@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402070826.970012-1-florijan.plohl@norik.com>
X-ClientProxiedBy: SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e90cf35-97a1-4923-1596-08de9135897c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	snYBh+X71AfibPI7/O03jLWpAEoOgURmULsDMiBA1cLO1PJF3TyFsEFm5YP3TmOx7VViYoes6l9VPjVZl8I6gA+JvK5Zy8r0+UBqfuWq0UXRg9yZoXp07Lbj9NdAAYeJIABqvHZf0dVWEww8sjyKTA+L6IHwq5pnSbu3ypXtQLqBjNpUuW8ovA3Mxq+Ae3kY95WppJxnMo3u1wW2IFsWFYz95sZai9PnJ2qioC2HjSOXMI+n6GEwUmwDXCWQMbadyMiQCNPrDcG/hra/32rZ+4Kk82Wnboh7ODvPbxrX/GouOVflWpGGNX7Pt/WWOa7IZfO+IdWRR73WnExWLCtrkYvRVv00cXDlRhebRi2pjSFS2MfpwYA5lQfEWldpAqMaJdJuvmlHPWVQSY7GSRHaXwNYIxKOmtl5QsgMHcSJkwY0p/iBkXQqTHxhI1hO2oDvMpKTOMOx8eTM0QcHr/786kDHahUoOTG30iavH6o8XzmNVr0mBkqX/oINugh5796h9dSMR42tnDBxEwxktJjo2pWD2o2InUcxhIDAfmFjjppF1egMM8ylr0GrRHyD3UuUEpnWTV1T5qAj5xmcyBIArNCKWg4WTHziP2IEO41LH2ho3lRIFgXOMFF7g9ZTfx11NVyP42iW0zgNvS4r4Me1KaVCO2bwR1Ox3eLAvF5z9vqOIH7xPLav2dUL4ShQ0fbl2NjO2xRINSB7MOXE+j/xTLKves2rIdr0dlPXwIuI++o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gBEBPi5L+ilabiUFIYavka2cc/EdoM8w7HHgad2nHm91pW/zpedIwBFwptdO?=
 =?us-ascii?Q?8BZR9JZQLHVhH17P+8nTULMOEn7+C69USckL2e1wxg7gP9IOYSc/+UAd0QJR?=
 =?us-ascii?Q?88xI8TIEJ1E4wjDVGgrcOiR+pOx1d61KxGIgvAe56mS9X16NytsKTojX5nkR?=
 =?us-ascii?Q?g+A2gPeFA45Z/wr8zr+p4O7qBWk0Lg+m32vvsIuKp2aBBUiZ14Jneef6H7Rz?=
 =?us-ascii?Q?K3j0lRXEDbszfeWA33aTWnJlfijlfk/02pKZfqFW7Bpd8mIYA2NPw5m9MxMU?=
 =?us-ascii?Q?3wjAnZkXBgU3B9bJpCcfY/ZqMhDuKigD351C6xeo8skqeFUCo+09Sb94kWyE?=
 =?us-ascii?Q?fPjhHPaI9Nim0gWgKhctZRUiyGwIQqqFtv2wiWg/j/Mc+vWwakbwXt0zRred?=
 =?us-ascii?Q?N5GM/x0OSfxJgbOlcO5GQmOCB7aCu9ACXSCTa5qBcUEENg9HyT+c9OXfUcvW?=
 =?us-ascii?Q?xt4ZR3Z3muXxAIzyticZIZSgIUugfvMLaUVoVsR0/sUb5deR+SuQ7w/9DKwz?=
 =?us-ascii?Q?pKX9i3QCTODR4viZ+BV2KYEShMDzKsJtk1uZzgNeiRxXnT774jXrf4qg5J9n?=
 =?us-ascii?Q?yH/+1m6Zh/YitoBStrAfkNg2M8E9wz3zxr1e/BCLfb90XWFuX+yaNxH1YJi7?=
 =?us-ascii?Q?fjyYMZJCfXNXD862MZ7lsyXWi4fXdzGZOeQAScehkAbsQmGcdzzPjmqxWqFK?=
 =?us-ascii?Q?YuuYmUlXmQySNQrhd5pTmCGssBdXRihIkSO9vMVQQy/JVLQxA8yiOwSmCHuk?=
 =?us-ascii?Q?HDtxBnNDCpqbm6Uri7s3n3FS0SPYtHNQfRr5o3o1lW7cqEes6j1o8zz884+I?=
 =?us-ascii?Q?V6I3ka5q66Wm6FzN7lJ7n+KGErnStqLDqMDbK9a8qY6oOGC47Jlf4wKH2qZT?=
 =?us-ascii?Q?ToQ4ZLKZzXD4eq2PEY8nJCo1ZcJthVls/gEayY6eUBmdqJW+aAFftIwnpwb7?=
 =?us-ascii?Q?aEYpnTS4zIZqeig+PNcYNqtPRaGJ4AYfd6nQVaHi84Vtgz/uhhVTpmdNSz4C?=
 =?us-ascii?Q?5v4wEi7B/PWfTTbQxMsf2/HzesdJDffWuQCq3+MLuca0/dJeTqUjafs0vJbx?=
 =?us-ascii?Q?LR8WeHi821yZXotFC3eQvlW4/Bdr7ZWOedXl41UPf1x8xuMwt0je2FnDIITk?=
 =?us-ascii?Q?ICwVRkow6Ex4pRvyT7b6CuLe8qXdI9ieVugG4qHqckpUniW13x9G49XfZPio?=
 =?us-ascii?Q?8GuIPhQAD8uoDzyTW5jbE4RL0uF1CzOe1GHn8oOqHaZ9mPUzFLkPrBX4BCKP?=
 =?us-ascii?Q?Y8ucdnV2c2rqa4qPcs1LmY0amtexKM2N8ZSCjMnWc2VApu5QwmsMijBfbIso?=
 =?us-ascii?Q?UdCiMeSuhzTsDbnMbXpSuGFfQUzW7Y4SE6mb9LQKFb3RAIX/ECoD3yj2gme9?=
 =?us-ascii?Q?tLogcX62pPUSsFaNWr59P7ztMK2WktgHp6tb4kHQhcIYuDvvpMaucO/s6kxj?=
 =?us-ascii?Q?AGPmfHPKIPlo4qBBGIQpLjJ+3WfQFsVeaMyiICpsXlUmrL7oiUs/Nogy7TF3?=
 =?us-ascii?Q?a0O3mUAmRmS0NYdoW5AaI8seB42eSG3glq0FlU88fGH1t9X/Nl1ArIOvRFtL?=
 =?us-ascii?Q?Hm1DxVp/B/9B1SF2/S9kEC0RhzxLRZGnkpSM3sbYMkhfRgncjdOsuqKvRqPH?=
 =?us-ascii?Q?qLwmVpYCYzIb4MqQXTu7+rI49Q54IW0LB28m/Q3ftGFiDLnJSxPBYiyeVvFw?=
 =?us-ascii?Q?9/zl/JCObsO0bJE1VBx8/UjM2D+Jarn0+63mmGOfgtp6Y15ZI+b3zGQId78P?=
 =?us-ascii?Q?c0bf8acO6Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e90cf35-97a1-4923-1596-08de9135897c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 04:00:26.1039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjjvHCLvbKZZLch4LoQ1monhiKaRIlp+0Af8QoIJjzVKpYfqc3zY6k5xwPnFIxPtB3+py6FGCPqGdhhxvfrqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925

On Thu, Apr 02, 2026 at 09:08:26AM +0200, Florijan Plohl wrote:
> Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.
> The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).
>
> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   4 +
>  .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
>  .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
>  3 files changed, 288 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index bae24b53bce6..8f5b3996b678 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -437,17 +437,21 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>
> +imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
>  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
>  imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
>  imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
> +imx93-phyboard-segin-peb-av-18-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-18.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb

https://sashiko.dev/#/patchset/20260402070826.970012-1-florijan.plohl%40norik.com

"should this be kept with the other imx91 dtb definition"

Frank Li

>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-18.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
> new file mode 100644
> index 000000000000..ec6ef2e5a11a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + *
> + * Author: Florijan Plohl <florijan.plohl@norik.com>
> + */
> +
> +#include <dt-bindings/clock/imx93-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx91-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <5>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +		pwms = <&pwm7 0 5000000 0>;
> +	};
> +
> +	panel {
> +		compatible = "powertip,ph800480t032-zhc19";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dpi_to_panel>;
> +			};
> +		};
> +	};
> +
> +	pwm7: pwm-7 {
> +		compatible = "pwm-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwm7>;
> +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		#pwm-cells = <3>;
> +	};
> +
> +	reg_vcc_3v3_con: regulator-vcc-3v3-con {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC3V3_CON";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +	};
> +};
> +
> +&dpi_bridge {
> +	status = "okay";
> +};
> +
> +&dpi_to_panel {
> +	remote-endpoint = <&panel_in>;
> +	bus-width = <18>;
> +};
> +
> +&lcdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lcdif>;
> +	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
> +	assigned-clock-rates = <27272728>;
> +	status = "okay";
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@41 {
> +		compatible = "ilitek,ili2130";
> +		reg = <0x41>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		wakeup-source;
> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
> +			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
> +			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
> +			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
> +			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0 	0x50e
> +			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x50e
> +			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x50e
> +			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x50e
> +			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x50e
> +			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x51e
> +			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x50e
> +			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x50e
> +			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x50e
> +			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x50e
> +			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
> +			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
> +			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
> +			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
> +			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
> +			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
> +			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
> +			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
> +		>;
> +	};
> +
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_pwm7: pwm7grp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDIO__GPIO4_IO1			0x11e
> +			MX91_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
> new file mode 100644
> index 000000000000..189b0f0472d2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + *
> + * Author: Florijan Plohl <florijan.plohl@norik.com>
> + */
> +
> +#include <dt-bindings/clock/imx93-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <5>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +		pwms = <&pwm7 0 5000000 0>;
> +	};
> +
> +	panel {
> +		compatible = "powertip,ph800480t032-zhc19";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dpi_to_panel>;
> +			};
> +		};
> +	};
> +
> +	pwm7: pwm-7 {
> +		compatible = "pwm-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwm7>;
> +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		#pwm-cells = <3>;
> +	};
> +
> +	reg_vcc_3v3_con: regulator-vcc-3v3-con {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC3V3_CON";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +	};
> +};
> +
> +&dpi_bridge {
> +	status = "okay";
> +};
> +
> +&dpi_to_panel {
> +	remote-endpoint = <&panel_in>;
> +	bus-width = <18>;
> +};
> +
> +&lcdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lcdif>;
> +	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
> +	assigned-clock-rates = <27272728>;
> +	status = "okay";
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@41 {
> +		compatible = "ilitek,ili2130";
> +		reg = <0x41>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		wakeup-source;
> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
> +			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
> +			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
> +			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
> +			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x50e
> +			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x50e
> +			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x50e
> +			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x50e
> +			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x50e
> +			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
> +			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x50e
> +			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x50e
> +			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x50e
> +			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x50e
> +			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
> +			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
> +			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
> +			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
> +			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
> +			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
> +			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
> +			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
> +		>;
> +	};
> +
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_pwm7: pwm7grp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
> --
> 2.43.0
>

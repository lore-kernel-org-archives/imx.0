Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A2C39D6C2
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772485199; cv=fail; b=O5Z+YD9707b6TI/tLJOBagYfO8ZHg9atGg9gOuaI0OJjuMi1ZEdQYX5GIvZ7jUKqgH6ZdGv013mWuPks9bTCSFbUtdp5uaHLMTTjC6vA68iDDCDBIdRXDCPTey6BWWqlwM4YvUvshZSgHd715ndp8iGyurHcgNpcEgeXh9RJz6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772485199; c=relaxed/simple;
	bh=+SdWR42WvsY0lDRQpw+fJebCHcAqOlKaSGO3e+n74ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pUmlVYO5PcFroGvCYTYDKB+W+3DzdUc1VCsnYQnwQP35e1tHBhyfyLvAxfCDhUT5hYVImrxeC9+tdI3Kx8oH0MekZVSWmr2IQ0FfH83bkESeBlYylNa7Om6O7EHoB689vNYS15412lCxJH3kKdFqHGsRwts5cScYtk8LafZp1LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=USSXmSG4; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="USSXmSG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX+F809PfcD1HlWJzKYAyEDQUy040enVuCgCBNHaKAKa3Z6yhKMZXtFKaEPdO8+uv5IU441sPv7oLYUeBDdVw/9DFBAkUnT+N2JRZJz9vGcFrdR/zLUm9tb0SWyZMbSz592bbTA42jZrnQ6D0BU5bcUyykWH9t/ikgU5qej6j+Dc5WC84egfrttoMgfSRCg9WMjp8fXlunl4O2NAZjhy6GWpKybmjAtLC1s1ldOyz3Sdle/7zt8ryWWZuqugiS7aZss+HvrD8Fh3/KYuXK/0tGdyE/bIjBONb1iGe7ZthNmW7BqiHCGawx4htp150Q8qq0SU/9nTkvRUaQWvyxmwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iavhqckQEdZZkiD3FLhzdrW4mguiGj/btxId5/L6kOU=;
 b=AMmP0dtjSeQF/9cF61spk0HA4oNorkYwRZbeOdcfHvP61FKxqGXL49TCjowYCB24Fc2uLqB/oa1VVuVst5yrpie9/w+onxqDbhwzrDErnvk7oePjk+m6KZgdMADqIBSyMhWDRfVD6Fcgkmk/FoPEMXph5UmBFYZbCkoI3V/feII8rFPgNiWR7lombzG41Iqw7cJJ3g/QNID38ElcmKJrBptG84H/+4Vz2QXrdlpHS721zEs01ddUUq/XWPqZcKTmCy4/vWniv15moe2PPhKYpv49TdHNUchGBUa8IOCe2++heTeJVJNXioJQNJFg17tRz9ctEuwNfff+auCzC8VtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iavhqckQEdZZkiD3FLhzdrW4mguiGj/btxId5/L6kOU=;
 b=USSXmSG4wpYm/SLGmVbYHo06ct4jEjR/zO2bu5Gj2ucM4IuKhw7FbjCQQ8YH7/hN+g9UL3fzJf6iq279mG1nxEdbyxjigKDxOQeegMsH0eB9TQzKNeeNFF9maQPd1ALt+13Os291yw1oto73CxO9Dygh/ZBSHb4IfpW1x/o0NIFVH9HBf4e2gO5cUWuejQ0vM76R1CrRsyVja0HvUVaaThrvKOk4CFcE9/CsruSIR1a/WYw6xwCNRO0oFXbUx5DAI7OxZOACiifb4K1j3vziB01JwzaQ1TCqadLsB1+mWisXC9brMwYcMkY4AfB8j83YQVNi0ss9cdSrqbDJs4RXMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB9111.eurprd04.prod.outlook.com (2603:10a6:20b:44a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 2 Mar
 2026 20:59:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:59:53 +0000
Date: Mon, 2 Mar 2026 15:59:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 09/14] ARM: dts: imx6ul-var-som: add proper Wifi and
 Bluetooth support
Message-ID: <aaX6P_ulJTq_pipa@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-10-hugo@hugovil.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-10-hugo@hugovil.com>
X-ClientProxiedBy: PH7PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:510:33d::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c7f825-6e96-43eb-f1c0-08de789ea6d1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 lZTvW+zxnl/elXRm1rDGryqeft1f9besTWV6pCr5Xc4g8Ow2eYcWZYc7YV5JtO+4IMOm9zNm3urMpGk4wHRteZr/ZtcycmfGAi7aMQYaPUHFuGJ1F3o8pRvQWKPPAxyrLFjF9UxnkwIYboIJxmGocJfG2/rs+kOOm6oRjJO6ZAH7NnfjDKeBQiFDShaDrhn3FRYmEqlMcf17IjGT9p+c1TVf7ra2Gk3WBShkr/jn+l7lvij7eVD0YQSb54A5/R8YNv/x00ag3Nc+9p4DXzJ/udM4azBdD88Lvyv83NKGm0JDd/bGPV/jd30nTjYcB/OsvbI/iMz+JVX5KXy0JGfAnR05V/sEI3gD9rssOHkDlMUHKanr998678MXVtot0Nbl3DvUwdA2aYxpjywI9dsv1PTHt4PNJ/IIMHi5k1wnZ0llQKro0+7jJVOiVlu7IVANQ8HMqbApsZCHgSkZDe0cv94AL0Hmb2g7be9FTnSLMy7+3OAoL2lQSru0ZVF3aJItpc8VKO/YRZB4hMcxBOaZdmLDVtwaNX+0ZE/R3hIAncEJ5TBE/vMXGtjMUTVrJ+Qi1GeORCywy1UmfwBJ9eIAccQbod/jK03HnhQYw/4VE0FyQB9J9nwGTnNJnaM9kred/kYGnTjJjLSdsg4kO9xoBLb6PyhpECezyc61oat2DFUs5Dl8Kn1J5uMkJWwmO4ZH6IVHHKPsNKAS2TigUNQaegkrSpRrK+TLAqR9JrM/4VY9RPDWaJ9iOO/qA36df1RBTOSiE26HhGqAH8v+Kxpt4Hs59eNPl0Pi1u7nGJzXn1s=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+KzrK78MHdk01hQWHlYSFR8bNv+gbMyAm9jPu4LA866kSBVbG/2I5H2YRFuD?=
 =?us-ascii?Q?imDgDErCZjWyp2N93sweBYF0klJyU6SurG5WSOqYMfLtTXBS57vRn3r+dhwy?=
 =?us-ascii?Q?Ao2tFT0NkPBWMq0gAGlx/lMq7PvWbrJCpeQ8kVLKJ3nahmkOei+OuwCTT3X4?=
 =?us-ascii?Q?/CnpThQfCsjCjXN/PnFegzP4BA3Z0TLSv6epFN19uZKJv0ow+4iYBWHu64i6?=
 =?us-ascii?Q?cDJyEn8LLG9kF7jmlQbxtDiwSWnlydbSbIhPPcblt+auVEu/R2dN5yPsqbO6?=
 =?us-ascii?Q?XdmmOxGmU3w0/NmQppYHOi1s/mFhs3uf5AwKaoJOWsdFsP4r+aF5wDvXptVi?=
 =?us-ascii?Q?IpudFI331iaHj9/WTF+Jjbq3FCm2Yuf85A9qWcuZ6BrmcT0Y2FRTb48wuMat?=
 =?us-ascii?Q?VweIhQxcBxjdabvjOmLitiVbG06yZN7xhgdmL0SJUv70Ecv2FMQeL4rdhcMb?=
 =?us-ascii?Q?StExfmMIgSLGwKdYSD1gegHzNFU+e8Hp+bts2oEH0yWp/cBquBfvDyzwiJOk?=
 =?us-ascii?Q?FpXH/HOETmW8l43H95eMFtPuRveDhxJAqIcJznL3yPY54PdAqFkSjx7oN13i?=
 =?us-ascii?Q?Pbo4w6OrAo9mv+uxakEahF5z40ZIQezJsorM8vfchbzVX9u0MufAo13ZkZA/?=
 =?us-ascii?Q?jDlV+BinX+Vooy2Oo1SmgsXmm5sl2BiT1r7A3b0KywrJOdJiY5BPyXqBMZk+?=
 =?us-ascii?Q?cYMMUk3S7RP84BAkUF7Z+evE8lbc8MjcYz81tEThwP/v9VpAjGjPjFgNlbAI?=
 =?us-ascii?Q?d48jK77KAyc6byQUNYVlytfWHJWJ5zDknZr8ukYGpqqFc5yu3kkGtVuhI5Xf?=
 =?us-ascii?Q?Rp4WI339AsYWBaR/w4qBoTI0BSbIM01I1xxau0sAVqI3jbbtZG1ui2AP7yuI?=
 =?us-ascii?Q?MaDstNhQNSO7oRqzlNUca8zh/wojnCRavmM7e8puQiz7TU5hTL6+dbwqnu3z?=
 =?us-ascii?Q?Fk2yt7QQg2KP7IVT8V8yzRxkSObcisk2gRTVDI4+vp94J6pbbunLqajkipOr?=
 =?us-ascii?Q?QJ+nMmdEATyYpRKcBFfupQk73m29P64JIt2mmcMesq6OdsCPHD/0qJQhbW6m?=
 =?us-ascii?Q?cB0Yrp/fmu8LOwnDzxwOxP24XYrFZKjZqjo2RdQQuZGu5nPiKH3X7MUeh6ql?=
 =?us-ascii?Q?0N2P72qz49ljjiLqALXyycZNkicPQ23Tvy79XcNpf1nJYohvfDMroCVQZ47A?=
 =?us-ascii?Q?wOYgSPna1tHkI0gxHFJY93rHlQW2JLSO/s7oxpogunbe7iyV/MRCgNysx75B?=
 =?us-ascii?Q?oqAUUz5DZKHYmUGf1xfWxBGGcS52ztUc+P/Mhx2gkVBD0uIPF8tozcz8FjLt?=
 =?us-ascii?Q?ANtAnt7/O4T98D7Aziczg6xYW+Z0s+z3avsBRwhTTI41tuECpGffHvFQN2jj?=
 =?us-ascii?Q?Oa4TfPpYVywiuMXgcLEaOlugJJZL5g7uQftAG/5v3qsXYh8EEjIZXAmdjllA?=
 =?us-ascii?Q?oTN0wZPuGMPb6j+gZwsWKUEtf4ZeRAtCx6iI7FcGmHm9508xAQMkJ1vpcTnw?=
 =?us-ascii?Q?/Q50wFRqWGIpTUx/5NiyTZHuLZwo+6spNuUhfhyApM3Of5aeXOaiIa8+m7AU?=
 =?us-ascii?Q?HJOmY7qfnTxYqLV6eBCZvFHstaTg0KU4uCpn0Ra/N+Q76plD3DOCurcwyjQZ?=
 =?us-ascii?Q?xdVNi6oYJVy713QddXlSciBvw9g7Swb55Haem6+zdjaQ6POLnKXKJbCF4Mis?=
 =?us-ascii?Q?1XSOoyKF0fs16IXCcZ4+Ar3Ws0jSw4YQQr8VBq4YfjR04jTg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c7f825-6e96-43eb-f1c0-08de789ea6d1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:59:53.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX8ZmstAr03OnCk3xWMDCzwJEt5NnkqKuEu5AH6QxslUUWisXLJ4fXmk7NOPUpfxmiTDFv31OuwA/biaevd+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9111

On Mon, Mar 02, 2026 at 02:03:45PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> The existing configuration of the optional Wifi/Bluetooth module was
> copied from the original Variscite kernel tree, and requires custom
> scripts to properly configure the Wifi/Bluetooth module.
>
> Add proper support for the optional Wifi and Bluetooth configuration on
> VAR-SOM-6UL so that it works out of the box, without any custom scripts.
>
> The SD card interface cannot be used if the Wifi/BT module is in use.

ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support

Add the optional Wifi and Bluetooth dtb on AR-SOM-6UL so that it works out
of the box.

The SD card interface cannot be used if the Wifi/BT module is in use.


>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |  2 +
>  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 18 ++---
>  .../nxp/imx/imx6ul-var-som-concerto-full.dts  | 18 +++++
>  .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi | 75 +++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 15 ++++
>  .../nxp/imx/imx6ull-var-som-concerto-full.dts | 18 +++++
>  .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi | 15 ++++
>  7 files changed, 151 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index bc534d0fb1412..c7f24ee63071f 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -339,6 +339,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-tx6ul-0011.dtb \
>  	imx6ul-tx6ul-mainboard.dtb \
>  	imx6ul-var-som-concerto.dtb \
> +	imx6ul-var-som-concerto-full.dtb \

how about imx6ul-var-som-concerto-wifi.dtb?

>  	imx6ull-14x14-evk.dtb \
>  	imx6ull-colibri-aster.dtb \
>  	imx6ull-colibri-emmc-aster.dtb \
> @@ -377,6 +378,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-tqma6ull2-mba6ulx.dtb \
>  	imx6ull-tqma6ull2l-mba6ulx.dtb \
>  	imx6ull-var-som-concerto.dtb \
> +	imx6ull-var-som-concerto-full.dtb \
>  	imx6ull-uti260b.dtb \
>  	imx6ulz-14x14-evk.dtb \
>  	imx6ulz-bsh-smm-m2.dtb
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> index dd4ecff1eb786..af8c5d2db53d4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> @@ -19,6 +19,14 @@ memory@80000000 {
>  		reg = <0x80000000 0x20000000>;
>  	};
>
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
>  	reg_gpio_dvfs: reg-gpio-dvfs {
>  		compatible = "regulator-gpio";
>  		regulator-min-microvolt = <1300000>;
> @@ -68,9 +76,6 @@ ethphy0: ethernet-phy@1 {
>  };
>
>  &iomuxc {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_hog>;
> -
>  	pinctrl_enet1: enet1grp {
>  		fsl,pins = <
>  			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> @@ -97,13 +102,6 @@ MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
>  		>;
>  	};
>
> -	pinctrl_hog: hoggrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
> -			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> -		>;
> -	};
> -
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> new file mode 100644
> index 0000000000000..519250b31db24
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> + * Variscite SoM mounted on it (6UL CPU variant).
> + *
> + * Copyright 2026 Dimonoff
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ul-var-som.dtsi"
> +#include "imx6ul-var-som-concerto-common.dtsi"
> +#include "imx6ul-var-som-wifi.dtsi"
> +
> +/ {
> +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> +	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> new file mode 100644
> index 0000000000000..6d16ff7909dab
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support optional Wifi/Bluetooth on Variscite VAR-SOM-6UL module.
> + *
> + * Copyright 2019-2024 Variscite Ltd.
> + * Copyright 2026 Dimonoff
> + */
> +
> +/ {
> +	reg_sd1_vmmc: regulator_sd1_vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VMMC1";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <10000>;
> +	};
> +
> +	usdhc1_pwrseq: usdhc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_brcm_wifi>;
> +		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_32k_clk: 32kclkgrp {
> +		/*
> +		 * For TP option, an additional oscillator is assembled on the
> +		 * SOM to provide 32 kHz to the WiFi module. Without TP option,
> +		 * this pin is configured to provide the 32 KHz clock to the
> +		 * WiFi module.
> +		 */
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
> +		>;
> +	};
> +};
> +
> +&tsc {
> +	status = "disabled";
> +};
> +
> +/* Bluetooth UART */
> +&uart2 {
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_brcm_bt>;
> +		shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> +		vbat-supply = <&reg_3p3v>;
> +		vddio-supply = <&reg_3p3v>;
> +	};
> +};
> +
> +&usdhc1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
> +	no-1-8-v;
> +	non-removable;
> +	mmc-pwrseq = <&usdhc1_pwrseq>;
> +	vmmc-supply = <&reg_sd1_vmmc>;
> +	status = "okay";
> +
> +	brcmf: wifi@1 {
> +		compatible = "brcm,bcm4329-fmac"; /* LWB option: Sterling LWB5 */
> +		reg = <1>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> index 35a0c0b3603fd..b4e6a9316dd81 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> @@ -15,3 +15,18 @@ / {
>  	model = "Variscite VAR-SOM-6UL module";
>  	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
>  };
> +
> +&iomuxc {
> +	pinctrl_brcm_bt: brcm-bt-grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> +		>;
> +	};
> +
> +	pinctrl_brcm_wifi: brcm-wifi-grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> +			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> new file mode 100644
> index 0000000000000..7c0e313603630
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> + * Variscite SoM mounted on it (6ULL CPU variant).
> + *
> + * Copyright 2026 Dimonoff
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-var-som.dtsi"
> +#include "imx6ul-var-som-concerto-common.dtsi"
> +#include "imx6ul-var-som-wifi.dtsi"
> +
> +/ {
> +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> index ba482a97623b2..3067ff6a1bc74 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> @@ -13,3 +13,18 @@ / {
>  	model = "Variscite VAR-SOM-6UL module";
>  	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
>  };
> +
> +&iomuxc {
> +	pinctrl_brcm_bt: brcm-bt-grp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> +		>;
> +	};
> +
> +	pinctrl_brcm_wifi: brcm-wifi-grp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> +		>;
> +	};
> +};
> --
> 2.47.3
>

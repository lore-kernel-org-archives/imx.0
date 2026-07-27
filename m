Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97642BE93
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171173; cv=fail; b=MIzuLdYqdZkm3BKRBUuIXhh4kpfKdQny40UESdxkIUA/nNv7CvNZDICR23SCf+c1a6QDb3EaC4SFUeAGlI2kLQOWqXD408vtsKiFaGr0dfez09if/X8tZrB+w7LlYeDSQwhyxGHzK+7WygihK1b4eaP6H67JFey1lEFkqeyzdBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171173; c=relaxed/simple;
	bh=C77Cnez8DsGiSJT1KptLGFJSO2FdGZ9tCn7Dwhy5lsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uYpQ4d6Z+poUxQslNvZ51ubjYo/FSeI681opMLjtmuehoE9k3KQvYUYJ7M6g5TlnZv4Dy9xclki8sGgQHXe16aoHOk6RST4FyVH+ZhA+jTHBTyiG0T7Eo0CP41e1fk4nRJ994t/kqgRqI3wN2wzuIsW6g73X7U/GrVKGC/iIV4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qKaab7Os; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qKaab7Os"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrkZXLSjrHqAnB8ART4tlQsCl0dt+QVbDckjNYWhf/EHchoTdhcGq44c2quyCAM6zUaYO0qI7NW6MFRP04o91e5P7LsT6RJmDlEzAqQkh30OEwwS70fld+L9M5PUEXKqykAitUZ57lnWZsht+Ov5HfsyGvkQsJ0OpRfFnWQeY+TR11d5cXGRar8NyQ8PMMMrLjpW11dKgJ8uAHxaP2LxtEBmIMYTHIziupxaawnWY82ApHbTxIn+h2Ijaodc9D8ZS5V2KHhfJVBPbla+qqz4j4sDj2X3/fyPKvxrDZTr9tfTb1mu4WJSYQvmxpT8ii7nfyQR+j/TSTOM3LY1QctSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpQU4B9ayjOEs8+nSRTyDzl6GEX0Hue3ZG8N93KhoEo=;
 b=v3tUa+4zXqINdvL2ilzNwli6VQrq8K8qSYJOFELtUwtCktMT72UPLTCICvpE5wqKfGib+EGJeCSZACzGRxPq9BCJG7JWUuRBzCDzkLYmnncek+ml6crroT2tQkNWUI1Yngx+rQ+Q0YaCkLd8O/bNqr4ejevAw36DYf33hS+YXcG9ivytoa5JG1LFkhtBgiPP9bNn+0t22yQ1TLcIMtkHpGfT4Ydgd0u6NmGaTPmzcHx32lk2Z/bvHB9r0H1zfNVP8hkQHQrUuyJyuk8u4sKmKOCWPvRb9B7LsdsiQH3qPDsO/GcizV4Kd5Av+tgJWQAZcxePLBNnwYsRLORIM23blQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpQU4B9ayjOEs8+nSRTyDzl6GEX0Hue3ZG8N93KhoEo=;
 b=qKaab7OscT/HiKkUAF//R67+8mfHNLt5rAZxjlbxkwGKkoDlq7VFHqWhAfQckiaYNXzOCGUESzdp3Yuhvx4MoV+qgNjW1y/Qizvcn7jWReAAkLVc/xW9paFq03B318Gsnjs7MVfKxtrSnPrk1ZLOQR+Pm0qOTngHx24YGcrHxWKP3mH5h8vfpNfec4uuq8pMX7InNZVs1FusYydqUtBWtglhZLuOk38CfXwI+pFd7AAXxc2ik9T26f5WXjnBzqN/oBULC1dT/rEHmTExW4In2kYPiK0M6qSJG2GpinuHOP9Q3si8yVkBElvxjAk9oD6V5itp+18FM7U6iUiiQ48CCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:52:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:52:44 +0000
Date: Mon, 27 Jul 2026 12:52:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <ameM0wo_aSuknWc7@lizhi-Precision-Tower-5810>
References: <20260716055751.279033-1-marex@nabladev.com>
 <20260716055751.279033-3-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716055751.279033-3-marex@nabladev.com>
X-ClientProxiedBy: PH8PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:510:23c::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 43918930-108d-4a96-818c-08deebff7ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3CaYweuMwiFNfgtciUSvXqJ8OHShthjw3C0eEYSiQP8WV4vGG9uW/nUtTXPlO3rnGHtFKVr0S3eTLXfcMue4SZSxZDAmgfaZTDsmxOTYJqwtlfR1Gezv//O9LFnecyVNmjHQmd4XGwnSrGOoycPv7YfL/4N3+P9xxYqSUKJUpfFp2rXgrjEPkMz9mRVrQh3GYMsjk4tGIbXL+RIUU1zaJQ5INdtJZf3ty7ZE9cRqAyVsq7X2dZlb/xr6IgwMGrd75PXrDjoFD0u4frXlovb6ZNjRbqUrU7OCJQ7anRX5S6AgcMgThWtDCpB0TX8SIT+rYRPD6rQUb0tc7dDpsOeFPkrZ+0N9QhIvieqX5URsegZX42w4vA3Lt3XlWDDbojOY0K3WR57RDAfh5JJUS5pNRfmdHiuDz9Yd0kKkywzPzQH0rI9ok8JZfbNBdec//HZ8aaJ8Xp7ChOK+xism5vLe33Xwfz0dsOabbjCcpih6ZhZG+0VkHy7dY7R2tA9eNkC+aIzdwj+MAmOZmWyMPjSU8skxfzOJor9yglgPrdgnjgUbTSW5jvUDQHbba2eYfr2cWRHns+IDXeqjoN5sLyGfrcILcmi3r+n/Ayp27aHs7Db/c6S7WEtlAsnst04XmYC8mRNbAD0ZMcV2pz9gpeKnbL981mI/IDcmMloYFmIGMW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRRXDKu0ZI9aE7hdZiQ0A3xYSmAfFv2AIdN/Y6igrIHuyu+6/Y43TJVr3aDZ?=
 =?us-ascii?Q?ldYyL9KVRajpjTiYqeDbzRUcqGXm30YY/VMe8VEr4TUQoqTG/fTfGj02X3yr?=
 =?us-ascii?Q?UmAuc+vh/x+dN+Lp7BFRbf5w0x/hzTF8gcZC2G8XBXEr9Szwb1oGX+IbrBsP?=
 =?us-ascii?Q?embsi4sRBJ/eWCRP0BM5yYiZBScPwSsfye11yhiBMQz+8mKIMUXrI/yfeNUc?=
 =?us-ascii?Q?Iin5qULKCZ6jRxayy5Pf6uhqvVO9qCN97V3HfH++vVH7m7QQrY/ZW+wxVSmw?=
 =?us-ascii?Q?lsp6TKgi5RWnCCrbBOaZvNGSkDiniu39ypS/AsNzGZePdxjtrNECoyiz97u8?=
 =?us-ascii?Q?p5kR7iDZAtyN34jIDI3YYmZ+Bvk84Qfidjl1wk1n9rZ6O5xIRR/i/MQzGf5u?=
 =?us-ascii?Q?tPnQIsxUbFfU4+O7BORSLpWF4xVqj469Lruin7ruh1ho0AkgbZMI/ep/Zrnl?=
 =?us-ascii?Q?4fyFVQCGWGJ7LIm9MAxISZZaXdNXgKcC+3ejvWZ1ckrGtnBPYfqseaSMS0Ai?=
 =?us-ascii?Q?Vr3xYuh9tf3PGe3woAxpAWJSGTO9VZHtr64AoslTIIBBwrYXNZGwtDfPealJ?=
 =?us-ascii?Q?T/ClqkrVIosWB+pgdgWp0IcH9OvQ3UVLCdFAXAa44Lmk3HHQZPehQi6U9eBd?=
 =?us-ascii?Q?2e16QYtcCXEwHCopveDk6K35B6SnzHeuMJH0vgV5kHAsCUhmhwjb22kB8MtB?=
 =?us-ascii?Q?4QbQjLeZslR4OGRFuaqilTLCyrhAex4vROiWuppLzemrOz5g9d4zjCkbhyns?=
 =?us-ascii?Q?O+KOZOsxO51FDDwit/42lH0xmRblNLSwJhs4PfB1J375q3DNBglevly7415K?=
 =?us-ascii?Q?Efz5cHXSjIT3zqodgP5qkLLLSwAB7lfGbPVdvPn57N0Gwxu54VT+7vpiYi5e?=
 =?us-ascii?Q?AkLCO3TgzU9aExzK1i6VikeWDrHSR3BBhCjAk0y6n1NJBbtP0itT4b4MIi/g?=
 =?us-ascii?Q?Zb/uaHLo3IzxR7KH+lbN37QYURGRoSk2WDfkKXf1S+YzyhWqQAmqTmFxInZB?=
 =?us-ascii?Q?XODBccbVRizh99ko7693HlJUQSdHxOPdgoT9c/nACQY7mKQ7AtXCYNcOh6Zq?=
 =?us-ascii?Q?kPTY+b7aQXdTl/TZLD2ev8Ehz1T+YAD59WfNO7wGz10Th+GXMut8oNTKfqsY?=
 =?us-ascii?Q?Cb27M1YZEvDgBdiHds0eZZI/4MPsUvtaRqA7Fe6+0NgQks0iDJ7dLMKOol8T?=
 =?us-ascii?Q?FEUeD0KIrHbTUXeszFFslWLAU1SrO38gz4CB/jwF9CWWm80EOs0jQtstG+PV?=
 =?us-ascii?Q?gvMdLL463gR6SONs4rMRSsDMAn9Ah3UtFDHyykkkmkBDqhHsGcF1RBtL9oeA?=
 =?us-ascii?Q?ZUWoRZEACtwVRZ5XrLgtnH6dO/gtqIxYEoyZq/0+uZlnMLAAGIlyCcDWX8VF?=
 =?us-ascii?Q?epmSb7bzknVIvZTYoHdVYTQVwYHgQfoCrRyrUyCG5iUyF73PjltobkPD+eDL?=
 =?us-ascii?Q?pm4fotHYD3YdY2BCpivYYoGWRaFeXr9U4W3xmquFHyqy14avPijVDeypDDS7?=
 =?us-ascii?Q?ru1kTli7nslgKVQz0wBIlna2zFnJtGe88AGd3Hsi/IgWGNrdU0EBQcoI01N6?=
 =?us-ascii?Q?JOT87ligtLak6I/iD0sjcLnKAUGcas7tw6SCq0L4iM6YhAcnTS2aan8HokQE?=
 =?us-ascii?Q?DRbwJNdZEJGvYkEjRXMF1EXfrvdOLchyUMV1QNVbJCoj48as/4AhxTOoMcMI?=
 =?us-ascii?Q?8Jert64bTjVM6e/xbeIcJNiFv0TqKsCfalLK/wLGQE73SPdKK9PfHu4+0n4a?=
 =?us-ascii?Q?JB4t8JHs0XNDFsJ3KSlO4bF8KVMovlWxYbU+SI1ToAJ5+pf6gIIA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43918930-108d-4a96-818c-08deebff7ad0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:52:44.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoRUIBxoqwbqJxVSU92KHmRjuMhS3vf/pKExsDl4zdr7EpBhzFce1LBO0SeTxe/xN+z+hm7JKwNnBZ+coqUMKeOHokrYQ/iypECMzvsLmKe/4O3emQgJ3mwwBxm+TAwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874

On Thu, Jul 16, 2026 at 07:56:55AM +0200, Marek Vasut wrote:
> Add DT overlay for the DSI-to-HDMI adapter eDM-MOD-iMX8Mm-HDMI populated
> with Lontium LT9611 bridge. This adapter can be optionally populated onto
> the eDM SBC.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: Deduplicate the DTOs further
> V3: New patch split from the original megapatch
> V4: Rebase on next-20260703
> V5: No change
> ---
>  arch/arm64/boot/dts/freescale/Makefile        | 12 +++
>  ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi | 94 +++++++++++++++++++
>  ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 17 ++++
>  ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 17 ++++
>  4 files changed, 140 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index e0630f7bc58b7..1c70271138577 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -120,6 +120,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
>
> +imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
> +	imx8mm-data-modul-edm-sbc.dtb \
> +	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
> +
>  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
>  	imx8mm-data-modul-edm-sbc.dtb \
>  	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
> @@ -153,6 +157,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
>  	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
> +			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
> +			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
>  			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
>  			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
>  			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
> @@ -295,6 +301,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
>  DTC_FLAGS_imx8mp-cubox-m := -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
>
> +imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
> +	imx8mp-data-modul-edm-sbc.dtb \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
> +
>  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
>  	imx8mp-data-modul-edm-sbc.dtb \
>  	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
> @@ -370,6 +380,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
>  	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
> +			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
> +			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
>  			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
>  			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
>  			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
> new file mode 100644
> index 0000000000000..c0f2aa462104f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Marek Vasut
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&{/} {
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c_display {	/* Display connector I2C */
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	lt9611_codec: hdmi-bridge@3b {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel_expansion>;
> +		compatible = "lontium,lt9611";
> +		reg = <0x3b>;

compatible is first property
reg is second.

Frank
> +		vcc-supply = <&buck4_reg>;	/* X400 pin 55, +3V3_S0 */
> +		vdd-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
> +
> +		/* Audio I2S not described */
> +		#sound-dai-cells = <1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mipi_dsi_bridge1_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&iomuxc {
> +	/* Free &pinctrl_panel_expansion from hog for lt9611_codec above */
> +	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
> +		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
> +};
> +
> +&mipi_dsi {
> +	/* HDMI 148.5 MHz x2 (DDR) x3 (24bpp / 8) */
> +	samsung,burst-clock-frequency = <891000000>;
> +	samsung,esc-clock-frequency = <10000000>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			mipi_dsi_bridge1_out: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				/* Clock and data lanes have DN/DP swapped */
> +				lane-polarities = <1 1 1 1 1>;
> +				remote-endpoint = <&lt9611_a>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
> new file mode 100644
> index 0000000000000..334ba299a3541
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022-2026 Marek Vasut
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
> +
> +&lt9611_codec {
> +	interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
> +	reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
> new file mode 100644
> index 0000000000000..d8114fd869b54
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022-2026 Marek Vasut
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
> +
> +&lt9611_codec {
> +	interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
> +	reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&lcdif1 {
> +	status = "okay";
> +};
> --
> 2.53.0
>

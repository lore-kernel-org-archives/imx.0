Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A0403129
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692063; cv=fail; b=hypyC9UZ7v20g6cg0ioxdYqn4eZWZiOwD+awlUcmgzmp/xeGWTBb+EoHc2DrvauFeodFgijLoXzY/cBwFq9PChWKY79eO1ZjIPQW9o7gi6Av5PD38dERBPOJLoB8dbtnApNniHXV0VCKFdautJHNk90avdX3nTHXF/vAmZqBTPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692063; c=relaxed/simple;
	bh=pLF1Vqd5si+FcNyWt4xY52rVqMa/J/0rgr2KKDZ5DS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MU04AyrefZb0SruSfhlsrRa14+PSAiNHdbqOiy8wPb2KqM9uftYF6XHJcVu1Y+lQr9bI3/EUxQvQ1BozRHYthUWJVRnGiwqfn4cCvhmMexWet1zjBdJ+upQHW6TRij9ZK4WpeIqzIULVNhuIST/yFHxdVam7wWpa2nCZT5A5jiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DoMcL1sV; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DoMcL1sV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ug2RwYV2pxJUkPVgU4WajZkioe18kiJF1Ik4Jta7tgoQ3V8bYKYaQTPp/WIf9x0tQqM3te+jqstTW6Rw/IvgVopdS0iRqD7jGH4m1wumSCuWShfctIUAEgZFg0zVvgP3/eO+Da4a3itE8YLq/QE0/jY6TInhZI6pCvx5NeMgGMkugHblWZjB3AcsfLjHy4lsvgTVigxUS8qGUxqgYzwSdxJo1QIurceYP3wWQd4QBwrt/Fa+VUiaWDxM2o3TTfC2GE8D52wEJOUY0q9ZU6Rtc1hZhSPDfVQ90K1GIsJrIjT74a6XeygYmIDNV4OgCjToMBcAkrv35S9pkVSY4xckxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncu853l6DKLyM3DW1Uy6GM6lOOxPj9Kmr//5fViKwfY=;
 b=s1+PUmYHjL9dlV+RZv55Gjo9wmAGTO/Bdi587Outzf6r/tenXz4mInKuE0Yq7wK1nEqrTb++qfmgq47UF8Vy8pYBDtS1iQ6YT93RU5yMwvuCf0uo75pdTlwfTCuFU50Dw5zqkXREeN31v1C4ZJvlYVf5gy6zsO7sVfvHlRniJ4o+M2BWI7wkBuXSQG4cZrwo9y1biMg8D1RcDoe06Xg7BTtrnmhT0IefkMnMOIBIqKwwbHi78L2flK/Kr4ucp5BvFPp35lbX+Po+mqam0YE/VqEWkO9j4l2d4vtSbpaO22NCJz11v9K4Yfk9GNwrwkxyJ3oE7hv/9py8xOK822urYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncu853l6DKLyM3DW1Uy6GM6lOOxPj9Kmr//5fViKwfY=;
 b=DoMcL1sV31PqJQWX8pAc17gGLuZeRHz0rS8JfMetGjVUQ9gcHi/iSeBvhdWTScY/tLdvU8sQb7CnGKzsY/bs2i76InFvM398EDaIqjxQmeE90UudG2xvUCHLzemXrMizYCgpyRM++bY+GxDfQv7LRS18tC4v/f1cx1zdgs6VUhJoaZsn0b5qV+ARR5EACr7GGHcpZyDcjM8Viz9MU3D5sLamie146L6h3xmTayuLedFJ8w6nuPoElRcf4DzGxPJKRHWyrbvStBmgSHPwqr40a1A1hq5YOhzWVohPc3TC46CXSTw8YaO/URakD+pO31yEz4JtDSQ3HHRbwSMYTMlsZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:20:59 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:20:59 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/17] arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and MQS1
Date: Fri, 14 Aug 2026 16:20:08 +0900
Message-ID: <20260814072022.4064009-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: cb417f50-e19f-48f0-18f5-08def9d496be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aiB69DolM5hcoS5Myyx9Tj0EIh9IbzIasm+UzxXvnQa/Vy9TvOtl7LdMjdPMWP42NWkAj2GvfaclwPl77O8ln3RfpfXb+eymNkm6EjGuzvfOqS6eLGkklwIIQKOgpBE7XUdS61k7+RhFSosnCF4oEqaMn08Azb/LgMwb79npYBgR2MfCMW1gC4xWFXEx7X0n/2ueNKgnmmI3MkiaiATJB5tNR52BrjxnVP5cEZRYMFfZlUEZSM1SQrlyzPa+cgsvaMV5XkTWrSB9MnRuLinJRc9PB9M1gL6J7RtkN7DnR1IogN0K5nm11N37SBiCh9JFBNlMoQdVJZafXGT7sDUzdzBm8oLDddzXorAbN02Pb4Q6Hazdw8N96qylVEeN3d1TsceaqLL77cKpDc6cc9OQSZMt63BdnQIbHXUZ0Eg+z6HuZYMDEYu3P1Sq+LjQ56OfByrdNqXQyLXDtX7QhbZT1Q0cKo+r/9o22VNW+iKAiNNBJThDAojtUPGI25q2LHI5xVk27PZJZKahWxppSf4RNFHP1m3ct5eA6peRuWjEniIMJHRg4C3rt7za1cFbbYmH296rhq9c5NtetcWX5F1dG8FW8tbQQpQbBfGodwQLZxteFUxCL6mJ3kmeA1KU8am/CLSEwGY0RFHDduo9Esna5hCX3ZacJEKCJj/MZDyLkGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LmVomm0jatWhgpXoTJEGWdznTSPdwLdOhJP8ivk2ls+B9mqp6oO1D30jTP5t?=
 =?us-ascii?Q?0yeXnhpplKf7fmMPxJE+CUIdvSBAo5MqDz9lHgNeA6ySAlVUOXZybfiZJmeM?=
 =?us-ascii?Q?PH7M3836EXIWMnw1H8DTcgxLmHEaNKOxTYGFfu+8rC0VmWsKIF2VS9J/xJ5w?=
 =?us-ascii?Q?Xh+a6ITNbyFUZizPkjQlYcGqCGHyehdev4JNnFPlAeCX87l6ePmijNgNhnzW?=
 =?us-ascii?Q?ZzdV2q36dldpFU//i+ZCgR5DRws//dwDY0nQeikpKfHs+4VU7XlaNwx96/1v?=
 =?us-ascii?Q?kVzXl7GPaqdwh+tSr/58YJ/NGGfO/D/+YN9+WC5b8ejc7c48I+029Ec5CPqN?=
 =?us-ascii?Q?Ih38GlWi1q9N1xh/xVBoeJXbVC2bDijb9ZPdOxtkU+J0bOba37tUE0EHGO0D?=
 =?us-ascii?Q?QQwW4XS6ecj88+m868fTg8903CeY1fYZMhqGzYdJ0tnLOL33cCuVtk4t6P1z?=
 =?us-ascii?Q?rF6lA2/j+91Sd5kr/Tit3Xe8THzqqfErqZXhPk0dHINq82/mIIuUNl8xxDnz?=
 =?us-ascii?Q?dHy6bAUEQvvNUUP3jhH4FCEtgO+TMLf5jsfIVNU+9E87AJdf0NycVVQINmVc?=
 =?us-ascii?Q?EJ/jQK8abmQTBklESEEQ5yJDpCnMNV5SbRIHTzKaZeLwT9SD/TCTgg3Aks2G?=
 =?us-ascii?Q?0HR8j3GfV10Xudi36g0mPuGPtVLvbm1gSz1rD5MUbh/GNi8ELK+P6CQaWXc6?=
 =?us-ascii?Q?6LvNM/sjg+u/RKARRZl6KgRxjccS01hX3pvSzBwl4LEEh03is3leimhumXni?=
 =?us-ascii?Q?NqLEjP9v4tov0MTY+P4ySomuQn+pyBclV9F3Q4HoYCCgrrj+FUM0v2MBie4Q?=
 =?us-ascii?Q?XyidLHesGh5WNY+jxZqcxiYWlL5upXFoV0OYnkV7q93vWPIOyvBnDdLitUFp?=
 =?us-ascii?Q?OqT8K0QOLjhrQpksX6D+ksciCGFiVsINpj+/w1HEVVAE7DARl33MXT+6s9rC?=
 =?us-ascii?Q?oh47V+4piC4jzchrULS/+myu/22J5JZU/couY9yG/YiDR/zmQiALGKhaolPt?=
 =?us-ascii?Q?bUxz0c+3Dnfkud9i65cUnFlq2bxWykWUlqJlyWEiuEWznVzoK0oH3Tr7zLdX?=
 =?us-ascii?Q?HHI7XkZALyzC4g2F2vxjk4KEBIyJuGeP5YGk450cg7tzM80qTA10pzamukZN?=
 =?us-ascii?Q?c+MOmGOFX2j4cJ42F4aZVu/MpLEo6c21CPzdKdVkUFAaaDZKMCwa4VqYbOma?=
 =?us-ascii?Q?jlAUDoxji/vOl0+O5Q8VQ7+JX3Vf+azJsqs4EZOr8R8Y3XiwhOYinWBitl8U?=
 =?us-ascii?Q?/MnK+72/a5tkUAzp37dmjs3Sg5zX//ZsE3BNUuvJw5Beq3uBtWgEse0WYoNw?=
 =?us-ascii?Q?Eg9MWsPjhWAgwZFkHF8gSbQuldBKXW1Z4ZtxZDXXNOZvgWvkGS2KoVCmHiUX?=
 =?us-ascii?Q?jb7YMSphldDNWQ6MX27B63yCgF/AIKMeXiZc0Rjfiu8UXtq2nXoVJc/mlwhR?=
 =?us-ascii?Q?P65o1+5yjG0yFcN/vi9dJn45r7LbUNfkBBAUPKiYUWOgRsSIbhZ5GberIcCU?=
 =?us-ascii?Q?RB/B6BXcaW2ArwY8/38L9peaenECLMZwBK0JtPIzNHTi0pRdkExujowYhKCb?=
 =?us-ascii?Q?05KoQyu9eLeKZ1xls8AKmi6rc8iGqaLCGXmF6XDWBeGOqquXGLDZzuLMzgv0?=
 =?us-ascii?Q?AfklutS7pbbdogtNBa2DkXlzJHkzAlHTFJY0LK6kB2ZvGjGvqrtQ8jZm1uo2?=
 =?us-ascii?Q?lRhmid38hpGr9ZtG93iVW9bIRSJEmI33x4K1s/iikH1tRA6tdDDgjS8Y0f9n?=
 =?us-ascii?Q?c/GMheMmEhtoBiaRm5FGWVy7cZ3EsK4S7wo6DRJmlVCEOvsv0nmO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb417f50-e19f-48f0-18f5-08def9d496be
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:20:59.4924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPLY82xVj6dbqPjE9Lli0HffAsEQhXzoi2G+SBKC/0S99g7eM/EG042PccYFHFeecInFPGvVjREl423QEqS56wZCD74hKAwPkzji03BIY0Z6AJc0bL11C+qlb3R2Vlzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index c6db9c85f2ac..4418fc6a0901 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -16,6 +16,25 @@ aliases {
 		mmc2 = &usdhc3;
 	};
 
+	pdm_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&adp5585 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&pdm_mqs1_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&pdm_mqs1_mux 0>;
+		};
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -88,7 +107,7 @@ cpu {
 
 &micfil {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	assigned-clocks = <&clk IMX93_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-- 
2.50.1


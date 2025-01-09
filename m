Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3685A143759
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386085; cv=fail; b=nAsXOUoZJa7z5CeIIm4s9nYdxd1MXcu+IZt6oQbMX81QsFYICpWTwDXYLpqMFQ3NvWrg0z3UBTT0Cl+EqGJFTs0E/N45/9vCEk71XKUMQjer+7l0jRRjmroUdLenWcNxtY4W/R+XYOTOlnPTknnVkTRKj+PFM/FakTZXSkcsSrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386085; c=relaxed/simple;
	bh=GVeytswWj1TcRGFd1wD/C4VU/qZjOvf/UmxWBkvjlCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rnbYPp76hOyMaUKhjip7idBkjA/jZAvYVReZJYxrl25lRO/ihvP7M8vUBHO9r+uhOlSrk/atqFuiDOiS7j/EDncEPwxpQJNyhYK6EZZcLCCjaLyiCSekcES5nmzMKgRMsdKd9lEaZ8wKWjg7MZEMboIpDjSpl9gRwMyAqV9m+lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RuCCV0Hk; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RuCCV0Hk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU7pmSF8XebwR7/SPFC72CoAzZBKt1L7kljCxVjNbTzLejuVsAAjgljKtgr/mWvL0MDV1Uk9T41k4Ej2vUCAYYv62a3G3RbCjrVnjs0Tm/qiCBbd6yMtq3coMbyGPX/DfdF9uWAbNxrPxFthelr70pGT1jPoeAsbqjzyN7l0S/TONQAM0Vb9LbdCLlqiCBdqXcoTLZs4A1aQ3dJvxb06TL2yb6IcCCQ2DyN1/+ZCjAnL8b/AIBgazBux5t18NZANQMT/EilwBwrUoPLfl/duQmOt2ZvIDPC2Jw78cTAwv+yJY6sPEYE0/+S4L8ivHYHIVt+7vuymjAGecGZ1BnzpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56PZiaJvbdxb4s41m78WkXTwsglpgUEQoaKr2eoxTKU=;
 b=XlU0JOA4Z+y4Tlhk6xlTy/X4Rj2DSPmrxcMnmBq1FEQQ2SVzsylZsCVL1SvrZO5o15xCpwcH4yOKf1vcSkEI0cu3wFvPXz2Exe5dfv7nIf/4GLgmZ6gs2DzH7ApEmYAKhuQja3GtYrb9+qHbImIaYdGHlgB5exyJvEk3GvpL1GAjy0vVO0Lb6YgIeehPuAHrkY32iAoNF812A/QDNOxAAnVpjTSJI5A8u3EjGVDhP89MQU9H3OXOmGtAv6vMqzibFX61LElwqnljMmalzSK4Zz1BojYo/+il2kJ9UmZ5DwSX93KGxW5UWSeeG5Uu1eGVLXDeU6S0jcg9oXX5PQcKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56PZiaJvbdxb4s41m78WkXTwsglpgUEQoaKr2eoxTKU=;
 b=RuCCV0Hku86LWKFB+aDbvjf68NPrdpVTZLLw7ODsAFprHTYgAOq//1NfHbxYDUdf2NqEyu8T80h6k7SB3ZsBOrmdi8HODrpaXkrxSTh+hzZHMQUAQDBd2mlH4aYq07HQOHL4HxCxIRhTuGXqQjBzUMrCfUvyYnBGrluRaUU1p/BKoIpadDEkGJY0NfO/Tn+C8Hy/ZMjHq+VWgDh/gHZc1C2LxAOWcAcLKZYDtzLr42Oe6ZbCPv3vbwEn9gredirsFGXN+Q4d0o1i9K0Cig3p2yg0O8/I18iawfFTlQEWG8vVjTv7xvOCW5a+ilbt1uIlbTlll8dxuPDYxc9GUEdc/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:27:59 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:27:59 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: shengjiu.wang@gmail.com
Subject: [PATCH 5/6] ARM: dts: imx6ul-14x14-evk: Complete WM8960 power supplies
Date: Thu,  9 Jan 2025 10:27:17 +0900
Message-ID: <20250109012718.328692-6-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109012718.328692-1-chancel.liu@nxp.com>
References: <20250109012718.328692-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: a71f929c-6db5-4a1b-3bbb-08dd304cda66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nZmpZJhibh1QLBYq3k/YWgEeg+o/Ms//hDx/0KH1O5zZtTrH2H/9tqVDcyny?=
 =?us-ascii?Q?NmDrE9mqwogZy861GXw+lwpWyOOdOGRNjJkkX5j/o3HMN18/oTHaG/EaD1yV?=
 =?us-ascii?Q?uiD8QkuQAZVxCkXEYanYLJuxNmGX7HWfpi9outYQ8aZRK2TNd86wzDFKbmAl?=
 =?us-ascii?Q?qI8GD3wQ10nIlVHLrfzAAnfyJ/mLqK13Kpycc2JQd5TFx2RgDiXwwMAakQy7?=
 =?us-ascii?Q?AeE/wKicslosFXVG5s42W/oYOs16r2o2YmFl0qj6NAJB9pjTwWyWCov/MXU0?=
 =?us-ascii?Q?08r//ANI/bbjI6ySuqbqhF8LB3m/A3o0162Hk979+I0XvaW36f1HD0ePXPIz?=
 =?us-ascii?Q?7WDz80p13tdO0c9M31WD5kEirLUKIml3U5ng1ZlAB7GJMNzj0gpNdFEJvAdC?=
 =?us-ascii?Q?fmuMm2DER7PHICfK8mn91ZmF00pHGOkN7RL9hGW0FGuQTVp/4g2pMQX87le6?=
 =?us-ascii?Q?2BEsy5GM9M0LzVdMlVBVHMPsWQaGQKMtB7mEB5ZvklxQpy4iAQCrZ4AwOQQp?=
 =?us-ascii?Q?8MwwQNiHjwD9dWLP00ga5bSeJ0YaGZWPiX9dvN1ZmObrq20NoJMjktL3+Tay?=
 =?us-ascii?Q?4MbTdbnqsdnNzV6ul3HroWIgPtIuaxNIowraNqec7Eb7/m0wfThpBDy4H0ig?=
 =?us-ascii?Q?ztprkw6sy2zeMvPmTYR/SUira/Y2Hysioj8CBPeKYFL5N/UYlqgeu6q93izl?=
 =?us-ascii?Q?brFMadH3JL3lGH7IgfiRo5PY7vCpYevXdKv36XFUGiqb6lOBR/KsI9jJMYdS?=
 =?us-ascii?Q?QPQz+stieguSq5FPSOCnq2olP11/JiwT5n98yns2ljfiWO9LBVVKkWDjKrrR?=
 =?us-ascii?Q?7wbsul5t2Qz8D+28WNF5JgzsudGtjQ/nWavOdvmv496xg/DIDkWKij3/OBNA?=
 =?us-ascii?Q?4C562BTmTKV6xkr4wCiIfEVqI2+yztbut/UgbFC1IrTHoMJtU9LIAYxvB+ba?=
 =?us-ascii?Q?jDMcSvo7nA7cStcA4hrtH4k7C6BUcuXcxeFYN4B9gOVV2SORpXPjM3g75aPb?=
 =?us-ascii?Q?34p58VOYJD2d9IGKIzqjQlyOQQbeDxd5LY/MyzNwbg93v+wz+y4yNfxseXZH?=
 =?us-ascii?Q?AAfte14yKZIQTuG4H9EGAzSnri6kxhBDqaZYHFea7HSj6XWMjxwxkmQum7GB?=
 =?us-ascii?Q?CyWIOvMkaBbcHdLM1LbsbicK3qunewjLtWO7l44UG9mKKfnvCGddFN4vY8DT?=
 =?us-ascii?Q?aKgKrYiMAZ4FfEveng/KXNeMbkUkRAyykSeGGZi12pSV89z6CCAAsRuQkfH+?=
 =?us-ascii?Q?NmI/IrD8FKpHKii/Ts7luDtyRHe8Iic0TyWv8eZqPqzU8wqMPl4L3WUtfp8P?=
 =?us-ascii?Q?nvYG56/Q9knQRFkv9jzIYMJhDBmV2NDhXUxJoV/THUqizgNS5q/qWmk9H9EN?=
 =?us-ascii?Q?LMchiCnKsoHIWLzx30yNcBPWaikguDs9EjV1/SHjiYvC/anROVPyvjew0JlV?=
 =?us-ascii?Q?SxBDLTmfGE0P74d/k7GHtni6o34uuopZ/ViCuZtjklOuuzSWthELIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CeAQ0exexHh0BokfgU7wo72zbMl+XWbty/Ip5zH//oiLItzfr/8MriPZTj85?=
 =?us-ascii?Q?qzlDZHAbF95Pt9edLvElTbOIsE1QW13iV3ftlWGUxOFd1hj6qqeJgM0Mp7d7?=
 =?us-ascii?Q?xcLXB2+HFZKcbvez9voW+uL3l3AnqILaASaBQqrasNXAOkHVqP6pa151i3e3?=
 =?us-ascii?Q?cgJXqGhKM588wySANzMAtfKpOXvek5QdjNPXuwnq0ABh+GJc1jszyRGsdnYk?=
 =?us-ascii?Q?hmNLtejoGdjqW4f4tBw1jw1xo4EJ9vMofqwVVlsJPDTn9k0EkfrRECs8DqLY?=
 =?us-ascii?Q?6XnlrrnZXPJ10PNC9GOh31Cm/xgsytAIm9Oqke0xARZePk3cYQOub484kbS2?=
 =?us-ascii?Q?ELqoakwr2iJunRlJqpl1hfhJ65Fxi8LnbHB9sqqozFBLUrP9c5BOSO/1iXhl?=
 =?us-ascii?Q?+6M/PS/gJ+c0O4FTERczGwm4HpYn4vjcOrs5MwuiExeMXK0Rg7lLUd1VaDdd?=
 =?us-ascii?Q?Jt4IFEjg1zJ/6gd8jgzncZMFJPo4PRNjRyF6wmnHuAK9Iq598vsGO3dj0OoL?=
 =?us-ascii?Q?g6AnxonXumlNvfQEO9gPkJNIJtOlF0/O0PoMo/2XugadOOwN0dvf0aMkBogv?=
 =?us-ascii?Q?edxEQZdAWxiTquONK1j7fY2UMpxfrhdqqyft8YcHE638hgpNnBl/RGCrP+yG?=
 =?us-ascii?Q?GOyIS7fEfZxznXhnR4kUqC/Z6NHO+ltX0v9jxI8Iao38GPWCnt+ZtVnhstvW?=
 =?us-ascii?Q?/z2AYnXyTRhJ4/EhIIC6Fqgo22lso3U5j0HjeROYReYT3y2eMniWPkEDMtub?=
 =?us-ascii?Q?2Q7tiq7bQxvyDh6UHF285HV3UknzFdHbo6K80z0BGpteP6QiQONSud3MQnA3?=
 =?us-ascii?Q?KDm4A9H1R7pTugs2jngAen1QxVqK6+zJAT8YeK1yAYcv1MhbBZHGTKoyVjPU?=
 =?us-ascii?Q?h8K3gyj5oyuymuzj1+sgxI7iAyTSaIICpWJB9VoLSynoFyPysC4OOklxrFCo?=
 =?us-ascii?Q?Jc7rMvGJQbm8S+Jft5BBiUZqiFoukuLY6enqM6ueRiTSQ9DE5nOfkeE2lwVh?=
 =?us-ascii?Q?1gzWPHm9/OAdnmy9Dkxht5tKY25I41jFHdFUeBW6ffIsbDO86GUvT6JPitVn?=
 =?us-ascii?Q?aR4jMjiq3XytH5dSoM7pc5Ub1IgX+M81OrIymGrKyJdZ334lwUEtautu/LSn?=
 =?us-ascii?Q?Uo4JMrVsZgLkqn8FGKNudzVvsqOcTzaovgHGiq27jGwQXPN77iqwYEuRUQlm?=
 =?us-ascii?Q?GW2yBx/gZzaPOl+33WgCXJXTgkOHAM7Dhniqxtab1FG3pdGROAVi87bHAEsj?=
 =?us-ascii?Q?IrwVO+yXFfygsb0ILCcir+9t+cuhnxecM4g9dBSrpoWPPh93QKsNhhvvpK2o?=
 =?us-ascii?Q?TkoYqCyyWJpyDWkuyNtQCZoMt1cKYZ+ODMn1WEB9qbBvOOmdvBJwahM40T1g?=
 =?us-ascii?Q?edW1s7vPzkr3/FQhHH4HBDu+/8pum+xmFbAnZqrni0SRi2FKpy4zZ9vYzD9D?=
 =?us-ascii?Q?SB+YqUQMaCxrCrecaXdeB/lnGs3zjJ81Ghc6dWyA+iik4EmH22l/TCCDof/F?=
 =?us-ascii?Q?BDLkfIafHPMJQxV12LWyqmd11v3SWeWH4xPJ3Xh0Tmjc8FExZTUL5nav0Snu?=
 =?us-ascii?Q?UjQflvcgzobeMcDYC91HbBKCgzhj5Nk05cc5mWzi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71f929c-6db5-4a1b-3bbb-08dd304cda66
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:27:59.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTFxdT39YQ1HDjvxrtCvl3Z6gIumNqfcmDRRmD/IMxEv1RKLm8W4CnPO0ARbj6EhYwV8JAXp/fpgKh9luopFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

WM8960 has the following power supplies:
- AVDD
- DBVDD
- DCVDD
- SPKVDD1
- SPKVDD2

Add new audio regulators to reflect the schematic and complete missed
power supplies.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index 0e839bbfea08..911ccbd132cf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -62,6 +62,33 @@ reg_can_3v3: regulator-can-3v3 {
 		gpios = <&gpio_spi 3 GPIO_ACTIVE_LOW>;
 	};
 
+	reg_audio_5v: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_audio_3v3: regulator-audio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound-wm8960 {
 		compatible = "fsl,imx-audio-wm8960";
 		model = "wm8960-audio";
@@ -139,6 +166,11 @@ codec: wm8960@1a {
 		wlf,gpio-cfg = <1 3>;
 		clocks = <&clks IMX6UL_CLK_SAI2>;
 		clock-names = "mclk";
+		AVDD-supply = <&reg_audio_3v3>;
+		DBVDD-supply = <&reg_audio_1v8>;
+		DCVDD-supply = <&reg_audio_1v8>;
+		SPKVDD1-supply = <&reg_audio_5v>;
+		SPKVDD2-supply = <&reg_audio_5v>;
 	};
 
 	camera@3c {
-- 
2.47.1


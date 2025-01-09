Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09D139D0A
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386080; cv=fail; b=QhLCixlkroNWmn+EF8w9968ZgZR+fcB9b8iKBgiet0uRQbFhodiWv5qwDv2Eym0P+pV5EyOZhiEZ0QcU2spv1vrLs3xqN5dMSHuEINGOrWoIH2amvV9Xqia2EicNOJOXeoQCxYx0/L3223SdF6Rvqq1bbMA/jyFkJfUahF6Ubi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386080; c=relaxed/simple;
	bh=W/opW68fQbKlT1NBnA4agaReAguFcXECzDbyeW145vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IzPsdBOcO3ev1KRI2JZ+2GTTiChzgiDwowraNGvdBCSaaE6QBBPB5zR5b/sOjiIxnQ+QsQypcpU4/Adfp38IovuTHKRefpJFjj15Q1Mb64AkgIstJFVL44rbohQ8mKAMGlPUgeWpQF+pUyYA6aTZO6I+mUr61S3BqZYpi50Nbk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dq8Bq/Oq; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dq8Bq/Oq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl77T61L9ZgkknuDykc/z14Y42q0OhuOrQSCIrgCVQ38Z9fWtz8L5KmDTfJSvM6J3FMeygxZtFmK7OXtB4ghXTt9U23upXmLEjJl+wIgJN2zsQk1a+ROmFmMW0Pwfml9c8ncvoJgvUDFotsvN1WilxxWM1UoLToE3vxmnAfQBrT2X+olIuwQkCj69ySGCY0bJRC+zCKo3rTn1DcuMD30LF/C/5+ZbNQyeCbq+koEYTgflE8oImW2XRUy3iJ7OQQDIMaYUlRm8DJLuS+OyXrP02t7XJtTYGQP4mjiIV+6Yr+Bur8nhQYfeL4j4zQcfotN5oiAHol2F7TxU6nfI0K1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q2YYu+C9oBQ1aN41+o2WhQsJKPipnIgCCW6LOXgizE=;
 b=vdRcRN2xc4xdM9cVoWYhGJyO8FlchMsZb50N1GxYh1W//j3hCR8KZhXXo5/I0ZGmqAFajkauuvBjzdB/PaVThMpx0oqGYJDvnw2JnYh8mxfCbUv0u7YCS63VIJ1ETsacZUe7pSfqHJ4km+2n76K7kh7eLny8HlvQ6GflRKUBvVIoIniqbISI1DF+32W/7PX9YCnreHVL8ws8Fxtl63Fr1ueu3sH7ZqGLuq74I4NGpGJ1GaTSyT7oVuxLtvUehR/BSsypGO6ksAP1Bj7NJnCjzoCNuRVoye7IFe5U6tOQgb4GSaP2W028kSyN28reET0GNADi7vKRLaxFCXIcHm/xvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q2YYu+C9oBQ1aN41+o2WhQsJKPipnIgCCW6LOXgizE=;
 b=Dq8Bq/OqNO3Yw0xTOAEJX0Hs/+3J+PN/BS8aWZZEvQLtp/NyKUvTpbjqM+v5hiv9oPz9aLm/xk9WkEUX9x1Rys48JSR3MkQPh8mWq4A4eTs/5w5YPQ7YRmmNjBJNONJjvMquz7VeM9BgNJgAsQ3fgkh+tC6d1s3Q9/nZM1IxleD2zwkWXoUyh1XgOtc207N9xlvzvAf2QPxpWSTn2cRjwikHLZZHB2/kEivfqKI2lNskAJysp3mm/KWDMjJANP0sVK8zNHTogD9BFa6qFLiie32aL7fytfvaFM74sJYHJwUTTmzhI9n53TVxvEYTFQYMGRj60TkxLFnn4bCpfr+2HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:27:56 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:27:56 +0000
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
Subject: [PATCH 4/6] arm64: dts: imx8qxp-mek: Complete WM8960 power supplies
Date: Thu,  9 Jan 2025 10:27:16 +0900
Message-ID: <20250109012718.328692-5-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ffedc30-93bd-4b66-0eb7-08dd304cd82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DltkrnfHHtL0T/FOj8D8COLJq69b7SFygzYyzelpszDulQr5LFJmU+aeomy9?=
 =?us-ascii?Q?fm9t9hrmpeJW+0XXT+RJHoUKLNMwno8snxZfz/IK91ZDOw9//knrvw14xrYN?=
 =?us-ascii?Q?lMkYy9fmWFCtoJDOGkHcoIAIoJS1AaIgAxFWFJpl5nICE77ymb3j0JOsIWQB?=
 =?us-ascii?Q?FGL4VeadshEpdmDY644D+3d+XYrQZujzUGpjqoHapqEWhdPreXSa/FVPYI6k?=
 =?us-ascii?Q?HOfiFFjMKYrR7PMpNxB1ReILVAGB1zcesdZraXJ31WPVvLAkBID4UNr7AEsL?=
 =?us-ascii?Q?N970m7j6mx8WU8jKuPlOqFPRMvKbXwVbBf97CIIfqLYvRODkIMihyNUDAfwk?=
 =?us-ascii?Q?BBHtEnyY+XOzCYM+aU45NRoEhlp56mTgTvhsiTyFa5KexPje/YSymGjMxvn+?=
 =?us-ascii?Q?m0rbzVhHl7CzsVF6xQo455A7KDWa003FPlzKDgmUwPGA131LmFyBThWlL+PW?=
 =?us-ascii?Q?jgsFlVKi/S/TgOH0ug5yvTx/pmcy4TY49fFurOGKVz0IyCYEu63cDYmAsT7B?=
 =?us-ascii?Q?39Lmd3Pun3ADSkl/RnXiGvO5zTJnugx6X97ZqPAcezW8gf/6Rj8dec8MgvRZ?=
 =?us-ascii?Q?/zhb/PxYi7EtJRfxlVgeCRPFKkMfz5yJA51Dr6V4eiyJzi5IRkYQszd74I+2?=
 =?us-ascii?Q?Fc88hUlqBQQvbQsrRJQ4LVXwr3BVq4WmK9crCccodDcBILxdUi+I8B7pZe+V?=
 =?us-ascii?Q?iPnyu6vkfuHEw8IUay67wxEWCbN3NRzAeWEV0djYuZAsTtPgUQWXP5qkfdpS?=
 =?us-ascii?Q?LEEU58ja44Z7/htcBJTQvlmzr5DjSDIvfhi5PDtiWXWmzI9qKJNQ42JlzLIh?=
 =?us-ascii?Q?xkz3Vl6GyBuDAEHorwjgK27eb7NbWFv24PYl+rIK82yP1SKM1BkU+TLCVu2f?=
 =?us-ascii?Q?+4GLVsVQcqx+yO9oKlmCrRxJnin8SZagwO0FbvVMRtFtKdzBEaX0tIVZggSk?=
 =?us-ascii?Q?tu+U3ZErm6qN0hdlD7TommquFnqGCgt9OgVhtGGIiih+voQFFAKR7L1QmEJd?=
 =?us-ascii?Q?Brz1DER8ceQGv/3s797eQu23tXmDjlghL5ONIXi0vy0Hfjes7LJM17PDBGwY?=
 =?us-ascii?Q?xsLSd7c/unuPU9PdjSzo8uIyExU+MPglxeDnpd77wPwlx0LZrbdKdvPFEVtj?=
 =?us-ascii?Q?K/n/Zrp9njfrAOXPeZYWYoiur3sbQyP+e2KSxYmt/6pE8HHJaZ2VNlKLbZ+E?=
 =?us-ascii?Q?tks88eZVX0HAZ2zHM/rRSZ+SLjuCr/JCQB5ypQNOvN6vvb2wXkZ4XVYKSvuH?=
 =?us-ascii?Q?rh3iXVxH2AgSo+QbLfXnIgXe+/SZHQimSKZoirGLj6Vg4BmokUGeusbu84zA?=
 =?us-ascii?Q?LNRfU+L2RYkfNy7gcD5u5VfjHdfymKzcl3K+9jnedF0yAMxeTo93aOsIAd4z?=
 =?us-ascii?Q?AS1sW3fXY4vKPvffuZBxEjdRymQSVzUMa6QtcTHjaO2CZXD306WbUGmi6tqh?=
 =?us-ascii?Q?ZdelqpnryUlh2lCrU7PQGJspudW1ugmzW/XLvu6gNaVnkSeaGQWMiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8wsnLC1DFFKCCoLWqNlkcWxNUtpzMxJ5A6ZApo4VjIWlv0LbU8Gxdir2OCih?=
 =?us-ascii?Q?G6Iz1BW43q+/6t9PSO+4PUvcDYzIaSNTeutGRE+kP0deeZBU2W3kmu1tTP0B?=
 =?us-ascii?Q?1auDemN/qFvmgTXxvtfaPPtfQU61ck1o/4rUEHU87dvOsnTiN57PGttuuw2X?=
 =?us-ascii?Q?iwh9YIesVV5ifzTffG0B8sGe3muAKDtr5XXtabqWSqXTt9XJ4kHTJ0alvEOu?=
 =?us-ascii?Q?erGBV33AKHDIW9orU+4WwIIWB3geykovyAL0E6mHdOzWT6yWIZ6dQdAR77sP?=
 =?us-ascii?Q?wXz8aLt5b+NtBxrY77o4bpAkhU6QVDQ2/p7cz2y8e9Xp+P+HVg1zUjiBRwsi?=
 =?us-ascii?Q?wMooxvFdzOM3atnkkV59Ak/N7CLKCTskKt7xv7TiWBvptr6y/IpXAsIxy0/u?=
 =?us-ascii?Q?XosKvO3oz3RoerG36iun7AQXoRRvcZfIMVoQmIonxUXqi9bxvBdnhfziVXfO?=
 =?us-ascii?Q?SUltpEN0IOEBsLbbqZStOs4UFrS1cxqmEVRzNr436Ji36g6t3MsFkOFWfLw3?=
 =?us-ascii?Q?zUyDiM8DcqfuaVoPYMbN4UF891o+LgrLyHcVBjqH39BiE7IbxfYYWPgO0Mho?=
 =?us-ascii?Q?WTt6N80OEdYIPFYQLaD0C3d/JXSD1vtKCzNxBrR80MJ4+hf0FsmrfHQJkbt8?=
 =?us-ascii?Q?tOMp9u4e+vbxpAeVDIqtkhSGT+Uh2OrpMT37Q0sjhVsjM40aWS0dfMQzonUQ?=
 =?us-ascii?Q?9FXaf73HU7+ZcOBdE/6GWbZFaDdEe3t6SmH0Jmw+OkP7wdb+f2JhVVKgA0jl?=
 =?us-ascii?Q?JitSz1CHcSTbLWmTuKmNaD0JFnnO2+m6uOFchzAcSawqzA4rI8kxRp5J9W6q?=
 =?us-ascii?Q?A24HEnMOV43PqjrDKMH3ztOCdOXULEJBsDQchlDBsRBtEGLRZtEnIAl9rJtE?=
 =?us-ascii?Q?Z2Naznl9rv2HvEcK8S6vE+xnohv6MDNpGja2GwKbfiq8dJwqzEhFdEOW7KW5?=
 =?us-ascii?Q?Va5072XrJPjOiheMoNuKo6e2FRhOZj85GqOiyHRVH/WqFDRHNhVKsj32mxbB?=
 =?us-ascii?Q?Kf65IInCCipUomStF2dWWDYOswO0RgHxBuZM95NA9BJppUNmDnThaGLOHdiB?=
 =?us-ascii?Q?knBQeOrUiQGhMST/YRZBNjXTyzTkLCCdrT1wIjDn4GgsZx4apVCQVKcDNtd6?=
 =?us-ascii?Q?KLSIilVenU0quUi7Q5tE3n9ofAMAzKadm8oTqs9zp/fmsQaOHxLmNJsgjFZ9?=
 =?us-ascii?Q?ZH/fSUroWs8VgpMl51h77q8FXjPihEDoO9J0Ky8N7FSsNziaoPiH0PcXIDrW?=
 =?us-ascii?Q?Vj4FimPuuwJ3p+m56B/J0oh34Xhk0dDAsF6rIUDv4SgRtQbJ7GVH13kX6e53?=
 =?us-ascii?Q?7zwJsRt4iWMzc5/llWPhG3+QPyEyUxxUdt4+RZZIxhEDKnlXwjrBqc3Tb10a?=
 =?us-ascii?Q?0rjAKSfK5snvkHxP44B0NX2IFsXdfHCIrQCfVayOpyeltJ11qRusc87tzcAA?=
 =?us-ascii?Q?BONStWJo46dhN7ho3TR2MwCNaQAgPW41/3Xfustga82mfcJSr9a8wJdHbbRi?=
 =?us-ascii?Q?4aAXMoSaSoEQw67uck+bWSCw55XNNnumu13u3OPqwRVAuD9XAILQB5QyURwc?=
 =?us-ascii?Q?G3Kg2pVpwT9C1FlpHk4Ubxx/46dKRIWEVEnl04vp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffedc30-93bd-4b66-0eb7-08dd304cd82e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:27:56.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B06zuZZHAmhm56T72SP3icEA2hlgqyhCTIxFLm6aXmsURQ0K9pATeY2G/oXrhBkXYXB53yynFjB6+6/Ot3OAfA==
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
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a..a669a5d500d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -98,6 +98,33 @@ reg_audio: regulator-audio {
 		regulator-name = "cs42888_supply";
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
 	reg_can_en: regulator-can-en {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -418,6 +445,11 @@ wm8960: audio-codec@1a {
 		wlf,shared-lrclk;
 		wlf,hp-cfg = <2 2 3>;
 		wlf,gpio-cfg = <1 3>;
+		AVDD-supply = <&reg_audio_3v3>;
+		DBVDD-supply = <&reg_audio_1v8>;
+		DCVDD-supply = <&reg_audio_1v8>;
+		SPKVDD1-supply = <&reg_audio_5v>;
+		SPKVDD2-supply = <&reg_audio_5v>;
 	};
 
 	pca6416: gpio@20 {
-- 
2.47.1


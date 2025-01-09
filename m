Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4ACA4B
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386068; cv=fail; b=WTFbggjwi1JiP1lZZ5UerMrTFpV/3+zsmTRcYHzHsmOZ211NBrfadgzlpAKGv7vCrmE2k9K+BxiV+jNXm3TJ7VVaVyDC0lmwV91Kkknipox95IdYF/UugL4tAHWW37Fmm9m3JEHACsNwfdrCqZ8egpbY722YA1N4G1miwffh7Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386068; c=relaxed/simple;
	bh=Z+jmsFItNHprQRfi0QANPFXoXwBIvBSyX/wbIvI+3gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PuuwJqZ9PE5lXEYCwGpxQRY2hIicwhLMptFAb9jRfj54+udSU4OK8P/XSIG2ZwaarURC9A6l32iW6yT5x0XVd9axYROuZPjHRiLOj346qJxf6T52nCLVEu/5C0pNpecG/dyK+EbnztRpRl5DD1LcU91ZIODA6wds9Oa3kfhnocU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J9md0xNs; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J9md0xNs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHlVXirF7xZg3qxQN+SICeQK43Q+CZnjNAnMT9QnpQxtfliJELzymYE20nKV1iIlroolZLiLEfUlWjKWt+W5zIeAUqgyPVW2I/wmFiKKwQsgHDfn2+X2zShHgMLuO6Djbi6fHnK9/Z6g5RaFwH4oCr1zB9Z6b4MhDfdvQbag+HH9cZumBdrYhx4HKDiaER+KKhrUDc41L1jBxhgAO8CFH86/zjXW8jKC5NgTEWoeCgihR5As5yDYyQRvAjXvsx3iKYstKXhA2/YdnkmTKi8+x8Vv+UqXlkBRCebXt8NFxhdqNH7hQc/jegDPxTf4Kng7TeXLohSWzSZL6qRHujSMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10GAoZA6DevOzdhYIsL5PE3obO9fM3DQhmoKP+BPGkc=;
 b=ovbg08UPGAmhysXowfwo0CGCwVbjzllOh70m+2022xup/qVqWNKKQ2tlo+IPeDFylYsGDKd+ipBhDs8sbRWXiAFZDNPy04AbOHzhzfQzyKedATAZbf0b6+l4FS1MZilC9moQw3i2p0sIA/eC5iV8Qukgpo4wBmQ+j5H3eW70njwzU5l/Ng+MgN1QlwP+iRcKp/Vh0ET4V1Lf5cPIiFGbNY4dVUThCWkrBvofXPyiukQmHcmyrvsDJkVERgHDWZLJh6VIYz26pn1LmaniU6xSd9MH4cGrnrxZFJn6sbJ2F5BbPs7qe4JsYtsLKdLsYP5gyi+CGbnvzI7vJYHIcAn6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10GAoZA6DevOzdhYIsL5PE3obO9fM3DQhmoKP+BPGkc=;
 b=J9md0xNsTi14NIBUjW4bDoieq1Gr7MGyNhsMHELxDjxa6XD9pwsIHvnFDuOymhdMSUsGXc+JmTwmLwHKzJAkxDiMmu8SgZFfiTNK9M0j8EMKORgyLoBiD1EykKls+TPEwc8nNqBrYAeOoIyA/KdIxiuOq88sTw5B+3DK/qELfyZYsqHejD4T4RcByImMk09WQ2trrhjpPWIA01mO0h1wPYTjYeAvKE0MZMcmRmsG5eVc05jZjntFp18jeD1NOUf4VxBaK6oHa3VTsLoO+YAwdfFr9Z49Xmq1SrBfheVtLN1ORMesohDEDNhvr2LNCyVojUcPBXdNq1e1ktjpPfwTWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:27:44 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:27:44 +0000
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
Subject: [PATCH 1/6] arm64: dts: imx8mp-evk: Complete WM8960 power supplies
Date: Thu,  9 Jan 2025 10:27:13 +0900
Message-ID: <20250109012718.328692-2-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 60de79a6-5009-4fba-9109-08dd304cd151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KF+t73ep3+owoFZMySc40Bv+f/WBYoCcAwfbaEpRMWhh6jRlqo44juTBbCDL?=
 =?us-ascii?Q?yc2vriGaMgqFx71Oc+cZ4nORrGPcZa1/+VMdHRZsXnISIXuEJUaeQnHiF8MX?=
 =?us-ascii?Q?JOBOIqx3scVsriwkw/9wHTQYe5IBT9PxwQaeIsxSbr8i5ToBWNGLSH4XhSjt?=
 =?us-ascii?Q?aB3wQVdaKPjhcNeBrS3EKVpbPR6G+u+ImEU3PK4v9I6EmKnx18BjSG9A9JqN?=
 =?us-ascii?Q?wE3FUsH35J06s8hu0/FgnoV/JfKXey2hgmhPOG1MDo3l4nHgAfYlbrKid6o4?=
 =?us-ascii?Q?QyJLsoc3MsURHLG54MTkXn9z60tsIfvtr3qWeHAA8EW1t7mFZJ5acjMSm9+M?=
 =?us-ascii?Q?QWT/Zbe3HtjSpI5LeB/0NuP2pfHBgTvJThHw0lJMvowiFvdSRAdKD7vByNaW?=
 =?us-ascii?Q?rwNegpkOwagV5M0+6lg+8QtoaBgjod7/0oA7Hv1KDtMCJQ/7UPxlEw7jB7YT?=
 =?us-ascii?Q?3V6YLAIynoKwsSO46dSUkUIyb0f2fFPLi4Wa3LSL9BzICS8Mlb/JOxsN452H?=
 =?us-ascii?Q?a0wEk/9eMPXN1bmFvHfJYn4mWNp4HYE2UyqeLli6fNvvE14TQq9cxwvWSqFy?=
 =?us-ascii?Q?MGzxoM0o6o59979mE/ioLR8mRZhu9yOE0yuwqLxEfrpovBX7BQc9Qv3B1cr3?=
 =?us-ascii?Q?yKg3VlhfiwRlEFlkmW+9rcb0ETeq4Gv5oiRyTKylZfflYNr5lwNP1iPs9gDK?=
 =?us-ascii?Q?8edVnFVAoT03uHTu7ybJxh4sKF5iPmDG5vgNF5RLJjSes4xsDs1j+6n32poE?=
 =?us-ascii?Q?vYRAcRbQYkHhq8kDu8Zps1kgBJTr2FAkweHS/oq6ReOn4L7xF/uqN45Z8lRU?=
 =?us-ascii?Q?gVOgNvTyaQwNIlvYEVdWXb3CrlaGPrzNBliioTmrMicErPg5rErh8xye1cEa?=
 =?us-ascii?Q?CzG0jAYimER+3O9VtUMHpitzSaqzVM8o9gOQhQUzTl+RVAemBIlNGP6IHDxI?=
 =?us-ascii?Q?pRFOdHW3mK6ho6Wjh9BYxV1vXAcxNw0v+KPSOeEkNhmjrpDV5CqY1l1JGXf6?=
 =?us-ascii?Q?9kMSItc9qkgsirgkkxzehZUQSiJBDLGvNtswM9elP13k/Ys0Es3eYsoLS1YI?=
 =?us-ascii?Q?ikQLIzuTiD8xzTf+Kij7oMX65MnMhfaAJs0JMO2FMHMoW/WluS72lBL/OK7u?=
 =?us-ascii?Q?LDeJxFMXY/eqGpSltKndcy+J7TlgwEjTuowbcfh2uKlkyBScSeCw1OYVe2tX?=
 =?us-ascii?Q?HjXZZgWqakrWVs02aUO39evdKz145WKs9x+6fa6EpjzNF7JQdXeKQyvhe6Xq?=
 =?us-ascii?Q?bjMKwHUQCFc3/yqdLpr3Bd4LbE3cNDpBUy82VUM1upDnoRDT2gBbzsg0HKsg?=
 =?us-ascii?Q?Pf/TDzWc/rB1cqAdtD9SzhlTtsV4xRQsJPOM9keou1tun07+TpfKjKwrDzSM?=
 =?us-ascii?Q?0uFNaHJ4GX5awEXk9Dv7OvesC5U1N2WV1+RQ29Ms4sJ9104Ar9WHvbLbkmIG?=
 =?us-ascii?Q?ruJCQHQEJObSKB/e43kSrKnQ80VUbtvxhIQNnGd/K3pl6Nve6y+G4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cbwWts5kv0n2v0WjGZzIuZyw5ft5/bfIScI39DxrjZdfpGLt2z7fVIsuKRhg?=
 =?us-ascii?Q?NPyqs5MP8DPql9kXHN+jb7C3mmyeWORyDgnO1gw0L43Dg4BhwdKoSHccGe9S?=
 =?us-ascii?Q?GAL/jtEOmsDzVR+pWPALR6rqQrkyBQOe2WA9lVjLk5GzIfkajUN+OPhlt0ss?=
 =?us-ascii?Q?8pev8PKPLWLU74DxTZV3xZP2sEFX7agD8lQ7sYlJ69N5FgVFi7vV1whg04wj?=
 =?us-ascii?Q?RvR2OMvfg3INdpli5wGGTQgKcm2NF0ImdqjD29pv1ImblmB41gmN/yixa1pd?=
 =?us-ascii?Q?ov2AgNjHyTtlKr9ek2BUSfBfU20P/gvUsoNeWgyK5JQgmckQQ++zFwrBNkin?=
 =?us-ascii?Q?EF5o9cnkL/GQJ8JjAm3t1kvtTrK/x9qHhhnKXAAZjLTclR1nopGauiimFv0R?=
 =?us-ascii?Q?hwlXynEqKUXxZFVMW/BHVSBKYhNnhuy1ZX0trYSymwy6Icky2Ba/O+mjm7hi?=
 =?us-ascii?Q?RstU6RHXwzfy2IK6gpuPkW9zzAs3fqoPXT56dbTNMEvFxU34B3ztBJYzt2Z9?=
 =?us-ascii?Q?5F+NTtdv5Nrki+yBJPXoPJL3Pkuq1N72mINfj1AZxN9yEXdIrsK8eCvGVoEv?=
 =?us-ascii?Q?gtzHIEAJkgg2NuIqfuxQsu6CWNO80zX0tYOtc5pcQsLk9UMvF06bnNeAHCpJ?=
 =?us-ascii?Q?mnXFv1Tfizry/qqMOOUeJuYdsLK+JUQSzvTmtI4tNZJIsUqUmo89JHPARc/2?=
 =?us-ascii?Q?U9smwmjtekT065BiC0A/AHKjs+H2Ww2DQqmCj4ppe/O+VVhB41AHfgA4/NPF?=
 =?us-ascii?Q?zRUlY3dmHtsgGSsWJNK48MGeRnXev8MU6eksGL6Mt5zFGipMPLOkNDeMjm8Q?=
 =?us-ascii?Q?5m+OFDAVDyFA7LNY5Qz/xADSWRG7xBcCGEEWiyQPz5sLCFR/fpQaKlLB2iMA?=
 =?us-ascii?Q?o+fqhCCnG4Xu4LtihVEVeTrdnUEh9Wso+cHBEbB8+jxKhez98r4jrOQ4NSz9?=
 =?us-ascii?Q?6g3cfginHLAb1hUc/Qlkc5FiD/kvy2NsdMgFnPxjHTs86tJTWTWNczk1FaTz?=
 =?us-ascii?Q?mY7R/nNjiR8SUTg31aR4F05vF5ms88MXafQ8Jp7R1Rb+qWi9YC732F6ajPCr?=
 =?us-ascii?Q?8VyeFe2rOFIu4TUOV+MXVGg5hBThPnd+kh05QLexGYceyNx3lOFK4LbI5/WH?=
 =?us-ascii?Q?s077TZQUznhskIZpI2so8BlR4Z89PW8v2FyJjI1Ls0ZQu3RBIiUMC/uF1jhE?=
 =?us-ascii?Q?Ik7bq3bjw77BbqMGFqxtZGqRXeg6KYyU/p1so9svZMOhuhrO9mCPAmT7h3H5?=
 =?us-ascii?Q?wXQIwoiTNkRxfdkHHbWDjClzwnAPtIdRbWFemRy1ZFC0S7EXPH/Vd2rVxsPl?=
 =?us-ascii?Q?sBbx1n6ODUPNVvmQFZlxYF0c0CceK3tgJXDhRrFZ2gIhgH4lQQCa9uqKxhxT?=
 =?us-ascii?Q?oDGjDMMPMMxF2a9wlCYXWPWA0BxgTBQIXxYoYCFtH8lC9UD5xA4OWptXIxf/?=
 =?us-ascii?Q?ir8jb8syDexJ6L9OQSmzYUT+LDAzdcgdSnDfC+vceYtQG86Ls85F1si3raDO?=
 =?us-ascii?Q?Jc0/YHNW3Sw7x+FQoCIq1DJVFrlXacFDAMt/2r/oy1acNoA6hsb2NUikeihq?=
 =?us-ascii?Q?s+r8sFgrvjs0HfZ2uI2dgbbn3O6R9h5iI5PzA4yC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60de79a6-5009-4fba-9109-08dd304cd151
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:27:44.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJEPNPM/6LIA40+Sh7fb7LsouO5SSjdw406i+9AVTijjgSWf+q8RtnWJCIPgNj/C8LWyBsHgnP/1gQIe5TiyBw==
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
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 68e12a752edd..c26954e5a605 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -74,6 +74,24 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
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
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -586,7 +604,11 @@ wm8960: codec@1a {
 		wlf,shared-lrclk;
 		wlf,hp-cfg = <3 2 3>;
 		wlf,gpio-cfg = <1 3>;
+		AVDD-supply = <&reg_audio_3v3>;
+		DBVDD-supply = <&reg_audio_1v8>;
+		DCVDD-supply = <&reg_audio_1v8>;
 		SPKVDD1-supply = <&reg_audio_pwr>;
+		SPKVDD2-supply = <&reg_audio_pwr>;
 	};
 
 	pca6416: gpio@20 {
-- 
2.47.1


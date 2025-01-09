Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B54A33
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386072; cv=fail; b=pgyjJ88MGg02CBe1iIO8WWuE3bEJhgpLs0l2E/zZdt/KjcAKtSuktj9RV83bJ6CxDhj5zzsWdwDLBdH0nHMEAwnkrvZTHSD6pOR7jl4Xy1HGzh8ihSJ4pgmsB2qPsbwzryrbGtQ4UkmAn8nIaev0QXWTlyCVv9DeE/vq0olv5CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386072; c=relaxed/simple;
	bh=ZeSjPovxQmihCUumvZO2nfCcwxZxUkdlH7O+nvDQrX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nXRvO5SdMf8NbYYrR+riioVSzKFfbwplmE0cI+ExBYX6yVjHfAIkYAhvUUqUSALjLYkOVFsZhTKbJixTRGeulrwlGloyLJLwBIQiW7Wx1xWICbCZ2ElUUPw8GguCJZ0M59fE+/PWQJh413+grYHIHSjZhY35yEyYxbKC5PzfMak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YZi73yNK; arc=fail smtp.client-ip=40.107.21.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YZi73yNK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDymyBOt80mbPRx5AhufKuV3ojZMqSUwMziAaVpu6tKhdnM3iOqR335AFapFTNmYhVvOVXlai8lAJ37LMLM9PRxVfg8k6gL+osddAH3KF2Yoj+OJ9/bgeRN9t5FWoH1Td0VcI23t7Mv61EfX1s8ZG1kJSqsketbDm56e/7LRS/hiIgkMJIgXd5i9+pDUOtPoB81xhPRcf00Qi84qexHtddbbMpJNawBRP9dCVQlDEpaRxjuzaUwMEFe2B2RwhaNDVCcuULlNjEooNYRngt8NTg0LR0sVAVgOdYQhZzCMoFg1UqqtHDvzaHqe9PNiuxCtaV7rCo29//I2DkIDFXKVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/A4PLWYAR0PqOpwd8CDIBSRSgZBZoAevtPKqvLBUtk=;
 b=dd9CMBLY4v3cStwmZXguG3yw2e0m9nQbk4aqD+vrhEuwGeeXOe5Gs3MTUhzIrQDE3W9E6lTOd30TDemSJ9NYp5NLj2q1QVTN+wgNroybQC22ZFovY9y2lxTv+CppIcMM1nHnuTcumLn1OkTcZeeQMBQNp9SRBT6WQ2pztlaPFA9MCOjdn2MQMmkgPM1lvG/zeOEdfb5qwfq/Hb7zdR2PP1B8ryOj410+7Vdo+M/aj9kKaAOCOAQA7JekiPawnIPJdk3+8mQoFjm2DjJrvnWC0xNpoJ25nuerQLKO720LL+fSLgzisX+dFjgN2ykcAQ4VCUmCtJRCMRrJw2jA9M86+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/A4PLWYAR0PqOpwd8CDIBSRSgZBZoAevtPKqvLBUtk=;
 b=YZi73yNKzQQKoEjaUOB+fbpIi4IJp8U/1qfFQsjCaL4P7vPvkPPkFexW5I0DlkEfJzug5hNY1bszSmjv5U5ireTA1V4eq5xxgzMcFOZxnar5NBZFyv6FUsaVrR19ZNL1svP01k7ngBveZS8uCoGQ7r9aeb+a+XBV8B1j80XLf9/DlVrymN5Tst6imH2DPtIbccPKo/lOF3zGRpx/Nvmk4V+TIYCBQjrs1Oepeqze3k8esA4b5dq1wMlmBkVinF+9qiW3NW1GxikGf1BsuxnkmlVVi3KeAwRiYdjwlCOg3ySSJufndNOZUycpr1Dq0gxdYd25esd6W7K0H21MHaFnAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:27:48 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:27:48 +0000
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
Subject: [PATCH 2/6] arm64: dts: imx8dxl-evk: Complete WM8960 power supplies
Date: Thu,  9 Jan 2025 10:27:14 +0900
Message-ID: <20250109012718.328692-3-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 800ce667-4c09-4a73-ae4d-08dd304cd386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xykc7A/OZtysllduicXwXG/n7z0DFG0WzOvO13tH0fFaUNqKgQXSOWh/iTa5?=
 =?us-ascii?Q?S4twxveziOPLfho8NtYIIwwUcTkU4mIPV4pAgoPSQkDVlIlqL528RfMMtZXO?=
 =?us-ascii?Q?BzsC5jyjA8/PKX+HpENclGyqshYYQLfVfI7y3MS93/TwcZmukSLyT5geDkNz?=
 =?us-ascii?Q?tUtvvEafkMJptVkSHgbULXfF0BzIJ0SLUBuLJzPBfxVdX/jyhtMaY3RwKkx3?=
 =?us-ascii?Q?4VcdsZUFzoDMgQAcNY0yrnmsNdXRZjPh6qVfk4OXNHNxETLRmIIcdjou7Y8x?=
 =?us-ascii?Q?qU4k7QTa8tmCnyg7BG8Fo9rEWvLtqWA7f/YTpaE4xgClb45gVDFcknfyeDSa?=
 =?us-ascii?Q?uK9xMPQg89ewvpV5OVkot/gBG2CLhjaVj4WJcy29EUVvwe3fKbSUg5CnElYI?=
 =?us-ascii?Q?39GHyZ1SO6wQLrB6OGgtZ3G6QaC6AQ48bjjTs/GFhKzaaDMzl76j9+9R3lSJ?=
 =?us-ascii?Q?zKwstNx1BJqi0gk5iJvrorVPelgwbj9cjmSsqtOe8aa9MT/pl+08PCHQ0aUk?=
 =?us-ascii?Q?f5Dzx8IIdI85DumYwasRLFC316lOFO8mVqkbBhJ+fjQiCjoJ3j31w8Z+g0zw?=
 =?us-ascii?Q?2csn07330mc4Z0E1OT9uKNYAHyJlkElU+x9RAwS5SrnLcRCoklDn9FZRpGMj?=
 =?us-ascii?Q?damQLX087G4ccdvguDMWARJUZkTZxRfps1jo4W9oi1Ej1Wj6zYfV24uFROFB?=
 =?us-ascii?Q?6fqMGdpPC8W2aHY0eiwNj/Rk4Safm5VT+S+DzaqgUzP+vg5WjTQ/MExgAfCH?=
 =?us-ascii?Q?hoz9DtzZ+2x47RwnA6nsvL7BnQZiZ9UKGdsl4Z3RSyuCzfPP/T8h8ylFRBY6?=
 =?us-ascii?Q?iXziRpWBgzs5xJ/wC9y28Nu/OXk8hRVFPPgLNGtAPraBUOJpmhxzYDg94VeB?=
 =?us-ascii?Q?NYCjMSuPqJPAcDlbVl119oyZxf0AxeUxsk9no39FjeiTxJssjgPHr+RNDL0c?=
 =?us-ascii?Q?V5IXG36ujECLF694PqNl4Kq0cfDeSK0m0g69u+aqgoF88DXXVuWfU2E9cGOa?=
 =?us-ascii?Q?QGG9FjdQr9XbT2CspWf4PkAgQT3GZDUGFD5tdrA2ef4j1nAJ2iivOxAVXg/V?=
 =?us-ascii?Q?Z1Jd9aestjBYLoaI6JIHRx+Qsq7Nz6239nyAyIN/SD4k9wqIAklCgAq7h3vZ?=
 =?us-ascii?Q?G2v5qThsn3pI4mux/lIDAdoyRqpjskT4saW0B7Fi462JVi5pTVVuXcaUeVmL?=
 =?us-ascii?Q?vfCplsf5Ye5NZEyCUPy5erhqzFXffolCIguF4VzvWMIm+q+vJ7mFTYHYEkCn?=
 =?us-ascii?Q?JhsCiGYGd4RVB1I9kMs6lYcbS3Iq84aOtwCW12dUECco7HvNWeoisJ77XxFw?=
 =?us-ascii?Q?OuaL4oRhKQqckHCGUiQmwat9WLHZoJB2T3e4HxZJ2WZ8QlpL5DoVwGLMIZV7?=
 =?us-ascii?Q?hEovmXSUqGGJXQfavmV37G8raBgLefWsuz5IIai5l2BbxgzXCVk4C3duBUnt?=
 =?us-ascii?Q?HpiIf3noAT4S9Z/luzQoluU2wK3hKqyUua3tOBmYSAijuLzQwMazxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bKquPgCfilFmO4Fzos1jQjHZe0F22x+T0Fc3xis8QYNN6EEe5zt5huOcDtmM?=
 =?us-ascii?Q?sA/LZbjW100KerkdnbXs0lnUrcMIlJEaDlh8avoK+MUT10VRAIl2STT27ez/?=
 =?us-ascii?Q?SEu5x6bKnD6iIlblCHD+3YwPwRHgrl3edUOJcPzUkBEFyKpRLU8+RUgZocHE?=
 =?us-ascii?Q?+u1R5EhYnXNDIADEFNxBZ6vl/d7WqpP3wunO30BeD3d8k8RlYDzQoQJS/E3k?=
 =?us-ascii?Q?GBwFuwoJu1g26wiDMqVvB4G10eP9i2GMVKl4bDJYXb5fJ6IQb3zhU2mTObzg?=
 =?us-ascii?Q?m38xe44b1rNh6s3vW7jiibX2uzjCaCzYYrlWOs0vnaJircHm8LiOAV42AHZl?=
 =?us-ascii?Q?fqA1Ao82npE85XmXgCzexflSKXbMWcnX1qee7Wg4sD+dDsmgzZIS/Elto+0e?=
 =?us-ascii?Q?1S8RYRU6KHuAG89Cu9maSiWgadZriSTqe7NFz6YkafW4pvnzxMdHKnHg1RUj?=
 =?us-ascii?Q?c8k2Eo5DcB1UWSpbM4wiTXK8FxyXMZGaibX+iTucdX6rTZAIOCp/LfqxCxii?=
 =?us-ascii?Q?ezcn+HPFhW3yDgpHqYEvyk/3tmMqEhzCRS3apehy+E7FsfikIN4jb7BJ20yA?=
 =?us-ascii?Q?wwK7GWTQtcbGqdoBgorYVAZe8/Q6vRYWpIe+3cu4tgYKCf4pzIbWtJyKZK3F?=
 =?us-ascii?Q?Sova1mwhk5nkhmyKPCEfOUw9AfguhaLLy0QdRDKGj3yNUNSc7LAVx2qLNWDf?=
 =?us-ascii?Q?/v0fYqStUOIYoTz62N8f0uUM8hn9rdwHWbF13+GyTqZiv2yKbKr9DvyF2mRo?=
 =?us-ascii?Q?5156raQp5uO+zDEMr63XYE2rgRvnNQj7reiHWILoPkiGuqBDDsOPlFHEWToM?=
 =?us-ascii?Q?m3oWlG/v2ZG2PUEQbMCHEP20aRH7upXDs7R0f099iB3Lr2lhiT3BpH+eDN8y?=
 =?us-ascii?Q?Ib4CV7zh625yCB6G7VING3qc7Gfjvk3M7w7HKWixHh9QofzfqbsbSipuILsx?=
 =?us-ascii?Q?dRWQf3XSkp7sAP1Z3hBNSleI6y9Ep1iDEEPzycQJqWy9s0i2CQpZnzVL/ZTg?=
 =?us-ascii?Q?UWsCYYrYzpx/ge7/5GJC/G0nYtwVFYiTBXqcNqitKSFvCBaQGu6IWos+eCon?=
 =?us-ascii?Q?cRgTtjE1p4LG8ENgkemknix76bsuRAUlHwU1TiPNGXY3xmgO+zMGn19M1WZV?=
 =?us-ascii?Q?/4p3L4h/u+l0THWt2wUwDXFR8/0gfcXl7uoVAx02oQW/aK9VnMAalCwQoHZb?=
 =?us-ascii?Q?h0ImZIVjqwSVIrNqLtg2N1KdXN5hBniiI/Qb7qXNbECRAEoJD9ZeTQ+mxkmP?=
 =?us-ascii?Q?0G+NWMBY0lrEzV2T0I56KjaQFI9yvfA8Dj0O9KE1HWopXyd3fMU6g6/Jbpb8?=
 =?us-ascii?Q?TScZEnPXcddCOJV21+g6BJHv5uoESDWB6VwnI7pnZbyDE5DlEipytJHd1rT+?=
 =?us-ascii?Q?A5db9W4q2Gg74JNg+6Um6fz+pnnEGV97Px0GA6VrzcVhpv2rp/4ardYN5VAm?=
 =?us-ascii?Q?53pxPxIfb/YroOtQq6N2yJ44xolpCiLGYFjFfKtR+CMTsExYaeY8SmDK+5j4?=
 =?us-ascii?Q?WF38dZb17IvVbO+7189261xZWoNhh3B18THlGZDtp6I3wMcM29j7+LDIUZG4?=
 =?us-ascii?Q?5ZHLXMeoHC90Xp29JcXjjREXTZlo+v+Jrmc9TMdL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800ce667-4c09-4a73-ae4d-08dd304cd386
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:27:48.2621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXO+Z02kPXrIgCIO2192XSh5iaH7ojCYQ5iezrKOAJWYleBkHjhVV7Tlf2wm9dPLeXZl0Nuylb/HGYrkZdhmdg==
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
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 6259186cd4d9..5f3b4014e152 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -191,6 +191,33 @@ reg_pcieb: regulator-pcieb {
 		enable-active-high;
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
 	bt_sco_codec: audio-codec-bt {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
@@ -420,6 +447,11 @@ wm8960_1: audio-codec@1a {
 				wlf,shared-lrclk;
 				wlf,hp-cfg = <2 2 3>;
 				wlf,gpio-cfg = <1 3>;
+				AVDD-supply = <&reg_audio_3v3>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
 			};
 		};
 
@@ -444,6 +476,11 @@ wm8960_2: audio-codec@1a {
 				wlf,shared-lrclk;
 				wlf,hp-cfg = <2 2 3>;
 				wlf,gpio-cfg = <1 3>;
+				AVDD-supply = <&reg_audio_3v3>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
 			};
 		};
 
@@ -468,6 +505,11 @@ wm8960_3: audio-codec@1a {
 				wlf,shared-lrclk;
 				wlf,hp-cfg = <2 2 3>;
 				wlf,gpio-cfg = <1 3>;
+				AVDD-supply = <&reg_audio_3v3>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
 			};
 		};
 
-- 
2.47.1


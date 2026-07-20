Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09C429006
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556554; cv=fail; b=gnkt/irJd8z5RAJQk4dh/6CckgcXKfXXyWJDAWxVaIgpSkEsg4B0V3O6YOudQJH7MkMtwSFdPLaQx0qksM8VV/mEwRItjr3PoUrrKQmf/Wj2QNB+WNULANaT+c2C5jo0UhS5PKeb7alNvIO2DqU+jrbOcBHpU4+HeJhUiohpbw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556554; c=relaxed/simple;
	bh=sbreCOj1j99Vsrcf8m3AHZNT8C53mJkUUN356TvFBwE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dtE5T1rNkW/hL08im5xw5petPVFHBJvOI5m2dD1nZ6wH5Z/e/J1TyRvZCPZKtAnKj1k2suiE43swzb+B2qenp11DfHaElMNj8+yPuXln8WBPKQBhbxElNx9z1edXdgwQT61RvMeYJBxJWafytjBNhmDdrpZXmzCtefRhrB6r53A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KoOlr4gY; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KoOlr4gY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCAWJcvPOvCeQwU+hbQrWVrzDZL5Qt/dFtim2MyR9b5/0IPDxKs9WuA1sh/QRzrF2QugPTyfWz4Ll2AIUO2MygYpEmQDksEuROQu08ma+JRkegpZHQuyjHSmYIzgEJAAyYM8kdu32lfEG3C/XKjI5wWHVla8b6IoLDJIOLH4RL/PYWnoCTntBIEgXIUeYSS71c11E9Yvu9oGcAh4T17wi0uem3bADlRlt2ZC0qusgH7QIAuQWw6gQiOSIH85yeht3Jt1dlzCg7aHrAtLA3wlbRDZGwoulA5MKR/4L2tqkUTyF2iTyQtl/r825iGU9+M6Re8euxGoOlPUbHicNb2F8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL+F/E+uwivP2AsFjYsZ627mA01c6NtbGU0SwjLmsHg=;
 b=mPbGW1vqh4t6Xh47Nk2ua4h55/koAkcdZUGALp71/GcWT6upcKpm2NAbSXYBg+GfA0a5KH4nv7ocA8kRDDo82CPhfAaGFx5hx0g3MEmQimLWhuvyvxxQTcK2w9agTeWNGxWYdZWHdyoFz5OjRCQcu/uBITqxF2W1Za9XVy8nKWqaOazV+8LiTCVo4WUITzKMrxdTFYP267jYG6febMa/Y4ESaXRyFbQGW2xNXEk+KRIEk76wNcoZ8u7a3Gu5ITDC7VL2lOF6XFXWzuXTfZC1izuxO8coKwNrR1/1OHxzmBJ91383w2Y0YvDq/D/BOxaXSRt5kCqifp9so6Xf2ytKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jL+F/E+uwivP2AsFjYsZ627mA01c6NtbGU0SwjLmsHg=;
 b=KoOlr4gYs/48Mqur4mEkPFjPzDSkV42cPseQSB5Kdt1pU9UZs/6NN56yCnSXLnIfqi6o9rrVg24+NnDZvOnpPwtImWCbl9aOUobIO5lg8aKFJdxFkEgX4A+zaa56JwR+7eeTRrgkidA8ulqSkgthJvdNvKy7mx+DxSZZgI7D6jTlnn5SyfvP3oXlOupi1BYriIG2KWsUI/myxdfk9pElVSKGqVUPZVdEM1iq/6+iWoGEV1omIRB3jyiv8iryw+5aJeYGGAUKmmCug4fyc8e7tQ3hJqhzwUmD9stJJ/Y5+Hw0TPRc4ioAHN59Qb4isOrrchvTu58FjPdFPDgS/KEjEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:09:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:09:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:13 +0800
Subject: [PATCH v2 5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node for
 power button
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-5-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: b3830606-772a-4139-dabd-08dee66877d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hWENHKy5EFJIgskqZXDjAzpCotJDDT7o3aP8MFGdNX8cv9Qk0dBxKUni8HIFfJ2y0PNAQXAtSkTlpLQJuFOD4fYmqBD4NHmq0800n43yztJjygtz2MTYMC+5XjoVxUDfacZ1D1PnOPSeXMCQgW3RA4NkEBXLsQjTcEmX1PBTcp7p1Vsnt55rGUgpy91WpDH0wJBrBBKUMhamXjG026M4UCfo1T3eVBScsRE/XyttL7oOeTglCp1qpuY7/4pME+y0/YgNIfAKP64p/ChYtji/t2qmPPF0bInwEVBvvPIH+eqhRVAhrJKY9Uj4R/qqAkaXhG9go1pPy0kq5ljGf4AAzbp5DtTRsMwm1Xk3wKGOIShXIZnjpIWyaaUMlZ98kNXmKrPRmROqgsQ3nZI4OGml6qnXSD9wsYLLZynTjrt2pUwP/Q8p7staTaRaueQx+pOvdbNnt6SJZ+TOLxv9htqYUvnLRWviD8Lz5LxhQfdVRVqOdAC1Z/AGAVkx0y7RKfCuQAYpH4k01KjXr7jVj56lSvrPva03mq/wsAuFbLmf05mo6r9NzgKFbZyU+LmtdqBJedxt8WQbswXR82eZ6nk9ntCbNqwcxq2VU72xIYHgAjnI2c7NAk9ROLDD+LLZBxhKh6mFNdkcvWM10ZYNFjDtDPgrCQABIkK/hg7pupBw7DQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RuSnAzcEp5ZUtIWURBSWFUV0NXNUJLSE5NaHhEUUZZcTQ4UFYrS29MdkFt?=
 =?utf-8?B?RDRjNmpoMngyMGtTd0s5eDB2ODJpREJGN1R2d0ZVSklleGltNDFWbXlNM2M2?=
 =?utf-8?B?cFptR2VQZy9qRkpDQ0cwQnRsT0J0VTc4ZXRJd2UyT3pFUWR0cisyR2hvOGZ2?=
 =?utf-8?B?bzdtQk9jRFgydlhsS2Q2dmk4L0Vld2p1N0Y3MlBYU0tLRkNUa05Ic013cGJh?=
 =?utf-8?B?bzJBUXNuTSs5NXJhVTFDYmhuZWNua3ZhUW9qeHlCOXYwWHViUCs5VktIUTF1?=
 =?utf-8?B?R2k3RlNiUUszSHNrQW9kQnlVeEF0SGVXS2c2Q2ZpRW9VVWw5RWxHVnFZTm1D?=
 =?utf-8?B?S09Pdm9nVDZpRHFRMUNiMzhweFhlT3hERDI0UEVDR3hDejJrS1dCclI3TXhj?=
 =?utf-8?B?cDUxM0pKaDJiazhDekNYeUNGZGw0cjdsWDQrNXh1ZU1hT0pNalVhRFN0YnFO?=
 =?utf-8?B?cHp4TEFBVlJLUGNnT05SMmhlVjlUMlBnd3hLSmwvdUVBMW96eXBsQU1vSHND?=
 =?utf-8?B?aGlPSkFmNDNJbkVXS3pMaUc1RktGMzRvSmEyRjJJN1VCMnAvZlh4YTEreFRp?=
 =?utf-8?B?eC9la0QxQUQvSDVJaUVNaTRmS0lZOEtGNHNhNENTRWtRNzdVRXNNOE5xaUdq?=
 =?utf-8?B?TC9iYndudHcvekxjT1lHWXFDRWc3Z0ZMUmdNWDJwdlRhTjRpTnNCRG00UGZV?=
 =?utf-8?B?MFdoU0pWMkNSOGdadng3dFpETCtYdS9hWG5LS3NSNVl5UjNKWnZXQkxqU1dK?=
 =?utf-8?B?Wktqd1E1bG9NZkNBcWU5ZzRWOUpsdzArd1k2UHR4YlZVQWxmdnI0VVpmMUlJ?=
 =?utf-8?B?TW9hRFR2aFRQU2U3c1RMV3F6MXVTVTBUMmw5L3RMd2RZcllvZ2dlRTdmaStV?=
 =?utf-8?B?Uzk4WC9neUV3LzNZbUV2WHhNQzRreHNxQkQzV1ZLTU0weFlaR0hsR2N6MG1v?=
 =?utf-8?B?eDFJY1BodmxOekYyVjZQZW92VURvbFpoc3gvaUlvOXVZRGh1SFRGS2thVkhv?=
 =?utf-8?B?K3VSSm9MWXJHUjZPWEpXc1pjTk5JZVczSXZEUlIyMVM5U3J6NWgybytBUXBG?=
 =?utf-8?B?ZHFRRFV0SnV4TVY4MmNQMTRqN0FjZE5mNXdpMFhUWHJtR1o4M0xwQWFzMGhZ?=
 =?utf-8?B?cGp4K2VzRDIzTFRBUFpvanp4aEUxWEJvZUpuTzJYczlUV0l4dTM4bk5yM0lj?=
 =?utf-8?B?QmkxVnN4ME9iMmNJWUU5WFBXZkpBclRwOUJ5Mm9lRVEyQ2MvWHBpY1IwUWRO?=
 =?utf-8?B?cmFoTkQxYTJBWGErTlhmbHBwNWd5dExqdkEvbDJHNnZjeFlqbExWQjBUdERp?=
 =?utf-8?B?RHFCY2ZEam1SS0tjS0M2MTBnZGtRQlZzZytHR2ZZK0pENC9ldFZsTjRHTkNE?=
 =?utf-8?B?NnFGemcxaHBqRm0yd1pBTXlKdG04amFYNjhack45eHY1VDkyTjBORlY1bVJt?=
 =?utf-8?B?Q3Vuc2I5cTdkMlpRTTk0RDdOU2k2dlpTUVIxVTR5bGd2dnA0bktTa0VyeS9U?=
 =?utf-8?B?dUx2azBBd0dwZmdMRGFiUGYzVzlvcW43STlMYW93bjVYMGhUL1F2Sm5IV0J4?=
 =?utf-8?B?NmdVeTZJcFhqSmtzdm9EUlRNbDIxTjFqcENjejViRU4xb0lLck93dVVOVzZi?=
 =?utf-8?B?eGY5RG5aR04xY1UyT1N6UEdYOVZKbzJxTm1nNEY4ZFJUUGhyeWV3elBsWUtx?=
 =?utf-8?B?cFlrUGgrZEJybU5DYkVwT1Y5R1JTQ243ZHhJTEZick9tOUtSY1lFeGlMSXdV?=
 =?utf-8?B?NVcvbGo1VzFVYVpHemR3QWxRN2thRjhPc2N3NEswRVVjNkRCTnlhL1ppUnI0?=
 =?utf-8?B?RkpBQkJobEQ5QUFlUkpGZzZPc3lDbjUvWFBQb3cyRjFSb1lMeWNDOVNYSVN5?=
 =?utf-8?B?S3hmRUp3MXFvOWxockFld0ZlbEpCK3BScmM1K2c2S1JJRUxLTFJ3R0U1MGJk?=
 =?utf-8?B?Sk1JT1p6NExjcVJCRU5xV1RvTjArUU5VWDF4S3YvV21KSEExNkNPTHJXdkV4?=
 =?utf-8?B?RVJhazdlczZCK1VmQjRlcDhUdGVDQkwwdGoxL3ZBbzV0TE91UTN3N20zN29C?=
 =?utf-8?B?WXF6UisyaFNIaWlxbk92b3pRZzhnVGhIRndhcXlNTVljc3k1SVBqS0xPQjkx?=
 =?utf-8?B?amJ2MXEwTWd5TUtYalVNWGwzc1YwNUdmWjRLaU9MNHRxQW5pLytBN2o1L2s2?=
 =?utf-8?B?eTJjQ21MQkJZejVJeGNReWtNYTU2N1Z1K2gxcVJwcVh0WWp2NnQ0b0g2ZFRa?=
 =?utf-8?B?Wm1ONWFzcHUvcWJVblcyaVJIVm5aRTBQMGdpWm8yM01QZDEwODgvZnhMY3pS?=
 =?utf-8?B?SGJkdDlmYUltbysxQkhWZ0RXa0NzVzY0dlgyamVyMWxsdkd0THRIRjI4Szdu?=
 =?utf-8?Q?VRsztEEgcLhfi9mPf1yIPcHqEUPBQKNn/dE2M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3830606-772a-4139-dabd-08dee66877d2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:09:09.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTMGazo1pad9zQC7jKyJTz+vCPT0VyIJ1fPvFRyNjxxGDJ6w9+UitbJjnKi83tLlYEZIbRbTb/WTYCeWV+2M9ufw23ibR9SipxpNvcLas5PveD74RJn3cYlSoGET0OV1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

From: Peng Fan <peng.fan@nxp.com>

Add a gpio-keys node for the power-on button, report it as KEY_POWER to
user space.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 19 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
index 5497e3d78136f..af8f0d6087f71 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -10,6 +10,18 @@
 / {
 	model = "NXP i.MX8ULP EVK9";
 	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		button-power-on {
+			label = "PowerOn";
+			gpios = <&gpiof 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+		};
+	};
 };
 
 &btcpu {
@@ -43,6 +55,12 @@ MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
 	>;
 };
 
+&pinctrl_gpio_keys {
+	fsl,pins = <
+		MX8ULP_PAD_PTF11__PTF11		0x3
+	>;
+};
+
 &pinctrl_usb1 {
 	fsl,pins = <
 		MX8ULP_PAD_PTE16__USB0_ID		0x10003
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa0..6a92c5ca9a412 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
 #include "imx8ulp.dtsi"
 
 / {
@@ -20,6 +21,18 @@ chosen {
 		stdout-path = &lpuart5;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		button-power-on {
+			label = "PowerOn";
+			gpios = <&gpiof 31 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x80000000>;
@@ -323,6 +336,12 @@ MX8ULP_PAD_PTD22__FLEXSPI2_A_DATA4	0x42
 		>;
 	};
 
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF31__PTF31		0x3
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTF14__LPUART5_TX	0x3

-- 
2.34.1


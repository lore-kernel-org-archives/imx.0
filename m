Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228143FD124
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458539; cv=fail; b=V7ZyxBc0RgqkH78zWFVGhrwaQblR+AKGcNtXuivTNJrsHW//XT9hAm0pRCXP/k9fmW+Anq1pqmlXnULtHxgwgILmuL9bENbankXeyFnt7TIOBW1jfUetZb6gd9BQIdr+kW8T5MhWYO+nxgj63JFu7TfBkmY6t4u0kDv9xIsFFtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458539; c=relaxed/simple;
	bh=t1Ci0T7Y25+qXwFBJr/zj9/kjSffdqAejvLv9uUlwFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sXJgNRax8IWZochY6E5wrYRas8AIhlCCmKchVdy04bOuy3jD7pc96bHgqNkG62yu8YwrsiZt07G80bTC6fZZMCAxfiS1abJgQAIcJpcDZQuIgNU+9jK982spyLLP5WLFfXtydP+23q2XqcpMH72iPnse1zA67y2qv559tWTbZcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NUXW1pJU; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NUXW1pJU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpLLnkPGMUipXA2XTVzWgusMqtIcDIVTotaIEW39yBltrY0Tl89/lwMFpdgoaeuuGv0mDK94EaHdNS+LOeI9CTafiee0F/ugVniqKvnDoTC0ikYTp5e7uZW8KShzmCU9/4RDhfwj0SvtZ9BAAN4uLB8Ak5todZAq7oC1i2gPv34waE3qfMckQ/3YYHK4hQfQw0IVkSuxDs4UWmLEpHE2geeKDSgaT++zGI77JDYHszwlhWnehVOJeN3wP3VwxQVzpPryxW6/VA6ADWvXT2CMHSXI56s4oP76FtiJ6sDE9RwlZtCxOZtkHUtp+2sKfV4w+EenW1HiCEkEYowCOdckuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG+c4Z6XW7+T+lZeSY1bDwdwtIjNuGJbyuR6nZ13QAM=;
 b=Lb4qJbX2ilnvpG75FRuyLOodQpsfu+k5JJkrVgUHbpdxYdaGoI5DG01Em51wh/u5wnv++nOxkQQ+O7CNaZL6zRlPIsMP1GO6C/Xx0qN7mYoR7ZKIpGu5PetjhA6R4XYvsdqk6GG/J1bhnbqtH0Pa24/ec5cCb8/I/3B0VsSagUg++FzK7KlaeGXyFjvMg/6Rs/1et6llp8rH6EDFZC/98QuPm+06fdnAd5EqgDXRsQHAlqCzWleeobPtD3ZJ70j0DnsbCjorAA1TmEb4bq4E2gO1DwnfSmvjfWHQngqUr5dlyK0eZiZcOpVnR+CQQEbGsR0ZxnCkcpaPaGmTekWD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG+c4Z6XW7+T+lZeSY1bDwdwtIjNuGJbyuR6nZ13QAM=;
 b=NUXW1pJU0IECmJ7gC9P1zlHQ4pGejFV91jEfDs0GZQ4Uipa4dz+YcHB01Wis7E04vkmzwUl9LhQWfDsFpt2byzug4lCLPFLS3qArrAY/opWbsScKX8pIfE20CYoUXVYwzDErlJCFLMDi39yZXtgC+aEg2lYgR7m6sXlSNPyYuYCOMWY47oD+gqq1oI++QVGXOyWHqNufluEvTHh9Ny2Gz4LTOpdIaene91CENP4G5LW8w3eg87ERzUA7exkkqmBvOKXDUnRNxREXjavq6fBDqpZ1JlVIRHouTyLlR+xMKR1k4lUkfmODkJQ1ld/Kbi1+X+em+1Q1S3n7wZZXDwLoOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:35:33 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:35:33 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL_PAD
Date: Mon,  2 Mar 2026 15:38:05 +0200
Message-ID: <20260302133806.76191-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260302133806.76191-1-daniel.baluta@nxp.com>
References: <20260302133806.76191-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: ff733bc2-5520-47ae-0b20-08de78609478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	5BP0lMXhlbjmdY4F/w4ZjWuxH9iH8AdrzzQhCscpeq3wimuR1xNoxmdAwqq3bIRnFJnoh1E5Oxslnfh8+9p1RyQFPFetdimaGYXrIX+ew2ZaCEZS1mzGawOMppEm8ksgrAxammwhjx6pu0HlTJqWXY8RmAcmRHqwdGg1wX3Ak1eysMbxY8N9adBqPAqQ7Nd2tXjtpcZayRJQzk5Q8SwH3N3aV81jXfLzz5EtYcxFofxlr0yIWfSO+Zz+t58DIbwe+cpL25Ch7XwLUSiAaIaW6jJziL5U4+wzAS8MIuXD8Vjv/2Gmf9050fYAe1JmwW2F3vrsLd3J7OhOL0zYtlNhDJlCsZJAGcXs5q331cf7Jm2JS+wwqG+DxXsfz/iT6G4ECrY6a9G1/vktVHoVgpLfYXDrHTOItMaLJiCKaeNIZ4/wdFN1SHEr4iNyzCQBN41h1fC4v53Z9oaE05IaUDGkS1LZ2S/oHPMDRCjhRq4rxvOgTqpTTC7xPnWTlizK9m++tdnTdwZC5QBxghsWWn4t1JILSBR629erB65Q94TgP6qz6oPUetp1/qxb3q3fcD/taC6g3RqWfFnfor2nG8GbCiZX/widJoxkV8Y+lxNCk4/NebmKx2jLHBRoyCIeosq+1oY70J0BwpP2a3nF5EDW90QOUTaByOAK5HcJ4hxVjT5g1RTZpF3sDYxNzrNzSY8n3gMraxHBClfVQDLaWtPtO9yYgnDjMblUGhcLxIbQ91F4qP/8InnnrPdZyORHNF/VCKAnfMxnUjWPUz+KBokUy7654es9D8ZIjltwozp3NQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rpT0l0JKLlMW6xSC2k5qsHF1o/DCIO2EbPYzeh8EJjkGEJ23l8Sx3q/xEMDa?=
 =?us-ascii?Q?VRadehQzpzpxLrk8fvXJ5LdIoQtQAHebjPMfAzS4DM8tBrkmrNsvqbGagps7?=
 =?us-ascii?Q?MyTmltRlW6Ru/XccDpBnp8QB06PnnPfKA1Zvj95JiV227xO8K+Ppk6NGTM+B?=
 =?us-ascii?Q?jI7uSvJl59MFW64Gpcq6X2SFMsJAEXBdKf2y1Ect0e48UGX6xBU7mPHOvkGy?=
 =?us-ascii?Q?u+8vf9rLjai+ZhnGuatsov+1pwyRQ/tVaJxQYw9HUpXq7W5VDZvy3L1HkxJX?=
 =?us-ascii?Q?UZf7WTT4jRzPsfAFXUoGBRLnE38wr5anSRr3lwVOYtHrLow7yJnoUSHIa4JG?=
 =?us-ascii?Q?lI0zOzLv8vGHh8Ci/pIUfrsWDPhJKaeipCeBOsTqpM3S7ecXDqsQbPjD0BXg?=
 =?us-ascii?Q?xvbEXvJSTJArPGAsic7vxZ2bpRMvva2fpyPEeY3590ZMEW20jhv4YrHogAi8?=
 =?us-ascii?Q?klTkfBdSY5EKf7RZ6KpaCkw111jd7RmdWdhtA5TeCOus2aTZ3tbGehAf/Nd0?=
 =?us-ascii?Q?2c6mTg1FWN6Ebu6W3LWkDT3yjVQmOcm5MEercAE3gJeHRqEzyOd5YvT9PaXV?=
 =?us-ascii?Q?XqGbyleKDfbj3PV7FFEn59ZSYCVwdIlE347mhKX3VqK1TUbZ3XKRbM/jPT/e?=
 =?us-ascii?Q?1KZVURSP1E0tnbA6C3CPKcFWQsaE9QfKze6cyQpDapJzOrhbkYjwsztPZCph?=
 =?us-ascii?Q?Amg1L5jLha3RHXQdwSuNZZojdwKTlRaR6XY/yxyNo9NUA0EQt8mhsr+pLlMD?=
 =?us-ascii?Q?KdYSQP6pNCbgYEMuyhlAwDMpxKD/UCfdCS4K3IP23NQvAmVIUUeu/EPPweNo?=
 =?us-ascii?Q?JZM5pTgFaykkDMWSSZ7ihwx9+qNRqKKLbS/564Z/pBBvZaTKRG4r6YgQJxy8?=
 =?us-ascii?Q?h5lgg2go6G+J0WLyL7aN71C3FHj5d8nh/TQiYzr9idMYDvGZ7A7oL7v5pQkP?=
 =?us-ascii?Q?txoo5CV5MT8yjCJuDaV4tsGEfWTHdS+XiitxVpFDbJgnyVwPNfqbVcZhJsyG?=
 =?us-ascii?Q?gG5OSuEFNJOXuQ84zJc4nhwpcaASzu7QkeTCIgSrqP7AiJINQuxOCbuFaUEE?=
 =?us-ascii?Q?tbPRGcfRGjzCxOyx3sDaBaGEQemLi5373l/xfJUAJGPuBPeaYJZCJTTDHA35?=
 =?us-ascii?Q?C2lso483ISJ4IeR/im81xbAPDWI698VuBR7Qbz/2OOY9gsiUGqCPXBkYDzgX?=
 =?us-ascii?Q?BkyUY3QbrpGudq77fftUF+teWWolEByakTO+Rx5hGWoVzvKptO2m5HyTWejS?=
 =?us-ascii?Q?Mssqqkmtdmefq2OZeyLBo4r8Xv2BfJIOkD7ENW4WlDepAr7Y3ceKDyb7TZgX?=
 =?us-ascii?Q?f/dveWEsinMEoQeK6NdCGGYyvulButJEAlU+PPilEDqabrnnLgBvv9i151w0?=
 =?us-ascii?Q?lbvoZGEjnhJmlGDVpj38SnwwScyQISJFTdEK0bekKgOb+jo15O+XserFdhCQ?=
 =?us-ascii?Q?A+3jnR0nYYfx93TzS3Z8o8II1Vi+2bByeb8rdCj7+2yj0Qqgu/4qwqBtKsQd?=
 =?us-ascii?Q?niyCAl3hBpAYTV1jjvIIwOPtjS1JFvEqKKLkqx3zTTrXZfAFMMBfRHxdUl8y?=
 =?us-ascii?Q?c+t9Eh0LgDh/I/UAKAr11D5HFOtmxVURU4K76LmIlITdptNDQev4I0TzgIZl?=
 =?us-ascii?Q?Xm4mQAhoG1dOz/2iGjIYh+YIY0n6ggP4ZeFYkpP/HQR4fj+eRypjBu8GH/mX?=
 =?us-ascii?Q?GCAOIQALVP1+pqH1ug+cK+mw0OwJzn1TEkCiuzrhjcfaStU8gJeVTe9hPJ8v?=
 =?us-ascii?Q?/7Dq6+D/ZA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff733bc2-5520-47ae-0b20-08de78609478
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:35:33.8155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cejUsrxa7xinIHvF//bavZoDcsSvRi5rrMK2OQjpuG+Qx2iMGq/DEA4SVWiGl6u7EoscGwQKWNKLk8lsC7wB0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

Currently, in order to configure IOMUXC_SW_PAD_CTL_PAD a magic raw value
is written in this register. This makes code not obvious to read and
modify.

Use symbolic macros instead of the magic values to improve code
readability.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
 1 file changed, 84 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 55690f5e53d7e..d69d78fed4e1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -252,104 +252,140 @@ &usdhc3 {
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
-			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	0x400001c2
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
-			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	0x400001c2
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	0x400001c2
-			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	0x400001c2
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x000001c0
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
+				(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_pcal6416_0_int: pcal6416-0-int-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x146
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16
+				(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_pcal6416_1_int: pcal6416-1-int-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11
+				(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+
 		>;
 	};
 
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	0x140
-			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	0x140
-			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	0x140
-			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+				(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+				(MX8MP_FSEL_FAST | MX8MP_PULL_UP |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+				(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+				(MX8MP_DSE_X2 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+				(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+				(MX8MP_DSE_X2 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+				(MX8MP_DSE_X6 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+				(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+				(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+				(MX8MP_DSE_X6 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 };
-- 
2.45.2


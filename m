Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B0F262A6
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009034; cv=fail; b=IOyCjuDK3gNnkmWcNl3GsO5IwOjnHJ005a6bF74cRLZXQbnSFkcrTEeRnXRr+Tz5/SB55cwgwUt0m07hM7qESCVE5BlnBJSUoT/yRXgpaLu3Bnnko6U8kfNvW3+8AbrUEn3lWMJujCcbBKvDtH/jch7mLg7dGSwGRdauyxTQXbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009034; c=relaxed/simple;
	bh=ECLZdriraITqS6H0FIiEcMl9GET73t+FS6PqzEMi5FE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HAiTeA/Hana/5YF2TtyY0eUehhHIIImFVfGz7N8lIBG5WDndr4bTDdltrkHxOMvAXny2Ik4AP27A9slIh4frfFPcaajwkxyXibXdJRmVTz+iOaURR7vBolCRqz+IFMFfI/S9/t52QllbwiW1e2i81C7ODYrk8Lb7Uka7U37Q7nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i3r2tRxK; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i3r2tRxK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UufV/ZItYrDm7j1GFO87lSHr83lJ59m6YYpb61UAJFtd6x4x42dXoB5Q3VU21lx0xs0KX8QVNUfSx+bhPfOhcYknvktWP08tC06sNqtpPAiHWU8iwwbfsb+HnkXJWAgRb3zWI+XOmBGk1AXcKhD58+aP1/02D33rIcwa54bKTl32q4TVwKKyxFyYYobO7tazUhjA7yg+lcvLuo5E/qT+Y7YbemNA97EukuXBdc2TFaULERsxFwMqRwUKJUDpz2+igXa4c6ekIoX+g94NlRxblnjn85yWHeG/9MH0qAVStpNtaF5snghJdrZquFFm86/eAUuZegMBOR86yJ1Gq134Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RtFthQnrTJ4q5H0nUJBzfWmc+Dabga+RQXQvlOFC40=;
 b=fKvDgSWi2XxiRs2BC6QRyq7Mr7xnSIXetvgR0QCarpoparrqOg+32ZyAQuWRlvsU8PIvFOayzdVH1pZKUgxpsgt2O1PRwtDIieuyvkbf618f8trJvL7Rk4uBZKPoNvCFLeSI0igfZtkVH1MmW8DwTZQchGY67zKlS+UVBmQHo39Cr9Qiqeni73L4M07OwI5DSNKjW22dE92sQAVe6vtOGfhRkuumPwYPBC6NirLbovs1xWB1RcwrbbSy0Lkwxsw34cSMpUouDOmiHQYLsz5pnTR0vU2MiT2zh+4H9hfGneP4d5fvZUSSVP9TzOQ+Ujj3wqCS+a6V7gLWwNz6xkLIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RtFthQnrTJ4q5H0nUJBzfWmc+Dabga+RQXQvlOFC40=;
 b=i3r2tRxKhTzzIqhDt+rIT7QL+9nnvlOh6dgwPjnSK5AWcpHSg5yrZGv/OEJ0x95b6ZwTnCvnufp4rTZ2AasIF5Wj8c4ecrekioBsimnMF+PrQM+ZCRXU3wsA6F4VnwUh5M9F9RBFcAkYJGGtExAnFK0qFvK1BdVtwG7TUOza6RG99BaTJMfULvhrNssDQDraKfH+t5/LohxU0ZO+dd9Z6qc6BVC8oqQN6DDDmltD2kuTQpdFBtQvD/8EMf/df02QTs3zrvRLjeTzyn7OzmzrutP1nLhNlq9FWCqOkJPSeaquRJ5TIkxWmweGHhQysIgbXryyZ2pXFvbwUvxBC1qtwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10762.eurprd04.prod.outlook.com (2603:10a6:800:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 02:03:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 1 Apr 2026
 02:03:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 01 Apr 2026 10:05:09 +0800
Subject: [PATCH 2/2] Revert "arm64: dts: imx8mp-kontron: Add support for
 reading SD_VSEL signal"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-imx8m-ldo5-v1-2-1b1c1381babd@nxp.com>
References: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
In-Reply-To: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10762:EE_
X-MS-Office365-Filtering-Correlation-Id: eabacef8-e6b1-4f23-9db4-08de8f92d805
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cqJK0hYk3Dpn5KLYEoPjQJwe0ZSB9gyG18/oJX1KZlJNmsxP2Fr2LEUebACe+1B2AsdviuPPSdHoP2HfBtinKCQ0fS4yEYLwu7nmBP+Wx64u7dB4Yy/1gKBtDr2CqkhWbC3/+sbQDLYtdekRIC1jzzxCGLDgmE/RG+sx+IkgEx8nTb4YsXpkxtmvCn+IDu4abCEOQ74UBALbuF1vaQrpXaalt+RkXIGuRlLt9t/KNW03VjkZIjfH1H/WmLnv4sIoyGTp8eY4DBxPGPLBNNUhHyJ2DhEK/RvR5owt/+KS4orUu0vK0bDuhU/N0qu5rxxCZVQWM3DG1sxzzbVCJNKYlgS9qOjH20b4GvA97zE5BMAvuEqBJHVsgcweIHgA0LHrQjWQTWU+lGP4TRhBudXM9lfZyZrKGS5LMBAmKhzSsFXF3rJYNQaYC2QDBsMAg1tZQ0Q144tPnnggiz4y+GDUweviz3Q1jYrdwr52t03yiDa6XvVAom+OsaOLPRhZAm750Oi39YQEtZvdQcsldqPHm47s7xsG4hM33jTOqKkN9cZdmDq+Rr3ep915EuvWUlSb6J083ZvH7auXgCoWXFDx48C7YklFFAyo7DC7UuKLVEmBwYCzHWDxQK1mZ5AAIZWpq444SXd+8O6x6Fn54JDN3SMclQS5jCMk2bMCIG9ITYJ7Gvsx3rEkYGeRujPKMVOnCp/Sxx2e9oJfdRqewoh/oM50LLeJDWbrIFPVnXSW0nbyDQg4dykED6GMFkRGhTEgDTZC185s2Cp1iMXUO2OpGLZtbhJawT88z9v9ts8vzd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2VYdjk0bFRHRTc0QWpSNEZVajlmd3VyQklBWU40a1liS3pBbUJSTElTamwv?=
 =?utf-8?B?aUVJRzhXZWJXNHVVbXByZlVnNzZPeGRxdGwwMTNlVXFrdVNGTVRPbTkvb1U5?=
 =?utf-8?B?M2NqRWdKWW9NUmZPdHFSSCtTaWxrRzRnc0t4NzlPUUkwOWFkT0gvRTEycHNa?=
 =?utf-8?B?WlFDQUlObC9SbU5sck43M010aUdNd2EwY0E2K1liaFVYZTFEaStlMHQ2K0dy?=
 =?utf-8?B?R2x1dTFzK1NQY2pwdkFtR1phcFg5a3cyWlJXZVpOY1BRb2J4THd1Zkc3Z21H?=
 =?utf-8?B?OUJhaVNUL2VhWVVjY1dzbS9lMm8wU0VjOTYwMUlvQ1hsT3FDOWFZSnFGcS9j?=
 =?utf-8?B?QXFyY0lRQnJvZ1Y0THRhbGZRTzAwSVVES2c0Z0JzaDJtS1Y2MWwxdmFNZ0ov?=
 =?utf-8?B?SUsxQWhZT2l1aHE3UTR6R0ZtdnhCcnRWaDFjejlRZ051cVBLdUNTS1lHdTk0?=
 =?utf-8?B?N0hPbHhJZTU1TGlIcVVWQnF0UENkMDdKanprdURiV3ljQWhXMWptQi9ndW56?=
 =?utf-8?B?MjB1OTNjQmNkbnBBQnlJTjNiaGN0YXAyWld4clJvVVExYTc5L2hFdm1iMzl2?=
 =?utf-8?B?SkZ4QU9HZjBJNFJyY0pSWklxYWxaZXF1TUdZWFEzcGUyK2dZS1Q0WW5MK3hN?=
 =?utf-8?B?L2tKbURGTnlkZWcxV0xNY0Qxd0FHbStGSmkvRnRhcFZBdEF0ckR1enVta2Rz?=
 =?utf-8?B?RFJsL2VjbEhpRng5N0R6cjNGelNxRXN2UnZOUUFpZkF1ZTRIQ1p0K2l1THo0?=
 =?utf-8?B?TjI3RFZtU2pPYmxhYmZJUFdDdGtCc2xEaG96VTVpSGFObGdQbnpSbE51M0I1?=
 =?utf-8?B?VVpqNm1pM0NaOHVKbEhmaXFoY2VSbUhGVVppTENFbkdMNDNpbFZjYStFOUxr?=
 =?utf-8?B?MUxBRHkySlJyRy9WaXlpbk9MamVXdm1leklmMmlKN093aXd3RjN3RVZkK2NG?=
 =?utf-8?B?dXVWU1BSS2VISTg4VUV0VFltdGdQTjNvV3lSM1JJQ3o3d0VodExBbHpaYXlp?=
 =?utf-8?B?ZTlLMlJLd3BvMVg2cHR3TXEvNmQrZ0tidk44RHJuR2Z2NjBUS0J1WTU3L2k4?=
 =?utf-8?B?eTlSdmRISXV1bklKTnNsZEg5SFNDOGhsM3BsZVhzZHYzd21QT1E0eWI2K1V2?=
 =?utf-8?B?ckdFRmFJSUZITEFieURKL21uZzNhQ29QZ2RpL2szOGNkOGYrcERXVEYxTG1s?=
 =?utf-8?B?RkVCdXJ4emZqOXo5L3lZSGtsSkNyK0ZXTGh1YVBXUDdWREt4OGRuMXJLcjdx?=
 =?utf-8?B?T1BOSDhPT0FDYkJNbHdSSGZDc200Ky96cE1sbnl5Vy9GeUJvZkVsVzRrYkpL?=
 =?utf-8?B?UlZCc0JORE53YjdFNXUzU0RFM1pSaHdxdkpWcUw2M3lWYnBNa3lncWMzUmt2?=
 =?utf-8?B?VENWdnlCOWlCdktuejU4ZHJxQ1RxVGFENEFqdFZuVGZSRitXZFZ1eEZDVHRy?=
 =?utf-8?B?QWl4M3B1Ly9vL2N3RjJDV1FTaEsvdlFiS2x0eGp6bDdlOXZlOVhLZXlLTVRV?=
 =?utf-8?B?U2VYSUNCYlJiR1g5eXE3d1VBT0FMREFJQ1BSbmNBajV2dkNZU0w3bkQrY0lM?=
 =?utf-8?B?a05DM2RrczA1U0x0WXh6OGVvTWFUb0tOUzRZM2pub0xPZ1ErT2ZVSXc0dnFS?=
 =?utf-8?B?SitvNWcvU3k2bE1YcDVJeU14QlA1MGFib1NUVEpIcDBBMXo4Mnc0Ui9sQWV6?=
 =?utf-8?B?cjN5cGVyRFJvTEtFeW1JL2VCdmNQcEZBTFhsNjBPRllMOXMvSXFWUTd6U01M?=
 =?utf-8?B?NGc2N3diejBNR0xSaW03RHJiU2ZpcHpoL0V2TUVUUGJNbmQ2V0QrYVZpMHBF?=
 =?utf-8?B?TGZMK2ZCTUc3OS80LzFxLzJ5Z0NxUkxrNEkvN3I1bGRNbWk1ZW84Zm5DSkRW?=
 =?utf-8?B?eHg5eWpyVVZWblBDb2xGSk5YSURDeHk4bTY0OWxmcmk5TkV3WDUyU2lNdlJm?=
 =?utf-8?B?THh1Q2JpUjJkalhjY1BNbWZGZ2M0MmMzTzVSQ1kvKzBDc3pMOFZCZWdibEZy?=
 =?utf-8?B?L1Jka1pyR3dqeXcwbnM2N1ZzUFFwQStYbFBpN09SK3B3SVc3V1RKVC9rUWg3?=
 =?utf-8?B?dWl6SUhjOVl6U2QrMHl4aVp3MkhsWTJFZXpCM0xrelVKcFkzK3RsSXN5bHlX?=
 =?utf-8?B?MFkvaVZSUmlSSzB2dmJLZlJ1d28wWHdhaEtKL01zSnh3MmhmUnc2bWpkY1NB?=
 =?utf-8?B?clBKaUxzdkRWTFRwOE0yWUovWGhrVHlFZi9NVFprQjJaUHF5Z1QxOXRxcEhD?=
 =?utf-8?B?akt6SkQvdElYWGtMUTV5V05xcG85REIybWszMFRKc2Y5bll2L3MyYmEzaFhV?=
 =?utf-8?B?YWJXVVdVRVZjT2dncCtLTWIxOWVSeVNzcjh6dU1ONWZYSEhpUTlGdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabacef8-e6b1-4f23-9db4-08de8f92d805
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:03:18.6604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp8n3IvVWU3FLDD+M+EYggoYTJDohSbFpZFo+Y/IVeJSdfwsrT1nvWyZcPkwJ3WVOOBkIBCag8qXxM124mV7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10762

From: Peng Fan <peng.fan@nxp.com>

This reverts commit 39e4189d9d63a0b6fc15458ce0136e99ecdfb1b8.

The board uses SDHC VSELECT to automatically switch between 1.8v and
3.3v. It does not use GPIO to control the PMIC SD_VSEL signal.
The original commit intends to read back SD_VSEL value from GPIO,
but it is wrong. When MUX is configured as SDHC VSELECT, it is
impossible to read back the value from GPIO controller. Setting SION
could only enable the input path for the mux function. It could not
redirect the input to GPIO.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index bc1a261bb000ed0e8071d214111c12689bc394d0..ea69c639b30b8f7e05bb103074c6481d88560c53 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -311,7 +311,6 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
-				sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 			};
 		};
 	};
@@ -815,7 +814,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -827,7 +826,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -839,7 +838,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
 		>;
 	};
 

-- 
2.37.1


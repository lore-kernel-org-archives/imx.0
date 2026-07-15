Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2B2441B8
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135991; cv=fail; b=I3Tga+gu5U2Np3842gXxWhv/nbDpbZotjULJMvwoGcDjO1UY7HAbtoqWAlkoeiVVMN4B6d7xOHgedKr8W+hqpxC3vsbiSjVm4eaxMeV9JuHO3GgtUrYfP9XwVbQf1z/inQd9W2grIKYqs+MlaLgyK6G2+mCe6aznCdfsDGfN29Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135991; c=relaxed/simple;
	bh=rXCz+RjRryPw6okSsLS2gT1n2zw3GWgVY8tsmT6TdRg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iOTVdWtJ1TVRhpe8TAAzjuraW7bSA1muvaVhbG2+maTnJzI96Vf7VzrDAIhxQUsVUPBPHDkF4PpuRBH2R60V3AaH8iTBPRounK/iOpljz7BKNLJn4d3xr+fAuEp5V9eYvdMEhrmIEjLo/S9KCVjB6mIA/1z6zKIO6l+1r+QAuBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nLzqDsqd; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nLzqDsqd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peaf50uhAmt8DP4xfvQf4weyEQTAEmoW1KhHXtTLkf+fmbBu1kT4NRiVO0NrfgwtQJOOsWRRQUG0zlz2cU5KVO5dh71h1ZwHJUqhIy7DFWnHjaaAXA36n6E+aHNEw3IinjnUz4JMFbw2TN6hUQSfERkkx2+ZPdapw+1qpliH6AFpQxK5wAf017RZSuZ4BcGN+6sTT6tbEkR3fHjUD3i4ccMU0EXQQ1xBEC/UnGD3TWlcubyYcSe7YjKsdfC5r0s1sPZbx96FZMA33wjJykgbVJTjnURKGExlgo2hst4vQuZaWvDkmFPVYwrkNZfVuSo+ED2Tv/FyMBND0vYAD2QCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=P1zYYTL3gxsKytICErHaFm4i6y14V+IZYF0JGmf9njZZZlOmoy3OJiQ/AKjPvzMyWjNeA+D0Xpdxpj38mbzKLXw+/o9F9sRxdvoTQkFOzTN9M9Kl7LQdT5Dkrih+s/01c3acZ4Cd/pLaiCJvkvR1ttXvYNxuDLNQdzUakCR3X54MGH6ZpRxFr09zvmKVnhNHz7v76oQrsaihpmUuXPnEk8wvhod4pY8ZTECmm6qLXd4j95pXZ2grD273mOpAiALkYT3341NfGlBEfL5IIWHKRloNyvaxcoNW+mD330YaxlZ7th6pJB24k0+nugeSIx2dNl1ZP2ipvGhs0N3EnFGr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=nLzqDsqdVSZdDZ/uu4G+QCZYGrS+aUwZECLrnsKCpDljhIltf9+49raw3Hlv+6n6HqN8AsFIipLx4Ld3IjKt4pkUipj4CMqr46aO6Upl1yA/YObW/XvFLTj/nAokIlmiJy5iWdqe8zMfkX2bwYG7TlvYrR5/w2OYm/+T1y1BQWY/Sy/ZKU1ABRgAtNrDYCGMWp7IWpdueJJxZM2LnwNHvv0F12fGyVILNsh4umPfW38Y5L5NC+UjK0s6vyCCXsr4AdzOKRJZqaUVBFljjoSvjtg40RfNL07+EC4H3r9Bb5N0UtnUiIWCedDYTOQC3mZtT0bddl1ntIqUDbzofvXvbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10509.eurprd04.prod.outlook.com (2603:10a6:800:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 17:19:46 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 17:19:45 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 15 Jul 2026 23:39:13 +0530
Subject: [PATCH v27 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-se-if-v27-7-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
In-Reply-To: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784138954; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=hnPFsRK9/RoyluFDiCjFX7uqhb3SO3ctyv+6dqueb4c=;
 b=VB+BXSDWXSr4FnFO/Alq2EDTOk6MndOzPD4K83fMPkyASmzE/MvFnR0CVAOTJO9W7oZy4FZ2Y
 67q/r6UPpYfAIXNnxs6XnE8p58Zi29cApQ/qVczpUowtoezGgfrVGBR
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: fc39f202-28ea-42e7-c190-08dee2954431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|10067099003|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kU9m4Q0vsMZeQGFUkx8YHTca6oh1E0r8DRyyCAjFYwpJPBOMiCIQfv7CihKcLlac1W1vz6WVOr0MtbXuZi+/Kwx6M8Rz1sXXdH/i6aHhLiyWQaJOsl4ePIpd3E+/RIaogsgkg0qW/037TmPjDX70uU0Gnel3HQlheZ8CFGQZZqxvChfbMbQPhjXo7gL/7PkpnhD8ECEM753kEOlYKVLurqp0AGp0Bqw6GgQUpLjC19qdSs2OXxcApkuR8KgZ1aoJSYkGaASWavc76d9XEykGc8zQHXmdXmrO/0kVfeKnOyp5kJWZF1ofbkj/TZg1tkNsvHJggNxr0PO1c0nR5IAtyMoKTMml383kYxm2b79KoSSITkiguZ6fTw0cJJZD+BLBroMDLbggD559Elao6qqu1p0RXY8sp3qu8J7wb8Kh5x8tjQyLzEUCIwzvUBBu16cHhwnvQ+90rTOmAdClOcYpD5Df24JE//7W4bQYYcIN1CwLIILvh/4/21Hc+Z8/FxCb7svXNcqOz0KRXg2khq9v6ayMBUS1E3PML6lVI5kjWwIMb0Oqi/olhh3roFVUQ5vHgQitXS4HyO8XvbhCUfjtO7O1b8jRJAlKVNBOhpaunxCY3T17ynuEi8A1/kQfp43fxmSKyqv2Fnkl0bf7kC56ToAhr+3DeWcEGCIQhCb6y/zdnknrA5oF7jJytOTwE+jr/Mch7HRqIGssS/LmoZzkQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDJEenY0RHIrQWltUkhaTUIvdi95M05qTklMc2dKOEhySDdMYzBJRmNQMndk?=
 =?utf-8?B?OTNaazllbi9CSmJyUytNeHRtV2RydTE0UzdubjEra21yQnJWWW5ZOUs4aEtU?=
 =?utf-8?B?UkpmWEx6VDNaRjE1bk13R09iOEE2eEpXYjhOWWlSVGtvNE5sc04vOE1mSHBq?=
 =?utf-8?B?ZkhFbmlzYXJGT1lSdHZxbXJTSW94SHFRWExKOW5lb3dGM25WU0duT05VTndx?=
 =?utf-8?B?ZWNUVCtJV0xiMWg5NXZPak1OU2crcitmaVIrV0Y4YkR2c3FsMjZYTWJJc1pO?=
 =?utf-8?B?dW1UbnhjcFVUY2U4bGdFcUFUSzIwYVI1Sjl0TlliZnNEZ2VBQUxXU1BpVkVs?=
 =?utf-8?B?a2Z6SUhDYnl4S2pmeDk3cExXRnNHLzhTekU4SUhKL2xWaUhFcE5nN2lqVWVZ?=
 =?utf-8?B?NDRiN1ZLZjRmc3FvaTBMM3VEMm1wK3ErNGZMOEMvSTNwV2Y0ek9UK2tuazJ2?=
 =?utf-8?B?Q2g2WnoweWZnMEROWFpOa2pNcSt5NUlNNS9mRkRVNHdQNmhwVXRSRkFkTU1q?=
 =?utf-8?B?TDlnZk82WC92SkZaYmZiV3NaVmxSNUE4Wm5PNUdBVUpHUExHZnpPRzZlQVNJ?=
 =?utf-8?B?bm40WDhrcU10czhiNFMvMzg1QThDaXZ0WjBpdFhLZGFlT2ZNSm1VTDFMaTMz?=
 =?utf-8?B?bEpvT2hmSU0zKzFGeWU1bE1xRkh1Qzd0S241RXYxNXVrV05Pa2ZMeHlkWWVK?=
 =?utf-8?B?RzZER05Ib0tISmJndXN1RHJQSS9VSWw4a3BEcFJsZGZodFNBTFIzYlhhSll6?=
 =?utf-8?B?bGZBeEt2UHRGaWN5VGZLUFl1VkJsUWN3OE1ybHRrOU5IWDhydmcweEQrSTJY?=
 =?utf-8?B?V0dCdlNTN0lCOExLZWYwZ01leXFBTnJYaEdGTDVzL3J0aDd1YTQ5VnljM0Mz?=
 =?utf-8?B?eWNEOTN4QUc0V1ZjbDZCeWltSXhML0xKcXJYTjVVM3lHNldBQ0tNTGZvdmhO?=
 =?utf-8?B?SGV5Ums4V1U1bHFuOG51Y1pRTWpYalpCSWJlakdFeXFnZFdvMlN1UUc3dE9a?=
 =?utf-8?B?U0dXeGFIMXNwSHJhRU9ZaEUrZXJ5OE53dHFLTmRhTVZ2WmZqKysyNXdlclJj?=
 =?utf-8?B?R1FTNWhqbEtuQTJHOU1zWEh5dXhzTE9NK050K1doejdFYUxLNmtLUlZwdlI5?=
 =?utf-8?B?aGVlZGtLUHkrTzc3dWVWUnYzckFrSlhIKzNaSm1BWGdzMDhQSDhBYnAvVVh3?=
 =?utf-8?B?c3ZaR2JXaE9SK1BDMEVuYjdYNEE0eWthczJWMVBNRVhGeE56ei82MWRBdGlw?=
 =?utf-8?B?NGM4TlUxbE53TXlQL1hPbm5wdHJ3M3hRcmlScDYzN1FYTkRBcjN1K3BJWTBk?=
 =?utf-8?B?WExuR2hoaE4yVE15NXZlWGtnSVU3ZDFmY1AxMjZrU2VLNjF5cys2dTMydUMz?=
 =?utf-8?B?ZzE4NWU4VnJhSkNDT3hLYkZnZm1XRUxUUGNIMHFPMlVSaU8vUGphaXZJTEtD?=
 =?utf-8?B?U2RHMHJHdE9OTUcySi9DM0l6SlZrTE16dVN3ejJydkZuaDdSQ2hzR0ZrdGFw?=
 =?utf-8?B?dnpwWDN3UGkwNU93WGRiN2R3RmsxWFEzK05SYWNzWXFFRFVlaHE4SUZ1OWVv?=
 =?utf-8?B?M3Q1RWd2Zkg1bGhoNTA4UG14Y0drNXlqcWg4YU9oVkxnSDdzTVJmQmtBV2t4?=
 =?utf-8?B?NFREZjhxd0dNdTdiRjNVc2kxN09FNXFzc3BQNlRvZEFDZU1IUEpmVHhUdUZx?=
 =?utf-8?B?K1VVN3VjNkhnQzFXcTFTMGFacmlvSFM3NVdNUHVxR0QzeERUS0grTGVHYURh?=
 =?utf-8?B?a3NmNUI0aVRqVVp3SHFFWVg3UUVNSXFkZm1IRmp4Rnh3ZW9KRWhLTkt1NWZS?=
 =?utf-8?B?cXpPWGJEQjFaNHRHV2ExbUhKdzhzcU40dlo0TXdjYjk4OEVoRTF1OFZsVW5a?=
 =?utf-8?B?c1lIYmhOdjUwUmF3OXZqTE41MWlxQmEwSUFWY01ULzBwNWRSZHJ2UC80Q0Y3?=
 =?utf-8?B?eTNvK0xQNHMvSDlOSFpaMkRFU3poN3JFTUJMVGV5M2cvYWhzNDZWeHc0UllI?=
 =?utf-8?B?R0FkKzdaYm55ZTFFdHJyQnZzT0YwckkzcUhtNmlaUVlZYWJQa1VSU1dDbHQx?=
 =?utf-8?B?OXdQSHk2QU9ZTktscXp6aWNUZFNFYjN2UEphUUpEOTAvOXdxQldWS3NIY3VC?=
 =?utf-8?B?eVJ1alk0aWNiVUFGN1dBWUtwL1FWREZKNXI2aG9UbUYrR1FtVDdwd2MzZjB6?=
 =?utf-8?B?U2J3NndVSGxGM1VPQUNSNk42L2puRFVSQlhaMkhLS1E4ci9va1MzRm5UV3h1?=
 =?utf-8?B?dC9iMTBFVSswK21SRXFsUU9OWkcrNTFxRzVEdXkrTnBTY1Y1OEZuSTdZVGdT?=
 =?utf-8?B?SDRzQTNDUUxwWTdiSGtQcjg0SGxFNnZxWGEybnV4YWJsY0xyOXNYY3BYSXRj?=
 =?utf-8?Q?qrJtdLnnuBKwkGGxJLTUVLpO8Xpzxrrv1Bjp4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc39f202-28ea-42e7-c190-08dee2954431
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:19:45.6961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGYZ35f8IwcdNBgK/pbmLhZAc+1nEPMQnJJliYARp+exDq+Flqe8P5l3z0VfTnAdy5If/3unbzxlAgr82BbcqLf3GqSvZrW8gERkfnn42HOfq0GWTQMktbnpCF+mVNC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10509

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..16399d921e04 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0


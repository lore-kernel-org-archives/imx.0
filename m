Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21B3ACA65
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009591; cv=fail; b=ejeDHhmwAoO+woJRANekceCQWLHj/gvAe2IT2AZ/Jr4XrdcsaLwvphpGHqnZOck5OgOqT/r1QA2fW0ldMgfzUzIpWHaXThb3/fT7bN05UksYMb84dl+F3stKw6EzhSTlOqMMFTk1Gfju4MhDSxcEyfO6ihRPhdDDasPA/r3hLN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009591; c=relaxed/simple;
	bh=8PFnVA0eZO6Zvvrm6ZISjgQVlbIgensMhv+uVbo+v+o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D0gVKWcGz7Z2XPKRynNS1seFbH4QHZhtCP8ULW289cv6vlvKmbtIR2xhisfBbc+5kPrhxhKifUoY2sit7BagOHRHR2OzV5ohQCr2vqCIHSt0x2UFY6Y+qZsMiFsc0SIMEDe5T1FT80fP2hT3d81KS/tIxJ+UojMcY2VYLvnKkr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sBTMHhaw; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sBTMHhaw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROm26EKJxRVzQ5aNKCqmKdVQ6l/bv5oxJGVdevOW8SLGhRKl66Z+BtHLahyQ4QEv6NeZgaGgc4eBP+Hc7eFdjuVFJntC69dVlP/IMnwcG5a6hnVSu2gJqe6TF7wrUfFZywizfR80NiHarUT+b65d0FXAk/5N3PAvklbAIqgI1dBfVd8dK65LP8uvqDADnxIcjsOmTfcp21JHIHivZuYLqkv6NP0/E01GCFjSoZFAzfdYvEDFhNYh0yrMqydj7Fj8RC2Js76Y4j1sTSXXlOeOqWrRhLdcfY7zZZtGzrt8F3e1KVu+gZa6HHVAaKFBdkKa991jPiKA3GikbBydE2+v8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3s/0zEaIsi09bd/5xef3yxr8t03s/Yatyy4g60NmHo=;
 b=Y7Stp4r7IpP9QwQ3QMQ1LuNsSNgfSq4BE9+8i61dQu7SWloeSDc92oeK/ZTj6XsNkew8xKsItALszZ/V0Sph8f8mUQEF3l5sMhCPyMBMHchQY0F+ii3O0XVGvSe58fUgDQoi3bD7Bbx23BCgUd1YkklRn7D3xtzhYrNaGroPpP+IdBHjRuAd0OKS7sYwAoDX3thaZL2s+xt0Sxmd0LuE9vVvDos76EiMBcfKc8DESAd+JZDLCt7Hz4EtpReKMrF4wPZr/JSj/TyoYVByoisSO2/MvzpEYwmA6fTdqR/6UIudyElWwJtBbgy17Zk3LSxZkRsduY/p3tmWyfRKcDEIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3s/0zEaIsi09bd/5xef3yxr8t03s/Yatyy4g60NmHo=;
 b=sBTMHhawgfYbICT0NGCKtlM4Q91PQfmuyZe9yy55kD7mPdRuJrCu8s9QvwnDlAEIhTsSLcx21cgwmPMud8yJkMGuATrcX00XFpKAUf9aDSiMtylFLrJjehlDCc16U8azvI5UZeaANOwRG8F4//m5k5/0acBIfeZsHI4H66CxQyx7xwNOHoWcW4GPmmNGV6u18z1CoCgZs24B1sMT3n7RBoK+mze0Ge0SbX4Gx2yhHgWO6ECOqt/6OT46VXzBKqTf9qhF1WD9iA/EXR4cM9w23zzfgyqa62EWdJq/u5a+LQ9Es/O3czgSjLPomzXN0RgK04DYd4vPKlH8QV21OZvGDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11869.eurprd04.prod.outlook.com (2603:10a6:102:518::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 12:26:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:49 +0800
Subject: [PATCH v2 1/7] arm64: dts: imx94: Update pin headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-1-e6eba6b3a837@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11869:EE_
X-MS-Office365-Filtering-Correlation-Id: d6be6198-61cc-4182-851c-08de867be5e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7416014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	GDtE/DwJ7i9Bm2OPvc3lQOCauHMDSqC8OjX+K4hi5COWlkgaL0E+wNnF4/0dB5lu2e8lbHC8Qw5SFme4SJTWrjCIa14VAAo98/aNZLadieBtc8fWwUka6yCdDfH587+PjXV2bdr3/Du953jAp+yQhxXy3bdeDS59wcWHrmF7kFzwE3FGpZ+h9TzpLtZRTUujrTdzq0PjlQTE1SQm+fCJbpLjwwf7RLxmAhRKw8cuK/rFE8wfk2VNZzAy9AszrjUyH58kVks/uVREynFUgPDMx0MUxs5P+lvMBGqvur3iXC+XJ17oSA2l3XntoKZoJFbqX1/Kk9B/8vTNwlJjJS53oMCJtUI7xBvBoZcA/DkMOBqZM397WCRsfqH1tjm/XGA9qsFTx5TPcXjr4Rw0+qnYBW7tD2I6iPIqeHorlNRxd4bONycnKhTieAYSBqzt71QjHEMkmC2wVQ7Ub24VKAhg+dpU3N1FnXyp+9yswACTy7JL+5w+KGS9G37mwHvNiXqj/fXw3nj1zkPasnqOJG3d9p6963E3PbHZ5zpxuss/b1yJZf8beOhFzNOewS/LjU8FNFICyFtniIuFgUuPr16+IO8SCC2yGhKXFCCPuRXDifW2Qzc5jvuuQvgE801lMGANV0Ot/ZBkkWhO1oo4+obtGnSxTWrbrIvS6qfcyL48l63jgeEdxreq+eR2kti/2gsT4ayJZ9TqZNMkyh7rSPDlDccJ2t0VZtLnfuraQR8KeviBOW8QGm0T9i4UXI3uRgh6fD2aP8KR3PlDqhoYpB0554zbBnL+uXCPYEG2HTBr3ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JXVEJoclVxY3FDRWtReUcxWEUxKzNuaktJb1lKcEVrS0s2OUlTOE5mVEI2?=
 =?utf-8?B?K2VocW1Za3VUaVhlT2t0OHN1a1RmVzVjS3NjNXhNeFAyZmpQYzE5QWVtQnZQ?=
 =?utf-8?B?eGxSclVySEI3bVVXaEJta2Zxc2RrZUc0VlBUUHlKZXYvTXVLY3VNeXFUbnFa?=
 =?utf-8?B?RExEY3hYbTdjVWk1d2hyUU14WitCaVU4UG8zU0ZUU0dRczl4ejZsMTZWWjZU?=
 =?utf-8?B?VUtjMGVveVVVNzVBWUtGR0dGcDhQMFFKK2hNUCtIb25xdHRKMXlpSkJBU2do?=
 =?utf-8?B?Ylg3TG53cHVTbjU3MUlEbkJtUVR0LzF4MjBNb2FjRXNzcWFDU3k0bFVsL3Zx?=
 =?utf-8?B?SWpjOW5ZSHlnWWJudENkOXc0TWJBLzEwQ3hwNXVCdHZqOWdXK3BkR3ZVY1Fs?=
 =?utf-8?B?NGsxanViVUhkTmJMZGRnQnBLQjJKNFAyQ0pIMFpkeGVEdHFBNXI4Y3pDSDRy?=
 =?utf-8?B?ZGV1Q0xZMTUwZHh1dnVVWGpudUI4MVVVZzB5VkRyTk5oVUlsZmxDN014K2s4?=
 =?utf-8?B?WHg5V09VSmpsMHFIalh4VHRMWVZiZ1ZhaEY0ZGtTa25RQWxCVlBHa212Y01M?=
 =?utf-8?B?V1dYN0lXZ1hIOHU2ZFhRYkVzQnI3S2hHUnVkWGgybTZTeURqQlh6OElIMWM2?=
 =?utf-8?B?U0g5dEZtNE1Qd0xEeko2YTFXR0s5eVBhdkc1WVg3cGNWYU1HdmNnOHFBamdU?=
 =?utf-8?B?bGZobjhrcXJjeklhRG05T1V6Q1UzeTNEQms5QUIzeEdZRm02N0FEN05ydWMz?=
 =?utf-8?B?MTFSbVJWd2pMZ29DZjJkUE5Ib2VMekRoQUM3aTdRZ2VnUnN4cnR4SUY3TWh6?=
 =?utf-8?B?dzFZRGp5Nlc1Sjk0b0xheEpCc3p6MytkWnR2bFBQVXl2VWdFVEIyZURSSzhC?=
 =?utf-8?B?bWJrbDVFbE5IOEViTGNlZUx3ZHJNMkVwSGkvbHZWSmN3SkNmN2hHbVlrSGJh?=
 =?utf-8?B?NUlFOW1BSVhRVmpWVmJMeDdLczkzbHA1cmNkOFFiUVMrdVUwL0pOTlFrSllL?=
 =?utf-8?B?RFN3Mi9rY2djR1FoUHZGd0tPZDNxeUVhUEg1NlFIYjVNNzVwZytFT2ZlVXRP?=
 =?utf-8?B?RnNYbGtKa25jalRwem1CeENPMWF5TUkvdTdkUWd4VGprdGk5WGY3Tkk5WmNU?=
 =?utf-8?B?cU41VWs2UERZMHh6RWNid1ZEYm5iYzRPV01UY3FDZzYwUFFzY1pSbzM4d1d4?=
 =?utf-8?B?Wlhkck1KRjZ2NUFZeXZCaXZJMjUwZXl5Nk5LQmF3YXEwVUU0VDZESzlITXQ5?=
 =?utf-8?B?bHFISE4yVjYxTm1ObkRpV2Y4bnVYajFRSzUxdkxLTkVqcE9pSlBtVDlzaGU1?=
 =?utf-8?B?aVJNVkRpUTFqUW1rRlFGdFgrMEptU1B5UXhLNHBubFZ0dHJOYnFWdzlsbVdr?=
 =?utf-8?B?TGU1UDQ0d25aODdFdFhkS29tMXBsVjBOS05WTUFXaElsR00yTFFLMnkvcXln?=
 =?utf-8?B?TmF4S2F3a3kxU1lJUVZ6M2xtWis1bXZrOXNVOVJhN1JCeUJMOTk4NDIvUUhq?=
 =?utf-8?B?WTRkMFV4cXNXRTNNYzJFSXZ1Q3F0V1g4MFpFL09QNk8xbEg5TngxRG14c2lq?=
 =?utf-8?B?V3Y1YkEzbW9SWmgzNUM5NTVWQkE0bXViaVY1N2hvRTNJZGU2Z1ZDVEp1NzVv?=
 =?utf-8?B?aGxac0RwY3FRRk9GamJzY09BMXlDZU5hK1dMY2laYUI4UTk4MzhBbkx5K2I2?=
 =?utf-8?B?aHFLWkJESzhNOUVGY2JwMlFzMmlSKzc3Y0xWUUxpVHliRW9oU1RIc2RXaUFJ?=
 =?utf-8?B?WmkvdTVFaS9CU1ZtMlpnNFVTWGxMa0xEWFlnWWMvWnhRdER2SloxQjFrWGVU?=
 =?utf-8?B?aXRCckcrQ2VGaEFQVndkSnE5MjY2MG84RjNOc2M5YnF3emw0cVRVZW1xS1Bq?=
 =?utf-8?B?bDA3V25iVVIvUEhVUDEvQXBaMFlRcnM4L3QvVUFydHQwemEzRENTcjFlQ1VS?=
 =?utf-8?B?K2tLKzA4SG9WQnpoaXkwaTVnMmlkT3pqdWxFSDBPMk9jRzBGWmhSSWxrSUsw?=
 =?utf-8?B?NVd6WUVlc0RZcXZhTFpJR3ZFOXIwUDJoM3ZGcHpJQi92aDhUejBVbEowR1E3?=
 =?utf-8?B?b3R4MzVPa0dLN0NrYVBJNnNnYmpZSGZWYk01K2ZYV0xQVTNCZHhtK2JFYnJ2?=
 =?utf-8?B?RUtxbTUrKzdrTndtamhrYWRhdnBWUkVmL08zaTQvMTFvSUdKdUxuRDFCUW5x?=
 =?utf-8?B?MkFiRWJkUk4wQjNmVjArYkRCMGhSZ0RycGFhNEkyMWVHTiswTEkxTWlFTEdy?=
 =?utf-8?B?NDlCTUhqVGlNR0IweGtqK2N3OERzT2NNWXFsZmxyNi8zQzhLS0hpY2FZNGRM?=
 =?utf-8?B?T0xtdFQwOEpWL1VZcDE1Szh3YmRjVHRCUVo5Nmw0VFZEOVBQWVRydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6be6198-61cc-4182-851c-08de867be5e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:23.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R105tabSCFs8JugQVRhqAjc1LIyoVBRrj+zVz5d3vh667euLgUJZroNXTxXgUgaCgYzfU4av0u696QM3R2B0fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11869

From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>

Update the pin headers to include pins that has special mux options:
The MUX value field in the IOMUX table is extended to 16 bits where
the lower 8 bits represent the current IOMUX value and the upper
8 bits represent the new extended mux.

Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94-pinfunc.h b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
index 00255db89185260811c4b6b50ac3980f18e69141..2481053c3ba7b93085357df318d9655b9293be70 100644
--- a/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
@@ -233,6 +233,7 @@
 #define IMX94_PAD_GPIO_IO17__GPT_MUX_INOUT3                 0x0054 0x0358 0x0704 0x05 0x01
 #define IMX94_PAD_GPIO_IO17__FLEXPWM4_PWMB0                 0x0054 0x0358 0x06e4 0x06 0x00
 #define IMX94_PAD_GPIO_IO17__XBAR1_XBAR_INOUT31             0x0054 0x0358 0x08b4 0x07 0x00
+#define IMX94_PAD_GPIO_IO17__XSPI1_IPP_IND_INTFA_B          0x0054 0x0358 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO18__GPIO2_IO18                     0x0058 0x035c 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO18__LPI2C4_SDA                     0x0058 0x035c 0x0738 0x01 0x00
@@ -242,6 +243,7 @@
 #define IMX94_PAD_GPIO_IO18__GPT_MUX_INOUT6                 0x0058 0x035c 0x0710 0x05 0x01
 #define IMX94_PAD_GPIO_IO18__FLEXPWM4_PWMA1                 0x0058 0x035c 0x06d8 0x06 0x00
 #define IMX94_PAD_GPIO_IO18__XBAR1_XBAR_INOUT32             0x0058 0x035c 0x08b8 0x07 0x00
+#define IMX94_PAD_GPIO_IO18__USB1_OTG_OC                    0x0058 0x035c 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO19__GPIO2_IO19                     0x005c 0x0360 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO19__LPI2C4_SCL                     0x005c 0x0360 0x0734 0x01 0x00
@@ -251,6 +253,7 @@
 #define IMX94_PAD_GPIO_IO19__GPT_MUX_INOUT9                 0x005c 0x0360 0x071c 0x05 0x01
 #define IMX94_PAD_GPIO_IO19__FLEXPWM4_PWMB1                 0x005c 0x0360 0x06e8 0x06 0x00
 #define IMX94_PAD_GPIO_IO19__XBAR1_XBAR_INOUT33             0x005c 0x0360 0x08bc 0x07 0x00
+#define IMX94_PAD_GPIO_IO19__USB2_OTG_OC                    0x005c 0x0360 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO20__GPIO2_IO20                     0x0060 0x0364 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B                 0x0060 0x0364 0x0000 0x01 0x00
@@ -413,6 +416,7 @@
 #define IMX94_PAD_GPIO_IO37__FLEXPWM3_PWMB2                 0x00a4 0x03a8 0x06c0 0x05 0x00
 #define IMX94_PAD_GPIO_IO37__FLEXPWM2_PWMX1                 0x00a4 0x03a8 0x06a4 0x06 0x00
 #define IMX94_PAD_GPIO_IO37__XBAR1_XBAR_INOUT13             0x00a4 0x03a8 0x0890 0x07 0x00
+#define IMX94_PAD_GPIO_IO37__XSPI1_IPP_IND_INTFA_B          0x00a4 0x03a8 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO38__GPIO3_IO6                      0x00a8 0x03ac 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO38__NETC_1588MUX_INOUT0            0x00a8 0x03ac 0x064c 0x01 0x00
@@ -574,6 +578,7 @@
 #define IMX94_PAD_GPIO_IO55__TPM4_CH3                       0x00ec 0x03f0 0x083c 0x05 0x01
 #define IMX94_PAD_GPIO_IO55__SINC3_EMBIT0                   0x00ec 0x03f0 0x0000 0x06 0x00
 #define IMX94_PAD_GPIO_IO55__XBAR1_XBAR_INOUT19             0x00ec 0x03f0 0x08a8 0x07 0x00
+#define IMX94_PAD_GPIO_IO55__XSPI1_IPP_IND_INTFA_B          0x00ec 0x03f0 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO56__GPIO3_IO24                     0x00f0 0x03f4 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO56__NETC_1588MUX_INOUT6            0x00f0 0x03f4 0x0664 0x01 0x00
@@ -592,6 +597,8 @@
 #define IMX94_PAD_GPIO_IO57__TPM6_CH3                       0x00f4 0x03f8 0x084c 0x05 0x01
 #define IMX94_PAD_GPIO_IO57__SINC3_EMBIT1                   0x00f4 0x03f8 0x0000 0x06 0x00
 #define IMX94_PAD_GPIO_IO57__ENET_REF_CLK_ROOT              0x00f4 0x03f8 0x0000 0x07 0x00
+#define IMX94_PAD_GPIO_IO57__XBAR1_XBAR_INOUT21             0x00f4 0x03f8 0x0000 0x0100 0x00
+#define IMX94_PAD_GPIO_IO57__SAI3_RX_SYNC                   0x00f4 0x03f8 0x0000 0x0200 0x00
 
 #define IMX94_PAD_CCM_CLKO1__CLKO_1                         0x00f8 0x03fc 0x0000 0x00 0x00
 #define IMX94_PAD_CCM_CLKO1__NETC_1588MUX_INOUT8            0x00f8 0x03fc 0x066c 0x01 0x00
@@ -619,6 +626,7 @@
 #define IMX94_PAD_CCM_CLKO3__GPIO4_IO2                      0x0100 0x0404 0x0000 0x05 0x00
 #define IMX94_PAD_CCM_CLKO3__SINC3_EMCLK3                   0x0100 0x0404 0x0000 0x06 0x00
 #define IMX94_PAD_CCM_CLKO3__ENET_REF_CLK_ROOT              0x0100 0x0404 0x0000 0x07 0x00
+#define IMX94_PAD_CCM_CLKO3__XBAR1_XBAR_INOUT24             0x0100 0x0404 0x0000 0x0105 0x00
 
 #define IMX94_PAD_CCM_CLKO4__CLKO_4                         0x0104 0x0408 0x0000 0x00 0x00
 #define IMX94_PAD_CCM_CLKO4__NETC_1588MUX_INOUT11           0x0104 0x0408 0x0000 0x01 0x00
@@ -872,6 +880,7 @@
 #define IMX94_PAD_ETH4_MDIO_GPIO2__GPIO6_IO29               0x017c 0x0480 0x0000 0x05 0x00
 #define IMX94_PAD_ETH4_MDIO_GPIO2__FLEXPWM4_PWMX1           0x017c 0x0480 0x06f8 0x06 0x02
 #define IMX94_PAD_ETH4_MDIO_GPIO2__SINC_FILTER_GLUE4_BREAK  0x017c 0x0480 0x0000 0x07 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2_XSPI2_IPP_IND_INTFA_B     0x017c 0x0480 0x0000 0x0105 0x00
 
 #define IMX94_PAD_ETH4_TX_CLK__NETC_PINMUX_ETH4_TX_CLK      0x0180 0x0484 0x0648 0x00 0x00
 #define IMX94_PAD_ETH4_TX_CLK__USDHC3_CLK                   0x0180 0x0484 0x0000 0x01 0x00
@@ -917,6 +926,7 @@
 #define IMX94_PAD_ETH4_TXD2__GPIO7_IO2                      0x0190 0x0494 0x0000 0x05 0x00
 #define IMX94_PAD_ETH4_TXD2__FLEXPWM4_PWMA2                 0x0190 0x0494 0x06dc 0x06 0x01
 #define IMX94_PAD_ETH4_TXD2__ETH4_RMII_REF50_CLK            0x0190 0x0494 0x0000 0x07 0x00
+#define IMX94_PAD_ETH4_TXD2__XBAR1_XBAR_INOUT34             0x0190 0x0494 0x0000 0x0105 0x00
 
 #define IMX94_PAD_ETH4_TXD3__NETC_PINMUX_ETH4_TXD3          0x0194 0x0498 0x0000 0x00 0x00
 #define IMX94_PAD_ETH4_TXD3__USDHC3_DATA3                   0x0194 0x0498 0x0868 0x01 0x01
@@ -965,6 +975,7 @@
 #define IMX94_PAD_ETH4_RX_CTL__GPIO7_IO8                    0x01a8 0x04ac 0x0000 0x05 0x00
 #define IMX94_PAD_ETH4_RX_CTL__DIG_ENCODER2_DATA_OUT        0x01a8 0x04ac 0x0000 0x06 0x00
 #define IMX94_PAD_ETH4_RX_CTL__XBAR1_XBAR_INOUT6            0x01a8 0x04ac 0x0874 0x07 0x01
+#define IMX94_PAD_ETH4_RX_CTL__XSPI2_IPP_IND_INTFA_B        0x01a8 0x04ac 0x0000  0x0105 0x00
 
 #define IMX94_PAD_ETH4_RX_CLK__NETC_PINMUX_ETH4_RX_CLK      0x01ac 0x04b0 0x0630 0x00 0x00
 #define IMX94_PAD_ETH4_RX_CLK__XSPI2_A_DQS                  0x01ac 0x04b0 0x0000 0x02 0x00
@@ -1344,6 +1355,7 @@
 #define IMX94_PAD_XSPI1_SS1_B__GPIO7_IO27                   0x028c 0x0590 0x0000 0x05 0x00
 #define IMX94_PAD_XSPI1_SS1_B__SINC1_MOD_CLK0               0x028c 0x0590 0x0000 0x06 0x00
 #define IMX94_PAD_XSPI1_SS1_B__SINC_FILTER_GLUE1_BREAK      0x028c 0x0590 0x0000 0x07 0x00
+#define IMX94_PAD_XSPI1_SS1_B__XSPI1_IPP_IND_INTFA_B        0x028c 0x0590 0x0000 0x0105 0x00
 
 #define IMX94_PAD_SD2_CD_B__USDHC2_CD_B                     0x0290 0x0594 0x0000 0x00 0x00
 #define IMX94_PAD_SD2_CD_B__NETC_PINMUX_ETH4_RX_CTL         0x0290 0x0594 0x0634 0x01 0x01

-- 
2.37.1


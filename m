Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E13E0235
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541333; cv=fail; b=mksvWodI7jTvNCP/sM6XODM82LtjSD+SCWB+e/7FKJsizo+UiMH6EQkAuLWWnQpx8+OwZfqGxvGwDtXzsi4/Ynyy7BgKz8hVRVbspVhAYQfts54Pfox+NnzkvWmuInin3V97PM6x+BYIjZYKWbABsymTKb/mB9bOY0zTsVwYDqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541333; c=relaxed/simple;
	bh=Yx2CzDh5orJaqt7A8WKAngYzhASA3ZcNPZlAJPM+Ppw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ppXCdb0MRpi+bIbqP4EyiveAcE3c99Qb6h3a+V2ydQRGTjaX6+MxDIvod6bFFxFSxhH2qg5v5VHpH2UWPAHaiewTHmub1P9JUS1gKeiczlJ92oyd0WtnArI6fdF+Avh3V4GJYZpTYsTIBWjGUTMkuHVQS0N7Ez8gM6F6sa7/Y7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bExxkvgd; arc=fail smtp.client-ip=52.101.83.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bExxkvgd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTqAwZNaeumd/iIYVp3qSVbfj6VLhzskMhjubrf4eFzUARj9lpjtqjIpv9wO9NlsyB3/casSf7LMFT55NXt6rHGwTwkhFipcGg/KVmEjlzJvzezBGXaifpzgjXb2Zvmuaus2kKdaqkzlkRyt6Im93SbAMyIKZ8TKzLyaiQLX9dbGCT9gyi4LKWLj99sDoM+ZEsH8wZSjARC+/xxsc0mJm14O9s/DneFZ84l3q5WfPS3uInZMX6myMKgoSyV3eY5+zmIV4qceXieZmBM0YvqvTNf1qqW9aU35LropqbsG4pWBWSm0wKJk4HJRWIFAt+eI6YhhMXebUCVZX+T/o6enMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX+65r0SX3ma5RvBmjgu1uAAX+4kAyBMTl+rtNGHe1U=;
 b=lcfrx+fqXS52C5KVoPhLWZobVsxEuxvKIlUMWdq3Oo4CwW0isiKSQkTfVLH7DUP5n3qUH9SRyNXo/L+/SEH3ESGlg1vGVWtAcTg0yEMazNa9j4Lw6BAbQVHB04HUFNInqSqItLVP6sP8aPxPGrNU/+2TWT7+HcPROCoY/SxNeFx4zw0XzEw22R9hCo0C56L8WITsFMTif/KktA427/neSlD7G85T+HneF1OH2xcnukXZKN7T4v0HhXOGP+uLfjcKStOO6ZhOIiQ6F+GC8h1TQCRrHr+oKNxRYFv0m0D/UBkoGs9/smSBz72O8VvEpO+2p7h8ylOMpfMU7Bo8u7gK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX+65r0SX3ma5RvBmjgu1uAAX+4kAyBMTl+rtNGHe1U=;
 b=bExxkvgdrMgdmdnZbzi+UI4mfHOgD2pGm3OR9wVWKi8TQpPpHb1D0AGReXCZFpAkdq921PDA/m7Y/Aii8X47XY5eOT015zb9CrB9swPaNYMFrb/vD54PvRvIzHyz8fdR29YOxeM+RiPRMlioXqgQlEZt0VO7vxsrSHd4Uq0yvs7jvr2wzMVcMh/47Vg/1xegupuj0hUdZ+zOiwSOyw8X9D2p+4pORvS54fqnp4+6JOM8Q68vmtIWZ7XBF/rJkQNmz8U8EmfIaFcqqVNJy2JbUoEvsYcSjiFn8UVDg7Ia1nNjfgj+BNz/xO9kewy7Gs9a+XqWB4i2+P0GEQJHC6u2nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:08:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:08:44 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:08:30 -0400
Subject: [PATCH 1/4] ARM: dts: imx6dl-plym2m: change #io-channel-cells to 1
 of voltage divider
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-arm_dts_mini-v1-1-11b88825fd1c@nxp.com>
References: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
In-Reply-To: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783541314; l=1105;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WmzvzuoICbpt+Imhrj9yyabAVEIH6G8AzqdS4Xh1YMA=;
 b=3v95CGwl9fxaR9TQrZxR0UiIbV0wXTOOhgiZDDP/DOTq2FWV60S2vv1uLGnRYRmtSnnS5if6L
 cnkHxO7oRVsD8gVlJ6qbEL5FucsF7Jnc+MD6vyRUvPLHW64s+aWLXrQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:510:e::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6c16de-d2f4-48f0-4bec-08dedd2cb634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	pCu9C9OygPF8Y48w84/D9UxGyZ9u3jki1N1KPqlOnMCoAbqS82l02e9gF4kFGVPBNu34p4IaaH0knoijsrhMJLLZdLi96mNYlV2UXPj4Cpxt+YPAFqbFBloRE3ZUP4nHHPlnVU4L3YyTXi826ghRlNe3IMNThmBdG3BuTZFzZgRuQLPdNpOdximM8hMWFXv3Rv2MVMvCCaVF7UuDFGS5lB4+mp6Vx/44/47e59gaNTbXO7C1aIM7B/waTfCrgEsmb1SJb/hdug+mpPeyNaTLmiFvhakLIgUIkF0y7+JJgAQwgDLHstFR//3NoaVyUHyn9LgYCnFX/vpsHwoJZaHvjHXGNL8iwK4g4O0PZXeqZx5HLWrSuE9XURgUIaYSiHOlkUmiefCFloDiPWuwpW5ibHTuMhJuwv5iq6TDF7Fpt1WO/FTV+/wLNhFWuZrbVZcXQHUjRooJiBCetINvbxWUcX5dINw0LI39nf71pmKX+RJSvqZ9dJ7oMm3svl1hWcZi/QSvWrXRkmtl96SgFhSyuud4zj00lhBVZ5UE67ZG+NlqU/Wn+JDmZwD9SYtF6/aEWLq58prQC7yHboc5aZdnPxL1TB+TOTclrDV2Qy/9t/U/ejXV3YMSbWJeTlDQ2o0OH2fphMd1GyT2YILOSYQP7CfZ8UDrf85GOM0ubBxIUS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWlUc2p6d3dGME9rM05uWTVaUnZ2aDNQUXJFL2tzT2tGZ2RFRWJlR0FsdUd5?=
 =?utf-8?B?MzZ1WnMvU2FIWXNtZkxZaS9lL2VwY2YwcnZIc2dxSXFzSmZ4OWNyQkxSZ2tG?=
 =?utf-8?B?TDFhWXJjTXFzd0U0SHRvNFpyZXRJd3dVSm5seGdGdjl2azU1ZmlzNWpuSE5C?=
 =?utf-8?B?U2dCVUtWbGVhTStrRVM3Y3MzL3BiTE93bmpsWGNLYy95VFY5RkxRTCtiZVo5?=
 =?utf-8?B?ZllocllRVHErczAweC9FMDlxMDAyWkJLU3hPcU5la3krUUh5U1B4N1BVNG5l?=
 =?utf-8?B?dTQ3WnNCRVNTek9RQlpjeEFkOWhDUWxmRGtSaDdZVjJGWHFQbi82NXdteWFW?=
 =?utf-8?B?ZVlEWEZ4MWM3UU41SUxHUm9ib3NRMldMb0tMRlpzR1JXOEcvM0IzNHRlYVZH?=
 =?utf-8?B?RFhISmcwZlh0ZW4vanE3QlBSUUxkYTRLRVZnMi82bTZMVkFyYUw4enJSaXF5?=
 =?utf-8?B?NjVSZDZNOVk2VjJiV2hWbjF3eXVBZktpRG5Vb1doY0JXbFdLZU42eDhGNjFD?=
 =?utf-8?B?TDFjbmNkY1NyWTJ2b29RNlc5NDNoSDZiZjZXMmtSV1E2empEekdmY2I1cFV5?=
 =?utf-8?B?VkFnZ3Y4WTA5b1ozT3ZxandseE9NQldJNWcydVVxWktRMzM3bFQ5R3YzejN1?=
 =?utf-8?B?eHdZM0c2KzJFZzUrR2gyS1R0NlNvNWdjZFdvdmJKWExPeG5RZ0xzeVZ5YU1P?=
 =?utf-8?B?SzRQOWpDb1NCV0xMb29teE1ERWllQ1g5SkdndURSaW5OOGV1a2RuQkkzQ0cz?=
 =?utf-8?B?b3EzSlVQbVVxTC9ZejhPdFJFYXlOc0xGWFpmb1lBZXdqdjlaOEt1Ly9tNkxs?=
 =?utf-8?B?ejFzM2ZGeUlWS2U3dEpjQm9VZFY3UW9FM0E2enpzVG1JaTAzbjIrYTZaYVFE?=
 =?utf-8?B?U0F6QmE0MVFFNVNPU1pPUjV5clFWMzlOTzN1bDlndEc5UkdPejk0cnhRQWgx?=
 =?utf-8?B?NnpBbXFQcURUOWxJMzZPV1dTTmZZMGxPMGlWT3hJb2FsM2RaV1ZEYXVmSDk3?=
 =?utf-8?B?YW9mTHJ3MUdKYzJ3VWZYTWlCcGNkRHI5R1RXMGJkTms4NE9DNlZwTU10aTBv?=
 =?utf-8?B?TzdoWnF3TTkzclFoa3FBNytQNk9ZOWlubWpHaE5FRDZzRWFORGpQUytmV1A0?=
 =?utf-8?B?RnV2Y2JqWGJGelJ2a0l1QU41YXBzR2NBbVh4K24xTGEwTGt4Z0lwdFZERTA2?=
 =?utf-8?B?YVBUVVplempINDBPUUt2Rmd4U1Uya1Z4VXJZVW5yUHJaRHFPMnNHNmV6SzhW?=
 =?utf-8?B?blFQS2FkcVM1YkNMYnZhYkdyNU9BdmxuVnpHVllZUTJOcU1NREgwZzBjNS9K?=
 =?utf-8?B?U2M4R3JLWjBORHo0N2RCZS9lcWM4cCtYSzVBRUdDSGpHejh2QnRaKzZXelFH?=
 =?utf-8?B?N3cyV29sVGs5b09NWFBwNHpBVTNpdXNxdURrUGhhQ1g1dUJBVjJNMFlTcTBN?=
 =?utf-8?B?eVJDSDJUaVFWVFcrQTFaR25ReDJXaVdlamU2WW43bnRNUUxzbWZGa3hlMjd3?=
 =?utf-8?B?WGRyZm9VOGVTZ1dlSDdRT1BFTlMyVHBGSzRmaHd6WTU5dEVzUkJxdDQ2U2JQ?=
 =?utf-8?B?bzVnc29Vb1Y2UzJqMWxkaDZLMzhrdDhtcTFEbE02aDFJTmpyeFMzUHYxWlZU?=
 =?utf-8?B?ejZqeC9oQzdIWlByZmJPMW9WVEt1ZmticURDckpUS2VTRDJIS3pwdzBzOW5O?=
 =?utf-8?B?aExidVNDMFduZU4vZncwRTd5eXh2aUJSRmRKeUp2SExzQ3RzRjlLMWkyWHds?=
 =?utf-8?B?S3lGU1V4N0dXNEVaeDE3TVhBS0F1SmNtblE0R0ZSZ3dpOXRmTEcwQTBhUGNS?=
 =?utf-8?B?YmVnaUlPVjhzZnh5OHp1VjVUaGh4TmVVUlpURmR2QUNLTEJIU0FLNi9zaUFP?=
 =?utf-8?B?S0VjYnR3MHRLUkRQbmoxN3QwdHpDbUY1YnpwMzNjTGVEUTVEenZGbTZsL0xr?=
 =?utf-8?B?dmpmK3pEZjhHK1FpNzdaOGdxa0FsQWxkeVo0V0lCZCtLeGg3SjJrVjlXRXVN?=
 =?utf-8?B?YTg2d3hEa2thR0FXNEtRaVZIQ25VZGZDUjFQbldNQ3hSbE5tZkYydkxkYXZL?=
 =?utf-8?B?Mi9za3JIdjByN1RwcE5oTjVyWEJGY0wrcUw4S241Rlp6RCsrakZJb3hDaWdh?=
 =?utf-8?B?L3JCVjh6elZtQzVJMlZpNDg4SHNON2tRVEs5aXEza09FVVJ4SlRMT1Zlc3g4?=
 =?utf-8?B?RUdFMTVkbUV3a0p3K3k0R0l3cEt0MHEvZVdjTWxhcWJqYktHK3lrODBKSkdH?=
 =?utf-8?B?K2VCWlNJeEQ2K0xCRjBudzRkN3p6MmgrZ3NrT0E2L3ZjL3Z0enMwbzUzdkFK?=
 =?utf-8?B?QVJTc0ZMY2lsOFozdWNuOTdvNU5xdkpqSm9meFBjYVZwbWlmcnZaYXlaOGg2?=
 =?utf-8?Q?Vmescbrrx1brW/y6+CDg0gRVPVITCXJ7ltxaz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c16de-d2f4-48f0-4bec-08dedd2cb634
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:08:44.2474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoYpPyrLDFBDPikqgtEnGxbMRrN+uLEK3tY4wANNVbj6IgMS/94EexIzReRWp48h18M9dg1rfr0qmCQEXI6GnOWEmStZed9zbFVqkQTVzZH+GoZd4v+P5Ufyl6chB1Xl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571

From: Frank Li <Frank.Li@nxp.com>

Change #io-channel-cells to 1 of voltage divider to fix below CHENCK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: voltage-divider-vaccu (voltage-divider): #io-channel-cells: 1 was expected
        from schema $id: http://devicetree.org/schemas/iio/afe/voltage-divider.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
index fbff77944ce32..635c5a1e1fc7c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
@@ -52,7 +52,7 @@ display_out: endpoint {
 
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&vdiv_vaccu>;
+		io-channels = <&vdiv_vaccu 0>;
 	};
 
 	leds {
@@ -187,7 +187,7 @@ vdiv_vaccu: voltage-divider-vaccu {
 		io-channels = <&adc_ts 2>;
 		output-ohms = <2500>;
 		full-ohms = <64000>;
-		#io-channel-cells = <0>;
+		#io-channel-cells = <1>;
 	};
 };
 

-- 
2.43.0


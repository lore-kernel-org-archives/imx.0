Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361BD480DC5
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374769; cv=fail; b=FGpZnOgd6Xf2BOR4uagQqkuRCcTQLl8lkef4e+j91NGCCjbbczNhK/P53kpwCF6JcgSDZDJ9PnEas0UELbkANEzvUE4jXnC+mdH5mpVS/ljtQSLLW4r5sV534bKSxgF4FlZ5yyf+THjAW9GI0vTBMCbD+egSd3mXzzxuiulQ6gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374769; c=relaxed/simple;
	bh=bKwZthJGa2H1kWSnMghKtjLeTJixBO3+nBO8I4ULh0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G4VhgH07g3TjArobxaS6ANR5wWsLimhjDehEPEglkVHdBnt9mg5NYYMAGImirrcrGh94IOz8E8tDfIskqXzM4gwGoUUW68nYWpgilwKXyclpqQXCOBBwp51ny1DertJD+1DqGr+Yv4YEQqOhB/QTgZQN2ROMRgl2fXzYDr3qEh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DH0b4Vzx; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DH0b4Vzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkZp4KMinCqeiEEdFcTFibbapNBOk7ucSyNP2M9cYOwnwqwrB3VhEuBWMaXybt8dWH8njXL1wi9xBJ50W7huCOPgr6+XqB+hYLAnDZi0kr04pplbduNeVEinaKd4s4M8ZiQGtXF5KTY9HRqh7L4md2/L1N7Hv9Bru7baym6RBwK+LDpwUoSMidhvqXkoIcOcEQWth1P/d0QKUnJNGanta5G07STxVcG1+dehRXRnelz2qUlEpPn1Sv5wX6iNG6/tJ8J7vDWsjPlQF+6tzhINAbaEcOHLjUyoQJEDr6aHBHgbENV3kXd9hRcJOfUI70EYIMC3hp7SpaTApx2pNkitEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnWEdsuXZ7mY6j431q4ge5NHXTA7MBb9jnDrUBTHIws=;
 b=jicmrmZehFMvVjGYx7L3t8m3Iuz9yXuEEJr7kVWkejqqPXt/o2vcCRnxf82YPtdA+9fG2xYFwbnguoR1IGX9EpvdN1mZBXnwsxliZr2s9b1hMJqdYS+ZgncgSiYdHWSlI7sm+RZ/vsdSzh3E/znHY67vILIRLS8m20tlK0n84jvdaZgFjqEkwlX4bHiYIXTqt+W/Cw6cOVS9DOD3TNWB0LEpjSzXjVH3s0d1k9XN47/ThqtajrJm5mhL43QrGBz9/oAHEI3aqPJIeEbfIM2tLdbPjOqG3bGaepLSsNJAWRWjlyVPdl2pAJnM3JekgHA0Om1GHkL3Efs2ur6eMzhJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnWEdsuXZ7mY6j431q4ge5NHXTA7MBb9jnDrUBTHIws=;
 b=DH0b4Vzxc2QTqGOC/ma3yW4Y54qjIaNkA9iUWvpJPR1eGRJiEt9ZfY+73KcMc/58MhKrt0fqwXhuHy+Sd9vULFyBfL3il/S1iC6Vy/IEAngXTD8PmhJYO/bVQDr6Eu8sZuqU10UEYJ/sqRoaV8mDN3udDYpQc+kiT+YwICsHk2fsggazlfGNJYPXWXWVNVjnnf8bJtTbv3YRGySLCoRJZqJ190CYEKZFm4IST3PorrYdisyucKuPyLKALhw0bNl5U4G0WdgmiIn4ZBbR6uaUR0LgeuuHLUpAouqcEBEL3ruaM8oIOSMgVha2bEkL3Sg5af44LOwdtvZMkJwthoWvXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU6PR04MB11230.eurprd04.prod.outlook.com (2603:10a6:10:5c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 21:52:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 21:52:39 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 06 Jul 2026 17:52:11 -0400
Subject: [PATCH 4/4] arm64: dts: imx8-ss-audio: Fix LPCG clock indices for
 ASRC0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qm_dts-v1-4-14117a48fbdb@nxp.com>
References: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
In-Reply-To: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374735; l=1510;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gRD+nXnhUSRHD+uwc0bCPri2tRrm1Qm9MlhSFFQ/mRY=;
 b=9s9Iff+ZlMNlg8YP0FzI9p7bVrVIIkvySFUOLhq6mbhT4ZPLO3ECMFysLvLV7JhUQLK7DChgs
 iLlsxJ5BPKJCpq227YW8RJr/iUtESbhACoLIKGZYfENdVhJyoFIN08q
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:806:121::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU6PR04MB11230:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecbd1c3-1570-4b58-2958-08dedba8e5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Aj/XzvARyoYJ3NBU57LxDZxLQIdQQZiA8Qon8BaJi15ug2F+T7J7MFeOkQ/GTME0IuJiGHJKZ2cxMV6az/BpAKwGJMihdArFGvnel4bHqvZmifXW5iJbig+cj8PSlrmU0Bwzx2xJ+1gRQIe2ldp6ndaFIx2q3M+kMlXdIBIl15FxoUQRFyW0ePDSSFToRkdq6HOQE1/FHbaaQQWr8jgUqqRpCm2IIn0PBPEiSTJfs1HVWPhvlapwsdM05MttpEOLtAvRCioY6LVjSNCITdC4mYQ2SSHHGZ7mpQPuy+VfLZ+cnKHae8aEYAySxxneW0vjTvU6rhxSjgHd0+pwyBP0d2p/GLl5AfBsxDG2NCESoPxaswwt6cJ2Grf6fEzwKnzt+n4zhsxchcYKxOKnWhqekDT6T026UAca6j0ey+HSE4ysd8breTwRVRmCNVVvQbJZdgUC4zFDzslg9u6sMIsWWpeU82z5Hd2mw9oC+l+xsBFnxEUVuhAJiXRV38auwiP9/XBX64/qAErapZkjjw2plp7Bh9GXXux/0cEou7cRmUXL/Phl91jszYb3f0cR0QWDOAn6MK3Vkz3KdTXuncZOLBMIwQmjtm6sds3L9CcZ1qy3aQy8CmkiDtan2dy6ZnEyu5IV19iCpERgsziDuiLEh8qoJP7cJ+Wgp2hLBift99s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkprQWcyUldFczVwa29LZzlHaUFEaTRydUI2VUZsVjRxT2YwMkZEcHRhMktj?=
 =?utf-8?B?ZVhoMHZqNEtFWFlGdXE4eXhNNTVXM0VEYUZyNFRQNGVBa3ZOTDVmYjZqRlhs?=
 =?utf-8?B?SE1lbU1MZ1l2aGlsUHlmZUZHbEVGa0d4UzFNTkNQM0NmMFN3b2lBS2hGc3NF?=
 =?utf-8?B?MTRtWkJPc1JPME9yTXhQU3VqWGV0OFhsa0FMN0syMTlldkxpWFhDeWY4V0hZ?=
 =?utf-8?B?SkMrSVRldlM3c0tqM1haNFE2M0F5NWd2ampLdkNLb1ExRlV3aUtQRnRZQ242?=
 =?utf-8?B?eHJsemg2cmdoVUo3NXdoTmhreUlyanNSZWhOUzZ1NXVtaDVwRUpjYmZwTTRI?=
 =?utf-8?B?V2p1SDdFU0Y4elpsdUE1WVQyL3VtVXduNGFvMDdJbzJiSXowY2gzMjczbkY2?=
 =?utf-8?B?Wm0waFYrNlMyZFRFL0MxQzE1NHNPODNBOHZBLzhLWkQzRTBISFVNSUsvVHhr?=
 =?utf-8?B?ZFE0K3ZUNEZ3YVJwTUVMZlhLN0hFWGNad3VOamlwTHJ3ZHBqekF6Rm84cHJy?=
 =?utf-8?B?SXBZTXlyRXhJbzBjYWlXS1k4NDBlQnE2LzdNM2FLek5FUFhITVdYcjlqcmdi?=
 =?utf-8?B?S3VHcjR2akE4NW5YZWg1UUZLemZuVWFqbzdkaEZpb1JMVjU0VDh3MHBVWmd3?=
 =?utf-8?B?V3FYaUVUVUJZMTZsaE5zSFdINFdqNlVsVGpZTDEvRlVJZS9ta2dSVHVwTno3?=
 =?utf-8?B?Y3VlL3M2eERUMkZFL0xOTGI0VHM0R3lEK25JdEJKWk8yZmUySDhlQkFmblkw?=
 =?utf-8?B?M2k5Q21LZzMvWmJySDJIMktlWlJCTzNScDA4QitlTWl1Ri9xaWIzRzQyM1NG?=
 =?utf-8?B?SXZ1cTRzNHhwQkNCZHZoY2N6OUlMZWNhSFptZzBWYmFLZmxGaW9JdFlQWndp?=
 =?utf-8?B?OTBKSStUcTRQZG9rWlhLbkxuWGVLU1MzRzBob0JXRmFTNkJFYzVKYTY0ZVQr?=
 =?utf-8?B?N3EwdWp6QlZmdFgzQkpKYUEranozeWNESE8vaUsxeVBjVm01WU8vTzZqZ0JZ?=
 =?utf-8?B?dkhhTDhaNHB1cnRacTdjZDJ3SUNLRXlQenVabFJDYlhuTXFXZWpwQk1rR3Rv?=
 =?utf-8?B?cHBOUzVMYWI1SElpR1UwRzJNdXNYMlV3cUNtWDZvRFFRVCs5dEpCalIwVjBr?=
 =?utf-8?B?c3d5N3NCbEZEUzk3SDFRcmNnNmtremdIRTdLcmdhRTBSWnpZREJ3WGhFNng0?=
 =?utf-8?B?L0lxM2JMUUd2cVhwVHBEQ3NTaUU2dnpSbGppOU1PRGJwaC9wdTF2MVJSY21l?=
 =?utf-8?B?blg4UTY0cjgrRzVXOFNGcWtoVERFT2d4V2hxaFJLN1N6UDFLcXdzTnhBWStQ?=
 =?utf-8?B?N0wvVGp4Yld6djRFRnJ0QlpzWUpwWWtQdFc0ZTVKbDJuTnVNaTFNMG9PV1hX?=
 =?utf-8?B?L0FVWW4xL0wrNUdEMlplQWg3bHhVSHV2N2tCSUdxTlg2VmRTSXlHdFRLai83?=
 =?utf-8?B?ZmVXc1hzWnZSd3JFdXlwOEplVTI5bnZ2ekZpVWxXUjdrZDVZOUFDOHFvajFI?=
 =?utf-8?B?Q2JvcnAyUkN5K1piM0Zzd1o0UmpkQ2dOczdRdmxsVWtqM3hnNGVxakdhSERE?=
 =?utf-8?B?aDZwMHNHbTQ5N0hMamRTd3QyMmllNmVLOW96MEZTYVU4K2VBWlRwbjJUb3lv?=
 =?utf-8?B?T1Fha1YxMVBJVVd0Tmo5aVhUbjFVZjJ0bENnS2RGVmtiOFlvUE1lTHYvN01W?=
 =?utf-8?B?dFVZcnN1ZFQ5ZHV4NXptZ093ZEhtWFNRZ2NtVTRCMDFsUi9VTFNWM2pIQ1Fl?=
 =?utf-8?B?T3BYZnRPTHZoMTlWZFBuTUhjV0gyUmdQZGg1VjJGaGsxSnF0blBVcVJhQnhl?=
 =?utf-8?B?ZG9ZSjI3dkU5UWlaS1RiY1ZHNm05czZ4dXNGTmFtVEtmM2JPWWV0QkZRR1ZS?=
 =?utf-8?B?TUNXZDR4QWVNNEJwQU9NRmR6MGZMM05tcUZyTGxZRitQd0c0cjNkdzY4TnpY?=
 =?utf-8?B?QnlXcldCQlV0TXNCVElNZGRQclFwQUFoazNCL3YrSXFtTWlra09aREtndG1m?=
 =?utf-8?B?TEpkbzMvWW9KYnF0OERnU2d5TzNBb3EvZ29ES05hMEErWUZKUEZjMTBNL0VW?=
 =?utf-8?B?aXlQc05iSHoxV29qRENYYTdLT2Q3SkI2MHBzekFkbEFOd0RXWEpheGZqanpO?=
 =?utf-8?B?WTlPVUp0U3MxbDdJS0NyVWUwSHp1SkErWTVKQ3I5R1FBR3JSV0ZQdHRmTm1o?=
 =?utf-8?B?cFMwaTRJYjY1bnJtOTJlRkpHWVpDMDVhT1lpQW9xZ1FRakNKcDJjcnY1UGcr?=
 =?utf-8?B?bFRMQ01xU0tpSlE3TFB3b3J5dUdwdkdjTGsvRktvSzAyeGozT21OVUlvNTRa?=
 =?utf-8?B?Sm9kTk5nQUxBRWNhOHRmMlI3VXJUNm1Cdlg1Q0VOeE5MenZOVG1kcXR3eDZX?=
 =?utf-8?Q?j8bThm6za14dqtUeT9TfP0dNQSQOWS2o5QjJk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecbd1c3-1570-4b58-2958-08dedba8e5d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:52:39.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pz9lftJCM/njivKY5oXnkfRwZuvrZK4ceyID4YojarGW6eOXuzHdf8kbHWHNlmiY/DFojUj8I2AJCp59jppjvPvqm8qPPcIS/hC3LO5lB6bjxzAlb7zK6aUWKYEVOvPB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11230

From: Frank Li <Frank.Li@nxp.com>

The LPCG clock indices for ASRC0 and AUD_PLL_DIV0 are swapped. The ASRC0
LPCG provides only IMX_LPCG_CLK_4, so update the ASRC0 clock consumer to
use IMX_LPCG_CLK_4 instead of the non-existent IMX_LPCG_CLK_0.

Likewise, the AUD_PLL_DIV0 LPCG provides only IMX_LPCG_CLK_0, so update its
clock consumer to use IMX_LPCG_CLK_0 instead of the non-existent
IMX_LPCG_CLK_4.

Fixes: 5125617c7a4d3 ("arm64: dts: imx8qxp: add asrc[0,1], esai0, spdif0 and sai[4,5]")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
index 5e4233ccfde46..f473d81f67ffa 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
@@ -124,10 +124,10 @@ asrc0: asrc@59000000 {
 		compatible = "fsl,imx8qm-asrc";
 		reg = <0x59000000 0x10000>;
 		interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&asrc0_lpcg IMX_LPCG_CLK_0>,
-			 <&asrc0_lpcg IMX_LPCG_CLK_0>,
-			 <&aud_pll_div0_lpcg IMX_LPCG_CLK_4>,
-			 <&aud_pll_div1_lpcg IMX_LPCG_CLK_4>,
+		clocks = <&asrc0_lpcg IMX_LPCG_CLK_4>,
+			 <&asrc0_lpcg IMX_LPCG_CLK_4>,
+			 <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>,
+			 <&aud_pll_div1_lpcg IMX_LPCG_CLK_0>,
 			 <&acm IMX_ADMA_ACM_AUD_CLK0_SEL>,
 			 <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
 			 <&clk_dummy>,

-- 
2.43.0


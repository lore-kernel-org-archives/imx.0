Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AAE126BF1
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536936; cv=fail; b=kt7JaNQjRWy+8U9vJVW48TJpemZOqNz7JG23uBaZemaMUa/63bXLrFyDlX2aZrTcd0DfiUWiGPyWbTXlA1N2RgkF/dfk+bsPHtW4PEF9hP7sS5GcLvALCxw7pSAmCTt6CT1bJCoMu2Ka1UH4rYqXzHCbZ+dwsqldVUY9VP1GjGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536936; c=relaxed/simple;
	bh=ezgJqQk5QMFzYcT2Kchtc+QFkhaK+ndD3OhlaZJkbRw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fYddR6M5rAmUZhfTa7DKCxrai4PYN2ZfR+qbOaTbL9NAu+uPahpTdo2TW3OqGE1WiHUqDOpOV5nwvD6yP0w00as2iq6EkBs3XGwGLjgR4earT4eQ8lAdMW5s1odjtQQKKy0qm996SpjMIOq+SouTUmRbtyX8gToHu2a+rKHbzvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LOX9/AmT; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LOX9/AmT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvlsloR8l5454lSeshfGGq6VJAKNpru1JFgaGW9eUG8yYPyXLxlmjqCe+81Juw0KHjVpxG5dqPAIlP5Sz0pD1xmhgvIZFhckSIrjvKEjn4zX1Mj3PVFA3OWTiWL069TWpM5GdlSPSD1loThdxsPxwmEvdsZNDT4RIw+H9EP/6hY0QDunWv7iRaDlwtgTVtGCJWE1WeEnFJJUXQXSalBli19i4SRbVDzgrXnSrRyClmn3SKfP0ZGjwmy2jfGTiQUCNEQrdJy1l/j6VdyScMlB68tIQsH1YcgEUQSlLecL+7JdbGH7eVW20x7s8ekUUsxDiYdAvjPtyBuf4ZRB9iwZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHjI3u3BkiYTFZenc4i1xBw5Y6KLZpjulltwoD8dLPQ=;
 b=V1QAi9C2cX2G51cZEczxaN7uzQq2o53DUKTLBA7oltAuKO8fgXH3dEWUpwITKMGhGdhdfvSWXusL85Fqtd8iy731aYGMZS7VF4FX0evWhUSuJ9C86tGJAdPZYIwq0Gc8rsmp/el0BDP/dQWXhERnecepTMFoBq1Enz5rv7QgHz4rlDHyizWs+JheT0kBJrjvFm5BlD010sRtKx7Z89xuYmzsPHkoy0rehq5CeyUUdFT4c/YH3RovN0OQASZvbndoLOaLnBGin51MxPtaN8tcaZt071UjB/W1VqN7V7gxVMu2GvHwp0RCEf3Clh25sjp7mkJIV80KXNI+sUTfxtrlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHjI3u3BkiYTFZenc4i1xBw5Y6KLZpjulltwoD8dLPQ=;
 b=LOX9/AmTy1YWNTOd5/0ZMFIPRQ7ZqQML3x3qTYGtYobjHlkfwxMHnqF61uYEDb6QApfrooqwSKvUh/IJOwFn2iOPopIY6e/zasgbtEHWx5wMPfnLUUBmycEczIyzSDyOJysXocZ/RlMJKEldv1AumV92VDgkfpg6G959Hw7AjEWk4UrSw9A8eoUh3mw7VLABV4e9ERfwZNUWlW/WYZxSW82juTm6nmDSRRpiyjDp/c21Zq88XOn4g49wrpSyCkegPiecQvyw93bgOh5bl+wvlFEn7qGLWopaV0GJNCuCmJ/dbVmYypEhHXpvDVgy8tG5pfaXTRDO9b+kIerqEptL5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12130.eurprd04.prod.outlook.com (2603:10a6:10:645::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 18:55:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 18:55:31 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 14:55:14 -0400
Subject: [PATCH 2/2] ARM: dts: ls1021a-qds: add compatible string
 "fsl,ls1021aqds-fpga" for on boards FPGA chip
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-fpga-v1-2-06c8a099b2a5@nxp.com>
References: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
In-Reply-To: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, vladimir.oltean@nxp.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783536915; l=1769;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=n8rYqn09s+lljY4I5hy95C2+EebRxy0VQTCJ55KoiE8=;
 b=q3M6LHxmqXesj+1BBJDeFA1YJKAi/AZYb2aT71v1zj6A5c0YG/9xWNR9BtSeIfcYQfpBr8fPj
 /ZR8aLFHg11DjEWebbCXReoP09MLSrxA8WihJ152iVZW2PGbgY6Ud7o
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12130:EE_
X-MS-Office365-Filtering-Correlation-Id: 000358e3-ac68-47e5-6ae0-08dedd227bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|366016|23010399003|376014|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	ejhTbvnVmPjmNbFY3JgVr3yCY6VJufVlewwuSrm/FOypLtaNjl+epoE3zqHJyW9FAEaQ0lS0CKjn8wgG0YLXKK9TlVp1Fr7lmVYCO3iniRpLPFfujvqaQYohXNVAXrfMz+98E4xRJhoLnRcD/g4DcxO7xNUadQaQXXAd6g/+E/6Sa/Wqjcz4Qymbarrc0pCrk6ifrRD1gIaVYbek/tPJ19qKe4NVrI04FWedoWslFT+66fMWHQHSB+koFhREkk1Tk2daBQluAmJnnDJyh1ZfKijW1f40e3Cqh5M4rCo5m+QESojaFhCRHFrmCFK6st7D1Z6PIs+60S1gyKS1OF602b6NIrAjfY/qLTpTppjfHP4ongfdF0YXfPeVi8MijiHmoKi6fnr1NGx4krpLZnqYf3QG9/YL1eRo3bOKEkkOVWAJTehY35oizNuc0tLOA757oHglyxwMZXQNKK4ggOd/STN1na/1EYO0M2mLjiba3GgWrvDLd5Z3wbdHVQlCdCbR0TswtcGalBNQRzMzRxcSJR6+kooPjs73YtTl3+VkcdSCLe6eOzM7KNMzKD2fgj0pIBGutvms1SdOj32PS+IFPIwmC0lV5w0cCI65LptOsr9lE+cvVDdgekplLCV0hqfut9p0D9C5wfKU7adOpO/DtStl3mE+Q9GHmGYqyAVWEJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(366016)(23010399003)(376014)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmhsTkdrZWN1ZGZaWG5EajBETWZVVkxIeDEwd252eWZNcFF4MTFKSEY3M3dh?=
 =?utf-8?B?ZzdtdVZiR3V1N0NEeE1EVFlsYUxnUi8xSlo1NGZDYStlbzBoZzRZVkg2c0No?=
 =?utf-8?B?NURsR1NwRXNhKzkyYVhXNUFUOHh3aUxad015MVRnNjhtN1pmb0ttY0RETnN4?=
 =?utf-8?B?QjFTOGNuYlR6UFJNSWNKUWhYd1Z0aURjdWEweEJteTBGSjhydzhZSmd1OGdS?=
 =?utf-8?B?UnYzWjdiMFJIakE3aWhWcmVXWXRqUm1ROUExZUhncU1QVUlUK3lrVGp5azc1?=
 =?utf-8?B?MDlMakRBQjVGZktBa2dsYnZEWlg4aThzS05hU05NM1hxUGJnQkV2UU5RVk9P?=
 =?utf-8?B?SWgxL0FUTnhIUXErYnN6MkdESGdyWmpDNEhUbGxVNTVUQUZ3dWhna3FiSGUv?=
 =?utf-8?B?aDMvd0tXeUJYNFF1YXVBNEFEaysxRWVvOTY1d3QrSDZSUDZ0N1I2Z3duR2tT?=
 =?utf-8?B?T01IVUZVM1VYRDRabFFWZDRkamVkWHJTbEpTb0tWZ1Q1Z2xIQjhHQVkwbnY4?=
 =?utf-8?B?VVRGWUp3N0JqdEttTEszbzZycXA5NStLOFI5Z1A1R2YrYjd6OFAxbkJUQjM1?=
 =?utf-8?B?ZDJmRUxrV011b1duTE9RUWt4N3RBYnJKaHdBMFF0dlFVREpBMi9SalZNdC84?=
 =?utf-8?B?b09yVndDalFxVWRFVVpqajZlSGI5T21BMlZGRFg0Q203S2xsTGh6QUpYekdn?=
 =?utf-8?B?YVV6MGlsZ0Q0bkNYVzlFY20vTkRJSDBJTjlVWnpYbC9wZGo4VDk4SDhEeHMy?=
 =?utf-8?B?QVB3eDNHN1BKblpiWVF5ck5sTWhXM1ZwQVJaNDdBakl3aDNNYmE4Mm55WHhN?=
 =?utf-8?B?Y0FVMG9nK2hBbHp6ZExmdE5kQmlPNWlQZ0FsQ0N5RWl5MXFoem9MRkJmdFVX?=
 =?utf-8?B?UWZGOVNHZVJGTUVERzFtUkltOW8vMnBwdU5SK2FlSmU4SGJTMmtVc2J3aWky?=
 =?utf-8?B?S3Y0ZzdNbEg4OGJRWnhZcExManhzSTJHQnZVUFZtZDEzNTdWdmRMZm5nRUE4?=
 =?utf-8?B?UW1sdXJ2OVhjRTNYSmdTRU1DQzlrV1dZUDl2azFaNHZYTis0bXM1cUY4QTJt?=
 =?utf-8?B?MnA2TWN4RmJDRFVIODdZOTZ6RWtiUzl0d0k3U0lValE2R1lWTGpibVlZNXE3?=
 =?utf-8?B?clgxOENKc2xuUHNKTER6cTREUlhGUUVEVGJYR2taeWFyTEVvRlZBNjg1SXRK?=
 =?utf-8?B?Yk5jSW5SUkdTNkNYK2lFaHVLODlnVjdibk04ZzV6NTNZQnl5eitZZFZCNCtz?=
 =?utf-8?B?MFE2MmM4L3FpeTAxbU9CalVwcmEwS0VPaHVkY3BGRzNua1FZSm9KSW5QbnRB?=
 =?utf-8?B?dWVQSTRZMjFQS0lJTGt5dzhna09NVnEvdmdzVXdyL3RCdWM0ZzBjQnI4SlJ1?=
 =?utf-8?B?c21hOEppUUNUend2TytVV0w0allkYWpmMG9ubTRDZXpMYXliejRNV3FNL2Vn?=
 =?utf-8?B?VlBBTlVSbXJzU1dvdHVyT3ozYjNrZ0NwcEt0bjJwNjlveEd5WnRhWjVOTE1E?=
 =?utf-8?B?M3U5UGlIOTlBak55UkJxWGVwWGtjWGhnbngvdE02YUJ1TFB2SGVqWVducTZP?=
 =?utf-8?B?NkgxdXY2eVpJQ3lDMVY5clZiTTdnLzJ4VHNDM1VaMFZvL0YvRE9TVnhNb01C?=
 =?utf-8?B?Snp4U0ZZaTQ2aTM0M3ZramYyWFhia1cvTlhtUFNjYzYyTzB5a0ZkL3VtVGJt?=
 =?utf-8?B?VElwNUFtcHpkWFRBT3dBYUw2UzJQRjlUck5IOWFoMnE1T2dseVo1ejRxR1ow?=
 =?utf-8?B?c1B1czlVNDhhL3QyUTBTVmNROXBkWUxodnJjTzFicDkxMU1POVhpNHBvK3hY?=
 =?utf-8?B?dURSelBpbnI2dC9WUHhJR2VaczQvWk1iVlBYZ09EYWZBUHUvM3BnRnQvT0ZU?=
 =?utf-8?B?WWN0RGRFbEoybUUvcHlWMUllZmhwSzdhTksvdXlxM0pHbHBwUjg5Wnk2cEZq?=
 =?utf-8?B?aXlndnlkdDdyZVY3Zy9EckVtV2xwZWI5aDNuOFNYdmE2THZSbjl4QUVHc2ll?=
 =?utf-8?B?MFRWbmFzS01RRnE0VVR2RnlDY3hqVXZuSko2ank1czh4T3pneHhIYWxQRDVp?=
 =?utf-8?B?WmJYOFYwcXhGRmZYZmJkV21tOVBTb3NQc2VrcmFjL1hmWUNyZjFxaStqK2g1?=
 =?utf-8?B?TUVRRjhPQWNOVy9DWDNHS3pTZjNlamVTYjRuSjFSZzlTTjNKQzRGTi9remtk?=
 =?utf-8?B?MjNEa0dQc1VBM1VCcjZHR3dzdjJ2bjZGWnBlRGd0WHdacTA1Y1BYck9TN1gx?=
 =?utf-8?B?MVQ3cVg4MmZJamFZTmdneXI1dnphOHhRR3J1cDkwaGZOeHVORURhdHNXbG5l?=
 =?utf-8?B?R084elZkcFB6TFNXR0dZN0g4QWs5bGxWOERKb1l0UDRpMVcrS1c4OTdGdUN3?=
 =?utf-8?Q?5clviS0vZthiK2O2iGjVrkVbx7wASryw/Uofm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000358e3-ac68-47e5-6ae0-08dedd227bf3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:55:31.5113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbAk9wX6DeHnX8UPSLcQjYyTnqeUkTZYf0k6K0MofJ7kGlOxPODj/WeC+CYbx2a+htPbDbk1+KU6YxAk8/0sHvetNxG/LHpA2v6Cnf1CG1za3S3+8whqrdWAY4xBfmHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12130

From: Frank Li <Frank.Li@nxp.com>

Add front compatible string "fsl,ls1021aqds-fpga" for on boards FPGA chip
and remove unused property bank-width and device-width, which used for
MTD devices and FPGA is not a MTD devices.

Fix below CHECK_DTBS warning:
rch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
        'bank-width', 'device-width' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
        /home/lizhi/source/linux-upstream-pci-ep-arm/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
                ['simple-mfd'] is too short
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'mdio-mux@54', 'ranges', 'reg' were unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts
index a880875ced83e..34c88650c8284 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts
@@ -205,10 +205,8 @@ nand@2,0 {
 	fpga: board-control@3,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "simple-mfd";
+		compatible = "fsl,ls1021aqds-fpga", "fsl,fpga-qixis", "simple-mfd";
 		reg = <0x3 0x0 0x0000100>;
-		bank-width = <1>;
-		device-width = <1>;
 		ranges = <0 3 0 0x100>;
 
 		mdio-mux@54 {

-- 
2.43.0


Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF47389E0C
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 03:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774322089; cv=fail; b=RiDbO1DmtpnuIIy2362+dtzqoTQUTThkq9LQr90BbCS1UBNLHKTuMmgWsRwkqqlRKD6Ju3Q2jMugMRf2q1JccDJExRl+aTy758qWITotPJbO1BcuA5VMOQWkqb3dmoQe4AsR9D+vgUHaveMJTZZsi/ipNld9ewLdMvxG8uJilLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774322089; c=relaxed/simple;
	bh=nFeoNbohsizGMANDfNn/QBSee/sP+HBw2GwRgIX0WZ0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=EhfISdXJDuDTIY7NYImHnZps9zuVYlfARdX3JjohBXY7zPcaJaoi8uAl1i01QoRtvg/5aU9+WjHWySW/ZopDXESbQZ6ZktoTmHs29jwC9h+vg33pQACOlscXLAyCB4KYKhVZTmmyDoB19cfi6+jxjgNodYDkVEuK8y/8DNR098I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m2RaK1CN; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m2RaK1CN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en5BSI0jRjWQWGwJeEHT7KQkta3CoQyLW3X6moP5M2ILyj653oBuvMG72FDwyuLhohokTmtoElohc7791vWuDCjwAXorMHEQEHpK7dq/8WdawpwxIuEuQxCEOQEirk1PCuMjNN2RDWi9c8k3qcUemjREBd65yMB8grr8ECwbkwZArDFOjkv9p0TmoB6p4SZPx7+pVbbzaJPS4s0YBo6V42EW2sWTJjhdwiz2/2NVNkf/gg9A3uYksumhLGcPgZ0Xb7G+j4E0Bmt2178cJPZNFXSywiEb/yNRZDmUyrUWhAAMAFBEtjxjdarHbtaKkJNT8dbGYPyHxmiXJF2+SyULRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdu93ifSsJEGGskNFuxir7Ji5rwDeMQqVeRVYhoNygI=;
 b=CKhmC4prXDFr4IVeZJ561crSoUu+ftWNJmXmxjiEuO1fhjpeSm8PzVAGF379XK78TUcD5mhnymiHJrRe7CK06+mBw7cWpWqYfnHBLf9nLMRsatqgL7bTBYlXr2da9mDwLAe2DxTIC91ShzfLY0FaBDVKLsn4WQgF1Ig2NIj9XFk6sEkcGrzQZSY8p3c8oILHFkpTPB0qOVWu5sQQ9xXHVXhrILP7m5R1bGEJbd8LfjbTOmQ7mAgut3iOvslhEK+rplpTloI4oiEjKgoygnI48ew+lxQsByM51M1/tF5u7zSqOQegfQX3ntky9e3tk3Dsx1GB0zabhP7ODTEU/vF6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdu93ifSsJEGGskNFuxir7Ji5rwDeMQqVeRVYhoNygI=;
 b=m2RaK1CN0bVW9RXzJEIId/84ZpnmBnBIBse5uXv57MmOsO/JCDgvfcckfZWiCeu63MzQ9qOvfTa0CPWTsWBfprue5YnFBTIV+gKWoUdxn8bpkVDtQEt14J7BqEDbNdj9PIDhmaA2J8IP1ATjuUWcXBr5pSYPBlz21hSw96hsUG+qe/cVBgofnn5OzSO8hEQlAFTUN3KyG8Yhu2h1CxYzsijGxTUaJHpaxRVan4aivdRZIlhvAKcmdJnNwbYEKTIZGlwGQCVSsGRsOQ807NdDzh0WXop0ZDjM4UJPHjHP+CbiLhVj8dc5k/+YXBLemEgoQHOcRb4tfYW4Iyg9ju2O+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:14:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 03:14:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 11:16:13 +0800
Subject: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings for
 pmicirqgrp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPwBwmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMT3czcCovcAt2UkmLdtMwKXVNDI1Njg7RUk5TkFCWgpoKiVKAw2MD
 o2NpaAELeqUFgAAAA
X-Change-ID: 20260324-imx8mp-dts-fix-512530fe4dcd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:3:17::30) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3c1ea6-fe16-4cc3-c860-08de895376e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Ivz+Rlcsm9HwyJqBC59cPcVcADftfT4ouJgTfV26eDUv2dH0t3V3sqd4acohdMULLbtuOedl2VpAtsbZVi6K4UGSBXW2LMsEM1DGssPNwTT1AzmMBIBMBOo6xVITVST+nilQFEq4gSL/0yNjYqIV07EPJZNdQR5WLjEZDRZklmC1ygoWxuk0R/XhH8R12iJgcmFOQ8b6UGm4YMJu3Yu6C5wfog3RipxKiVFsiIV3Zgbpeiv4K2nlpdg2bCpbBg4m7b2jT3/1PEvkWUXvNQiLz6k4fUl+vbqgKfNAn8eBRxBQJnkpBIV8cAm+KLYPrSU6a2VzdlNsvTj21MdFtUtBQ8DWqrmuEg9428BM3Cb4fBmrSUneE9spzgJpQd4Teb0JgAHPUhtt0cj98f81bCDiHy22o2/cQ8ug7fcUFYhjCmDzvUvZ+qWiPHy9NgGyJVVx0lDZ0u8KyTdfK3oSjMWvKOZhL/HrBgP/o4sm8RSqCdTXM1fTDBQ9TpfzqrvxQ7vfAm0UPGlTevHCIZueSidcffPj6XrvnGJlTTQrvydpKq3OSqsbWAkxMrqk9sWRbLga8y5cZ/aammLSFxEDS6SvL3qgoIWEW4/bZ1yjq9UcMBFVl2BXnMPINSlCr2Vf1sQEMVIIHvud5CXCBalW71BIYMl2VoP7qtNlC/UGhcxk64qrZoVKpr0hkLgG3iccCgu4wTW5mOnQM4B/m5s1KOQe9QWBMW2X0gXEl0niOgL1JjChJtzvuH9uI9zhfp4bEfbztgG95e/Oy8NnQijko5AKnUBL5y8l8KDi1xPA7D13w3e4TkNZsCxX0hA66740VVg/
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VXpkcUZQYkYyYUpkMGtON00zZm9QMm4rckJWMVN6VW5HTHFhUTJxZ21Fc1Q2?=
 =?utf-8?B?UXdvWUdVM3VTejBXNmdnblhTZCs3QisvVnBoeGIvL3UrdWYzMHhQMVFacEpp?=
 =?utf-8?B?L0JnaCtZV0dtQmJ3RGljVnRMZ0RWNUQ4NndZSkxiWWhRckpDTXZZVTk1dDRW?=
 =?utf-8?B?blk5U2JoVk5URHRCS293SWQvVFFlbEZDZ1BtMFVtdy9xWWZCWGk0SXpPeDVq?=
 =?utf-8?B?QzVGSlFjZWgybHZoUnlwZExXa1hNMUJ3b3dlWS95UG5IYjJCeFhWdnYzN2c4?=
 =?utf-8?B?Mks0ai9YelpIbVFZSWtuZ2FycVd6cTRZTkx4V081anFPNGN3d0E4QmtWbHUr?=
 =?utf-8?B?VFFaL0twTk1xMVRxRU1MeVNNc3ZNc2tLOVFJT3JUM0ZGSmpUNWd4QlpLTUtr?=
 =?utf-8?B?QW8xYUdzY09jR0RkeEJGMUtaeGpzSXVURTFFSmVnaCtsUVlPY0doaXpzaGVL?=
 =?utf-8?B?SGNUZnFhang4TnJPR2xweW1KS3B3QVAvL1QwOEZRZ1IxNmhUVGM0NjdNa1FY?=
 =?utf-8?B?TG9sM2xMaTdDdXRjVjF2YlRRcHdRMEhIR0ZRUVgrSk9QQ2ZzRjVtdFRIeG1h?=
 =?utf-8?B?c0I4TzMyVklCOHl4K0RNNytOWUl2UXlIeXVzNGVxWm9iamtvMkI0Lzlwc05J?=
 =?utf-8?B?Y1Z2TGZnQU5Lekd6dHJmQ2l1Ly9jc0pFd1FFYlNDcENqTFlndHZwaGhGdFJl?=
 =?utf-8?B?czhXOVdIMFg1Uk51MGRPTmt0bllvc3BIQ0VTNXVHRDIwQzRBVDg1Lzhub2RN?=
 =?utf-8?B?SlFVd0NTb01tZUh4a3V5VkpmQ2Z3NEVlRU1UWWx2anlJejQ0UDJGZnVlMWFS?=
 =?utf-8?B?WE8wQnhPTytpTS9TUkliWVk5SkhsUnZMaUVFTWpDam9WS0NXcWM4V3ZkeGNN?=
 =?utf-8?B?V2FKL1BvaldodW9OSW8yajhOMG1qbzRVbkRSYWtFUTE1V2RTaXRoQWNTUGlQ?=
 =?utf-8?B?clg1WXd5YnJ0OXR5S0crL0ptcnVaRnBsWWp4RmRvb3FWcWRBOUVpY1FiWm5q?=
 =?utf-8?B?eVd5anp0WXpESnFDbHBJcHdINmJyTXVpSDRYUnphbzRjTGcyNjNyVE41alJP?=
 =?utf-8?B?RFc0K21mQVFTdEhKUFQ2UVptQndKYjNtRWpTTVIrSjRPYlRSOEVwMUdpMTBp?=
 =?utf-8?B?cmhDMGxJU3dqVmtYNHF1SXl4eHpsRCtXWlNmRWRES29PSmZITEdhOU9WT3Fq?=
 =?utf-8?B?WGV3Qy9HMmR6Y1lyZzVUMnBnNzV3eTVPWW55NThITUwvOW5VWHNPeTVpSEJj?=
 =?utf-8?B?dUg5aFRDVHc5aVZLTFo4VmhXVkg5S3JnamZRWlRFU3BtMUlUMElKbW00OW1X?=
 =?utf-8?B?ZGsvTXoxbjc1U2M2UGNsbXgwR0V5NUN1bHNEdzJFdVlkd21sZ2hLV1l2MW13?=
 =?utf-8?B?ak8yQThVOXVHMllvbS9pSlU4UFpGaHlYV3BvNXAydG11dzE5ZUJwQ2ZqdUxt?=
 =?utf-8?B?TTA0a2UzWWlCSjcxRVZiYzBESmp0SEsvVEhQQUFLODFqcU1WbDAxUDBydjZw?=
 =?utf-8?B?eGRKbEY1clJtOVlKYk94Tm8xU0hLRkFMMkg4MWtxVEtkV3B2SU5scTZKRmxa?=
 =?utf-8?B?bzN0TDcyeEkvekY2RElwc0tVbG5wSmRENzAwVTVwc1dsdGQ3dFlGLzU2bi92?=
 =?utf-8?B?RGdWcUV5cHlGcE9aNlpmdW9BTkFpN200dDdXdXF3eFR0NThMa1JXeXNkcnQw?=
 =?utf-8?B?Q1VqV0J4MjdvTG5EVlV4VG5CcUNPNmtROWJzS2l2Z1RXRmhWdWxtelRFRzky?=
 =?utf-8?B?QkFRV0Vpd3d6Z1dKWENTK2I3azVhblVRSy90RWRKUG40QnQzRVVkTTNWNVQz?=
 =?utf-8?B?RnlyQlMwNWJvcFpCcStYWjFxNmdtNGU2ZzZVbEVkVlVUWmRqZEdoc1hyUFBs?=
 =?utf-8?B?QUsyd1NKRlhBbFJCcGZEZUU0ZHBRZWlxcUdmN2RaemdvSVBDeTRHakpnc0FM?=
 =?utf-8?B?ZGt0dFloM1VSSStYbW5vaEZoam1QR2RCNEtkVHBPUUIveG9NNmEvcVJIekZU?=
 =?utf-8?B?QjdjZ1BWaXNNRHNFM293NnZNelVRaEdtZGdLSHl4RnJBeWs2emNpTS83S0p2?=
 =?utf-8?B?YjV1ZmpSNHhHbldIRm5MdnVZMWVZRkEyOXR4cHZWWHdQUk5Xc25WZ3pXNkw3?=
 =?utf-8?B?MHdJYTBxTUc0dUplcGlYeEczbkU4SDN1dXRGdWh3RGVhRXloSjJDSlYwRUlo?=
 =?utf-8?B?OTV2dkJTT1NWSER6Um5kTnVzdVhnQ01kZlFzSFhMRHlGVUF2MXkzQ1JTamJN?=
 =?utf-8?B?ME5OYndYU2hheEd4OXBDLys3NTE5WE8rTXl6OFVkUG0rL21KcXROa0NHSi82?=
 =?utf-8?B?TEtqakRGTVdCcURweGgzMFRUOVBGUHNjZVVnZEtPaVhGaFdsMWNxUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3c1ea6-fe16-4cc3-c860-08de895376e7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:14:25.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbiFiA//kFiTvh1auKSEG6AkSXntq6ZACxUGhI5rpezy3bJnnc8Vfte8+vwPoMCI7fRniK6jBqcmQEgtYhkr8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
PUE and PU together to make pull up work properly.

Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model A Board")
Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c678f11291f6f2b77082ade95 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x000001c0
 		>;
 	};
 

---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260324-imx8mp-dts-fix-512530fe4dcd

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


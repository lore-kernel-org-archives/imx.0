Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B962F616A
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510118; cv=fail; b=OzOp2a843ZLSNQVnb6RBoAb/KisLWDzk2tOzsYdRP2V0bH3muE0yrYTFu8/AGVCtil94SKVOyGG7zW7AXba3aizwVluOUzEDrYRrgIlB3eYR0ul4aecQQ6tVoc0GLkuGe8Rxa37qjusPXXXZO0/JJAEF+rsWMBToke4HhiiFqTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510118; c=relaxed/simple;
	bh=Aqpjp2EtoxjHjT1YVoPcP3TJOxmkOlywPNf0xACfDbo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WG8lMIlpDs++QKPWVWSA3w9KYeka2dB6Ye2Xho/iiU/SsHrC2qwn+bBLYk1ZouQCQ0ErAAgRJ2p87vlm7pqPPWFEUO2RNQhAlz9lpYTF6qBUWNz+PAGBhL7DSGQxAqKla+zLRmHJB3XShIWaZYpFR6DcGRigoof+MS4cQmF6HGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ifhx5e1J; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ifhx5e1J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF4ignTEtQP0RfQrcV6mSyovmCKAfZHaOYlYxa9w9mpwu67Ie3WH+LHliguSpAmqrrVMkIBywZe+vAtt3I4UL0vN8mzuO+TvBDZVhkiXO8Mm0d2fhTtkU+4/pbR3/MA40XZzgaE4cXIBtCIgwIDNmUUxwoHGqIJm1ICwvcIuHTEFqGQFaoSCWjruaM+B8p4gDPKkr9/m+tSQ0jiBDwWOoM/QjUAB+XRH0s9Vl3Ts0A/aarAJm/eTEbBqSiXRMXoyaHgNH3e3vFiRFknnWQtAGcK8plML00+6RDcQ3WbnOuIa9fXFSILaKZIpgdkkVtWj44HZjCOooxotV6EnrAznbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xWO4q2K4eIi2aVIxc1Nvrk5Pzsnb3+a0vTEw3fJ+Jo=;
 b=lE7Psk9hOivKRnTMkCUHFOF2+3chJnwlQiyHuZg6BJKeezbllXQkp4ABZok6qJysFp7ietPc9NwxCdBpxgr3WA3GuJlA8NJXvWHQd/tlO1JAfAzc/iprRCKO9cbsrtDIipH2RJ95wJWybCSQZmgEMwOfNPtm3+2qUUymIOuD8i87TM1/PZ1gT8iBsWqR8y7tYWMZZP/yQTEFSTsJWempR/VSWl7KkvieYjiGHp3lL2auYBiKDtN8yYIuusMfCw+KXiIRhVq1Gqbzd6WWjw8MDH2Ao9giEX0SWW65+wyg+zg15mX3W8WFlm1dh0x6khGKrQWWknfvFqRyNR+KT1BgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xWO4q2K4eIi2aVIxc1Nvrk5Pzsnb3+a0vTEw3fJ+Jo=;
 b=Ifhx5e1JWk6XSukOr8SeTuphcQDJjgoVfgkwxha1c4AD7Jt2Pa3nEKQxIooOAEIgHyxlsh3NEOStGTzTlyW/coI0ckiGZLQjEU4oeZ1F2SivfuvdxUB0zg2zDok+BOS+FbD7FpmKln0Mve7lvTAqCMhmYbiJnzDeSLzmPnoaLhUkaTtCnfZiGnkApA7CzAs/19YmOVLzrbW0gjyyXIx2lHtyseCiFRQcWmBXKkSA0uljd59rGWe4e2AFFOAnsMNmfSapT5/NQYgyyMU5PpHSXJgrmVWJafbYD5mrDDlAk5UtAtSv6gN8fKmg1u2ff9dUeAI/NtC30gW7KoG/oNvSHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9209.eurprd04.prod.outlook.com (2603:10a6:10:2f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:28:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:28:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:16 +0800
Subject: [PATCH v2 12/12] arm64: dts: imx8mp-data-modul-edm-sbc: Correct
 PAD settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-12-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a4f466-1352-4c56-250c-08de8b09397d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|921020|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 RaCdhXoNJr9RaIH/sf9PcD0Yxxzj5gguT+TVfSCSBL4IZoh5NYPzMnykX8ImAifGPYWcnL2HEii2jNC4uNjb9bk270Gbn2Ld1aoE4GzdhEHZQ6VrgURZ+61ni5zdrr+IIB4DNAqg+rFWWPGweWTpuMeD1lkmTmwa2y4skoUaOn4wLRxy6anlkrF3XcstJHiQKpbdRZomdKeVqvEQbN1MhPlTb7r9RaUA3j4hzJTtM1mdqLCimAPNS/RyidaNYXXmkMZ4IAHO+K4NDiEIw7PiB7I1+wkbSpl0XwY+0PGY6XMax9XPuZBSANZ7pY060+wt8HhXdkeitz0Prs7mQ53PSvma5qFetwlGYkyHDDArCBLP2bI/1iaEJBWPCVroEWrqKHdvwgvtZWoCvHr6KM+CdmM0hxbJzsdHaq+wVVq4LY+Rcg1jPRu9OEDFXOcZ0gkJFb51SYnI8OuknguczaiQa1lAC3WrNyj8obpsMcEhLWTOgWQIOIumB3j1mPFK9tEYkqcS7WHhRDDYcAEqEdrEs8f7MxncsuUhsGAX4dlcCDVju7TqvxxZMNFPJ0pAm3L5PClybAW33Y4+4qwOtkmi/g+tJ8K87bqevu0t1geCPMGO+nQOZzo6Zqg9FEFI1veQt9HLdoyBk+gvF8PCHEA7tfE3O71Cbba3y4GhFC4qlDRdvqBfU4bwl+ewPYEggOaBfNSX2SqEX2e9vpOgzvVtskEkb67FdEINMW6xJShknLZzB2E36BjpD8VtuDfwQ2X1SRQ1PQKbG5lbmzSy/Dr0pTi5Z3yHjd5stqOh+WEqt4RYH4FqRiCg5cFgdC5cnASZ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SVZFaG5MUDM2RXh3THRIeFV0ZURIT3BvT29wL3J1U0pHN2J4ZlVBSkxvL3lN?=
 =?utf-8?B?NEFPNVZxMmZrMmtXZ2RaSWMxM2xwNCthRjAzVXZ0eW5ILzA1STNsNTJXUDhs?=
 =?utf-8?B?K3hKbHhQSXNZM2t3cndqVmNxdlBTdHg5Z0ZSTERpbGM3Qm9HUTR0eWtOTzRH?=
 =?utf-8?B?OE5INDMwS2wyc1N4dWdSUUZwYmVRSE56bTl0a3FOK0M5dTNRWlRNR0RzNytt?=
 =?utf-8?B?OWExV3FUdjg3T0JEdE5qZndpaUM1UGZ6SmRjdFhleDhCTWkyS281ajVnZUg4?=
 =?utf-8?B?Q1JsdUdXcVZXRlR6ZEhUaXkxaEhKeXN0V2plRkExN1YzSzUzbEJWK2htOWN4?=
 =?utf-8?B?SklHNzZhMGYxWGRaTzNESHpzekJoNUJsWnFCakMrWk5KSHpsODM0N2dWRU1O?=
 =?utf-8?B?cTFCNkNTd1NuT0FtRVVPTDhZTXlyNVFnQTFTVUJtbmhYWVFpc1R3MzNpVlFw?=
 =?utf-8?B?aitVTlRQUHNBc2VUZWJJdW5uT3NlVmZzanFUcDY4b1NDT1dTVnhnWGFTSUNK?=
 =?utf-8?B?QW01R3krNlVaS3FFcGpXKzE3UWJSeWozd05vQy8wMDJzaGsveUYvUlhtVjJY?=
 =?utf-8?B?OWNJbzZOa1J5d3ZOcG9WMXEvblFiZkZ0R1BGaGtJdTl6ZDUyZDFnejNVcWpy?=
 =?utf-8?B?eFlJS1IxY2dLR2lsODYrNThCNEQ4c2ZXUW8zeEtYV1RYRWRkVkNRNkJvTnds?=
 =?utf-8?B?eVdCSitMUWV1OHFqTkxBbi9mWEg3aW8vTThRSjhsSllPSjR0Z0kwUkYyQ2k0?=
 =?utf-8?B?Rk5qK3FWSnVhR1grT0xpbitzT2paRWhJL1JOU2diczJJQlZKTjE5Ly9mdGlZ?=
 =?utf-8?B?NWtnK0dXUHlWUlh1S3Y5eHdhUS92Ym5FQkoxZHhxYlhudEJxSEYzNkZNeDJn?=
 =?utf-8?B?cGRCN25wUnl3RkNWRUZFVHduT0RyeVN2aEhqelZVYk5mY3RWQjI4MmpnSWZQ?=
 =?utf-8?B?a3Y0Y1ljSGRmSHh0QWMxVkRDWHp1NFNZNU5IcU8xNnRTamJ0clh0Um1NWGRv?=
 =?utf-8?B?U1c3QmVqYVpsOTlGWmRoOFRXVlg0dHZvOUJmMEd3N3N0WFo5ckxmdE9MTFVQ?=
 =?utf-8?B?MG9ZeEIrSXExRTBTY1M0d016Zi9JOUJjWkVydUsrbCtMcmlZMlRiV2IzSUt5?=
 =?utf-8?B?OGpFb3R3cUs1ZmNPVU05Q1dtV0VQbEFpN1dRcFJRUTFlZmI2WFVieFVGSzZk?=
 =?utf-8?B?TExmNTdEaTdOY1lCU3VYbnNWNFpEQm55VmJtSEVtQndUMzF6SHUvY3U5SXVs?=
 =?utf-8?B?dTZFT0JNYjdGZWNKdWIvaWVLTkR1YVJiV21meXcrMjBoSUl5K0FPSjhjWEJB?=
 =?utf-8?B?K2xzOGpkbzFKSVFxaDAvU2pYOVJRRHA3ejA2NEJURzZta01rbzBNR2JFaGZM?=
 =?utf-8?B?cWRjd0pVekdYeEd6NzI2SmEzTWQzVlZNcDIva1E1b2M1bWhXNXo3MWtHd0sv?=
 =?utf-8?B?RGhoYWpjUlRSV0NWRjhuTS9CWFhueVN5c1Q5ZEVkd1lMTFJXdURucklUN3Jk?=
 =?utf-8?B?TGdCdHRwOHN6K1FpeE55QVg2TElsdmt0SEZMU1IwTEQ3aURJdlVxWnlnZEtu?=
 =?utf-8?B?US9xVnB6dWV4Nm95c09hKytEZS9MMGpVUkg5dC9KbDkrbU9YdFpSZ1F3MTVa?=
 =?utf-8?B?cXhyUDNHMkJTNEpVQzY0UDlXNkxKOCs3UC9HMDZKNTVJcThNUHNPTzArTW0v?=
 =?utf-8?B?VTB3aWRWUU5HK1BzVlkzQnpHSlgyV3ViZ2w4Q0pYVVJSNzV2c3BVQU94SERm?=
 =?utf-8?B?TnNkbzUzL1pMSTBFR01rMUgxR2xjejlZQ1p0RmpaUllySEtlQlhSbVNsclN2?=
 =?utf-8?B?SHArK3JGend1MXhsRzd3OTIyVVJkRElTTXIvNnNJQUw5ODdFSnRhNWdJdENZ?=
 =?utf-8?B?WVdCeFl5dmk5elBxTGRDNmtUUE5kNTlVa1NRd2daSE1YSkNMVC8xeEZqczJJ?=
 =?utf-8?B?SWN3b0w1YmEzTXV4THFLdmYrTWhTRGt3OE4wUGtjcTVpS1ZNQ3RZVENXZDhj?=
 =?utf-8?B?b3poOUMxRHV1c2hoRHE0Q2dEcUw2Nk1Gc3RSYURGM09STnBjVENXK3NJUUYy?=
 =?utf-8?B?akgrSUdBYkpENVFiL3BRR29nR0dKRk1tZFF2SEs4Y0daUk9Mc3JiZStCSWNP?=
 =?utf-8?B?ckg2cGdpSGRIV1ZlVGRoQW5wNXhGNTA0SzJxOU9PbVN2WkpVNm5uSkd4Tk92?=
 =?utf-8?B?ci9reVRvOUpDM24xa3NJdVlldWplaFcwMFEvUXFmNnZiR01VQXh6clkySDI5?=
 =?utf-8?B?VmxqU21zTHdWdVAwTW5mZTZiazdLRCtkNUw3WmUxa1FFbndhYVptYmJlZXN2?=
 =?utf-8?B?eG10bktSWkZZVVJyc08rYTM1V3pvcWtCTU0vOSszeE4yaTBGMWtSdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a4f466-1352-4c56-250c-08de8b09397d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:28:06.9872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unUMEu+8IZSTl2LaicjzBimXHK0Y4vbVvbb6zJXrW3PEn8MSPiWUHAhVzbfuDiK2IUWR34i8ABmY0cwv3yfiiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9209

From: Peng Fan <peng.fan@nxp.com>

PMIC_nINT is low level triggered, but the current PAD settings is
PE=0,PUE=0,FSEL_1_FAST_SLEW_RATE=1,SION=1. So PAD needs to be configured
as PULL UP with PULL Enable, no need SION. Correct it.

Fixes: 562d222f23f0f ("arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index 7e46537a22a01d6e66305394edcddd73fdf660da..cb28cf1cdd23fa945906e6f26f6036ceca496c5a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -1001,7 +1001,7 @@ MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_PDM_BIT_STREAM00	0x0
 	pinctrl_pmic: pmic-grp {
 		fsl,pins = <
 			/* PMIC_nINT */
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40000090
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 

-- 
2.37.1


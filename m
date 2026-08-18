Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF33AB5C7
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 02:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020969; cv=fail; b=fdw282ZB3FQ/GLrlCV2IkrH22nbsKD+gWi/sbkHg4tKZFNEyNNqnvpKdgjI6a41fmDJ44rUVanHVHM0ApgFTrYIz555OtX4bhrkVJorSZHEPwy3bZZpZYwV/Z0xs8rHnU+MO8R+v3i9T9R5GZJWx5uOmRz2zNKs3n2RFVrIHFVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020969; c=relaxed/simple;
	bh=i+v8aQMV0YI1N44diaCLxoJrJIbSPBofYuh0hjsz0vY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=unKth9KaPUMjnnVG+gmFXAjWqC5O+XHwklYFvmlZYmmH10uClgFzeIPdgT8Lalek0/QF1HkRfNSRBFtGfk8EA1TgHyxW1C8IwWDBTU09rGvoXCNEy5uRcVGvR1djUD6IucZyI/3vZbmttKbhryE4wEgIIkWt/Xql1LWwVtJXvSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=prSFFr3h; arc=fail smtp.client-ip=52.101.66.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="prSFFr3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erjXacuzpTdzn57h7eUpKO1JstTH1yW+mziUJyLVxHrsEK2b6Jpv55jvg5f3yDIeq+S8XUjo0nfoDzUyuI/BlJ4FMANSlI3F06fr4+k50ETHwGQuqCgaZNXkkNSPL97fSuggHQw6AHqJXAXfnOkJ3nbITNu4NYCMRJIiqI4oC9AzeT2FWsXY65NemuDhzhhomrZ0mo4g9ohdQF+DuvW82BF3rh87qctQt1PttwlAvBVWnwefVY7BmYGIl5mFMN5+ca9Wk83jtm1ZEGKKg6aZNtPmskwkoRjo/il0Azh0LktXEEjhSHGH23PCQIuFbGl6TeDnGpK6ROILCnWXZxA3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od5Z/qYWkzRNGLeRuQc1CFO5VuXINId5mNsE8b76RiE=;
 b=G1MKu0190dWIpgZzOQL4KrcHNGo/83jY+N6JzRadnWrK/DV3uvkXw414UQu/ZeiijM2IyoTPcPR17hHkJxB1WNPb2E3/A8qqr2Qn0LuySWl7gI/QuHV2Be21sRlxsIbLInomauqhnKlz/u1pJb0P7m4dGlX3WWUBYzubpAM59O5nKYkdlgNaSxSs8wHtEUlVEqF0v5x+sinCyneeJvrfzbHafB7Opp/TcIcDgZxqb+wkihMJ/elEAb6nV0OYqqPmjeiygK+1NJCymBJmgqUA2x+o2mCkN7vxEu6kSASyxg2y2AxDZuaHrNRUSIgJ3i5n7vwWNaWXHK74X7ezKpjytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od5Z/qYWkzRNGLeRuQc1CFO5VuXINId5mNsE8b76RiE=;
 b=prSFFr3heAqYIIgWw2SyR+Kc9dODnxs5LMTFcdEs9FKBu0zUpm4RAN8AoSDmJmmIbBUmenXVcG7UYi4j5C4XAToflIKGMLqrnQ1TxTXsgT6AqFhn53teLZQl2MmXlCQHvFBip0TR148IWC05ZBb6+Ygou2flQAamWUFPKQp7+FYwF291UHlJRL9aAOpKGuVTEYoxhDSwVO9fvkD0N58q2LKRRSH8tMEWddYt41o5iV3UH4Dso7fPFRiTqp7uRljerWJ+Ffclwzu9F3j1NXOJBSdp0UK8DfjWWROxhSPrNXCkLPiN3Pxal/QFEDJFKNGeKiuIN3d9mfSntC/2OSnx6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by VI1PR04MB10028.eurprd04.prod.outlook.com (2603:10a6:800:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 02:42:44 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 02:42:43 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Tue, 18 Aug 2026 10:44:57 +0800
Subject: [PATCH] arm64: dts: imx943-evk: Describe the PCIe M.2 Key E
 connector
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-imx943_m2-v1-1-d9832c91a12e@nxp.com>
X-B4-Tracking: v=1; b=H4sIACjHg2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ML3czcCksT4/hcI12ztEQjM0PTNFOzRCMloPqCotS0zAqwWdGxtbU
 ADod4T1sAAAA=
X-Change-ID: 20260818-imx943_m2-6fa2615f56a2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787021122; l=4114;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=JySHJIr2Wgr72eXJnb4Jq/Id+zdhXxcUzOha5ZZ9azE=;
 b=XLwBuOE4C+gSCPyB0Vb+bSOrwgG2gd6jhIAOgO6mFZ4FPmcWLOq7XPZarLDrCmlGVOgF6q3Xs
 OG9QQ5olhBCAYbXinlL37VTxzY37af78gSM5aEIoIbMsPQzpaxa57Ll
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: SI3PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:4:297::13) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|VI1PR04MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f0bf55-6504-4e01-05dc-08defcd26104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fE3BNCpFmD/ygS6kx07GGRdaAGntau/gjEM3xxymabu7UGpVFR2OlQ8QnvzP/x+V31fgjikOlR+LWv0cO93WNT1s4usgWQGYo8j9NCG/YiShEnOvD1+nQHfGvODYJGeNeO22+iMRwKnx3e7YUCn8knzg7sYlfZuHHOCRM5/K5xpTq0NesH7UGef993jqjLRdZ9JD8nLzDNAsAJoncrKEpTPJw5A85hgoNyen7Ikvno6NwlwdIi8DQK5dBKjQtJU4p4egU3CAWdNXqDGz4/Z5EhdF4fRBU3CIfxZfZVsKenn50NubqKSz3ttl3zLBSYt13FHf4xU+qjHZpZhQgBAqo+K/l8Oq0clBU8XEfVH4yL4cJwVx5oW0Lr3KrN6I69NPdGKmZWSdLbJqGgjSJjxH7Y2i0V0RfgJFriWmyWCDJgpwtoOL3YykTfCtz4Lw0oHSQ94aewBSKeqUjTAjDwqizPn0p/FlOOpOkJTIPghEgmcVkfPhFCUvisAfVP4YaKTzZ4oqMASBavVySTSjqRVUdXcPsN7znyyZ3RXdO+LEuWN8fmIBNEUnk1l7E7dChhXuthsjPQY1ZsxRHLRkM4ZgGVZfr74Un/fHQNOjSFEiGX6wOd9QjmjcC3jUYxQAENePZTpr2J9tluj199DBk9mgxnXWsZyTrgGV0cQaHkANmVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGY3cE5DaTlqZ003emk2Z2Y5QWZqODllMkRiMWhYSzhqd0lWc3M0ampKaUlH?=
 =?utf-8?B?TWV4dkI5MXQrTXhEUTVBWlZDNmZkdnVPMk5Pbi9TQUF0aWVtYVo4dUhOY0pT?=
 =?utf-8?B?RjFyQ0xjKzg1ZEZJSmdJb201bzE2UU5IeTc0eXVwdW9qdUxjWk1mSEdWT0tV?=
 =?utf-8?B?MWlGT2x5YnhXZ3lpalRnanJUbEQyMGZaSUtjVUorQnZzMmRMZDNRV01XWktO?=
 =?utf-8?B?TkNuanNpL0dUSGZLQkN3ajZPcDEvd0pTa0Q0SXVhelltWHQ3eHUxQm03S3l5?=
 =?utf-8?B?OXd2WnJZcyt1WlMxeXBwY3FUbjN3S2hnMURRN3cyVGN4YXJwbnM5QzJlOEZm?=
 =?utf-8?B?cDhabXZpR0VJcENubjZyblJ2RksweTJZTlZUcWxLN1hYTkRtc0R5eDlJdmo0?=
 =?utf-8?B?aHlBVjlZbUJ1eldmR3FwTXlLOUgzaEVKOWRlVWNHK0daUnpaWVVFZjgwVnNk?=
 =?utf-8?B?ZXJNamNsNTF2VHU0bmVhb2w2S3haa3liQWFYKzNOSXp0MkZObk9QQk9pTS9J?=
 =?utf-8?B?dElONkwwQVkzRzlWYkEzTGRKTkNNakNvN2N5V3U3T3lKWlhHdUpPNzZRdUgx?=
 =?utf-8?B?b1F2aDB0aHd0QjRJMTlSaWM5YVo2S2NaeUo3U2Y4em9lZ1B5V2wrbDdsMGhy?=
 =?utf-8?B?dTJ4RXNDVGJvb250L0pTSjBvTmVvdVNRcnh5cHpBUWlhdEgyOXhibHNFei92?=
 =?utf-8?B?NlNqMUtjUEh0emVsSTJERm9qRFh6eGdDQUJ6dUZsTXRlRGpHV0E3MlVWUUhE?=
 =?utf-8?B?NlBhcUNjeStLUnJaUHdhNThuaE1leXdPNFFPRWowNi9HT24wSENxRWxiWjhT?=
 =?utf-8?B?Nk1vVjFhSjZhRzE1SGQyYU8zZ1NxbWVoTmNRQkUxb0Qwa1EyUXV3dVU5N2lD?=
 =?utf-8?B?Y1MycnYzNE9iT01wWC9HemlnYW9sYVB2dE96N2pMbENRQUgwTjFQOEpTR2Ry?=
 =?utf-8?B?Mm8vc2pHOXM3TndvTkNCditIZ21PN213SmI2UWZRdnh5ZDQrdVF4NjlSM243?=
 =?utf-8?B?V0tZS21pTERvNVdqZW44YnBiLzJxMUFVWTBsSDN4UG40UjdsajM1aWx6TFdH?=
 =?utf-8?B?NWZRWmdwNHFZbDhZa0RqU0F1Y1JVcnBBUm84NFcrWk5kQm5pQkFBYWdaL1ZE?=
 =?utf-8?B?azVPUkI3VHJaK00zbktrdkpQeHlCaXlCWjh2dG5VSlFkQm8vZmVXVHR4OThk?=
 =?utf-8?B?WWtuY3FlcERudFNuUXpJQUJJY2RMNVdoaG9na2twem9MWWJ2c3ArQnBPQmEx?=
 =?utf-8?B?ZUtlQW41d3VIMWtSNHBsbkFzZy90T0hiRTBOQWg1MG5XeVA0ajdzUzZOYzRu?=
 =?utf-8?B?Mnp2RlFPSTBYNzNTVVhHMjd2cGVNNUg0MDdEMnlIaTZtUkRwdHg0SXNpeUhI?=
 =?utf-8?B?cm45TUZnNFExTFkwYkJ2Szc2L2dUUktIUnp0L2pPOGdrTGpLUzJON3pTcnVi?=
 =?utf-8?B?SUZjU2NPZytQZW4vblp6eE8zQ0tiV2JpV1QrVzJNV29YREQxbmFvRjVXSWtN?=
 =?utf-8?B?MWYyN1Z6ZEtCbXAyKytKczRsbk41UjlDWWNkakRkMVU3ZHdSdElNTU5Cb3hT?=
 =?utf-8?B?dC9uTEVtUGV5aS9qWVBUK3dweEc3NzgxZzc0UmM0OXVSeHJGL2R5azFLM0lI?=
 =?utf-8?B?NDBhdUdwZUZCMVE0TW1jekVjOU0rQjIwa3VzUSs4NWk0ZGxOMmVIQnAzRHZZ?=
 =?utf-8?B?UElBU1FyZHQwVjl3NnFRZ1Q3VWp0VkpENEJUY0tGU0xxNHVhekpEb21WcXMr?=
 =?utf-8?B?S01QNW1QRXBOVVN4Mk9Kcmlwblk0bHpPUi9INlhnVDBqK2pPMkUrWkRad2lm?=
 =?utf-8?B?cGdZYjF0c2ZIdlpIai90Sm5oQ2w2dmtqTDRvdnZ1YjFsQVhiaU9mVVhST1pw?=
 =?utf-8?B?cThGN0pwZFdSRFhFNzRLaEIzakw2YTRyMHlFN1BhRS9nRnpCUmJvM1VWSFU0?=
 =?utf-8?B?eGhZaUlyMS9WZDdUbDF2YVc4Rnk1ZEVyOFUwOUt1Vzd3MGhRT3ZtWXByVUhO?=
 =?utf-8?B?ZzgzcE9rSldQZ1huVUN6WlZwZytvdS9xVFltNWxZa2hSZDQ5OUJCTExxOHFS?=
 =?utf-8?B?bkxQWERPM3orTDBZRG1vQUlGSzYzd0ozeFRXZGFGbXNuNVdibkNkWFBQRzZi?=
 =?utf-8?B?Q21jWTlxQ2d0Y0gyRm40QVgzQUxiMjVYVmVBUEVrcjFGWGZMM0k2TkgyUUw0?=
 =?utf-8?B?VHR0WjNHeXpiYk9mUGE1b1UxSVU3MHdpT0gwMFFlTVN5bXBORk5HL2hPTXM0?=
 =?utf-8?B?MTFEUXJUUjVZSWVNcEdHcE1wTWpmOUc2SmEybmE4WEJEOUFuWjdOcVBGNzlI?=
 =?utf-8?B?U3VUbWd4QkEvRkdMTTk4UVBzdEpaNFBzUUx0NGE3VGNidk5Wc3NsRkQxTzUx?=
 =?utf-8?Q?qMIn5fYB+PgPmnChyJ33veyrbl7VpWWyM8XNz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f0bf55-6504-4e01-05dc-08defcd26104
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 02:42:43.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gixrbkV4mJpBw/jA5WD3tBlPBBxlr/Cu3reWQpeUXlaGXHTBq9J34gMfKOwebjcnrJ+GsUPV+SpvikIhy5MacYjRNSAqC1HBxvXr+3Qq4L5bAJ8ABAU661KEf4eNml9k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10028

From: Sherry Sun <sherry.sun@nxp.com>

The i.MX943-EVK has the PCIe M.2 Mechanical Key E connector to
connect wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
LPUART6 nodes through graph port/endpoint.

Since currently the M.2 driver doesn't support SD-UART interface, for the
supported SD-UART IW612 M.2 module on imx943-evk board, need to add back
the WLAN regulator and bluetooth child node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx943-evk-sdwifi.dtso      | 25 ++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts       | 55 ++++++++++++++++------
 2 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
index 59cc1c27b9b9..b95304fd60aa 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
+++ b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
@@ -6,10 +6,35 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&lpuart6 {
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&m2_connector {
+	status = "disabled";
+};
+
 &pcie0 {
 	status = "disabled";
 };
 
 &usdhc3 {
+	vmmc-supply = <&reg_usdhc3_vmmc>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 64660f94f4e9..e1f6d64d3a3f 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -77,6 +77,37 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	m2_connector: m2-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&reg_m2_pwr>;
+		w-disable1-gpios = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie0_port0_ep>;
+				};
+			};
+
+			port@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&lpuart6_ep>;
+				};
+			};
+		};
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -102,16 +133,6 @@ reg_slot_pwr: regulator-slot-pwr {
 		enable-active-high;
 	};
 
-	reg_m2_wlan: regulator-wlan {
-		compatible = "regulator-fixed";
-		regulator-name = "WLAN_EN";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_m2_pwr>;
-		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -694,8 +715,10 @@ &lpuart6 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	bluetooth {
-		compatible = "nxp,88w8987-bt";
+	port {
+		lpuart6_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
 	};
 };
 
@@ -1175,7 +1198,12 @@ &pcie0 {
 
 &pcie0_port0 {
 	reset-gpios = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
-	vpcie3v3aux-supply = <&reg_m2_wlan>;
+
+	port {
+		pcie0_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcie0_ep {
@@ -1288,7 +1316,6 @@ &usdhc3 {
 	pinctrl-1 = <&pinctrl_usdhc3>;
 	pinctrl-names = "default", "sleep";
 	bus-width = <4>;
-	vmmc-supply = <&reg_m2_wlan>;
 	mmc-pwrseq = <&usdhc3_pwrseq>;
 	keep-power-in-suspend;
 	non-removable;

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-imx943_m2-6fa2615f56a2

Best regards,
-- 
Sherry Sun <sherry.sun@nxp.com>


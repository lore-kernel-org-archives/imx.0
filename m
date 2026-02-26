Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75D36215A
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099508; cv=fail; b=RFzmfV0W5lXutAV1JmQUeYIFLo73bhkZGCCrj7hWzJoNPpEbyFoAwFa+vKU71xhXnMDFVew34FB8F9XEiROb3jvNXS+qP/OtN8ovqK/0vZhgRzGAdGnXQKv7gfjaJbAWHYv7ha2svCPrBPQaawAYfpJLai3NfRF66Kh2VyAKc/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099508; c=relaxed/simple;
	bh=KEHeqNHsEbVs8HznOCVpEnhb8kL4wIUpCErZ/LE0LsY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=FyHAYF1DLn62wg8TJNjBhFWLsvqNMDmbgxUjsOAGT5GM7LNIwQCunzzXC6paQ3bGI/edXyvNM9Fju4JxmfhsGoyyIb6oDTiluLopU6SxCuL6dmetE48chg5uresLTMNgNAHY6VEJxV6CdfCyBTAIIo/Otrl5mE0uahJqCiE8q58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jHg9dp7T; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jHg9dp7T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWgUPokYHpD42uq+gTuudbWSryi9pNFOfs5Gspe0Jr09t6LV3CAK+0bFyp6C9mqK9ij+jFcrRocphxCG1xAPVdqhsVi46FBLmWQeXmDZtas23r7yhZ23jA6kChBFn6tx3hLUoJC4VZeNCIgSC7yelEctpNySqITf/gQzuCcfeJkUELASzzaVl3b635iydLK+NVA31rgNI4LhaL/bD77oZB8iYZLbLQZ5tjPQP4LB71e7kMsVlB31H4/uZIIolGX2Bv1ZPyfddPa9KEnBGnTE+WeQqc+uude1giu9IVF18SVavqoN26h/k4OXnyxSW/FzJ6A802Ox8LoIh9UhgLbMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL15jgNU4sAR/wD3urjaTMPMrk5GJNN98sEQI/rL3j8=;
 b=IFaFtYHg+/fmxJa6Qdsg41qxCDwFTPxQadftT8GXBKHjhtzyIsS87Z+3IGVJiBWoX0UraNeMSghxvBZG3G1OUDH18xieJgKJyLE4wdokFj2jtNccAmLj7bhSU0+eKYYqr8tDDC681P4x/CP4HtzZCZLQz5UXrTUM3De14oAqMpiOsZK6MA+/mtOKXXtPHJtzOz0Pet4D5j1ZQUOetogyTUigM+HwzIKuUyuvD2hQk/tcPRIHRzEO6Cct8Cmyrdg+xeP9PREWHTfWgr1oKHdNRQYYQw7m4VMlQ6KFcXimhKrIK/c1cX8RQPnWHkvUlc07LzR925PWPqbZc7qJfFx0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL15jgNU4sAR/wD3urjaTMPMrk5GJNN98sEQI/rL3j8=;
 b=jHg9dp7T8Y5gf5Snn2PdlOccCAobZUTZpYIH7MfQpoqiX+4yT9SXkbGcxmhpe+mo4UFYbL8focQEJNPLCaWb4qTFekX2y/j6ZV5ezhz+AJFL2GsORz+pHiSKM9mFWeeLjq6+1vea/LkLAWyFgHjGS4stvjJBLz3PNYhID5qfBlLE/w5Io7p0eoql/Excofn0apzYueRAEM6qzKJst00KRAiL/jz2Fqr34VogWUGXKc4bVEP0VnL6/9/dNa1SZVu6QxlSAp4YoKwrzapQOJkGjNuuAjI9+e4wF2TefD9C25C9xWo2gWC35Xar2Vh+5HdpgSbBMbiZ8fj9UtBqdSULdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 26 Feb
 2026 09:51:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 09:51:43 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 26 Feb 2026 17:52:22 +0800
Subject: [PATCH] arm64: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx93-9x9-qsb-dpi-panel-v1-1-de51c2d2ed30@nxp.com>
X-B4-Tracking: v=1; b=H4sIANUXoGkC/x3MQQrDIBBA0auEWXfATMBirxK60HHaDKTGKAQh5
 O6RLt/i/xOqFJUKr+GEIodW3VLH+BiAF5++ghq7gQxZQ2RRf81N6JrDvQaMWTH7JCsaJhuZPYf
 whF7nIh9t//P8vq4bRWkZF2kAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b726fdf-0158-4078-9ec7-08de751ca5c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	JRK59JpLVepciqc9Dc8lFfixGwSJBpvzqEskee699DP6LPIVemzOBCNIX72rjLmYE6lIPPf5U6C6QLoxxwCOf63kz5Gbaxes4kICx1zF2kPAk8LO3jhEDzOjUS0/Aa8hBo9UcLVLQWeC11aFLkQGfQEpoLTxccUgWuvXU6AKx8REDJ1bvH0wep4TxkCGdxsTJekwJ9amH0pHXiWUKAcGmfEuXLGHb2TdejtsP54k7GCb2ZiC3nY4IBH80Ww8zEbZZ8TH/ks4LM0Ef4ew0K8HGZbahqlOIZ/sD5QOSkjn7EC6qcfzyHikKIa+4RJBGAOFsctPAGtJqDJE4cpT0+xGSOf3tItJNgpp6v0ShW0xsaejCVep8GzoZKgToio6oCiKkqQQHvAG0vyCGCniYRDhfmkgZaJ+e41fMysx/jGdK4edMDzAv9LYzUM/jftN+WEY1qwZj1KYuZOui728l6bcb4wlrrENLpZdX3MdVOC+Ak0Az34m0AC4KZir8XwjpDMaWS3FSfCniity0StwkhEdmK2jkFSyV3oAC58LsUuVSh/behQ32wq3QLgBHzSZetTV4N0ZmAhWG/WsMifNrFeubrnUk+gF0apaNLtFg2qRpH4ieuqgifWBc53V+bLljhU9ly9pqnmJY7ew5pBRW3gS+YBTRWNCXrNwHdF4Iefj2nDVHkXL10SxUUwaVmMTBnX2jxqvGF0bDskL/nzdi0EIPxybpwxYnqX0vf7qw20M35fIGkwxZA87frc18Sdrfq+nTzlIgsxhIfnO2d0NZtfTqProfj/L1evgNo1vuPh9JqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGZjMm13eldTOFhZN0lYWTFBR3phTkdRcytaRkxJMElrZTFhaHNMVk0xejE1?=
 =?utf-8?B?Qkx4Yi9ncXBEaDFTT3BWREpVVHJlamtYeWg1NTdTclBKNjZrOTVwL2paNFp6?=
 =?utf-8?B?SmRZbmRmVUEzT01XQTVKbFk2NnhXeEFCVnlGWElYS2FvSVZJbVh6L25OeTVr?=
 =?utf-8?B?TUFlcFVFbXJVTWdydXdobEFuM2lNNjBHS2dWN3JwcEkyL1ZINytkclNDODhE?=
 =?utf-8?B?c2F5ODNyNWFGNC82WGtxSitpaFRKUFVVcjFMbGZCK0E5ZnhKR29iY0RpVDJy?=
 =?utf-8?B?UE5DeDh6YkV2b3VXb1ZYMWdhcDY3eHFiVmNwcURtWFpvTGdOOTNyTU1aOFdk?=
 =?utf-8?B?UzZxNlhVbU1TZTFvUXpweEtUUEhKUjJrM0pYeHk2cW5IeWVvQUZGZkJyOEdR?=
 =?utf-8?B?REtxZS9jVVF0VjhMbTY2cWR4Y2tDM2VST1ZrTlFWS1pCOUpuMDBTbDRFc2px?=
 =?utf-8?B?dFpLVEhxV0k2ZFVRc3RzUXpiTTVTMVVtT0JKRDZXcXNBU2JtNlVGaVZhZG5W?=
 =?utf-8?B?N1llbEJXcFd5Q2g5QmgveFdySzZCdjRxOU9ldnoxanRuL0Q4QmlJd3psSkhp?=
 =?utf-8?B?MkFIdWhaM1JZZ1pvazJTN1pCL0V1YVliVDMxYktHQWNRU3JEYStQUXZnanVi?=
 =?utf-8?B?cmFGMFM1M0JTOUlhWVJLNjFkVExISkVrdGVhWjFMMnlnVTgxMkZUSExvRU5Z?=
 =?utf-8?B?c2Zyb2h6dDcyUitHZWlkbS9kZVovUCtNWHdSZnpQbDFCQnZuaFBUcG9NdnBy?=
 =?utf-8?B?T3FQTjI0VDJZaUVDZi9JVTYrVXArcW9yN29mWDBaUzlaQlBPZzkzQXowS0U5?=
 =?utf-8?B?Q29Qbmw1dUJOTlV5aXJZUkZVcEJUUkVtbS91WHluZlRvbTlTVG1oVWxTTGtP?=
 =?utf-8?B?S2V5NDB6Zk42blZGZlhIVWptQ1dQR2VsQ1hqRTg5UExZRWFBb1FKZklyVjBT?=
 =?utf-8?B?bEJjNEZLd2l2OHZTeEQrcCtUclhZTmNNVkZNamhoUDdKMEZ6emdUKzBsUkVq?=
 =?utf-8?B?T1M1TlI3dE1vRldpaVRhbVRaMnl4eVN1bVZPSVVYVS9yRDFSWERIVHhuOFdJ?=
 =?utf-8?B?SG1TT0Y4NWxvenFnYzcwaU1IN2xSb2NXdmtwbWNZSFdxaFR0UDA1WHJKd2ZY?=
 =?utf-8?B?RDdrSzlNTnk3WXlBeXh4UTFqV3ZoVWNlMnlKcG5TeUhhYWpmR2JmeG43VUJu?=
 =?utf-8?B?NWU4UDFXeklkRUxrRnFSMGhmcnB0OGhscTdsYUNVYmdUWHVNMjZwbkpwZm5F?=
 =?utf-8?B?YW40SHhaQ0pkNGpHcVVxbzNGMmF2QjlNaHVKTm95cHY2N3pQYXhwLzdxSUJG?=
 =?utf-8?B?eks4NGE2Y2UrZ003TC80aEJuSCtkcXExTjFnZThUb3Q4YmYreXVZcGIzcE91?=
 =?utf-8?B?UjFERTVSclpEN05OVTFhV0xUTnN4aGtZODhBM1diWnZzTE5hVXVrYXl6MlhJ?=
 =?utf-8?B?cmR2dGFBUHVwajZYSEZPc25MbzRYbERRdnVWVjRXcWtXYTRIdGQ3ckVHbWcz?=
 =?utf-8?B?R0ZwRjBDYTE1Wkp5Z2Q2cEVBVXViaVFWWEtxWUVGREt3U1RZRGhnZW1CYVYw?=
 =?utf-8?B?bFFUV092YzZwMFN5eFVKcnVnM0x1bTR0cFRhWVo0VXduZGgydzAwOE9kUDhF?=
 =?utf-8?B?SVUwZ2ZHdlVyZ1dxZ3RCUlN5cDIrN0N0NzAxNlVQUm01VGg2U2twQms5S0w2?=
 =?utf-8?B?ejY5QWNiUkVrV2RhdHV5MXVYMHdrV1FMZTZnblU3eWIzd2Jnak1yT3ozTjlT?=
 =?utf-8?B?azZGdUd6T1l4aEVlUm03blVIQWJDNEp3ZkM4dDlPTWJMVTNaZkQzZUFuNkk0?=
 =?utf-8?B?VnhmQW5rRFd2SFk1RWM2dThvZXluM0Z2TnRWb24veWxEQ3daMDFpU1VKM0Nm?=
 =?utf-8?B?bU9aUFhocWx0WXA3dU5DekVueEhTSi9nRlZ0VE5BU2ZYNkRSNTlIUlBIeVVt?=
 =?utf-8?B?NVA5SUIxaUpZMXRIb2JTTWE3ZnROQmZlQUhJR1NDdHRlSW9KYm9KQXlpTlJk?=
 =?utf-8?B?eVBpOS9YZUNWeFk5NzJQOENzaVRTbWtFdkxEdVdkczVpRGVZRzB4S3dXVXlR?=
 =?utf-8?B?UituTFFDMGlmSmI4Wlh3Rm5Jb29LdlBBZmNLU21zRnV2R2pRRGhCQkFWSmJ1?=
 =?utf-8?B?VXJNOFVtN0ZCWldZY0xwdTV5TFJwRmZGa1NEUkxkQkZzS3U1SGJva2xDNUs5?=
 =?utf-8?B?dGIwV0F6Q0t0SU8wdnNXL0laRytpRHNIVnlwR1NLMEw5Y04vOU5KaDFsOFRQ?=
 =?utf-8?B?Yy9PZ1JGOHpJZGtKRDRQVWlES1dWK09Lb1dmU0pjMUtpMGQxYkJMbWZBQlVH?=
 =?utf-8?B?UTlZTHFZQldlbmtQanZSNnBaZFA2V0VJMy9MN3Fhc1lMcVgzQkI5UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b726fdf-0158-4078-9ec7-08de751ca5c8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:51:43.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0IhmhhTkU2OXDWaYWYhICNQ/dyQovBCIF9gKDfaaJo3HnOPKxC+eaIK1h8Ek1WrXrxYE0T4kuaCJ1P/7z8JBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

Support ontat,kd50g21-40nt-a1 DPI panel on i.MX93 9x9 QSB.
The panel connects with the QSB board through Adafruit DPI Display
Kippah adapter board[1].

Link: https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 110 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8837d7ec4f3e..23fac57d975f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -412,8 +412,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
+imx93-9x9-qsb-ontat-kd50g21-40nt-a1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
new file mode 100644
index 000000000000..c6ad23509566
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel {
+		compatible = "ontat,kd50g21-40nt-a1";
+		backlight = <&backlight>;
+		power-supply = <&reg_rpi_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+};
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dpi_to_panel: endpoint {
+				remote-endpoint = <&panel_in>;
+				bus-width = <18>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
+			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
+			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
+			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
+			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x31e
+			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x31e
+			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x31e
+			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x31e
+			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x31e
+			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x31e
+			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x31e
+			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x31e
+			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x31e
+			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x31e
+			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
+			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
+			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
+			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
+			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
+			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
+			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
+			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&pcal6524 {
+	/*
+	 * exp-sel-hog has property 'output-low' while DT overlay doesn't
+	 * support /delete-property/. Both 'output-low' and 'output-high'
+	 * will exist under hog nodes if DT overlay file sets 'output-high'.
+	 * Workaround is to disable this hog and create new hog with
+	 * 'output-high'.
+	 */
+	exp-sel-hog {
+		status = "disabled";
+	};
+
+	exp-high-sel-hog {
+		gpio-hog;
+		gpios = <22 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+};
+
+&sai3 {
+	/* disable due to pin conflicts */
+	status = "disabled";
+};

---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260226-imx93-9x9-qsb-dpi-panel-0c26dccacbb7

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>


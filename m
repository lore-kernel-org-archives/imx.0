Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A630F7F3
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908329; cv=fail; b=MnVvk/u3TNy+5YzOEzhcdnyoPQscA6jurVwzIkdjdCDOsDtEilZN6rdffAQbpeqIhKF0zeq+nELufWpwQBs9PNs14kHxnn4jZTO2blzOF9wOP7JPJkEn5NG1h0olNqU2m7RNgKbawb5m6YOCNFGzLsCZdhUYKVscjs10iqwo2a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908329; c=relaxed/simple;
	bh=KwsgdtqIz1dpZJ7Wy20K4YQRcUnnUth6zijUZUcGbPI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N9dae3UdHtzeJvs2whRSa0UCkPW2A5uFUYM8o9+Fbh/D87waw4cx51tNp5kMrhr9a8qn7ERa7tJURYYCkR2qmt+FZ97VlpiAiOhHNRsQSMdlSOp4z9mqBQRUe65DMROpdpb0c7xxedY1XL3gd9dK7Qn6LZHDvipBLRKtS8XE0N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NpJPX+Ky; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NpJPX+Ky"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3osQLYRs1Agocl773XqAZkgRR4TByercgx7OONzdds58P68mf8pFjuIT0L7aapUSA/LIF4Mz64nxrdQ8pVBYTa0yJb/i+QePqZR3/2NJRZKptcChyHgMhZVG8uccAt03ou7hiDjfvjLrp8L4O+o5yziTXyfXtReTvE7O/w/EeNDW425s5aHWJX8S7YP5QzfzXBcMSDDGZL+MzT2fZUWRB9s1NKvyKA2MeBzHHPoqzl1KrwUBhj4iFkuLJJd9WIpG/N1DlBSI9XZ+Miad5RUslg9XT6XPpxe/0Vt+C5Kj83lBP43LzmLY9EK7Xqnljvoc9eaPC0vzFFx68cRLMhYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/UcdgTKFshYFtoKpHIBMoZo91Fo9Mo1mNkKBFRCkHw=;
 b=Qime39nVII1MhG8ovQZPQqvflYlx2Jh3PFCAQdT07irtWrWH6dPBq7AG7FtY0s68U7JilIo998gUV83DhFzlrCVs338mbTQDnvueYn5IpFwp3ILJCIaZ1fhusoAL+TqhA+tyk3kG9SrAp7j+vaY7XBhAbSQgogIGteOphSdyucQNkzVwGCH1jI9ZhBP5FDvmeABCapSQTxPiDRegWK19YI65lZofuQ2Lt3ZOFrCxenb+JjOTh2sIGHV0V+4iKa3zY6XsGMsebOexB+jMIKouheRYh4ZzKXuiHBr6Bwti+lrfnqoAWKhOH2MijSgOot5qJY1Lq5Thql3oWK/nJJVZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/UcdgTKFshYFtoKpHIBMoZo91Fo9Mo1mNkKBFRCkHw=;
 b=NpJPX+KyyrJUBSI/62ZPGz4BEX78UPg8yw9mXM2DSp3apR5VruaUAYu6WhddOK9ABQ0oCocZvqpaj6LrJtDRiOBzD2hRgYz4zacewykqhkrqV596Ngo72tAveu5hmWv0/rbW674wmhUhpRGyuXp8Dzo9wNp1YHEyYNfgiPuJ19OMPaajntQodqpn/N4/ZUZfE0+ghamtH+b58tjWUfSjwmpcOBkb3cuLwLV5jHyh9ezlwqM7Ymex7eVwJQXeDcKUepd3YKNNABnKNlAaZrrmVaUZOt8V88fiNL4ywDZyD+Xtm7XCa0ZuY5V9fxuE8FAlZQ82dzg8fzX7fU5aSwUrLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GVXPR04MB10084.eurprd04.prod.outlook.com (2603:10a6:150:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:18:43 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:18:40 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 19 Mar 2026 16:18:50 +0800
Subject: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GVXPR04MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: d286626a-cc3b-404a-6590-08de8590207b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|19092799006|1800799024|376014|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tZqTTHhCSRjQU/lvKYn5yixjgb+10d4CJRUnH01uADoAJKJ0Vg+tfbr2B2fqmRYySInJRSM+VlhDoYXaPivp5FoLOvNPi8rJSg1gJgAwTsQfZl+dAfckGz+NVpUmUYe9DXjQwU6Qw0hB3ljJu51UOUQAmGrqS1dPCVdN4mplC8DZmUc6CTYJ8e5lZZ1aRpTG8qvmPTSM8L//LgXsXekEDnuedjGlXG6/d1zFO37vzMmvl/BoxLGYDoFAaLY1pX+HjZ0wxLieC7mwZOiJVWY0HiB/+jZf1MN6MZvushgbnFsJ1N6lopKIwaB6i3R4wzzR5o40jx3Xg7bOY0UTkgzNfHRF0q9/u8UCFR2UjtdL2s3KBY8/OOBzSFOg4bY7Sd5hR+xX4vo3EL9c9UjNUzERoNHNvvDzfRRKLhfBNjTQmgZtsC9ZO1XXqukXEnbzIoeXsiybi8Ga+P5kiJhDP7jheWCxtkMw+wTSPUOcm+2Nh86aU/Bu+5hvw5/X/wJwdp/0vm3iMEgBLbzFbAauHj8u0Fwo1rgbRHeIPwp0KrrP3R9oqnNr2zeYw2kV6lCS0UOHLfa8wnOUHYuIHVJC9FjASzYQ+oMlq3wSyVm6dRIECY66g4S55PsSQkTjuEH2Fvki4ThYj+hel+rGMAQQup7V7XE/XeZC7Eyh3ei3HhImrdL58l+j2ZqP/tEkppDttiSr/S/e+rX/nkZOcqgH9vHVW+CVUxikN6gSH9IQoGEGgKsRFTz/OCMNwrwEr6Kc+2kcWuOj/xIvQOop+T8TxLnIkRu4BC0C7bJEg1F40IiJU4Jbhn5nl9+BZoi/50E1qOxi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(19092799006)(1800799024)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWRoSWVqRkhKa3BDTXc2d3VhbVlBTDI1eXFjWnE4cGllWmJIa1ZicSs5dU1z?=
 =?utf-8?B?QXpSTy9kaDZib2NPT2N6ZEhtamRycklDMmYxL0FLSk45eVQ0aVNIV2xmVnVO?=
 =?utf-8?B?bkJtRkNISHo3Z1p0NXVQK1p0aGxNRU1tbDEzNXg5eTVJdVdNREhCcWhvU2Vr?=
 =?utf-8?B?VmJLNzJ3Z1NVK3RJdWxleUZIWTJSWlpxSW5xYmVGUVl3cmpnZWJxQkdGMlp0?=
 =?utf-8?B?dkFwdm9vTiszNUIrRUhJTksyTndPdDVQZ0J1bTM1ZHdobWdkNEsxYjdkRUwz?=
 =?utf-8?B?U0RaM3AwVEloTjZhYWFtUnd2NzFuOUgyZ2I3QTNDRkJ3UCszbVBraXpyMFpE?=
 =?utf-8?B?M3A0ZDF2UGVoQTRqU0ZXWDJQSkE0YXdDSDZ5ZHovdXJBa29rV09zT3kxK29D?=
 =?utf-8?B?dC8xUjA0ZDVianJ1VXZnZFlOdHNHd0xpa05uYmFpTzl2WlBmdEVFc2FzNXFC?=
 =?utf-8?B?R3BMU3doS2ZYNmg0RklLWmoyZkVTYWNYYTUvdDNUY0RJZVo3Y3ZxRk1Rc0xW?=
 =?utf-8?B?ak1IeXVnNFlUTGl5dXZlM2d3bGRQTmZOSU9DWXZVVitpNGZKNlFRZnRFR3FJ?=
 =?utf-8?B?NTU0a0d1elcyWkkxRlZLcElMVlRjYlpCVS9UVnlsZXJCOWR2ZDN3Um9VRlFO?=
 =?utf-8?B?ZVRTZkVneWwwdXJUM21ocmFsc2o1RUc4N25RSXU3MFNSWUJTRzFBS1dqZkl5?=
 =?utf-8?B?R2FpdkFzQ01oOGQwT3duMGNVTDEvaU5TSmdKU092OTNxQ3d5eUE4ZVZjYUZl?=
 =?utf-8?B?K2JJR2N4cGZTOGRZVkhaamxnLzdxTGdPZDVEZVVXOWkzUmtzdWZ5aUF0b3dU?=
 =?utf-8?B?MENQbmJIcmYrd2dUcldod2poQ1orTGFkRHVZaGRock5SVVF0MXo2S0tJWWph?=
 =?utf-8?B?QU03TGY2OW9lbjg1dDBaK2tsTnNwVjhjQnMxR0Vycjl0OUVMby9LYlNXWDVo?=
 =?utf-8?B?V0pTc01TdDVpY0ZOVDY5K1hUWDV5TDZXNWY4VVoxY2VpZDRNV3ljaG9JTnA3?=
 =?utf-8?B?ZEJYSjZpVjlDOUQxN2U1RTdmTFlTNjg1MkxyWUpJNmp6NkY2aUFEREV0dEtD?=
 =?utf-8?B?Nm5PRDk4SUhOcit2WmdGcjJYeE8wTkovM3d2TGZlSXcrRDdqNURmb0xYTDdD?=
 =?utf-8?B?Q1VOaWRzbVBPOHVMNjhJS01IdDR2Ky9wdDhGb1BsdXk1c09tdjdsSWRwNnVB?=
 =?utf-8?B?UklhZDVaWTExNUViT3k1MkJpbkpzTm5mRGpob3QwalF3SWljd2c0cXQ0QmtE?=
 =?utf-8?B?RjdFbU9TTzJ6aHAzWnRQaERhSWs5UTk3dXVkOWdsdEtsSDhEOU1WN3NML1Nk?=
 =?utf-8?B?MnUvc3hZNWcyMG5TY0FDSGFFUHlTSW5scFpLN09aOE1DTDFSdCtrd3VXRzhz?=
 =?utf-8?B?anp3S0VmTm55TDlBZ1hKNWRzVDU0Q21HcDBCa0hmcEpJQSs2d2hWdTd5Z05z?=
 =?utf-8?B?UWNKYVJEelZITStoMHFDN3BqSHVIQmVQMGUvTmFpLzY5b0c4dE4vdXdsRVRN?=
 =?utf-8?B?SzJMQmtJd21FL29kbHFxci9MWis0ai9UZnRLK1Y1YmlMV2RGNW5pcTNObVNH?=
 =?utf-8?B?azlOaTNkc3ZDVHNwaXpqSWxzL1RleC9QdUZnRjhKMnpwMndxRWJhd3dXdUlM?=
 =?utf-8?B?UEV0YjRteUEzYzNGalZlYzE0OGNWT0JwVzRMMmw5WkxRZkF6VVkwRTRQTjNE?=
 =?utf-8?B?ZUVNZXlXRFpXVHpsbjl2UGJUdERFeFhEUmtiL3JhNm5ZRkg2b29obmhZdkRw?=
 =?utf-8?B?RWljVWVaanhMZDhRbmlQNDhqSHdqZVYyU29IeHRnWE9LRit0K0VSRFVJZzBa?=
 =?utf-8?B?VDFidDVoL1prNnE2Q1JCL0wyc3QzMTlNeWxQWElQOWlwNUJtbmJEWXlKMUFa?=
 =?utf-8?B?OTRZNS9ONTBiNmhIdlBYbUtwL3dveVpadzNQM1hWcTBvczJuVXlZVDJHckEy?=
 =?utf-8?B?QUdYMHN1TFpucFpuaFl4Z1lIUTB5SDhyRHFrTE81U3drU0k3bWgyaDBBeFlQ?=
 =?utf-8?B?ZGQvUGo3cWN6eHA1ZXVFRFFCdW1zeThvemlOejB0QmNzNHIreERiRFpZSy9m?=
 =?utf-8?B?V0hWbVNWTTd1Y0JvRTdXK1hVWnlNZ3dYQVY4RmYrYmwxYUczUFEyTGZDWmJl?=
 =?utf-8?B?TWQyV1hvQy93WEdKR0c4ckJlaW5GZmpYVjZrU0R0ZE90MG10Ynl0TlR6V3pM?=
 =?utf-8?B?UmlCR29EYkp2SnhFUWFjditudUkwaWVkYW43T242WXRNVFZCTU9ESVVmbGRi?=
 =?utf-8?B?VnBTVytRbGthYXpZaG1ZUk9PQm51RXhMd25COG9MdkJxM3pQNVFNbXdhdHZY?=
 =?utf-8?B?M0dEOWxMVWFzNTl0L0t0a1NQbDIwS0ZYSDNiSUR0dnNML1IxWlY5Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d286626a-cc3b-404a-6590-08de8590207b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:18:40.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKdWu9ul/L0fZh2YJxid/O5HBW48HnaUgAMyjwWs66y5tg0f+FXHjgHZWhTbII2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10084

Add i.MX91 9x9 Quick Start Board support.
- Enable ADC1.
- Enable lpuart1.
- Enable network eqos.
- Enable I2C bus and children nodes under I2C bus.
- Enable USB and related nodes.
- Enable uSDHC1 and uSDHC2.
- Enable Watchdog3.

The board description can refer to the following link:
https://www.nxp.com/design/design-center/development-boards-and-designs/IMX91QSB

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile          |   1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 425 ++++++++++++++++++++++++
 2 files changed, 426 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6d33a6929d7c6b3f8c1a70911c5d0..382094fa220ab6c388d182be179a82eefed74b45 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -412,6 +412,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
new file mode 100644
index 0000000000000000000000000000000000000000..824bc9820cfda4f323350803f27dcf7fcd83d8d3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx91.dtsi"
+
+/ {
+	compatible = "fsl,imx91-9x9-qsb", "fsl,imx91";
+	model = "NXP i.MX91 9x9 Quick Start Board";
+
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__LPI2C1_SCL                           0x40000b9e
+			MX91_PAD_I2C1_SDA__LPI2C1_SDA                           0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX91_PAD_I2C2_SCL__LPI2C2_SCL                           0x40000b9e
+			MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26                          0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
+			MX91_PAD_UART1_TXD__LPUART1_TX                          0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x1382
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4                        0x1382
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5                        0x1382
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x1382
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x1382
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x138e
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4                        0x138e
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5                        0x138e
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x138e
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x138e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x13fe
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4                        0x13fe
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5                        0x13fe
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x13fe
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x13fe
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x1582
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x1382
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x1382
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x1382
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x1382
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x1382
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x158e
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x138e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x138e
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x15fe
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x13fe
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x13fe
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x13fe
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x13fe
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x13fe
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	p3t1085: temperature-sensor@48 {
+		compatible = "nxp,p3t1085";
+		reg = <0x48>;
+	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			op-sink-microwatt = <15000000>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	pcf2131: rtc@53 {
+			compatible = "nxp,pcf2131";
+			reg = <0x53>;
+			interrupt-parent = <&pcal6524>;
+			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio3>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+	};
+
+	pmic@32 {
+		compatible = "nxp,pf9453";
+		reg = <0x32>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1140000>;
+				regulator-min-microvolt = <1060000>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <610000>;
+				regulator-ramp-delay = <12500>;
+			};
+
+			buck3: BUCK3 {
+				regulator-name = "BUCK3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3450000>;
+				regulator-min-microvolt = <1650000>;
+			};
+
+			buck4: BUCK4{
+				regulator-name = "BUCK4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3450000>;
+				regulator-min-microvolt = <1650000>;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1650000>;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1890000>;
+				regulator-min-microvolt = <760000>;
+			};
+
+			ldo_snvs: LDO-SNVS {
+				regulator-name = "LDO-SNVS";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1950000>;
+				regulator-min-microvolt = <1650000>;
+			};
+		};
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usbotg1 {
+	adp-disable;
+	disable-over-current;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};

-- 
2.37.1


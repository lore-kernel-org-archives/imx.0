Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020085.outbound.protection.outlook.com [52.101.69.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C1D314B77
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927257; cv=fail; b=Aa5AjiIguYTTXaE2CRul+Bb3fdzUphS5CDyyEBGy7h6nPkwJRNRgUEzYrmPz7LCOLWxM3cfzhHZr7RLm1beiPioR4r5R/VGoNK4+27Qxr7xb6+q70x2OsIZUnZTrjaRIxshVEzG6N6l/ybtBSkONrTS6rHhuHm1QpPAP8g+ubow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927257; c=relaxed/simple;
	bh=J6/oh0oWnRzLpqvBz23hs0LlkOeOFAFMH6THDZH/lCY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Wem57mQYhP9LaAv54203SxMcrMHAnrAy145huDgO2Mo5xXm1vRSrZ77nX79sJr+ZV+b5l6/1cAlouM9pk60QpqFz/MEDgl46doy9D5HlSKJgYZ5RfztWQ2K0CRxVdXy/T3koX1hcfKvSrajtg88oe/WKSahNNCxViyMz2y27DyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=mzfEtkGo; arc=fail smtp.client-ip=52.101.69.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="mzfEtkGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOxVB/8yzJmFy2WVkSVImKJWEIv2QWGRySFGbPAfdQBYRQ9O6Ox/eDU9J9Q/87SLeyVV8MfCdKOdDzwLmLzKgQ8nxD5KpK3Ynzgak8fxKYQ4ZZYjTy3SBOf6eyfkgMNl093eT03he+wGITpnlkRxppKrnZa1J366+yfcrE/wwcaw1lrFWcPCl8d3ZEFKFF6B2TR+21WBs7uZ7zRXvDnqMpYj/0a10SXTEQLBph3wn+eJYihihMSMfguXjHf1XjPtdRC0tgF7Sz2gOe0R3YY4XTihVv26oQQPG6aPG0KAwNzFB8PBVJ95PJoIYRzLcQOKa7M+FyiH3AsElRLF9ggYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mor7Ci4usa3wymcPY5IbgrE1iZVModNRxDU6ll0wMFM=;
 b=xH0pYR/S/QxPpVJhNSnnvdHUmrLY0+ccslpEqfXoMSDp4dz2bBm9MC6KVBmaMo/xQFnMuE5ipmhpg6Utve2rkA5IXRPMcLrSKWP5Lsjvoypc30hYcTnqEVDLTh068zpEV6mDzrS06q2EWcRtWXWCge7X21lCeCkM2rdHUPCcHNmeWl7XOUny5m3izOAwr6xhphzfToGqD1IDwVyN68huZdHpLlOTCluQOJETvkW9Cxw4rJ07TpiJOxPYBBOojW9RIChO82md3OEVGqk2+rSbintZGCSUEbzVQA2oju0iWGaNl5qum/nSgzc/naDM/AetIfXLEd5gDpJSb4M2hVqKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mor7Ci4usa3wymcPY5IbgrE1iZVModNRxDU6ll0wMFM=;
 b=mzfEtkGoJstLlI3MAyGbyjbCMtuFVqifkKSLKaG3XTeJV0GKjYcaMOVNJzVzI5wfP1v432qsnSnw9DPOKUW272JMsrT/3bRW5U6uJ7+4c2x9IlhOckSNxmW2mFrSP+Mx2aRKdFLcQqVbMGbENZDnw06u7AizYUviEPHwHadGAUor5oN11e0Zj0+PidssapQ1008clyRvyrChbeUA1BUax5ISuhEqxATZLx4e2ZBO9jp0i+DdrIvqg97GawlON1pI+j0lpJj0OWVwufqGXUMWtB1l7IN2XKo3CyoCxGKKQPerRnfn+dWfaOtldRW47VaRjDSNGXyqtUkUm+9371V8Jw==
Received: from DU7P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::27)
 by AS8P195MB2123.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:56a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 09:34:01 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::63) by DU7P191CA0014.outlook.office365.com
 (2603:10a6:10:54e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 09:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 09:34:01 +0000
Received: from llp-moog.phytec.de (172.25.32.61) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 5 Dec
 2025 10:34:00 +0100
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH v2 0/4] arm64: dts: additions for imx8mp-phyboard-pollux
Date: Fri, 5 Dec 2025 10:33:24 +0100
Message-ID: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSmMmkC/22NzQ7CIBCEX6XZs2sARbEn38P0QGEre+hPgDRtm
 r672Hj0+E1mvtkgUWRKUFcbRJo58TgUUKcKXLDDm5B9YVBCaSnkFblfTD+hzwmt95xLP6GRnXX
 irgVdHJTpFKnj5dC+msKBUx7jerzM8pv+hEr8F84SBZJ9WKdvWrWmfU5hzeTOnqDZ9/0DBegoQ
 LgAAAA=
X-Change-ID: 20251014-imx8mp-dts-additions-81fac0750e3c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>, Yannic Moog
	<y.moog@phytec.de>, Stefan Riedmueller <s.riedmueller@phytec.de>, "Teresa
 Remmet" <t.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764927240; l=1264;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=J6/oh0oWnRzLpqvBz23hs0LlkOeOFAFMH6THDZH/lCY=;
 b=uIhhSJev7qSccLtOGHoHMyJz+HpQlyT0fRXMI4HPUOA+9qZ+4FrwEiyJaluAQ+Jl0anYmak6O
 Ic8karl1DRsDbykA/5ehtGuJ8DLQN2ePlTGVMWNWI66cHzeWZZJY51A
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|AS8P195MB2123:EE_
X-MS-Office365-Filtering-Correlation-Id: 91dfacc8-1259-4e2e-4044-08de33e16c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmZNNUhTcm52L0NzL3k0NUR3RG8vQ1BodTJvcmdOWjlaUE1aRlpJb3RPT0xX?=
 =?utf-8?B?QUt4SnJBZndDM1dVc1BZRzBVSDRpcCtSWmdNaGpISFIwS2NGNFRmb2ZCdy9I?=
 =?utf-8?B?Y0FhdzRRTjZBcHBxSlVxZ2szaEJvdlFqMnZCaS95dVd5VmhUQjlsRlNlUXpr?=
 =?utf-8?B?N3d0QkFWWkhKRE5jUXF4MzlYSUd6dW1qay9DZzdiMktuUXVqT29uNkViY0FO?=
 =?utf-8?B?Uy9CWDcxOVdhamxUL3JNSWM1VVJFZEJqVVpFU0NLWnlUZzNlY0x2Nys2UDF4?=
 =?utf-8?B?U21lcnFIWUp1Q0dUTGRPanpEOHYzbDUrR1ZlaG1PNnUwS0hhdjNnM0Q5QzdD?=
 =?utf-8?B?VDFFWXZHSXJiRXk3RFNUQWZscXAwTUtReEhPTXduNHlnM082cU1vSDJuSElW?=
 =?utf-8?B?SWovMkVvakpqSWNNUk5rM2ZySXpLMFFueGxITDBYbGMrcjNsRjl3dmFCcDhv?=
 =?utf-8?B?V2s3ejRXY1lOL0JEUWFhdDlGTjFoVFRaMnVxOWlOZFhpcHN4UUFlbFhMYTdD?=
 =?utf-8?B?RGlzUFpFaE9OS0p3VVBCMFVhUW5XalRnNWsyRDZRUGtvQnlGMGttMTFpS3dD?=
 =?utf-8?B?UWQ1bnNNdWFaOG1pUThYaVI4RmZFb1NqWlZtenQySWVWYmppU3o4eU9KZXFa?=
 =?utf-8?B?Q1krNWdqOTNCbkowbktDUDIrOTNtb1JuWTRTbW5BZ3dUdmthZzZKM3hBb0ZK?=
 =?utf-8?B?OVB4elJ3TlJZMi9HY3FqR3gyWWVVVmZHM2dkRm1HeFdXKzJjRW5nM2RmSVpD?=
 =?utf-8?B?VlV0ZEN2SUlQQWQ1WStpdmQrWFZ2VnNWaUlMUnlZY3NiV0R3bmxpSldvTVB1?=
 =?utf-8?B?NjJHdXMya2EvZmQ4V1M1WmNKdThpTFZZT3haNVNjc0ZJWWxpeFB4aWYvUGg5?=
 =?utf-8?B?Z3Z4eUVBTTV4a2xFVU5na3RtcEZqYXpRdkU3aHJpMDkwci91VjJXSzRlcTZW?=
 =?utf-8?B?a1R4ODhkQ2JaNVBpNWJvMEg4SWJ0ZW41emllYVVGNzN1RFo4MjdlSDhZcHBY?=
 =?utf-8?B?NTEreHU1Y3p4dTNaOGZtYnNqL1lya1JMZ0trZWhMdnVEWUVWTEJGNnJHaWwz?=
 =?utf-8?B?Z0JEK3FIclVBTWVncVUwQWI5RWVYM2dhUWFZR0YyMVBJMi8rUXZMSmRSVDEw?=
 =?utf-8?B?aG11VkdQOG5HNU5sUkZTRmZQeEt0a3hXR0xESkFiRkpNWnE1R0RuUmJrRi9Q?=
 =?utf-8?B?L2l2SHpXblhvWit5UzBzME94MzdkVExHU3BQcU56K05OS3MvYUdIRjNvQnVa?=
 =?utf-8?B?OWJXdVV2SGN2TTVJVGF4WllPT2F3L3Z3L2VQV2VKeVlvbGc4bDJBTHU2QTJ1?=
 =?utf-8?B?c2M5aDVSRk9OMkQrK1VDckZHZXVmbldZT0FBaFF4NVdka2hiUFI0YjMzcjFI?=
 =?utf-8?B?TW9OMHkwR04yRThlQmtrbHlyK1RLZ1dDQ0ZXYklINHh6QXAvMTJ0b05qRDV2?=
 =?utf-8?B?NWVGNFZTNnk5TjdveXQzZmlHY0laaDk5ZWxjS25vYmZPSFY3NG1pTHhQaW1o?=
 =?utf-8?B?d1luZzJlQjVlQjdkMUwzNWJNSkhQclNya08vdnk5VGRjYnYxMVh4eUZMNzRv?=
 =?utf-8?B?ZmpMVnp0eHNMMUpxMlNHZ3QwTTdxUVo1cjRIc3Z6OW5OWTNDeFFLcFBnbWsw?=
 =?utf-8?B?NWZ2eGM4WXJBTlFzWTR1dVNwdWlDTmNndWMrcXFZYUtaa3k5SXM3b254UXVO?=
 =?utf-8?B?M0srbDRvYVdoWVdUZ1poUEsxaEdDQ1lheXlvNi9jTTRmeUYxYStVMHlKMDAr?=
 =?utf-8?B?YkZ3RUpmYy83MnVTQ2hqaXZxeVAvOVdia1h2Um9ZeGJESllQd2ZBRWlmZ3Qw?=
 =?utf-8?B?ZGZFT2NQcDVpblprQXNxdDMwcHVDNmNDREhXdWlrNWs2Z3QvVWJKbjdNVXZo?=
 =?utf-8?B?K01xT0hTeHBZdjlaUVdvcTh1cStqNXJkZkNteWNZclBrU3lMcDFBc0xYVmlX?=
 =?utf-8?B?WnBuSEh1WWxRU3h3bnBXRWNmTEZ1d29GcmhIRWVNTXh3QVFCVWhIb1BtQzlW?=
 =?utf-8?B?ZDFNbnl4WDMrUzBHQmVHSEc4OUp3b0pKTEZRRHN2RWg3OEZzdkpvR3JWVERM?=
 =?utf-8?B?c28yRS9RemtUTzNnK2VMMk95eEczVzZJaTlUbit1T2VrV0MxTU05YjFPYVF6?=
 =?utf-8?Q?vyJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:34:01.2489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dfacc8-1259-4e2e-4044-08de33e16c71
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2123

This series adds missing miscellaneous hardware description to the
respective device tree files as well as a bluetooth/wifi expansion
board.

- i2c3 (basis for camera overlays)
- missing supply voltages
- PEB-WLBT-05 expansion board

---
Changes in v2:
- improved wording of i2c3 commit description
- removed regulator-always-on and regulator-boot-on properties
- rebased
- Link to v1: https://lore.kernel.org/r/20251020-imx8mp-dts-additions-v1-0-ea9ac5652b8b@phytec.de

---
Stefan Riedmueller (1):
      arm64: dts: imx8mp-phyboard-pollux: Enable i2c3

Yannic Moog (3):
      arm64: dts: imx8mp-phyboard-pollux: add fan-supply
      arm64: dts: imx8mp-phycore-som: add spi-nor supply vcc
      arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-05 expansion board

 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 .../imx8mp-phyboard-pollux-peb-wlbt-05.dtso        | 108 +++++++++++++++++++++
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  31 ++++++
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   8 ++
 4 files changed, 150 insertions(+)
---
base-commit: 89d95dbad2a3857f06cb6002566bbdcbe53bbfef
change-id: 20251014-imx8mp-dts-additions-81fac0750e3c

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


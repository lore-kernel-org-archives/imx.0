Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078825;
	b=bxz9wCmy4cD6+s1ByHFvDqrqpBxVqsuqqBZfu7cmU0MogLBbCw0S2jLRSc6SP+HCqHPN
	 +vSB71jpIN6jX9Wl0CdFGcrBm1tHQReX9pT0ZiYShc2173oa7F2smME7CgtgH1ZiUoLh3
	 PFX5mhg9xoHFlBiLHMsTU+Tpb1pbtIglb++NOz5fe7X4ePDc73DQ8vYzrUOt/XYhKnyj2
	 i1lkzaf/JLFKIgOEHyzPJ6A0RNmj+RcBBPDeJApmaUi/XOIgpwGVOrpCZmj5Y8ErgkNoN
	 jfb6xd6j194eHaGqSemBq83ElQcEWq5Rtgrrdgt/r/oN/nRnKkrtUCW/A84E30F2qpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078825;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9x6azF/TEEwtkL+UWFpDILVycU2Ix6li8u9TRnODd8Q=;
	b=JkaguAwFAl1ChcxlVsRUA5UoCxvhZMKlcwGEZa3OKClnkctRYII1PaFAsfuqlP4vHo3p
	 L9wymF02l7PRDLPKPL2qhI7fsqBJwqK5AV9ajp/vt9QHgtPfe6ZDmNRbRRD8Hp8mTXWPH
	 3ovcBxPMOAeZxercYW0JS8bTBrBTXQFXMN9Hq2aLGy57ryK7gq2cGAtlJbUOKaZVEcwaf
	 u4+zz9B3qxGDNNLFOyObsZOFxQ0bkek9aBk7JJkaas+GrTSQ6Tm2izINy20uvLBDNAPFw
	 WGFf9YNOm5igt6bBhtaRCqDZ/1GUUJ7A9r9C2MTAleyOWtcAHnqrYW0V9lMQShtBOZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=tKa2Y+fx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022123.outbound.protection.outlook.com [40.107.43.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD8606A330
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBD8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=tKa2Y+fx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wT4khR+tLpCYfKNv48arK5F2ItxgMvx+f53glQiNo5MnOWmfLfC/phXN5YwrYsSbRAusJXogByYn37ncZnREMyLK6G42nbQIRQi89kJkk7Taum6Eywi1WPwIQf1Pj3XwTC1E2af5dsfL+WZBYX1d3gIycWKTO4Ze8t3k8yzX0232E3sjqqkrYfJD8taDqTg2jX+K5t6AIf/Wl61U280HkXUd1v8Y33NDV4lTbBXU6lwqDI0/zBXRE+6hPAiQpMK2XBDirPpGSwbCSlvZhE+UpesTY6qNfqPDiUSEsgrjRAujOneVdTuQr9w23C+sqfoo0sfAMVockw1ROenTYSh0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x6azF/TEEwtkL+UWFpDILVycU2Ix6li8u9TRnODd8Q=;
 b=s9McemnstwM5ge0MCCT5GLXZlCcBijZbY7O0Q9GTajg9ChNioNDAgoempawK8w9F1HbvOluwhjAWYnz1S3jHUkm2yp+0aW92KPNWDhTALTDbbuH0YdVFFAZ+4B4bz6FWvWDDW3ympj3CptVyP4I9RwkRuYYZGQZoAayDSa85DgVfEd23oLqwTrx7fTeJSYehGMox7PkAt5/biEhelu81g/aYBRntBKSqRg4trF2YC15XnOdCN4FhYSDQQ/iWwjuBLyzlKUfSN97AkGap9/fe4cZ++wD23kxs4ZUTfohaR5klhIPxqduWC32dYW1Dl2DL1EVDO/Vlfi9bNuQ7CeMvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x6azF/TEEwtkL+UWFpDILVycU2Ix6li8u9TRnODd8Q=;
 b=tKa2Y+fxjGznWwaUJd6HcWfh3e4TxliLGqFJ6kZv/1GZ8QqNmn3BJPHhXtzX6WDmEq6gBC8uz8pn+q2TBSDmJBJx2zsdnziTP0NV4lDlqBSLgBBMH1TtNM2QooydO3DuPZLd59rtMkpbb1hEQAnO6ysLQYjrptM5AoBVYS2I9OS62EayZV617tgmYnu48Gg3J4RojBEpy26pJf7c4GXwZcKqe1GpxPFMT9F4dpwpbUTlABMsN7m/NTW0A0mNOn7OjTWx153xCdpGulHSPsR2EoidM4Ij9MUO2v1c7JS4ozmkzIZMBy9Xqia3hnHDxt9Ph8uDHs/6FipnJ95EYgAHtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB360180.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:20 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:20 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	kernel@pengutronix.de,
	nicolas.dufresne@collabora.com,
	ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 01/11] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Thu, 19 Nov 2026 17:59:55 +0900
Message-Id: <c2e396f6e1cca0bfe2443b0c4f5b90b4c7210ee3.1795075580.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795075577.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SE2P216MB360180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a57f788-2f01-461b-30a2-08df461b8a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	2efRCdCL6KjDXYUUzZGiqE5shnDBERnzb3U7B8XjcE02R1BVSLl5jkYcnKDsrEUqp1k3i2XBg8WOy9Ptn1ykP9yM1edPLhgWr8BJy9aqmPP7081mVvhGPMGvNcS/MYPYqAO/jzqRWBubaH1jI7QAKp0zaf1GpSd4EpANruBQx6/IwJmpWi2B7m4m1Iym5pKydYrhxA3fwJ/BufinrACRxxiCb1rgdEVgpq36uRP+nNm++KsisQs26EJ8t4g5K/lGQq5EzdU4/i92qEz1m77LOagaUvRq6E43QLt5t+mYRG3K5rZw3EhGvLwqhbFr9VEDUB+l738uzSU7S2thwkTPYnGCZaFk/8kTLJ3Jcdm6jTxk3c4pCNqXhScWfmPhXN1uYZ77p/xt0mTje9GVXJzscsakw+Ouz3q8a6uH7STYUsz+BJuhk+mJ1F/8aVCtun2vOqLO7dZyk68gnvvLNOMBVVUf+VGtD6ptzDXszp8Y3sYAi4zZ+4WVrHBKz4fmjyFtFnBhiFVztJ56Nd4gbxljgoj5QJpXtZhIuWAQzzCgUNNWc+INYlp/19RGfRvJkyivi9NUMVVLH4mapKC0GOjVCLuzU04pit0kntz3xw1QqRhOoi64kqvcxJdjj1/ka64eQnkPvvTvQf/QAR+hmobKYBhRH01J47hzIiWm6ktqY1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SbltywDJsC++esOT5L5LeIPOzeLR7jQaEZcaCeNkXvlzvH0KeQGhcDtJ0pYC?=
 =?us-ascii?Q?AsJJCA0TPPHJauuAYCMNHWt2BjOZK+pIRYvRXMmEGeh3CLwtzOxn+wGBxITw?=
 =?us-ascii?Q?NwndR2icB+wl1+ldnV2lgMm418Db7si5yCQn8CyxlNNUGfEnFOe2ABhZCVZ3?=
 =?us-ascii?Q?C+NN6LgfQawyrGGmqrWgujLl2JE4tsrxvd9p0Ewi5ELTnQJs9Rwgy+xC0wr7?=
 =?us-ascii?Q?5UrhPDIL2GNoroNtAHRMh7y/UEL06+2BlHXgJK7sCKn8dYsXt5dw58FJ5+FT?=
 =?us-ascii?Q?B5KTHo36fSTD4zzjc/XMT/bIfDxQAYvVAnrx51mdwvYfBS+YAI76TX8T5wet?=
 =?us-ascii?Q?eGteKFJNgXST7nbQCdeAmrmfQE+O4nYOlkOGH/5AKSaPM+hbzMxB2JPVG8yX?=
 =?us-ascii?Q?i7loGeDORruqxTME2+MvRD5x/RhT2WM9ZE7VBSAp6BbvLLpjU654oTt+ss8e?=
 =?us-ascii?Q?baYyD7Zh5uIQbFLeWhq9WS7D0/6lEnE661iXQv121LOW6duVcSbpDvyHLZoI?=
 =?us-ascii?Q?mpHOpbVVSYAIjG5fZzl8XzQ8k1XzKdhl6c8HbHR3GTQuWp9OXSuDYqtaIXiy?=
 =?us-ascii?Q?krHMNib242mBAfxLWjEq8YZZY9L/iSDhSy+1j5HUV3gIhCjQ26tq6tV1XqNv?=
 =?us-ascii?Q?kRqEaRQtyEJ0FFXbBTlioxlXbjacPPlroTUBFFSJbuj3mldtSlLMTEHM+8a+?=
 =?us-ascii?Q?04PYV2SQlwCp88gGW4f0GY3hVnzskue4NwxOBNuTZJQ0iFpQu0YjXR2VHyfq?=
 =?us-ascii?Q?ajzo/1CZwX74YDjs+ZVhEQ+n1nCZfwhfj9n7q92PPhYx/7RoAh8QhTA41W6n?=
 =?us-ascii?Q?7uKQu5vL6NclJeo68BtV2Ew1kashphHxQgY48tujL/HT+KaufLP0Om9agwYb?=
 =?us-ascii?Q?/pT26oqw0fwoh89OE4Q/EpoOp8otWiLjBHPDzTjO5PBFaa18STB/HKc+s/Rh?=
 =?us-ascii?Q?HZdYGUGeRWxHScAo2j4PLquMLLzVmH6WGVTQVSLqGUqojhV/2fADCPTO1XZw?=
 =?us-ascii?Q?hr+SGCphM343yoQO6gdWRvaZ0OM2O9Kb/HSuW3dH5ZonPdUdU01UCG4LMq0O?=
 =?us-ascii?Q?tSqjo7g58vEckxvXnjXZ+1yGFPDi6JWG2nkW+VrpnRiArdgTpPjcusiOCnzf?=
 =?us-ascii?Q?2akPy2knQF4Hm91FfLzPqtC0AZgzkHV51ni55S74iRl2ueFdVqXD4gwMrch2?=
 =?us-ascii?Q?3TvpSg1JhQf+ZFwY5RJwWFdf5qPEHh0PiA5CtrPKj2hpMwDlyrw7JBgnzqlF?=
 =?us-ascii?Q?8ZN4UOoOrcrW2UYlQRe9/FVVMLqwke1pBezrwV/31ympx7SQ0DOwu2f1uaUJ?=
 =?us-ascii?Q?z1N3WzegQCR5TPLwLwzuQbyZxF2cfCr2w5Un37TWTPXCs+Vetc0UuCl1sVJP?=
 =?us-ascii?Q?Cej96mLA/L0ASxi11b15c7Ycdmbm7e7CC2GlH3AoUt/tok444gU1FeN+gp/q?=
 =?us-ascii?Q?qzW6EI2g41uOkkSny519Hw9dVVuVwSj0TDGwXmpsqjAfss7K9fSL0NxkD+kc?=
 =?us-ascii?Q?m0CQWL4d6ZJa7mMShP0kqk09CwaZXZcG+/TtwOVtYwkRGnJHfphwTzxitKad?=
 =?us-ascii?Q?QsO45KozNDwhTnWvJcqA8CdlhYWkKvMLeavCurvrSrTKG1K26VBwS6sxb0zN?=
 =?us-ascii?Q?lpEp+JJjrN0bIRWbMb1YvjGttgdmoWzE3P17GO6jIak80D8t8X1SA7VOTJ08?=
 =?us-ascii?Q?HekYlQ+oP+m/GoMxkGHx6kT5wXXwsEiIf5WpDejpFNg4SQ7p+ZHmsPM5VfI0?=
 =?us-ascii?Q?JxGznBsnn9oyojQ2Sqrm/StDW3LJYss=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a57f788-2f01-461b-30a2-08df461b8a0e
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:20.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PedDspuZZnvxLimukqzueMD8o+hgVO1GGuZB8QnZVuiZ3UOvdPGXdFu5xdmw+C7NCoDqJuRd70i8KyUMFo7U7bK8QSOemHSoNKWleqKyNl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB360180

Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. The control region
manages shared resources such as firmware memory, while each interface
region has its own MMIO range and interrupt.

The control region and each interface region are distinct DMA requesters
and can be associated with separate IOMMU stream IDs. Represent the
control region as the parent node and the interface register regions as
child nodes to describe these resources.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/nxp,imx95-vpu.yaml         | 162 ++++++++++++++++++
 MAINTAINERS                                   |   8 +
 2 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
new file mode 100644
index 000000000000..aa7dd8838af0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register region and
+  four interface register regions for a shared video processing engine.
+  The parent node describes the control region, which has its own MMIO range and
+  manages shared resources such as firmware memory. The child nodes describe the
+  interface register regions. Each interface region has its own MMIO range and
+  interrupt.
+  The control region and the interface regions are distinct DMA requesters.
+  The control region and each interface region can be associated with separate
+  IOMMU stream IDs, allowing DMA isolation between them.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-vpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: VPU core clock
+      - description: VPU associated block clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: vpublk
+
+  power-domains:
+    items:
+      - description: Main VPU power domain
+      - description: Performance power domain
+
+  power-domain-names:
+    items:
+      - const: vpu
+      - const: perf
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+    description:
+      Used to store reference data, reducing DMA memory bandwidth.
+
+  iommus:
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^interface@[0-9a-f]+$":
+    type: object
+    description:
+      An interface register region within the Chips&Media Wave6 codec IP.
+      Each region has its own MMIO range and interrupt and can be associated
+      with a separate IOMMU stream ID for DMA isolation.
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        maxItems: 1
+
+    required:
+      - reg
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - memory-region
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      video-codec@4c4c0000 {
+        compatible = "nxp,imx95-vpu";
+        reg = <0x0 0x4c4c0000 0x0 0x10000>;
+        clocks = <&scmi_clk 115>,
+                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "core", "vpublk";
+        power-domains = <&scmi_devpd 21>,
+                        <&scmi_perf 10>;
+        power-domain-names = "vpu", "perf";
+        memory-region = <&vpu_boot>;
+        sram = <&sram1>;
+        iommus = <&smmu 0x32>;
+        #cooling-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        interface@4c480000 {
+          reg = <0x0 0x4c480000 0x0 0x10000>;
+          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x33>;
+        };
+
+        interface@4c490000 {
+          reg = <0x0 0x4c490000 0x0 0x10000>;
+          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x34>;
+        };
+
+        interface@4c4a0000 {
+          reg = <0x0 0x4c4a0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x35>;
+        };
+
+        interface@4c4b0000 {
+          reg = <0x0 0x4c4b0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x36>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c08aade46f61..e014d1b1c890 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30125,6 +30125,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.41.0.windows.3


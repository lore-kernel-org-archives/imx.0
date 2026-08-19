Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC2357702
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145376; cv=fail; b=IkfhuVq8WmBW8otBLK6gv1BEw9MyI67ix/DNT7flBryZD3Z+8Dr0iBONY/Y5k1CMA8NyYp8BXAq1AkKIo85hy7N2gANxNua5PCjahq6jV8LcWe+UoDh4Xjk50axfynENEX/ctgbn9wgtxcsqcRN34ZQMmS5roVjbWa/KDZvA4NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145376; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eF9QocDZTw1+LATeeKdrMJ+7c1zOV+sDOrwmiQaCDJzr9nK5Umyrrkk8IbDczWKk1l7c+iaFxqgwafTpj6YzvOqrHozQNd9Utn73CksPD5lwQPRumyjUeEcAHDbjcHRPk08E0QOpX/6BYFIF+jt+zE0xj/Bn0RjBwu/MlDd8v6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PbTCgOww; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PbTCgOww"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyqrNZoiCbxy+33bhbPRqk42dXn8hAXA+LotJak3F0xolXvuOgn/+mCoyj6RWYjU11uL1zgYIYaMx4JkyhH1DNU6VRxjhTGG5bINeg/doyniKE0xpg15xeOmo5buKc6foIx7Jh9cclbRFkRFYZCWpQdmx9um1g7tbZV0Yg5inTvX3McnFiy5RQfs5mb2iQct4oZk+4F8/7Z5NBW7W1ZYIZ+swur7yCQV4ZFWWM/QyiyPCb1cY52z/6o+I8D27h53QDGUykL41HPXko1DddRjiJ2jRq7SIgkCnVgg5ThrSHs9+UYkAlVrlirRlSvgFz4SjBeyZS8v352SFQFF7wjXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=qQmgjkGLTzEUJDh/4dDWhY2ptekHMDZeYaDa/pxsY2XL9gRX6Qh9cXJqfAt9B2FI32ICtfx8GpD++hEnbe25kKm3TcTetGDI5NH/YOJVjmwDFiwxdDh3znNrc/RX9S9Fl2fF0HVFGeFWT5XZKtq2I4gxIRKeIFYEgw1QE3jXljZnkLaweUGHtykFOUybQzxwCqHB+Nin6sZ2e72Q2J5f1TYYV648QDlZnKKNbNYL5V8R8C+bO0F8lkd6BIfzxQh94AfmJyI51i4JK7W12KPGS39TLK3TJP9xQYwzc0ZRkURODhpGxp52Olp6Zc47oUaRSWOwf+PxK4NXo9L3z2+dgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=PbTCgOwwNZEB1ltwNRh9sKqhFlJ5i7qFqNkcnzJG6qYq1ENprtLz0dkax2XqYhzj9kdKIEFu6X1RwNEZIzDB5NltpmADPPxHNNTKg2ySWOs2f99tRYJCBgDFmR2ARkByMjk1b7G4XGLxe7Z4Cw7VFPCjzUCWOINm4HLnz20hnJOIB56P6W+xrPskKGQ8Q18oOb+Sl7ct09Bnqyk9gsNI3nTTuDDJf+u1MLxp4elGSghU1G3xJ4MnvY8xOIafUh3YPLV6gIJ4nEZW8SoWvMOSBVx5IB53cIpj/vziSSD2NPDlibt5ieawUByfPYfTnHKFIbEV8ZRVGHw5wIOF99X2+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8737.eurprd04.prod.outlook.com (2603:10a6:20b:42a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 13:16:06 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 13:16:06 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 20 Aug 2026 00:16:02 +0530
Subject: [PATCH v38 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-imx-se-if-v38-7-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
In-Reply-To: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787165160; l=2461;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=a6wYMumxNZ6wPg5bTy1V5Et5qhZiiR9vriA+Qdhe9YsTPIjfIdJo+qpzYCJQU492P66Q0MOV+
 67oz4BPML5iDv+rC23QfVz5TB1OdRm8rwzdm2ze4VQ7DPa3Xfi0xnQw
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1f2621-c516-4552-ecc0-08defdf406b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|19092799006|10067099003|56012099006|11063799006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xrrLo6xtgAGZweZfeJBzzQ7GHXq6YnQksPHxkt/4hpRhlpkmEbuFIuMTTBAG6Xgw7M9WkDRB9NyZjPQQfTXjjW+BsuMayUA6GGUxaq5heLBhZy13awVjWpZLHJdnjUF+AebIEa+c5TefsXD2ml9Z8dc2P58yY2Gsw5lgq35vZ9OyDzRRoIURhGlDk80iPk7RlzZifeY1r5QMdh+Mq0FNTr+NTrFKVtg92Wcn4WtovTWeniSyiF2EFyyZ55fVTQRtUz9oWBCEjORuLiZBZXXAA6Bp0o7mjDWlO0gG4P7NeP2XCdhIFiiJ4gjwCM5tqNcGIn55ZApcJdWnEFAAqCH+8+Vw+2OfnGkXThzqFivs0CxYwc1z93uhMAJ6hqDnLQnGHs6oZVpndQfLNkfC4i4fGJwqOPy0TevW462SlzdJMA5V6uzQ0hXq6kCJ7GaerUvEESx5xClH1Vg1Gr9GaAaqXgjSpfit4+AoAicEeQx5gJSFM7dCSLjDo7UvRaMY5vFPDEOecEbvuVaJ3ItTrs0Myyf8pNk8/B7pTmMqVu7EaPugicHgVZ/vZC9lE9TR0EV/Nl+I1tx1pL9Tu/6r5t1FIXYVv+sjIbwF+ozBFNwmwQlhPPNys7+HR5O+Vgy6l8f8Ovumg0RbLo55D4Jo8ETRwrIsEVQveB838/bKdyIf4Sihoq1/XrB+mMB55PsPVpuS1ZS6qmClngi9pLWwAxwAHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUV2ek9JV1dwT1BWd1k3WkpZS2c0WXpzSHNYZXBmOXUvajRxcVBzdm5YMGZC?=
 =?utf-8?B?aG1RZjl4UXppQlp1ai9QcFpyK1ZsZzhnR0dCTTdUS20rUEhoTTFTY2RhV0lh?=
 =?utf-8?B?SjJ0Vlh3SG5pazNhdzA3RUFQSnhYWjlpaWwzVGQ0VmpWOUZtMTdHZU9MOFJx?=
 =?utf-8?B?THJWcUhUdS96alFreGJ6VVg0VTFsaEVGMVRlQkJuUWtseG5id0hiSnIwOWV3?=
 =?utf-8?B?MDd2VDRZbW5zVjVkMjlDdEVZUTJ2d2YyRDFYcnZTTDMrR29TZFlUR2VDSk9K?=
 =?utf-8?B?d1hNRjZodFYyZk1GR3k0bzdpWHpNbW1QckRDUGZheHEvR3hUSExJckUweTI1?=
 =?utf-8?B?dkVNSGo0T0dLNkN5OVpjKzRWMGoxZWVaMmpzTnc0T1NwendMR1JWSXpxcEdX?=
 =?utf-8?B?M1pRMjBINjBBdGZpenhVclN5aWFjdGY1K1VYUGliNkZ2Y1daVXNKdjVZUXJs?=
 =?utf-8?B?VEVaNGM0SDUxV3F6VmxyZTdpaVo4M3ZhMG5QWEhmY3d1dStJa3l1eUwrTTNy?=
 =?utf-8?B?YVUwcHdCNVRld0VFNzdRTGFwemUvSzR0bFFtRExUejNoVEpzcXQ4T24rbG95?=
 =?utf-8?B?TTRoOGZvcWdzMkN4YkFKZm43NUpHbmNIMU9CUDBrc1Zjajhsckl3Y2V3Zk1m?=
 =?utf-8?B?aFNZeUhYaWtpbkFrWFUvZmVBZFRIMTNCZlNDWDJiN2ZSdkdPRDJ4dTNRc1Jp?=
 =?utf-8?B?NStRMEF4VXpoNHQ2R01MLzVwSXNlYkY2OW90MEhlRXZObE1OdkQvdnBLc1dC?=
 =?utf-8?B?Q0xXWENic0U5VXhscWU2d0cwQTc3R29GWnY2YjJQbThCT3Y5ajNUajlmNXpP?=
 =?utf-8?B?anZ1STg3N2dld2pXVmhHV1RNWlZMOVM3c1hONDg5YlNUR1kwWnVDNnZnb0dj?=
 =?utf-8?B?RWMvdENRbU11RXUxWVBUWlRmeC9BZFZLcTB0S0NtQ2JzbU9TOG1QNEVkT0I0?=
 =?utf-8?B?N0x0My9DWFNCd0wxSjVrbWtTZFlmSDV4WnRnc0pmZjBPaHMxN1lVek4vMkNE?=
 =?utf-8?B?UVpjVk1NNVAzRmlhUE5kdkJqb2l3UURwYytSRmJSUGV5NkhRc0YwZlJNckVZ?=
 =?utf-8?B?NGVyNlZwb1Jra0Z5M28yS3dRUHFEYkthUnFLclp5ZE9CMkgwSmFQcXZiSm1k?=
 =?utf-8?B?MmJPdGdNTTJKei9LUXpkaXBkN0RQUHRTRXllVXo2eXZLS1ArY0cvQ0J4Q1hp?=
 =?utf-8?B?RDJ4aVY1eVVZZzlzMkVHVVJZQVhVUEN0UW81clhlWGlmdkhKZitkRVJybFpN?=
 =?utf-8?B?dXJpRzRWNGttT1plTXl3SE5qQTNJcEJwUHg2UDhoeFZjRkVwWEUwcUM5dDNZ?=
 =?utf-8?B?cU5TWVpTbzlSR2l3cWdJemNpQTc0TGJpZ1pDeHJFaWZGSHpvQTNRall4d1NX?=
 =?utf-8?B?eWYvZ3BLbFBabTNrZzhCV2pVc0RTNEt3a1diQ2MrV01LQUtKTFh0YWhSR2JV?=
 =?utf-8?B?elB2cjZ5dDM0N0ZFWS9URG55Y1AxZUFWWVd5VjAzR3RyV1N3NUllVU9rbzcv?=
 =?utf-8?B?bkZyM3RGcGRnQmpER1JBeHRzcXM3VDB2MFBkYUd6VmNvL3dTd1lIcmFmZWtm?=
 =?utf-8?B?YTM0YWNJK2pXVnZmZ1J2anViUjhXUHZlZGdRRmRsbVkxdGhjMHFrdmFGK29p?=
 =?utf-8?B?Z2o0MW5EYTNVdTBOZzZic0dtZjJyTWY5b3VsL2NqeE1UQVBQdDNIb2c5R1Iy?=
 =?utf-8?B?a21jd3lqelFFcDlwR3NiK2U1SkR1bTkxOUhPbCtzMnBHc2F0bUZ6dHA2eFpY?=
 =?utf-8?B?c3JCZ1NjbURGUGZGeCtGVFB6eEFYNDBVcG43NVlKQTduNDdtcU10Tnh6MTlH?=
 =?utf-8?B?azFPdFZGcFdKVEh4SDZXL0Zla2M2UkcyOHJVR2x0VHBzdEpsOGE5WlRUOFVW?=
 =?utf-8?B?aTFoaGpiSXdMQTFPdlB6ejN6eG04MU54MGp1WE04Zk5UamY0MFdnazRYdHpO?=
 =?utf-8?B?RHFXNjFvTnFpZnFaYll6M1Z4YVRtWCt1WlRKV1YrbmhWTE1LWkVGL1YyaVhV?=
 =?utf-8?B?MjRvaXJxSDBUWko4OXpudU9FMzFhNnp5bml2L3UxUEFSa2lsS2RNOGh6MmZH?=
 =?utf-8?B?V1pPRHlIY1YzSzFyWklmQUhJSXVzSjVvRnJwQ0hEQ09IVHRqQStGQTFRbFhj?=
 =?utf-8?B?QXFuTWcxN2dqZEMvd3k1bG9iU3pIVUhFUG1tb1RUWk4vR1ptbldGWjNBUTY4?=
 =?utf-8?B?b1ozeERUY0hpNThvWStUK00zUnFYRy85MldWOExDQmdiVUorQ3JQM2VEallr?=
 =?utf-8?B?OS81OXN4OCs5SjBNUHkzcHRRcE0rdlhOSGVUWWQ4SlNjZnd6NHZyRzE0dFJt?=
 =?utf-8?B?NVd6Z084bmk5NFkwcUp0bzdhN21rQUxDWGFCelhvWitiSDhpZEcxOWs2M1VU?=
 =?utf-8?Q?Vem7E4onvuvcIUA8bYE5zcOBiTf1W5k0tiNon?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1f2621-c516-4552-ecc0-08defdf406b7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 13:16:06.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Dv2zFoNvKOBe/rruiHtDI3jtgtrr3CD21DSWRqZ28doKt+rZyt9sILJEe/2YixUh9AqVVaXwUObMWXyf0VrLf1lPLqVEWKbK6yRZI7rXiv/i2ZjyUyOHC8RRVQ6iIVv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8737

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..885242fd07ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0


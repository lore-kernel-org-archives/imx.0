Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8D048F85E
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317756; cv=fail; b=EK00/YY7uTA9BEc837updAOZxprRww40QZVK9H8U4yRuKVlSAvRFU+YlfFu9LJJ6xk/MXT921hG8bBndw1wBQ+IXdlgE5nIrLEJjA4n2OGDbHdF1+gHG3i5cE8Dd9zWrD43zqRMh6Ufo+Rr+2E7WfSu1NwBns1QdDm/F8GnEONg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317756; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=httNQpbAwcfZDCWUOc2dK+uO0KrjQ55eBEfjufsF9Rp6OB9c5EUJ1vwdVv37b9gvcIBHauhTDtT33+qdpKFn9uPQE6twxvuDbOClm08HGo4/Iukv+oGIzpBK7YLqv3JSzOlgHegYRqj14xdDA+yf2qnX+cWo5XI3Oqg0QBfzXI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TmsCAp85; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TmsCAp85"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG/ffMPz/UldF8f805DbkqVu5c5taNAwIE7DvYdlK8QHNGfsQr5+KNJgLUVYfan3kCXklM9vayot6csQbIxGM9ZioayN34S+lNYZoExC9N2Q39/JVgtR1/aHISJOR3xp0vMIOfilciDcmchZl89SVJ9M1zYcUUoHyK51Eg1GLti4QBDFFaLPgi8dEf59eVy1SA3b+8JzPLrLv3eOs+ZfYGgTcN8PdcG+2rU8faxGNr9ehlKqBZYPU74svh9FtYf87QKbeUuOsV1xc20W59d/mEaFtmIML1iJ9x+58+LghCwxzYF8Icq1AVvbHvuuBS9l2T6IWS49V2lmmFd2nMmBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=p2DtEXSHLhWc+AyVdXYY0SkVstb1vdgoRqYOZyJMor6MpQzBkMmrWWi2bxC2NyZc1Qu+TSL++PvmAiNYW4SAE1Nbk9/QgqswRkLiunNHqgDG78qPNK6P/SaJqRINu2JWrrt/YWgs0MKRNB96j9zr0Pmp/8/lJzhL7My1zxo6Xt32UySZOnE5LIpLc18kfS0gCwOVDqamPi2byLuluT5VLKvo2XX91xVFdbAEd5Iw8Q/Eh4ShB+uqSTZusxeaT8piuA3V9Cbk9u+WXLTBdA38zCiO5/tR4IFavl6zMOW+xvDd9g93hlj7KE6ZnMWUy8qtnxKMd+e36LVWXzzKHj4Row==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=TmsCAp85w4jkbBZFAfe7lfrQekYhtogFrDuNFFMtTps1aBgj7WxYHLxYtyxE6fMe3uKA6K/CtSW8P85S6GnOQp0ppCEUKSXDeAj5wVL6lAIe+UJ8YoZh7XTN9RQgLn6LKNJ4WtHVuND7tfKrh6MPu4tcV3jMNBgLJGBvG6A2wEfpYm8tMBQH9fVnQSbGRqNJYBHcWD/2ZM2fqWT6Grf9KLL5ASNRBHg56Og5XOr99AHbOYzS1TYvF7IUwolEhDGopl11JvpcXc1RCDom8d5f5ixLn+tbNzpAX98pAYRejz3RxYF1g+2ENQJt1DAeoXtmldh6cMhAkJCfuNTBXYVCaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMZPR04MB191951.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 13:08:11 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:08:11 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 22 Aug 2026 00:06:13 +0530
Subject: [PATCH v40 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-imx-se-if-v40-6-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
In-Reply-To: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787337485; l=1532;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=XsaAcHeTqPeXExfC0Xa59UDfHpT+IsGkftolgkpYMUZAwUNcZIRlM29N+nOYfH+ZT7CmLu4we
 WYxOsSDuz6yDjBhjOZTplouN5NqqLaMSQUZYO3qGLuUbOpzd0da/5y0
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMZPR04MB191951:EE_
X-MS-Office365-Filtering-Correlation-Id: aebb8b0a-8c71-4610-a598-08deff854096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|3023799007|10067099003|56012099006|11063799006|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	qKnzLAP7MauTh8su783j/GBAAAWOtRKfRkpRj6qRbzf1FBslPj5A3cXsV2qhBHJogilAGe7ZoJEaPbmQ5UuXgZ3Hflnpwf6tO+QpO6c7Oja4ba+MqKbV+DKnIzjm7GMYj6YMymMdImOIE4IZaxqVQXvPfq/Ui+mKNkZtw/YwkZmHkXMcPttzw/TC67pRBQ4tmXzLFvIj0PiLQh6O4S623j6F/xSyRTo/n89qRxAznMmU+XU7pmDAGM8H2gWZsf3cHroUWTa5ZIsAvjcDadmeuUj+0AfSjuZ/74SOvnNGXGPWqJs+bt8eEvIO9d8R3rD4hoDkXrsqF4t+86+WuwMJXPxNqLrhAFREvI1/6IgKkfTVE6Kmqdj/B6SDNqZabbLc/RB9yXe7me0pP71ppx4tyvXs6vYxfTe79Qqo6K5OzjJywUnGwIjJTt1L03oYBEd0AySHefl9N++46FX3DGRqoPWLwzJRXdKGn4gOw4vjz57weybTPvQ7vI0S2M3BzfQN5A5kE/qsLJ/RX1PuPtxEx+oNINNk6nt2tRzDdOlslakzGlS7+U+1dCRnUWLUFskWcULT9kwE7doWSdsWeMNxQJ+eY62p/X9sT3u1sUjvsEs+oOXs3gvIeA/68uRwqqFdgs4UKKn5q76qOjw7x+mMb7sSZOsr1n3PXaKj8cUVY+FrTt41cw2GIgGolWO/VQvPfjMjsVXPeoxp6bm6kVw+Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUlSa2xIbS9yaTRYTTRpWUZYNzVoM3NYSS9kazFpMVB5VEd3b2dxMlp4Y2Uz?=
 =?utf-8?B?cDk1eHZ1UTB1T21UTGJIaU95YVFsZGZOVENKc0ludENnTE5KNHM4cFlyYnEw?=
 =?utf-8?B?bzcvK0p1aHZhaStNc1JpQWJPaUtlRTF5YmhmYmFHOFA4a0NQbVh1NytXSXUv?=
 =?utf-8?B?T2hwdkUxWDFiVUdHLzMzWkMvc2lnTVE0SUpxem1Gb1hqYUtYNW9UUjQrUVJY?=
 =?utf-8?B?ajhyQVQ5MEhjWGlseVZUQThMZkpvdUxaSjE4R0V2MkVVaFN5TDdKVzFITWIv?=
 =?utf-8?B?Z2N4ZEt5Q2EzNFcrckdTSjFqWkZYYWJDbklJTkhlUGdFMHdPWU80R2FBWVFK?=
 =?utf-8?B?SWxHeGQyemlvZ3Rjdm54Q05iWXVXYS9ZRW9yTUxDdEJOUDQ1ajBtNmVLVUFO?=
 =?utf-8?B?cm1QTUtOUUJEYXh2YTAyRkI2ZHYwY3d4bmh3c2MvelpSd0RQZW9ENW5HaTNM?=
 =?utf-8?B?WVIzRFkvdkpOUzBvNXlFMmJOWXJQWkRYMWQ1elR4bFlrcWNQTU8zbkxoS05T?=
 =?utf-8?B?eDNCVWc5NG50QkM3OEF2ajRvS0tBMUxIWWZXeGhWMGwrSkhiazJpTWtROFRL?=
 =?utf-8?B?bmxhemdhcGw0OG1DNzg4aXp0eC9CaGJ3WEN4RktXdFlZV3UvKzJkUUZ6YjdR?=
 =?utf-8?B?WmZwaTJXc2pSeW9hcnhEaTlwUmgwZXlUUzZWSHJkYnZaSXN5YUo2VFNLUm9U?=
 =?utf-8?B?NzhRZnY4VitrRkl0YTV1cGhwYU5IYU1DRnk4YXJ5QzdtRnB0Q25oN3R3b24r?=
 =?utf-8?B?aml2OVZxS2htaWZneFVua2dZUHpGNlFMZ2lnYkljQ0E5emVSejlTTCtDNzBS?=
 =?utf-8?B?YVgzVWMvRlpBNWlhczlmZTk1alU3RnZUSDh4TkFPZEJ1VjF2WC9hMG9WbHpv?=
 =?utf-8?B?RE1TL3ZldmVWM3FoTE9rektkeFZWL0dlRHF1MmVHai9iZ3k2dXZKbXB6UlV1?=
 =?utf-8?B?WDRxVWtsYmZrQ0xjQXFURWIxVFlJU1JOV3ptUFRxaTFSeWRNT3V0T2NzcXhx?=
 =?utf-8?B?NW9YczZEeTRRT001RTFjSjVHMFh0MEJtV0x2REwrUzV3OUViN3RIS0ZuSnFn?=
 =?utf-8?B?ZE5TTzRITHFtVld1OFliTkNscUM3aU9zeTRtbHJ2NkowL3ZBK3YwRlBKYTJo?=
 =?utf-8?B?Q2xSTDNTRVZkVWhkbWdnSm5ienBIWFVLUFBqMEplK0xQZFluS2twMnRGT0tx?=
 =?utf-8?B?NE5ObWZwdlVYNHhlMU01UzdzeVcxMldtRU01VjI5NFRmNTF3dlVTWnlGTzNK?=
 =?utf-8?B?WlRyeFAvSW4xOStJb0FvUDlqTzdSS3JxK3dYWHkzaGdZcG9LV0paUk10eWNm?=
 =?utf-8?B?QzNIZ0JTYllkQmlMZTBFYnZWcHlpejhBZk44V1cranVvWnVnVlNrc0hKL1Jo?=
 =?utf-8?B?dnQ2Q08rU05LSU16RG5IMDd1azlET2xYUnBDcjM2YzlGZEM5Q0kxVVdSdVcr?=
 =?utf-8?B?b25IVjdjbVg1NXo2bWRWWUd4WWVPcTZzU2lzMTdEa3lKUEZYQlExM0cxYVRk?=
 =?utf-8?B?Tjd2M1hEUlROQVdSYzN2bURNWDdQOWlUWmdLQ09vZGgvblM3QWZxMU10ZElv?=
 =?utf-8?B?enFnSHh2SWpodUdnckRyQXdhTlE0Yk9WRExrbHlnSVYrQTZyWEo5UWp1ZkVy?=
 =?utf-8?B?cnpwa0dRTDZlakI5cWppdk16Z0srL2kzbkt2bXFacmFBNGpYTVRCckNPMnlC?=
 =?utf-8?B?d0RFRFZQTDF5QkNONkRyZXNJSjJrRUxuc0pRMGdSYUx5S0N1elRSTUhSN09U?=
 =?utf-8?B?NFRxN05MbU1rRlpZRmpIbTI4OEdsUllLQndwQ281MEFqdnY5c2RxV2JKV045?=
 =?utf-8?B?Ump5V003eVhPVk0ydXA4cnBPbThYNFhWV0tubjJBMzVzSkxzVkJ5SFU4bWRa?=
 =?utf-8?B?Z21BVGZudFF2dDAzaWkvZTB6dXdFdVBtWUxTQjZYTnd6eXIzbnhjLzFvYUds?=
 =?utf-8?B?dW1VTEs4dlZEZkVyemxreEJzMGZxVmd0eWhTbVJ0NkpINjE3bHZEeHhSZlBQ?=
 =?utf-8?B?c0theGo5RjhoaEowNmJhRkkrcDduMXRacENGZk9aZXNKZWJ2dm1nRmwxQ1lP?=
 =?utf-8?B?VmtyNVVPa1F6ZjI0aTlBQlFQWW9ZY0lMSWZ0djFZYVEyMGRDNzB6V3Z3QVdD?=
 =?utf-8?B?ak43clgvU3Y3UHIrUnNpUUIwNUR3bW1YbUQ4b2l0RlpQcU9jclhkL08wclhV?=
 =?utf-8?B?SzhId0tpQzZSU2tkNnFYcC9SSEJUTWh2cFJHMklzTjdvR2VRYVUzcFhEcFcz?=
 =?utf-8?B?Wks4Q0RLTW1uL2VGTDNNamZZSXJEUTRGb0FQelJDREVtYlBkTFRGRHdKaFVm?=
 =?utf-8?B?bGxUWmE5Yy9vUmNBMlpNenNsSUdNZ3d6MzlqRTdqWGh1NzhONGZLVmxJZ0Rs?=
 =?utf-8?Q?MNhMX2+OGCbrwWnpd5PC7fU8LvpXx3FGQDTfR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebb8b0a-8c71-4610-a598-08deff854096
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:08:11.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75YrSN71yJjfCFtCywryI8OUjw5XYxObVeTEdWeKneTbvOuJ516LkJLq1800u1/oAsD6WxTNuT+lcQ8Z+6eIWbFdv2p7lN2ZSCn9lXwrhjskJLzJu0LuSsiyjJhyrUIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB191951

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0


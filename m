Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A54C77A1
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630046; cv=fail; b=Pc9XJQixuUxjZ7u1p2XKpa4i8BOUd0W7R+T064usdPFY2hV/Re0iozV116zlSa1AN72w/+iy+i8P0nwxC9k5ItfXefmAbwBqlM2tRzTmlHZ+XiQXJvB+XRDK2QTt+ABBlwixp3DsUxObOdz3CGM4eVN+0OF0AH9TOn8VIQ954+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630046; c=relaxed/simple;
	bh=rXCz+RjRryPw6okSsLS2gT1n2zw3GWgVY8tsmT6TdRg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PUKwx1fWvUq7nKNA88oizkAm4Rga1tTUgwIdQLz4/xKwh2h2Usunw+zZd2+fvHCh49j4+7iMxiea2faSMarLdoDRXDUlRYDTqkG7z+/tOaCVy+K35TW4Eaj3XNHUAX6Hf/zmigUz3+Iqyn1LYEnZ7fvCgEosrBIigM0o2iojofI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BlJenJWG; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BlJenJWG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fe95QHymPTAiZJMkJ+Nis9VzpZCuKwkbH2YPqj4NA1NkFM1CQAKPQRo0WyKJMyPFYMeNYCLOpKJQTFkYh4RKA52FcP4VV3zb6xhIwsMl7Qx20g4T5nLr9m58799sxggq4vFR/N+OtM2Urih1qTRVgGjPmRFkDbUOHY6Oain1KVR9FllMGnId3rBEPk2Cwh9bkEFv4xNB0TRb0EvCvHyoqGFRwTyouy3qOfjqQWxYbcsHFjxR4oEqYf9Hbd7IZo0hDSWuBAiUMTJ2ZapOMRH596K0YlpV6kzQ91iAB0iKYbIyQHiSmExJuQy9Fqz08SeMJ6flNxmDNG+BPw+GnEso9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=w1Yyi7jGIt0myCYjNx6G8S9Mf7YnTW3TubRw09IH7cFdETzb3m7YmnRBuochNvpCDbXsmsyAiJVimw4fhwKyU8vKO+xvWKjyug2RcRZWnflrLiVFqjTH4Npl/Kxoq2DmpjTq5Hwnk872sJbSmthOCSwBx01AeRO521uZGuXzME5JdtBQaTY1XwA4jXUlwZhRGhdWDplBwLTuwtDnVyNaqq5hXSMdBxpPth/fOozOCWFjYJAM2+VyxgebzBtZSrFuCWQ57RhJtKmgLr5rqmMzZgfNXdUnnzN5GVqcrnMXHRUEkuY8qYTLhsSLo9GdQe+hu+ak1XVmdbLKElIChZK2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=BlJenJWGxyd7ehCCAAbGsT7BkvmikUy9xBNT4qZHeU6eT9+C5OPK1MWsyDCLJO5ctxEGTM26hVVy9eSYj7PijovhMUECYtwjnjIM6X/fpFcOjRe1y+c4sd4UZhGcFnWqvgzZZxsfxG3Vc8FO3lrJHRZzaKAq98jPl5mvKMdO/pi/s0qTafLNia0/RJCY+PcktmSjVGD4G0yGnx8zSxDXfpqNhGkXyoOKYeYlamJN87lW7qXaBZMrhT7i5lPMW5GuGhdjGergyHG3E5FhdQsCfcF+1IywzTvN5lgq50Hqd8WbHAm0vh+sZLTI6mJkQ4yEYzXeWgcgDkUU5UsPPN82Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:33:59 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:59 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:38 +0530
Subject: [PATCH v29 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-7-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
In-Reply-To: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=hnPFsRK9/RoyluFDiCjFX7uqhb3SO3ctyv+6dqueb4c=;
 b=hqUqyYVgAWmlM5K9Tf7p5o/F1J6XNoX8xwycCmb5XrJPfHIrRTHvBiSaWp42gBylMvKdkHRIP
 Y4h7rXLT8kQC+GoLKW6Lbh9K8XaXuW9FT4jCf+o6nZUES6BMHS05a9z
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 67203ab8-6937-454b-ce82-08dee7139355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VelBFznNLWxraXceFRNKGftW9rf/DrfTfzI+Eux/Cd1+1InzfOevO6c4pmx3Z6d3PgFWDwWY/ULqpf2Ilv5pwxaL801pAjEYuxKLnop2NcHd0XJHDyfVJFEBDrFsAZ6kGbns0sHmLcNjlQ4AT/8j7vc6JalOI/Z0ArExgtOGeVmfU9OhJv+eAG96Mgm1q3YNlsAc5t53dvd4wwcXVXujgBEd9YRAKKDMBwCXQmT5JuAsRnuy3BkCeDsW16dwtimmiRtHijNQ/PQDCFCo4ofKTOlXwt5xViIDyUmJ4aNx40X7Z8gPlrX8QMFSWb0qmdbKw/ULd2z6k5Z2pIuPZ1JzEZ9WXor/ZPyKOg2GT5EdC4yosuxdh/isLWeV9xKlgAhRhpCu87hiKo+NGU86phh1cY52gaSL1VTqonOkRLysted8vD5i9pPCl7zz0Xz8BWJh9lQgm8PrgMPfPoiYwV9INNhna7q1t5JAfS+5z8ych49UL4MbRSV9ni5M8MmLTkZjIfsHqmboQD2J8pe1O+6zz6k+5M0h+C4iZW8Vxs+6FB02iBY49WDv4XPjOpAVrM2vnxlHn+KFsEm2LzufF8+ve2tyvMCZqp7as7v3dl48sZeBMIGzL+Sg41pKph6bavAnItAKHa/c8MZJ8tYFdcyEn/aIM4Rsq+z87KrJF7F2HwMXKzD0RX7AX0HN6eWC4Mo6Nb8kX6im7NYWDhcgk1I5AA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDlmT0YreXJXc21yVVpmM3Q1VkxRUEtWd3hNSmhsZXQ1Q3hlcTNaeHBjR29O?=
 =?utf-8?B?aFp4OWQ3MUwreW5CUndLeWtjTktvQ3BKUzdzTmJFQ1I5VkxGejZmS25wOEFQ?=
 =?utf-8?B?VFowM01JRWY3c3VUc3R2bk4vdCs2NlgrbUZsU0NvWkR2VnZpSFFBS0dhSDYz?=
 =?utf-8?B?bk5La1llbG0vVzZqZVdpYjNkbDV1TmRQQjVhVWJrZkRDK0pwYUkyMnN4dk9t?=
 =?utf-8?B?UG5IcXk1WHRVSlpxajNnMUl6UmFETGZ4L0tOYVRGZk9JUHZkQnlQOThNbWJR?=
 =?utf-8?B?bG1LWTNrUGRxaXZBakxFMTE4b25CWGY2SlVJY3VSK1NENDFvV0E2VmJhM2lm?=
 =?utf-8?B?Y256dHdDRXdrL0tRRGlWSDVFYzUxVUowWEx3SWFuTEJyTGR4VGlKSHhQeWxL?=
 =?utf-8?B?OHdFK21YRmY1UVV3L2VJNUJwZlFodmNFZzJON1gxenFybE9pL3BTbldoeWl4?=
 =?utf-8?B?TGY3VXgrc3JTQ3dlRTk3VDBWcDNjanNjUUxaclJsbUJOSUROL2hCY0tzTzR6?=
 =?utf-8?B?SVh1Wm9heFh1MndwaFZGcUVxN0RMWGhNaGlBbDdzVkMzRGdwK21ZYzZqbzNX?=
 =?utf-8?B?eDREbWRGU09SeUxpejEraFlpMHYwYmd6aU04T082MTM2K0M4bWM1UHg5ZnhY?=
 =?utf-8?B?WEoxaVRUODBHL254UVBQbHVCQmtDTnF0aVlqUkFmK203RlVBWkJQN1ZpOXFX?=
 =?utf-8?B?SWs2UEU1OSs0K0ZIdlhTTkVWU0tiRVJYSDl3WHV2UmN4VWxLQWI1RCtUWGF1?=
 =?utf-8?B?ZnVuVWFWQUdFWUVuU3pMUmZYaDIwaXVmN3FmTDhiRC8zK2xuM1JadjRBRjU1?=
 =?utf-8?B?YXRHRGRiNlpvOTUrcFpGQU9sanFSblNjN21SRFZIMVFScG9icWQ3TmJyOVZ6?=
 =?utf-8?B?SW5oN0tGK1ZtODU2MUNiZitQVU9yZm9wcTVZMlR0Z3FmK0JKWXhOZjlmWGhO?=
 =?utf-8?B?VEdkUnMxTU03alkvMlBRcm1HSlZoVGtIdzVqOVBjWGgvRHJVTnUyVG5BUlE2?=
 =?utf-8?B?dkhXRHVUQ25WN3hqelkwSnRxRENkSFdKTFU4YUo0ZHNJVFJWTjhBYXNOQWpx?=
 =?utf-8?B?ZU8vRFhpbE9RYjVRaEkyVVVzSXBkL2FONlF6OVBmdmc0VUJRUHFPZG5aeHVa?=
 =?utf-8?B?L1BzQWxGZnpWcWJyR1JHTTBNdE16RXd3R0FRdTFyUGM1ZW1yNTEyM1lvQjh4?=
 =?utf-8?B?WHplQzlFLytOV1ZOUUYwYXdxQ2w1UE03RXQ5UVVqRUU5OGJqWStnTTJ2emFt?=
 =?utf-8?B?NURXV0R0a0ZFR0FKVDR5YTUzTWdhdFd6NzdSREdSN0c5RmZKSjdHM2RNYkxV?=
 =?utf-8?B?bzE1MGV2YlF0VTU1Z0NTV01uMmwrSXl4SEJkMS9RQnByempaZzJTZlRqVm12?=
 =?utf-8?B?NktyNHhKL1FwaVNhTG11VFRjWkVKbUFPUkJubU1lWkRsYWUzeGswK25kSVpK?=
 =?utf-8?B?SUEySzIydkxIWENKRjh6VklRSTJrSXBGQTJVVVc1bjFrRzZjT1lBUTlTOUVq?=
 =?utf-8?B?WUh2aUdDSTRWRXJPZmJmeHpVOEZoekE0MTdzeFZ6VXlqR2NQK09xdjNOMFlx?=
 =?utf-8?B?VFF1R09pNUNncTRxS0pvRDREL1piekJrRUpteXNmZ3REWUhsYlBHYnNFM0dZ?=
 =?utf-8?B?UUErV0tJS2VMU2xnblhSMGgrZmszNTJ6UjFFRkFiZmc1cFpBeitkWlF4dTNn?=
 =?utf-8?B?WVcxQVV2cFNoWHVBUXhLdW9sS0taT29XVFVBMldLRURUeWREbnNhVGZ3LzJh?=
 =?utf-8?B?TytpaGxuZW5zZjY3VFhQdXFZcFcvYzZFa2ZHNXBjMFRkQTBob2xjTDgvRjNm?=
 =?utf-8?B?ZE9TQVRza2RObEFrelpOY21lRERuejF1eFEwOFRzcEhRT3VHMDZ3L21TbmhS?=
 =?utf-8?B?MndpaG15VERPd295UTRJcE1nSmhQM3BHb3pVZnFnUmtablZ6L2dlL1BKNXRT?=
 =?utf-8?B?RFJMb2dPY3pUSGxGaytjbTVjbnNtMHJEeE5aQVpaNndUeHgwTEFvRUxiKzhB?=
 =?utf-8?B?R1k4a1NId0tBYjk0Rk9kRmFyQVUya3RSd2x3UXBKeHFkTlhjUUlLNWc0a0xO?=
 =?utf-8?B?TXMveEc3TGVJM3JJM1hjY2d4K0E5K2dVYnNiUTJ5akVVS09PTmltNHJHWndY?=
 =?utf-8?B?NHRxdFBoWkhyUU85QmtiU3dpelJQY3JBWEN4UWYwYWVXVVcwWFdaMTFZMGpN?=
 =?utf-8?B?cXA3NEI5SDhZeTdWQm0xb3diZE1Qb2ZKK0t2NkxyeUFNZzZLTDdYRXZNS05G?=
 =?utf-8?B?QkdxK3ZRNEhBQ2s1dlg2d01YYlg2NFBOcXdqaHU4bzJPVFlLZ3lCcDdJNU4z?=
 =?utf-8?B?bGdiS2JWcW1mdDVrdzFvSUFNTzIzTmdnY1ZZREZGNXpsNW9LdHlUTktqR25I?=
 =?utf-8?Q?z6ho/uU9bpt6F40j2DtTDPngk7x8zBYpyRvWA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67203ab8-6937-454b-ce82-08dee7139355
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:59.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjuFL44GwRSSsHdvqKc8PBTwbqa3QJtMVOCvrQBbIYmAxoe3uqLDt1EX6Y+MiKL6CGHP9CHHKWw+z8mb0yMQW8L+D4rlh1bQsgCD5lxlUClGQ7y/PNVWp/4dZl4FRHh2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..16399d921e04 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0


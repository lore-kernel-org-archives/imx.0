Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8739296BD3
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288171; cv=fail; b=n0jWdxXK+Ps6xPQpkS4ziDXAS8wZq5W577DDXDI6pHeWTga2SMV0OmaWB5i7k5IJ5zcp6wLH7NW2NUyB8iuiPFqcz6VG9yNN+EKcgwL/ONGHkhA+9A3TnZMvVs3JvYjrJqvGE+Z+oXXcIgsLCjEx/SO/Wu8adT5jLMGFV+7wXWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288171; c=relaxed/simple;
	bh=Y+dNBELvk9AIlZnQMFmZ2txHSJX+r4Dl8cScZ3y41TU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DJbmmxSifXVUeegM8SMMTQB/VppjOUjXMusFDf4zuxs9onoKHGtuPaSWxAICzEKt2wwTFle6O107QpxQxs64A4mkLGvvXVArcx8LTYTQT4GtPaLumcIg3ZxP49fwz02xf/pwSGiKiIOHD5+3A1dS44oCDkKnNImV+abDxu3Wu0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S91Gd5k6; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S91Gd5k6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIrS5THNtpbOyprvNuAQT5VQdDxQfawePDsI6xTGYbqo3je8XlWLT1vGhKkqasHnOx/YcTO2eTMX+fVzmAuBv2Ikey73hgJjXD+dZBM7rNkDWZLeFk/j1G+WnnEsw+e2+pns/Cio5+cuXNEZJ9Qt2vbgLd7lt1W83vmIQItH4E229xihUkHmRikN/mP0Rpf4LuJHSSGZpoZQbGY9GWZy3GKjr6MIK9LeACoMsaXvy1HoXKXA3TTuWQDkMM34Sd1cFrxdyKI/TYlovB4aUM0GMp6/Tst+UJL80VK+CSwUxiizR7zpnxgeq9uFO1c+Mwh6loV4KB1PHWEmuO1c5ZAJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URl4FQxFhHr7LiX8AxWBFTTIgiY02+8jlOvW6HvEFAU=;
 b=FG6u8PoFVSKw1ElREybN2gl/UB9X7I111I3fPE7EhRj80GpMeDteSgzUsPI4PWKhw2yMFe8ZRuxDQ+BqzmpWeKa5k/4vs4ni8WbZpHqMjSkaQD/BcKwuidcziSL6lgbG/lNCEKsO6RvKAv12CZCvj5HIvrIah0AJYdYowZr9r6yRFQDdnPqukpymH6dVOv0zsSFrCDMTeiaDAaaKIy7sryHEj4eV3PwzBHNn5uOWxCK2C1y/mG8LgK94e+YsxLhC6IGYN0JddE+IWWjKUG5G8p5hM9WW5S8lg7KU1gVdC3HkOjNCTTbeMgfhHheGVf3VHTi7IXLCc48rmFn1D6vYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URl4FQxFhHr7LiX8AxWBFTTIgiY02+8jlOvW6HvEFAU=;
 b=S91Gd5k6CksKejJiUOMw8VDTdEbsX0mBCdrtmbdxaa2vpIr9yJSUZc0Z+jZyBjCBrSNmbOBHWdKtM5UwLPX/EbZUtwU6NxfOkqa+nF7dUH1/ntyDgj4PWSAQc1K9b9kZo0E1Lz9jVQsszB3DqjjEJKN5ZgUrqnUlwyNzBSegyDi27lJOxZQmJsi9pK8jxT88dsn/kT7DPVpMAfQBJI0VuDA97LPl37UD/v9VKJNEaPnR0zA5M7cgUvRQ79Osoi6BGlqQa30MGYmntFgq+2PAOY+6PpaaDOs5XgtVGH8Fyf2Zbs/8RydwemcF/p0CboFzSAJtTMsE0pPXFA5kGppEgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:42 +0800
Subject: [PATCH 7/7] arm64: dts: imx93-9x9-qsb: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-7-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
In-Reply-To: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0075.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: c96efea8-1441-4b57-5759-08deed0fe5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qYfr/+nZWPoaZUrFIOE+qYoHkjDBY6XxsaQUs/Bytqc13Oalsj/7+V+eXht6+TBakSqV9cWchsSpjoYF7kAACOdhjU7uXFDhKoyMj6WEd2L0KhReaokLDTWEwXPF8ikf1dBSNtppRyKlui8nqe+wM8QwYxWSuGcnt81B4Kaf46COoGcwmi1bB5NJ3oWkTqDQ2swz1YZHXDv9wQsuGTCZhnPD9Tu5bnVAde+LbXBcpV7enkwlS2qBIrf0qEirJyayoCpesPTmLvvvlsgpijCsV6zLUi5KVS1UfSL87vIejP2ue9b9ii9m3/lIlwy0DM7oPpdOBcbTVqM7xISz5ZlkTsE750IszqsEUCT0NFQo7csBqyhReXvdCzrPipeKQzXmHTl9Qwd4BqYOhUXHwTwnskNWgV9fZaxbjLRyVJY4VocfL2k3ULExdocr5ERb9+nMbjGnvbIggdaxJ0e8XJZDBBycZ7zFsterDG8vEWLTBxhtxQnUSrxcKqW5fXA3ci9fSfNy4FkrarJRLgr+G70wp+uvMaJhA9ZTkNnrI7te9hal+8m6J/US5n04kvMXkz0N8JcKqZWvMsqTBwbmZcLPyzaJx7++wG0lJcK9JLHHm55Hs1VwD8Wpv3G4gNiy1hHTd2E1NPjwt4NzR2VU5SaZN1/eGMgYZhEGlOxMI4xXD6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1hBWlJwTDFqUG4vdHlYcmRBVjhERXNiZkVrOEkyMXc4UHRraDJ6ampza3ZD?=
 =?utf-8?B?R0VUVi82TjBXd2hrVitiWnUxZ3VENGtac1IyRUVXV1BWVHJVc3IxTXJxR05q?=
 =?utf-8?B?SGhEQnlEZmxEZjFtZFlsaklWcGNmckxYaVZMREpLcXRlUVRzQi9Pakx5RFBl?=
 =?utf-8?B?UkFaak4zNWVUL3U5VDdjeTByYUZ5UXBIS2RGdTcrNFg5ZVJzZ3Y4Z2pZSnZ2?=
 =?utf-8?B?OVhCTmJhdnRSOVlma2U1aGo1Z2dXZncrU3daTjJwRUtMV0hoOWptbVpvRzdI?=
 =?utf-8?B?Ymd6Szk1UWY5VHZmRUZyL2JTZTlVaU1wUWtyNnZ1NTRuVjBKVXhEVXA2ZWVu?=
 =?utf-8?B?T2w4eFhzazZ4ZEkrZ0J0Q0NDWWRkaFhxeHl0ejdrYjF2cUZ6cjJqVUtIMWpC?=
 =?utf-8?B?YmhUbGQ5YkN3YTVSVE5YVFZwamZ0OUpBRWE5UXZucWIvREpIbDVDQjJYanBF?=
 =?utf-8?B?MWIvTG5ib2hQYmhqQ3VGb3dic3BuWjhxNkgvRk9pczFkY0FpdmhDZ05zT1k0?=
 =?utf-8?B?Q0FMZ1M4d0JxUm5qaTlWVHNoRUdoMzNjWDVHNC9GWVNWQ1J1bTJkM0thbW0r?=
 =?utf-8?B?RVY2b0ZrcjFvUUIySmdoK3hwZlQ1MFFpNjF0VzQ2ODE3OG1rM0lmb1VUQzdo?=
 =?utf-8?B?eFJRUjZRblZkNHZSL2tUTjhDSEtOOCt2bGovWFNMa01oNFpvZ1ViVzVxL3Zv?=
 =?utf-8?B?djVxa2V4Y3ZFeU1zUGExQUx5U3lhaVo2SHJUSURqNXZ3RUpUMTJQZ0FDcEpD?=
 =?utf-8?B?ZVNpOFd5dm40Ynh3M1p0UmF4VjVPUVdYcFEwM2l1WWc5SEFSZnZ3UHFvME9T?=
 =?utf-8?B?UVF2ZkdXN0VTeUtPUU9UVmduSHdndDBwNmtzNiszc0d5cFY3K25sZEh0UmNz?=
 =?utf-8?B?OVhvU2ZOYUpybUk1dUpZd3YxSXBtSVA2WnJYaUFGOTZCaEYvb3hqTURrc1pt?=
 =?utf-8?B?ZFFOQU5MakdBMjZhcWVUMUFmaTdWK3NheFhqa2kzZ1RGdTJFZllMb082OHZX?=
 =?utf-8?B?VmhuRUUrdkFsaHFLYXFxZ25wWE1ON3BZT0NRaHVtamswczFVb3BjdG5tTDFJ?=
 =?utf-8?B?L3g4MEE2Wit5d1V6OVdJM1JPRFJWVC9kR1Y0R3FCL2lIUXVpVGp6VzQ5Y01U?=
 =?utf-8?B?dWxia2taWW9wTnF1OWxpRDh5N2VFOFk5SkY1NWU4SUQ1b3FLQnkvdzlEM3JL?=
 =?utf-8?B?YTl4T0xtYjVLSW9TbUNoUHA1Sml0SVlPR3B1SXQwRTZQdzhGRzIwL3lCT3pY?=
 =?utf-8?B?QnFWd2UzTkhkSGZaTlJjc0pJOWJBWjBVZkdEdWdYSzFZVWVsNXdJVUQ1TDRF?=
 =?utf-8?B?SGRuQlNmdlRPVG4veHN3emtrTzU5ZVNrU1Foa1ZhajlWMDNYaC9rNFh3akNy?=
 =?utf-8?B?S1ZxZGYzVWlyZjhZM3JpWjdqZ3liS1JpNjdYaXNQMnJ5YzNJMzR2dFpKWkU0?=
 =?utf-8?B?Z1o5Z1ZKSXBNWm5oeWQ2cFBTYkh1TllGVVF3eTg5VWpoTy9PRWFDUVo2ZHNU?=
 =?utf-8?B?MHBzR2k1emRmUHI0RGlOdXRMc0pFcXJVWUZySjV1K21oWFFSbzdleVRzczlH?=
 =?utf-8?B?QkdFeERIczc5a0ZZOFpYQ01TM004SVpiaHAweXRsYkc0STlIMFBKU2VOa3A1?=
 =?utf-8?B?RFhOU2pxb2VlZ0pacTU0dnovQ0s2aEM4TUExQThOdXE0UzFTdWRCZ2h1RFhW?=
 =?utf-8?B?K3MwcUl4QnlmdThHTGl3cUN4T2ZWc3JReFlmWUd3NzdseUNRcEdlbmpiWkV6?=
 =?utf-8?B?ZjFQdU92S29nc29CY2lZM0RSclE1SGYrUElrNDRjYmVlK0E0UWZyZ2R3UEZR?=
 =?utf-8?B?ZmNqczBhdW1kM0QzR0FhWXNMbTMvNm83azA5TzRRMndqMmdpbDZWclFVVVJu?=
 =?utf-8?B?UjBGR251VHVINVArano2NWpCSS82Zm5oZW1PbmhEYTEvOFFnZjJWMURLMWdN?=
 =?utf-8?B?aDA4U3lPVnVTY25JcHF6OUtDWG54Nk12dWJCVEJGZ3k3bXdwcmxUUHU1SHhI?=
 =?utf-8?B?bktTR01tZHM5ajVITVEyOURsZzQxeE15ZHM3M3JyeGpndkFJZjBKYmptQmlv?=
 =?utf-8?B?MDg4ZFhHMkJuaFVNOEtWaUFuMGNKZDljVkxCQmk5K0NXcklhSHpnaWc4ZlhQ?=
 =?utf-8?B?MFpzcitrWkthWkJrOCtnOFJEaVc3aDkzZVdSWFNiekIrSkdXUGZwd01rZUlo?=
 =?utf-8?B?UVc1QnhKcnV2MTI2RFJzOHhnazFyN0daMmU2blF4eGdGTkUyWnJGS3lpWnFt?=
 =?utf-8?B?Y0tOMHc2SmZQRDZ6SlFITFNxV1hPSUVqVjNOWERqaGdDWFB1cHAyRFRBZGZV?=
 =?utf-8?B?OC8zYjhaazV6cGswaEJrSkVpa2xEaG5pRVFxTTV2QzIwMTBlTHk4RkoxTG1l?=
 =?utf-8?Q?elaD4gPrcLWw9oYbtKKJM+Atg08L7/Rnbjmrw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96efea8-1441-4b57-5759-08deed0fe5e0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:47.2581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LstEOYPQoEkDJ6+/h4ccSTRlfQzx7LBRZDcb+TxdyeSFblH4q+pB6kY9UQerhhA1YQzMv8m+U/lBphIV2clzz3E7AQ21CkaHLElqRLVin6I3axQii1J49URfZ8zlIpSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 0565d20cd8c2 ("arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 01c11c517986a..f07e93653e4e6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -76,7 +76,7 @@ rsc_table: rsc-table@2021e000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a4020000 {
+		vdev0buffer: vdev0buffer@a4020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa4020000 0 0x100000>;
 			no-map;
@@ -212,7 +212,7 @@ &cm33 {
 	mboxes = <&mu1 0 1>,
 		 <&mu1 1 1>,
 		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1


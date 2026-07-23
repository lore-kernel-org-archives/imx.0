Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1D4C0429
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811428; cv=fail; b=bZg9VQFUPJ7wB5w+2b+fr4qjRSCx8KdTJQiYGyf7rX82kMNm8mfNxnvW2GvVhZLRjUIHKooMlv/jjMH6jzy0m+zt7kH1iE6QAWxBSFTaKBfA44g7gkSdgezH1SiTib6HOCQqm9BgEvhpejI5PKRnfaHN8GcNPjPIWHYq0U9bywc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811428; c=relaxed/simple;
	bh=UReL2T/2h8jm84gVL5KAHyRnZyV/3rP5rLynRhZnwg0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TqcyCn1BZaqix5ERZ1P0d5ey8ACSkYE6UEFgIgBiZwkk6zedQyh5LvKSmSHnYHHl7qlkvgQvb6/cT5G0mtKcDo40F4+/KMQXuSxQK+iXfL6Q5W/frla1KpCJRNn3PXDIXliOkhOZA28b3dKAg9Y5JXzYdjuVxKR/WkEhiDUjyEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CCk5ieIZ; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CCk5ieIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hx5s7Nm1lBVngf03hCCWiEYIf0xkQ6+zBHJ7yg/Yu6o0Hu2JKTYb0lSiSDmU4V87AAFi0oG+iDg3OTBo/LRZ08fnsp+OBTCi4dh1lNvsNQeLJZHtjyJEuM+VeZfQXcUPPzChCyaQEhmEVcNddqLPBSNETvFeTbJMbw3iVtIgSSfbNr6VGxXL7JWuB5tGPmGHtUbCgyUz8Zw2Z2cxv644SFEyxbplDiqjWhSApafRkCl9zuc952fnm/p4ulAQcsGqfwyMb8DDQ61tKh0qXokyGdz8vHKjvfSUkFEjz+A561x+S0yjoR2A3kVrkCyUMGHwtwBqEP+0Ncup2unW7tgGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0olaBufSzEHd67Xi9tY6psOfEsqSKI+Wa6xCDDZwDX4=;
 b=HAwXdkyDbhghlt1M6pSX7X5dJxmGnSG6yFKw48j+1sprpq0fRs7jEK+8KESW+mxZlW8wo/NSmoZEbgFEZu9/7EFV62xWBXUlhofKAWXdfXOyduKg9cH49nMokBLw8OJiif4ev291iWrGpX3Ukd62jFDcxovz/OAvUHuusGguy7WnfEQ3Ti0Ul3eB7VbkwhiaDOXxAWO6J2nTWm/MBN67ZY8bwPKNVdCh5gftb3IGY7u8E1Xlkpp2NtcUmnAzPwR8ckFjyhuT1Yd2eQpCskYYY8Dx5eZbzZbTg/nvnYmoO69b8iOxKiSQax6TlKoASCjhDNJzm97nlXjUlvgZ3nqViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0olaBufSzEHd67Xi9tY6psOfEsqSKI+Wa6xCDDZwDX4=;
 b=CCk5ieIZfyJ90isChDVf9vS08gkGpPi+eHNS3SAnIRwApq3qWnyy2YB7R0pSELgxG1hbzmCmz2d7YeKXFfvx11EsV71jW68NweGE/YaZijysnVvHSh60FEgMxq4RIJyP78G5OXUgZuDDbryYJ67WJkVlWXu/ECy4frKAoDj7RRLbHTjPHqRwbWaw9ZbuU1NdcuhLAAUt8hT2r7BiF9/b0BDIxospNgXh6gZIV1qzY8Y/7jVvE5wazZWm459vVntLvHWo3cSkDtvT91lpT/eGC+1q48oRpAH3K4SUnyCNLWYYgmVGTj9y85bajB0PD6EsXiULw3crb37gd7CBZ80nRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11446.eurprd04.prod.outlook.com (2603:10a6:150:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 12:57:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 12:57:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 23 Jul 2026 21:00:06 +0800
Subject: [PATCH v2 4/4] arm64: dts: imx8ulp-evk: Update rpmsg resource
 table address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx-rproc-dts-v2-4-a5f5cf2eb55a@nxp.com>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
In-Reply-To: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Biwen Li <biwen.li@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e5e8ec-b58a-44bf-f60b-08dee8b9e35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wwt3e+G3lZMuCg2FYWtoc+Lm+5oCPVLARyih6lZRgkU6I36hgC6R+on44go4yp97TtETMG23lT88VTPXuI7n8lJ9/BSMndLznmtCGB5cf/lp07USe13qlXlHuBibDB42AZR1o4LuSzyVSL/XpBc1s904z3kGcSDimUqUrGsbevn3IUhHwHw5vLbKs0BqaF9kwA/r5AP/eljHrXsZRIImcHvRSgwehVBtKh6J3LXTE6AYmFlAfEh2RDJNRUS4W3zNS0faXtL7+ieyut4ZGGkfkW092QqDYKSwr1qnRMGP/63EjFYzE7iUh3Hi+uoy6mbBhzadFqp5/QHoiZETZRiKLPfmIyNILDbBdB/jc8aRVyBbHre0ubaj1n7kU/EqEfQ2ZEKRuLr03cVX5AQrPz+q2N9I95FjDwIMBIvP4o2yt5UgM5GgKGwhwZ53Pz3L4yTkn1sdLbVfTOIuYvu19ky2KE6gM4epALvxX83J7lhn0Zqw6ucflt1BA62+bqO6v/PTN3ocxnWXue8Ytrkxa74z30Hxga4Cmu14Xa4C9/VhO84ASYsJBlnVaxAPilUX7uVpDDLOwcIX6EMsLcEk6PgBsY9QX4IuMKTyOw9JxLhJZsrT/tIHud2NKcUIgDTI/veYw5i32AiiR2K9ZWEHY2RpnLUaysKEw65ie2dSF8ORyzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2ZUZm9jQ2puYWxmU2x4Tk0zV3dHT0lwT0VUR2s4MzFHNmplYmlydWVwWUYz?=
 =?utf-8?B?QjM4TUZBdWJydHNMeGZMYTB4SG1SZWJaTzNpNm4xLzZCRU1BcktOaTVlN0xQ?=
 =?utf-8?B?dVFQVmlRZFN3NWZ6NTRlSm55Tit0aG1CdWhQMGV3WUZkZG1yOHl1UlFkZjVv?=
 =?utf-8?B?Qk1QT3F4MnlkN2hSa2ZiVXQ0RmxRRWFBYlBWeVU5WlhyWnluenJNWDNpSUNh?=
 =?utf-8?B?bTVjc3VDaGFhOUdzdnZROHNuUVBubGxzbjhQZnMrb2RtMitMV2JySHlQSHNS?=
 =?utf-8?B?WjdpcitSTUN3OFdhejREVUFRV0hmc20rMUlDa2sySUdnNncrUml2QzZxTEM3?=
 =?utf-8?B?TlZmU2UrSkpGYkZMaS9YNWhWQ0tMc2NSMzd4N0oxN0YxRy9yTzIrT1lLTTFB?=
 =?utf-8?B?dmtkcDBrL2VMcVZUWEVyRXZ4RUYxbFBKQzZRc25GMWZGeVpGcGwwaExrRTJv?=
 =?utf-8?B?MWhMK3VpbTFkYnBQVnZ3cFRxcGw0TDN2WVM1aVZHV05CSFhmMVUwU2VTYzZY?=
 =?utf-8?B?UFcvRHpXUVhPT1JjM1JGbXlkZk41bnNVS1ZFSFBHQmR0aHpOU1BIOENZZG5F?=
 =?utf-8?B?aDhRRTZkN1lTdnNJMENqdjZ3ejBERkRuTFFNK2hoM3lHTEt3aWpVb3h1alA4?=
 =?utf-8?B?am9FbytEb09LdElGbjF5MkRUQ3B0aE5vNjlFa3ZLcjQ2eWYrVllNL2dlOHFL?=
 =?utf-8?B?SVdpcW5pL0owak1aTlhpUjIxT204cWRJeVVxYkhDTTk2ak5jUzhDaUJ6ZUZB?=
 =?utf-8?B?VVE4VkR5dUZJWE4rM0NUbTNNMmtIWi9aekVyOWZJVy9OVmNIZWJZeFdocFlV?=
 =?utf-8?B?VWdNSDdpaDF4ZFl3TFdOY1ZlOEEvNHhTSGlWYkQ5TEdxaVJPRm81a3orcXRu?=
 =?utf-8?B?UTM0ZlZjRGhmeCtiUWVuWXIrNE9iYldqdkZTRzFjOUZIMXJsM29PSWdjdFRL?=
 =?utf-8?B?b200dGltMlJpMTM3OE5CajErc3RNdXZ0NlNNd0pYNnNyN0gzTzMwaU5VdU1Y?=
 =?utf-8?B?LzZJaURESU5WZm12ZTU1dS9qd0Vrckd1V3ZCWkFXaEJORW9vaE1VYVlIZmRV?=
 =?utf-8?B?MW1ab0d6SjZmTUM0ODhKbTVRZTZkWVp4cXBqdVVKV2h3V05Oc2hMNjg1ZDls?=
 =?utf-8?B?T01vcGt0bm1OSG9tbFZTUzlXbG1MV0F4YlFuNjZkdkZockppSUdhTE91UFN4?=
 =?utf-8?B?ZXBrU2l3M3Vpc1doWjRycTBDRGh2bTBUR0NNb3pIbHd4ZVBMTlplaStBMFQw?=
 =?utf-8?B?SlBvMkNwbUJkTlZZV3RGNkNBK1VxeTZGbUpYaHFzTWtyeW40cmhvZ1VQbEFj?=
 =?utf-8?B?VmZ2NWZxYmVlY3NGRURUNWF2SGZsQ2x3RkIyMW5BTURCS2JkMWNhWURPWVFU?=
 =?utf-8?B?Vlo1akwvU3EzTDBGYUg0ZE5qcEFSRU9pQWtFZVhuYW9TN0dUUU03WWJzTHRB?=
 =?utf-8?B?WTZONlhVTk9hWEM5KzcvUkpnY3RaU0p4SFJEc1N4dklpZzBZelhWbWduNXNk?=
 =?utf-8?B?Lyt0aEl3UTcxQnlSUjJoNUhaM2VVbXZqcWFjeFR5eXZJVCtuVUtubUdaUkVP?=
 =?utf-8?B?R0tjemVqNG1CNGRYbm83Nlc0cGUvd3YyWXRIOVFUQVpuS3gwN1FHT2ZGUjJE?=
 =?utf-8?B?M0pvWFFocjRhUEhpVTUrSEpYcnlVdk5zQ2N0MXB5Z3pxdTFXUEt0N1dITWZr?=
 =?utf-8?B?QStwUnN0cUlJVXNHd2IzcGs4Si9uUyttVklvejRsVGY3eUdPVngwaUFudUYr?=
 =?utf-8?B?ckpPMm9zVWdHb25La3N2U2lQNllMWnJTajdFQ29ydG5pWWpST3pOL1lBVFpZ?=
 =?utf-8?B?dDNaYzdNSWVyQ3FnWGdoSGhhTnZXOGI0bVlJTlFWNWZWZmJLc29MT200RzRx?=
 =?utf-8?B?RzJhakxra3hPUTlZZWN3aVZBSWNFOXRKTytZbHhrdlZEaU8wRFY5eithQ21V?=
 =?utf-8?B?TUZEbDRhYlhHT0F0NU4rYnR3b3o0elpwRUNhT1FCYUlUR0dzTXJLQlB6Ty8r?=
 =?utf-8?B?Q01qYmxaNzNxdTFLRGR4RnRJS2ZDcnVuWi9rVFlGKzQ1RE4wMHZXYUNDMGMz?=
 =?utf-8?B?bEpZZkxIZmZjWHR2NmgzeWp3QndCM1JIUVNUckRPRklpcVNTRUhBNjVFSlRt?=
 =?utf-8?B?bE9WMUk0ZmxKRVk3aGdreFNGVnZnWXRmNVJpYXZWMGRkdkdUZVZNY0xjRCta?=
 =?utf-8?B?KzhudmczT01vRnMzWUppZjUycUJTcDVpY2NXYzZ1QTBKcHdld3VwL0RTaGln?=
 =?utf-8?B?Vkg0cktOc0pwSmZUb1RSMGtrOVlCY1ZYaEpPbjZBbUtGNXo0UE1ZOWlsTWdW?=
 =?utf-8?B?Q3VId2c5aVlRUEhHS0tzV1BMK0NOaGdtbmZpTFRTQ1hvWkY0Rml1UWQzbFdY?=
 =?utf-8?Q?0vwId79AJ4DjfD6stw1fz1SmaaK0R2y4zAPyg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e5e8ec-b58a-44bf-f60b-08dee8b9e35c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:57:01.6200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g75Mag7iR4xl/rxxJF0xgUlRXp5hguiylvRh666bxN9uKs/K9ES9NAZa+8ymI3bpLFRALmMpfvdyf1iWiJHgDaIJ2D6S6BDnkKZFrbQGPYCE7OULFMGYObOvCd8gkmbw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11446

From: Biwen Li <biwen.li@nxp.com>

The MCU firmware copies the rsc table to a fixed address (0x1FFF8000) at
startup. However, this address is occupied by variables used in the MCU
firmware, so copying the rsc table there corrupts those variables.

Move the rsc-table reserved memory region from 0x1FFF8000 to 0x20000000
to avoid the conflict. The M33 firmware linker script has been updated
accordingly to place the rpmsg resource table at 0x20000000 (DTCM
m_rsc_tbl region).

Signed-off-by: Biwen Li <biwen.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa0..0f9d55e811391 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -42,8 +42,8 @@ m33_reserved: noncacheable-section@a8600000 {
 			no-map;
 		};
 
-		rsc_table: rsc-table@1fff8000 {
-			reg = <0 0x1fff8000 0 0x1000>;
+		rsc_table: rsc-table@20000000 {
+			reg = <0 0x20000000 0 0x1000>;
 			no-map;
 		};
 

-- 
2.34.1


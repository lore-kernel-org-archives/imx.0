Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04931A680C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288125; cv=fail; b=MrSmuXkjwpRgkMKdIW3/R7zinm6lTIT4Tv0pBbIFCxyJraxLxymrV+3EqHjlXxHOV3yTWxfPljhhTxWViAb33L/RpROedk6nftHAt94FRgQxYjn2lW6EWS+ly7GInHuUgOTGDBZ9HBBorGt4JxYa6zWF8Uk2/3Iqt1NiCjD6rwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288125; c=relaxed/simple;
	bh=6dn5vGbtWG7IkNwpqhgo0pQBIwnpUwQr5MHG7iy8iOw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IEctw/JIbh/D+1MYlYGuOxJJ7pqBrDWDNArbubJBlWNWTZwcGk0AfTU/tFGOR5IkBPP6PD39g4iwRd2CJ6V6S1AQijgy2fqUQPTUCY17TSZgPo9/eExoA/40Adpsh7vQBefAi/mKslN/weaPWN9ChaN+KnrND8YNJISKuor4ivU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O+Gok0Dm; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O+Gok0Dm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTi9NBii2InzEuJx7kGkoPFy/7Ewo6ii0DImSRcMhtMnkKpjIUslLxeESTP0QyJ/YI9XvsGMf1wUxEUnSTHmuTJr1OKpsPz0y1PwUrK8JepyycwlAUbIN343v8cwyk008jTNEwy+0dEUerxo5b8tPg3lWs1U3h4HZnY9twfww7W4niwaSrsNxnmaWxX6KNK7YfOzRc58bKgOmWQAhuUbAzJmoWAcSc0nfJpB9iuwRK8mE50OWW4a6EoEp4dPsluYDjUf1hqr/Fqd8mcbdxkOwGUfC/E8FN1dYWAmu5MR3+lgI2HfvRDgm4wzSX2moMNKC6t74J18LSY6rPbE6alLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPFeXjBYcu3Be1G3sJc9H9QeCbpeEW0E5b2gIMah4yI=;
 b=Yy2e5svaDYCrPk8OgUYkmA53O8lbg44T6So3QG25q6BsdxR3wHZx90BlyttPX0leum/m6Fa+T224yLtnhUnpuq/vBXFiLpwkkz7l1PncHaJZd3eXXh9Kluh3VqsAzsT2dVONlQjThT9f0AQnUYviGTBYxKn1la/MKL9rhoRiC1/MQ/Aj8l5kFo7v9s5GqNzos71PsFl7AOIH2k5UKgkbUcmCUT1Jt+2Vj92qJ0Lx8tXEvA4DGlVBbTkG806+SRXtJ+XNtgNXLrh+1P/v2/TebDswMP6jtGtIsdeU8SHQexfmwxUOS+xY2s54nUylZ+JcxBKTVAT8DaOP05E4wgPA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPFeXjBYcu3Be1G3sJc9H9QeCbpeEW0E5b2gIMah4yI=;
 b=O+Gok0Dm/BTM3PZ9zs6lsb2k9elR81b/oJNRuzFSUUJYQdbe8PHKpuTOGtRQJFYm1JjNWPqiJwJHxlv2E3+jaSoPqSHqq8ndCLpVi0LdXXfm/ntO5aoIBG+t6RLwp4o5X91TwZQbcmS2svOptWXSYhd0WqaabD6XG5SPxsc87A+AuqrqepR9YaijMxkemCTrUvJigR1q2SqZPKxCYCz2KoH+R2K+ij3yMldreP8QZnIyHQpyJJBRdo1a9rTA6aIa6hDMGpIfhzmC34CvuCeLmm81UDuYWfS3maR3hiFJWRWwLRiWc/jUsSlswTNiG178WB9xR2qONWj/vVHkjsd7wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:36 +0800
Subject: [PATCH 1/7] arm64: dts: imx8dxl-evk: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-1-368bca0b309f@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0294.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9688f4-8ab4-4bbc-5c9c-08deed0fca44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B9AwMGCI5k6hlPItaIKKIlnSt4LXTyYqRkCi68vHJsYKiMjKS3EgzjTxX8Dz2K2jkPf9oFAH5aat6FetCtdvlMvZjogGyZ0Y5iWxN7BnxpmO30ozWQAtbAAaEz3Cf9jguvO4D+UkiIYe3UrB605E8vQsNRbgCWxjqiBG+I8pexWLgwYkBC6WizsWYaXCfolw4bdoOKui77RQch7yo31DWr9fhERZCJn3or26BhyfIIk4M06pXCfPj1DBsyhMPComZJeW9cmm0CoWYC9lCPT+iZPfA7dDVuOStiILgEe2Gqd1jI9Wl1RXJwrM/wskUpzYsPIxVMQyjakwweGVVX1aVzXcdCYHJlsAE9i7JSXGBITnNzOAl5iyeReyXp4e8lrAUW2uwiuMRVFOOIkjDOVXpZPATSnVm5R3grLkAgi14dR1RM3lq1eFvNrEfn+30bCVPOssaY7f2OD6jBHYdb4riOlDMC+wisfOI01hgRtz3UEnZuxE1xcYpiBGy3yNpzkXy9GyP66FQ/fcCEJHnHiaPgi+o/UBILmQwyZpCFLawZRlk1Lwc2UskHXYgL5dYRDpZIUzyLYJmbSU0JOX6XddTflshJ3FQNCu/Qu1Wmm401w/qF8wxu1bPBUVsSZYv/jFDb05htyyl+PWgNLU0Y0aBnzk4/Yij5dQfvRxjSG5pfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzZjMTFiSFlWeURtN0FoVk9oUkpyanlLUXJhYmJPdTZHT1pkKzB5azRadzVV?=
 =?utf-8?B?NkpRNlJsdE1KR2JqRjVoK1pVYTZYOUsrN0ZxM1EvU0Nkd2RFUEl3UEtkLzhq?=
 =?utf-8?B?Y3o4M2dJY3pBcUxIY084M1pYVWNXSi9nVm5ZR1RlZ0RzMDZXN0cwVEJaM25F?=
 =?utf-8?B?SDBENkNkb05QOWlkZEpLSTFVUm90M1hGQzkwTkZGOW50SkZPQktnclJsdjVZ?=
 =?utf-8?B?NUd1NE9oN0JYUHdKeTZFOGlacnBQYWZhT28xMUYxRXlWNENxditvdTlsajVO?=
 =?utf-8?B?ZHIvVmFTcVFqSWhsNWZ0NWRHM1dTSm1aNjF0K09jR2pvNnFUVzBJOVhpMzZU?=
 =?utf-8?B?dTY5MGFFOWVYYkEyUU84S3gwa1VkKy93TmZBUFl3cWlTZ1h2QXVyUzN3QjJv?=
 =?utf-8?B?b0t1aEs1aWJaWG5WU0NjbVdsdmVoN0lVTWFBYnpLT0xxZDQwNUFkdnpHS0ND?=
 =?utf-8?B?d0FmZlIya1ZXbEFTWk5Ed29YeGVzcWlFYUJuQ25OUCs1d0NmTy9rbkkzeU1p?=
 =?utf-8?B?RDcrTGV2TmE2UG1oSEVjWjFPdnViaEtDdnIwOTVqZUd2eGVwcExDZHNrUTZx?=
 =?utf-8?B?QStoSHVuODNrbnFsUy9ud2gvOE1WUTVIRDdIVTNPQ0taSDF6T0tOZitJdDgz?=
 =?utf-8?B?ZXc5RlV0bjE1UkdCSHE5cnZVdnpYRWR3WldISCtjc0RqZVlyL2c0WjRBeEhE?=
 =?utf-8?B?TkhSV0RsY3lOZmNJTytOL1pudkt6RWwzR21VSHUrdTFSWmc1WDF3MEFVL25C?=
 =?utf-8?B?WkdGbGE1eDVFRnFkOTlSL0l4eDBlVVNpbFVOaDlUM1dacWx1QUxpUVE2Vzgw?=
 =?utf-8?B?THNNaVBxMzZDb3lTQndPazN5NVdBUG1LM05WamduOHZKNUEwOVhYMnVxaTdh?=
 =?utf-8?B?SVlTbnRRZ3Y0S05MeSsxUnJtdlQ3eUpZZWFLeFBnVURPSFg5UVJHc0lzVjFi?=
 =?utf-8?B?aHpCN3JtWmluS3p3QzhDR1l4NHZ3U1N2WnZTZEIycXlmYTJWQlNPVnF6amlt?=
 =?utf-8?B?WW1lREM2MksxdXhkbkNaNnp1NGlKL3hrSVBUenRkRHVwQ1B2RUtVQnUwRE5t?=
 =?utf-8?B?YXpBeTN2SkprNk5aR1AybTk0NzVRUU52K2pvQklYOHVEQ0t1ME9nRTEzTGF0?=
 =?utf-8?B?SE14K2p3Uk9LcVd4S3gwR0ExaFAzZXp6MkwrUzFxd0h6bk9XVHJQbHRtM3NH?=
 =?utf-8?B?YVp1TzIydGptMTBPZ05pK0F3SFU2NGpTcmc0ZVhZSHFYaHh0RDhxUjIwTXdU?=
 =?utf-8?B?UkZLZHdMZ3hYMDJTSzRtL1h3MHlnQkFQY2tGMXBhamFQUFl3SjA5VEVFSkVw?=
 =?utf-8?B?dHUyMmV4Mk1KTUhPNmRkNDI0RGF5MTF5NnJNMFNGVkgwWkNocllYS3BWR0Ny?=
 =?utf-8?B?YnNRMjZReW9rN2pySFFNUHU0SzcrWUJoVnRJZTBla1lTYnlXeUhwVXErTG1n?=
 =?utf-8?B?NUZRNW9xUDBnZ2VvRXlpRHJ4SmFLa0MxRWhYNDMrTVgrSXVsSGF1dkZteFlz?=
 =?utf-8?B?eFZMZXJ3UFcxdjdPZVVNMWQ1RVhYY1EwUWxkV2FOYTZ2TUZoWHExQU1id3Fi?=
 =?utf-8?B?YitrbkpETjV4RTczYUdTNXE5R1BRZ1dKK1FaWDRpb3hOaXpiU25EaGQ3SE1G?=
 =?utf-8?B?clh4d2V4aGtMT0lldmlXZG1YenhBTG9veUsrUFNQeHhJaGxRa1BsaEZKZTJZ?=
 =?utf-8?B?M0NYM0JQc3BHTVlKL3YzT0FzTW9iNFBmM2F1V2ZvSFdzZGoxL2owNEhkbHJP?=
 =?utf-8?B?SGFkbGFpREh6eFNodWZhdndUc0hidmtKZVBPcWY2Q2Z3dCszVUNvakM0ZmtK?=
 =?utf-8?B?M3lxNC8valdFdEpXNTkrZzVWM2h6cG1HWnl1Q21jSWx4dC93dXlCVXdvSjFj?=
 =?utf-8?B?VkNFcHFZVFB5TUVLbS9VVlhJa0xadFRyOWFtSXBhWlI1MTNQTzYxcElKODF1?=
 =?utf-8?B?WGEwbThUaUtQV2lMUGxaZy9XRHRDd2N5K2FCT2dsQ3IyMzBFZ1U0djdrdytv?=
 =?utf-8?B?d0ZQcWwrUUZnWHdJekpMQ0RqZVorMzVzeGo5QWtrRXZ2bkRwMGViTVZ0Zmcy?=
 =?utf-8?B?OGxPR1FJTWthVlJ6d0RBK2VMVWlRVmU4VGQvNC9YTVZrWEZlQU1LMEsvV2pr?=
 =?utf-8?B?eHZ2RFRQT1hKclczbU1hY3FUbkdKRGQ0UDFNL01NSS9hUDY2cm52cE5DWm1L?=
 =?utf-8?B?ZzVzVlJnZ2hxYXU3OFRzQmRkWmNkcnpiQzk3ckV1QWx6VktoYjcyWlpoRkdx?=
 =?utf-8?B?VFY0N0Q3K2lZU01zY3phQ1dLQ2lmMmdvUDNtWHdudzAwMXkvN2F0NnVrd3lm?=
 =?utf-8?B?NjR4ZkJTMERETzBBdUpBbEJtaWF3ZWZ1OVRvdmZSdVlIbVp2M3ZYbnFpUDlu?=
 =?utf-8?Q?Mb94LmernfQLWYwvKrtdlDyKufXHMEQQ2setd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9688f4-8ab4-4bbc-5c9c-08deed0fca44
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:00.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbvH1Mdua8OmjDP1/P5LUYfaRF6UeHVG+MHNSnwN6ozo+Eyq9OcEnRS3RI/VhxhQ6o5gLl8qN4PqJ0JKqBJBGQJAttHqRI/GSVuHWY4rs0qFSC2B/GOqqjGFETJjNCLs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: ee39dbd9a6cb ("arm64: dts: imx8dxl-evk: add imx8dxl_cm4, lsio mu5, related memory region")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 0ede0c7ed422c..6f79aaef2dbb7 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -29,7 +29,7 @@ imx8dxl-cm4 {
 		clocks = <&clk_dummy>;
 		mbox-names = "tx", "rx", "rxdb";
 		mboxes = <&lsio_mu5 0 1 &lsio_mu5 1 1 &lsio_mu5 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
 		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
@@ -90,7 +90,7 @@ rsc_table: memory-rsc-table@900ff000 {
 			no-map;
 		};
 
-		vdevbuffer: memory-vdevbuffer@90400000 {
+		vdev0buffer: vdev0buffer@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;

-- 
2.34.1


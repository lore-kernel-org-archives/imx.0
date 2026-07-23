Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E14BCAAA
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811421; cv=fail; b=lCLJs8rKwIe4Z3YX6azP8lWSEaeuEvHy43Q1hjGipfURt67LdVjdyn5iz2ANZWGLkwZqQx3R9rKJXsSEjfU+9TGy06eA5pirO9zQVp2/G6Is/ZhSoN4ndXr3vagm2geWJaacajEz2Ox5fVD1HiG2hKIkjIM+OBIzn82MgJXG94U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811421; c=relaxed/simple;
	bh=FfsL3GwJoQ3DPKX6uA2SPQEuQcjyGyUxuTFcIfWqiis=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K3ZegV7bwIM0ZL529dL0RuB2nSfGJDCci8x2qqhGCSAV+fiZzhxAjrYlPec8M7R7P7lIbFhf6kjl253i4FKH+jEcM0I0KRCjrXd/xhezhRdjaI6rBiVg3q49vt3B1ltTj7nR6FxgOaGvtqlFlLcEqnoPxIqC/MtpDs8Ah7jSdTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EdIcLyS8; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EdIcLyS8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVTNdcDt3DupiYZaRbedLFNVkjBYwfNm/PgLJ//U3cHDKnfcvKrz6TYsDlGCDenvla6zHpO65xQ9ILZlFu9PN1nuah0Xclh0SDUzzzJ4UjgZmSNJPaRCb3iDWkmc7IQ51NSduJRNvNO1Vx7NlOOfenDdmZwNjrIPRRw+XA2PjDwD7Ua9GfIkMTdLQwwCCwzXOnb51nwSx62LANg+ncLC2Q3tqenzMK2jDNKTUg4uHNlqb98iBrW1jRNcbsZYxdGGgKlp1oCFTYFiTs7n9PXwCOjHw41XBIJghrVHdVTIFNm0DqY1qp11c0MVhLpee9LR8HXiv45Xx6E9t4M6cbfbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j82+hjG72ghFKO4Ljjl7AX1MqSJvkoKyWl1OaEJnZVQ=;
 b=XLn34r7FedSxJk4qCu0xonu8yUhNg5PIddC1Pny6TJomM2Lz2voS0Ab5JzN5WXp2kPrQ8RdGgETHjyzcQr4iBbRCM9seSNztZQSL2pCYfVfFMzEBK5/rLU3iuXT3LMREuE03y1K1SsR41X358OaMUVwwe08tHD50q6kKyjj2bx4cKJfAZsU1wSnnyDs111K93T7gB0Q0CjKT1Qz+lsculuG5/rdhiTizw2oPlFvhMJwpDIqQOdBcM/FUt0l5KEl+LDet9R6GYRrAWBxYgy40mOHUkP07KFBap3KHGJRSwGvRv3HawhvqteQYVIQV7Z4/2/owiVbPqwS9xZioYmaZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j82+hjG72ghFKO4Ljjl7AX1MqSJvkoKyWl1OaEJnZVQ=;
 b=EdIcLyS8fn4Gz7Asdbg9iJnA0Q0sxr8rmRio0XNqsTc3TKOADIP7yG/P54cZuEausD20Tc24JBHt5tWgLdggktRFpUTno9PxCzS0jU6CDTnMZ9yxIkAei5N8HlmnDCNgZHCWtbeC8Tws9y+Pq8m+h8Z3c41yTTL5VRGbcWoiH4TKVoa+YEhIG51ONt6iho1As6hVuluK5Jg38ITTm0JCgPa7V5oxRWILHbFoxlNTHckUeI7BSvug/cquhWRJgShOrN58R7uIlLL2uQ94Wc8XZM22Wa8v1OIlVbuCBwnGkZ6gwgRDMbKlRguI2bRozKSJbY1+NnutHJGrruLLBxeBdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11446.eurprd04.prod.outlook.com (2603:10a6:150:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 12:56:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 12:56:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 23 Jul 2026 21:00:05 +0800
Subject: [PATCH v2 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx-rproc-dts-v2-3-a5f5cf2eb55a@nxp.com>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
In-Reply-To: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0247.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: b5864f07-5b74-48b0-a7ca-08dee8b9deb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ja9x7vCCz8ehs+IsU1ztRyMoIMYwMd9hwXQm14DZ8am0n3+nETPFf9QmiE/EZEwCCrLhzUeSVMMSZfvlFDn5Xxfw2v/MFb4WULLG8syLdHdfCUh4pefc6BL/3FahfiEYovLHzGKsrHQGxLzDgYMHfWHDTsxC2QSLeIwJh7co6mcVlJmW7WezI8w+q4JhyEa/37dDMszAbqJrIGvULncDxDbbdQBDANWMy/5XeMGTOTZ8xJfkXsWxPHrGxJ0fpnOmys/Nj70+t6M36/cbpxbuzpw6X3vihZ7WaUDKO3mWWHJ6FL7elJeqSToSvyELqOyCa7G+qwFa8+lUMcSnDmj8juM0lIfhhx6l0JktCP5k6EGoH3dEuWdI06JRJ3TSlOQL/oZp1vhEPNivKwDEdCIExWtuuFKee9ZplUTJqNyFRGS5CGTgGxwqWAryuPcUBxuGbnEpPKmmYNGWwKIfYZ2B0XkzW7iE1LFm1KSJT6bsEy8xIwyNN9hWdgx+l2s027GfLCZ19Oz4+R9IRgijQIs6r5+ProPRPuczedCnC+sTU+wi0Q0yg++aG2fsfQO+xHVxADau5nyYQ5wA1ZR7NGjGMliD2Tgc1p9yYkQvm+Qsm1t6F4AO/oZtcM4CH+ElPMcZF0IiZhV0kUZy6uyWDURFIhVfQzvkVmqchZrA+OAk6qw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VllwUnBUYzNnQWR1ZjEveFBjMWwybGhUbkhmZ0JmVFFGMkN1ZUNvODRncU9K?=
 =?utf-8?B?T3o2VFgrLzROL3dVZWFlMXkwUk1uZ01zb1VqUjdiblQ5dGZHT1NpSWxnNzNC?=
 =?utf-8?B?czJjQ0pMbHFqVi9lZ0tKdXVjTzRvWXRLSW9icjZhQ0R6ZEFUN3pRVE5RdEVn?=
 =?utf-8?B?eGd0c1pWd3Ywdms0ZTI3SXpjSSszRGYwd3VXQXFrNm9CQXQ2aDZwZ3huNDRG?=
 =?utf-8?B?ZnlMOW5lZTVIeUN3LzRoTVgwS3MvS1ZXZjBRZkxzQ0h0WTZabFBLS3ZQemF0?=
 =?utf-8?B?T0lSN0R5USs0QTE3dUY3WTVmOWNxYk9ZNnR2dTBmaWd1R0RFMWhBREIzb05T?=
 =?utf-8?B?VVFvcjQ2UWliMW5iWk9adnptRHVhenZlVE5GOXl5bWttZzJTbEJCaFlCblZl?=
 =?utf-8?B?S1Nsai8rZGxsWmFNc1cvNVhCTmcyZGpPTWpvLytudDFyQjBFY0UzQkhleWpL?=
 =?utf-8?B?RXhhR2NMMnYvdlNkS3RKWWhqWnNObVFXQ2lmRU80ODlXNTlsWG9pSGxlUVVa?=
 =?utf-8?B?V0MvVWxoV0p5VG5rRHZpNnoxS1ZOdTMzc3RQTEN5OXlaOXJOcVRCUGJJNU1o?=
 =?utf-8?B?dFArcW1JMmQza1BQcFo5QXdiSENDNSsyczk3OWJsa0ExOWRzRDdOTWQxcjA3?=
 =?utf-8?B?dW95U1MrdVVCU3JubkVJcnhFbWFnZVo0YXNuTTVYamRBZVdsN0ZmdXJXVzlW?=
 =?utf-8?B?SmVRQk9DOWdMRzdHVEczNGRQOTJXL0NtVXVqZGxkeitnUlVlMm8vcXdCL2Nl?=
 =?utf-8?B?WkF3ck9QNXJJMG00T21vSGNGcytRNjZaajVJR3lLa0tlR3Rod2NNMUpWaVpa?=
 =?utf-8?B?T0pEckxFTW55MzZhNlRFZTQxOFdDdks1OGpmNjkyam15Qnd5aklhU0ZUUkQx?=
 =?utf-8?B?NlVYWDV2WTlhK2VNNFhzTXhKa0NzS0hNdUlKRCtFWFpmbUdDVlpUYmF0RnZa?=
 =?utf-8?B?WGZFUjJZSFJ4eDVUeTlhWXJnS2hiV2E1MWtuZStDNTQwZWFQV011anRrZ28r?=
 =?utf-8?B?NXFBNy9HSThnMFVpeVNEM1hxVEgxQks0WmQybk1Gdk5teEs0Nng2Z3Fkd0p6?=
 =?utf-8?B?dVVjUFJyeHYvWEVkRStoOWNQMWo1S2Zqd2trSlpLMnBJRS8yMXROVTF3V3c0?=
 =?utf-8?B?ZGVCaUcvR1ZLRktRK2kzbEgyYU9WeHN4S0pJY1ZVejBNTERVK050U1BZaFZq?=
 =?utf-8?B?SXZ1NUpYbUlPcUdJNFN3OVkvbmRFZC8xVXVpU3VqOGtsZlBUWWwrOW13bWJq?=
 =?utf-8?B?TDNYcDlIOUhVT28wTzVxNzBIdDl3R1psZHdsUEZpMzhZcnNFemxXbXFwK0Fi?=
 =?utf-8?B?YWpLdEp5NFFMRVJCcy8wbDBPS3VGWktQdjRTTjNtQTErUmZ0ODBBZEVoakRE?=
 =?utf-8?B?VFdYQnkrRENPdENHd2Z5dklJdXdXZ1VkVlVPaDZRS3NWZXRROGNlZ21tN2RW?=
 =?utf-8?B?Mk5ZQkFURVpTWlhJMzFMNEtRZXRYTnN0SEZObzZwUTVBQ1hnaHhHZ3FXOGxR?=
 =?utf-8?B?OWhhdDJUOTd6cys5ZkxQV2poTWsxbU9aVHBGcS9ta1drcWlWYmpOMXlvQzgz?=
 =?utf-8?B?UWpjV0dvbjNEdzI5OG9SNjVJTkszV0YxN1l6anlzcCswL1RmWjZydVY4QkRT?=
 =?utf-8?B?cUFTY1ZTSnpSOFBiUEVXSDU3clBjQldNQkM0VUdhVk16cDQvcWFCSllZd21w?=
 =?utf-8?B?dkQrZDk5c2U4MTFBWGJrc0Zid2Rtb3Ixc3pjYWYrODNiN08vcHhOSFVVVkFz?=
 =?utf-8?B?bU5yR1BjNlZHTFR4YlFFRDdpb0dic3lMK0RCdHJSd3F4dTFQRXdTME5xN3ll?=
 =?utf-8?B?emI0cng1SW9wUnJpZit0eW45bWRLTWp4VHl5WDFaUmgxYXVoSmg4NHZZOVZt?=
 =?utf-8?B?cGUwM3lKQllRT04vaEVRVkQ3YXh6TE91TUdLK1hJKzl2RmQwTEhodzFqRW1U?=
 =?utf-8?B?WTJ0eExFcys3c09WR0h2QzFrOXR3R3VyQUMxVHU2NzZMeERsT3R5RENUbnMz?=
 =?utf-8?B?NldDUkdhNnNpUmNiZnA0VzNyTUdZSnQ3T2llN0ppU1FwL1loZFVRWlJqQlBF?=
 =?utf-8?B?LzBaWHBkRW1Wc0EwUmtHc25EcU1lQVdRU0JiSHpTRzdpbHBaYjcrQ243R2l3?=
 =?utf-8?B?MzBtRitWSzdUM2tzd3U2cWp2NkM2NlJOVHh6WHFwNmppa20yWHJsM3BYdW0x?=
 =?utf-8?B?ZXdscmhLSklRT0dWeVVubnFRUnVjVklBRUt4cUVZSDNFVlJYVUZHTUhCclVh?=
 =?utf-8?B?ZlRNNHBzZzVLL3QrUS9GWGtiUFd1dWlDcVRYS0UyOFF4aGVOMHRGWVVvZGZw?=
 =?utf-8?B?UUM3NU1Oc3E5aTA3Q3lkdjg2MUdFTE1QeXNmZ3QwemVWRUxsUWo4aWZuV1pp?=
 =?utf-8?Q?C+4USA5o2DBoTFmeB9VvCBRnjzA1M2yNT5XOZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5864f07-5b74-48b0-a7ca-08dee8b9deb6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:56:53.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1R7+NPQAtg/llhPBFqeS9RvTwkcx4hIIGoFHbsQSAPbeQ1MTHM9zILjIDS+aizosxSl9Y1U5nP7XsLTpO7VFFXBKqbsj7GGhbHsxNGcU5TdnS+ArjhCXQXYNuFT7wMJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11446

From: Peng Fan <peng.fan@nxp.com>

Add remoteproc nodes for the two Cortex-M7 cores (CM7-0, CM7-1) and
the Cortex-M33S core, along with their respective reserved memory
regions for firmware, virtio device vrings, resource tables and
shared DMA pools. Enable the MU11, MU13 and MU15 mailbox units used
for inter-processor communication with each remote processor.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 135 +++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 674410e541cba..da7bfbd52e312 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -133,6 +133,36 @@ reg_audio_pwr: regulator-wm8962-pwr {
 		enable-active-high;
 	};
 
+	remoteproc-cm70 {
+		compatible = "fsl,imx94-cm70";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu11 0 1
+			  &mu11 1 1
+			  &mu11 3 1>;
+		memory-region = <&cm70_vdevbuffer>, <&cm70_vdev0vring0>, <&cm70_vdev0vring1>,
+				<&cm70_vdev1vring0>, <&cm70_vdev1vring1>, <&cm70_rsc_table>;
+	};
+
+	remoteproc-cm71 {
+		compatible = "fsl,imx94-cm71";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu13 0 1
+			  &mu13 1 1
+			  &mu13 3 1>;
+		memory-region = <&cm71_vdevbuffer>, <&cm71_vdev0vring0>, <&cm71_vdev0vring1>,
+				<&cm71_vdev1vring0>, <&cm71_vdev1vring1>, <&cm71_rsc_table>;
+	};
+
+	remoteproc-cm33s {
+		compatible = "fsl,imx94-cm33s";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu15 0 1
+			  &mu15 1 1
+			  &mu15 3 1>;
+		memory-region = <&cm33s_vdevbuffer>, <&cm33s_vdev0vring0>, <&cm33s_vdev0vring1>,
+				<&cm33s_vdev1vring0>, <&cm33s_vdev1vring1>, <&cm33s_rsc_table>;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -145,6 +175,99 @@ linux,cma {
 			size = <0 0x10000000>;
 			linux,cma-default;
 		};
+
+		cm33s_vdev0vring0: vdev0vring0@20800000 {
+			reg = <0 0x20800000 0 0x8000>;
+			no-map;
+		};
+
+		cm33s_vdev0vring1: vdev0vring1@20808000 {
+			reg = <0 0x20808000 0 0x8000>;
+			no-map;
+		};
+
+		cm33s_vdev1vring0: vdev1vring0@20810000 {
+			reg = <0 0x20810000 0 0x8000>;
+			no-map;
+		};
+
+		cm33s_vdev1vring1: vdev1vring1@20818000 {
+			reg = <0 0x20818000 0 0x8000>;
+			no-map;
+		};
+
+		cm33s_rsc_table: rsc-table@208a0000 {
+			reg = <0 0x208a0000 0 0x1000>;
+			no-map;
+		};
+
+		cm33s_vdevbuffer: vdevbuffer@20820000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x20820000 0 0x80000>;
+			no-map;
+		};
+
+		cm70_vdev0vring0: vdev0vring0@82000000 {
+			reg = <0 0x82000000 0 0x8000>;
+			no-map;
+		};
+
+		cm70_vdev0vring1: vdev0vring1@82008000 {
+			reg = <0 0x82008000 0 0x8000>;
+			no-map;
+		};
+
+		cm70_vdev1vring0: vdev1vring0@82010000 {
+			reg = <0 0x82010000 0 0x8000>;
+			no-map;
+		};
+
+		cm70_vdev1vring1: vdev1vring1@82018000 {
+			reg = <0 0x82018000 0 0x8000>;
+			no-map;
+		};
+
+		cm70_rsc_table: rsc-table@82220000 {
+			reg = <0 0x82220000 0 0x1000>;
+			no-map;
+		};
+
+		cm70_vdevbuffer: vdevbuffer@82020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x82020000 0 0x100000>;
+			no-map;
+		};
+
+		cm71_vdev0vring0: vdev0vring0@84000000 {
+			reg = <0 0x84000000 0 0x8000>;
+			no-map;
+		};
+
+		cm71_vdev0vring1: vdev0vring1@84008000 {
+			reg = <0 0x84008000 0 0x8000>;
+			no-map;
+		};
+
+		cm71_vdev1vring0: vdev1vring0@84010000 {
+			reg = <0 0x84010000 0 0x8000>;
+			no-map;
+		};
+
+		cm71_vdev1vring1: vdev1vring1@84018000 {
+			reg = <0 0x84018000 0 0x8000>;
+			no-map;
+		};
+
+		cm71_rsc_table: rsc-table@84220000 {
+			reg = <0 0x84220000 0 0x1000>;
+			no-map;
+		};
+
+		cm71_vdevbuffer: vdevbuffer@84020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x84020000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	sound-bt-sco {
@@ -592,6 +715,18 @@ &micfil {
 	status = "okay";
 };
 
+&mu11 {
+	status = "okay";
+};
+
+&mu13 {
+	status = "okay";
+};
+
+&mu15 {
+	status = "okay";
+};
+
 &netc_blk_ctrl {
 	assigned-clocks = <&scmi_clk IMX94_CLK_MAC4>,
 			  <&scmi_clk IMX94_CLK_MAC5>;

-- 
2.34.1


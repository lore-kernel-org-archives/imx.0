Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90363815DD
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 06:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873681; cv=fail; b=V5y1UooK1wDKkzv7Uef5Is/KZa+0alq39dhpKXTXQ+Zyc7dNMlIU2/6rsf7P1+OcQbv+XnBmf48eP9cRnfkVw0Gg54YU0z2NAB3EMLIxeEwbQd1EWbmEJLtMa7sQxF9aqJQSOwqWJQw8zRE1PYDl2Mto662TGU49erLWMfZKXDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873681; c=relaxed/simple;
	bh=t+bd5qC2cx21yYzPnDvP2VsXG2PVfhePGAJLovPGa9s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cunqLHBggze8TTW4WVpWwdtasN0eJkpKhW3IWrtOzY1ZsNXjPOzIBFwNlA9fAsgrT8af2KcWEVmGH6g8XTyGpP0GKuEqh++VJfTqT9X2eGw0l7poz7mZpb2cDLcrjCXpGvKxu3Z+z6DVOg4vDOIfSo1Tm0woB2TGxqdOYdRcLJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CRdy+P7T; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CRdy+P7T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXqDhYYZ9LkjkM+6NIjcuOYBmtScADA4lK+wB1Ldu3clrEQp/YBEUq5ZShC6AeZ7pv2zkjtT2NiTdwvVLPvGpRelgBXp/Q1Br0B9kUOEbCtYpSnlidHKcA3HREvp7vVkYe+V6HDz7HlkabBCMF3noL9ft1WYsZ/HokPpc5B5hbwABgDvvp3hV19y5fXMyglJQLWEJZMB7zB/6HzZtICNX8/tbpUUfyHQ+97d2sm7YiZ02Yl30PucrUUxQFWA1usX22XzfRm7xezPIsXGtJ3FTncJBQPcJePY2PUyEt4jzYzqJ5UYIDudslG/amTOgW+TdR1migQqLQXYo+cCpZgInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAt5+uHVajL7FbV1KFdL3Sz9tUvHh27cPuhw2UZ1Cz0=;
 b=EsgMJEexUSfnRBHH2i/gjuR8xZS8q6HJ4SorOS/QfPRsEkMdp3zyIAieIQA4CZfQsBX89ThJ44SmlZYMYLG2JWvGMaPreYhyr2jYE9IZWFzDLHGy4OSy3Be9ES1Fbhh0I3GcSe6kUQpV35Ba8kpqvFyZopSH6agNdG+lMCrsHskRk5DTCFkUUbbTWa3LxagKmiojYl/MOyMuu45lpBRDH0c6JCSwlw+CuY58Zj/gnhGzAXaQkKDXbpX7TCrzm/DSvYO+zdxyVkGW3tqQrCUYynOuPsevLQVxHWTM7uj/2ngwxz97QMYdIJQCpraDFFy1CucBbDzgSVfrIjywBhwGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAt5+uHVajL7FbV1KFdL3Sz9tUvHh27cPuhw2UZ1Cz0=;
 b=CRdy+P7To7mhRsYm3nYDlyOZGm/Xcb+JptX3y+LtzCOL3p2fqsr8Tv9yUCvzB87T5w+X0c4mnUBDQcYWKiz6gSP+KEvBcSgA0hcfmRKZeEHs3+ETJt8gyn17Xoma+C7VI/BaEdIha1VPa7sSnLUwOLqAPaiQUMzxiLTkZN98U2cBslNux87vKBuEGMOo/4WY6PQlz4xu2BHFTP/mWthp3sAWD9Pe9+Jcx31hy8XQohMPw2nrk/Lkmf7vetp312qXV+GMnZKA8CJ8fuBrkY+8owXuZMx/Ukhlz3eZvWgqZa5J+5q0Dk7VWJHIWFGPpExOt6J+jV3/WYpghW73XQuOzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA2PR04MB10258.eurprd04.prod.outlook.com (2603:10a6:102:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:14:36 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Fri, 24 Jul 2026
 06:14:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jul 2026 14:17:57 +0800
Subject: [PATCH v3 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-rproc-dts-v3-3-175381bdd02d@nxp.com>
References: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
In-Reply-To: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA2PR04MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bc4882-049f-4b93-9606-08dee94ad608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Xd3KTiIGKmarpfX0xbXW+Uq43Wk3NYdSO6swoeORJpVIKEEf1fzTUlKqNua+UehoLbr0gEKbjMqW12Kt8zYV48kkeikKMcqhczzkqe8HCifC68yOGFbdIlRW1APyGf1gazu080+yxg1HykBrV3bciHtic/H3HDfoj+2aJybJ9z+2anBZGL6Hvjd7zLEFMXou4jB55yEq/OguWzafSLfNYoChXwhDbnZcf8WH3V7H8t4Rcm5MpMffPKgDp6bopkIsmmnzQHSZ5D7i/4xfJEm32XGifavTrpBWxUPCpqL2tDfLDpgB90rHq+xaUAP9Cl3oPiYwx8k/3D/TCIhQlr0mdiZksF4pdvDSfNkSvYFZM0qLrRHe1k85zWjdyd+mKy9TjK7lCX00HZmnbFptf7wiMRFZLTsAzhCj0+tonVvztEPo6iCJFxYyki35s3v1at27JbxR6tkIW4+BK7BtiGmrzsfagRwFsrdBqFTUbs2DDTGuqOl8KCAjxnEaVQulBXD3CYkPevoD65er48rjMrwBo2IiquGg8f6r4WvoDwZOx3Tcr030PnaGzWU5J7NvMaiGO+YG0w0Tb8kM8XUa5uvlXzBssTLfrTsElu+Ce4T0I6CfrAVVxE2ksqN4IHi+FglBuEV8DHYNJK/b0ktLNuLDPw+/U7xYuewjLbkESRmP5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTBNMk05eG5aU243eE1mbTE3Z0dVK3R3d05RL3d0Tm02Z0k2MnVXcSszb3k3?=
 =?utf-8?B?K3M1a0pHcDV3NDU2K1VHZE03L2tFUkhmMWwvVmdqS0djR3oweUlxVDJXSzFU?=
 =?utf-8?B?N255N2xaWnRLRlZBUEVHWlBYNityVmtsc0Rjazlrc2JPRDFWcS9HOGs2V1hl?=
 =?utf-8?B?cUI1UHRGcTNCMzFMVGM5S1VvVzN2Zm1DZXVhWWlJQ2RoaStrU3lqQUJNRGd0?=
 =?utf-8?B?WDVZcjRUdnpEQ2dNUWxkS3RqZWU4NlVjSEtoVU11OUlkQUZ0dHAyQjJzVmk4?=
 =?utf-8?B?SjZXdEtrYkJjcWxOa081Smp4TVI5cEJHWDVHNlZob3MwdWN0K0lEcDZCLyty?=
 =?utf-8?B?cy9rODNFV25TWExHNnl1blhRT3N3cXAvcWdWS0xCT3NKNGJxQWJXM0d0a1o5?=
 =?utf-8?B?ZTFpQk9vV29PcGt2R256VVQ3Tk1CTGViQlFwZjZLdlBEcis1algvUGU3ZXMz?=
 =?utf-8?B?Vk5iV0QrMjd3QnFMaEY0NTBQMUQ1QTNkdC9LRHVuWHFJbmxZTjJ3SW5jSGdh?=
 =?utf-8?B?WlNrMjFsc3hHdXBQVXBsNXdPbW0xS2NpMm5aYStoT3crMEFsRHJwTWp0WFEr?=
 =?utf-8?B?RUdvSmF5bmpHUnpYbVhhVE9CNFlUT0pnUWkvWDl1Qm82ZGdhVS9KajRZajVk?=
 =?utf-8?B?SGJ2MHc5djB3WnkxdTlmbTNPangyRHZaME5OdGt1aURoMVpGQU9BVy91aXZ6?=
 =?utf-8?B?ekJmTFVPZ05yRmxueFNGWS9kMkIxTkZRVi9QdWNJd1JDVjJYcUIyYzNXWEdI?=
 =?utf-8?B?UFMrVzRabXBOd2VkZXR1ZXhYNmVhcXZTSzRaUXBjTGFGb3pjZXU1SG1ucFcr?=
 =?utf-8?B?dDZGL3FFL0l3VVVBa0g5ZkJFTXVtbnFiRXM0OFhOS1lNbjVLV1IvWHNRd2hB?=
 =?utf-8?B?NFhYK3hVd3prRWFSdzhnTEN5ZEZZaXR1N1JCOXA1YjhNT3B4Z3UxUmdDamNx?=
 =?utf-8?B?Sjg3dVFaczF0L0lrOFJmdVpRQVNKTlA5SnUxTzVUWm9wc1ZBNEdtaTIyeWYx?=
 =?utf-8?B?cEFobGE5L3NTdjVxdDNGdlM2akJxOHp5ejNrc1REbFczQVMxaTUyYnBWelhy?=
 =?utf-8?B?MnB1MGhwc21wd1R6dGxkQzdJaDlJR3ltcXh3LzJYQ2ZRSkRrN3VHSnVHZ3gy?=
 =?utf-8?B?TmhnelJWYXVSM3I0TmR5c1VtVEcxSlNueit5TVFyNVpnWHRxL2JWWmFibHhH?=
 =?utf-8?B?SEpNeUhTNlBFZlVIV0drYWRndGtFYWNzNlVFTkIyT2RMV1BpdVEwZEFycERQ?=
 =?utf-8?B?ZHlJMTlOZ3I4SUhLbllSeTluNHZBdTVkdmRINlFQcmJQc2VSUjZleTNwSDd3?=
 =?utf-8?B?K2JnR1pzaDZuUkNMWnZuNHlhakRaQXpldk9OcDJhWCt3M1IyZjVNa2FQNlVm?=
 =?utf-8?B?K2pNQkpOMmxJUk5KRjVLM215NldGS1pUY0tiRXB0RkxHYkNwVmF4dVFOaFEz?=
 =?utf-8?B?Z01DV1RqaG9XYnpCRWE3T3BIV1RwWlF6bEQ3aUIyY2IxWXprV3ZpVytiRUZH?=
 =?utf-8?B?YkFhZDVka0hvZXBPVEgyUENIcDRHVE56Z1ZkY3RHZDdDK3VFYXo5K3FnKzBx?=
 =?utf-8?B?VjVEeXc3VWJ4ajl1czNIQnY0Nmx1VVVTaTMrN01rL3hhZzM2M0FIMnk0a1ox?=
 =?utf-8?B?ZDl3YVdNbDROTXVWV2gwVzEyTW1KS3JRNFpJVDFWZCs0a1dRTFpmM3IxbnJI?=
 =?utf-8?B?WDloSmNNM1h5eGtUMy9BUEdWVFFxaFNyei9QcXFrWWpLbHR6WWtKMGRWQXJJ?=
 =?utf-8?B?anRnMWJaWko4UzZUN2Z0RWt4cW93VVNJQ2JCYXFXMFBVeVJlajFYcnhlbUZh?=
 =?utf-8?B?VmJuNW1kQjdhdTBUYVVSRGpzU1hYWVdzNERrdlNrbGNvZ3FDOWVSc2U2b1NE?=
 =?utf-8?B?eFdxOG0wVGdsNnNXell3dUFyOUNnTTF4SHJVQlRiQ1g4NHN1SjVKQlZRN3BM?=
 =?utf-8?B?VkFKcE01aVVhOFd4aVJEcm10aFdzZHpMQm9xNGZVNjE1QWREV3BVMEExL3lj?=
 =?utf-8?B?TFB1dWYzbTlEYU9xM3NpYjN2U09oYVZYWVpMbW1XZVBBdUpFWmxyOUx3dmNv?=
 =?utf-8?B?dExpa1ppdTZqMW5GQkpVRHdSWWk0Sk9hek85WmJuQnhTaDNrWlgxaXpjQ0RK?=
 =?utf-8?B?cTZTRVBYVkxUV0NFZWxYSzd6bVZ4UHZjZkk0UVNnQmlidlVBOC96M0tEUWV4?=
 =?utf-8?B?WVNDK0hkSTNUY0pxUWFkNDg0ejE5TWxBekpwY01NVHFtbHhuNVZVYVl6a2xS?=
 =?utf-8?B?NklXN1pzVzV6NW81OVJpVXhZMUpDeHYrelE4S0FoODlkbTdKNUZBbWp4QVNW?=
 =?utf-8?B?WkVuM3NBZ3o2amErTlR3b01YVGYxUXVkSFEwODVXU1pTVGpoRWszb2sySncr?=
 =?utf-8?Q?lfsmPRoOhR35wUOflljHeG6Nv6+YD+nJ6gnHT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bc4882-049f-4b93-9606-08dee94ad608
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:14:36.3861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GzBA97paNLtjH4uMmKeyT8M1igLG/1d06XgdGGIdEY+1Z/XzXpi77hENA1FBdDsCz8ZOqB4Can+dbDMIKI+aSN6KeVoSTLGcsLQLC2PPeV+MSY8T37BKxJbKFgAUAf8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10258

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
index 674410e541cba..2a73af17cdf48 100644
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
+		memory-region = <&cm70_vdev0buffer>, <&cm70_vdev0vring0>, <&cm70_vdev0vring1>,
+				<&cm70_vdev1vring0>, <&cm70_vdev1vring1>, <&cm70_rsc_table>;
+	};
+
+	remoteproc-cm71 {
+		compatible = "fsl,imx94-cm71";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu13 0 1
+			  &mu13 1 1
+			  &mu13 3 1>;
+		memory-region = <&cm71_vdev0buffer>, <&cm71_vdev0vring0>, <&cm71_vdev0vring1>,
+				<&cm71_vdev1vring0>, <&cm71_vdev1vring1>, <&cm71_rsc_table>;
+	};
+
+	remoteproc-cm33s {
+		compatible = "fsl,imx94-cm33s";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu15 0 1
+			  &mu15 1 1
+			  &mu15 3 1>;
+		memory-region = <&cm33s_vdev0buffer>, <&cm33s_vdev0vring0>, <&cm33s_vdev0vring1>,
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
+		cm33s_vdev0buffer: vdev0buffer@20820000 {
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
+		cm70_vdev0buffer: vdev0buffer@82020000 {
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
+		cm71_vdev0buffer: vdev0buffer@84020000 {
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


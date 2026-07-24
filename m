Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F6381EAA
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873675; cv=fail; b=figTpYBlwSBGcuA9P0SFUdH4WMn5LKPU/MARgNTUHF6zbfvU5vs5CCF95qCp/EjMooiCUiJe2nDSbkN/T+/f9vIUW6xEctSbCTJUXfrnwwnQo710hjGPCOsY9PI4P5JsPWpb51rYqhZ0cgevJfdNzD2MaZq0rJ9ZYOwFYWXqqWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873675; c=relaxed/simple;
	bh=fjxyUcWorxaMWw2uHf1SM2CgA/6zzA4cLHcU3Wm4ayM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oKzIVK2iXywLQPbOIPkTXrJFzAXUx6NV3Nn6GYzEhR+yRTZl2LL/qKRsxNyu42bSlSERtziSWXOD7fzQhc8oAOanUCkDmyWzq7WyOLkMyYgEj9yVc7zWnhCKehc38R5J0TCvcv143aHbqkmjrL8QoJb3uTmffbgSt35VDfL1wYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L7Nn9lRb; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L7Nn9lRb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNwURkub2HPlkG7FEexdG7EdyQKiQJKsu7gwy+uD4DIeTKAlIKFAfi1JD6icRIgyTstK+3EVUhaE7uY2fosFLCY5Gzoik1Rqd6LtvDd9JZmT0ZfyWtfHwhfuqR8b7G8+zv+/hFPziOKIyd1rGKXMcr/gldRaGD/9plvjBh1+c0fUz9iL1sOETtlf9X2/VWL9Nld/jze4kdlFwoq5UTYUYciCe1vzbueby+5m6l5jIRsTwoLYRyHzDbhOaF5x5upQOhZU+Ql41oKtXvnma0FQOq0waSTTWAWr4o+weLvIoAyqYh3e+2pDrT3QwdPMMI2NZJWf6r4Xv1mQEwyVdM4gFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxco89YyaLsatMwY/gFZjKSEJA528pROzhfOqHbbl08=;
 b=J0/BldEVi34YgGOY5fvbKF8rNFOSr3ptwbYBpwZfnFDQ+b05a6XpeOzQWqGrbHgz9dpiqUs5yZl2E4HQNqvNQCrRBmxKVaJkqBZmpM7Q+7wKOOPGVJJuR8hHmC+44EvOwl+v3YUrzsvwhCslswl9kBi34GjTwKh0b9mcIM8e+uAclfhlUIk1JtwcF30EmKkNKipmUwkmpkgu9+rVyAFJg8g2geaitwaZMQ5YozplGGoAxAGevTsWLFtj3Dqj5J1wL1G6cE9B1YKkFzcHbYDmKIrmu5+RWN7q3mZz42q3P1XAKHxpSwKGChVDb9DNRioiIeYLBQFUpGdPOLKzTFSqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxco89YyaLsatMwY/gFZjKSEJA528pROzhfOqHbbl08=;
 b=L7Nn9lRbKCJTRjS10gcN/2jQ5NcCECZNZMSrtSqEuxtG3JWTV7ra5ZQQ9DYRforqY6DpGHR6jWMFaA3UFYE9gjN/I3PE4tjQNRjDv9gXwClWZqvhtIxr+Kro4M1AEjSH7Cmv4vCCplP3j28tZiZt4rarjOIufIwPWZim7yX9U98/jopPzaZ1K1tPLKQeF6X6yZ0dcinc4BUf4Z6++GL9m7yF1CWULOZ5k97F3ekwM7nChQrvnJHhDkyXPvV+if2iu/FbGO7IsKpGmq98Bjq9sQu5NRa0sHKisqocwI28GfgGNkU2Tjt/0mY0F2pdtCVzolJDzwCgRu06gyy42NsnEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA2PR04MB10258.eurprd04.prod.outlook.com (2603:10a6:102:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:14:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Fri, 24 Jul 2026
 06:14:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jul 2026 14:17:56 +0800
Subject: [PATCH v3 2/4] arm64: dts: imx952-evk: Add CM7 node and related
 memory nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-rproc-dts-v3-2-175381bdd02d@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA2PR04MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: cc14f5f1-f2df-4fc7-b0aa-08dee94ad26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v29X3tOgck0U/tvhWDzCo1oRZcyUcVGrDQaKKWOSxIh6AWZoTos2q8xqFjSzrr3YdLi4bcBZaW+4bQznycDvkN2YPk4YJM8wiIRJkR1wg/7R5ogPBvgY7eMENy4RVJqJ6sjf2xp4A4EqAPUPNxkGfBOEAKpnm9ZtVA+kQboCtMrPCtDYYGRpgY9SNDpRmkgY/BDTo5Gfwm2R8o2W1TqeCtWBt8EvrcLKaAdQ6mk+5SivjVdGM7FP5f2a2NN8Yv4j4GD5yeeCe3m8h4/ERlW9puGKgveZhBhe60OCBwAaigNQQFUzGOEqikf56QvefPE+1oCyqLxkgW5j3ck/677BDsmFk/8nvjWwTkLqYYsr5aQvgWXjLrZcj1C5f3mUMmWsdEU0XhrYGeqE79rzvcuL+39ywt4YAZls2cGVCj7yTRIamAZmDLAtEPQBBohdEFcdIYY5qNluUSmkO6hSCig0jkhe2z+yPbxkKV/DvV7JaFW50AT6PLtia5WlaCdvCp6jlbkorcGl8uLHiwnP0EEkc+0gLwsjtZy6FDpj8w5hYM6q0GmOP0fRydcrWdx7b2UHJoGAFkxQXPTW/kJCTIlMqcwJdPDcCMkcvX5eME4Ysmw7Oqhip3/A+FIPZ/ggK7QvokEJyUWzo+60iQAW6UkmLLnBd1YO9fZ9yo7XmzVXiiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVYVWtSYTZmWU5IRmt0YXNKRW5NZTFMT1A5VjlQTzRyWUY2bFMwdkRGZ3Jz?=
 =?utf-8?B?ZHVwWEJZUWl5b2ZlQU9XRDhJVEhzNHQzNmNjV1J1NU9aeDczVUZXbWNCWHZx?=
 =?utf-8?B?UmUyVEM1cVNSTHp4c1UyeG1YRmV4TVlEMmJQT05oRnRGNmtOMVBEaEp0N05t?=
 =?utf-8?B?ZVFreWZGd3FqeVVQNmNPZ3R4ZUNBdy9MbkRGd2hNV2ZNRzludUQ5ZHhWTzFF?=
 =?utf-8?B?VkgvSEZPOEpnNW9RK3VEOHlnb255eTg2bitCL1ZBUXl4cytacVhWelBkYWVS?=
 =?utf-8?B?ck81NmxndDlqZjlnWUIvSEUrOVFYZXVzamhOb0hGaVZiOG1hREEyeTcrTE1T?=
 =?utf-8?B?ZjRSL0ViUng3T2VuQmsxdVRyVFNzcGowMG85T1JKVEsza2JvUDdjaFZPUndO?=
 =?utf-8?B?WFArUWUwM0l0NFNtbTlBZUYxZ2hOeklkOWdMUi9kVnQ3eVZFdk5zMW83aytD?=
 =?utf-8?B?Y3JueTdzUlRsZEFqSkNmS3Vrd2VEdmlTTVBrTVltNDRtTks1NFljT0lNZVFQ?=
 =?utf-8?B?dlJMMms1bkhkdDRsUTZIcWtJVHRtOEsrQUFLMTFkbmUxR291VGRVblVXcW50?=
 =?utf-8?B?RHdYM2kvTmd3MndiRXNXcXhYU1FkMm45WHg1ZlBka0lxRTgyamI3NUN0V0Rk?=
 =?utf-8?B?TUw2Q1Noa3hvRm1VMWdPWEYrTWlLNTJNOU8zM2IwTW1uWjVCUWNsVHJ1djcy?=
 =?utf-8?B?MjB3alJ2T1c5TmlraFVsUG04MzQzZ1FYalBRdEtQUUJGamJwWEtRZDZhT0di?=
 =?utf-8?B?QXF4UXZ1Vy9NellOS3BuRTh2dmxPaHhpN0Ywdm44RFh1cU9xMXozOHFMZyta?=
 =?utf-8?B?MWRUc1o0QkhINTl6OG84TXhVeHlKNFFtWVJHVHZ0SjNJQ2o1aXA3Q2FTYlZV?=
 =?utf-8?B?di9kVWxrWE5SY1RGUmtnd0VHNFlnVWZxN2d5UTBHY1F5d2dSMG1URXpqOUpR?=
 =?utf-8?B?RTZXWWJGbnNSbzUydmpoT282d2I2akN4RFo0WnBPcktlcmlFT1AwTml1b0V4?=
 =?utf-8?B?Z0JNRERvdlRjWGdkU1ZKOE1GQjNDWk5tQ2wxVkp6N2hlOXBVUWRVY3JDdVRD?=
 =?utf-8?B?K3NoODh3MVQwcHgwTDhCUjI5N2oxamRRY0QwQVZQNTEzZWFrQ3pKVUs2eXlY?=
 =?utf-8?B?YW1vZkFUeTlwK0JXSHZFSmF5ekFMT1RvU1JhZktwenVlbUV1ZUNYNnJ4aEpn?=
 =?utf-8?B?aFMxUjBzRW1HRzBxUWZucUtXWHRKR0gxZ09OZW4yQWxOUWRNdWhvZFphSzFL?=
 =?utf-8?B?WFNIb3MzbVFqNnovS0dYcDRkb1gzYmo1WFJVZm0zSExLdmk0VHBNMHVGNWZz?=
 =?utf-8?B?K09TTS91Yk5idkdQZC9MUlRNQWtyK1NMYmYrc05RTTV3SUVyaWRGeGhwcGVo?=
 =?utf-8?B?aHA2eFMyU05WSHpHWU9VWktib0taKzREN083ZU9sK0VaQnlmbHNMbHg1eTZn?=
 =?utf-8?B?OExNbTErZis5ckJzV1lOckllNzJoa0NzV1NiY0gwV3dQbWxpU1Z6UldqQkV5?=
 =?utf-8?B?S3d5a3QyYXVFZXNsVFkrcFc1aW9uVGdDaTBtVzJZYkc0UWt2aFkxazdSNzFJ?=
 =?utf-8?B?bW1iUWt4UUVHOElZendtL0JvaE8yZnkwRCtJRVRpOExtV0ZXLzYrV2hKTEpl?=
 =?utf-8?B?cCtrV2lTNjJWMEgvdWpKbkNFOGhoYVpHSVp5Ym5WNTVqT0lnUXR1RXhqcU5o?=
 =?utf-8?B?cGRiTjNGQWlqc2doeEk3bGM3aGY1NmJ6aGMrK0dXdUhaWWdmUEdKcGcvM1Fy?=
 =?utf-8?B?dktIRHM3K3lvalc2cCt4ZzZvMU9MR2d6UjM1STQ0SG9UWHIzR2JGV1hTSmxZ?=
 =?utf-8?B?aVlBTTNQV0ZzVGNteTByVHBnOUVESWN2MFIySTdkRDNvUmYwaVgrdDNQdmZw?=
 =?utf-8?B?dEM1S1pwaXVHZWQyallEQUs4N3FzR0J5NVNaSW9Ed0t0Y1d2VVRuM1g3R1A1?=
 =?utf-8?B?ZFRDaTcxZ2JkT0h2QmQ2YngvSGt6QkRuQkV6VHAwU1pUQ1RpQXFYb3o0MUps?=
 =?utf-8?B?NE1TYzNjTXFzcjV2RVN0d1pMaVlaZkkycnpnMnlrTDIzbGkraTRyTmt6bm91?=
 =?utf-8?B?VHlDTHBObFdzaHhGbmxXY2ROSTgwY2N2endNejFUcUc3bTJzc0JHSm1WYjRx?=
 =?utf-8?B?R1BMcHVsZnpLWXdPQ3lueWtvQlhNdkR2Z3ZHbmlHUWRZcjU4MnQvUWFGcXY5?=
 =?utf-8?B?UnkwaFZYOTFVZXZWQ1ZsNTdpam1kUDhlSnJFVkNyTnJpd0ZXbnBUakRlRktJ?=
 =?utf-8?B?alVnWmFnaVIyb2JjcFB6NlIvV2lCajFFR3hGQUV3d3RCU2lPb1F4T0puMVlI?=
 =?utf-8?B?YTdDN0djYWNJY2g2RDhFUXVEWDlaSFVNVFFDb2NwWmNqZ3BnZUVyMHFsQUdk?=
 =?utf-8?Q?gyQo9Xr88mwQ3Q2FeYwur1nWqHtPteLHR3p0R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc14f5f1-f2df-4fc7-b0aa-08dee94ad26c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:14:30.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdk5oquYTidzHRln/Y48Ej3KMWhwrTpuEiYLPs9lsZiL6mkQ1PNr3xpF71WrWfX+NIS30sy2JrTRHoHDiJblcS45+HGeOI9KXS7S9qpVlf0/crHBDYLBeqb+tKPnh/Jk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10258

From: Peng Fan <peng.fan@nxp.com>

Add remoteproc CM7 node and reserved memory regions to enable the
Cortex-M7 remote processor. The reserved memory includes firmware
memory, virtio device vring buffers and a resource table for
inter-processor communication via the MU7 mailbox.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 62d1c1c7c5013..2224b90aafe93 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -82,6 +82,42 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		m7_reserved: memory@80000000 {
+			no-map;
+			reg = <0 0x80000000 0 0x1000000>;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -151,6 +187,16 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
@@ -451,6 +497,10 @@ &micfil {
 	status = "okay";
 };
 
+&mu7 {
+	status = "okay";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,

-- 
2.34.1


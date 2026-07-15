Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA7331EDD
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099260; cv=fail; b=QPPGAxDTKZnwNT3ZcunmOL6pKihoIgf8m/wnaU+llyMELaOH0bsLu9c7/DF+7uYjeBKaCaMvMM/RPObj5r2/PSh12yxlC62AbqTKO5cTRW4mMBN9uqifdxtP51LCxDg9HPZywaWJQcTORMMu9ithfJY+ct8AqXh59RfQkH+aSdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099260; c=relaxed/simple;
	bh=FfsL3GwJoQ3DPKX6uA2SPQEuQcjyGyUxuTFcIfWqiis=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hT5KnJA6YVpIhqOKNvsscVH3Li3PPdNlJZE0YTKbXHvhTDuChtG28U9EYOMJ7EXyTwGO8JXegvbL9ipT6TkilbbLKb7zncE8dZFsNrjna5uQwlVcL51TmT/3342SCxYZTQyfhxG8+rhdmBnsi5TND7Y4rHkEpwN9b9e1Dp1MbAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GtW2d+Vw; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GtW2d+Vw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0vEW/Fdn1z5DNi8dpxKHPMJNxsr+bdqeQYAwyWKXXPJ60gDSdIBDHyuPo8oT4IqH1Ec3S4h4j/azAzGIkwuuQEXeYUEg4DjpKxcOPhDJPggz0e1/aT7coDx5aroIKK5eDkMH7f/kk6vs4kgLehjEds9U2BJdcRyzyxF0h+0Hd6Q86056woMZ3wkCPBPBMJP60wpVr2Cq/G+LUKhnDiGjaP/NWQ6+n050sJB9BDCXjhZU3y158OY04l4ieMN3q3RjgxFcikAnB3fKVSmeynBc3vBena+0soCIOkUEZtjEg0QroOj85GEzI6gRFXAwTve8mNFUyrugaLnTAGd2kIZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j82+hjG72ghFKO4Ljjl7AX1MqSJvkoKyWl1OaEJnZVQ=;
 b=Vh0BskTZvIoXdye6wdTimWHC/tICykHjSoCRcFNs/TklxL6qy418Mdly7zQdWgXvl+DlGzstROdzaQXpWjf61zA/iQuUCXUL9mjfW7ahnpvGiNv1Yjvk5PZwHqjyXwlwSqg6WAvYqYYodXFnjIAbvlSLlyi1gLANC12+gnc3ytMFJNVLuJ81LbLD7of+tiZpJvxyut4RxEX2Efs5Ywju6EbOg++QflcNCthWX8Ev/UHY1l0j/0e/ki0kA7AtF1HupfazHlPELN2Pasm/qwOC7TInGs+2PiyIdXegaO2VJ/6nLg6pmfcbSoK15YgyuYhvG1zEBj307fzOyxYl7BYTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j82+hjG72ghFKO4Ljjl7AX1MqSJvkoKyWl1OaEJnZVQ=;
 b=GtW2d+VwvuHEu73uivgKwadmxG0mMRsCNKX8xr4CGjIYG9O5eobdq177hhMEcTZuoK6pLFVgrBHt3iwscVq0lK0Dn3koQ7a2+AawFA1XZw9JHTHEUHEABIE6uWh2h+gvvai9d4jJwvWCcEASa9/9oed2bEZD0/QuFIJ65XncblABcu27a1KhhyKL9etPgwaM8RWnFcw4bMS/0UPCbMSA98twqhBvr9x7QtJoPpAP3u0J0g1AIXDol5LfdBSyRQ+ts+yTWakMsyInoulNKM/S14e5JHegO5y0Z6C0mhuj/1xg6RAOChmFaQ+lorSIgNq8F6tNsbnxcebHaDTkOvHnpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 07:07:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 07:07:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 15:10:39 +0800
Subject: [PATCH 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-rproc-dts-v1-3-d02b583c507b@nxp.com>
References: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
In-Reply-To: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 01823ee6-3713-4d19-e18e-08dee23fbb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1VI7ssNaGDPp4txKXpjOqwW1UymBr5jLGQsqat/2R+M5sathNCcmAKOxugB7bVmsiH38Ux/Bw7TOlGUQwdvl0XFUmtCha/vvsXLqOwG+b1f8mGiVoVnb/vynYOVmh5AkdNsw2a6Q292WGknkJ6poukRrEdRGkTi8rkGVRpaFkb6/Uvn28JHbM/XIgbDWrIkbeeIpEm4qXiGfTRWt/EPVk/m7C+HRvPakMYAwC/mLEddRAWT+RMSaoNkcnNqP4aBaJePgLZiXLd6KwNoh7Lo97eS52VT3W2KVFk3ajY4cpNnazANs+/mYt7YM0hTF03pg3wvkyP4rDTRqdkw0/MSvuFzy5bJN/eqenI5EqeC3iVKk50guG8qpmL55c8NR9AlrHytQBQzru//IAMqb/mOe0J96H1oD+WmxezlrpzD9bJoA/NGmHW0lCK9lBp8/kdxmUYb0sO00SfeOfp+sPM8wdvvclidF14GbEEq96wDHVrd4sterF6dxY+9eMVkczcafF0BK7joNPkN2ma+VmhV4A2j6fhY9jPjD600HcGkP2FIOkSDQtFU1FXxFlve1l0+7cJbPeT67uQUOkDoV8w11CMaiPoX4OtCGJbiUncqXa2jTKNLR20lcc8x9kCUohHJTgOka8+SDtTj+qLvtzCpcAU9UaDmk7nN7l9tlMsy+9iM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEF6aFh3WnRXZGV0dE9ZTWF4UFFBN1Y0Y1ZsZy9WWjFVZkhUWkxrNXNjT2Vi?=
 =?utf-8?B?bFZudVlRdGFpMjlzUktPcnlPb0hmcWp6STdoSCtYVXFKaWx6Rmx2bEVmKzZL?=
 =?utf-8?B?bFppQkR5UG5iNFREeFBKcXJ1N25QN01FbUZMQVozc1VGNmw1VVhkZ0gvdmhM?=
 =?utf-8?B?Vk45eDhtZytjblgwM0ZKYWdSdXVWRkRPOG82YmFSaHhPWG43L2Flam42MjY5?=
 =?utf-8?B?bzJDOGdJTEJCaFV1STlnQTE0V1ZzcGNLZllIa25qNDJ3dGRwU29zQWZqWEM0?=
 =?utf-8?B?RGhrdGxRSFU4TXlKSFFhQTBFQ2lTQkMvSUJvTjZLV1RtVXpqN0dwSnVSRXI3?=
 =?utf-8?B?ZTVaT1NGR0RUdzZ5eDlVOW5udXRTekxtNmJCSjlpMDhmT2ZwaFgrbDUyNGht?=
 =?utf-8?B?bWJiUVB2UGhxVm8wSm9iNzc1NWFybHp2K2xGV1AvMnBNdm4wb3pFVWNkakV1?=
 =?utf-8?B?MUhnWU1RSXpKV0hqV0NpeHpFWldoNDNOTnR6M0orN0VHUjFDNkhwRzV1WHJY?=
 =?utf-8?B?Tm9KL3hyUy9zUE5mVEVoRTNmYmxaTSswbmhjM2dKajBGWmZ4aDBkV3pxbm5j?=
 =?utf-8?B?dHN1Smxtb0l3K3ZIdzQ5QUF1TXVJcWpPZ0w2YW0rZVBnNTIvNUdLcEJ3WEk1?=
 =?utf-8?B?akJLaTdtWjZMMVVYb0xYMXZXbmR6Q1RXN2YwSzZhazUrSXRIYlFVaUxZRVB4?=
 =?utf-8?B?U2JYUHIraEMyOVdUY0JBYmEya1RUbk54dkoydlMvby9aMVJzREFYVnNjZmZO?=
 =?utf-8?B?R0FPakVIeDd4cWl6d2QydWdQSVhWQ0RPcGtRdjNsM0FxNVlJK2h5SktQLzA2?=
 =?utf-8?B?UGI0THgyN1dXK2FqQ253U3A0WHlWTjZBWURCN2oxRjhPQjNYcnNiYXE2QVpH?=
 =?utf-8?B?aVVnVnh5c3FOZThwOWNJNmZwMWEyMG9HaWtsV0gzdG81M1hpalB3L3p4azQ0?=
 =?utf-8?B?Rjd3QTh1MjNZbEFvc08xYjk1ZE8zVmhxNGh3dEdTWlUzb0tTaFEvYXdFSmk4?=
 =?utf-8?B?SlVPK1Z2TnJPRmc1bXFHRkhDWWR2ZkdlMmZ4Y0gxY2pPRkFGdmZ4MUh5a1hM?=
 =?utf-8?B?eklqVitRYyt0WGJNZTNOZGhZTlBoZFVlcGtTam52dUZmakVOYXJpT0x1VFZU?=
 =?utf-8?B?RUpSbWdGWkNHWmF0VCtyaVJxMG5RREgyMnFscTVFOUxWNE9QYko2MHVaeDR0?=
 =?utf-8?B?Q1BSaGRpZmkyckhpOTlGWjgwakh4b3Q2b2pkcnBXcFJtT1VoenhOejlGbzlX?=
 =?utf-8?B?dHFPN1pJcXlLUVp4MjhrWHUxWXBGQldkMldaSWpXYTVnVDVIU1dPU3BsQy9r?=
 =?utf-8?B?SDhBMldycFBLcXEvVGVwaTk2dVhpME85WmhHaDA4SzFBcHgrQXNNZlQyVWxl?=
 =?utf-8?B?TDV2ano4djUxaEM4WWkvUnJST2tqMDlnSnZpWkFOam1rVVJKWjhTbkxFdVhP?=
 =?utf-8?B?UHkxS1NETWxLajY1aURjWWNIUG9GbUY2aW1tdDhNWUVGWmptWlFFZlRmYU83?=
 =?utf-8?B?aW1TY1hTd1djOG81ckFvRVowelBERUoyU3pnb21mdlM0dTZ0b2p4R1ZaZm5i?=
 =?utf-8?B?d1BwQno2NjNsaEJSd2RaM01Uek9sRXlWWElKSmYzU0xrT0w3MGNkOStuN1NO?=
 =?utf-8?B?SCtvUkNoVi9ydFdpVjZTZEh6T21nTkFHUXZYQm9rdkRxaklLbk1hdldnbGU4?=
 =?utf-8?B?anhLWWRrUy9FSDBpSWdVT2dvZHBlQ2JybndqREhJNHVpTlRRVlVBZnR2R1pu?=
 =?utf-8?B?SFNKYWhHc29PUTFlc051bW1CeGRCVysyQitzN0VlcWR1UzZVQ2Rlc1FMZHJ2?=
 =?utf-8?B?U1oxd1VXVFdDQk9mYUN4R1lybEN1L2djS1NVSWhzTXNoM1lVWHlIY2tUZEhr?=
 =?utf-8?B?cllNS2dld0U3T2pEVEVUSVZyeGViNGVkZ2ZSL2FsdUF1Y1Z0UmgwZzc4Zktx?=
 =?utf-8?B?bHEwZkV1RDV5YVBoNlNUQnNOL0Q4Q1FJMk9odFBub0dYeCtCZEVtZzNvWDVu?=
 =?utf-8?B?QTdTOElEYnRRbWRtRHBvZWtxQ21MSFo2Y3Rpek1sYnowMzNSZEZ5YWlQK1JH?=
 =?utf-8?B?emhTcVFoTS9JV3pCTFh1ckplSkNaQXNiZkkvNjlMT2twZFRTWmJ5UWZBU0lU?=
 =?utf-8?B?Uk9vUzJJSldiVlAxSDhQODJEUXhKcFNNN092UXh4UTJMV1BzakxYV2tFWng1?=
 =?utf-8?B?UkVJYm5jMFk4ZytidDRoRGJZZGpOZHVPM0kwN0VVZ1liQ2lhK3prUnprKy9j?=
 =?utf-8?B?VHYwLzdtSXEzQW45VkxoVWtzd1pnL0kxZUJaYUpERHU1NTYvUDZkT3dFekRP?=
 =?utf-8?B?U3hKYUx6UlRKNEt0R1J4eVJpSnVjRDVpck1uVkRvNGVVTHNHZFYrWTZVUTRw?=
 =?utf-8?Q?fpS84K2XPwe+KzAnsm56fu7NsqJmtxCtR289u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01823ee6-3713-4d19-e18e-08dee23fbb5a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:07:29.1596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Idci4CcKxtphCYurgh9JmsuLGvqTjCLHw/M2ySl8BZysV67yhfXEChhz9HV/v4WQ1rs5idrIqgjMpSqKSYsCk33XVQKhG9tQPxX92GTl96ThOj7aB2j9AlfMVUL6hymV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

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


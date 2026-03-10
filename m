Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520F3EE1E7
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147003; cv=fail; b=ebbw2UtOy0O725czk9EcABT8geQqBsRU/f3ShlFFrwFd/lfwpmCnoDbMRqDMvyWa0QDo01eNv8AIrpQBlpSrKNSN+mPy7Wgpwx2NyXajQEh/4h9qVSzW9DNA8SLNHGCcJiit4uX7RkW2ff+KN126DqzeVXwhqHL0G4gKgzhcPug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147003; c=relaxed/simple;
	bh=ch+byfNpz0tLgy7NoKT5T7yK7T+MoZ/cje/+VZcs7w8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dCqhcFRdUc2ea5bShB4Ed3Cg0m7bXbA0FviFh4yGqCc6gKTRdHN4b1JDCSRSlrBaHYpvtsphSObFtVJ6xIAico/7fpvst7rTUnJg296rtcjCta7C054YAD+ACxim4QspohearcazzAAagm7xzgZcRmMHoXlO4EZbxxIBqdWOeE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TY6kjtY2; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TY6kjtY2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhuEjT/S+M1U/NVYuNLLcmqX55a/7tlzurf7+UzMYK5K3cBNt5rwv5vrt1Q0IZEuJe6cHsBic5jtcrRv53DSJ7c4EjJPBKMN4J7wI1GLOdN2PX2cNb/Dy37bLA+ezeZY9dpQLyASq6DkdwpjUsJJoK/B/BCK+RbqSiR47jxBEuahPhonI1H2QpgvJXhDQl++DQN4V9VEnFRJYOqartrHgJg448OB9dVjRzPjB6LMfN7/pIYfsAD5eLKrHz4UHDAceA6wzekCBI0++mGVAM7g7T+S4gsl4wtPgOqDZnNZ+l03XAmzNAdy7qw219quo+aAQ1qhiHpyjV7fxLa4XOLSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5FfFmcTnXhFjc7UWaVuUbu0qmJBh4gN20W12wdwznM=;
 b=TXqApG5zBHoFDJPdYJtbzDF+vPSp81xgg+DYjMc14BHsRuw2ioDehZsZ55o8hV8yTLkzSP0f8dEVPZzrKtkN6SnIV5Ao1YNeR8kbXqgFgX/HOtLQotk0UJ+HV4uJ/dmIXFNfIMSYmGSrrp8LzwzSHafo4UWIWr7z8GvYsWXgzXhyivYg+0A/UHSIyyi+CHP6CQ2p4GXCYSbNZ2IDOhVWM9RcLCPNZQKZXjotXg7twxKkLwPXTbmuf4n4jlvmO7e19LJRMzSRbXinT2R65L/pwmrzEjiu24xxuxogTzPcNASQHh33kZwbxkgpFGe6jJg1benIAzZAnLhqRANO9QYb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5FfFmcTnXhFjc7UWaVuUbu0qmJBh4gN20W12wdwznM=;
 b=TY6kjtY20BQgaiHA1bMzEq4hC0GpIV/nz4Ogww0O/uj/m0eCFM0VEF2fR52anOACp5acsTsfbVJ19X3vsahPp4as7pIwZNi3h4qdqzrGF8V1PlpItzpB/V8mFMq9PKffnP4Sd9VXinlFVkNZ+qnwX/sIhIerSHREvzdgmwvBXtuYc3MfkmU+xM5aNYL4Blk9w2FHSl4rtOVa2Kk6Z+xoThB7THE5stWhk3HOoPSMieXWdDFnjkComuivVktX5N34SXPSjwk0kXF8lwydeCJxa+JxElbM1Ck2NQzaOALOpytffNJp/tSyyxHo3m4tm/9l8cxsy+Q32+ZAngmi8Zv/tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9154.eurprd04.prod.outlook.com (2603:10a6:102:22d::9)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 12:49:58 +0000
Received: from PAXPR04MB9154.eurprd04.prod.outlook.com
 ([fe80::b0a5:fb7f:4353:6a82]) by PAXPR04MB9154.eurprd04.prod.outlook.com
 ([fe80::b0a5:fb7f:4353:6a82%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 12:49:57 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Botila <andrei.botila@oss.nxp.com>
Subject: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
Date: Tue, 10 Mar 2026 14:49:50 +0200
Message-ID: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::20) To PAXPR04MB9154.eurprd04.prod.outlook.com
 (2603:10a6:102:22d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9154:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5365d8-5473-4508-7b52-08de7ea388e9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	xpsisX3vuYLyyRD3SXjQmIfcrJcy8fU/K2JPgZtVERvTUbTVi+NdtDLJeydKzOHE+T8bmAByJbZDu0hjFYtlZNbvaBh/+A+udxXTwX0G5CWxOY6MOwWzyhGL7MVLxd1mwrvp9104TZxqMwdG4CCLOREurAhilQc10JJBEMMTiYtPdzD/0Hvfo8PA7sy8GfaBit1vvleudXQylQBmGr9DFi8nC+pMzzU4pPxPNzcQu+JWzrQZ6aTXcIK7tsRfRstJdCCBBs1mHTbIsuLFojATUYpcQwfFUEsNm5Poo6pkUKGrVFT10PYJfTI4MtsSDOWOZRMvGoGsvM+2woAa3ambUSSIK+ZhQyr/eU8X7solwKmE2X7ITwz7iRBKThoqcqkB36rOpRrSOZeHJ2Wt1Y/M90O+KK+MaipBuVJ+6hyf/A1XvVY7xZRLb/6cv1tFky+RH1Gbe5ss7m+7zd1E6nE21+FB3W3MqrUhxuKDb0KBq4SbvL4dnvFCOQRppaXqYWUcA+g0ZpjtkhFJ2DII49nZ9Po7F+rrzXVnmgqTK4FK/YVFqaJ0D8Z15HDEV1soyD1zUECWZesgP1tm15eKHT2gTw5BsQDoLrsDulhi+hSyOhsLfHWB1HgtfBLiIUlTJjRCHQ5p/hxsVgeGWtYIIIDdIWf4XfBI4i4Xn+U+YMwE2v/sfSpAfqHPoj+oZBTykOMCK6vu9Wlo3CTT2pjfM31Pg9yix/dhQ28/qWCXVyqvoHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9154.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0pIUTcwU0FhbnVHYXZ6Wk9BYjZkalBTQktWaGNVYzNTRzhBOVJJRzZ5UU1C?=
 =?utf-8?B?YXJNR3FjZkhBWTdDYllDeWJFVDhmOFZJOFJpM3hVTEZscUlWVVRibDJHZ3di?=
 =?utf-8?B?NmllS3g5RE9adk5qTytlZVBUMDBNVmx3NU1HNTNuNjNDaWI4SnNhSXltV2xt?=
 =?utf-8?B?RW1RSUZtdFhjSEpGVUJYU0FjTm9LVnZDQTVsNU9mbzlsMm4xd1lRYkswOUQx?=
 =?utf-8?B?QmExTVJ6OVg3c25pejEzTHl6eFlWeWt5UVlabW1PeDJTdWlxM3NqTUZsZFNJ?=
 =?utf-8?B?NitPZXBjLzlVTGYwT0JPcElIVUZxM1JqZVg4ZlJTenBJSlNBa1ZDckVxMUs2?=
 =?utf-8?B?bjJOcEsxN3ZEV0p5K1dxbC9WTE9zeDNUM1BaSnl2aFloc09qMlRJbG9hZkxK?=
 =?utf-8?B?MkZXQWxjQ1lFM0JaVXhmL0FvN2hweElqNTJvQlBzQkl2YlViYjFLWjBpTmdi?=
 =?utf-8?B?RW1jdUptRmwzVEswSzlYQk43S1hSd0tYc2JmaWYzM01BQXpiZmJqcVJQVXZs?=
 =?utf-8?B?Tmw3TmFSZWs2MnZKNGdLRVVYcDZYakFEb3h4cE5LT21OTW1JcHNnWnZCRTV2?=
 =?utf-8?B?Q0JmSE9MSG40b0lyeEZlOEw3d1paUXhLYW1RQzZkSGVkWXdRVjE4TmFhYW1G?=
 =?utf-8?B?dGRJS09BeFVJeWZNUHBwWThFdUpQM2t5NXBVTHA2MkZyYytmb2NJUVpwaXN0?=
 =?utf-8?B?SEFnM2VyR3B4TVhIS2NOSFlvRzFvTFYvb2UxT3dYSkxYQk5xVE15ZGNmZ2Vl?=
 =?utf-8?B?Mm5HOEtIQnFtYjI3YlBKZjFmVmZtWEZmdFMwZjNyeWZTb0k4RW15dUNvL1hL?=
 =?utf-8?B?bTdSSlNGVWI3emhSSjVXK2FXRTBTODhyTDdpWG5PNUtxZTg4R2FPM1JUTUJD?=
 =?utf-8?B?YlhLSWZpZ25aZ29nVGdLOGRYdnZmSzUwNDkrNGVJNHI1MjZPRFBnSzZBVTR5?=
 =?utf-8?B?NGt3TzNiaXo4aGZ0dkxnWE8xdzJhWjRCbXFIZndlcVlRcHJ3aUJOWjFUOG8r?=
 =?utf-8?B?RlFpcDNyN0tWMkhTOXdEcDRnL0dhamdVN3dwSitZZGVZZ3hQUDJQakg3cXhD?=
 =?utf-8?B?bFJxRmNYOFZvTVNZZk9IWEwyaWpncllSSGR4Zm9xaUd0ekIrREpJeWNJeXkx?=
 =?utf-8?B?N3ZscWhWK2o4dGRORmJNZzlXRkhPNHZMUUwzY1p6MjFEQ1NMWUlJUWNGbXVp?=
 =?utf-8?B?ODgzcmNCTk81M0dVdThlQjNuUnNvM1R5SDltMEROY1lBNHh6VDBMcUxxUmpq?=
 =?utf-8?B?NDFmaVVsNDFHeWRmOXVod1ZjTG1UN3JXbVZZcGRnNWIreUlaTTJSQ25SaVVq?=
 =?utf-8?B?Vy9TR0JjMVpsS281Z3ZJV0c4UC90emsyOHhlQW0vNkU5SXlIUk5WR1hqVnVB?=
 =?utf-8?B?K0ZPUmo4SytEMjFUcmFPQWpFZVF4c3hsK2N3NlZVY1R6VDlTbklmM3RaQVp0?=
 =?utf-8?B?RjRkcytXRzR2c2VIYWQvcmdVQWFsVjN1VC9mTzdJVm9yVUVGY0hIZHkyazVa?=
 =?utf-8?B?NUJWR3hlTnlLME1MMXhSUk54TnpiY2hoRGJqaHJZdkRaS0Vrdnpid0dVNmdW?=
 =?utf-8?B?cE00TnJCc0hvWFg5U2Q3bXRjTGJycEVLNFEzQmZ5UWhKYVVtaVY2bFRFRlF5?=
 =?utf-8?B?cHJ6NEU5LzRFd0NRdHJLQVhlWE9YbzFCYjJOOTkvb2tpOUJDMk5UZkdpSVgw?=
 =?utf-8?B?SzBxb2l5V2dwTVdRYUsxbnR0cTVxWitLcmpFbGxLVUgxYWN4bkJHOGl4dWU2?=
 =?utf-8?B?SVNnOEFoMWwyZ1IvM0tnRHhma2hSVC9kVkhoUnR0cG1WZ1RFTlVuTndyU01S?=
 =?utf-8?B?VHpJZGd2bVJlZEc3bVMvRFFGYlBsSEpIQ1hlbnNLdWdnc1RBdHZZSGRCSGRy?=
 =?utf-8?B?djBCOUJOeG03UFpCalRZRERRandIOUprOVRSeWlhZjQyTnBCVlM3bDZYOUlG?=
 =?utf-8?B?eS9VUjFEWHVvV0tYMXlHWEVqUjArT3Nyckl5ZFpBa3A2d0dFTDhHOGhXN2Vp?=
 =?utf-8?B?enNEeU1OV2tEUmxoL0JITkR2eEhSYWFnZ3dCTGpPdWhyOHk4dWt4UE9nREcr?=
 =?utf-8?B?Q0Nhc3UwNGp6RytJNWRkVHZPUE55c1JKdElaeWovLzFabTZ0ZXZ5WlZSOFMx?=
 =?utf-8?B?RVIzTElPK2RDcmhiSEQ5SFVPdWh0Vjc0R1ZZbTRpV3AwNmROY3JuRmN0ZmJI?=
 =?utf-8?B?N1dTeHVMOU9xSFE1ZWdMNTlRU1hZTjcwMVpiK3BHNjM4NXVnV01vMVltVVh6?=
 =?utf-8?B?WjVibUZYUzhhY3FQdHdhaVVHUWVKVG1MR0cwNy80MUhEbWw3aWV1aVRtd3Rq?=
 =?utf-8?B?c2pCcFNEa0ttcEJKNXpseEp0NTUwYjR2ZkFtbkJoazVRTnFvRDZidz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5365d8-5473-4508-7b52-08de7ea388e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9154.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 12:49:57.8032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SY/N+DE8v7uA94Vh1D+eNN9DYu928Wh69I1ZoFOeVnHAHgN2246x1pZNqs/dJTtBn0dsjKPbIyRsTR7eEc01Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

S32G RTC is probed after the RTC on RDB (PCA85073A) so the S32G RTC
ends up on /dev/rtc1. This causes the suspend/resume or hwclock to use
the wrong RTC since it takes by default rtc0.
Force the S32G RTC to be assigned rtc0.

Signed-off-by: Andrei Botila <andrei.botila@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi        | 4 ++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi        | 4 ++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 6 ++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..d538876f3854 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -14,6 +14,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		rtc0 = &rtc0;
+	};
+
 	reserved-memory  {
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..713c75c63f94 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -15,6 +15,10 @@ / {
 	#address-cells = <0x02>;
 	#size-cells = <0x02>;
 
+	aliases {
+		rtc0 = &rtc0;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index 979868f6d2c5..e3e83923b10e 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -7,6 +7,12 @@
  *          Larisa Grigore <larisa.grigore@nxp.com>
  */
 
+/ {
+	aliases {
+		rtc1 = &pca85073a;
+	};
+};
+
 &pinctrl {
 	can0_pins: can0-pins {
 		can0-grp0 {
-- 
2.52.0


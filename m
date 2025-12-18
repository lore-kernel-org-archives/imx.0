Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020079.outbound.protection.outlook.com [52.101.84.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58641E5207
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059225; cv=fail; b=kNHMh0JIxLfWVhrTzrPamrZ2iiLfuAh70aiDCsaeChUog5AudZPMpPoQ7KGlKXI0mha6k0Buojv8YDghRGdaEDmrpVF5D8vp72xd7suSn2EJDvmb3YIuVFlK2EdP3LQc8Vh+P25onbxbFlCrQqSNPcYEnooCRvCUdkT6Fl30CTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059225; c=relaxed/simple;
	bh=WxEQ+NBxLnPcsBCHBfBlQVBHIOX1PFiBFfhJrdCFnHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=snvNTqvfGO6vNWqKPXPkvZ+UQIqjIlqBo6y0HHDB06DCAWxdqR0Cs2V1zkGWDkZ8ZRbfDJJ1JgXWzsc09+a9MzNcECl/PWCjdxTgjIaTXQMyLpN7xjo46PJOjYCGwupeaiNQBCoJvbD4z2GEWTwsOWe1YEM9smah6Q5ZIhx0BVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ihxtlvUr; arc=fail smtp.client-ip=52.101.84.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ihxtlvUr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2nFFWk5EECAgWnI1mQE/mKO8loQotfe26QBuAQ4Z4BEUAi1rNow09tQ3hTlSg6wEz4im1TBhkiowiY3NhCSjP6sAQ4u8os1UM4GFMaSU2wLua1kRCRcEIBBTgaL8TK2i/ivA+i/r5jnlPC68w3Zp0+8jwpD0w/UgQ5ngD9lgHmQ/fAQM0zjpyJT1yGbp/p8KosmE9Bzl8cXINmYJDQ6j3tV7ZuhoCmpa1k4cq3TSEax+afq9NRs6RRcW+KEurPq9tsopQAfIHkMPr6iXiNIpTABp33Yg5tdzF36Wz3dDvKVZb6wki0QVznd5ge1D8UUHnZo5sFm4FWeWELX1OXJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yKSUTlHV1yaetigpa+fiZ1M0pwYY4OnxdEtF0RSNBk=;
 b=HU0DfpkwSOvmSpU1fwKbF0X3/q/IvLgqjjyAvYORX4pPInhmmHpt1kKjdZUK0E7SJku+Vz4/wXAQGea2TQ1qjGRtbXIiN/TcprOuDFZniY7yZ3/gM/6K6hC8tEgvVVJH7/yJzdlCzOjkSl/bw6WhYxGPIN/yMuLm10t63Nr5nZVH76WjJQCL1vvPXSuPJoTUdXcYso8f/6l5n/YY504/hq3/D8wDbCUdOjPCipsJxgr21xJ7rLRbMtp3usqffz/o6TyyKWw4NZe0oAFNHLBovJgJW+gLVXbXQXzr+YJ4/d+Wr1WZcwK1sJYPYAybYcKxHjooEALkobYjfG5sYN/pDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yKSUTlHV1yaetigpa+fiZ1M0pwYY4OnxdEtF0RSNBk=;
 b=ihxtlvUrHzo1cfcfBLUvyFnnkxpDOeLvvf4o8QQEMT2YgbaFwmqSrqBYuZ0IvOB+ZW3f+WHf77qqSa8DM41MpIwTYu2/0WPDepNW2OgRTZQh9SvkC6nTy2cpkKjhrifBMce067PcyX2PW4CfYmbqp6sslJ4MlhrT9gkWrAzjmXeydi3TlT2L7wtflZcroVnuynePNpTlPP3ujIXS73wtnB8TVrUKIn5ZIv9ATS+NS4pkl5pDBk+qOiJMa4AFjEKIAp3EWODrPc5TULvwIXFcjtckwJKXGUbyZj1jhOpjwd/Fzsysr9zrHrs8Ys7apRqAWA9hmzSRVSSP4iPD67YN+A==
Received: from AM8P189CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::29)
 by DU0P195MB1957.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 12:00:16 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::e5) by AM8P189CA0024.outlook.office365.com
 (2603:10a6:20b:218::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 12:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 12:00:15 +0000
Received: from llp-tremmet2.phytec.de (172.25.39.70) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 18 Dec
 2025 13:00:15 +0100
From: Teresa Remmet <t.remmet@phytec.de>
Date: Thu, 18 Dec 2025 13:00:06 +0100
Subject: [PATCH] arm64: boot: dts: imx8mm-phycore-som: Update eth phy
 impedance
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-wip-t-remmet-phytec-de-bspimx8m-3841_upstream-v1-1-2ea15181aaf2@phytec.de>
X-B4-Tracking: v=1; b=H4sIAMXsQ2kC/x3NQQ6CMBBG4auQWTsJLajFqxhDSvmRWRSbtgqGc
 Hcbl9/mvZ0SoiDRrdop4iNJXkuBOlXkZrs8wTIWk671WWlleJXAmSO8R+YwfzMcj+AhBfGb8dy
 YVvXvkHKE9TxcGnetp862Hag0Q8Qk2/93fxzHDxjfbdN/AAAA
X-Change-ID: 20251218-wip-t-remmet-phytec-de-bspimx8m-3841_upstream-b63c70f9a49e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Jan Remmet <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>, Benjamin Hahn
	<b.hahn@phytec.de>, Yashwanth Varakala <y.varakala@phytec.de>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|DU0P195MB1957:EE_
X-MS-Office365-Filtering-Correlation-Id: feaaf520-1fbb-4871-8dfe-08de3e2d01d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDd1cGhoOG1BTEVjeGo2M2ExNTZCUWxmaUtnRmJQMndCYnViSjhrZVVkUGlH?=
 =?utf-8?B?aDFKZjNPSnhzQjYzUFBCeTI3c0hXVFNvWTdhYXlYSFg5aGl4VEp5eVhnNzlL?=
 =?utf-8?B?OVF4bWpXWU9LNjMxMzIzZmNmQmU4YmhtbzhKL0d4TEN4RUZwMFRGRlhGSnZQ?=
 =?utf-8?B?ejJWUHFrZ2puTFBFcytlN0d6TVhJN0Z2Rk9tdE9QOGluQXQxZVkrQ2pSK2dB?=
 =?utf-8?B?Qmh6RGZuTlliUnl4ZytTUEdYK1VqOXdVYXFmZGZuNXJYYjExTUVTS1lZZEZz?=
 =?utf-8?B?ZmhiZ3B0NWc5QzBDdkNIdm9ESGFjK2hZdXdqNU82Y0d3ZWdxRk9YckFsV3RL?=
 =?utf-8?B?QVYrR0JINHloT2RSdDNCenlpZCtWU0d6WDg5Z2JoTmVCYmpEaUJKSTg5Vmdr?=
 =?utf-8?B?NkRkcEFxd2cxdjJGc1dLQ045Ym5tbEZHMVA2MVRwWG1UYlMwYjIrMG9LT1Bz?=
 =?utf-8?B?YzVQUzFvNDVndkN5dUpkRE84dGFHV1BObHE2QTB0Z2FrMWhVWm5YKzNSb0VY?=
 =?utf-8?B?V1E5VUJBaUhSTDBTbjVqVXg1eGxia1hWREgzWFN1M0paQjdZN1lYdmNhMFZy?=
 =?utf-8?B?T2Q2dkZmU1UzMWtzcVVqMGIwVnN1UTZjOFRsYUFqZWVISTRRQnNSbGdHWEhG?=
 =?utf-8?B?NWZXblRMYStWMERLMVloaU1wRGVENTlaMVJOK25NUHcvR1pIUkd1b09zZUVP?=
 =?utf-8?B?dlNrRDRBYld3N0hwRzNxbVZUcXgwS3ZSWXN3Q2lsT0FHRWhQQ25iY1k0TnA3?=
 =?utf-8?B?VjdtRVVGbDcyV3lwS3JnWDhjOCs5amFMaWlMZjNnaUh4YmRVMEJMN2x3QlZ2?=
 =?utf-8?B?OTkrcHk0YnZYbm9NR21VUzFCME1IdGIxcG4zYVpQUVhRUmh4cHRpOWJ5T1dQ?=
 =?utf-8?B?YVdVczhUTE1hZXJYVzFtMDlGKzRZU3ZHK3FvTGdRTWhvR0taZlRQTnVmYlp5?=
 =?utf-8?B?OE5nd0lnd0xjY1dCNjhEUTI3MkNham43UXBQUEFhYU9vYkdzaVpBR0JSWnJ4?=
 =?utf-8?B?cUt6Yk5qKzd2YnNZaExURzQ3YUZha29rb2FxL3BPcEQ3L0dxenV4NmRVOUhC?=
 =?utf-8?B?ck9YTC9xWnZURnhVcFlaWlFIblpBMnZvTUdXQUs0NE41c2pEZUlDNE8yQUJV?=
 =?utf-8?B?L3RrY3p6dzB4TEJ6WitiSmZzVkphVjBoRmFNc0pnbXAySkNRZ2Y2MVRpd2tp?=
 =?utf-8?B?V3Bpdi9JQ2gwaHo4eHExNHNDS1YxaHA3OHhVb3hqVXJYb3dwQ3NrMmRnY2Ri?=
 =?utf-8?B?aXdqcU9MZXB2eElRRzVtK3VKbzdJcVc3UDhSazZqaC9oVVU2K1JNbHJxU092?=
 =?utf-8?B?VVFXVUwwbVZQeCtPOS9FOGdGUGtKZmJ0WjJSNUpCaGtiMG5QZ1Y2NFJSb0N4?=
 =?utf-8?B?RCtYUFR1Q2RnN3ViQUVmaFJ2TFJZNnlqalp5d2VSUnF3S0h5UDc2VUZmTk4y?=
 =?utf-8?B?Y08yTEFRSXB4ZkhHYVdsa0haUjlpamlSaW44RHBQM2RybHBZWkNDbU9QcUZP?=
 =?utf-8?B?TkdydW1NaWdycDhaU0x0cVZIU05oRUFiaXBOUVpQQjRwVGZ6VUpqa05LWjBj?=
 =?utf-8?B?S0NaYkMzbmNkWnhsMkpYTGoveEdlMzcwSzg5MFZ0c3NBeGpRRXlOSENWbnYw?=
 =?utf-8?B?dTdiczFWNXBQOUFrdmRXZ3diblZ3WGtMbXBOWHpvOVNIcW8xNzd1Q0JydEtp?=
 =?utf-8?B?S0Yvc2J4L1lRaUdadmtaRE5VbWVpUTFTbE10K2RnZ1RPTHkydGJPVUxnVlZP?=
 =?utf-8?B?UEc0eHc5ZytHeGZxYStIRVZ2OGREY2xNY3J0enNkODNoaWRVcmVsVkQrMnpy?=
 =?utf-8?B?cHlWTElPN1gzUTczV1NZY2ZMeVRuRGt4LzNyQzB1ZUpTdVE1UWt1SnE5bzNU?=
 =?utf-8?B?Ymg4bzVaU3FVZG5Sb1dDRHBGbElGcEE0NDl0K1g4dXFPZXlmMkFXZEFTaVIw?=
 =?utf-8?B?dWtSZFFhZklRWGpOUUQra0h0RGU2KzhhejIzYWhXRzJncGdBNEtEemFyL3B2?=
 =?utf-8?B?WTVIUVg2NDZlNHZmaElJNlpkM3dLL2R5SzNWZ2V4SFhUTTNrVTc5bFRnc3NU?=
 =?utf-8?B?ZzdLZ0JHODNJQXM5QWplQXFjR1lhUFI4SXpTWWxrdDlVMFlPUDVaT3lVUVpa?=
 =?utf-8?Q?ltTU=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:00:15.8246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feaaf520-1fbb-4871-8dfe-08de3e2d01d9
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1957

Update the DP83867 ethernet phy impedance settings to
to optimize signal quality and reduce potential signal integrity issues.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 3d66c6701342..b764f7734868 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -83,6 +83,7 @@ ethphy0: ethernet-phy@0 {
 			enet-phy-lane-no-swap;
 			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,min-output-impedance;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			reg = <0>;

---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251218-wip-t-remmet-phytec-de-bspimx8m-3841_upstream-b63c70f9a49e

Best regards,
-- 
Teresa Remmet <t.remmet@phytec.de>


Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0E4ADD81
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911519; cv=fail; b=Bg4HTBOGTInTnTAnc4pe+Pq36aNwFtdweo/W/3Aw6iB00oshf/vrHNSS8QGODeTKCJnIdHUC/dc80CA0FTNpf2Ez1usepxtVKculjtjRtpflvfJilgc+VW4cTUt1mI/OzRa7S608NXNL4RtpvfWnE9xVXfyBG3Zp6NrKxOqb0AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911519; c=relaxed/simple;
	bh=lDywWEZkafWpZAZPi0CFIKPS9AmkspoCMERY7jwfkVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LfQoBSqeKODmTX+TBCfQmIncwtoK9llEI3+qMNZuQS04Nit6cY83dd/JmfaZWizV4/GbkBbydj5OYYn7SKKyxscWZ9w3jSlRQZEEb8xR1OuxKFk2jzoKTWN5fbCsPESTPqIEpyQAbod9tahTJ8IQEv8Lqrgj1k6P5n5Yocp//kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ib8UXtBT; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ib8UXtBT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byUkgx44qGL1nY/oveJtaWDAxeTvproAdbHhd++CRA+45uIrRXlgcxp2OVRVzoQitJ9/mbF0Ikdb/cO1lKovB9fue4cw5h5fVW4jQz+W5SQUNkf3MjfChoGfjNnFqQG38vp5NEwm50OLSmT3AQbd9B3sjIPn1S4+q1/zOBpclGNHcPQK/hKHmLKbh+9RCEQuJ2quClmOhrhol2xF+sG4KpxWlFIf00ybDpx0FkDL9POEaaZPv6k45NVRHZkBajFuLuSi9MO9pdJ4voSN/WH0ws7KYjegjIUfU0NVB9SXrz8dj+6aY0+4K5bosnZGyp3ys5dcFuVwedKNMzmeAG0Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDxdav4fX4qV6W/U+HIcjUz3W0TwsXcKCemC+r5VK2E=;
 b=cyZkVSv2vkoI7LIVL542mD7EsCVw24RsxU0LhnGOfTrhV75bAB7yExB+onh72vJOGe+XYQEGERd/MXakYp+3a27NET9qzT2GqltngSpE6fKUgI4hGeB8o27r4vtnnEZsLiuftDUJJRAgqG0SHYSw+tXRDSxYBRj0S5NG9gSYo7dF+Jk4EO8gToR3NGRALr8nAK6U2fzl7FH0zXeu2JP4pyi1pYOrw4AY24B3Vvnv/spG26KfDVQaSq7xgfSeEcRLodehxHh5ozk0/9U4SJ+2yLHPGQ/AngrSCP9io9jyJNflOfL2XbKBzE/3djLmmlar+gwLvnVqsv7f4szOMKvJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDxdav4fX4qV6W/U+HIcjUz3W0TwsXcKCemC+r5VK2E=;
 b=ib8UXtBTBLy1mz3c1A7byRsH5JW+rdsr/+ihnZDW53MEUkFylULSExCVbyq2Z0ySmfs/0mfTqeBX6N5Ok0P438f+dK/Dy1wagNXO3mPd75ItsNY7qv6xbaIrE9bjsbZV7YbEsjSbnCTkW1tAMqaY0z8Tc+YqneBVYV85HuLxc9zqzVQygK98gS45wf/sXE8Vu0FkkxZJZhARHKm27QRsPVYyzvW/XA5hgd00YLRCSl0QPVXpzcBMp05hR3w/N6NzOXgj+aIL7cK5hPxXzZwUhMk9HRnHXe+oYmGERCxy0tTLiatSTZdhW1Is+J8QoKHZ6cCHTLoEUCX8PRihHZoJ6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM0PR04MB6996.eurprd04.prod.outlook.com
 (2603:10a6:208:18b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 13:11:55 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:54 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 4/5] arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
Date: Wed,  1 Jul 2026 16:11:36 +0300
Message-Id: <20260701131137.940145-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM0PR04MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 6758832f-7494-4a66-3aeb-08ded77252b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tpo+U78JHY60mFXfBRl96keSnFler3jsX5wA3OgwgupKpT0506JFCSfTcGZ7C5UnHnb1NVFkbFZ7eMyS+om2zYOwbZjEkYF12powSAxfs1Hbh2eMVNW6zQAnTtyrE/eFarSW9kISQHSL9nr+6vogZrPytOI4MZZwrYRmCflsAGOql3OjV+LOZpYkMlHSYkNoFI/mesZdCrcus7jbpL7w+BN2olSOtP22YsR+nqY7xP1ml1/dUwEg/K+rF2TAGt31zlxj4NLbyMM95kcWl24g0D5mX1V6XRCxSarTeb+6uT662TQfen1eHh110B3AbmSLYXUnBO3NJSpFD67pOxrMuVk6HOBVy2MHXPGApovk37r8YVdZvxKbfNmBHLRIpu/dPs68K+JZ/zUd9zhVS2o2DZ8NUsqsPqzJUypcRgIea8vIBGb9IoK33cQUQeoenyvZJmuleW2afKnEUmkMF9C+GOJhkbxW1hwvnYDFFTaAvXYqWdnaiYzKnRorwTeuuMl/jxKOWjcbkclXVrrHruTcOYgj88hyrbu37tl47eM7pjhkMvnL3/B7DKT4WWFUqcwiLPZpdclqRAn7UU5Y6EwljME1IMawGT80DkqCISj4NzpwLPYyRwZ0ltNxFzMFQb1qe7p9fHaDEPMhhLZGINwnaJL3IJ9uBiZCfbJ810f0Btw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMHiTn+eq1NGnlFELLBLrF/wZLAb4G9/wf8wh0aWTEvsUrwBIJk9RAB/3uXE?=
 =?us-ascii?Q?M4QKulJtPNuqtRJdonEYcjBFa7VuuBOJ3pbtu5t49yYEnNLvD/lJONMM0kWJ?=
 =?us-ascii?Q?B5sFm1a68H2blRaCpmnP4jVr2SJ0GRbECcRd+eiN0m/3Ei22nhKqAvyAXTVV?=
 =?us-ascii?Q?rmcPmWTzrHOQXOpqXs7QXr+qpIXw/bNSTgn5vJiAphFmk7HbmPasRM2bMTn5?=
 =?us-ascii?Q?x2Fs5+Q+YbIGa+C0r5P8g4M66NuKgxBSpX8XAsqKbhHPRhasjOYj5+i0dMeT?=
 =?us-ascii?Q?jl9DZzayM2lUZvbVbDjL3CDdzq+UKSAvLnW5uP315gYn7hcBO7mWFhHKexN2?=
 =?us-ascii?Q?degJXYfypfDFp3zStzXhMzdSXyB6DBOh90MkdmBJKRkzB8ZLAc+bB8oYVnGP?=
 =?us-ascii?Q?c/JSWYNe/21POIg2xzwh4OjA4H5MU98TmNSUgfFJT72P3kDHqlWuMz7qgjHf?=
 =?us-ascii?Q?HQsOBWNRKWE9mVhYIJRejUr/nHKa97iyd7A/r7JE17P7hFrp2bYdSZi+wGL0?=
 =?us-ascii?Q?/oBKFIOygANwHosZ3Ek2xS/n4onNYBPjsMEJ4Ucsul7Jo2p5nRflOAO3jBmB?=
 =?us-ascii?Q?23N+p4O8QGcDe5MdZ8CFAW27X9g0xuyP9sJaWqLdJf4hBWrmlQAuxi1W7qq5?=
 =?us-ascii?Q?fStU4ga+Mg3V6yUY6uZIKinr0wi3JrNB2clxrO7rFGQu3aqdGYS6/Puu0FK9?=
 =?us-ascii?Q?ShiwNd1P60CowE2Wuu3i9TU0we/6bFyrUtnc6ymGtP2+07HJaUxbMLLS/UhM?=
 =?us-ascii?Q?SFmzlM/7rFB49bsUiQH0VDJD0pYQb7wKCKIvlAcdXwCOQ8G6A2TXCvJJLaWN?=
 =?us-ascii?Q?ErmmGj+N/hO7dMSSaEb6Dv89a4Zfc1HSRR6Wm4SoIP9LDVkZ/vvkGoYn4W/U?=
 =?us-ascii?Q?9a/nRfBEqWmkfc1+4qk7Xs8T6IFeJ6xJLkatalBGCy7U++DTkoxJaojVzL2u?=
 =?us-ascii?Q?OA7nRBEJCuTIk8hM7FqHn/dMPtNKEwkEO3Pqjqp1Tx8WvNjc+55y7kQEXvaP?=
 =?us-ascii?Q?QNGrQdmcieDaV0be/knlydV0SHAwFbn6DVvE2JSVGNHqfPMdXsi9YfwMhXZX?=
 =?us-ascii?Q?SC2yf5BIv/q7rqpV3eJLIwKdTFxVF2hnb0GkHeIhQ599gRWWz8Cmuh3Lrf56?=
 =?us-ascii?Q?ybknhqf0uOPC6/L7bF0H52enUT/3JBNssXXUMfDe6RUotNM3LNwUPIMFthfa?=
 =?us-ascii?Q?S9srzEAw/XQpU8+s9iLMICzdsWyQLodSJ9z9Qpm6PIQr8po3m+Q26DjWKaO/?=
 =?us-ascii?Q?nIGwUQeYKWLcQCPy8/ceuwophAPV2mo1UUee0qjfPPcflerP1/CK8F5Bs0AO?=
 =?us-ascii?Q?AGfz2nu1Yw2j2CnPkgFPng6NtK1/MVIBnk9xA/1owN0muQ2ryVWC4Oe2gzZF?=
 =?us-ascii?Q?WorUuV/Qn9gia73zupUkbD/IFIZElwPNv1rv7lHFmVcUtTK4EJcSTxmWDWyn?=
 =?us-ascii?Q?97nmKkJWxZDpvJmPsfqx4rnz3lUTmBjzBxmVE+vDEudjk77Mr869lDNYbl2C?=
 =?us-ascii?Q?baHnKM8cVDF7RFm1wYRaBQih8Bn6uLi9Sw8pkgrMgVClgaT/prTkk+kZ0f0z?=
 =?us-ascii?Q?3nXSeaIpk0lfu0h/IUucoxELte7iViEHbaGbwHOsDH7asSvEYgPjv9pB5MH7?=
 =?us-ascii?Q?7gP4uGboBynsmdNJ3hOhuq0NyowDssRrbrpOXgG9s+qMJvQ1+DoLmf8YhQs+?=
 =?us-ascii?Q?9gqXifoCep/Rd+PfJJqJns4DjapRexE3jkogbiOIRWFaHoNtLWiAvdTa75P3?=
 =?us-ascii?Q?TC/5jZJV3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6758832f-7494-4a66-3aeb-08ded77252b3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:54.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIK36fo5yqRSxJw3XzuZulRBVusontosxEHRqtuhZZaEXJ+N8wFZuc56Y3yNTe7SJ+JQgsM/gBUUZdkefWdW9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6996

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS208xA SoC. The nodes are left disabled at the SoC level; board
DTs will enable them once there are consumers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 6073e426774a..cc1a64e63ed5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -280,6 +280,104 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls2088a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls2088a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls2080a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.25.1


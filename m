Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C83563F7
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333204; cv=fail; b=VQeYMG6uGXEmY6nHCWAkor02lEfAYGnPNphr5W+vtUsw/sGc8vS1u0c3Z9WlGxjJg7jTMeXfK6aFjNF5vrgjFRSO9XnVSqq5mbwehLbVn5eJhrzAMNToOgtbsWMNZ3Ml+skEN5AI0QKb0l2rTKs+9xpz6TkFpYwYezCGuajPjRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333204; c=relaxed/simple;
	bh=HRVfnrgyfjnEF8JNTgU5QYJSJ5QDwAEQK9xpfRmTAvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7GxUnPq9e29dBd/4q4C5QDxnfUDLkgEYSAyI9pPdEgOdc6CpFW1T6hGsuIkiX/NgIPAFJ5dkkcD4JVbXaon84C1cKkrlPIRH60JNrdzTuGOp4ylWNF7wZzT2YJxdRhPcKtz/+zGz93X2lr5iPezFPdLwBFA16OcrT/qVdgHvcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=HHeudQeX; arc=fail smtp.client-ip=40.93.198.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="HHeudQeX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRz2Je10blDV7Ei63qRKgRayO/AtR9vssZmmoSuKGqZcRAGntTDgLHbVy0MIoIfs1g0cDvoPV4j4i7OsJM+YPDD95ngEU9uPITVyibotgVGEuRvnZFJBn+3pZOgPLzjNe3UC0BsRIoNXvyg4CQWegYV4+FPEjGmZNQclZmjIvo9ajn584s4RE7PwXzUvns5MZ+N8os03SH9zfvDOATIhbn2WLuFvtoCJKA/i64II2bG1UPxrPrHqZehIEukz8S+dhQ7XPjg41b324EGVGaCvVg7lQ61JI1OSpXxHSV9ypdVcLJu2/LK7bEM0P72IdBG0JjFQp3dldX4DZzb3C3f07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=qu+m5N/zJEwfcTbb6FF4axbuGOvX1s4qmCxPVr6Oh+YSKFfWnwqjA9Y44zJtS+IHg92VQ76J3r45moxrKzTlcmHBXz3/JySnyxDQjoG97S6J19skiR1/yMuFPHMWkTJVvnd42+E4Oqt2TvlQcRFTw4O2N1o2IWF5Z9t/bgcjBkhWYBvHdJhzzb1e+gsk4Q7BldWRaruth6Ul19Fh+zkU0TX39q/vbuifPY7GWl4SYfp5N/dvblIxS6qLD6jwYZJ8WJpz3nWR9S6eVBfXtVnbRFirIYLNvdYuYmWd7DksOOb9KEwvh9cyeq4nnTt3zbdQH0w6FmSkvlL1V9n0gcDR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=HHeudQeXAMhKOUyIVsVmd4MVQb/fKwB+ORSn7CShstd9VBC7cyWCvutkUdOB5Qn8f7HDdCf7W3emtwms93MD7xOluYa9mHE8ktlkiPpIr7v9c/TKxg8+75WWReAXH+cfv0LOOGZ5JOAkZHNtazEUd0lgN8qLvwXM1E0JpzjemFsxNHU/k7pZQekbD5bxWnSD74iwY2f6jkdpw3xNhr+WaXxSUDmfJGi6z9ZY2CB9CKanqKnRyjfrfcczeDNZldBk9H1beEmHey2Y2stnLdGotxh+v7zyYiZoYM9wP8BTCwK9gPQVBtaa6dFoufAh/KSgH4YiQiqfuJOyWtP4aYQXyQ==
Received: from CH0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::23)
 by CYYPR22MB4299.namprd22.prod.outlook.com (2603:10b6:930:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:00:00 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::fe) by CH0P220CA0009.outlook.office365.com
 (2603:10b6:610:ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:00:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:00:00 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 29827F884B;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Date: Tue, 17 Feb 2026 14:59:48 +0200
Message-ID: <20260217125952.53997-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|CYYPR22MB4299:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 548c2b21-7c1e-4d6f-920c-08de6e24756e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o3S773e6NtzCfKXzIdUowAenqc0WnIcgFmycHmT/5vuoSCqNIATAGFWmexZY?=
 =?us-ascii?Q?Q3E8sM18/W7+vbQ/9/36I42wgGpPudQoykLk4VgDNLLKsoGj/eSYtre7rIob?=
 =?us-ascii?Q?pgVq6+Mu86oBWSGSipkXZ4YPxmOYmHcrd1qGGYwy+PnqGVQK3LayPw/461cx?=
 =?us-ascii?Q?3Z7ALULK5lHneifyKNlUAaDYbBQntAxje4fmygqHi5bjv/EfPGfkZWAlGrJz?=
 =?us-ascii?Q?G6VxOMZNI7gqXkPjvaUZyZs2yzqTXsP2euoBgPg0n6Ve9PNQFojr6hUB5kVB?=
 =?us-ascii?Q?TvFgDqOmbLGb5dCBuTvCGfYbrzPAy8hIpqVEjESSIgpmmxErxBaitk1Fv5R7?=
 =?us-ascii?Q?ygOvlFM/Gnr/erZ8I7+Tq4bx3xpMsXbEVJn8/G5H03jkp0AMb8hFgqe/iS6y?=
 =?us-ascii?Q?AKVdCXUCI3p0biYYdSwtB2+IQ1vFARzmLz+R23RI2E2XsU+o9OroGF3mfYKF?=
 =?us-ascii?Q?zSvorMxgegjwtydXbbkmRV6l6t5g29AMjeySNLLFIl8PjWBqdjFWhxe7llvM?=
 =?us-ascii?Q?3G0fOIT4rfcoO5KUs10dbrZh21RUCnzK0DGqCqeMZEk6vhIqd9ztVQVDX9cw?=
 =?us-ascii?Q?1OATEi8rvmBXzp3UfkNRF+y+ZF9GQDTprzrW/aop1lB20AVkhsJFpc3Tlafq?=
 =?us-ascii?Q?hhsaKrYTlk4pHwbJTwm2VDlqMfXy9mvqgR9esDu8aYDPBjvs9OjW1sqCE3jP?=
 =?us-ascii?Q?iPQlEq6PIU3CdcSxBG+mZdizIlWBKEtcL9sM1qFdhQbAR4WOqf+V9pcu4aJH?=
 =?us-ascii?Q?QFR5dCQ+lTB5LZ0AcurqrCV1TAEBym1ZWGTXXBXzQ+sZiRqg4nwaJWd0Xjxv?=
 =?us-ascii?Q?UpVmXzbzZbkLWqLsf9sZnWbPpkSliNNzwV/dnkLAGtcCbFxrtDau5LnyJSkH?=
 =?us-ascii?Q?58BKVM1j/atGYprCo5krmFAzR+Aajmo50qaj52T8qo8Pkg42oqHyJeXaoVoz?=
 =?us-ascii?Q?24I53QMzw0vQCo+M+EeEiwQ+wgvdgyB1EwageXHIWJGECTpc+92oPvgk5Wkc?=
 =?us-ascii?Q?bjJowUFr02hUSGcWJUW0pixYSDaXufvlX8dLZsWv2EpWFW8lKC4D/qS878pL?=
 =?us-ascii?Q?bDG4RpAYjGbMnQK1eSld9+JtphOo7LSyTUisFL9oI/Q6CtaAEst9BD/+ckGq?=
 =?us-ascii?Q?Mt4VsoSfI82o1kF14+WC8K6H1TQD9vhBGCdqDNoc3782/b1qG5ZcBHsK2/yo?=
 =?us-ascii?Q?5whUBLvEmD4bKFBKFVrq+sUUXeiqmKn41f1KGMwZsIlsadhHZI5UcvwjXMSt?=
 =?us-ascii?Q?ZpS42XUh+U1KAk7xjlc3tKBOFQ/U+DFY6jJ1zD/PyqTYQ6AdVer8IfEBTwNk?=
 =?us-ascii?Q?/e4wVI0zgyuxjypBb2R2vT5h7VbshZePC1qmtp64dBDcEmrSeAhwhTb1sZ02?=
 =?us-ascii?Q?4dTHS7veItl8WFK1wida0/LfMgBEZ6eWBWcXuomEzU7lsL6o8+zSw7n6mnFd?=
 =?us-ascii?Q?r6ahxQX2+9k9fUTLpidpqNRppQinMDNFSInATF9wz+ft6ioXDVHS0fZfUfOt?=
 =?us-ascii?Q?3dBQWaDGPssblPVwit3ZdpZ+CG9oeUvfNyrkVuSLSYZpJuguclAf3hYKWv3/?=
 =?us-ascii?Q?g5PQqRqQ5ACG+nKMKZi5P1XBU5IZWuoVukIdFCYfYIw8Etzy/w6qjeKH+FXP?=
 =?us-ascii?Q?YjESWvBh/t0uVph0UFTDvVd77kan5HIi4J+BEE2xwyQUK1t/Mpuwy84rf9eP?=
 =?us-ascii?Q?T2SA2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CnkuzeuOw5HJxGhYa/hqk0rqK+Zf+VqW4r9TPNsFRzrQP3VTlNWokPB92wic8VbKucE9bdbxLVtS3Oy77Aev6CZD7rNVveJW/tP1XhhRqwu5McPxxCAJp28m3HAUIfdzWGJI6pYJA0bzdjzQHsDGYd+NOfHqVMuhoJrrf+o/AIyggGiClmBT/MRzmvyPPSg5bQ4Uo1NseDMkrz63xVxlcggQUbrnC6BElDgagNcxOQgruhvc1us/yk/UtkRZUX4Uj0xEDEkAE3buzFuP9UMMa09GlxQw0DJbLllnVxdaTwJ+jt10/7ReCvogcoj57RC703LtHIx5ZXZ5E75CvWtBO9QGxSfAGzeUTL6kE62VFMvMkvtw/juXpMeUQLdQWxPPU3Eenj/mPqpByKrQBjWjrI68/RJ0CRc4d5pvAxuawVc44Sse8+FsNqs2JutTT5fM
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:00:00.0023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548c2b21-7c1e-4d6f-920c-08de6e24756e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4299

Configure maximum speed for the switch PHYs according to the electrical
connections from PHY to RJ45 connector.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 1e2266a2368b..2c8d2ab8cda1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -124,24 +124,28 @@ switchphy0: switchphy@0 {
 					reg = <0>;
 					interrupt-parent = <&switch>;
 					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy1: switchphy@1 {
 					reg = <1>;
 					interrupt-parent = <&switch>;
 					interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy2: switchphy@2 {
 					reg = <2>;
 					interrupt-parent = <&switch>;
 					interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy3: switchphy@3 {
 					reg = <3>;
 					interrupt-parent = <&switch>;
 					interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy4: switchphy@4 {
-- 
2.49.0


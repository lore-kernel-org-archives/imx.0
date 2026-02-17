Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E136C0B2
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336533; cv=fail; b=OQgRIaewHQXNJQavD77M6maY2z+xUS5laLDe+PE798BNSc5mupfa4zyjHBE/jAYHnBxkjBxsTKh/NlUFq6tb3AbPGj81kvMrlDlvs+C8U4tRg3bDYU6r05jIHYgrZz3SB/wdzHTbEtJh0kyUT9ZoXgUiuvBM6YJRM/ITjG0Tvzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336533; c=relaxed/simple;
	bh=143oOrmMYfK2ZCjAL3aEWk4sipc8a4Jw66qoHggF/8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7cUqj16etSECpD2QNY1LnxiCDZ9CsSG+HKORXqqsZxoLBM5vKT1NzSTwEaVhvF+sCmKE/WDvsSXzh9O/VdpNdRjtnP8PIxZFZmBAm4UpfotfUOP32QZ2BM9Mk94wGUzOMRyFbqirMDGvg2kJ5AgH/5ESc6tr6fdGlHlrQ3yBS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=cQwciBGz; arc=fail smtp.client-ip=52.101.53.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="cQwciBGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiW4WdPX0yHftNTP8XpmcID6NxL+OSF9BBAbtEw7jPrcx6N0iLyuRBd/IuwOBDQvMubgOLCgfrz3i8r7RQj7V0e2jtIZ0P0ddA8oeeNguOxYtsaLSy13RR+2mXZoYbSfUrhx9BL1VjpAM+jclWvcoJvY0j2kSX6AHTzHwtoDMqyl9ZQM4ilnBq8rwDQssceip+6c2ZTJn4z79sedHyJnXTKxrChINkbNLV5n8SgKvH1YNqxS5oe4uXWo5TCqt3n3NoBMI+Psyae5NwBfo9sb4qpNAeXMsNrdWFwzV9eZEUlags8SUiI82nwbsWaJ9DVtaemApBzZQY06HTpYmmglig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZFjciKFXeEbtpnHHUeEPzUHZfLHRDTh/GRTjatnXyg=;
 b=QJuDvLGGzZtnrmIXdSBBDuaXGyzFRaERNg0RN/Xiqcbr/kkW6qDx6GSTw/JYT2XImoLc7WxQYaAECuXc0FN9UqkkMrms5E3asLeomOc+h7mAYipidvIf4s6TDFVAln++6M3pIgrehfyFgx7xXn2QMH78HROXiq2paOX/qk3R/NylQ2bggxD7ZggVqIz+SR5gTA7RQ9+LvTp4E+NKNxjx22evwAA0/0ElmkFaPUdwTJIluTMYtcHwiFjwXLX9XR7jw1ZGEPkQSM0BMhAaOW/UspKuvlq1xRRdYSdxkN8YcfBtkA0Vt46IrI/dOvFP9zr1o4rQIewUuDMNj0vFJWgf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZFjciKFXeEbtpnHHUeEPzUHZfLHRDTh/GRTjatnXyg=;
 b=cQwciBGzYMMKClG1KPZ+Z1cLndtz1Oy83l1stR5C22KruQ9n6fjdfrKgIAFm/uIvzhNVgFaXGgOc7pvqaQIdOzVqD/INlj+d7OVCkWGgYOioYKl6VaDmyxsHxXtxcBdRbZz/bz1GH7EEC/alfZaiDkPDs+n3OIAwCPL49doziuYo1APY4DHeIMKcfmw2tkvdNZA88vo2WrkU4GC6I47zJUalYS2yoUbBVz1vagR0/jauUC/NBzpOjvtYlCzjEzNjqW5XCeUFuxNlZEXBlnV7slWve8EfZIICuUAyCihd7Dq35pEucGrQM3LXREN7DjJZAIZmUOtVOD7C3VTYgYlcxw==
Received: from CH5PR02CA0006.namprd02.prod.outlook.com (2603:10b6:610:1ed::16)
 by DS4PPFC21A5A478.namprd22.prod.outlook.com (2603:10b6:f:fc00::b47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:55:27 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::52) by CH5PR02CA0006.outlook.office365.com
 (2603:10b6:610:1ed::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:26 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A998EFFDA0;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
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
Subject: [PATCH V2 4/5] ARM: dts: imx: b850v3: Define GPIO line names
Date: Tue, 17 Feb 2026 15:55:19 +0200
Message-ID: <20260217135521.65742-5-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DS4PPFC21A5A478:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6065a88-7917-4f9f-fdd6-08de6e2c3432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xB6A1Yo76CgHF+OBmXCaN8bDVGfXsEHFK/QIJ6yCkJk9ounuL0xLzQoUcHAS?=
 =?us-ascii?Q?cobY0Tr+TZLCBEQ4BVccfkySycpZZngJUpaITytcTEc25qn9Kw7sP/iKCuFx?=
 =?us-ascii?Q?tL6/Xaa/vVMW/Fs5nwNVj5Cp74UpzJYCIYZsIhRP1M83o8JvBmAQlW7rT7/n?=
 =?us-ascii?Q?2qrJmaNR5Wgs3aIbwKqPJWtQe3tgGWyHlyYX+yT7onxfiE9sKvZkExX5wy+O?=
 =?us-ascii?Q?ZCrRevXH/RnX4E4i1jTMOCloCdy0m8U0yHFQr1mukrVbjvuNeg3uy3Mu63lf?=
 =?us-ascii?Q?63lQIr7usl+Mse9dlMNIJ2mgOjr0io71eAbacGJ1y9VpgFP2WUDf0X3vhcNX?=
 =?us-ascii?Q?MoKciVmoxab5PnmmMtNFhnfY+VvJp/9YBmSjLEjNsaBd9l+ZW9lRyvW+tkWA?=
 =?us-ascii?Q?r7B3413BCoq4kgabwCRks0Xsr9xHexGGhgpn0EryStedxoh+WBcTP/tyDMsy?=
 =?us-ascii?Q?IF2v7mxLFY9fo6hOV0oi4g+PUh9VyM9wComieIQ0XFnjMMxtKs2RuiNaxQzg?=
 =?us-ascii?Q?FfC9gFNVYdCszcCxCS6KGFbCyqoG9byWDJzxXWpMhpitPq+VbIPvN+XL1UYf?=
 =?us-ascii?Q?TvBdSxD5DuRggwwKp43+S7OeUsJwsbG5WHArNHITIO5lzPpcyLov46ZMnSGL?=
 =?us-ascii?Q?4fFNf5qsZnDZMKVwZihFM01w3eKwPfFQc3NAPkiSk01IwOr8ehHXKV2sblYY?=
 =?us-ascii?Q?AnQLZ+eonKQ21M9VUFlZrGwCDNTLJLk3+YC5hfXfR1PZQRzgBHHF/WYF+BpA?=
 =?us-ascii?Q?pN6a1QVmgXM47CZiUpvYzP4++IInmvAcOngyOJmutodo6P/lP3RYvN87hW1V?=
 =?us-ascii?Q?BVpxknzPRwYAtQ47TxsE/9MDKyCtyn5c7qL/7r1ay4UqPpOkcp2FDJ47vTEO?=
 =?us-ascii?Q?CXVJR/8wapNEyH7vve186HHBDDpq9jGSDAL18keTGjt5vavYLKQ5nnSQZG8W?=
 =?us-ascii?Q?ck4gi1zVipnVyC3Y1g3wfHcvnmEqvC/FNHVXIgUMIXWQunBIsWf0YmDS8QGc?=
 =?us-ascii?Q?atkcX96qvBC2yL2a2i/x+liVSXm6W1cIKwr/kS7ywm3RWXFTVTTRREn92fea?=
 =?us-ascii?Q?Dg6jIKPN5iPbXIq6sKlwFXbtAOYMhph7HowOQpxMcvnbxHW8DVz1ZvhB9jAO?=
 =?us-ascii?Q?OHVDV2YPvfzWXEvOw7GtjiDc+hPAE0k3EP8rijzBmApj+DjHxPgRd4yfnXnU?=
 =?us-ascii?Q?T+MtBjRm+9rav/WkMZuvUy4aMwYXvSb6s+7EkhpmzBIRpQYLf6Rnuz2jdcp0?=
 =?us-ascii?Q?pvCrgmTzdLuKy/OJYRePR+jIuV1MOlgqPHoI+IhGLcKLXLluUzYDEk0a8JwC?=
 =?us-ascii?Q?NXoNDn60rPju7pW3aH2s+0rp5MOMn3vI5iAWQ0cfj6natSe/UQ29M7/gGiGc?=
 =?us-ascii?Q?NjLQ5Wy2BYy1KKHcv0CIpqgPO+sHpfpSCEMyMImp4lbX2O4KRh1KlkNTUTpE?=
 =?us-ascii?Q?I+skK0LdLYs1+8FBQQwmdswu0MI/BcAm0oTUj1gTHIzj3bv4aElTvUPh7bLO?=
 =?us-ascii?Q?Je6gUVl3BDL8l5rS6W8eaSugYrmEda4l9BXBOIYl14KMIfBY32Q85eDz1iFS?=
 =?us-ascii?Q?GzBLzz/rze+FaI0HEiCvI4FtwNtcl33HiYLaigRxkFXx7DCn9qil7rYk23NS?=
 =?us-ascii?Q?bLPVRe2ytkrXIeRjN6vEvS9aR4mQBWAYY0b65gkQ405YLmHr7S9GDLfvAg+n?=
 =?us-ascii?Q?uQKwsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m9vLyKf1kP+BQPZpQ02fbzXwQskRnPGUihmeEJsrX18nkcZHG95/WlX9ktbBpSCJbNdIPxW0LCRH1VVFnAvvma4Ffuz0sI2hVRBKTdl9lM/KscwPycG0xKEPqbPK25NxGTEMM7Kt/7GVZAOvjdAOHLmtKPkEIDrU4K5Szw1ZF+2ZcDT4JOV92KEddDymHd51w5e+2mmUGXvbhDTEIXnQaDd6wL6Fc0k96hTRsJMxufsX6Cs9Q6yiL67s2pknuYS3ex8FAsxIjGWQ8HQ/3/ugIAx9Qu7JT9Xb7tsOP0PjVyb2n5RMxMnG4Dn5ix3iN4y8GxceOzuBFwdVUzPupQEXZ9jcN5KNyOPU8/bVkDo9w6hW0MR8JalNGIuxN7G18domOkoU1/D79jpdtzBwdCvMwBCGaRunZWfLBucIvTro8fiea0bbaz1cJ3GpdLAWxfzj
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:26.5344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6065a88-7917-4f9f-fdd6-08de6e2c3432
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC21A5A478

Define GPIO line names for gpio4.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index fa5814287f71..e5e66d536a2d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -53,6 +53,18 @@ chosen {
 	};
 };
 
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "PWGIN", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "";
+};
+
 &hdmi {
 	ddc-i2c-bus = <&mux2_i2c1>;
 };
-- 
2.49.0


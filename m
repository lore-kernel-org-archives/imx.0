Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A83587D5
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223345; cv=fail; b=aoBz4zsyz1YFj0jtLI685eWAW3SANAFlVB3TIpi7oyW+uFgl8mxKPKKNPaVgH02uRNhCfMcWq4tucYb4N/86RFDzojxvd76UwiY1cRBkH2VRLWS66WmLJ4YiFYqkV7QihMfnfk36jxaAD7ePgGQfnQgEMrXpr9Xpka81xKei5YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223345; c=relaxed/simple;
	bh=qRI8h4Cw/TxxoKbRNDzCNUPGeN8sgWamsG169Pth99Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nk6/fMIhtWNRam5Bkn2/ocZBxtpgMMPU05wAkAM9i4LfIO02j552pun/YNlQ5kW7y/Z3tA1BEXLQ9GVABfc1hwXEdTF1slc6tVfALwWz5VWBgNMJ8x3akCZLE5SNrAdb2lgpBYNRPqpquJAkuWpVtzTQllpgAYKS2xj/Y0WnYac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=bT/UGCWJ; arc=fail smtp.client-ip=40.93.194.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="bT/UGCWJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcrQa/D3izCW0TYWCOqTlYH7pkrj3xYSg9N/yJvjI7A4lvGiQQsin4NCP0yDKOw2frebf2Cl6+OY1YFFWroZLbeM/I6500tSXNv6oLRaUSgfnOI7EKBBiK7DvKkgLH3hugXw0AqY0xV/wKxlx5wP5y38KiyhpZUcAM02U8eJ6jKi8Kck0gxzWb/dh+Er4V0MrxJZEkQeRiZWm6AvmeMCzlN9E6mJYYahA24xJIjaywreenTpmzSIG0EeRQ6GJosZau4F1+xa68/wu9ZC39kJFdSNrUkehr5A0QUYmHMGhs5SdwO5u5q16+U5EhMdN0etu0RPdWVrnZWB7joxpakihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=;
 b=VccIfOVTg6k/70H58nNyxXseXl1VVHxJ2hpX8aAmrZCengC2j0tnUBLSp/7vfKNSUV9Z334DcMqog5EUIV4XppFPkA40yEUzEFCEnxq9cwQHt345Hia26cZNAqibdAXhEtSZ3NibO5i9+tFc3RitZ1d6WSVgEYAbvGpw9aNf0yFyryXesyYK31GC63O7gh6OqluDfWPvq3ckc5/EGL0WyyhWYZxViLKUz0/uACg87oH3ORUTH/1bIZyrg2ISSyVrJAAVadfwJnBI5xsMzju7x+ge5AQgee72qShCeLt6d7W146WfnYQyTViCxEb+nrJU95+tG4iPF8rSrMlJZ+Wi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=;
 b=bT/UGCWJvW/1bIBtr7U6FwphHvB6HeOEHgCSzFaEl8NYQySag7svhEJr0vgvz6lSGI5uHZkUQuKok01YtRew1KcsWv0qv+fkzflA07R+szja+tgc6VlDA80+Rk4aCXix68CefohG8Ns8I8mRPIx6eTJdFYhhrgJgben7Yhs50GdeB5xi8aVIjuvvOBZSt84Ilhz3abclr36YzmQcgwdyNp0Wl+RHwhH0twsR1L5diRBn13TmxpgHg9gWmsjlAC1FRDRZtE6ZSeHHdlvhgPu/J3RluPxnSNP/kpdsnfUI3ociWbI13idDhj+mMGqlY2TmrTJLdBhdYeQ4d9opidcluQ==
Received: from SA1P222CA0141.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::8)
 by DS4PPF591692A45.namprd22.prod.outlook.com (2603:10b6:f:fc00::b24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:57 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::5b) by SA1P222CA0141.outlook.office365.com
 (2603:10b6:806:3c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:56 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id CF142F2E70;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue in low power mode
Date: Mon, 12 Jan 2026 15:08:48 +0200
Message-Id: <20260112130849.3748465-2-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|DS4PPF591692A45:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48e797dc-f5f0-4d17-0bde-08de51dbbea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LWNehh08EOQPfBNmVW5VtmzoLvh7Du+HNw38oqN2pdTD1Y4xvnsn1Z2YfFMY?=
 =?us-ascii?Q?XGuT4jdMPI5cCSakWBjkLwbrFr3U2MM0ea5jLe9RsHlr6vwMNE/z/G21Qm13?=
 =?us-ascii?Q?PaLONy3fIVb1QWw5o6UJIpiryTdoDbR5jWl5p9KWc+3zVrh13n1LttrrTc5A?=
 =?us-ascii?Q?2CpHtEnXapoNYuLnfV+PgZR4Vegnmy+jwIlJHqR+fLrrUiWhmIOn9FZdLW0u?=
 =?us-ascii?Q?zwu3cqv+fwFxHvUmXui63m4qRBvgL9nIT/qVhU3z6lM8JL9ahLW9btenX1fN?=
 =?us-ascii?Q?W+O8BEm7jhYe+iigkqnhlzoqfVMpzcjimyjvNmOPrZlHh8TYeNhb1u80qT70?=
 =?us-ascii?Q?ahC/IVBx3/mmiNOpYFv83DGgk4QXIQtVsdXJ6YBPJ4mg3+v0rDKx5LUxhdP2?=
 =?us-ascii?Q?snxH+X6KiMxRb+4LFXgEnedIgmINhJFj1284/r6fkPuKtKPnSMRrV6p3yOL6?=
 =?us-ascii?Q?6PdgKtkc1K8PHreTDgdYnVGRIj2smXc0le9mSyRCZ7r8Yhv9r6fCvoeFg0mN?=
 =?us-ascii?Q?aJuNGawb87SQLcTsc0TAPK3QhQrxTGWVaXypYY/Zz07D4anGhasRxP+QzO1X?=
 =?us-ascii?Q?3ZzCQ9u9mD2Cx+0j4hdxOfml2k1ydS+m7Y+pPtWARU6e5CjwNMeSdmRInDpY?=
 =?us-ascii?Q?z2Qvzh1h9CvxMrzlWGI1EDughJsM29Lf76490Zf7GhADlkSJFVfZYxGBLh7X?=
 =?us-ascii?Q?tUqyHfj4Yy0jOO0uwjFycsT8T69skzPLP9ajfIl33nuqP2pqr2z7wFILA/tg?=
 =?us-ascii?Q?eWCdLsePSJSHhNeXeqtIfEHU3yWsEUqdKBcPGcaLMaMLQw21LbRogvlYc/DJ?=
 =?us-ascii?Q?kwhf3n99p+5X0LUu2TwUH7Ao9YP2Lw1kYC6gi9f5N/k1kXvcseKnzTipYusG?=
 =?us-ascii?Q?YyQ6EBOor8zJcimAjWeiO0k6o43ko4K9eD99Wdf49aLx/H/Qwv5uzC9gHKJg?=
 =?us-ascii?Q?vtmL0cemyVBke6iDlvBayscN9Od3CQ5zFFsSzbT+43B7zVKe2XtRaA3p6wT1?=
 =?us-ascii?Q?8w74qJ7eb2lPd4v5yvfL/TTr8bkd8zElmbNDB/mtNtcryPGdJd3SKfNJBrT7?=
 =?us-ascii?Q?vaa6XSNO8KL2+EA6cLS19J3Ymiuwl0kYgFGKkV512+j/MLLrsdj+H/K/iDbw?=
 =?us-ascii?Q?EEQsJq9/1V7NQCssLu7/0kJUH/HSMBm3ZZG8Phztir3Pt1+60fzEyYuXAXfK?=
 =?us-ascii?Q?spWOQLrUJ3DowplBfe38m7ItJGALdRnW7SG14cO+R2ORFaLyFnuYcGc76pzL?=
 =?us-ascii?Q?fxtBz7luy9zekWo2mLytWq/Y4uDf5HqHhDD/K51E6tehpTZLAo0nUxqC8jMh?=
 =?us-ascii?Q?PkT4DhuiK2HtVCEWcrAJAOLayGx70mQNMc4a6ZTrdSRKbycGuQEQZtrunsed?=
 =?us-ascii?Q?bKgAVs1AQ3MW801QuYYR6h0HLt9GfnwMgx8z8rAxQA/IxNJaYcSrU9arAVIX?=
 =?us-ascii?Q?yffVjpUYUst5Ew5Wj8bl30La8DDEy7423td1yMfww7m5bvShQpPhQbqB1KYL?=
 =?us-ascii?Q?A7W4rPElS0HZt5X7t+m1MDN9i4apax81xvJTnNKgm1UY+Op8pD/gPlGMTAoo?=
 =?us-ascii?Q?S9x12I5kSRqMu4uu+Ks=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:56.9554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e797dc-f5f0-4d17-0bde-08de51dbbea5
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF591692A45

Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
running in low power modes (STOP and DOZE). By default, the watchdog is
suspended in these modes. This property provides the option to keep the
watchdog active during low power states when needed.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 34951783a633..bf35d02d113f 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -64,6 +64,12 @@ properties:
       If present, the watchdog device is suspended in WAIT mode
       (Suspend-to-Idle). Only supported on certain devices.
 
+  fsl,wdt-continue-in-low-power:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device continues to run in low power modes
+      (STOP and DOZE).
+
 required:
   - compatible
   - interrupts
-- 
2.39.5


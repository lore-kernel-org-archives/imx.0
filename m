Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B523016FD
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582981; cv=fail; b=X4LAp2svQklhNBiOwOMbS3JW6Dou/muIEOlYgEilHrsrrDErnxCuRc/ZYRMFNQrTE+NlKxKL40EW/Y/37xnn+EbS72tJduHnDGGYe4vK+cmHNTnwf1ziQAvvZz4wVsS7judK6sOaYK2hCKy3U7XNUdX2qoDfnAr2pQQzHT5eKXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582981; c=relaxed/simple;
	bh=U1qZh2pizmiZUjy9HqOYPJkIcB5Kfr2HORIyZr8kP0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N6uWYNAsubj9WGAGkUu3Rp+mM3/IboDgtOtFgRpIaiXCoKYG8pi6ORiV+63+GBepN489AqmIs8JadoM4Ovyptd4u4ImmKnDCLkRICoP2TklJnH1N53m5XdegDcHbT3ztQALM1KrfHX78pyqb3M1T6Z4a5Xy5Y5YCtSHT9Mi78dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=qvthXgS+; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="qvthXgS+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAHrQOqiPQyVmlRXfSbuyIECJ+nxhskLitBA9eJ62Mr0a6Ex70zY9XGcnTwKhBHpe6snwlrT0GxY42s25/Yn4k9fYpsVerCOHUG/YaMiqhZNrbewyY9dzas4givSC8KMPxF4pPePg0gj1N8FKZlZEDayzgum/Rv+sPeOhaUbfhQpFm5w//D/DJgRS6DQa/KIs3uoL3HnYO59V9mIoxqIH+rzKVWcyntpn1S5De6C6/kTIqEsQpu75CHzJqWTea1rKXzVXcsJcGP3UsOdbCam1FQwSZkG88SPRdJ+IuFUO0W0rMHdPo+odOjMjDeBrdfiyzCXAhparGOBZUggXnKqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC23zVwyQUFnU/DZDDvT60Vkv1LHZkSJ5XqNGQ1Yuos=;
 b=G0WGfhh/45KtMIoZ9JQda7DYM7rDAhftelmZUQzxuL1k2sp1SKcGXQd9GlFYDXS9pCd83wGcTXy7IsZkqZ8ZQrjKkIbBXlWMp1U6PY62ieQbzoTY8EaMJ7VDqnAwZw7oQzBWCJtoQ++GF9XWgC91COcCF4MhyvdmoLH2mh5ISwv8rM1KfxUqMNWvGsbwr+UqEy3zK9CTrvdFfqvEI5VRUnL9BiITgROLsQFvVkc+4eY2lhF2b/wD+DBLYghFtmMrSswe1x+/EtRu2cqFC6mWVqEoqffv2IFX1dQ0vBRYfXaceUtkrBvdNe904GekKbVMW9voWVMhlQqfL8r67FYimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC23zVwyQUFnU/DZDDvT60Vkv1LHZkSJ5XqNGQ1Yuos=;
 b=qvthXgS+Vu9JF0t0KOCrkV9Txj26OLQkZ8MJiGPQr8L7ln83qrykzBpaEzNHBh5tro8qLzHxfosX5jbb0bMZLp8qhjDrSOMWhl9VI4xJXyW+W9Z7gyDrAoNFspcPn5f2UKhJK1+1vQEELaKK+PekaVuDLZ16a0t7TKZPx+Epp+kuwIITP7XNx0+inOiOkYgW05Mn+YcAVy9MeKKzcqSIsE7kU5YI1nzSwIbQRFH+IDsHlW92HY90E/b+S/SSP9DzB5T5x+cRu3dUCewpj3BlbFv84WIzoJYiO8NnPnzC1qdq+c5vlKfSZDxj9jocm9Z35wtpLd/tM69OjR48B6PKpA==
Received: from BY5PR17CA0012.namprd17.prod.outlook.com (2603:10b6:a03:1b8::25)
 by MW6PR22MB4579.namprd22.prod.outlook.com (2603:10b6:303:24b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:56:15 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::d0) by BY5PR17CA0012.outlook.office365.com
 (2603:10b6:a03:1b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Mon, 1 Dec 2025 09:56:15 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A9C0DDBCE9;
	Mon,  1 Dec 2025 11:56:11 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Waters <justin.waters@timesys.com>,
	Akshay Bhat <akshay.bhat@timesys.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6q-ba16: fix RTC interrupt level
Date: Mon,  1 Dec 2025 11:56:05 +0200
Message-ID: <20251201095606.990-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|MW6PR22MB4579:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3eb65e3f-aa88-4df4-7fe1-08de30bfddf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y6A5E7K68Twphhv8MKAcLknr/2SGPhIWUcHxcThGAPEwiA2t6DDk/ddvW7qx?=
 =?us-ascii?Q?ZzgPUnXJUKw9lypkdM69Wa5tIp+rz7RjQxToijrT/x46wsDUDJRGfLN2jgdk?=
 =?us-ascii?Q?nt1vzd5ej48ZsF91JDsAPjYVLi4iq5wnxapv2YMKx4lKRUhsppQA2q4FNA+R?=
 =?us-ascii?Q?OuxUuS2q4akVT6X/82sIn09+e+tGaAPb6BHVVxswGRHpr3a7SKLuMCzQpS8U?=
 =?us-ascii?Q?/gBiJzcXqikxoIt5FsE7eW20UTAyur4t5jnJjtijHybSCTsvOeHmEQuYopij?=
 =?us-ascii?Q?zXpajF3tK78Ailz6YTt/qsDskw7XVGzAZeHFmzHwzyhbeYlMdTB0uuwmmy7H?=
 =?us-ascii?Q?CCj5wg0aFCqltqHmTQ6aD9hQwNgV6TJoBLWXXnEqCY3hOE3Qja9vW0urNM/8?=
 =?us-ascii?Q?N4UpQGSxHIQdTFJ+5OHROhcFQjJ6omTnOBJPO7XsmxnPFvae8optdTsNFa78?=
 =?us-ascii?Q?g1TGK5WMTyqckwfSoro7ZT9nxAGeUFw3yL95qx3ube0W2wubN+qSR//mWW9I?=
 =?us-ascii?Q?44HHFm7mOEb52cVTBGz9hxyiKFYw9OuGLrcmZJiJbxA3JZgMo9U5yd1yanPw?=
 =?us-ascii?Q?Eha+mzkFEqUWEPwfRHyP02MLbU/0NNeFlRJ+nVCTMkqiG0ADK+Al7HWlhpB/?=
 =?us-ascii?Q?WS1Xrjrxrlm88ly182E4Ru44nRYjODu3YdM8mx+TjB1u53TA3AWKfuK+Trif?=
 =?us-ascii?Q?hHsSaL0j5IiNyDv4DzUw39uv3lBYOiTsXYnuy4SDc52bapSr9UcAwVvlcXea?=
 =?us-ascii?Q?+BfT5wsfY/jcUuTxmU/+X4U4StIr8kI7WSB9uTlIVGg5CJVfx+pFiUJx3Gc9?=
 =?us-ascii?Q?62R7k2L+RE+gohqPvQk5bW3t+i+kFOG9OSe9z992LOFYYbFBfbS5WbbbyQ/Y?=
 =?us-ascii?Q?Fxo5pUEw1Sry4aqmU51F7lUol95nU6/kAVH0CbaZDcLjjoF2b7/d/P9SfNUB?=
 =?us-ascii?Q?1sx/0JpGXW1R8JL8zA9AXPUbjk6wZgvhvYNp6TKVXhubPcU0dUIExZYJv/In?=
 =?us-ascii?Q?IjLSn0TEx2YmM9lQmB2mbC1YWcBCKkmC8Vc4iacSNPsCLllcA3dR2xTuQNcR?=
 =?us-ascii?Q?32yE6Tm1Gvjs+3Jah5NLQeqwk/hiG0YBGiY4n5kzFZ2uSeWBa62t3JNmLZKK?=
 =?us-ascii?Q?rb2O4uOh8HXNA6xepQx6B3BwG1eODSR4sfUOSgX5ubYrf+zDC9oUAS8bW85t?=
 =?us-ascii?Q?IpGFtCnjWakHMRNFwOtM3shN8FzNM7MH9WweUSHEFRIrJRG+m8s7a4Vtl6Sa?=
 =?us-ascii?Q?JDvbuMvj44NqrvX5hbu4orqQNdtzmIrsmPWpQEWrW8d/sf02owdt9AJvE7nw?=
 =?us-ascii?Q?8Ac9Wnz27u5F/98eTznyXXPRihOn4AfYDFYHxLFjieJdhSkSdl61khfizMEM?=
 =?us-ascii?Q?RtNWy++TXmInhQPuNyQ47ODvums9Da5Y3GaYvyTTsIIOpmExU2YjmZmqB0vF?=
 =?us-ascii?Q?PPE2pGrAOCDJsunhJEVfCQohodWpKPJnQo8zPAhjL+1adHHZYB4ZEhxrIJKe?=
 =?us-ascii?Q?LACFgIhba6wBFKsQ6VYp2NAAdu0JX08Z+m6oV9sPOPrVpRY2RlXJb3jo6q2x?=
 =?us-ascii?Q?KK7ReOxSrzn2jYejJ+8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:56:15.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb65e3f-aa88-4df4-7fe1-08de30bfddf3
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR22MB4579

RTC interrupt level should be set to "LOW". This was revealed by the
introduction of commit:

  f181987ef477 ("rtc: m41t80: use IRQ flags obtained from fwnode")

which changed the way IRQ type is obtained.

Fixes: 56c27310c1b4 ("ARM: dts: imx: Add Advantech BA-16 Qseven module")
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 53013b12c2ec..02d66523668d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -337,7 +337,7 @@ rtc@32 {
 		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x32>;
 		interrupt-parent = <&gpio4>;
-		interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.47.3


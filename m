Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18962F4A18
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333204; cv=fail; b=Umrm1WHFqNSZHMFw1fuBt5lnLCi2Cm3h+XPcfLEgY5puhW2swY686axe5xucp//C9LFK4cPtEMSGPvrbh18GuavyaW7+vRz6pE0+d8zt1veEEnO7GPEi4si2RDuLtRm6trTjXXgEmJ0gs4ph6iIHgLExzPY1Rxufj0TWq4/4iAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333204; c=relaxed/simple;
	bh=XwagvHewfITdbL5r0PwF8v1pEBUNzUYJ/JR2706Lk6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agQbmVx6ykJJCB5Q1Te16BweX9nrcVsTMMdmzy9A4I36OEwmY7vW9CPoR4PUOSKrjbTvt/R5lnWnh6qxfrq5NdCmeae1bG9pH+S63M03570fiLujPhFf2NO8F0gVYy/BAR4vliA6S7DHulBWuSHwyA/B2vmegcG3B8jK+01ojDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=NWR9idJq; arc=fail smtp.client-ip=52.101.56.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="NWR9idJq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StDLXhkmeFe55laaRHWx4yMGDduh2ihfgmu77ecpQu5rUqRC9gWou/w4Mi2TdCp8ScFhOGQGcIhdBLWNVhCFSy8geCytvkMUiqZbifCpt4/2vJ+3x+F6J5DB6Rp5kDyxnwUUui3xVcBWbunFzAqVUVajQ9+6a8aZrYySFpPc97+tjUMe7ZCaXWwpiRgwTA7WqNKxMr3E8/p+L/OjLo/zIlRwHcH3B422DMLI4uBUEX11xpXRHZxWh0uvrtblqnMdAIXRVn7DOBXgB2ltO2LHkTYuj+65y5AFR0CQYs4l2j+mPu42LrXwqUFcvgfiy+tu1l+8fzijsalWYhn40PWwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRMttMpqtXMMschQ17dp1wWmvQbAZ0i7DDCDXaRiyYc=;
 b=wQB6a2PdUhDrCkAk85VM3f8/6flRxy+v3mRu/wYCa6xFnvBQwoT8jc1KyUijeCidTHar0Y/rO6Ez6QLGAIoOYqF/ss2SKEdCWZZ+GcrMXFpK+qk4wsyL6TyVxFt1k/e1sJ0sH5MFRH3BXKYH1OKx836nTB7pSsKdsNuj/UGiwd/gHtJmv/3Y3TIuWUZYR/OtdPVDlNtREylMg4sVreV+kyRx/5+DjGFkDPRbqrSJyEfjOhhyT8GLq9d+Z8mP5aveXZs7NKFSwUEiHuam3I/njaUjkl+05TTFhfxJXG/U8K5jOhDfqXGVWNQwbDuXhYIRWI1T3/2JjuFdLTaVemtIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRMttMpqtXMMschQ17dp1wWmvQbAZ0i7DDCDXaRiyYc=;
 b=NWR9idJq+j3yhjVyQ1cQ/1IZ63KJ1UZEnszEsoSRSC5VG0Em7pUZgGtDfZvTBTpS/QHiJXNolSbWulcmIMgLWDrFHDxD0Ytpbrrihz5LSIoQ0viWRdoqkOXE+Jy2+TZmod+4fb/RFHkkbmxUXp04BXnYx68xbcGI3ZLo/ZumDhV7H2j2KON0m9BofOPuriXMSkDpj14D4X4Ahtf1vGXmDDA+5XX/uR/7AhO3QW+hLvuChE+p3GnesARa2/+l8xttbAON7EN1hdEIz/KZLLx8dF9NmCMmyvXH71vXthZaIDPZMGh7N9dUXG8+sjlNtDj/v0uNf8l5aa+BoanvZOozig==
Received: from SA1P222CA0059.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::11)
 by SA6PR22MB5914.namprd22.prod.outlook.com (2603:10b6:806:41a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 12:59:58 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:2c1:cafe::5) by SA1P222CA0059.outlook.office365.com
 (2603:10b6:806:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3B0E8FFDA0;
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
Subject: [PATCH 4/4] ARM: dts: imx: b850v3: Disable usdhc4
Date: Tue, 17 Feb 2026 14:59:51 +0200
Message-ID: <20260217125952.53997-5-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|SA6PR22MB5914:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48d6fcf2-e610-4f8f-a34c-08de6e247476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sN+gL76yhb/Gkh4q9gwSEi/c5YfOs7viFlJe50HXIJEux1uDlm8XZRgtC1V+?=
 =?us-ascii?Q?mxdqCMueCyVhVm8SnuYgjcpd5RX5HaeF3wR1e+L3N/0VYVPD+IMeoLDVNYtv?=
 =?us-ascii?Q?NwOI04LEBZe+9BeUCGKLJMRWXx9pyc3hhWvRtV+NsnLftJq8ed5fv7qZ+Qx6?=
 =?us-ascii?Q?fvt942KK+B7e6Feim8iSXz22clO7QqIqPmuaiuWFbHjPzy8Yx1LW2XqfjP7Z?=
 =?us-ascii?Q?yxWl3/7RQndlF0m0wqFjvasPKwSdHdvM7qACy4J4VO/hMhomqtoGyf9Y/O6m?=
 =?us-ascii?Q?r5osr3fhumze5nyKe1JdaoUb8jMBc91wMhxdkQ8kyVWvRHiXacUocyJrVbb/?=
 =?us-ascii?Q?XUvLoGZ+VTmk8LFwmNvQwyS6J5XtaM8vMj9FHKX9yuKCcozi6uWp80B3uWie?=
 =?us-ascii?Q?hF2/487iSvgCobVcPU7jFIcXx9oh41S6u0Cg5m2hIcMiWH/iSdv8WP8Cp+f2?=
 =?us-ascii?Q?wJnllpH/CpMwwMDTCKV0MD/jXQeKTaHxbSU1mIpow+K3Jc74VuDTUAhHjRKs?=
 =?us-ascii?Q?ADN9etoL5lvjsTExY6X76pSj0brDNRiEFCAYOtg5Rj48qVA3pB0zOwKJvaJT?=
 =?us-ascii?Q?uHwk8kG3Nc6+IFXXI7KkplqzmaEMFvSsgpVUrRa3kx/J0VAsbKay/a+s0Ya9?=
 =?us-ascii?Q?r26rcWUsTqgJlbaWUIJ2DJxowPaXg/1LcYMUFqu8VzVwNp2KfkbtiiijgQ98?=
 =?us-ascii?Q?prfFTKCznyEsGheMuzijovOa4blVYpBKb96wlLgqG86P3BS8TjFydH3nsEf1?=
 =?us-ascii?Q?ae648CiZ9wrR3Tmvl5amb3U/h8WXOKgKdxnbGFGARSPJYIF5t11y+yQIGcQL?=
 =?us-ascii?Q?188j6awR/YUh0AcjJrSLN0Mrd6Zf/nvtxYm8iA7mzfZusZuXthr+mmmkXuko?=
 =?us-ascii?Q?/VDfJKUkHzYhaI1y+FE26hYobQIKUCJY1cmmMdJ1L8HQokuYeBxm447nzbZx?=
 =?us-ascii?Q?bE8oIGAKPN1j7XAILgyKMQs2sjipCNYa6tvJcZOKGlQ5/qmTr3FZu7r2tSed?=
 =?us-ascii?Q?bdoC1LTgzD1sqPBt2Eh2pPNS0GhWmSdN9jwLc7T+tOs+HHsaabBxvuREcWAG?=
 =?us-ascii?Q?bSXlASJFDrEGWJ/Q4SJo73yUWp9YV52VpRFv4x0CsozMG0NFl8cctgv/9oUf?=
 =?us-ascii?Q?N5jHDj+RTZf9aaubNW4EgBER/s47JoiQ5INx3CBPfrPHuuk3nl/Rp8kG8BEY?=
 =?us-ascii?Q?Crvy6tM8Hu1UglEGfvf9w7MP0Nz/3HWWSPpefdsZWuhDnv+bDbGyU+lLRVc7?=
 =?us-ascii?Q?z8o4Spfdve5r5sqH8l6QYse8nqTv+FiN14l4j/buDJh2ZbQ7yclXfVZBqvZO?=
 =?us-ascii?Q?S/xVRd4Cw5bpsIIe/Yja4Q7taa7EEUqsa4u6g1NkeLuegq7QRFsmauR3OQ14?=
 =?us-ascii?Q?ia69kuqTz4rTFJ9vJV1NRx9CcihOSp8kD0szMRQbaE99zBi3iRkrTBvCtMYx?=
 =?us-ascii?Q?ox/ueSXvgUlnetfb+4sFMycSfuRLDkHNIzvxtLSLK9SAfE+Rd5oOv8eMkI+k?=
 =?us-ascii?Q?DGTzTceePS0Q2PuDwfYisc0fbaK5APsjWO8N9KIjQajCU6++bIeQqCHqWGPb?=
 =?us-ascii?Q?yP/WplUGsj9ZV1hrVp9o6U/mUs+5MnQMHW42Y+n/LcYibQF2jvFeAXDirpMC?=
 =?us-ascii?Q?F3ISj/i4t1ngCK9bcxOsGmWZOpdD3MZmIO7yyDHad9qWQETNrOlFEpASm+fS?=
 =?us-ascii?Q?lvn/+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b2LyMvCTa8slr5UChmnFFeL1pXt8XAPkQs5DERASTKuktr9LB/eqBfdC9lekUz56erXg9ATMModmCFQN8ZfBAtDThlMbLF4CVJVvPOhWBTMWVwFAF/q9NUGGoCcZRB7f7f10MPyK8GOPr+wqEBhcnTPtIr/aZGw4Nz3yl3qZLL7CxIVfvgTJo6B7ya/iLf1YtgagEPwDviJQEpUNIqs5GoQSUflkMmgDeveu1haJHlKcGjuaRH5Uz/3Mtm659l64PXSQRLcXNDdeGhEWfQeKUfviFyV65f3T8psNOECQNkKpv70HxUmcaAsOOwhbvRoLH6hlDBEoFTZcTlyGIDRPDqoR1VtBK3V1fEFoIIcrMfV6JrYUZELosMPT78w6qtdlFW6qb4T55CMXDhk3phbh4qJcYT9K/kZ3/MJu8IZEM6sF0f2Huxx8XIGidpaz/9tA
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.3243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d6fcf2-e610-4f8f-a34c-08de6e247476
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR22MB5914

Disable the unused interface, to fix a log message.

```
mmc3: Failed to initialize a non-removable card
```

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index 30181b5132a9..a030b26e06b4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -303,3 +303,7 @@ port@4 {
 		phy-handle = <&switchphy4>;
 	};
 };
+
+&usdhc4 {
+	status = "disabled";
+};
-- 
2.49.0


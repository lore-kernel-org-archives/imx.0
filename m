Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4EE47ECCF
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984755; cv=fail; b=q6CayisJXPyeFKa/hgeSVwkrmXswGAa3RxEbDZWdfAHUqghQdeBeuDd6hlivAMjvTCgKvJbEoogC+zTOrF3aYSy/QseEKVSkNJJpM2MAkLs3xLCppatAbHAEqQkFo/q43VB4FCoCqdAEvvWy1gK7ZQhTclO3X5ZskezlPZ8co34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984755; c=relaxed/simple;
	bh=OGYouF0dFp4v7uQovDqUxabLu/smjBXaac4ebPL7Po0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVn9pEz1rtqLqG4wjhsP/yqpXuOluaUIBafIntmStqI5Fp0G5NKwDDuW5ozdePG7Vr+XcGg4Mz9dJP4krv1xfcP4n0jtcreTiLuXbQLojYlikmDSOXhORvoHiv35dPkly7XgDkwPWWqNEt1Zvptzshu4y6MGmF0mTz6zKkKIyZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iKryHby5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fBmS8znX; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iKryHby5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fBmS8znX"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6628bqZR1954275;
	Thu, 2 Jul 2026 04:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6RckUNoeLCK4Xj+njkU0jLh3QsgM0nlKgQeyYPTFh
	zI=; b=iKryHby50N+SuDYYiQ5r1agw3rXGNN4wlgDTfnvsA+joBOmY1edX+Jl+X
	g9czfGnMiVmtscYr3y/pG5O68EKnnA4A+0K09oi+lZ016Yc5BCTuIYoEsd18a5U9
	cW3aq4SBDL6EqVlT1kPwIX2zGtRPwDsg7R7d9FUKUxySh9BNVPjdkFx4Mx9oZqqc
	1m/fPEyBNOrzblohuAbs0ahTY8ra/YFmgJ5a+ozomGx8TVzho0auLRP5juyxQear
	nuVnY1mnVu/PhDDFaT2hS5kKCS6agZA2DhLSxWvt4PHICo3ZEIS35I2rPykI9cSl
	ug7+8EQV3N1H/EE512bl+IbX+rX5Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn588v0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:32:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9UIR2Iqb6C8g5fNoYRQGpDkKmtcIspURRz0CYjtip3ddZEKVQu10vS4TCW+QMBq86mx4p/rTMQ8F6dJOdsAAX9/bQ3wlc7J7pQqvshrPG4BfsPk3cE0aJiuaGiCIdCdmLFZyN53tCcCOltkXEjgjQvvq3wvxH45ElAAQi5pp0rdEu30sAaQKXaqf01nRClt3T6aM6QEFzwO5swVZ54RG56AVQc4a4yFqs5DHfLNjKbsd4T9OJOeqwAi9/dOZIuEGUK7TTozmeZq38Rcec8OrRaU+2RGQaBOYC2p5S9z9/ANsvsiztj7K4mNHY435cV+p27wZp3sSmxfWCzl26UvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RckUNoeLCK4Xj+njkU0jLh3QsgM0nlKgQeyYPTFhzI=;
 b=gm1DV+pU8JPQL9seDEVgoMWS5TI/tNPisW+tvt1QojuE7eWHu67WXGVZqvMcCtfMH3G6oQdl7YBNaWadDj+FflEjcG9CQWVxf//DxWS6VHrZDF9DPw7NsKao2OD18q+rP8XRQXAnqEi0iGAcXyVJtbzi3PYF8QdWkGrazEw9cmSsD3d87T3wfB/ougJgRhyijgXM99tSUWgfxrzFADpmwd3xDYW3JyLHElPhgX70KltW7TOBatKxhpjJmZ3wXEjwWHITPg3wud2c6q5vZ5UKBwt7yzNteMer4SDWORi1i9uTsAoB0wMfPGtu7CRna1HbNjZO5wf26wccfIJkNG0aOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RckUNoeLCK4Xj+njkU0jLh3QsgM0nlKgQeyYPTFhzI=;
 b=fBmS8znXC4d7QUMcDJG1HvB9lJ64Is9kKzIfmt8uB1MeXmInzDQqHpRSAi0BnR9vCAui41Rb5ajyYPheKB4xHQxUql3tNgt6jpE+RsiEcbwuxt/6e57Vk8rmuEVOPnYZGWutUtpLjCUHnKwcfU4PldUlybUa8QtIER9RLR8hTKQ=
Received: from SJ0PR13CA0175.namprd13.prod.outlook.com (2603:10b6:a03:2c7::30)
 by BY5PR10MB4260.namprd10.prod.outlook.com (2603:10b6:a03:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:32:16 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::40) by SJ0PR13CA0175.outlook.office365.com
 (2603:10b6:a03:2c7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.4 via Frontend Transport; Thu, 2
 Jul 2026 09:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:15 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:15 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:14 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYav3611021;
	Thu, 2 Jul 2026 04:32:08 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 04/18] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels for CSI2RX DMA
Date: Thu, 2 Jul 2026 15:01:09 +0530
Message-ID: <20260702093123.1048575-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|BY5PR10MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 536fe3c0-30c5-41ec-497d-08ded81ccde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BqfJLgbzgbdc3+T8/NqBWsLpUr5uXNaY29iyreIQl5A1Ww3FH/PMN0/nF8XlmW5FaENhwdcHrrKuC2AdkoZc6O9HmM/QWLw0z6sI0fqaVe+e6QABgXFqKAHxR1fCTl1tzb/Bq5ApbJlpZx5HCCJMb6Mqb5Mso2M7yQJoy20H2DXHv0xUj53KrWdndGD5BkQq7KzLK1mRY5hb103xUOD2x0FJmb+Gx/6c9EODE6TUhCS7xKaQzOtRqnZUkPw5Kcb+lCGkU4tnnEdcqY/inTmjKYr83tVGGTvei056ucRmQsf7V/s5VBYdrs4U1dldrJXpViRdGrBTYc4eG8xpN0FGHBtB0rHV1ArmwWsizYMi9AdqFZ3kyNVqTiK+WSK9vsWUvxJKcmGGP8c4Xb9vyciiVHtBC3K584ga2ET9UUp0qclPv7q91W8McScLBXaBRVaCo/4+rbb5JXorXuIj9KgyRxwpokn15nDPaacZNbXHTEqqZWxyMWb5f8zylbNWM4zfc3nqS2wAcPvSDSe9thTa63nPeR/m4LhFNehD4jia5cQKMnJcgwCzeNVL397BF1DwRzPKxWWLI5V9k9asKe6E5+/A/X9n7LCtx1G3JhH0zVhWDvJ15/Rf6qcEs6baaoCXTSTHZDFN4UMRrIt+bT2cUorgL4kocwsQ/ygsE80Bw8qMC5IWugVlt6kSfcDbrjF5caV3ANw6HS7WAoisR4Q7hg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cv960QW5qEHFQPObxPC/ZY6GckQfiqy4CbLn7rEZQbalT+fKIBvIU61xzrXTnSV/bau1C87Mra82JROhitxFPr2RnPoRgfRzp9anXQ2oeLl88xfZjv1IJ72I2eJIUGMC0epDnQDM27JMTZ+2OI9fUz3VmMPHLziDgzp9C+C36Yvg0aLoOe95NMaAGRX8+aKdYtVJUL9FA7OwnVfDTgS9LDoHE3BZXaJ2OSEYtSQSi+hFUGcgHvFz5pTq+tGYkle1cJ8Q4TA7ew5nPyZoTU2BMwRgCLlraKVqd5joK/SQc8WCqG2hjy0xlgAo/p5r77ZxMJepdjj6ahHruMR+LzLhCw7tC/+j8wdju6dHZcy3BAIfSqq8lWA5mPimxWGa2blRqdZctxboCo16j7cbuZFjij2GXyNkl906OckI/ZJlp4f4sfc6WprFB3eU7VdmOjxs
X-Exchange-RoutingPolicyChecked:
	NlI00Y4yksDYNdmjpVDI5ukHOYSPDkR2sdLAM9MxxOnQPr9W4i8wTFC6bkaPX3/kTyDZMd7usAN18PHop4BIOSVlkxvM50RcDmCqjAJVwBJuaJER+g9Onomv8QcvD321McdplVhR9QQqp9r9smIdHCW088HihJ1XNng3TiF9dZM9OBh0LTH8zx4IOejGX2Vx+wltEfRyGCkjo5MUTjFMbSvijiTR3TieaqQyEHDC9WgyZFkBjnG3ip49sknWYSmIbAYsbcZKOgPRaMvr/WLBMhAdGvzHIcExxUbh1TKhNrdeegfVQ6bJ/fvehqZB6z95wpelStsfiMbn2ciOix5hSQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:15.7045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536fe3c0-30c5-41ec-497d-08ded81ccde7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4260
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX/M0Q/qxADn4q
 /ThLWu8HK+9WfA1DAfGM9QlNKrBaIist8vjYZWEk4XckJaG504AM6cZgE4b9tkqrICdG505eVuQ
 KnGhjWW6M2GpmB5+N5/pcihqX+qZxvQ2ba5Ar0f+gJ3lHPGrkn6P1CKgzKtWPvrrrItZPeh7puh
 qmmY5jzlMb9Of/xSC1024vwPKznbqaJ7meYk8Y/f+HwhaNBVlHY9I1nBJmD2tT3GhyH+2cQcB/f
 afjY4vCzem6/JehGfrBq7xnczel7g9Dtr7+Sv0G+pxu22Pc6U0C6vG4EI+U+wL3yDczZ0D8uyP9
 V/VgjxChCCiyl27YsVj/eSrI9qhwpKEueLW0+vR3EyHAW9D6VPz7hxRnhhLWvm7w7JCde6nKnvd
 FuyQzfZyZqC+1vJNrgD8xczb5psCJ/wsX7m1q+Vk6KiAg47z9dKXkQ/2RQ28uyR72LFrbNfVxGJ
 pr7WeGHpdRwPPBiEoHw==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a463024 cx=c_pps
 a=xi/Y0uDLJJyMvrFbw4gpEw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=slwZH6uN_nfNMSXhCksA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX5BWHveGuwQF3
 Hgo/cW4RGPtjiGI8ecIuvtPW3TKbCTkGDL1E8BionJxR/VwhGNZz+ATg2mZ/rMjrFkE/jgvur8y
 pk2eEhVA0Vji5EeAI11zVTdEGa1QHXw=
X-Proofpoint-GUID: HjIVd6AlynIKh6V3VLlljR_uTRNTr6bC
X-Proofpoint-ORIG-GUID: HjIVd6AlynIKh6V3VLlljR_uTRNTr6bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18..4b4545a5af19 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -811,8 +811,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4940 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
+		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
+		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
+		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 72 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -867,8 +870,11 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4960 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4960 0>, <&main_bcdma_csi 0 0x4961 0>,
+		       <&main_bcdma_csi 0 0x4962 0>, <&main_bcdma_csi 0 0x4963 0>,
+		       <&main_bcdma_csi 0 0x4964 0>, <&main_bcdma_csi 0 0x4965 0>,
+		       <&main_bcdma_csi 0 0x4966 0>, <&main_bcdma_csi 0 0x4967 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 73 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -922,8 +928,11 @@ ti_csi2rx2: ticsi2rx@4520000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4980 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4980 0>, <&main_bcdma_csi 0 0x4981 0>,
+		       <&main_bcdma_csi 0 0x4982 0>, <&main_bcdma_csi 0 0x4983 0>,
+		       <&main_bcdma_csi 0 0x4984 0>, <&main_bcdma_csi 0 0x4985 0>,
+		       <&main_bcdma_csi 0 0x4986 0>, <&main_bcdma_csi 0 0x4987 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 74 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1


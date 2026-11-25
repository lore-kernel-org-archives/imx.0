Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795600240;
	b=bd9+Vo05elVtmvl85DZ+FfyU56ydazRx7p3axLaclGzzM3btmg+5w505tMSRIfYblowg
	 SSF8avrgc7sNXwqCoE3Vq/YRRz5YY5qYmstOoa5achFFg1k/lg/h0CzW5d2PqVMsAaQFD
	 5JKN4ueMHEx34Je86VZkOOAX7UYTeEW33oS+MsocNdoIFCh9KufEn0o2D80nM3Wi+hRfT
	 aP1Ix40dnns0IvPSrct3++k/ThEUtyi8L9SBlMk/VLEaYGCCRCJuLvcGHyeNqBUEyYNo3
	 FSiL6bzlS+vWHXend3JygKWZIXsnNh6Xo+t0lrNH84x27ZJfG2Csv83waX5LTlzFvIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600240;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZgdwLacYRWOan3Xl4C1GDvskqNESmBgLCOSEkDITdRE=;
	b=YOETFSjtf77lTLpGt6WWJQ2ovqJVfN5M+qmx/emdVmLluJX69XJHX1cDU38h+YkzR98j
	 LcOoZtC2l7VNZbM7xlDSC5CsP91m6Aa+DCU8s+N2wCOZp3jRm8rgzaH7ixn99h2EPxQqj
	 hDmb1MihoAM2ZHu7bkoNHvvgHkft5E0sOvhoQhrKFK5uH5IGDeGQq5CZOtlnIZh1bpdSo
	 7Yqri+oD0D8s9V2DxJxWsMT/qnIBf/E8wC3q/LM0ldegrbf02XeFBKq/ThkLhqs+GsgRb
	 k9wUAN14lTfnDJboHW+dgf0E/i6fGrx/i7J3wf22f4CpBOWpnwdSOWVIuGU1wVfsX/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bshg.com;
	spf=pass smtp.mailfrom=bshg.com;
	dkim=pass header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=njwrf6FA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.11
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87875606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87875606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bshg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bshg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=njwrf6FA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okP8VVEiuHxBGXPxYGcVGRDbj74cIR4g7MzDEYlr7gjJU1cB5YpuSHEzHmmoF6/FbRGnL2p+QQfmHbHzgXAuqbvlUETCvYbyMKi/u4iR+mPhsYhSI+KPWTRsWp9J8Z0pxerxbRMBG7Mq4iI+m6Oao7pbh5/BH51+AffupVMhxSTE5AthJWywD+eve8g3sdfdKQR+WNSK07YfJpHweTMQOG8+v9C7eZ31EUL/W9pRFmBR38rDtWB203F2CwYSqCrzYVU+GY1ufPbc5yLsna/wgDLEHcNxYFmoQ8bfsGm7HOar/zuSS5/AoQNMzK6Vg3BvX9i4U4o2p6YxIxW6wpAAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgdwLacYRWOan3Xl4C1GDvskqNESmBgLCOSEkDITdRE=;
 b=nrHIAVKLAY8l46t65RLTy294/8su/jXcKHWGHKsKmzFRjNST+PC4FN8meDZYmBi/zj+wyIPOY96ZAnvRZ8fV677VL9nZ9LUOQCBCGncZuTz4P9FmEKjXd0JLZSX1k2ZUserT0z7dJDkrKrXixGvSA74qkhif6FJPpx0VvvrV1RRvdM0YklPf+VEURohivWEX1D5aYai3OgDPiRq5MKkm8ys2s7PITw3WrwW8OHGzKbKSN7BAL/ABzsBYU13W7eU0lUFxvavIm9NffMYbIaCEQX0AcnjGXDHc8rUIDt6UhhSgnSnA1yZSm77jFS+RaSAmRs+686FzFw6HTUF41yjeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=bshg.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=bshg.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bshg.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgdwLacYRWOan3Xl4C1GDvskqNESmBgLCOSEkDITdRE=;
 b=njwrf6FA1rDrIhZtXzHhUE1yNbIfL80u3lCMTN+5y54HyiInsy+MlPLjKbLpcFmMN7EtrQnffr2uqZBIjMNtKXujxs7WT0DX2Q56SmVFNo2YaPQhQfZh0iTMz6tSB//58dWqBxQ2DaVAcyItN4Vtqr11mZSPkNETyiio31fT5dbAZxRJzJMM0Poa8XN0j/ZmHZTgFp+qnJ9IC4qCHmHhtk19UffacNhFv2OUzFi/C75BDmfwU+slK1VL7aW3B3cJXlCrjdad8yz27GzCRnAiynH/5yVk3ts3ByDjKlbh2HFv9y58rk2CKHRhjLC7PUVRWk6O7FXHLsJWiB7ni/lQwA==
Received: from PAWP194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:4c5::29)
 by PA3PR10MB9310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Wed, 25 Nov
 2026 09:50:36 +0000
Received: from MI3PEPF00008482.eurprd02.prod.outlook.com
 (2603:10a6:102:4c5:cafe::34) by PAWP194CA0020.outlook.office365.com
 (2603:10a6:102:4c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 09:50:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=bshg.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bshg.com;
Received-SPF: Pass (protection.outlook.com: domain of bshg.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MI3PEPF00008482.mail.protection.outlook.com (10.167.240.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 09:50:35 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:50:10 +0100
Received: from TRTWCN12235.de.bosch.com (10.44.104.101) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:50:10 +0100
From: Waldemar Rymarkiewicz <external.Waldemar.Rymarkiewicz@bshg.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>, Waldemar Rymarkiewicz
	<waldemar.rymarkiewicz@gmail.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Michael
 Trimarchi" <michael@amarulasolutions.com>
Subject: [PATCH 2/2] arm64: dts: imx8mn-bsh-smm-s2/pro: keep SDIO Wi-Fi powered during suspend
Date: Wed, 25 Nov 2026 10:48:25 +0100
Message-ID: <20261125094825.3873696-3-external.Waldemar.Rymarkiewicz@bshg.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125094825.3873696-1-external.Waldemar.Rymarkiewicz@bshg.com>
References: <20261125094825.3873696-1-external.Waldemar.Rymarkiewicz@bshg.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008482:EE_|PA3PR10MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b70bef9-dc5d-4d13-0568-08df4ad98d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|19092799006|36860700016|7416014|23010399003|376014|22082099003|18002099003|261028144727099003|11063799006|56012099006|261022075727099003|261026121527099003|261026140227099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	TuxStOPpj9lXy/MzlnWKdKPQbFpEpEfN8sqWtQlFZLF3jt/TXkAXd4cekQt9tT6+ol2QPevTXk3THMHHO6usEj6KDTI72MnnWfomE1DU6tvR+65jbSCCqaMunao1Lg8ucBDx4AWPULImP1cW/SgUPBEQMzG3rc35/GT3GXiYn38j8JmwjSuy+R/oZqpB7mO2E7TouhZrkGb8zjd9WbHFTX93cS14tcVjjLHfSf8lK12cuxxzdgabpuBwBe+TT1hAvo9JMjFjXtH2QqxVlSJ/0HOPya46t6yVeG/xO1MO9riJpYNQlsMNLU0DigvUIz0LHP1tjacSSAO/1WtiYvQJmjQ5GehQF2WTrLee8+4WsBSR57DXn7GRCFJ/+zZNf/7O4EGldPVzfH0UdL1FN8G/LHJ6RUq0g7KT/IQoBqXj2M2pn9czusRSkpJ8HONp1IBe9QCC9hrv3CLzzivwiXhqSNVz9KF6aGX6yaS5mlfh0rysubpPvkvqZyq/Sz4Ok1oVpEB0AJhz6gMF9ZLixBgSsNiU51Sxp0h+BJp4JRiCr0U08/OV5WZ5f+/77IRYluFm/4inqUIrzWiHhlZXPRNdwEwKSL2ONz53iH9DVC4xIuyF4+H3GF0cawALsht+YAGy8m8REuWupnvyjyOceztl5Ni9cd5GC6V0w4bhkc+NlE+T3xRkhHMzvDMms9mWEOrOgCfevZKIjmBbi/QIOgr+tw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(19092799006)(36860700016)(7416014)(23010399003)(376014)(22082099003)(18002099003)(261028144727099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pE/xKq0SMKC1eHfw/hBc5Mn4kkz3d5wxy2hXM5kHZV2mv1VKieTl/5NwpIm63FUqDOVhaXopIRz6V2zRMDJ0M+Bq930iAsMtfR3lfIVTh7Fe1c7Aks7mvTkAhSdJg/XHHXXtlnsZeFOWmJ0Mdec59WA3zOc/4O3uQplJYqPc8QEj41brY2a4M+5mMjDzSxYUJRDmyrFzyyWfGQtoVA9hwxDgwvE37ZIIl9kpckiusyQQfQpuCdbv0HbtoqSnxgSo/1CJGrKSgEeGv3jYBT3Qa5ovE5otMfyW4czMlMdIqHC8CEpJWlM2lll9bImIgf7+pdq2Ex+EG18EqLDQMCK6UkKmPUseINe18R2f0C559C3r71GtB3Gz57IkYQpqa5wkUvhsiuN5B4ylsPE0esDEsfLLALOH6uzLvJftjDSa13Fa/V/X3eul7dQHXBG58ZfS
X-OriginatorOrg: bshg.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:50:35.2517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b70bef9-dc5d-4d13-0568-08df4ad98d91
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9310

From: Michael Trimarchi <michael@amarulasolutions.com>

Add the keep-power-in-suspend property to the usdhc2 node so the onboard
SDIO Wi-Fi module retains power across system suspend instead of
being powered down and re-initialized on resume.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 67c4f3e364eb..dee126fbf4e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -264,6 +264,7 @@ &usdhc2 {
 	bus-width = <4>;
 	non-removable;
 	cap-power-off-card;
+	keep-power-in-suspend;
 	status = "okay";
 
 	brcmf: wifi@1 {
-- 
2.43.0


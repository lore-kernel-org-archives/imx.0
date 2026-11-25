Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795600241;
	b=pRJ4mLW0s5S6/EN53r3vjXS793p5EGpWx8DELYix0IY15yyVUJWs8+Zzj02SMK6t0jYe
	 wa6fZ4lSOBIgTp2RLk1x2NBKIWke7kjfvb3F0iF+MndzKtqdjWNnChE4X+zwrJECNPaV1
	 kaASb/xAbS0mhqOIVip2xxthFuKJ7kyiqHEkfklCqM6f3v9ptnUKmObRvXCMUQzpUjCF+
	 RLIDUBGYrrY2ZIAxC6MQy4g8e9UBHlxUhO+Q3j+DE0vX3ENekmWSxMNthEfO4WyZXbyFh
	 i5FCtGvUjkxxFI/848WEEi+Hd9ERQjQIiW2WyfNvy6h3uPkdRGERxwK1sVxAhNZBp9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600241;
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
	bh=KbsVFHHNWEIQ8gIVOt5ue3JIGnd5xN+OpcNqAdKpcd8=;
	b=Izw+0UBtm05UtdIMzR9XiZou5xZeIcBQGz2Vn7ciRjDRj7MVuaaUDQ4cKpHsEyIYtq6b
	 4kJf29oAfja90OGEEUkZ4AdzzAi+s5jlBV9+JOsBRZLNslq2NmF71OzDu+Szyrk0mJlaL
	 FHeChQqyrFvsCgEsPcUnizescUIVoMXc4Sq1HPSFzQmOgsnnVfP6fBnButmSpCOM6Jkac
	 fTD151ruNFKQYDl+IxuV3AdEJtv5EEP4Dn7eAYCOcqjPM9G2GkxMTlxzWuXb1XWZcx1C8
	 kF6o3NeuadbucTn84t5sQdNoDBsmUBIVc1edRrLUJYVFE8K96IPQVM+Ys5WbYhQQQwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bshg.com;
	spf=pass smtp.mailfrom=bshg.com;
	dkim=pass header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=p8TacpzE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.1
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEC606A32A
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8EEC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bshg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bshg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=p8TacpzE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cS16PfHT3nSsDyw+7QM3y0A1jyXhMItdFLJdOmcmmd5923lDbLvz69a9fkMtUGqsM1hllqQZX/KRHhdH/6hD/N6syVEU2O2ZUSL4jj+jVDLsLtmUekLhzP5lqzWGOPqm0WVu4A34r/UKibRA9DWQOJEijPwbv+MG+zowzzV70t5HdryPPAoBJfZQxMai3vj0Y27CeiF9QJaAiPgsdr0PIFYLGyF/lsVzk9z1ZS9NrniAAXbca8BWbJs364jMFQ5WkK9tfbUBrkP62z4HzJsJlqViXSxRxPrNFyKIrfrZAERhkiuEvtA5l5VAfFagMrS6am28AJkLS9HnmsKuI0pA6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbsVFHHNWEIQ8gIVOt5ue3JIGnd5xN+OpcNqAdKpcd8=;
 b=PSVTNIbvOSlYaIJYNsxNSmcVNEtxT14b5P1uybUNMfjNBBNrz13YNxH5GasUUAR+4lgg3eWyDmeKmmGrt0ns8OlDzj4tkMXQZhVSO8EMGOmKGwidqOmP8OGtNd5jFalV+neTy0SVYYwpYdALn2vidHSEIHrHqMXmVprrEE5ELY2pZwsEwe5fUO7qNh8C7HHPPbzzbBserONaRhs2h6O+3HyG2HJaAZ6qp2q9PdB+fD2nmyR2iGI20DBQZuHv53dTWVcWCjRbYD1CKkIsQHY7ko6jkVgDrVoakcbhsEg2+6FuC9lkJGBn3fSJcW5Mot/fJpN4A515YI9aRfP0O6WKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=bshg.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=bshg.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bshg.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbsVFHHNWEIQ8gIVOt5ue3JIGnd5xN+OpcNqAdKpcd8=;
 b=p8TacpzErD+LFGW7pwrEmdE5w93YqjxDn9UQyteDnVKh3GZne7zFIV1nKvY0JEWJt+lIhpsLhiHZLCSnoohkA/Jfgl6AbwDA0mR4CZ2yMmz5eJSW2UWiO+aJ0Caj6jWLro8v6CMCPnk/hLb0SgiM7wg6ShrsXpsk/tvR5ljmghns4IQxFXGzVCDhsDNvSfZaIBBEXH8IDa7XTJHNSAo8ot0DiaIrtkUQ4V1R7OreHuVoUzbODZLca4nDbF/agTohUAk20NAlEm89mSVf/ReBy/yn8XUsbM9EqZOpMVIcqqSag6uWBPe1pcYXzSEK6MQZGIHw05/t8pY1R5F1EwDnGg==
Received: from PAWP194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:4c5::20)
 by GVXPR10MB9406.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:50:32 +0000
Received: from MI3PEPF00008482.eurprd02.prod.outlook.com
 (2603:10a6:102:4c5:cafe::a7) by PAWP194CA0028.outlook.office365.com
 (2603:10a6:102:4c5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 09:50:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=bshg.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bshg.com;
Received-SPF: Pass (protection.outlook.com: domain of bshg.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MI3PEPF00008482.mail.protection.outlook.com (10.167.240.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 09:50:31 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:50:08 +0100
Received: from TRTWCN12235.de.bosch.com (10.44.104.101) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:50:07 +0100
From: Waldemar Rymarkiewicz <external.Waldemar.Rymarkiewicz@bshg.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>, Waldemar Rymarkiewicz
	<waldemar.rymarkiewicz@gmail.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Kaiwen Zhang
	<kaiwen.zhang@cn.bosch.com>
Subject: [PATCH 1/2] arm64: dts: imx8mn-bsh-smm-s2/pro: allow powering off SDIO Wi-Fi card
Date: Wed, 25 Nov 2026 10:48:24 +0100
Message-ID: <20261125094825.3873696-2-external.Waldemar.Rymarkiewicz@bshg.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008482:EE_|GVXPR10MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d4b6d9-3824-4852-da69-08df4ad98b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|19092799006|82310400026|7416014|376014|10067099003|56012099006|261026121527099003|261028144727099003|261102123227099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9XnbdmyIa6u2nCIsWlqcc23ItR+8gTE+lBUsOjA4I5lOJMuwqRTY4cgzd8LtztxtygYIm+KTJ2JvLWOEGvRQ7/Zlwgk9y0mfttAxJK+VOO6G95Y3V2+SA/m3bDRkgJJdgxDBK+P+F6eNzBdAsNwARDCwydE/eScc1D9SgOhhkIem20C8KxNhSMQBvI6+Cm4/r0UI2f2mSmhAv6CMR4b5cLICvm8aezRL5DeCLpi9TtMOYJtdlIrKjgpIpiswkixniWb01irL93ad56gMBkaCvEOjVYW8WQAVHaCz/i5y9lw4pZezwjjBb21cpaaWtQZFMg/CID6opMy6SgViv9Xe0C6MKBBSJ5yhd4PNG4Pe0kfIElwyAuNYHu7NOhMjKswyjTFjgO9VCIPdIVvhtGFd50xIoeKvmhpdIIpFlJYVkJuvQsKpJtc3Iv7jYlE7JbmKjUTeKFl5OYK8Le+Pwc4PlZRVM7OYeDvwNkFLtruzCWprsLEn2xPz7P+3wifuQDSheXRO7VIGNG/seZ16WaYmCD0yRi7gRifjqGu8IlZ4tDyyDUsanABn0lsD99HuLcMy8uDE/X/K8vmPME0rYwTE66YJLWAWUHkp/V2imQTq6/qu231YoYWlGMNfcJ+5jPeFoqMfSj2apKmb0drP3p1TdegA3eMZe3Slk9pnBdYhF90rpkpKl93AQ+lhjtXl/J1MElhz/2uyAVK5UwBFA2M2Wg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(19092799006)(82310400026)(7416014)(376014)(10067099003)(56012099006)(261026121527099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AISmGaKRHxc26ROe3yu7AAl98cObNiMUfmBoEzH+PXvexI89GhhgWLttsJYH2HMS3wsgCzto0taNfkcvfppMcZvux8tl/++hmwkRH9byIevecFUjES4yfTg7t5a5BIE3DrPF7DikGOPwmASim/BnqB2csqqlAYbOc05nDJwGLPC3NBVe3DMutl2n2v5By7IvY2FVNcxsD6k1arS7hB5LIItH+EGDFNfzhKljprl3USGLwYB13vq7JjYT1eh3L7T09KzzeucLBC5FGeuWVHgKuMrwB+iMf4iYtreCxPMWiqvQ8hX0yvdoHEwGLsKUeW22RTB2aLM1RCJc6msl6WURxcjZ80vGJeB3LsAn2Ng7br8Ejibh0uioyHaz614ml+R4Q0aEf+olQHGJU6cdEmNYyNa71tHHO3/RWUC5g+EJlnmqCOg88VSwdgroNRkHjgnm
X-OriginatorOrg: bshg.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:50:31.4548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d4b6d9-3824-4852-da69-08df4ad98b68
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9406

From: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>

Add the cap-power-off-card property to the usdhc2 node so the MMC core
can power down the onboard SDIO Wi-Fi module via mmc-pwrseq during
runtime suspend, driver unbind, or card reset instead of leaving
it continuously powered.

Signed-off-by: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..67c4f3e364eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -263,6 +263,7 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	cap-power-off-card;
 	status = "okay";
 
 	brcmf: wifi@1 {
-- 
2.43.0


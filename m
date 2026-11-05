Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846502;
	b=5qBBf64Ed2AF0W3bhEwUsb9wlj2joa26+MHIOZFapzvXb+erFOFV9kyddMYqSot+R5AK
	 ctlPJlBzYxM+Iy5/z9mNgZLqTUCBuMzVtopJZWHh3GjqqVBqhmVTPlLkh46CEM9SlP5XW
	 uvL6zTb8POjgmOwKaulI5rrROECaONqyOsjTo9fmsyyG3iz8EFf3nb6RtC0A3i0ZeyQv7
	 raKWka1NpK/YYnjnu3N2NEcYdRSQvFMT6/1gpSFc04AeVMV7dOYR3sj9NSUcEh95mkbgW
	 4oGgSAEwNP7n/Ojctuzv9HFmg/u9LGrvroee/RzghsCa5C17LUw6czoCzChcNVJx+qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=5/6x4evL3o2c7rBdXBnJxZWvFaWsAZhBZCzSABpAz+s=;
	b=KlVbKLn/WUURG/OPRtP3vQrf6skoNex0Kc8BnrzrqPzWRXqUvI6vk5ndKnZnkuisN3Qj
	 SY6rNct2rIU7vzvgD+N2nA4OKEvdJ+6J7nmXtwom/9aH8npSUQbyiH+tvh51G1R2MEhv+
	 M6upVN55lOf55WGOyCgYjKuZeRiRot2JFsdEvLNYOg8TcLfgw3GGK0QikWKZjafIsh4GD
	 akPuetKIYdEBmZmh09Bs3bgDFflaz+wkkhThe7X+DQPPO1nLOxconE4NZhQHB5q8tLRXs
	 4VuL1PHYi/33Y+80jLppBNyb3DYwvHNIvBmUfo5e335XtAgcegI6Q+TymhP+PhsyfCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ms2p1vT5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.67
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14464606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 02:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14464606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ms2p1vT5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5viuLoOX/00f5HnZcayG3BGgrWA8JV6I4Meh90IcGEJ0KCc57U7mkdNugcPSslZk+dYQqtpJWrxjdnr4dZAPXh64qFr+uQXzFRBxbgbvt9LF3r99YGpOpXZKMH9+mUETlSm5bhrJdUkZ45NfhbMjhukxPNB0qsHoMGmFm1Pj0aUTSLz62IlvKGm2tiohmQ9KE9eThfBqN6yofIuMC2o8fiTWAXC7dxUnU1M2A6hyedkg/x4RBCZgLCJA4gpZrwUqthznlI59pisqHaYJpHwU26273XgpTBWK5suSlxv2RoXFqCTkUr14KMevF8CrhnfY97k7i0ZFleCEG1LfCCfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/6x4evL3o2c7rBdXBnJxZWvFaWsAZhBZCzSABpAz+s=;
 b=jbrxaSiNd3QnRKIksIATPpq3yTinh+uV0oKNTxTZaR2TJeLO33KPHlvmom5cLbUr9gqibBGU1Z6WfHmpMNweodL2lVDtqkZiOVLE6JB8xTH3fI+SWtsL+D560X9yxf/f4t4ib9rci0rkvUTNJ+2pS+btHG9jEEncbbkPg3qWDQva6EF32f6QSSXHdk2carGHuuAncYHTiJcY8IjGpB8AailHnrABAwpNuj0ls5MUEGAMgspsxhAVAmFyvwyoAR6gVK/iOnCnH4uc7p5SZHKZ3dGjCbRPXi3vbjEGhQHYj1poHuma2aXcshpd/4UWxc5ODXOxj84kjVgoY7n5FpnndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/6x4evL3o2c7rBdXBnJxZWvFaWsAZhBZCzSABpAz+s=;
 b=ms2p1vT5JaU0pznzgajis7/LbmgLC9JmjQjPFcDPI8Fyh6A/RjgcmVZTJQojAmRjip886blsjBsWfRt9t4TF2h7WdaD4cP0jf+5jtTUT0QQUEIUw9McH3r09SBhResYKbbXdIudGbLfKGN8pZlYrOUAYEL0fCjNQNx0cfr6OPUWFAJWMBe+B/XBc0ltJY00+BhXfvZjEOlP3vtMbMU6OgCf7qsk7L4tzbtngfEmFdwW75RngG0tpBguQ4fAjFuUk1PpFwDxu/a4e+Ki+t0x3Qc9nMfDTpmR5f6QiBBmhbHWI9y/a70bba8DHDYV3ujOxtzrHAJO7Z7lPwYeR2mfSzQ==
Received: from WA0P291CA0005.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::13) by
 MI7PR10MB528764.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 02:41:38 +0000
Received: from WA1PEPF00009B3E.eurprd05.prod.outlook.com
 (2603:10a6:1d0:1:cafe::a9) by WA0P291CA0005.outlook.office365.com
 (2603:10a6:1d0:1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:41:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3E.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:41:37 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:37 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:33 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:15 +0800
Subject: [PATCH v2 1/8] dt-bindings: arm: fsl: Add BSH SMM-M2B board
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-add-bsh-smm-m2-v2-1-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=2VBI52WSa0j57vCZIO+pXkJJoxv8Lw3OMFYgT/cSDCo=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7lxJ2zHmuUx8VpGRUEKL/jaTs7fle3EsCq7616CV
 2tryrHNHaUsDGJcDLJiiiyqCd5nJa8GmE6bWQ03h5UJZAgDF6cATMTenJFh3mqrPkE/W2Uu27fq
 adc+rM/p1nBaU96wVEY8fO0G1RvRjAwf/67Ywa0yw3zr1kWvzT6Wmt+6ut/3Ub5c2e/KR/q91jx
 sAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3E:EE_|MI7PR10MB528764:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5802fe-c1c5-4f55-f36c-08df3ae6508c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|7416014|376014|261028144727099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|56012099006|5023799004|11063799006|261021121427099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Nyl0SLMKG/m08Vz1H89hgiUJ/iEjezSsIPEXvJUj0Sf/E+PPKDP4+8ueEOJKw5lhxZT3KQrjaAV4jI+xY371hDKO1F/MNxsFOpHdEAcrEyJvwN0a4+jFCDxpOpIIQsaHSROvVB9SlwzszAdVrT3aPeSWkqCa9hfkmJorKXT9KdtM6z9IkOAiRzf9hA5qj80hDJp9xH8LBvuCJAC+VBUWx8IwlcZLTAAXb0RKu80qc5xeBOhJOKNXbWgPExGNG8TpJdbhpFSIMWiHs2cV2LwV9wmAdsHNfHZE0wIp7PymnBFhWndW1BoGlRSgEFRnLjXByDxKo2elwYUNoXx97FYZ3nRXwfPeAVM59D6df2+BeNnDC5uQJXevXOKxJoprxsMpgmsFyZeVZUHX5OGf4pSg27lbpEhuzCIEa/yz7GJcJ5nLcJJyhYqU3gf4VR+aJQ3e7CbItnVnXsOaKXl+ZOxov2W4xgP0+1mRwsyT1w8wiI599ELJ91s6w/vPjp+gZkt3VIeMQ+s+bvk9nlncdyuTtOlMs2ll8jSxvq1gF1lMDYOTSYT4tcHYY24iV7DbfKZW9p/hV89AEeDYObQsYXvAdcLqv66xMtK+MXMDLotfZ0a1HCDkwHqjvNoXxR5BINl5lQL8+XdqZ0dcuknQPHXo6ebN8q8YsaS7/oMuTHfZwmcgTKc2lo8DAlt5jIitw27cWHZAQfAbF9sGc7DLdIHXfw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(376014)(261028144727099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(56012099006)(5023799004)(11063799006)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i9F0RHLufUH52Lzg5qCOxlusj7u6jXeRJsr5/r2AYLjdz9Cl0as9n0kq+PJzuTv65jg2p9i5HcLoDRmikr5oCaKOoNa/msOuQLlSMmhp0uy3phYfZgxA1Tdn/sk+S3aOPvEf8go1GT3T39eX4sgDtY2jk5Ndg7kQPJRL91IDhTldRfZ1ZeitceRb6XGkVDbAnMhLzdl5WEykl62zk1BTe9y5fyvFdCgGqr10whtNdby3+JCP0PWc+HwcssT6CAG1B8sUmdu2djQlSGpe7WUBTswrfUPh/D2Ez43wiiCfDm8NGfF4ZWBv8Xn74XSULZud3/Sa7bb/uDR9ClPqV2rONYAMoSHhTDVv4npniBomvX97kv6AVOFu5RcKDGBSGJcEH9xfEAhmo3QQdKsr/kJe6t9RwqGOFOWAFfT0ErqgaunHI+xIdnWEA1q36UmFVPIo
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:41:37.7196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5802fe-c1c5-4f55-f36c-08df3ae6508c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR10MB528764

Add the BSH SMM-M2B SystemMaster to the list of supported
i.MX6ULZ-based boards.

The SMM-M2B is a variant of the BSH SMM-M2 SystemMaster
equipped with an AIC Wi-Fi and Bluetooth chip.

Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f044e9aa04fa..9c86900dec4c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -867,6 +867,7 @@ properties:
         items:
           - enum:
               - bsh,imx6ulz-bsh-smm-m2    # i.MX6 ULZ BSH SystemMaster
+              - bsh,imx6ulz-bsh-smm-m2b   # i.MX6 ULZ BSH SystemMaster
               - fsl,imx6ulz-14x14-evk     # i.MX6 ULZ 14x14 EVK Board
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz

-- 
2.43.0


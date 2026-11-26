Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705502;
	b=j14KEWLyFQofPD8tnHiaDipNzg0589qVd/9hwgDJREpxygeMxWRNoFPrgjbyXWQFgHvG
	 cl1yFyCbmTSxJZao/nv4EfqN2FV8Rw0ZIpayPwbYK54YFPmdcRsdQCvLU/Rvj70e/FHvd
	 3xWCZ1CMy268lEoHgqUbBfVM9dOqssfZ5eqrr7r910t3DMZ6acJqIsHoi17NNcPSBGdkc
	 SrVzvBCfDwF58y56nBkQGhskyWqoIdkpmngUxg7VD3F2PdZLkDUGXXeZSNyuMAHLncdw4
	 6I3C5tuRzHrfj+hoFdh+b1YyXLrgQ6ns93xCJdo2c1fSp6pk4uxR57gp8XWQ58QznWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=uLZnYGL4VRxRv9A16dd7c2EGzwCgFOCuOvu32IGKyGs=;
	b=fv1rjJ9U+uF0n2Qdju4kI36V/jaQBiQnsr4L05T5IyHMdmM8R6bYdDXLmCNBMP4zljeC
	 znhxmAQ7yqQWWcY7WgD/QNXmAsjwxBw30dpp0tTCbYAyMBufLuKk8RWX4O7OGDxqP5Z0J
	 e7e3WRhPA2MDUcrmDI62bDGiX+oA5ok9CajcJeQHfhlle40e86PUB/v3+gdudDQTQqOz9
	 RvnT3u5FTgCfOM9g/EngoZOZbtQ9fdijaB5ThDGX2LP/DJPzWelWm0/MRVz4VWF0/HVIr
	 FJcIhIh3W0my++AIaUKIjPaYqWDBiBUXRDOYXDN/XqO+GrIb5RQx8Oxis0vmHtpqGGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=UiOHr3ii;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.139
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021139.outbound.protection.outlook.com [40.107.130.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D4606A32C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=UiOHr3ii
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9v5IGainzqlJ7kOSIrVgglOwxvqK2JcDqmwfAh1rYL0cIhVhuH2P0RAPpO1Xz68drSm0xV5MiGsPxAtWxjpVA2+cppaInFE6r51glidECp0+98ZHtXH3C24HEEytkz+T6S9KmNJeFyYkYYaU06Jx+1TBFnNfHIqnPybmwfjZc4weGxf22bKmXhmWNca9jiSL2MX6B4nuEcKSOP4KWdnjGXgiwu6bT6I4SZZ/cKudaHtnJk8Eky6eqlYVP+qLZZA0Befjm9/uh21Rd6sU8xncf8xzcRyteQZMTNEpyELXiRz84pbp1akEqEC69IYtszOyc+vDZjjae+Mpwu6dBtx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLZnYGL4VRxRv9A16dd7c2EGzwCgFOCuOvu32IGKyGs=;
 b=I6odNnWkURwihkMg5B5rl83M5KK1TGL2K+D8rKZEUxxhTx5Ptr94JIvfjHEoZ7IahRaHj1qxwFo/7P5lL4hqZR0QZ0/qQM8lrRJPh4FdesEZ+Hw9P9U6CciPhdFtVqWGJXjPsYSzyqluY9P8ZxpmAD0s9SvmvqDO8BkMAJQzz0pN4V4KB+76z0Opi4pkSCzzQqwJfgQIwvbFf1NMalhyGyLEQhb8XPkWfbV2tvBfpTuVFR9NlcVc0gyBqWWGlY1/NLXw0xr0PLa0q5z6zovQ23zu9Pkd89jufekJ1XutYdxqyTiUrkzTs8YMOtCx6xjBLp/KUmzFhAE9Y7nzIl7A8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLZnYGL4VRxRv9A16dd7c2EGzwCgFOCuOvu32IGKyGs=;
 b=UiOHr3iiDsMq6unjZwNHpRuyB4Y4UQImZa8vIPQcTbQ+8YYMS9GLgeggKsakutOlSzaV+t5VvNA0lOKGZf1DAu7jRy7asdcGCqpt7DEv+eAJRzGE/w4wqnRUcrJV4Esa4Hmr3wYR6LhfQ4C9QeVBcDZzQIlfNQwpWJq+G4PEf3I0feCO/MrojsINICpinMm3nXfuWXVEl82Bf5W00bgWK7cEhd/anQ921nF/l9evkIcHbUaCPXVEeDOcLRFFZrfsD0GZuIpPp1QndpsTVmXF30a3/AdqKoTHegTfmG2IOLbQJQGP0NKRYU6r0u1z1xMRKoGaFOMpL76TaPAnJT0Mow==
Received: from DU2P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::24)
 by AMBP195MB532405.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:7b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:04:57 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::56) by DU2P250CA0019.outlook.office365.com
 (2603:10a6:10:231::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:04:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 15:04:56 +0000
Received: from [172.25.51.48] (172.25.51.48) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 16:04:55 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Thu, 26 Nov 2026 16:04:52 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra
 RDK
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
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-1-a2bda009bac8@phytec.de>
References: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
In-Reply-To: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=1121;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=Q38FYiJhuLQTH0X7DO++nMMSoqBnE9MrEdJELzp6J68=;
 b=lZsMnGJs+3gtyxlI2EentNKUwf2F233lzedQ2gs5mjnv9dkFo2YbEJGnxgIZbCT4T5Q6KbnzT
 aPDY0iDiIyhAJOIiahQR5MnLh7mevs/RsUJIr/kyMmJjW7eMtJf/jTc
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AMBP195MB532405:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ed4f51-ff5d-4f21-9226-08df4bcea279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|22082099003|261009223027099003|18002099003|11063799006|10067099003|56012099006|261022075727099003|261026121527099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	7QTMWbzmjixUDb6oxrBI3x5CpxrRRJhDnVgg1IeY7iwEXwWoFqZ3ClGwFirNv+buJQs1rpcSjqQhKc2yWXzhRmBhCvK3WS9bzZdRIPBxCT0pVDNbvprHfjy8oAvRcSUe/e1Xk+kfS10HvhlOxFWDx59Wnmi3OtgLR2RLVTNVF4Mt+/U6Q8Ln7OrsjvYnqrY+Jy3lAOqAcXrjxb9E10u2HOuYQzKGf7YohuPnY+tR+bkvdWUhzwEFwWWRo4HEtVqnxWAkOKKX5J1igBs75u1gcXcIQ3bWA7L08NjrKHkTmw8EYxPGmMg+cPHSC4ft3y9n2UEWVOtLE6w10qGbVwEwf6MNBnzime9b0Gn5rJGXAHcgsCzHRwmyy3+6B3kLlfU3TrwBSIgbA3iqHEVvFbkfQOOvkYrXfO/lBiMBezIja1EmvuACcd3JSGHoAKPuAoAYmrMMR8yO/7OpFhqFK69Csnd/slAdfvH6QQyT8h1R1x6Mt4DeIpcTr+zqVFZcQkImnI7WJNI0X0ioQAoGAATSOiE4O+IrhWOF1BKEmuVqhM39dvhDcsY7lw67IPUon7cSpbGSJaghDp2waIZIXntGplQVC3mwVhZGpyQrFZgbM3ydeLBdtGH9wgqBuKMVSJ5EDldTx6VsfJar5mMhHjMrWBPdCV8z1CoYFDzH2CJJCAeKLvaby53rIcxVywM5LrLcv13bdMW1MWyPzGh26krpow==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(22082099003)(261009223027099003)(18002099003)(11063799006)(10067099003)(56012099006)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TFIgPbP/lWzsf6AH7HQ231pJfL/VoA+9NpQAW/cPfcnfA8mXSJHtUBCATvXSDPiEN7756ke2dlhK3Z1bf5oiaYHNMbyRal1EFkpyJqdvqEM0SIWBtJ195gLIhHMrY1xkj+JxAfob76BUrX4r8Egc0iZsjsGIFUmvtLPD4LMPIla4AvtzVuIVMgpLVURsC+Vl5PiGvGmpgKBM7aHh6H72+BogSQ2pVcTk1qtExFamYsjapae6af1lkQ9pLy5Q3XCDuGAvlqZbPCMvPGlM3mQR+22gIEuumtsC/ToHcCgwUqwmHqS9PZPbzo8iRVJJBda1cTUCAFdudfFngBWSCKQ4DOYruh5RDgeN6Ji6+cGBU0Oan1Ff43PpzwuB+WWkEJMNQnnBBwwXHzoamyZAt1Y0slCZYJ0Dq/SoZtAGwUu7/X2YDnWIpqUmlCJp/aJ2IVMP
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:04:56.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ed4f51-ff5d-4f21-9226-08df4bcea279
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB532405

Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK and
phyFLEX-i.MX 95 FPSC Gamma SoM.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..43b1ff8d25cb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1551,6 +1551,13 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
+        items:
+          - enum:
+              - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra RDK
+          - const: phytec,imx95-phyflex-fpsc-g  # phyFLEX-i.MX 95 FPSC-Gamma
+          - const: fsl,imx95
+
       - description: Toradex Boards with Aquila iMX95 Modules
         items:
           - enum:

-- 
2.53.0


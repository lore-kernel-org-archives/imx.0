Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.89
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705508;
	b=NrTqlQXbti0hbkkxkWTJZbYNtyKQXivYCmE9JaIhBmh6+fAvsXNgtIXnP9xTApE+Iat0
	 j9XledBeyknvPD/4OXQ5skqCE/SPvvBjj2yhYwo6yLgwf+NrS8G0dWwfro5sWrcwBJ17t
	 xCmm4c0Zh8z7WTVSAFVkBO/Qr5wJSJ8am6jO91Hn/K49+0lIurqEEsmm8wj8hfsXBuCd0
	 8YvgTiHLrztxw3JsF0N5ULb//uQokaCOLdXAlGr9wyTf+O8AQ6OmdUvHqbWn+GqPyvU+f
	 Zf0EZLTw9UeB33NCHJH2cZdvK47baLWy78RTzwl2axg9cvpUe7fd61oPkSssibW5a6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705508;
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
	bh=cRQ/lEJZmpQB34jCt9MglWXycU37EKjiM2mCmv8RwJ8=;
	b=ib8eJrALAtPsu5eivPBzlnk31c7qjQ18kkql1JgRAIGH3hUDM95gFIUFK/8rO8x8HxPn
	 hcJsZOXKG2f0bJjvbPAIE6uMGT3VB1DHsXeSLSeHz+mZEbwnVgZFL3y1IIHZAftvELDOO
	 +VplLr2RkbzpJ/OAcdGQgZ4lwcNqndVAT+MBG9FYDNzvhWRS3iIBT/9iFcXkpYH+PF8SA
	 qQUGih6It+X49GDxXCIbM2fDvFbDPWc84aI1a5jXC//9TfYTRjAbNp4Qx7sOJAAWxsDQe
	 dljmUWuOReklFLr5DI4oqDjeWDVwMoS8URumRv6WVKbW+kvJPRFq2Q0b5Fv754FiBdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=ggQcpuqO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.89
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021089.outbound.protection.outlook.com [52.101.65.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189C606A331
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B189C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=ggQcpuqO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psoNb8MVORTy8cHxeKetrYKby4yTeY0fh2GVagXWKJgTyWpCYjYYbKlOyOq1mozuilWNEqywkdi6+qnYqV/llNNHWHRpHcgNdbwslhxMAiBKdX+fyOCVZLnLRX31TOsMSaApc8vzrM84wixtuP06TBwX8nPJMOPA++yU8N9zzERMKUBSCxrP2rq+FD3iSyUxnOiWJEJB54uYxQefDsd5pyOIdMRYCQfh4TlvcIERDKYKPZNJQJ6MAI0qdSCAWoe6tY+nmDXZkv/0Xo/UyzWccHPXWqC/48P3Gv9URVRwEfcWbMCykdPLBRGuohpR6awu8DleiPQ/fOE+1WnlcDFW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRQ/lEJZmpQB34jCt9MglWXycU37EKjiM2mCmv8RwJ8=;
 b=IqYcGTVIe6HnV7G1/pALnuzQrYPHl4AmKU4NQYEWyQ51xbaYGGG+oF8vRzJHhyqJj6Bp4QPdvhUvX0StXlMUntKlURXrpJYMAAceQRQUH7cdLJ2YGquNwtCuEu7cnUAA07xD05GCrfH+CUoUNnRC6rMkAlmAAji9GOxLc8E6+3opIfBW/JkIMotx3vJrfvdBmP83W3D5rEa6/FQ9ChWasQ2p78snBx23fjDtUMcUkCqPPj4GOetdDO6RJlCRF2EjDmWBi0FkkSPc131MQwsQsOMFQbuel5kD2TiYmFeNhsraQnJieRx19E95nv421K6R3UHlTto2SMIbL+WhsAyNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRQ/lEJZmpQB34jCt9MglWXycU37EKjiM2mCmv8RwJ8=;
 b=ggQcpuqOdi3J2bHE8hX2O2qwsKjxQnGbxxpQ6fSjM/yiICq59EI0Ip+gKFa/1SVbFnXwsSZGYVi2SwxVoBdEwaoH8/mBwLnm3H75wthEo7+kSd+1TirSpZkUHCVoW+SVJfYVKHsSZ5pe/oQs+NsEOuMWmOUIF/S3Od6P7DbWc51UxJn8dI1eN2vrKZ1GDEKsi1Y3tMX8SRXbrlmmOJpvkVJz5AC9PJ08+usd2w3ZT2lAUdKcGXKsDcUdF/6OeBXGhh9WpoNd3/pxPZV6Hn8rcXozM9mzsGjohfd/itixEtmWJBPkPbyQ3zPxW/49UWgofDx8tQ9wOgKO04eywzjiIg==
Received: from DU2P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::7) by
 DB9P195MB1195.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:269::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Thu, 26 Nov 2026 15:05:01 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::8c) by DU2P250CA0002.outlook.office365.com
 (2603:10a6:10:231::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:05:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 15:05:01 +0000
Received: from [172.25.51.48] (172.25.51.48) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 16:04:56 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Thu, 26 Nov 2026 16:04:57 +0100
Subject: [PATCH v3 6/6] dt-bindings: arm: fsl: remove outdated PHYTEC
 i.MX95 FPSC
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
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-6-a2bda009bac8@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=1627;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=8TWNyiXfrxwS1pB/BK3dA5FEbHisFPtNI9fn6Rhufxs=;
 b=Zq3ehCXdsS4SLpsTCqwrKOHvPl4xd71YUTDYqFVAOvSuNusy7qjlS6FrzFCY4kKB4Gmx0OjEn
 Cc4Uo9/sWkdAw3HAP2HNG/b6pd9536e/wkQvHzPe+OkGhOuwQIhF1CW
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|DB9P195MB1195:EE_
X-MS-Office365-Filtering-Correlation-Id: 0634cba0-9b95-45c9-4e5d-08df4bcea515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|36860700016|82310400026|10067099003|261026121527099003|11063799006|56012099006|261021123027099003|261102123227099003|261021121427099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	M41NHLI8hewt9vGZSFX4mpu89OnJIyQLswI16gIOnRS36ATo+icm1ahlkgiel7fvXJ3Imlv6rcN6BCFFttPOcViF1TEk1xsWswnaOrdAGoDonUyb0M6qlwRolYb+aUBZdr2ZcHvV+Jg1eS2H5mDnhnTlICquKj/ldOXgYKL7HzU6mzNFCeTqQZYq96L1LfkpNSxqs3mDeRyCokf0b5YFL40pDaIskmccjmqWkEENGN86kPv1ngNGsMDIXYqRYbuU8Xzt9szhke06FSDwJKUIWHvCm2B+q8iaeljX9UJ+Go8B/k3CzEZy1rSKYTVUgaiVw7tw8Dh5MhETv0LCyAq4ov6ieojsBaoMFsKsugiczVgyFixtTijE6Zr8XfAelxhpwiRDsP9B6bXFHXtd5ZUvDOPR/ml5GQ+smQKl5L6ykPxwMjgLHYsb2AUC+6cgbdsjdC8lROAH8ez1/Sjv5BhdzEjYFDqu0o071FdVYS7JOF10bboE4TS5pJSQDJV7D5oeMMxVg8BN55lz21rjTRm4+im2oGFFzL1dcGKX2LLsOAzNGPFqbziQZgEcTKcNp7PXdAZfc94PUjZEBm+AzfsBMf74wl2eBZVMvenZMyU5tzqVHuiJ8qTeHhLzDHMuR1MPE4K0IWhXZCefzC0r9II0/yYfp+qqARStMPsujENWv+ZNhXOWdGLyNR/1tcSKCmDwFqEAUEKele8cOVmGrQU7QA==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(261026121527099003)(11063799006)(56012099006)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ziaA7bNlnJr/0T5GXFD8KDhiV9yVVTZ0DL99BB45ilT8v+Nox+aK0mB+3nN0iv0ClSZIPIwPwiRcK2pECPOofq6KU9z75Yf7neyTYdAilYSTMjjhMUAKebrq3z0d4wudkh5vO0/TuGBJwqRe/35yI+yFLbzPLI2lP87OOCQOjNZeCKSwlOF1NsV4qsS5DgtGkstXBdP9wBfeZumd64UU8STCgbSGIjWmfM8Eco2UAYl/mdfNsxCfhGuhVlv2TcNhmKbVUe+xptJF/sud7U2bslb99S3Pn2NCLNTRZDGpsdpbmstBDsPX+Dy8bZccJ7+jdOEWM7atRRO1UMXQbnleZPtd5B539z+p2+BSKrODHRYlejxAtnm3ABu+pUYH56XwDYSDDJDLPnAoTD51hqpviildP4dOV1RS05XnYjv+AKHFyK/VgrQnP8XbsBELUFIz
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:05:01.2252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0634cba0-9b95-45c9-4e5d-08df4bcea515
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1195

Remove the "phytec,imx95-libra-rdk-fpsc" and "phytec,imx95-phycore-fpsc"
compatibles from the fsl.yaml schema. They were used only by the Alpha
hardware version of the Libra RDK (1618.0) and phyCORE-i.MX 95 FPSC SoM
(1620.1) built on i.MX95 silicon revision A1. That hardware is EOL and
it is superseded by the phyFLEX-i.MX 95 Libra RDK (1618.2) and the
phyFLEX-i.MX 95 FPSC-Gamma SoM (1620.3), which use the
"phytec,imx95-phyflex-libra-rdk" and "phytec,imx95-phyflex-fpsc-g"
compatibles.

The corresponding devicetree sources are removed in the preceding
"dts: imx95-libra-rdk-fpsc: remove devicetree for old Libra" commit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 43b1ff8d25cb..f387cf42b906 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1544,13 +1544,6 @@ properties:
               - fsl,imx952-evk            # i.MX952 EVK Board
           - const: fsl,imx952
 
-      - description: PHYTEC i.MX 95 FPSC based Boards
-        items:
-          - enum:
-              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
-          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
-          - const: fsl,imx95
-
       - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
         items:
           - enum:

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793849081;
	b=buC1uh6F9K/mch2cKtslxvaxf7qHZAkJmfgGLrWEVlQ4ByPfv/BMy8bXrhALTY9VFP9y
	 XKRhcz6YMxqnI7YO9wfIDJN11EJ4n4ZzJKyBX9fiOlHjI87uxvsze3KK8UmvqON2AFHpl
	 6VoSFNeve6z92mQezjLDCgfyeOw5vrs8YapjGbJWY/BXHCfvYZDKBpan2cS3Fa5bPcbv0
	 nh7Y5lJT5OvWytVA2CrZo4RchWl4rGBNSVJUx5thgOeH0eKLUSH8s94BUarsktWJYtT6s
	 f/WCPNqXEIrd1Oog1CIFlqMGS3cj1y8F7hCvfI79htnA3Xra6Ulw/tNVMd5IIvpJODg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849081;
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
	bh=ZQHF49bmXiodU8u8QEmWZAB26Zh9ZepSeZCsUo5Hr4Q=;
	b=SupHyvIcnbgMYCkhP3DWumJ7wVY4RoUQGFQMR9OAzocGJd8xavDfDTW2M0IFhZ6+j/3N
	 J5N7Rh5Hb2BBAspoEtndbaZJNREl9OMfVY/pBZs6MseTMY5QZ46MVggJ7dDRcmdrZn0Ax
	 OyYUQKZSO03KbRWlfRFNMV/P2JwxVbNmLJzEbVCIxxu3t0+iIxWwMP+at5jp2dDNvaAuz
	 v2SRuQylRtI1g7prC0pXFY6b/GsAjBh0UhiFtfMeoQFn2Fxp4NsFkpLenobEkiDhvjgR2
	 fyHA8XRbzUCmXEALnBllCkCawq0jSvb11X6Fx6Nid9e1kB64OgUnGivhWKrLbgMzY9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=EullNERQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.68
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466CE606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 03:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=EullNERQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZUTUgoFSlWTxWbGGM7UARBPYSUvzBvm3vFbdacoxE+lRiO1IbolkrfIyLlUK8mqT6qIXQDp751xyTXVEfPU11DY1gVXIEyXMhN/BBWl7Dq0bq/TENIDYcgQtzddlSNXfZJx5T8Ale9XyDlovBDRRJ+eESGtNbTnWVBWyaSghSQkIpatdm6g7jXaBpIUrQCMMBveZBoEogTk5iJgsYOspRfBpSpELaAwTYEfaKyMPfBioEJ2m+aNYJK5pzKt0LdkbqIZV3G+UxyP+7p4ZPi3B+LAL23XdjoSFGciaLlQueTDUkP2TFKyGZcakt8LFbmOwg3aq5dUSx7TdrGhLvezJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQHF49bmXiodU8u8QEmWZAB26Zh9ZepSeZCsUo5Hr4Q=;
 b=vLZmGPD7xeJtRry+Ma5gPUq353jaD0Lz2hbfq1m7XoA6Knt7oZ5hH1OYxrbd8rhkmt1ohAjyV+elyxR9/095E7QI0nbfNBaRwD0LNDm8oQrePS6u87KG7srxstokqPA5knE6N5ssusDfxsta79SwfqvpU2wrIrDUwcjEBlTe/qsIo8gyxSzgO2k9H8o3+Rs3Cy/5RgXbAiIyFPDawGFOTYqU/SewVAjpsrmVv1z220PQcx95kq6Ovw9KxLR/iGVu8jvnbTU9qaGG6Dg8TwINR43ViWWX8ih5uVAYCna2iQa7M9xp/A1QK21MfVjIIUbMxFXIBwP3PcCwa2RqhrHOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQHF49bmXiodU8u8QEmWZAB26Zh9ZepSeZCsUo5Hr4Q=;
 b=EullNERQfZgGASHZ9g1AquBvaWWFfflpzygWmqa2od8XJlKeG5HAJKLxWotWFUmPEWdxt4aYBJwE+Fhl07EF3kOOXDwkT2lvyK5mnYnts662s0qIOQGfr8Fz3HgSCU3h9f29jGHG6V5q3hGks8cWeS6a3nGWFUqYFeYjlvdYquMRem+8+ndqvSKhoBRXLoLkIrO7dV7mK3uac3NDk+DQcuVZXcixvHpEOJC7PtA9lwnm2H52sTtQ/XtL9d3gOEvHQcIxCWXKa4r7o7i+41SEYxnGUYTirT8wT2E9j6zWWzW0ejOhpKqWlyFKc7iF2/K4tVqo2z/Lm6uZfrydoXWWHQ==
Received: from PAZP264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::18)
 by MI9PR10MB992209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:8a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 03:24:37 +0000
Received: from MAD0EPF000008B1.eurprd04.prod.outlook.com
 (2603:10a6:102:1f9:cafe::10) by PAZP264CA0158.outlook.office365.com
 (2603:10a6:102:1f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 03:24:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008B1.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 03:24:37 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 04:24:36 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 04:24:34 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
To: <sashiko-bot@kernel.org>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <Frank.Li@kernel.org>
Subject: Re: [PATCH v2 2/8] dts: imx: Use minimum NAND ECC strength on BSH boards
Date: Thu, 5 Nov 2026 11:23:25 +0800
Message-ID: <20261105032325.132423-1-Haoning.CHENG@cn.bosch.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-198484@kernel.org>
References: <sashiko-outbox-198484@kernel.org>
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B1:EE_|MI9PR10MB992209:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8cecd5-104c-4f61-b771-08df3aec51f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	6F1I3hzEkp2K3xSAdMx3DVRWcwuWtDQFngLvvnyMgY1hCn5/Zbm8To4fn28i19ltA6Q9NMy+iAg6dj89TaXrlVL4nBldpeht/lQt6T8UINabEBoprkcRs/ZkkWA54sTLQqEWYBHYlmwcwnz2a2+I/eikTgExRKs+uFzwND3WaCus8ze5jCY3gRaeeuxQGGB5yBJJF/DNjOuZVsDxMykgzVEsGa0TgR0WDMPmPoZIoUhcA/pIcjXZKuYFq5CQVZOts2LxYQQX5kmuaOfIhJJN4nRRTluq+XZn4AdaR9/Fi6XTvjTFy63wIga+sH3qyao7+LdnZrOuSbG2WZgxjp2WPPhWUAOX6ehx2cjlaaWL7vwSJ95583oTKdeWVe8CqapBUhoCwR3gro8TLuSYDV1x+hbmy3u4xrwqhXGRGnOHeqFbcfI3K4++1P2tivfp3pGX1AtdKScQa2D/i/DR7XqE6kPtr/Z4uaIk0iPr5Yjsf5RVIfG0sMAsJhZHulQPAxmVEyx4U+tDObTPbq4ANhxHHVzrJ8GkIFedKd19iBuC6V9WtuF/xpEKwKZ/pCG/N9B0VkagFUGEpYL089T/uhTe2QRK2YHH9VWH6Z6orkfli/VWJU4NKC9fMnkxv5iOKSXFHDnbGXcYVNRfJhfvOPcyvzI1x+FOXvWtK1vyuDWbZF1SrgyLSl9AXVdOmU7fj9UHw11gZeqV4iTPE2rAHlkHGA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bth+sMEJICc1QBzPK7Re15mQBuR5PUb8BrO+72ZY/yha8Ln4ad7vSbpDpSxKEdwHAUOT80RPYFdRm41LB/IzHjpUOWSzQCgZyRRTdKQgu1Ms5dzNe98zBfWFEaU7RIeFb5vX6oSyctoKQ+tQktBmBEGnjJgsEuE+DfsSP7FSGc4I1hZccDxYu1VRYxxJ9XI5I7ONWU9u0Pc5Y57f9dRyXFa/3PIXTP3GCXeCwApwb0A8b0u/JJ4P36xPzPLC2bOTHPs8Eop2mnDPMcm/AwFbWtOiX23OwmE3GUPwhWLZPYWQMj6Um3jjr1Pc0C9SxDoiWvbuVCjqwK0rVYMbhn2vq0WW6REPGnsB+yv7a4qx3BKkw3Bhukx5FRUtnLoMTQoJgtYGlJfMEERlZf5qr1pDe3pvcw/FOO1zrGzNvxvEpxko+yzJtIbA68RjK1Qs10LY
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:24:37.0337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8cecd5-104c-4f61-b771-08df3aec51f0
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR10MB992209

Thank you for pointing this out.

The downstream kernels for both BSH SMM-M2 and SMM-S2 have always used minimum ECC. We have confirmed that the existing U-Boot and NAND flashing tools use the same ECC geometry.

No deployed devices use the legacy ECC layout selected by mainline, and firmware flashing involves erasing and rewriting the entire NAND.

Therefore, this change aligns mainline with the existing downstream configuration without affecting deployed devices.

We will clarify this in the commit message in v3.

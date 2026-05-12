Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021136.outbound.protection.outlook.com [40.107.130.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46423C7691
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.136
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596775; cv=fail; b=H6YyfU1j0WU0wWYGgfdnkYoFTFgzfZKhAKg0tRgYjnFEqOLjLK21YOYlHyTg67w4tkjVgUrS6AU0SUDSy/4WNGQ1lh4i2HyZ+3uMhSBtSi9uZmimFL4+ooerSY2qRkrG3MUsiCsMpUhIMoxUNcVa6Jr2fE1X2/y3zvKIIoDtltI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596775; c=relaxed/simple;
	bh=8Li+c4xVQPNlJZfWcSCplSPzGEbgJZaR1KkIav3u/O8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mR9emPWx159Qd2qwR6B1nGGftbObbgn+kP9x+BsfQRLv/Mwi0TvI4jHmVBli0EreDxGq2G2lO6Xx4HZznIA/KTs5Lz4lsUfOXAnQe+T5GNmPRb23Nt4Qwc3Hw61K1azETuu0jdWkO27fYMXf+64TeIu1i6X6C2q3fldTAnNMuG4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=oa8kndYS; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=oa8kndYS; arc=fail smtp.client-ip=40.107.130.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="oa8kndYS";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="oa8kndYS"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F4s4+hkOFsbGFnzGJIe1Ypi6DTLXYfD/BNxCNAE6UJ3syFVe3XxjGg8pCrMdlM6HXoEJz6f4Ys7D0mgCebcuQYM2RpAZp1ENRonLz5gfCdflHl9NOAa4GI7C+A+7QFnTm5JtWtB+OSfdSGw8JFlpKGcIzg2+coJriQjBsrgs4IjICmi6pslvN1Ksx7p0xUpIYpcyiYy8CWOZ3U887On1o2stxpH+g9lBpG7muEJY+Qbum+1o3wFqQM1SP7stjskIeQk7U68M3aGHR3ycXlyE2g/H2hpR7h1piExm7cUjtaluNBvUXNJh/MP6iiUxIyFg4QImNXxQxyqYCtl5xNCqKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=X2pya0lh+ROyhwW0jPaJroMMv03rFlDdl83W1w8bf0FqgUO6AfDgxena3bU8KYI93ojMQJwsvPG4HpGzohVTZpqYXJLJoFmkvJugpR5lJGC+4f2xjj6knIweUuGxGkKZA7gQGRnx2USosdBUXYTInuthjsXH+A+VHxBhNFWn+0pDFlCa7rq3BB7O3/wueG/s8PdaT/GT56OW7dACLpTwifnE7mYsxiJ2jcjDOVECtKzYbyUrYYE+NrltZ4CV4qxJipELDu3G/q+pV2jbH6owmw/7xmjaisHR83oO2x060vOEgH+tXHtg9OxAL99nX2/tAKMJ6i1R814yeUMg5oeVww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=oa8kndYSbr7APtKU8PeSs3p3zqyycZiDvAVl+9qjgTC6RlnoMsnQSTg9q7zeaAU0YFv1jq6kIwX7EEj1zHzLlaEabNCCTnr9mq9O8ROfPoyGFcKMe8/xhv0gBmtC2f3siU3SbqL0hqNiNWb53nOX1lMdT8E5xNk0h97DaMZrtDeX0nME8fMWNiEAwBHT/y4keXLMNoVNT6Wi35czpmgZHX7Q0rjuH7u3kp9/F5mZw2cKXHz35SqIs4QKktU61JXeAvjBzapeC3FE4wFEFjLUNsd5renLg81Q0DJB/aopzV+ZQ0TRws/VNdfIm7/CK/sxBaDt8wgbgT46+tgYvE9AGg==
Received: from CWLP265CA0394.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::14)
 by VI1PR04MB10076.eurprd04.prod.outlook.com (2603:10a6:800:1e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:27 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::4f) by CWLP265CA0394.outlook.office365.com
 (2603:10a6:400:1d6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:26 +0000
Received: from emails-8077701-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B1C597FCDC;
	Tue, 12 May 2026 14:39:26 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:12 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogZIWZNo+5oUdfNfhfEnvVIfhobJky0jUvS7RYfr79Nv+VJQZ+v8VxbmIUHNtO0a7muWgAIAnRCl1zgh65v/QU8mAIcBXnwX+HTWUV3cfhLksA6nOXte3iJ6KPHTwCBBlR7DxduKDtQqrg4UiGf/WGMWhnHqu5Jth6JSvetezVtCOiTTdg422faFHIvATte8bNulGZtSUc7bY/bs/LNDa/DQtL3hH/ZXIj5O2M40MTY0J+rMKf8v3QC/YeyBe7I6Y7H04XkDasavil/D4GD6d9H6gHmwXWtek2Juf9C3ei83vrXT8xdTP2oEUPe2ko79mJmCvDrVEfDb2HBdyoynVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=C4Vpl9KhK/CxtWlguaXkYvwYyoo3HjM+xocUqsK2LazAS5YCN1x3ieX1fcZs/pcY/4Ese9hoyhiuFGStU7U8YwTi/6Ne3aNlPNJzG6KzagJVvmnC49xLWw7Do+Eo2nOlSy3ZcprhIO4n42UPc1JpIMfInpv1LnmL0mvD4IiilV/QcBQ0RqP/9RU9PzyqomLrduWh1LeoB9YiIyX2nd4qSV8XDJT9DckQK/9gL1vIEJ27XLaSnL9HLikz67bVDMV5yA/03oS/FqRrO8LcS/KFI/y5276k1ay3sykBvkJQjgQLtbaCwpAPQxo7wQWemsJUegp6zBtlE8gMQUElKYixFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=oa8kndYSbr7APtKU8PeSs3p3zqyycZiDvAVl+9qjgTC6RlnoMsnQSTg9q7zeaAU0YFv1jq6kIwX7EEj1zHzLlaEabNCCTnr9mq9O8ROfPoyGFcKMe8/xhv0gBmtC2f3siU3SbqL0hqNiNWb53nOX1lMdT8E5xNk0h97DaMZrtDeX0nME8fMWNiEAwBHT/y4keXLMNoVNT6Wi35czpmgZHX7Q0rjuH7u3kp9/F5mZw2cKXHz35SqIs4QKktU61JXeAvjBzapeC3FE4wFEFjLUNsd5renLg81Q0DJB/aopzV+ZQ0TRws/VNdfIm7/CK/sxBaDt8wgbgT46+tgYvE9AGg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:05 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:05 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:39:02 +0200
Subject: [PATCH v6 07/10] arm64: dts: lx2160a-clearfog-itx: move shared
 includes to dts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-7-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
In-Reply-To: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|AMS0EPF00000199:EE_|VI1PR04MB10076:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d04761-20be-47f9-6217-08deb03444af
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 +kC1x1PrAk0zVJD5z/7IMZ8SzfsKJUiTjc43tRw4gL3FoeKvAIottJ7rLY00tDPsgmPzsOz4mwxrJRBpJjQptRPEOZg3+hdXTW+ksZMm4QTvN6O4tHunjADjPzDx7ScBvMHLeI8Qyjkm4sbtyoR0OIpmZPWg2ryAW4x952pA2DiM20eXq01eTrLF+O43ZSXZoX0yVN8fqM15o3/1d7M0r0ggIOY/ajz4cwUZiynoAhIF1VRxTH11iZWPQn303ME5jb4C9rNF4ovymX4PrNwX5IloiVWjKVm5Ni9YhZwV0zbmuJiKOzgxFwsfimFQ6/q5+WImQabbDgC3DxqzBIcq+8mAxc6LhNgMlXYurd4tQ7LC6VkZU3n6nV2D//zC/BKHfuXl352pu9bhkKriEOxjqUje9cAirVcv9liIbHby1F0hqCUzorSkdBtPFog8ToFgdcTn8OjeiSEefHQ/SMAHXmJrQQdIL6t4fYdZ7SOJRAYN2YZDUE0Nk6NRXUDQH72Fro0wGyt0XmofytG3BLTja1SpbZW0QtQMSEpVRRto1U7zBvkR9jhw5XlZxBW+d/sTBXsgbjtggFRsbCI7gz+4wBbN7mjKQ5uVEH8a+ucTexwWg/V3oVUxJenvlTS2Su70LZu3xnvHxpBGGK2KkxXSnFloqmBd0gCw7Vca+MZoA6Es26xUO58qSMDDhli2vEHqMO3nmDqX1UVa7LomuAammjDYenJpvi8GQ0/QZx8x6r2Z/ZzYGwbduseQNK7Te08VB8Q6mMlBCJAgwvI+teLbpQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 hT6/57Uk2uZPJ1wOoLEgp50w6Cgm4HhAE1nNSK6v1vuFAVsxzprEF89Pd5uVnlEKaTH60mY6r+juzzNHnGQXlsoxPgC9RXKWhXlvRI5wrZcai++l9wTijWeicTWRjpuZpOV/E8VZCOAzzXo2NhRaFy7gt1Z3qMiqjqRXYXyum/ughUYk7tSRWKmhneizdeczoR6xPj4CeKGn88LhlfsW+FOmhdw3AtECl4UFPQ/iG/MqyzZrMIAUtfG6RPnHpOtJGXpg6A5TAXTHmylLoZ5AMs/d1CF9wGbYA3krchwACEhHyBQKDgtaPkUDvq936AGEfFwT3omOO3d1Sz4wOtczyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 529bb065d69b4da9aee880f7dd71f57f:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f00d5949-6fb4-4919-6420-08deb03437f7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|14060799003|36860700016|1800799024|82310400026|35042699022|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	w6JrFUogq9ZCyR8/dTIJTpkJ0ixu3hYdZES0zVA3f7Z71Y4Bl/fHUAaaWzvZX2+rUv5gvwGPR+XFaYtTZc0yq5Lf0WZk1NnCmjfVfWuuKwJ7nLleUEnp2yNqIzSfpND7bow8SGOW282xsQSFNKYPj9HF8ucX8PEGPx1zn3l1B2jqe9C3X/X7h+gKnAcZdHi2d9pRWPPzEj0bGAPxOH7wKmg5I3z2zdMxz9SNN3GFatMceCJ48SkEXhg/sbdal9Kq9UXDwNilFwOD7aaf5V4R2xKEilRJGUQGZOn2xUq/D2wbhKsWSHhq0CtMgDnoo3VKb0t5sMWOtbpRNNF9X5zYdvtiDvgv9jxRY32qjWUJvcI88xnnWX9/9ynIQpsItqFj11REfgUt/WmHZijzIzwVWeKwwVcRnKHLDUa6HQPq90IqMV3OUMFHuhGD+pck6lRM3Z3fTlHNf0KmW4iRqxiAYYXay1RISF+BMio8WrLW2PZjPzoKgdl7OLA/8bk9qSo6fa8KW0V61pDKDbImuF9vRubkFrzUq9P23aZS8LB8iw39M6Vgb5KP908K+Zgiknwa+9eNZ4yoxDThPbjyb/UP6oLl62KEKzJxK86sDyDYua/p1OBeZZX22nIi5Ll85MMkUEgvMOj4/rcVVnFjFus0mTfSYb1KAmBFLONxzcByae3PGehucYbt0HsWsq1TeyrA4Ku1K7ZlSUCfkC1eTIiuBn+tUznPfDajtR+xZxHRQrWVGgdp5aAUDM+zJTv4bWzVt5mjmuNoprWcxTn/Oxtt4w==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(14060799003)(36860700016)(1800799024)(82310400026)(35042699022)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i5e8nT9DkopqFLT8YQlnChIbrNdRMSVkYJYa2E0UyHlIuXZNzyXfvBINhUXRPYJzYQYZVbP3wNut+3a1IAp4lSGT/tPHvd4ow2XeLpkwQefHVav8JLzyF9a6ExZxmseJtR5NvnjQGYCh7rICgyi2uTo0WtFTTJ9O/o9R6ymIZHap23V4gkM7SHJh+rsvSvmTVDMjhRKyda6s8Lx6XFBKCqWEPUYiIHiqWu78V1rNe5ayO59ZzqUpYNiJNth8UtL7mcUbM7vws+rbsYrDgAYMKo1Ehur0xiXoebGZmOadPalJFKm1PwnpDoczOBAdf29Y+PQ7sMF2lQKAwxfLnaaGDTK/y4HvoZp6OflP9+TX4UYzCsmfZyYEbRhLsPrrmI2A4eNIRaByPDDjLf6DYrpz9XoXGybHf7ZIkcUEcmBdzlDz6eH2wUNF6pbktnYGK2Sm
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:26.9314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d04761-20be-47f9-6217-08deb03444af
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10076

Originally includes were defined hierarchically:
- CEX-7 Module includes SoC
- Clearfog-CX & Honeycomb common parts include CEX-7 Module
- Boards include common parts

This makes it difficult to modify the includes on a per-board level,
e.g. when adding a new board based on CEX-7 module but revision 2 SoC
(which now has its own soc dtsi).

Move includes of both SoC and CEX-7 module out of common parts and into
each board dts.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi         | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts   | 2 ++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 1 -
 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts     | 2 ++
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 56b74837ddd48..7df93bb37d13c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -4,8 +4,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-#include "fsl-lx2160a.dtsi"
-
 / {
 	model = "SolidRun LX2160A COM Express Type 7 module";
 	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
index 86a9b771428dc..802d7611c6479 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 6388bd60ffdf5..170e5b0034f19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -5,7 +5,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-#include "fsl-lx2160a-cex7.dtsi"
 #include <dt-bindings/input/linux-event-codes.h>
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
index fe19f3009ea58..2b1e13053422b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
 / {

-- 
2.51.0


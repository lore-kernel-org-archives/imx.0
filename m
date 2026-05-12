Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022122.outbound.protection.outlook.com [52.101.66.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C143BFAF7
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.122
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596764; cv=fail; b=HAyTFEAkCUB6SJ3RGKTUzLdIJCQWchOSmKyxX4RsX+6GABJ04WTjpLr6e7gnLX1XYIAgVSSepzyXuvwhJ5r75cXX1Sv68tGhhVlk4KBU240UrzdRKhqbDQGCdsEsD3WxCwKCMa+o2cKkQ6c9G5j7+WArm8iOgEA5QW3RWOEa0uE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596764; c=relaxed/simple;
	bh=EiwPVMPlR/6PI3ee4I0nWPL+wLLQXu4YaQtH71uH0Gs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XMJHmmjblY5zFUseyMAVpwJJV7NtKOsoNVuKdraz/RRF2ljNUAocI0aL6oPhZGI0lKatvTU9oEvEKTLgAEu2Pnp9mT/NQHqkt7E6VZn3scKw6gNE7NdQGz6Y6KZWWBqnKI2MBaRun4j20dbQOi12lJjm/6O7gYOdsGmJ4VJUSEc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=ZXHvisjz; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=ZXHvisjz; arc=fail smtp.client-ip=52.101.66.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="ZXHvisjz";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="ZXHvisjz"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ECoIRklySSSQ7MOKQJj6JWTF9xlVmKhkWbzyotGaX2gKxWeCpD7B/CinkuSKk2e3VAIhYZjOBCKPkULotYbuNVreqhbIMyT/b071cZi445eIGnOscORz5NL7INFDCQCNdxPct+zfSpl5LAlyrJmM0hXrePCd9RdI9n9SMfJDAGO93D+3AiYxdF1EpCSpU36uuSBBJCRreWVZXUl4riVkqq+JI646W/sbFlj4TByJx4xwIkow9N8FErT90QDRqmjcS+mr13MIVUCbAul11kWtOcLbAyWwY6kCSqLKHTRln99c57g0jHtgMTemb8+N9+MyljM5dTi7IQpSDJ1QYfSrMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=F27DgTom/wBV31dSKawR5uaT9vyZyQRHGVJ0Tm4YKDL6OiN59z9R3S3aoUv5E1Goem9hk0a+VzRm71rMlAHtVpIkBxSOgUiHL3DvizIGtS+MS1NKKC+9GLCK1b4mEpMoG7FT5ukAVpPM5WinUw1I1+hPnTARF+LrYOajj2gwLPIYlNiG7y2hwxJDtdlVSWFciOtzxXHgAbSWg536qLqpqtHksG/sAw3q943BmFHLtr7jwsMI3GYx07xUsWerFTz8ZxbiaoDrKiv2RXzT3nnuhjS3h8r9im3AsqI+77U282vjW4y+9nmfME11zMIy+cuUkYJICcH3oUQoqJaO/i3sTw==
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
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=ZXHvisjzTIKLyKmFS6d+PhQhZXTglMnPIHTbRbIaKvdUAZ8RY3+4+g44aO3HbuvdixbIst75C9093VV7d+vvbt7UDt4l7tLYzt0CLe/ThPF7gnYAmeRzWcQnbt//Pxh6xldbhSkZlsF5TaZf8+PVEVZS+NG6c4aNGvkkv0mQJcAZz8GhwYXzmZzzGAwZLNLEHOH74m6h0Mud+etJyYtK1Kva2NINPRylnUTebXwq/KnLzHWJe5bjT547VPmMA8rksTiQGGCKVx9Q9wLAzA4s9ukBzAeLxj3SDCgpTYefbV2L2S8pejSSz28lz01WZsK6CT1MMx64caVkas/HVazH6A==
Received: from DB3PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:8::42) by
 DU4PR04MB11728.eurprd04.prod.outlook.com (2603:10a6:10:624::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Tue, 12 May
 2026 14:39:18 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::89) by DB3PR08CA0029.outlook.office365.com
 (2603:10a6:8::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:18 +0000
Received: from emails-2489745-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 077397FCDC;
	Tue, 12 May 2026 14:39:18 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:09 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1BOUAAHbnTBV2GRqRcHpRrOU6ZSujD/ueHmG+8sq0E8wscuxFfAZU718BgSgK/rLI6B59Rea7wexFLPZkr69Zqh9a5cJg9X1wMn/ayiecoSU1LfZyg6W5R7ZDqDVTNRix3xLyzZukqLCzh//OSFlza/AAm3LKqLZ3TV5NTp+V/FpmZqR1IA2t4muv1+WCLiVVOZhZJVRFIH34XtH1dbaBmqJEFFIQu5fHUfTdtHaCapPT7U1dd+pR5aG+skXrHxhO+vgSG/d6jid/Mh3fDyHB+FmyojjK7N9pGnhBKdq6iE98bM+PpMCoUehI2qMY9ahB76iCeTcDivxFkNCkxdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=BHrmRVV4GygDvqINAFeH+FZQjBVWsh1aD81YB/a9+QlmoE8xpJ4B/o/3mReqH2kpgPhFbt+vLl8YifRsNyqaVg+ZvrYIvmZYeSKOJ6JOoUBngWB206rkusxHZs0KVNHRjsa+bSxCH5Qq8DX2G3eHTjx/9s0T/yELMpTnongtR8qHlVz6wrEmC9ULR5rHFV/2nUZeKNxT8u5hhwPUZIQZ1Hht+uIN957yf03HcJpMaqCPKiJyJX5fjxT/7qBioXIMxVCxxbNuWyVFHIcdxkMIIQYab00BmQVQQ/pXi/ROpmdUYeiq4TwyjnOX1VQcOjXc1NG68YJ3tt5rtYDhqFtSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=ZXHvisjzTIKLyKmFS6d+PhQhZXTglMnPIHTbRbIaKvdUAZ8RY3+4+g44aO3HbuvdixbIst75C9093VV7d+vvbt7UDt4l7tLYzt0CLe/ThPF7gnYAmeRzWcQnbt//Pxh6xldbhSkZlsF5TaZf8+PVEVZS+NG6c4aNGvkkv0mQJcAZz8GhwYXzmZzzGAwZLNLEHOH74m6h0Mud+etJyYtK1Kva2NINPRylnUTebXwq/KnLzHWJe5bjT547VPmMA8rksTiQGGCKVx9Q9wLAzA4s9ukBzAeLxj3SDCgpTYefbV2L2S8pejSSz28lz01WZsK6CT1MMx64caVkas/HVazH6A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:02 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:02 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:38:58 +0200
Subject: [PATCH v6 03/10] arm64: dts: lx2162a-clearfog: cleanup superfluous
 status properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-3-d0ff72d3c983@solid-run.com>
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
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|DB3PEPF0000885A:EE_|DU4PR04MB11728:EE_
X-MS-Office365-Filtering-Correlation-Id: d59f97e7-c4f4-4e71-21a8-08deb0343f5d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 2qYDlp6P7Jh2tc0Rb1EMrq9dbrBkSa0ciCl3SKqADfxJokKzwyMubBQygK2aFrgthwyOE7Yrx3a/gjIysF0vSqsrjsz5BrsxR6L6747MeRyVqS+9Adx2qomb8F2zfAppAf5a7Hm8n4wRptFd3RE2UC2JzdZAie0Xd9KDzolDRbk9Q1bHwbpN5OaD7C2ES71njvW7blP0c6CboUKoE7YKQN91bCjXJDVkEr2hJGXt8rGzFqLcCS7H+ckomGalAbrxuY8YqyPubFgay50uEKtse12iOqgcwE9yIoObwfwh99DP0BNr5m3JLOxlp1BZf2VJAROqONaak4Nf7331Vdmj3t7XOPWBIpAZZdshp5/iJkt3If7VjX9+NFia6HIfjwuA9LBGuj4tDY+WwyKDC+pa9VV4ciMlwxNns97/N2hiYY8YJFeFNZip99LyN9datu9tdeeIbkAVEojVXXUfo6eisSe3CKIHpugmiVlp4aJOOZcCLGACw/8Rix7wjuF88OjI3ltt0pCekKDFSpeMfiCcLuGaPgsVewwN1OqU/r2OAEAYCDWUXmQxIfp2Q50f3I2MGie8caIMEQFgMtRSUq4k3+D32wJJ5rNhP542+3LLUJ2hXL5GANLAVzU+iLv/cQfnBezt8vNT4/wMfD3tcbiGn35ug8LhPtxFeckIj0XdI7oGpudG+9KlM4aHXvvjFPDHHpNrO4umwyzfjReDHd4VVnYEG1qeXvY0VB0MnLz2qFQl+KLlxRZgyc6TYMVt4VtlXQfVIwL/ydKa3XVpEb9eYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 bmc+Q39RGyGNwGwnBxVoMxg+XKdlMv9yJglUMZpHctvrlCQgrEK0/CnmrBmuUQVRZZlUtyJcgYzgB8VkAwHMR26YUb9/KNz8Cg/O5aCLU2D9p04xTBICZMJRi392hL4WaKJzAaujSsfEN8ZqXA9bz0MmCoUv6AZf+usYTLJnR2jz1UOIUyhNG7G/kWCtsUs2q7rCVgTuLXsKbNROdt88E5o9Vjoa9nEpUmK8SP0CjcJJDmNHYCgH8FLB7E5+yRj8ToyFC0bN+G/KgdQiC4lJgtO5FVqnLD3+HDeSzPNgzE27ur3cXGxzkiXasdQaJo2FMEXS3+9e390gMxkfKjmeXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 17d1b6bf4aa94cc5a78e628c42aa7b71:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05086c25-87cd-4d40-5fae-08deb034361e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|82310400026|35042699022|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uKZgVHipL4FBH3O6b38nhgeFzY5OW2uPgjoPIiGO5EoxhZ1wbucr6HIEXIjwvoMEGYsVJGL/nM+vxpCvmjzhvWJZPpvGOD+bjE2n4Qnm6Hk0Z0/MtCQsc1o/Bii3UrTZdrSPUJEbLYQ8pew37U7aGIgaqFMskeBCPVZtAPiLDYg+fVnEnGfZv2Er7hVurvovapGncxbfIj9VDN4Lsm6TCtgwlNr6WPCzPqeceZTb2VrkAuoeg+87zboqfHT+vp4ggLvNk9tl9TspJCI7xImrvDOLjhZ33ffyzs6xRTcve7e1B95vUPdpQpDyE4ZvjEibBTN7SK5jLAid2ThLQ2lsOhpH5OgQe4vmS444MeSCRNXkCLKQ8rzDZBaKZcWgjw187BLMk0VEMku0ArAHGOhHVCLCYj8FjNF1wJBZJn+h4E4J+FJD4F09Z7Ip7WPx4lOQWOQzr+pxJhuNcQRdt4UdKk/JiGdWSh7wgO2viT0aDYI0+zLU+xp8YgwfKlSsXxKgq9i7U51XZxJ9sQMEV2rsqCx0mbw0t6oMTIWv0fSZh2HXtjl83QW4LO7nm7PfxYN6z3RV/Y+Ie+/1gIAjykp2TOss8W6eiWuwjTMs62zap/fV/DKCsYAi2HEPDMzkrMlj6fy4Fw9m9oyIZCiotcssOl7YRKQEiumoWvCgbFqDu3FIm7H3WN2zN+EwVJ1LsoquDkq0jD4r0rVWHptrQCe7La0VmcDFrDzZo7ZcLayvRO+Lt2IbGGFiudWXoB4I27ntkqLBOSI+w2Zmntf4sZ6d2A==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(82310400026)(35042699022)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CRJwfMpKsN7fg8/mbtYed+yMyOky16KrffVt8hG92RrvuEVnBbGfW4GjmiQkghiTG9xWw+ohiQFuQBM6RsHLqinyAVD3UpUnGoIiF6NhoRQCufoctQR6xU85CA/LVFD5oEbjRqiuc4kcE0XKSbL6MNEuPskY4ag9wDCiqiwTveq/MGSclybjisummCoIP8xWfnZ5sjyqlQSKi8zds1uRLcXaLENubVi/PKKG4YtLFLmW3f749DtYPxWSLUMKEqhC3uCIraxlfu1HFK50cllSHbVZgo+zVb9CODaSEbotrEqWMK2zYol7j7XqGglHHLI5DqyBmA8dM8mKXh1bfX0OCc09ZADvJTUFTB/VIvfmc9qTcx9Uny7YBX+8MLxXThfLOQ2ArD9aKAOcCAg2gmijb+fpQpzyvnPsGo6bJlN+tCEobEg0wXJOcJVHG97tGhd8
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:18.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f97e7-c4f4-4e71-21a8-08deb0343f5d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11728

The SoC dtsi has always enabled serdes block 1, enabled dpmac and
disabled pcie nodes.

Drop the superfluous status properties on these nodes.

Further drop crypto alias as SoM dtsi already set it.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts     | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index f95e9c19bfc75..6fd85a5cac94e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -14,7 +14,6 @@ / {
 	compatible = "solidrun,lx2162a-clearfog", "solidrun,lx2162a-som", "fsl,lx2160a";
 
 	aliases {
-		crypto = &crypto;
 		i2c0 = &i2c0;
 		i2c1 = &i2c2;
 		i2c2 = &i2c4;
@@ -124,42 +123,36 @@ &dpmac11 {
 	phys = <&serdes_2 0>;
 	phy-handle = <&ethernet_phy3>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac12 {
 	phys = <&serdes_2 1>;
 	phy-handle = <&ethernet_phy1>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac13 {
 	phys = <&serdes_2 6>;
 	phy-handle = <&ethernet_phy6>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac14 {
 	phys = <&serdes_2 7>;
 	phy-handle = <&ethernet_phy8>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac15 {
 	phys = <&serdes_2 4>;
 	phy-handle = <&ethernet_phy4>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac16 {
 	phys = <&serdes_2 5>;
 	phy-handle = <&ethernet_phy2>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac17 {
@@ -170,14 +163,12 @@ &dpmac17 {
 	phys = <&serdes_2 2>;
 	phy-handle = <&ethernet_phy5>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac18 {
 	phys = <&serdes_2 3>;
 	phy-handle = <&ethernet_phy7>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &emdio1 {
@@ -314,14 +305,6 @@ pcieclk_i2c: i2c@2 {
 	};
 };
 
-&pcie3 {
-	status = "disabled";
-};
-
-&pcie4 {
-	status = "disabled";
-};
-
 &pcs_mdio3 {
 	status = "okay";
 };
@@ -370,10 +353,6 @@ &pcs_mdio18 {
 	status = "okay";
 };
 
-&serdes_1 {
-	status = "okay";
-};
-
 &serdes_2 {
 	status = "okay";
 };

-- 
2.51.0


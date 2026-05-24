Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020141.outbound.protection.outlook.com [52.101.69.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C955392C47
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.141
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634500; cv=fail; b=gVeih0dvm+WeGXK9n9AocA+jJCeh/z9QmhAvyWtmFwe6QP+V+WML1G48jfI2AHdWeq0P+c25HUFb8ah0aKCvMDfI6VT79TpkKEoNu33I/5Q1FfPDnRCC76UWFX84TjxnrrT0AutsWc/io5sP2nAefauAHasy6Geb9imC4PUEc/I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634500; c=relaxed/simple;
	bh=XZ9cMtqKC0cCH0nBEYLHiIx1rDTen4MsUH/MfbJvmAM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pGNeInYQ8GtGpOJAiNIrvMBIqaMel+Icu+RtG2iJ8UoleT5PFuVJk0OzIvBzt339yo6zp1S9cbchtJBoYDtCUhcJAvMYjoi3RXR/BqVYBOcGN4zDDHgtAgFhRbggrNS1oppkgjlbBWTikGS8vNIAOO0vyRR7ixzxItzDgJGu/74=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=GB0syFh0; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=GB0syFh0; arc=fail smtp.client-ip=52.101.69.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="GB0syFh0";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="GB0syFh0"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=FLfDLVrb1oWUfMSczz/JYpFPOin/3Q6AyBpJXl4sfAMkhkMEtRT06u4sSFc4BApK0k7pmcwBiwDUrm4/sfffu/1anX6WXHdiNK4JTmyZUqk13wtD/SyPoLj+7yJ8Lt09CI3/aKRMUl/EPKWq3ByEh+ZMfF5FQ4k9m2kNmOUkaSxvVs4aVB2C4a9w9D5L5fYDye8SphyJSWB02nAXjUEMo/5diSZ71c6MMp/h5Bb7IcxsDIlSSWZZpae7yzPde2w4t6FOUVL2Yt5AlRrPEC+7Bxu/0+19jY+gRlDff09N8qYrH+ovPfMFh9EBxQNCcXKzR8VvwmAXIMLvvzcjkF/YJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=NEe4RifAj8HgrvkDkHvD+1mRSwcXO8y5g9m3cypwKHvOZaV0uL3mRM3YZ0+yUQWbVC2ONEW13MB+7JwU8JO4YAxhCM7LF5cYgG7wKc3qqf7K4AfuC0YLalSmecXyoE9LhoK5DajBmBSSWVumbamUXkBCXf//QHmJPXEHPdmXxO0K0GyVb0RTjsuvTgj+jBf13iuZcOO+L6AbvOVNEct7Ag01T8zK9EsV/vwe1d8sSsMo4MAGLzz5BcpQa+2zSlKNCTvgxUA9Yy3IIjZdMzZAh2Ie7XAdhvKrW5Wi4uFXwfTNNrKRmd2BpcZ7eT7EoESPwfoOJbozg7oF3tEg3chLLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=GB0syFh02+nZ0jEFFmbWYBo+mVV9rdPa7g4oKqmBqwJ2EVfKsUDYfbVjGLBVF7ND5VBuKasKxQoNxXClOEBaHR0sa0yd2NZjfRXh9Bhw/lbzOLyHRaM1L9CwtP77r8jq0UHTDhPOaEQyUEu1kBRzlc1BVTRmeqP4iTgGHqXnF6CSJ/jCcFpLYj2aoRgJyzVGLXvtg7FYeImK79SER49aQqiYgwWTVy4JdZJ0c1ZDgGMhO1uROu8krjQqUuLLGd1v4HrXyp/+px81FGXieYjzlIDNksF+55/mqi+XGTdkf7N3JshH18hCKsma+CISXJ+N1/1XGf5/e4V0DcmiJYyujg==
Received: from AM0PR05CA0078.eurprd05.prod.outlook.com (2603:10a6:208:136::18)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 14:54:53 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::39) by AM0PR05CA0078.outlook.office365.com
 (2603:10a6:208:136::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:53 +0000
Received: from emails-3355260-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2F3307FE52;
	Sun, 24 May 2026 14:54:53 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:45 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fesdPaAa+UJV0FQ9QIESHDQzIXdpTy0LUEGfbtpkYV8lYOApZyCoAq/YENLbI/db0dRub8VB5GDii9xVf3alg21D2Do03nnp0Kl97LtA3MZDvQvq8eZIemilU6SmYdiOQ+XLSDrUq3QorJgC1BROCvCxDJOINlDLo3zNbcOaRJJeLXSsJnAyE6lgxv/I6greFJAQvxMDNWG7K2Mk0qI5dBnSEuxX6a+km2M/UUrHDi2Su1nHkUMZWHQ/GGE2KibkvZIJCTjZoHopdZ/RXRNq/5uqNLrXQ5LM8NxxHrbKkCA9nMCGpn4E1ACGB4nnQy3eEchVufciSSB1D2zo+9bnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=gZ8c1g+0IrLlr69VU5c1Lv1QLEQ2POV+TpOoqWAIcYgr636NttIZWK2TiibkrWzm4Op/coCJkQt8K0S4yNzzhVzHf9JDNfIcUiLSUrLdHfDXNEHnSLAkC9ZBzgY1pabYQ6F4taxB35OS/vSMdsom64vzqSXphez40j32lZWu6yh1hbOuHm62D4JFImaChCuFx4nmDjuWaXTabvVOiawsuaX2NR3owckwPbZYLfIebhiAszHNXVOAqLbA0GQemxX6UJs2YrwVLJwGP0cR1MnsEZaih46Jgvjo8mrlHJhCNU0ZohyZ0QtXm0ccCRM9xUB2zoZHTAC3R6qZ1tI3+M2FTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=GB0syFh02+nZ0jEFFmbWYBo+mVV9rdPa7g4oKqmBqwJ2EVfKsUDYfbVjGLBVF7ND5VBuKasKxQoNxXClOEBaHR0sa0yd2NZjfRXh9Bhw/lbzOLyHRaM1L9CwtP77r8jq0UHTDhPOaEQyUEu1kBRzlc1BVTRmeqP4iTgGHqXnF6CSJ/jCcFpLYj2aoRgJyzVGLXvtg7FYeImK79SER49aQqiYgwWTVy4JdZJ0c1ZDgGMhO1uROu8krjQqUuLLGd1v4HrXyp/+px81FGXieYjzlIDNksF+55/mqi+XGTdkf7N3JshH18hCKsma+CISXJ+N1/1XGf5/e4V0DcmiJYyujg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:44 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:44 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:41 +0200
Subject: [PATCH v7 2/9] arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-2-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
In-Reply-To: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To DB8PR04MB6859.eurprd04.prod.outlook.com
 (2603:10a6:10:119::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|AM3PEPF00009B9E:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: fd17182c-9a70-4d6a-725b-08deb9a469de
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 JNmzMc8QipEeHx5O20kOyZLCmEJhXO74+SGk5Mmsh+s4ZvkvCjaVG2xFHgtiU0evLxnta0I7UPfbDzAOWuIkeUP2J3fFANMYy5S8mSVloWxbihluqDXsLsd2oNBI8Cmj9yLRZnbqABRWwTTMuxoWh/7lsY4RxHvvnE80weMkUc1HjwkXPQPr7iUQsy7BXny7GUS2eLWP3j6NtpOzJeemHwdXFbJU+OxJ5hfTY7TgtABg6BRIJ0OQZaVHmOXSBNDR1gvRok7y20btXTcEcQVZds/HsSGb624L7WVNVgPSBiHPD+YUyoGz+IOsdGfFKBYARnyXQzGTxUvNDM9XowPSw/CLacpLCf/um61qsWjtWB+Gh8gf0kUqghhh3Q6X9xfWml/3Du0UcUCTprMgYQCU0AYVC1mKl5Se0lCdjF1+FWdVFHi+NBvVMuSkJRt7x6NjbrdiY8/vfcnxQBTHwzAMvniq8QsVIssEUn0h2PYLz8VlxjOniS0oyrAZ60ZuYM+XI6GM/VYDrQDseqj0RPEvX5IfD0GoBp5bntRaToYNKnNittQv1pIuZyzN85e6VRYMZFCiNzSbifDCn75pO2eqYczasTEL/QttNd95VjhaxtUmsZE2my0ECeVYW1i4SnNvOmmg03kespxXvutK4sI7WO+Grfu/2lGjsizjCODC29lHOr4TWXk5pW90LektKjoegO1vtBoDwe88dmRZjSLLLxuxch3DWKqrRBWy1kIH81zS97cubvP3NG/iQ0pVdUj8g7QMT1i6CPyDIQXMxhkF4w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 QUUXTDszRgxbnRH2h7XYYhM9RvKisuWKw1mUB2HQRxClQ5dui1bAmADM72ElyGVr/ojJA2IxlKpT3VR2LC6KQVyqwY3gvz1Bca4lhsJ/5U6IaP+MkBOuZgk1z2XGYnjU9kd6Q/0+CQI2kdkUg2z2U8MeNwLuSwciLuDVJTLLaWK3q4paxK4t3YZ4DGU0ZVpAZ/KkbYNtsjntjiwMq7FH98ynhOKfCcs2C7p7mViCipkZ270aLYnr6IP11Z63Bu7p05Bc2RWYYbG0NWuO14PYg5CbOL39oXJ5/1t51CUmtI4LX2MUP1V7Xh9n+ViyXynNRvr+r4Woztl+gY5+nrdxmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7bcfe85494984470947242fc5d4a1b4b:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	541f0953-767f-4bc6-af1d-08deb9a46421
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|35042699022|82310400026|14060799003|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HERjn7vBGNinPEcgJT3IQYPLgQ6d4l4kR++SPtaBY59LQfaYvk3pxClOQkyh8DBPq2k5fbh4GWKVieS55qlepfeUHS2KWTqiBPRBwlc6PFihqNufNc17AhFRGXcOhNSl6PZ1+vTr925XIX+tkx6i69h0z4wWQ8H7ao110tDrgx7sdGjAUbHgorgwZqInmdLoLLc7Ec1RT7O07VLNwV7HQydW5y9OZqbdEyfg7Uhj+qX7dHDu/Exc1uxeawixukzE2Oymd6AfXCaze4HUdu74pMKJZOoI0as07LB0pptouB8oCW3uO/Y1XWq8bzL/9zujU5zq18hZ4p1cDWbxJxO0redQKc1RqWASQuXd0cPBz3cT2MsivsW9kjCGCtALmCgAUhEbKPGERzsSpOTtXFEfisTZ5fX5Hg5OxCElDMnS3GUBa2MNmKVdXPD62MUEn/9evWIus/8QjBtdPQR0LOD6k7wwRjYjI2XrrRvoecG+jhBcuQodCJublfyQzn4PzkvPB13uKoveR9+3IybXmxRuS7CxXZjvyAlkr3RiX8zRaTh/oUrDp02Vdki9PWkEShW9uWAUSfNAhW/exT0356BYw+FotmPAhdbYRpcnII5yxvef5mBi5KrE3iWJSCTCbBgrmAWUCccC9TiAB8/3j06v2ImHJR7dHhhZzdpttQJtcjABbgRTZRQrCeNFktv5TQuaFj9fBt1pXw3N232VWLs4K7mvQQMN+6rdWDWQ3u/EVHQTNNcrPoNtoPny6kQKOL+wxDJVah4eLtDBgI0dLfOw3Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HDFEZXxHdH2Ux/+afa70kIeqqd4weKTfNYYa4iwlqXtJvgD7YbZr8/e28IFnQOpGAc1oQTKGt07Y/XGz5SUl01U1PQCGUfFAm53LDK/FI+aIR6HwAaU76oEvcujG9XIr8CWunRrPjemb23IWv+tgxFA2bblU4Iop3oBO9PX/ETEj2D5RsTSsBaa4po87RazeWpi/4Fm9Mbf+wbe2GiCTv6TJmYynzMPQ4287I//ATl5iBSHPd4csX/uLIAwiVi84j46nP5qHR3MrgQ9fNDAQwQyFvK9of8USB7opxzgqwHDEPbMB60tXx4W97cP+9G2aun51a6W+a7n6HVBAzhU3BEzVLvCA+/eOYvCd3Ga+CHJwvsW1WZg/pAu2C2cszmrPXiu8HQ8jU0KHp0ofCof3Mv4tO9f50PeSKHp0mCo2YYp6RPPhkUZ1ZUuerpXaA1Yo
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:53.4129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd17182c-9a70-4d6a-725b-08deb9a469de
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471

LX2160A and LX2162A are different pakages of the same silicon.
While LX2160A had two revisions, LX2162A was released later based on
LX2160A revision 2.

Commit a8fe6c8dfc40 ("arm64: dts: fsl-lx2160a: add rev2 support") has
added a new soc dtsi for revision 2.

Update LX2162A Clearfog description to use revision 2 dtsi.

Fixes: 5093b190f9ce ("arm64: dts: freescale: Add support for LX2162 SoM & Clearfog Board") # no-stable
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 9d50d3e2761da..f95e9c19bfc75 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
 / {

-- 
2.51.0


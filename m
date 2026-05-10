Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020105.outbound.protection.outlook.com [52.101.69.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A003A1696
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.105
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425952; cv=fail; b=ppRKUgf3pt4ths2T0ymia0xiJw22s0hN0Wy6MC3c3k5dsQoRWYgaLxZDEKmxN66rzpi0rzOYb3hX/EL/3EdjCsn/kXCk3GURLTy0yYBaonoxyY8OvZdNw/Fvw6VKBcjk0LiQeXP93gj6aUdx9jsK4XYb+U2eaD044e7fXUN0KAw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425952; c=relaxed/simple;
	bh=fWqUwfECAo0pbzJX8IZlFB3qdJ2DIULHwcoadTNlNrM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=URevD7Thvh8GnwsTI+5EL+OIHAaYGYsxuX5elSxgBsxhhn4vuSLMp6WLLWt8gYz5JQkoSR3JyyrxnvRYRQUUxW0XX0T6EiajRK3KKweZxQJk1JgDb3NrOxe4JkEqWZV2kUUZQvbAK5jicR5uh5ndeqZ2oXLKsCqgMx3bmcW7gdw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=i91bjLgU; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=i91bjLgU; arc=fail smtp.client-ip=52.101.69.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="i91bjLgU";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="i91bjLgU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LI4+0ofbWeGqaWc2GalPYIce1DCBNT8YvQfwvMV81VA+BzOc1HFwPeoTvdFdIgag8GYH7NOeu1gj0x1DuDQC/mq7e8wwbJ04bVLiBIaRquAkRHoiiZYqZeVxp4dtOwwSP+m53VA3IGfU88B5JLKyP3xrAI57S6AhzGnQjO3fZy5Xfo5cc1rf46eMhSrzCqKsjnl2yALWGr51+z8OltQpn3Dxb+jSdl13YnB162sHV2C8dhsMCcgVLxa6hRCEsb552q4n4LwkFSODSwA623xrFjuFIjbSlfm5vZS+bZvbmL2WniSb9m3ghpwMSdpHjbtAJu0aSJHsgJZs0LcRF0rKtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=F++BV49FPJx6/7sk66zGp1jV9U4Vjk1AitkRkaotwtlZNORPJaEyGVIxqh/vujuWsFmNDFvvr9mN2SuWsOf8AQ8D2w8z9tjtGN++c0j8sFfffC8Nz48Lq3WQRb337ZX9wK9OAZJnBg82Ok3DUCga5WkrueU/wNCbrsMAHCDe0nu8DxaDiz3pVoDi3KP9D2jcqRNt9switcGlAPFM+X/aj6ixcg2ErSpxpGQ/usMWQ9+1cyce7kT8dUMFdEwvbyxFnEqjVVhPhKED9Ghr6YKB+nCplo+Om0gcbKrwBKj6aHG6sj+FT7lGhPmcVeuhvNeLDdMfnJfqbBpSqDXq4NC32w==
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
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=i91bjLgUjUE7IIuaHheCg+ryeoj2jzDOhlFofM9I0ePKTsEGLLkHMvzfpDBWSeFgxzSR4sGKvui7YuPgHTCk4m+NLw99WUgvEDf9z2D5A1qzCgHrPQSw1RbzWiQUSZ6L4xAD8iIfzoWyGpjKiC9dk3nPbbj/eZjN03GTW77ZhawiB+Lf9IVPxmSrUmGrbv6JJtVX2ddJUgVM4RozMx39wbbgANkk+VgLdavar/r7v6DKzF0IuhruDLQX/bom4fOh9GqPEzc39ov550qS/IGA/S+OpmyRjq0zEEmrzkB6HFhUAm5qAA48I36aD0F3t867She2iJl3V57wcH1PCGxpaQ==
Received: from DUZPR01CA0193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::14) by MRWPR04MB12354.eurprd04.prod.outlook.com
 (2603:10a6:501:81::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Sun, 10 May
 2026 15:12:26 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::33) by DUZPR01CA0193.outlook.office365.com
 (2603:10a6:10:4b6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:26 +0000
Received: from emails-9057011-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 11B58805BD;
	Sun, 10 May 2026 15:12:26 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:18 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+Cyv64A01ga9TA+9tEIcRP9CIYYgEQ8Xbr5SsUCAXbyjUPl0acFWFM5WSdhf65R04gmw1SS9oXNLQOZYrHmYrfPNtLhQMDxXbERnPnt/FRjIQWqoGBSuRsyJfHD57SA8M0VGAaK5BNQN8uj79vNp8JR5mXIijUf+jg6NIdg4kHLNRfowTuIyVMXJxD8hptV4WZ0HQD/vBDTsF4/LLOJCI4NvnlEC8mUHC4m0dYq4bRG8GLxjaqgQknfHS4EAdoGr3PpUzAn8kt7WSiIr8hRThk/cn8gi+db6dujTUGyzlS/bSmW+uz685QF1pi3AyeSOKKjhdy0/+V1P+k0yyqCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=oSnwL7tjNaaS+Bdmh+cQl4d1bYD7mlQo4Lw0ajBY8znvedXmxz/l4pbWNSl0Q0E6j/aF9SMgH+V8ek0c/XeseHjKHBRDvwUq5l3e0yv/6A9W5Wek04RywqcroF08B685Q/Ox3ia7yjiJyLb8ViUYhcULo4z30qnwknsbJX/LM0QcO5OutnUDlnRKl4aO7yAcFef30CvUTcjHgh+7RWIlknNoSHKYV1d1i0fpuc2rpmNSPz/deuEadVE1rsJIFT9yBve3HtbzX4sqGBeWSp45IkPwy7U9Mv3RJ3u/yY3XLL4nYv/CS9ENVaX8JDWA5V8CzCiQji6X9bW+Af0X6xn/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=i91bjLgUjUE7IIuaHheCg+ryeoj2jzDOhlFofM9I0ePKTsEGLLkHMvzfpDBWSeFgxzSR4sGKvui7YuPgHTCk4m+NLw99WUgvEDf9z2D5A1qzCgHrPQSw1RbzWiQUSZ6L4xAD8iIfzoWyGpjKiC9dk3nPbbj/eZjN03GTW77ZhawiB+Lf9IVPxmSrUmGrbv6JJtVX2ddJUgVM4RozMx39wbbgANkk+VgLdavar/r7v6DKzF0IuhruDLQX/bom4fOh9GqPEzc39ov550qS/IGA/S+OpmyRjq0zEEmrzkB6HFhUAm5qAA48I36aD0F3t867She2iJl3V57wcH1PCGxpaQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:12 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:12 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:08 +0200
Subject: [PATCH v5 06/10] arm64: dts: lx2160a-clearfog-itx: remove
 redundant dts version tag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-6-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
In-Reply-To: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|DU6PEPF0000B622:EE_|MRWPR04MB12354:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d4d34a-5c54-4d2e-205f-08deaea68b89
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Xl0iV7Q7OFJwgIj2QPP+pPl6ySYQzqLsk0zwOJVArO/y1Vy/dTM52B4lcZfQfeN0ws5CiaUUTXJVJBho0PkJOhwQ9roAP6PaxZzQjXx71zuUgS3h4xgODCghKtqGXx6QCqGl3WaTsICNbVregRXM86D5y8g7tqi1IHFJe2nC/jnLYY+n5JUFrhX51s8ByaAXN+oJh3xh/HXWp71WVEtzML+NKLp7Fremu7PPC1fAVaapVj8C0yJKVqDqvVFNYKXCwkefH0mzg2uD2o/T5IXuqqYx6RuIyASz4DqDOxnYgsMj94pOR/hR4Vj++Lj9+RzWgvvjroyu96SWy26bRBZ6yiG14rqLlrDLqMR6reE12pf6XrPeIdyTSyYasosnxLZ8RGFQJ7H3f0GT8Zj53wuLVTHv+cVZjNi0amSQS0iqdohZ0Tv0Tpr+oxnk3NEWq2al7WoEIVUgHm6Cn1FeTnkYRBSfmRDcbs9MZPuOyvaSYDPq40Fb3OlQBBcqdLUK/8sgxMfDkHjN0VkD2V9GLLKlyTqH5OlwdXIyGDmTRD/zdhs6umNea+WX+2W879tXK3OiDdiPxj5B1SSQoUpkljjU9fJadYOh3xHT89pgSCs+Q8QOS+1mCsBWINq8Ab0Ad1jWiTxTtHic6H+dhT29wRQkN/+M29/ZSBl6oSrQTqW2lUuIw6Josul1OL3TtN5rI7Kl1MIopxU5f256l2m8gjrMuH3mjDTqnRzcWPcksd/kjSOdqCBJskbzOMWroGMPbLBwRgOY3pbKdRoZkanTRBBFkA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 o/hAXsB64xON4FXmdV6BaY/5jXvz0w4yyKuktyrPTAmqkd31SSImoFoi6umTmg+kDA9YHbqZ7QxAmE7hb9UIl/DU/TJMBSAGiRLxuWx+fOkLKMfHFXDTfdYl9/HwmV4dv/YNGY3LTcleWgvAA8u6OIQilFFeDK4c3ygmihIfUGofrPdbHkPRKfv38uzYMWIp1Qyy8bDNV2GdD7GmASvGtLRmtIxTUAMiKUrZT4o5KsD9iPTK8s49joZLVyzUxbmCUZn2qJnBRzSI+oq/OlwxIdbK7Inbwu1XFihed5Rd4YNn3pYMkC8PYYF8AjSwUFMaFzIdZfmvkybUOmOz0WvzVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 331a1daaa74046ec93bcc08d974060af:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	977f4ab3-27a3-4d94-b64e-08deaea6831a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|36860700016|82310400026|1800799024|35042699022|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	Lri5Xpg/C5eC8SQSjiBr6GX5i9o1yZjvNRaSnkvfO1pN286c+RaMnvexPRIXo3rfnT9drCD+DrcI3mhzYmiO93GXRfyzvRAlPtENy6t+XcteBeWq1u4Da8nmrTryiLUUbVBFm4AR4ig2yHEdXLHsmoRIjLUoJzhIh4yrUUN8cwvjrdswxPV0KhHw09DG5zFZ/j6RAcFTy9WDGSPaJyVZv5r6pCViYrYIDA+phHdSrbHpQQbJQoggQcLtndVxlA/MHSZ+1Prqm3KQtCzIFlVgTN7eFhZ/ey++Ko+0NXJdUMjHdNvBu6npNFspu0v8EO+Um9aqXxkKRF5WPpwMcrk+tsW0yv7b1IHQl3rCoOd6GtkNkhnVFBtQAPN5jL1mx76i1/M4rXccKPy8AY/g2aFhnm6suPcXrqUgDDGG3xqUnKAE5P/JHLpWrvaYqqvkqYdeauNjdKEtAoIBOYTY6hzbWQS/9rzDzw2TDOldTjL5bH5wFlv/D766JEHWwbqissivgrOeIROmoIvBFCQz8im/QR4RcBniUizJhTCu2VEiD+t1i4clgBGeQp7UT86nntIND8eJZ6+cji6bitsvaXnc5G9okKYIQOPe62/42Ni+hOExL3sCIGS01RH1+/f64JWy9m16gKV41iIH7tCO1jDQq0oVDmPUiP9/zC1b2JLkyQQuUOYnX/hfglk4WkvSva0yNa4LTDDsmyl6qKvU6GroJjTluDlurZeuqwFmb54V6SFPWMby0MwZi3SO3B59G+X9Go7aiRgC2KgxISZcz/2V1A==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(35042699022)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pN211hWvxLz7BhRwPH3D5rInP+a7ESAEpaXX9KSNPD8CWPH+E75uRYTiODFvZMZJWAWJyVwYMnadEwiS46xE81VS6jCMC9jxvI43C1Pz4R58cOH1chTPpTHdoWKMrJwygt+LQbbp7fpdMHFTZWeMQZygrpWDyu32rdFVxpbt9zfTW+4r0TzN4l5TXaUJVfUZE4hmYbymq6NVcfGPm2/rQwRA3eqM7+JvIEjHfAq7BfkIbCjvoOwDniUNnm/60j0bjrxKMVF6kuyP8Ep4qYU97z0Fvv1p/k+froM4sYo2OY8A3xanaqYaTU2D/mt+BVTorleJbs1kprfpRiuTR7jMmMg1ThAc+RDM6CaK8lT4ZTQaj2hV7fLCRyv573YneivCAbD3OPR2ihhyJHD2nxdgy8eqX3QWBTzkhZodrKg4Jny7sumCuAkJwUwKf5E03HbX
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:26.1579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d4d34a-5c54-4d2e-205f-08deaea68b89
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12354

The dts version tag should only appear in the top level dts file.

Since the cex-7 module and clearfog-itx are shared code intended for
inclusion, drop their dts version tags.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi         | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 90956ffb8ea9a..56b74837ddd48 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -4,8 +4,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-/dts-v1/;
-
 #include "fsl-lx2160a.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 580ee9b3026e3..6388bd60ffdf5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -5,8 +5,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-/dts-v1/;
-
 #include "fsl-lx2160a-cex7.dtsi"
 #include <dt-bindings/input/linux-event-codes.h>
 

-- 
2.51.0


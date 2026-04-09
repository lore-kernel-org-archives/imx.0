Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020134.outbound.protection.outlook.com [52.101.84.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F91C84A6
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.134
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737114; cv=fail; b=aPx4yKFQBuPym+ZB4wpm8HiIb03FipxN5XykIh1S1GSMnR/Akj5RPDiSi7BxCekslGsM6IotAA6UQpP6jmnVF4z1hIESOv14rbeTw/AFvzfuh6UEEDiwdnCjvz7gGy2FR7gDbxGRKZXluA6FCJh5bl7QX1+ycVeEieDHamIfbWY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737114; c=relaxed/simple;
	bh=EarK3gaQsZmSyHO5NPk2G3HuzJO7wv8qHtXUpVHjUfA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XxNLeY11TZ3DamzYQDiEceAgei1cfaIyl0ofCaG3xZQa4zxR97/xSfSZsr3ucpiYKD+laSYULcZx/X2Z8Dz7Fm53+zXlKVBolpbZTJWLqY//T4/f26Ek9TDLGbqhfuv99EBfSu9oMVHh7eSoSVuSH3PrjtAtF7MRZh4aD67mcuI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nFQu2qNT; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nFQu2qNT; arc=fail smtp.client-ip=52.101.84.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nFQu2qNT";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nFQu2qNT"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TIJdXxFKLYT5igfLShW8rTqt3akgJkV0jgfXKfdZnuYbWzL4w+QVOCx4A4a8TDFy2ZCNrNpDETQoaRl+Fu+ALIIqRKS47C6tCt8XtETA3Di9oT8jl/LXnzdyJ+Bfzw6jFAAkvta9flkbRisSGgZqP2DTbxpnq1Dws1LoXVZ4JZRrGmZf0rCX03NFU2yDrmIXP0xdMVRqZJRnSIHIgvcgdCN9PjkE3ejVZIH6huPduKTEMECDeYf6imIqZtOmIS9LfVrvfxwX7WxP7ypvPSp6wqRyYPkOC6ti8gWb+x/QO/72FoGwH2BxPVjCLGCahWOgNgalCvrZkw3H/7LOLhrATg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EarK3gaQsZmSyHO5NPk2G3HuzJO7wv8qHtXUpVHjUfA=;
 b=ANWh64pu8iRru4DoEwuKkuOxRZBxiteMeBnS7GB2dK2A2vcpO2RABZn3Asud0y622ffkANNog2JumIk7gfmMDez/YhvIAwYr+Gzm4I5s3faWVt1aiAy1KKNjG6bzvYtSM4ZqkVPKGbKAUU19Ue2yOt1CKJ1t0RavS7eg50vuIydCC/rlVkHlFXwx7ztj8vD+DpXmh1uXTGIbNwhtVsVCJyoH32zXkKwZA/zakPUbhe+Lao4FFoaDhd1lfpZ5Na8vl2liE7+UVi8UEFG/VDP3uto1mIkYF/nUyROYHG913gaFvF17JQKmDP/txChK2VUULaBWa92JFl689xQRIyFY0Q==
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
 bh=EarK3gaQsZmSyHO5NPk2G3HuzJO7wv8qHtXUpVHjUfA=;
 b=nFQu2qNTswgNVKKtkQkLcVeyph0rCPyEKY2y7a9itewg8aesbOA5IWef/OzQRf6n0UC3y4C6fUB2BImmk9flBzQqKQTEdFKzo/oeC9G/sWx/dyLy0pjGszOyHX/JPTgBb0+tQopZum+IztzmenfsbUI+7rww10LTjpIeCkN97fSZn9twW+xy2MHoxRdUPx+tCUeQx5x2XNisJ51bhMMCtjzMzw4HpJIS/Hx7G4AgVKOeStxuFzVnpgUNNwMT3tjKWA8YH71zIBhnaKCzTWchD2/9Sp38qe81H9xozDWH/GPX59dOoncjI9JPgy7jMJ6l00YlFAKxEfie4k0WSGOgbQ==
Received: from DU2PR04CA0233.eurprd04.prod.outlook.com (2603:10a6:10:2b1::28)
 by DB9PR04MB11533.eurprd04.prod.outlook.com (2603:10a6:10:5e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 12:18:29 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::d4) by DU2PR04CA0233.outlook.office365.com
 (2603:10a6:10:2b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 12:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 9 Apr 2026 12:18:28 +0000
Received: from emails-1387142-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-125.eu-west-1.compute.internal [10.20.6.125])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8498280EC2;
	Thu,  9 Apr 2026 12:18:28 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Apr  9 12:18:24 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlnI7hFeg8oCfC5W03hdzyDuAmgQD21cC1jwxb8ONhigaMzRr4hq5pxnUAN9HQQuPPW7MV6FRD4PGcbY8sJdINBWpqWeCSyCVAtGPQA1Op2zizAKOyEVyhscE3rQOJytXmS1EEq3dmt1HwC1+3U/BKPBD5CW9k0HIDTxUxjAuj5OqnNJST52KvhjKEZbI6HHRmCI8ySegakLOb5B7Ucsp7MG/dxjJV55SZHunFdD10+Ldq7rqXQUFuJ4ORrz7QJytHbIh7bZ84AgobgD3NtE/WZhE9hfxCNJ+KDFsrdzQVJWE97WVRuyDapx/wehh41F98zRCn1S7Xm5ImSYiqFZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EarK3gaQsZmSyHO5NPk2G3HuzJO7wv8qHtXUpVHjUfA=;
 b=Jxt8J+xVhmW+qnjejv3/a+pf95UmfXn+QBdkT2otuxtib6eEw1r8Y6sUaOk8I2JuNTSa9ReiG0zawpuEXBG7byBfJvfDNO3U2pKZXJSKIA+WSoiYTYxHiBf03C/49uSVGpTdvYYxlUOgeO4dICz4PT5Z8riGee9qifnvYU4KD+d8OS/DuhKwQ4/X9qXaxiEda8pqLcn8n2TNOxURl2KwlTd2HdqSKEdDJnDM2KCj9ifYYQqrfm2P6ZHYGpba1AGziAqqjBobNUdoXQ4VAixaUozKNsFh3MhA96E7/yu+DiY7WuePSu1R+eQLu/L8AtQVm9Q/S80HkTXuOUehF+jiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EarK3gaQsZmSyHO5NPk2G3HuzJO7wv8qHtXUpVHjUfA=;
 b=nFQu2qNTswgNVKKtkQkLcVeyph0rCPyEKY2y7a9itewg8aesbOA5IWef/OzQRf6n0UC3y4C6fUB2BImmk9flBzQqKQTEdFKzo/oeC9G/sWx/dyLy0pjGszOyHX/JPTgBb0+tQopZum+IztzmenfsbUI+7rww10LTjpIeCkN97fSZn9twW+xy2MHoxRdUPx+tCUeQx5x2XNisJ51bhMMCtjzMzw4HpJIS/Hx7G4AgVKOeStxuFzVnpgUNNwMT3tjKWA8YH71zIBhnaKCzTWchD2/9Sp38qe81H9xozDWH/GPX59dOoncjI9JPgy7jMJ6l00YlFAKxEfie4k0WSGOgbQ==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by VI2PR04MB10715.eurprd04.prod.outlook.com
 (2603:10a6:800:277::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:18:21 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 12:18:21 +0000
From: Josua Mayer <josua@solid-run.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Alexander Dahl <ada@thorsis.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Topic: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Index: AQHcx4bvr9BLL5JY8kGqWpBHUUp00bXVmRmAgAD72ACAAA/vAIAAAfkA
Date: Thu, 9 Apr 2026 12:18:21 +0000
Message-ID: <55ce3f91-2d23-487c-8632-7fa4f48e7037@solid-run.com>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
 <3024c143-520e-49ea-af17-33344ebf7149@lunn.ch>
 <db41d119-2469-4107-94b5-b09e9bbbe9ec@solid-run.com>
 <aef0a8db-7a16-4620-87dc-d517be946cab@lunn.ch>
In-Reply-To: <aef0a8db-7a16-4620-87dc-d517be946cab@lunn.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|VI2PR04MB10715:EE_|DU2PEPF00028D0E:EE_|DB9PR04MB11533:EE_
X-MS-Office365-Filtering-Correlation-Id: a20bebff-1848-4e4b-81f8-08de96321b79
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 NZIsSPJZgbE7t3jHUe7nyQqIJ7MfrzwotAlQYPDGCBAMUg3wNy0KM8XKmFLz2hx5SMOCKjDVJZNNncj5tGt5wp9DL9kG3St2DT6dBOKZFv6HdmUXgeIkXXrh3RTJftpS+OOT1EJ+51Fj+DY7+vFyjVL9oOU3rN3opEgkmnU455+QMZoyPr10iJp9G3qlSF3jyVHTbsrz3PVg6a/odBSmDMT80Hkk7W14agdZtXCfFcFCmxPXT/wYvxANFJPYKxFfoK5eGp3XINa706qQcJqm8HtffrU9rfxkSLwCFbZ4WT2MO8yrGJil+qapH6SUSG+u3TQXexHizTW9VBLyrGhHd4C7cHsBDvbAIRpgvFoZxdw3X/SEaqHoP7UUVi9jZ5/qHs1njZkeQMX8alReqIXb8HiaNOygiWwezbPKCNRG2t0OgW9xdqigkFI7cwA1N6WZfi8Wz0BKBIURsblRzPmQq9e2E8oxAuOyH4kk97TxtrfmWUPMJuJBHdXdQhpVAcjxkPovILQbpktxTokfMHbwbmK4vYg6OAlWkcKuYsvGlhJI0DcMHp/aqfV4mF/x48BkDd1ZK4bSjKJN13YbyTEj2+O68YLR5NovtEW5a/F1fV9pEu4erO9CSr+8DUwCs88Z5fZoq1VB15wEhhBiFcqwdNNvNAJVR7djq/an0cyJrQMY9X3KNFAjJRY2mf4TFmvmVmzlqOWi0u/XNrAKUMKLkYBwelOYkYWAJyi5xFxCHLAKkUXa8RFeUMQcqZNcX0EWKUo8EqI2VK4C1FtxoPsIQnOAGJmW5SLTTxmHAZXcRC4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <898E832E5AFE0842A2943F7885065F3E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Ze+McMMv08PZJnqiYLc5Wx856OmTUF46GBbhE+6DWKArKmpv9XrBeD+Ipbpa/ddXhZgiQsdqb7sTMZtr2yKR0EGkPPImy3C7BBO0jYv3GvnSA/V0T5xbpmDGpZ5dshvbRf01B3uz2TdBl75twLE5JjfyUTmNd7JAS1fmo3XAWxWROhYOhAjDm0fog9IGxFH3VtHbmBVmXc0QscSlrFZH/BODUi6xXj5GdyN+TalZVgGeOBOAxcf6Rs6SaC2yoYxYB1qyAkYtoZrbRkLKqbYGMJVbOvZmu/F0G+dsJwyW16BHmPmlBzvDS2owxE6ASwufCHadQFSjxjkWcQWVTZr5bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10715
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2bde9af46feb4d19bcd1cc5233beb90e:solidrun,office365_emails,sent,inline:2285a98fcd56ade5fc8fbf84c7fc6173
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	831e1946-acfc-4b46-d231-08de9632170f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|7416014|1800799024|36860700016|14060799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	017TkOaUCbdu6K3IIrXgkcvQooBy+uvjZ214JnYGU/W3tyVDNrNfZ+uRNHirHl4iVe2QT6OxGSwmsRRNqXRvYAl5flUMUb/1IcWcNbnWjGyWOfvFg55+uZfybU1iIaLep+JQHE3Ttp/IRXhDplnwnahmm3tMaQINpKLTbaEM6/Gzyux7VkW2DMSJQqekHAp3DETVZmdLcIiIcceEdNEzwi12S7b4MUmXX44PYShzGes7MHRaNFX46905/aqh14h28GshbomRfPtx8wecokZp1TrZ/C4zMbF+Z1XoqyJ0haYfPq8W2MZJ8iY8ZDM2OnZQ9mbYhWa4q0MYRRfv2bkJnCIMVyT4rlBr8vRiv2APcMdIKe3A9Ed7Togv/oLDaENvTZ0nkH/Nk/7OUo1F0TgMTB3s/CEcZmO3tgdU1tpqyI4wZ7IdJflw+0AHfjze58sWqHuLN1rMVvU954uq7qYvQd4QzVeVZNvwYPcna00HnSTZ4+fDfWHAoaEo483u7KangoIWFxsNzmMOkpNLmlK+ekQflFAYJbgReCJOnHuEq7fVSpS3x2joQHJTP5ZxDzfx0lKgYin68VQ+bIB1sWthjwrPyneIdrZYwmATiI0z1jS4pSmFScN1Up/8IAuydwv6FPuivoWfHrGRFlBT8R0jpUH4NApTPTjE4OAT5GYIbRJFSyPoF4xZvwkE3fmzrqX6omxagedOg+42rPQkNvEyrUFOd+R+NqdYN0zNDFdpFIbGsDfc9X2RVjP3As+pewZCUIdxHqLijdK7OwF/VfcZmA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(7416014)(1800799024)(36860700016)(14060799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DYcbAhWVGdGRoOZCHxnc0G/E4+ya+xGPRqTKFzMd1lV6qJg36sp+ulwD1LpvZu6yPjuY4lA/udvX3r5U10bnAhPFGDIWv9lfzdemN/j7nyg+Lmh2XAk6AfTzyv+56uhkwyxe5/It1+1DUSdJw/VEnZW/f2zCCD0W9AZHW+xVUbXRORgMuND7NWbD9064jCpneAxkKk3ayA49TBjXvBmmDoKyHZaw/8Yiu9Rkq2iXqsEdnFs8OZdF5q44aCxtXRZL01PW6kbcmlxxJo6bDAryv0tw10joRlMZFaDaR46g2CrbwbCeFggEg+LKSsybwz1Xnh6+Gelqra3PjZRuLfYKjyNCtLi/1bUSTBjG+mnizBmFDMWxD/YRLsBKbGNgUErYuWvHauf81o5J426iY5ShgEhLDeeoXfkGmNZLwbDj3Ds8X4gz5/B9gykx/eeJZu0F
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:18:28.6236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20bebff-1848-4e4b-81f8-08de96321b79
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11533

QW0gMDkuMDQuMjYgdW0gMTQ6MTEgc2NocmllYiBBbmRyZXcgTHVubjoNCg0KPj4gV291bGQgaXQg
YmUgY29ycmVjdCB0byBjaGFuZ2UgcGh5LW1vZGUgb24gdGhlIG1hYyB0byAicmdtaWkiLA0KPj4g
YW5kIGxlYXZlIHN3aXRjaCBwb3J0IGFzIGlzPw0KPiBZZXMsIHRoYXQgaXMgTy5LLiBQbGVhc2Ug
YWRkIGEgY29tbWVudCwgc2F5IHRoYXQgdGhlIHN3aXRjaCBpcw0KPiBwcm92aWRpbmcgdGhlIGRl
bGF5Lg0KVGhhbmtzIQ==

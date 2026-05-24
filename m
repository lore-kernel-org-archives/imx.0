Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021104.outbound.protection.outlook.com [52.101.70.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB967399CF2
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.104
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634501; cv=fail; b=YA82zQ4qntSajM1m3cqd8yMaGcI1khClAMogH6/UotKsk0P6jW4/6eTzpR3psqW8idt/aF5EEZh/+noNTRxjm+CLUzxfUz0i38ert+vmGfwKLrf8yCjimdOxp0pE1TxI4/I0YIwXEPsdwwo1Lznr09GFhzjhx7DhKOWMwuHgHUU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634501; c=relaxed/simple;
	bh=AMNcdnI6pJROjjJwkPLLGQS4pZVKWZAHuYqoqK4+/1w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cQprCrzWzwUQ3x+OfnDCWg8D3aq9OSr79J0poIm/h6c6aZJ0TaTOZozOuRvK6w5vmX2+S/0R6bB0Ad9A/yvdTyzY0YaeUCUixlHUAWgJpMsYW6NHWSDVSTHaIBx7YZBmqEeacjKK4SJP8BE/OJv4s0zAL7r+TBDnGHzlOSxph7U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=K6Asp2pG; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=K6Asp2pG; arc=fail smtp.client-ip=52.101.70.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="K6Asp2pG";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="K6Asp2pG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=l0t8Sn6Kz7saeztQU7sXcibisHFvnCucNxA7rDhfM1dSlGax4rWkFYBq95rqi2+7bBfoo1fTG1dDpVtrjB3qmJoSOD3GjjpLaSRzhFuCYXtY8GuRvUOlZV7QCBaN/O6m5z3KTSmORp7SbN+DONUB3jGJircxiwUjrt+Eu3Svr7n7nPvTn27PSTNnpScgL6MR5JnIcFJAcf0KG1/V8UtCtklASmHw2nJU2g/ZKRXQwQpfhdP0xpRx3ddHqt9GlmK/wQ+69v0WgYWdnwVxxGEWzJs3sekrEar/PB2MMuyEZdSZOjZCpDwRoEoH+h/2FL31dA9e90luft8TEzWx9+kuMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gprh1GDnDl7ytRTgXZ7EYdxlV7NY+WCBtJ0qF7fNMpI=;
 b=cZhCEDSM9XRxuPTYFbgWkzdByrcKTo4AL8uWik8/brZS7TidvWD1OiOK52ewX4h49HzreNQzP1cU8szT42aY0lHU1Hl+XiD6QxKK+b/RpA0fexB5J8ZEJs3DVHQQ5aq+G12SN3RutkmmAP4TJUjCuRDl/N4Dz5NGvOMEEPSLAP6ydU9hh3lHi5HEFi8lGrwFgRBMIBs495R/373hdCuDU+SAEwUS0h3d4/62pMH4lNfen+CW2yvstGuzMx1+R1QbgQJp59/PbgubVyXMyEE4L9wLnt9YJ72qNc+EmeMGz9KZ63BDFMBkgAuUVgmfGTSYjhBQ3WkJmBkQjU5+WlHn9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gprh1GDnDl7ytRTgXZ7EYdxlV7NY+WCBtJ0qF7fNMpI=;
 b=K6Asp2pGQrdUu9EEZ7GAiVnHTko/Jp+Gy9NlKCy+c8INn6DOsriDj0uE3ypPyn+qLq6snOf/YL/Ac/VUsIw9VYOuEwvXkRT215jsxZWgDI5QkIh5Ootpe3C+4bay07z1vpH08HAIuKZdTL5GKsDNUzArMEA9WtVcj8JLeF03nD0pxyGmUXeOb1jJLEE/bozNJSEgqui2Y42RA8UG+/qAv88weh9OFydUolvlm6rz4VO12uwLPs8bXuWk7d13PWsny0V/R04ZoWRHQm038lrcPVQiOVB2+jlN6II9AvdsePXmHLkoFm6o2nKr9FcEyMwoKqHAesFoAXR8mJWj+1fUeQ==
Received: from DB8PR06CA0057.eurprd06.prod.outlook.com (2603:10a6:10:120::31)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:55 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::2e) by DB8PR06CA0057.outlook.office365.com
 (2603:10a6:10:120::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:55 +0000
Received: from emails-1172150-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 77D1F7FE52;
	Sun, 24 May 2026 14:54:55 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:49 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFLj6KPowEbd+gnVC+Tz2hDUBWP4B32vA23aPFGWZXe5crQtO+9a1erDjtZ4qDjXVa89AsetCpCExg+aVI72+DDXCXd98JpFoXGLNc6Bv7z4W4GiFiEwgdjQzj6N3atoMh926XtD7GunzMPSxJs5zk+DF5yUGgtUCqmSeq6NYD8JvNtZFKfpbXs2on1MX9g1/7kbF/vlYM5gyh1SVrS6WyDJOS7IlrDS98/J2KWJu5tJRt1xPjYOzI5zUq84Mvf1V/ptv+kwj+D3RpjudipUrpzXbP/1EZx6lxBbNEMxco0ilYt9v9L4Zp9PE9K+lZSZ7hpA0LOmLP5frVScTmGZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gprh1GDnDl7ytRTgXZ7EYdxlV7NY+WCBtJ0qF7fNMpI=;
 b=GaPP2if3nA6sZaxX9bVPag2R+IB0ZQ2vHg6GIcnt+uiPmQKjHwaUL4px0oEbNCEHbpSTnxCXAzjSBHl6tMXLgSE6fzzxu3YCzFG8NB/Tarzo84sYWuzJcMqyz1DWuVKhIdZtjSaTJGhcnS4uDcbC57Y9/S1gVu2jXvb7MIz+bcYGeSzrcjJiD3iH3dUoeuAzq7AjUqQ06is8O1ZW7+XbXMufCk4wEt+LOV5t0TT5Nw6VHbCNZFoAiI4+iOoU+980IxnC0t9fjyTpdELq4QUM3kDzwIQ1x9PLk6Cr+oe8kA5XzVU1vaasApObIcP0DXhgCyC/UejytOQR6uZu1Ai/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gprh1GDnDl7ytRTgXZ7EYdxlV7NY+WCBtJ0qF7fNMpI=;
 b=K6Asp2pGQrdUu9EEZ7GAiVnHTko/Jp+Gy9NlKCy+c8INn6DOsriDj0uE3ypPyn+qLq6snOf/YL/Ac/VUsIw9VYOuEwvXkRT215jsxZWgDI5QkIh5Ootpe3C+4bay07z1vpH08HAIuKZdTL5GKsDNUzArMEA9WtVcj8JLeF03nD0pxyGmUXeOb1jJLEE/bozNJSEgqui2Y42RA8UG+/qAv88weh9OFydUolvlm6rz4VO12uwLPs8bXuWk7d13PWsny0V/R04ZoWRHQm038lrcPVQiOVB2+jlN6II9AvdsePXmHLkoFm6o2nKr9FcEyMwoKqHAesFoAXR8mJWj+1fUeQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:46 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:46 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:44 +0200
Subject: [PATCH v7 5/9] dt-bindings: arm: fsl: Add solidrun lx2160a twins
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-5-09370c23b952@solid-run.com>
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
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|DB5PEPF00014B92:EE_|AS8PR04MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: fd51d332-10d8-488b-f818-08deb9a46b1e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 2rQHGNAlqN3arG6+AwmBQKnG5X1QqupoRwTACFKE37/5ZdWkdRSKoo++II25XnOpbhqUolELItCWCp7gbI2kku+FBSQxi1fQjK7Mz13jTOxtKrzOxq8epoxVkiKQ9k7eogEm7LROO85syDcTTXJVqzUkG8l75Gpq1As8vH5E+tt42c8myU0AcUe1pN+pgjV6GfvrUrTp6JL2kN9stmSiR1X3LE4P/i199dllF8B0iluswIlvKNGonjrk8Fu2B897YS54j74OplHw6TaLs/TMuRx+K8tyaImtxVXlK9dzxrwPe6dds8WL0hMmM+uOzMbLFd0M/4pcmYZoxWDlDY2Zyz66ca9pebqDHlWI/pdnIwifipqn6KzSFSX0pIwYOePNEZ3F2ngOiiBXKXgJ8dNeDmjiHZUls9sI7ukm8l50m32OQg4z2ieAHGbdgDqbu6cpxqUOAYUCZqoK6HLUMXN2Znxp+FBqTxdtrgKo/EEJmNbQK5gxBJLf8Z4atmvZCPlOxZK0qsW85iNYhKOHdUXCBKGaSjrkm3cVPiC5xK7sH4NVtPRbMikq9e45YYudB1dLL5aIVfBpyNL5ztFAegRx/W3gDXQ5EaLWnh4eLrRoNFtQ3Lf8LTeByj9R04/iKDefXUsUWIn2QbPpmO/AWNZ9pku4nfgt5xytVVXtEXaiQkUWxDXuTfYHA181f3wJCJoxBea5PkBofTryblTYky2L0O/j362taGF5+muZfUIUOe12AymShWfoDQVO0RHRaPLJsjgEpNPipI8LoM3Qg+r46g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 lHSVaHeuG8jhZEYm4XZub1AdO0kJ35uotx/tkCCtcpH8DCAL8lNKNpTPW3/krKL1xdQghwEhMT4VFJWw+bXtNAUU8k/xCcrCl3F7P6uiuengsewgibLcPuZGotZeNBG4cWJRaYvAn8Dwdn0+fTPDrt6SAv4PLQvWovTDV6gMGQqJj8BYKoTqVpkp9YtLSchJvgmpxiQTC+IIgpGihT3lFw0b/KpWSpM9MGy0iD8N7HWrRZM8oSo8WOlboHHh3aV6pgYw1XRmgOanJTmQACX3dPdoah+2h8lC3UtfygDKYm1+cKAk9W64jsHuR93Y4SURn+mZSGnvjk5NzqUrKzkz/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b68f84a3f75548bb83d7f5798617958f:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	291354ab-0db2-4a53-edb4-08deb9a465a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|14060799003|1800799024|82310400026|35042699022|22082099003|56012099003|18002099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	hEdXOH+bXeDPXCu/Icc9vNh1NbjHn6L0Oez8/K9pWXJXR67kgriYD5xcofncbOUv852HzZS8YDjg8yRbgjEHino4fV7venTXGtcHevHo8vwuVLjsEMq1sBqt2fJCPPULMSlvbhHMdhXcKYfEkOomY/pbbPVYAE01QWVj9UmICoz3DC7lLy9GrjpgZ15B/P1lQfKINb6shQE++p06UHzoOW1RszgVZFUXoDOZXVZdK9JLeI0Bwi6pk/AlYoC/26E/5MthYMwmjeBl2MSDwdEdGgHLjBoiP+LcSVr6Rn3OegV5/VndVvSCHPvvK4HJ/NE0Ik5LLzaa7+CIOalwCyxr+ePe77kj0KaRGKhYP58C8yXXC8om+sCp7evmuvR44QIxZQeDe94PONMddYlv5cRqi43KNn3fQIZWEfvPLP8PaoQv/sn3hate7UCQvomYdmAL3GyAs1jUAqlnFxu5Ijspxa+FrXFTsNO83Ane8UEUZzp5XYoQQsS4j/bVlD6wxPJEBD74/VJTbbN5BItegxVeHLDY2ZS6w+8SxlqTP6uFILIyr/luQAuXc3h2P6HGIRKigeRHV66iBwfWlc+I2YWouj64L9pxhDsYo/W3n8AjHfw41Zzja6eKHuIGyJMx7QQawiX1mLll1LGfqtn+W0KMhVQaHxdM1zGPaF2ma8o5W/kQHKRBCYOHpkf6TrmvVshK+KPGYeCaveswWCXXkIWvTgS2pPdS6dkbzrYs06S0wmupUaA3/HA/w1g+uFLxGEazu0MjE6q31J15L5B7y/n/FQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(14060799003)(1800799024)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HTRZ8qW+4UZUzAB62EYM9E/bnrFSFp/dBMH5IoEhhlRp8VN7yAV8fQGQal3T4wcFLsBlHkQUSQf0tcnagMkacpdFwFjHVHKDx3GWQ5hJnsAQYzCwIWEQMVTeBtElT3JJPFd6x+1cu5BeXWz1rRmoVr90Bi5b/S7Q1DkxWd+FI4BjPqjFLdDX8BQco2fF8VSLnRhALzKpwHRgaGwpM3s7eVdmC3YUxBauP3nCIeHAoFvQuhbSJjVMOd92Owq3BSaAsebZxXoxy9SO/hP16V68B1eziPQ/NH3qkOJ+c4lNbEqAiO80yEDLxn3/QeXQ3AWbPndlnAq6uBXu1hTX+NSL0A664nMJxXimZ/aZk40MpBhHDFZ88ShbifTm88YLxtPrvpO7CvtuHkhqW2svPG6uHZUrUrG5x0xgOI7Pv41zVuK0IF5syrJboE22MqtUBR1a
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:55.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd51d332-10d8-488b-f818-08deb9a46b1e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

The SolidRun LX2160A Twins board supports two configurations, one with
with a single CEX-7 module, and one with two (dual).

The single configuration is a specific assembly that maximises
connectivity for single cpu by routing some second cpu resources to the
first via zero-Ohm resistors.

The dual configuration was not yet tested and is intentionally omitted.

Initial review strongly suggests that the dual configuration will have
different bindings, because from either cpu point of view the board
appears different (e.g. different number of sfp, fewer i2c gpio).

Add binding for the single variant only.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0023cd1268075..1f11c1208c248 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1868,6 +1868,7 @@ properties:
           - enum:
               - solidrun,clearfog-cx
               - solidrun,honeycomb
+              - solidrun,twins-single
           - const: solidrun,lx2160a-cex7
           - const: fsl,lx2160a
 

-- 
2.51.0


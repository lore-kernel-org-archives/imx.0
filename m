Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021123.outbound.protection.outlook.com [52.101.70.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F442F39C7
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.123
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634499; cv=fail; b=uREzHAbH+mHxM4jtRx1VTsOAnj8myGmEVlJShq7nJJCqj746L2xejtvjS5gDUvhzsTJMVL2rxUvU0WfNrKCJdy7rjXDkKoHUqqVY6GeeIkQXcIwWIaMWMwiXhUNC+nB0434d5vne3uOL3cGxuZfhzP8D99C1pbGq/ebeOEHtBhM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634499; c=relaxed/simple;
	bh=d3UyMb0ISePfXhDi/p5Ipx3jvN4PpH3c0PpTeNDOcso=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EMhYNwzB9BaSk0ltXn645kKQ5Ycco66NkH6sZPkZkXY6dWbqVDFvrISxMS5b70QjAyArUY9Oab72Kb5fhKcS+MeC0IKTAVjLM8R86aNOoE+A+kPcFnyUa4S9mCPmbpr5k3Xi/VoBPufSjbYAGUCDAKD1IKXLmfJWIyj0LmoK2T0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Jel1oI0v; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Jel1oI0v; arc=fail smtp.client-ip=52.101.70.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Jel1oI0v";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Jel1oI0v"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=el+ZdAgb9NR14ZMmadLpHAeq9cOrkaKZttlyQS7denaIl6/43/KE5d6cWiRsYLeWSsii9qF8p+oT6soYCpYt0P2z65GsftKpjFcIWSFuxIUtBkF5wpJ+rpmAGEzAnSpe/P4bzrCi8TIcmM7AUyRAoqPPl7i15ZGh5bwwhsYFuNcJ2UlOhFjoQY7I69JwIvgYXaulLkv7oB512MVk+SCTpNEf9REGBkWFZSOGrbdlwehgpwynoBBtNnmTpJuX3mZXxj7nga1WGHNN0XgCVO47t4QgSG1uXKOU60B3aH3OHVkg8qmb/MZ9XIJoAD4pTfjQaR6oQEqbTl74ww3+TYR2Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/BRVWfoK1uONQTzfqxWWnxxIngk4qr4VaqnRXdJCbQ=;
 b=dKtcChkSAyCh8xWCxyovCG1pDj1vjixM6SwfExEIz8n6Ccx27O5tR69HfcpQEntScUHrrCJFNLTz3zal/K67gLO+zKKhyD5MKVUNFeexfS2/SAUGkHteri/DpddGk+/tyvL6YOnJXZv947r3eowvLrQ/m7V7z9X/7HqEFEMf1goCKwjl4ZpfwSigF6QZiGssjVGna1d9LGfNpIXE+F/lVqfgJIrpZRUjQT3eL9UUBOYX8iIZBnRUgNWKVLLFBvv6/uIAXO3VIGzH8dOrpbPVHvQkT9Lc/ObtRh1X+scHLJqjdGuJS1WfCto/QGymXp7z+35xgUhrbRMR0IgZA/m9hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/BRVWfoK1uONQTzfqxWWnxxIngk4qr4VaqnRXdJCbQ=;
 b=Jel1oI0vkNneBz9ffnL9Pkruoj9UX50QNIrPb8nBOn4x7ywvy1IUEUskpk0YOkZm9ZhCusaXHQg++TGbaOnuPc+3rrFzSxV3lirVUS03f7RrJ83jWztGu0PQkLbWESuypbZtx5gsafDJcHLllToqCuFM/rnAKKlPqJy7bGbOv0vDeZjjMyUhKFQ4UEcRr0IHpAn1xe6Gj8JbM4pHodAoYg/BoJevNVBCveMvG5JBkGGpXtJrGoJ2fYHy5GFgyUu0pHedwTT7F/c/w5gkpmB8YjYxahvhYX3rGpumdBlwiJoPgToBr2vAAfz6CaQlBOSwnjEhNbp12GRB3YPh5/rnCA==
Received: from DUZP191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::20)
 by AS8PR04MB7702.eurprd04.prod.outlook.com (2603:10a6:20b:23f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:51 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::a7) by DUZP191CA0041.outlook.office365.com
 (2603:10a6:10:4f8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:51 +0000
Received: from emails-3355260-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 07B747FE53;
	Sun, 24 May 2026 14:54:51 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:44 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR4B8/FsS0MsacCghpnWVQYY463cWfGw3g248vWRUbeEB/8xyqC+jiG31+plE/ntpK7NafUEx2yceSDMWp8IHEphETAsPRB9dGibKTBBHjThh9UOFedjfTq88pVzUDzBRQS+Pb57S4cdtwPRV8aczaTGDPisAZigZuD+1qLwy4JUyIU756E6TLc6xuIf3HAkU0+1D4+O2S01RriUad+9mT7JfYZ4CZOcQI2G7K+T33JwBXue1FDPXGYGPHiKW7GFM5PaG3ssdZLsGa6qXpEEQJjEd8RAgTtfgMm0MtxAG0Vj4rl3prTI3uBWb87L9X7l6nlXme44Pw45ax/A40IVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/BRVWfoK1uONQTzfqxWWnxxIngk4qr4VaqnRXdJCbQ=;
 b=X70LN8qyTiAg8Z6FlsZ/Ma2hCTwO3JZFHkVYurcCmLeNtnbHIQMRkFhUhOQrNh2FnNyDPpjDD46FApWFSuoYffmEErgdqXL+G1BcCb+WptVIO8T+Pwh4FmHeI00+8TlnOq4UR0qFL8qwZuc2CuOpUHpdZA00x/ZURW6sa3jXs0z+QHpfXSixKbUS0Jw1o7IMiBezIyme78X7/tAtGrX6/lv+TLA1p81637A0hTgqIMyfQ7VZ6d0fj1WgP8uQvgps76/TuOh+OTDD49iBjTGDU8dHThsczi/itUnQqgzQtUdbVoKDJ88lmgJpB7h9kbd3kM8qJK9bxRUN3eaNTNusug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/BRVWfoK1uONQTzfqxWWnxxIngk4qr4VaqnRXdJCbQ=;
 b=Jel1oI0vkNneBz9ffnL9Pkruoj9UX50QNIrPb8nBOn4x7ywvy1IUEUskpk0YOkZm9ZhCusaXHQg++TGbaOnuPc+3rrFzSxV3lirVUS03f7RrJ83jWztGu0PQkLbWESuypbZtx5gsafDJcHLllToqCuFM/rnAKKlPqJy7bGbOv0vDeZjjMyUhKFQ4UEcRr0IHpAn1xe6Gj8JbM4pHodAoYg/BoJevNVBCveMvG5JBkGGpXtJrGoJ2fYHy5GFgyUu0pHedwTT7F/c/w5gkpmB8YjYxahvhYX3rGpumdBlwiJoPgToBr2vAAfz6CaQlBOSwnjEhNbp12GRB3YPh5/rnCA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:43 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:43 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:40 +0200
Subject: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
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
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|DU6PEPF0000A7E0:EE_|AS8PR04MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf7fa2a-8841-4a03-8c96-08deb9a46879
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 VURMF8I5UmEzEUQURdfrnsB6W2yNG4vWb3GmnBD5oC0TeE1UfMgsvKl+18CKaPs75h1080EEQ+HQ1WGxvq9P2fWzOu3RZnq52YEBOiZbVeClNpUZ30cojOFlulL+YeZB6plZ3HEfWuICqY9uWpvgTU+HAh451EBUxcyzSRsFwmgdPsESwxhg0FByTPxaV2888nKXDtQEQdB3l5+Yxl16VCeNPW/k3Ra/0cvFXnNOv1mkl9teetTU6JI+Jwa+5x+BVT3MYnz53DdP/6HB8PXz4+U8A4fourkRPYXt68fHzI+AurCk2XBLxYSEquh7JIfpBN0EV+RqY9gKo7xPT5m1OAmr1TJsdESwIbQ2WWlhHSRAW6pSA1EvDkM50X3xDAWkYu/d0eHBeyvIhWU4ZLPrHhc86jQfLfJ0GLYgtxLBUlevyTCKM//2fPaZ4O44ksuuwiGk/YDfcr+MlHEcLjD/VovPNXLnn0f5YZ9MD4zB6GjlQIPwCSrlZNAZDeDYkQ1zqfOpRoGF8EeDQhP5Mmq8Llc5mztG1xWvyNIWnn4UVg1ozav7e28StEkf/r2kjG70w6AT5TymoqzU9px468CCi+timG/8kAISOfdyNvxYQTDM/yOYqAp8ayLA4ESkkBXyS4FGsVOGCKgiamX78E2SRIuIdfvcAJuDuaHJWx1MWbIXQniALErjSYX2guDLU7rnEC3V3EjCkG9QF6S5bADDR9mJFpJSTchB9ljTdB6tB1hHGlltSNebv7PEfyl8ntYjUcexADuQL0Z4MPSmWVSv9A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 guvh9mnoPZxDJXmJf8/fzIQStPTvUM239ZGW/FxbX1cSC0jUZlU6bDsKJowoHcpHhiVmAswnIMMj0VVD1iy2f3+v+Mhy42T0s15kwaFMN9jd2K+dT88vt9qp3XSjJEVyykaKb+tn7CkATmo09lovw3ipuYPUWkigD1seM98XQoHKiYu9qAkALwisGS3zeLzctr78Hy7/rHEVui5kbSbn/UmnyH/kPgNMMc0qhtlWZQOusZUwmWKLswIhUHk/b4oi4yHIDQSCwo79nC4WqSAd4sugFBWldtSO/7q/s9LntDLoNFBMX0p2dzazeeeECo30tybvMqwYd+Qe4qUT+Pfphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ead49c00886f4b2080ed7573f0e1dde8:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0205c02-462a-4883-ee48-08deb9a46399
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|82310400026|36860700016|14060799003|7416014|376014|921020|18002099003|56012099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jP33bORl8EIFTcwiisONrmMTBKQusdaxgO5HIvcbnylL2JGC79sO6r5Zg88APpjIHDcn/N2nVWeNPxBbOQuFqr76Wnz+TmjKIgZ8xJ9m/oYYh6HLayB56yLgRTieq6QVGfx7C9AaP4xuSH/ne2OqVEkEdzOBzx1ZZrASAZbYjMNfYSg6JlkR14v8cFBVMjiBU/uiEuc7ISsgW1nKc/OgcTncObtDNBT7GPAiqqeSVgHmwmQat1uEtwniy/mKOS1jflNz/mIM9D+OFBKBTLYKKokCuCc+pixLxEcj+5xxCdKlkacTtFDEIIMcm9PrSc4Y781jZeTPwZWGs8vMEhpemT5lJhZp3OtoSGjuWhIgtqXEN6J2q0Cfflg5zCS1k5Iyxpbp/FXF2IvKKpoQ0jiCZ+xWBLM9bLN6NRhwljl/DYYQ4Xna7nakH+jYyerXLTECJLGeYo70qVNGb77SYh8JBJNw1nLGN7G8sE1x49VFSJMe8l4Xf/en5yv0O7RS3fTUrjOewcTfB63ntUxp1PiqmIPYPVVJVh1xVyEMu3ZCI8pT1dx/I97mFidM8AscjtnWnZPJSoaCezkU8bVMTxPf7igprbompdcXqzd6zR+bLypeWIzx2ve+pyKqsWs/EjOcb8H+mvGPEcM0VR6vsOY6ioRV0uokGpKpRewsQcG8Q7yd6r3ZI8GCyapNxoPJs8KFIrEsuMzljceaPXOXP8ZyLYAZci1f4cleepJ69yTVpJ/6QQQK0/533eRp/Kaz7hODh2IVVY2gMkVeOjyBuNlOog==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(82310400026)(36860700016)(14060799003)(7416014)(376014)(921020)(18002099003)(56012099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KR4rnN90nwR6WTycarGFlECrv70NO/CwOg0vq2AERXLmCyYrJ5Sq2uVV3KgSR4arOmwkUrJ5/TTE4GYkzTpD1ouH1g8E1AfmdAQrVKX2pCh1qzc1DyPts6PVQRoqQA/PBGlTeibiP7xqobE2oZgpYPpxNkG1TnQLQsekrThkpdxZv2DHcwDn6HDLA/FX8n8zOB65EWX/VX+aKrzh7Tu1djrjtmtD822BAv4sMoaKBEPBWwzAV59jnXx/816wxOR7zmUGRdt8Ivz0OqLdlJKn/zX9gtA3rHUT5RSJvb6mrVX+qxnjz43pNqBKG2fZUKz2t3LWwn/CIMzfQa6Q4ldUQK2RvSSKmxtdxmSqMa8vU/cTORRxd8OMm2pNtLltznjohoXMqisGUAK3LrvoXQSdPh47ab1ozYTXc4QtYm5kp+QjvX9k2uUtd2tz+gVLcNKR
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:51.1338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf7fa2a-8841-4a03-8c96-08deb9a46879
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7702

LX2160 SoC pci-e controller supports 64-bit memory regions up to 16GB,
32-bit regions up to 3GB and 16-bit regions up to 64k.

For each pci-e controller:
- extend the existing 32-bit regions to 3GB size
- add 64-bit region
See [1] and [2] for boot messages showing ranges before and after.

On LX2160A Silicon revision 1, the pcie driver fails to program atu for
ranges larger than 4GB [3]. Therefore changes are limited to revision 2.

Similar memory allocation with similar flags was tested with UEFI and ACPI
on pcie3 and pcie5, on a variety of nxp vendor fork versions.

This patch was tested on Linux v7.1-rc1 and u-boot, with two pcie cards:
- pcie5: Radeon Pro WX2100
- pcie3: ADATA NVME

This fixes allocation of large, and 64-bit BARs as requested by many pci
cards - especially graphics processors or AI accelerators, e.g.:

[    2.941187] pci 0000:01:00.0: BAR 0: no space for [mem size 0x200000000 64bit pref]
[    2.948834] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x200000000 64bit pref]

[1] example of new allocations (pcie5):
[    1.182745] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.182760] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.182771] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.182778] layerscape-pcie 3800000.pcie:       IO 0xa000010000..0xa00001ffff -> 0x0000000000
[    1.183642] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.385429] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.385481] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.385484] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.385488] pci_bus 0001:00: root bus resource [mem 0xa400000000-0xa7ffffffff pref]
[    1.385491] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa0ffffffff] (bus address [0x40000000-0xffffffff])
[    1.385494] pci_bus 0001:00: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    1.385516] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.385538] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.385544] pci 0001:00:00.0:   bridge window [io  0x11000-0x11fff]
[    1.385548] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]
[    1.385605] pci 0001:00:00.0: supports D1 D2
[    1.385607] pci 0001:00:00.0: PME# supported from D0 D1 D2 D3hot
[    1.386778] pci 0001:01:00.0: [1002:6995] type 00 class 0x030000 PCIe Legacy Endpoint
[    1.387336] pci 0001:01:00.0: BAR 0 [mem 0xa040000000-0xa04fffffff 64bit pref]
[    1.387368] pci 0001:01:00.0: BAR 2 [mem 0xa050000000-0xa0501fffff 64bit pref]
[    1.387385] pci 0001:01:00.0: BAR 4 [io  0x11000-0x110ff]
[    1.387402] pci 0001:01:00.0: BAR 5 [mem 0xa050200000-0xa05023ffff]
[    1.387418] pci 0001:01:00.0: ROM [mem 0xa050240000-0xa05025ffff pref]
[    1.387493] pci 0001:01:00.0: enabling Extended Tags
[    1.388960] pci 0001:01:00.0: supports D1 D2

[2] example of previous allocations (pcie5):
[    1.716744] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724060] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa07fffffff -> 0x0040000000
[    1.733277] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.836220] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.842186] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.848883] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.854363] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa07fffffff] (bus address [0x40000000-0x7fffffff])
[    1.864892] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.872216] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.877438] pci 0001:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.883526] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]

[3] error programming atu beyond 4GB:
[    1.716762] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724080] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.732615] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.741142] layerscape-pcie 3800000.pcie:       IO 0xa010000000..0xa01000ffff -> 0x0000000000
[    1.750379] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.759089] layerscape-pcie 3800000.pcie: Failed to set MEM range [mem 0xa400000000-0xa7ffffffff flags 0x2200]
[    1.769089] layerscape-pcie 3800000.pcie: probe with driver layerscape-pcie failed with error -22

[4] pci bootloaderp atching related errors with IORESOURCE_MEM_64 flag:
[    0.967809] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    0.967830] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    0.967842] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    0.967849] layerscape-pcie 3800000.pcie:       IO 0xa000010000..0xa00001ffff -> 0x0000000000
[    1.169315] pci 0000:01:00.0: [8086:1572] type 00 class 0x020000 PCIe Endpoint
[    1.169733] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    1.169771] pci 0000:01:00.0: BAR 3 [mem 0x00000000-0x00007fff 64bit pref]
[    1.169796] pci 0000:01:00.0: ROM [mem 0x00000000-0x0007ffff pref]
[    1.173389] OF: /soc/pcie@3800000: no msi-map translation for id 0x100 on (null)
[    1.173515] OF: /soc/pcie@3800000: no iommu-map translation for id 0x100 on (null)

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi | 30 +++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
index f54005e37924b..db1ebee53f6f0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -14,8 +14,9 @@ &pcie1 {
 	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
+		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
 
 	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -30,8 +31,9 @@ &pcie2 {
 	       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
+		 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0xC3000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
 
 	interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -46,8 +48,9 @@ &pcie3 {
 	       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x90 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
+		 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0xC3000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
 
 	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -63,8 +66,9 @@ &pcie4 {
 	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x98 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
+		 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0xC3000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
 
 	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -79,8 +83,9 @@ &pcie5 {
 	       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0xa0 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
+		 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0xC3000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
 
 	interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -95,8 +100,9 @@ &pcie6 {
 	       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0xa8 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
+		 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0xC3000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
 
 	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";

-- 
2.51.0


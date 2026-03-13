Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023112.outbound.protection.outlook.com [40.107.162.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB634D398
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.112
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405094; cv=fail; b=T1T8eC17YehdrxEZLeW0fYKcvyYn0vOlblIehCGn+UlVPlz9AtfkYoQ0CrwsTTkTo79f1WH+Q8b5IRyg33GqO/vyYtDV3OrQoU6Wf3W0NeDmVNrxPk0h8tU6fLYvJ8wuLVJzZFLHUxfE7LGyNj3O9wjjG+IfMyiczruUw6sZxQU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405094; c=relaxed/simple;
	bh=TI3KA+5OduYZlUyu2mH1J9g0chbQ3qtR2H2EmtKOJrc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=kriGPlBez7wmb3gTgdZXWrvUG+yuBAimO5qkbxecfrAitQZKOQ31MEvEgbzRDboCrWOHpfTJiiMJcO5CqErPhuGqqPn0SyT2grc6T9PFRuiRPYDBskgZ/+Ggqdz9KUnikiBFIOA1aAOsZnL9VxJik4wAcSj1JQlhzk1WMwZDcJY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=TX5gzVz7; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=TX5gzVz7; arc=fail smtp.client-ip=40.107.162.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="TX5gzVz7";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="TX5gzVz7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Eyxm0sbH5i4WK3ltTD9Ig8pNecpRGFhRKNPxWBOQI76+V3fPef8bXQN9SKqRi7wZ1kXAS7l8ty9u85iwW+9njc/fwtzGVMQ0td/xD9JVrrGlMZjfJO2d6YqX2Q8HqccX+srVApV6NZEM6l/RypDiG7g27AHCqJiJiBjm7ETP/zeU4NN/voxyUkkIJfplwMb3YD/NB7zfwBwLel6gS9tPS6EMw2VvPJgSuSH8wjFH15f+kK57pUWPAlz7NDf/YRmjFLaQIcdn/pR55ZW6l/YUvssW0z3JtKM7WrtLFOKBYSA9ZY+nLOYn2ljCp3EdP2On9ITKmudNHJbJy8sMHQXgWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smh6CEKE/4YZhEDw07cfcMVizkAVTOCgutdPNq7x8Jk=;
 b=ddYOGFBlxLIOpNHFke8OchoxKBuPgubIiyp8f9d3IzoCvJn9HaS15OX4pnEjMg2j9nhB+Pey5YBkiVAeE7SfS5UV5h+okqec9Vg/0mTMT/x3W956Z1w+4LFXMzbXOU1K8k85sFHFoT0wsdwnhxjrnsgHmPrFznDoKQ24OGlwRXnp83MYzI3JuYnJ0J/3xqLc0NhaaS3exRX6CJv2qtD4Pw3JfNvYkwtdDjKfvxmMz8s3UeFbxNV3YA2wmqkDiCoN/w90F+/o+D6MZ4e2xDcFSjQPUZLs4te9X6/pwKpF1rgwkl20GqfxdA7J1Ft/MLmLoYuV6b2vrSXqVG4yC3ZwGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smh6CEKE/4YZhEDw07cfcMVizkAVTOCgutdPNq7x8Jk=;
 b=TX5gzVz7S1Z9SDaCTc2MNp3namCCY32EBab++GuQ9bpSyvI6YrmewtUFN3FjavU8UFRioyDsMXbGDUr8kNytVKCLmkEha8h6ebQgY2h0X5Wdzhqzm2BOpeSi+VXERFB+EwiirdH8MYK2G53gdhunq5MSsHt5RsiD00sfISgX1zw=
Received: from DB9PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:1db::34)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 12:31:14 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::29) by DB9PR06CA0029.outlook.office365.com
 (2603:10a6:10:1db::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Fri,
 13 Mar 2026 12:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 13 Mar 2026 12:31:28 +0000
Received: from emails-5055936-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2D64D8013B;
	Fri, 13 Mar 2026 12:31:28 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 12:31:18 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlM7fwpbF5FNXMM7y+w4QSN0y962A2McCBVTJVq7XV6fTekEie4BUz48T/ogiP4U+Ke4gNAbzsSZ3X2P3N8tYhPFzffuKITPk7E5Y8Re1lpt+hQlJqJE9qA1pS6qvwe6PCbVoQFrxV6KSJGI0lXjKbEvoWm2Hgv4cYh173x/QEXiPtKtYGrZVnLVpSZyeSrAv4fjXuNHvbWCG4yJV5PWb3L0Bvw80pZSpbJ722peqG1dkw4euxa5zn6Glrq3XF5WYxnkB1HcbCOZ2hM6EvnF/6DIKVnlCml9PNUZ7hvuoeLF8juibrrrbAaZ5W/ast7a5JJDJ8ZQQ/ml8EWdjDU5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smh6CEKE/4YZhEDw07cfcMVizkAVTOCgutdPNq7x8Jk=;
 b=v3Ef6Ck52OhHYGXVyfFnX2VQNm6k3XxKv5qyS/zQPLa3DUGnbtkrR3OdU3KiZ7xjJ516R3GPkZb5NtY05HqpjlLZuM3BshK+OqgwKmEkDYcchwJoTGITHr0L0itVP/dx7qWtaN8QOlAeMiJPK9XLj6v9/WR5zwkZ4G71UXPpdACjXBvMxEmK4N1A9SM4M55AsbPAJOkWUhOBIlY0ayPgVF125n9o5o+/YbhDZMlPQM/8f80c3b6n8FjEaAbtSfvGL6le0W39mgq9BzxHFkwSnG4qQAzWbMWY0MNChh9jCjOXivRQrcrhhDPTU08u/FPoW2xROXVw1Q6D4CI6hueKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smh6CEKE/4YZhEDw07cfcMVizkAVTOCgutdPNq7x8Jk=;
 b=TX5gzVz7S1Z9SDaCTc2MNp3namCCY32EBab++GuQ9bpSyvI6YrmewtUFN3FjavU8UFRioyDsMXbGDUr8kNytVKCLmkEha8h6ebQgY2h0X5Wdzhqzm2BOpeSi+VXERFB+EwiirdH8MYK2G53gdhunq5MSsHt5RsiD00sfISgX1zw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 12:31:09 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 12:31:01 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v10 0/4] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Fri, 13 Mar 2026 14:30:56 +0200
Message-Id: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIADtGkC/6XSwWrDMAwG4FcpPs/DkmLH3mnvMXaIE3k1rE1Ju
 tBR8u5TCiVlzk47SqBP4kdXNfKQeVQvu6saeMpj7o9SgHnaqXbfHD9Y504aCg1aMOh0Plz84aT
 3Uefcn7VFGw1F5sahkqHTwClfbuLbu9T7PJ774fu2YIKle6fq39QE2mjnKXlHtvbgX8f+M3d6+
 Do+t/1BLdyEKwGmJFCIziNRx10IgbcIeiCgJEiImKCp2mRT4zeJaiXQQEFUQlgSoXMtQkxbhL0
 TzsAGYZcryIWIbFpTbxLu/0T9QIAviFoITpKSAwh/ZOEfCCwJL0RwlWtI0mpTtUWElcDyxaYgR
 GWJkCxzpIKY5/kH03W0C8kCAAA=
X-Change-ID: 20251026-imx8mp-hb-iiot-525b03beea62
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TL2P290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::9)
 To PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PR3PR04MB7467:EE_|DB1PEPF000509FF:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2cb7f5-3774-4a82-12f0-08de80fc7301
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 YBba2DCaRI37BucirzxLMYow1CNDGWjGSgDU5wEOaVOZ4BFKpB5B4nVu0P9OYiTFFKnmqTLam0MjWlX1s3cD0HLbKMUYcnSQeFL1v1qw6NowDMnL8B4cUXohyOrmDnFzikkunV7A5/wt4gNaOMSwphlLH+iMBHuT9X+pug+g1IL/qC4pa3IIk1PbX1wkyl0/gNizWy/p4kwLGwdz4PnYqiH4nsWL5PeJ//bHNACc/7Jgt/VGcnEkoRnQKNazQBiSSNu9kAzd7Q8dJvCdTsRgiEZmDgICNupQeEwC3pIPuWG4KBWo3mDs8rlWQ+n4Tqg/cpnNhcR/CA86PCDowaLwaV7bAueRQ9DgfM6IfdVyxRk16FwF5GEKTBqrzX66gz3s2AA1AFTwzVVIQFw+choeLdBoxGNVBu6lH+03w6tbn8pylE503Dzkb4UUc3rZGVFpridXWuyuFih4ToMV7+f327iE5/PwkO7VbAd4aXZc2JQl2NP1yY/Hd3BNWInusu/gHLJ0GYB58dd+6elg+WPEGJGLDxqiC8uncrEsPRpoetGYNV0rnC4OxdwEwKoGIdo5u06EjcvmHWscFoBpzr+9wgQ02q2x63IuKhQcztuKV/ufX/RYOMBD/v9YBD0P4nRSTGi2h647spYqN3mcUtAKkLDZ7WPkypqKxWV4jcxLpMQOhT26xwg57DFGDxhz3ZA5jclIifyhISsXtD9sOZy5lJ4vxHxQ4BjoRpbM5kPWboeaA0Y5MEtWOZq4qudVcos5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 mG/8OgPxRHhdapu12rGMHQP75bLEJ4PG28GNRDeTI2E/gyWGFq+UFlA/LWSQ1jNsU4UpOzPGEjjy25g4vX8HpiDjcHGBhBL4MFnt5/qe6BI563KOOS2BZtt49yXCjXtVVAjLSbSdCdi88oIDQiMY4LAlMrOx77uOTl+lY7we9VVzpRjDnhRMTRrLhk8j28+3lyekXSGsW/jWoqfi/+O1JTiw1p6Q/lX2p13KvQAFBRDBhzzK3AUrrL9J2EZXwgLSg9gtCR2BLIMkXhdyCAu3QA/FE9WFOZpJ3ndbnbwewkdiqLEErEPiVtORe7oBdO/O0vCb3M1Jq2zaCO5rCttfrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3ddb0d93a2284ebe835ec45e1bd754c5:solidrun,office365_emails,sent,inline:9289b2abfe3e9fc97e4b402e7c3b6b90
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	496762ea-e4b3-4d51-0ee7-08de80fc629d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|36860700016|7416014|82310400026|1800799024|14060799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tLImHS71gBbtCgNCSHSY5ZlQWKbL6RFVwbwz3WgeN/rqRHaURZ3Fzf4NGKI6/AcrJAgIyK9DYN6cYV/gKcOujSk20kBUrTBf/i8o5jwMuHBDPB/E/NUVimaZjIYFXUGnpH4dDioJIwrt53/yjKw1MAklrS+YhtKFyBTsP88A+ViupxRkjIWneU2l+dHSRXovhr/82urlPrA4thQeC9Pt3JrHUpxqGJ4D/aeN3hdvAVeELq4CemKIxWgQ4cvwVOjUV3RevsPLMye4BmPl4REwGECpDrWNtN+UQZBGu9VMhKpH9ZYxfNs2okGxVgIdeDnx70l5lyuC+e41Tn4AabgcVZZOwg18cTYQNxO57YTDB+WE3nTJkTd8PvWftfmakAx/Gs7j4YikJA0CwiGTsyNXNArudIBzwAYp+6LlhyAsSd7CFIcBC8QIqWa9rDu+VIKEiZpuSAC7dXcxmfIvs4WiYSdPYDWjbmX+nLqpIE+suBUbJYIfHWVWbKpSZMVaTUNLBNjtzomuRgRXszJu6RX7wzqtJkkiH0WDsPG9793BANMHfFlDXVwsfYJAdWFRGCB8Qxdu0QT8V/X+F7b659o2VT/fkBiwU43lFTMUJn2XPknXe/1QQKk06zuyBWNbvg+HdVFtrfvJ02AUg7A3ujktGSzq/vdin8X5/AtOWXNK5A+x1Ik/mrHzGHQZCXfyJ8nXcJroW7ZeX4IacugAe/utDwvIjHjE4HN3tVaf+/v0UDY=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700016)(7416014)(82310400026)(1800799024)(14060799003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TtDbRQw6HW/zmZV976kzJYy7411qxcvJgnVTrkA7Zu0Jn+5zAMstXOJb26NrD6eSTm8YXEhbBd4DMAzZ4sRnQToKrSyNaW8kYn1AlQMOfaNTc7Nojqd840Y3N/FvD+ReWpM3N4kWACQHesJtIwE1WnH+9swf9l/1a+neCRosMZPWFNBvFtWAlkmolgwWO3XAu7/kWwhMIz0AFbAScT7JgBnVyIcsxfJ3Yb6xjL3u711/AcnqIui0m+9UORimvR9JhDGOi7J86dg5Q8EPDX9rBw80Qzcf8OmfSrM2x7BHKDdZmqlGEtKhvAdMyO9991DbO3vgH1WhKIgZ/XIoeFfI14FOpK0wKXnwdAGhUEZ/DK+9TE20VjMfC/Rk4tb9pV8JTFEgV2s+t+Jjh+BFlgLhxCd2n5JChWB2P0brNGpVUWCb1eQz29iMNif3Le78djER
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:31:28.2347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2cb7f5-3774-4a82-12f0-08de80fc7301
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referencing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v10:
- rebased on frank.li/for-next where first half of v9 was already
  applied to.
- reused existing dsi / lvds port nodes from imx8mp.dtsi in overlays.
- sorted device-tree with dt-format tool.
  (https://github.com/lznuaa/dt-format)
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- Link to v9: https://lore.kernel.org/r/20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com

Changes in v9:
- rephrase mini-hdmi patch commit description.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- combined 2 gpio muxes for can-bus into single mux, as they are on the
  same electrical path and should be selected together.
- rebase on v7.0-rc1
- Link to v8: https://lore.kernel.org/r/20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com

Changes in v8:
- sorted most dt nodes by name.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- reworded hb-iiot commit description.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- reworded commit description changing dtc-flags for imx8mp-sr-som based
  boards.
- set DTC_FLAGS before dtb in Makefiles.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- fixed spelling and missing paragraph separation for mini-hdmi patch.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- Link to v7: https://lore.kernel.org/r/20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com

Changes in v7:
- updated Makefile to apply each addon to the base dtb, for better
  coverage at build-time and dtbs_check.
  Fixes Rob Hering bot warnings.
- Fixed subject version prefix (v6 was prefixed with v5)
- Link to v6: https://lore.kernel.org/r/20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com

Changes in v6:
- imx8mm-hb-ripple: sorted i2c devices by address;
  removed unnecessary newline.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- hb-iiot dts: sorted aliases alphabetically;
  fixed gpio flags for vmmc regulator;
  specified led@3 reg field in hexadecimal.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- Link to v5: https://lore.kernel.org/r/20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com

Changes in v5:
- rebased on v6.19-rc1
- dropped ilitek-ts patch already picked into input-next
- solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
- hb-iiot: disable software unsupported rtc timer irq
- hb-iiot: fix wrong pins selected for uart4
- Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com

Changes in v4:
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (4):
      arm64: dts: add description for SolidRun i.MX8MP HummingBoard IIoT
      arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable ports
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 arch/arm64/boot/dts/freescale/Makefile             |  18 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  67 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso |  97 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 716 +++++++++++++++++
 9 files changed, 2513 insertions(+)
---
base-commit: 04faa34bb5e68338cc2568da78f6535f685dd4a7
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


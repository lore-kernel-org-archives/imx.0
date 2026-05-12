Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023098.outbound.protection.outlook.com [40.107.162.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9563C76BB
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.98
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596779; cv=fail; b=DLiG5oEG4cGNWwu1WFnlgd8h1JN8ZY0pdd0ifcrS9xrjiV33OzkHSK88F90KE4wfhppn1x9hfL/R3cRMgWjpWeAKj8cwsUkAflt2phopycKUwSnLaEwjipUgogYXkT0LQCqc+0WD/C2sVsceSW9iAUOGOg0jEXuoI/BCWRukLxo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596779; c=relaxed/simple;
	bh=n0lGCmDsiJgQeWFsrgdNbE42vFBxRgo+ZfZkjsHzbnE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=efmqIOJDBuxuMNSIpW1xn2cO6Y8V5SRolxRBCZhktZwN0nLpQBCGlEaI587qAzIqvGTY1oafiBDXxorow3q7Obz7hWtGimFNZndG1mdIq1j902bG1K4Apzjj/Xb6JpB+JoHaCLGPukvInZdv6scqTCqSyl7fdsmJ9F3rYA8X8UA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Z6je62LP; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Z6je62LP; arc=fail smtp.client-ip=40.107.162.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Z6je62LP";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Z6je62LP"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gN9diH/FGd146ZEY1d767abnjDd7T4Tw7uUdHddIaCDQacELMw6A2YpS3ETLZ0rxibSvtR3IQDV9Nz9eIwjRdZ2EUkeLoIeVvUq0iBwFxM/64UM1aaAmwNgZ7rmWTBo3+3hAyHk3C/QpQjxozWm1wL2HkBV4WqsxLxccQoa6Thp+1e7kl4HwVKn6cpKGueD/FgPAJEwq4xBni2z/Csi7nU7EcvfgMJMPV9MAjEcOc+uVDRsDo00x423nG2+/JNMAiwSqfAB5DNDYvcXusGEOPyLDY//X/F8UoS7IvvTwrvSSN+3dhYQkbGUOvODJfe3hlE0Woi13X7xixET9XHU26Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=ZcmJWgA+QrimkA9K774hN7uwrheEzx71KGq+Bxht/FPlnNUI1vdzYO0jhD6paIj2xJob/utzkrTJtbbc62I/0m5ljagPsCzCU+Yk1T8v8dQOQkl7Ljip8djGX2O62QfgYpFIX0/ronVbu4VhYml7eJj+l/aOtK8uy3sMRsylTxQDP29vpKnQPGAyVw6tDet6SeJHp58ijGQKG+cOA3+HjaYIXziRwizaMXDOo2RWsg18lqZkgdlX9n5Iyy1qZAkEg/vOojWxVWCxZmuXe84ai7kyjF9jv5bFzEWKAnSrKDnMyhRMLbeIWeUHX0BGQDpaY5JclU8J2lYLdjcLTY3ExQ==
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
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=Z6je62LPdvMljUuxmeDUKPGEmpG6d6Bgo7XwjkfmCAYYUPcF7Kfz6gQxfLsfw8W8Tp+zZogoLbiWHySjs6kXvZX/TxcUJtkSg0OPYaAtkkxLZfr+jp9WhqGQjVUTNs44rl9vxqTJcb/tif9JXoHc1w8rtmhtdyu81i55EvT5TZwUHQFT21JcWEqpl95L4xxbBYNAdrmKuwOTqEtNrhGDqNCY2S/AaWpY9E1TXgSHVGd3uegbgsDm88v24OxvzhDh8t5QYiypYA/EdEkIL71CfUransvvDckRO8M/3pb29tpbETPLiIRr702SYqtfw9WR10hV0C/TKricPi/2cUgSqg==
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by GV2PR04MB11979.eurprd04.prod.outlook.com (2603:10a6:150:2f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:39:31 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::30) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:30 +0000
Received: from emails-4346527-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1A1A97FE8A;
	Tue, 12 May 2026 14:39:30 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:16 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZHPePGqcTLRy8MdJjLpBRUrPFGnVX3nZK6oKwXnDO/G5RYVXmqP1Juf0XpGIkmYuM3MxkAM0gKW5TSGR7jG7D/aC5Ye1P4iQRoT5/PcYandd4aXOSByHUM3/rsKy0hoxdN26snpNpOzy2iUCeHm9gB1EDGjw/l+4YEY2K6K1FWL0Nqxz1y9SQyWDSEUK2nm5j2wYkxgqqO/AXqUWF34ay06LT0UxuxEHcnpoKodJr8pbZOSJxohpKklIkl5OVswVeIBHlSOH8c0Ld9x/MAnlbMCpqMu6+nE+wAvZY1WCjoaD7DfKQGdDdLKXjRKZythlcMiFcN2LqCw80WO5uPWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=b1E3JAp6Xgg0gQTgc6fQKvPjaN77fmEbg5hPyGp2+A85CWR6dZ4MQh/UuhkBClIjPoegTc1jXkZYjWSQrBtlui3F+ieOmu36uprg3Chs1ZRd99YMAy+JMEBNrxQLTX8Pj6QMknV6P0cvV/szmPtyNTJhUyZ7EKWjDT1fn8sGXVKK1S++WIXr/JEJxAcLvFtRQTrd3z0BvvQb+iZOyawJlap+485npe3klmHaG1BHEfbTOyyrZ1RyEjIYjKm92cNiYS+5asIX2nv/i6NglRBJqba7/kCFuneuR6YrN6hQGVOYHzDz4dEbAsYmwEcRr5JaI8emc1ffodVTj4RGQCWBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=Z6je62LPdvMljUuxmeDUKPGEmpG6d6Bgo7XwjkfmCAYYUPcF7Kfz6gQxfLsfw8W8Tp+zZogoLbiWHySjs6kXvZX/TxcUJtkSg0OPYaAtkkxLZfr+jp9WhqGQjVUTNs44rl9vxqTJcb/tif9JXoHc1w8rtmhtdyu81i55EvT5TZwUHQFT21JcWEqpl95L4xxbBYNAdrmKuwOTqEtNrhGDqNCY2S/AaWpY9E1TXgSHVGd3uegbgsDm88v24OxvzhDh8t5QYiypYA/EdEkIL71CfUransvvDckRO8M/3pb29tpbETPLiIRr702SYqtfw9WR10hV0C/TKricPi/2cUgSqg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:07 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:07 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:39:04 +0200
Subject: [PATCH v6 09/10] arm64: dts: lx2160a-cex7: add labels to i2c buses
 behind mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-9-d0ff72d3c983@solid-run.com>
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
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|DB1PEPF000509EF:EE_|GV2PR04MB11979:EE_
X-MS-Office365-Filtering-Correlation-Id: 404643cc-5bd3-4ff0-a9f2-08deb03446e0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 heuC+Nw8o/o0ijVLCHs/VGSevjI4ZvD/cfLxBvIYCUV8onbc/eVi/GXC0MVOdx0ujGTue6i958JuoFyDMTZXN29lIXUwUngsVt76r45CVUf7ckzUL7PKXeQUZ1IuhH40WMCz7OrgIgLc16P6BLvBX6Au8aU5X+MzEGxJ54s1ngvzWypBtuGzqIEWIgaTcELhmEpAPFZtGg3e5cvXuZ0vfM6toxz2nJpbPQQxSYKqyH3IBQmJxC1OjAqeJdySF55+qMG49gQ/bAZMeew22hgdvD+StlUq6ZOpwti4vvxTxo8FVbR2/45Eni1JdwJwUSUHrIc0ZYmD1/IORg5ZbxtNRmolgpnyg5SbjCiJ2DW9KRlMrqnIiVOgf7efNkIv+SDuzzqidztfYH8U50FJl+eVGE3BsEMm6D1Jrp2t48OofJRuhdmvRmRKaxSc/SkjsPgXJVS4o68WZpVv5uumOw4CGf533EHq/QPt27E3I0RQnkePLeSkhxyftVv88vv6LtSX9BvStehV92Fo3uZd9BvJ5qdijSvxU7rwQKtXQf+lf/s6+wXMGHUAIMvyQ06qUkzTB+/ylhb13aLMkpbS9n8ESOx1TSrhSff8/27Qrexh4Xo6eb7HWH7c8u9mj3XlgA/iOv64Ck9vEyEDPYY/Zd7wjyovpwgJvP6cBvoas9H8HVPRXWDtTZOWfMNHpQJiWx57cxosRT66kSfoFKPUSAgGcQilfYJ9OCvEt02rCPrlCxwRiW6yCPc4K8cMqtmOA1A8s6E9GRRS1PI5pdn/ZwZtlA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 kp7NuTdA9PoNmy9P30ootZscrUw3i0/5X6N0xP2dpg919V/AGTX6V0TSSVj7yLt/cohSZ6HfWeGKOAu+jRRJ0XJMmLXFoqln2CCY1p0vGVAssJfrwIoxw4UPGkiPsKuLPoQ4vKuo43CA3Xvv1dytOVyJ4YLg8dhwKFzvYVJf+9+kj01mHqrqcIuhzcO2ZsRa4491Ru3JI48ASp/Lk2+Qei4cY8NoUeApij2KediNByG4T15vTshNSDNVEotqREBreAUi4qCy/4phhg+KYzwTUOwO8XXrkuELfdZne/JNE8dfy8piX2qW8JrekwVz/bKNSXlSr711oGU2MM0CRZpZ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 472fa9bf4dc440848d1bcf73c10adb57:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97f4c7ca-61f7-4e86-9474-08deb03438e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|7416014|376014|36860700016|1800799024|82310400026|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7/pOTFn8oycFjd0gJ1VhnUY4rfD6EguNF7wwunMUUHEkoxPOsaVvwZks8aE97MkvpPiRGDLNn5f5zWTXaNyRioPZs6DinUfGxtrFau9uEJNR+/gJTc04WE72J9CPfcXuwor9vg1h0Rb7/N+xwL27QswAPQSScTt0knAyePoJ37ok+dOtL0nV/kXL/i8DZOV2BvPFs0spuv4HCikjgIeeNqFRrxNHn4FNWNYDda2M1ZAdM7+JgeDYUU1nu329ZtCWkHxNOdIlWIVWW3zjh9D2bvNgUmfVOFVnD1+0dQjHXoePWeqMAlG/4oRdzZKVmSIBib1HeE/A5h9GtfvxQXYSb4S1GEUSqTbj9eHURfcho+2Pufuh1NUHMN4eiLX+ahoGjjTK8/xBJ51m/X9qfZKrbBtye2wBWWJUYsghNHiYpsJEZbm0aFXSRGfco+brhxZBe7K1Aef/gbiF6x720+PuylBuo7BfmBsQLO5/MQWka2Ihib4zMlV84bCEmTCLln/ruHs2slsfTIwoOKLcQYa4gQIq9quS/poCOyR6vTMyYlNwPLS4Z/ctuORWNJ2wG/J4SOyDOMJkOlRFKXsd7ITG5qWdJl8Yx7aZRVWvhyALpX/pxzO261zc1cCCzVDe0U8UMeL90P06454AAv3VomtpeTIuIWMYpoHdE0niA5bX1QOsgn5IX63SWp9/VdA9d+K2P/5HkUxz5gLWsT5vNaR8+G/Yhf22Fc477sLvE5pFGxH6MkTrVlyLNPRQopQ/u+zLzim5z8/NQMCT67875cNvqw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(7416014)(376014)(36860700016)(1800799024)(82310400026)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t1cJk4R6WMdmb5i+uqEgM5MJWn5oOLSRx6InNxVCMbDK1C7n5Ecpum3a6Ede2HEqszIT0+23uKfZEur9S3Ro3orShpDgLv5oYWnN1+MOLzdAZMeCWED8JQjFNJMfXCn6D7MkfO3X08A/buU6AoZ0rV8Qrnn3/bYbdWVmI9UHfPWhw8fS07rex/OgvfS489tIzqjfDmshHajF/8pfbkj9aK9cw6oB0re6WBuESS0QdZtFo/iICU2VlPfK8x7ujJym53IxeeMqTuYCCxZk9HX3dGANzK4eKogwPb6biv9xctYVkyLjfymQjWUTtF3tDiTp+A2/76+5jVkqlEcCmJzIFKid5Oq0t2HecCQMhN8sfWLog73YQX6YpUTTLE4D/VFYZ1NRILeCVvNga5u+3hHzn5IR9NKB7OGaDRrNz81F4qWlm9W+hYq6by1BvIQCIjJO
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:30.6661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404643cc-5bd3-4ff0-a9f2-08deb03446e0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11979

The LX2160 CEX-7 module integrates in i2c bus multiplexer. Some of its
channel nodes have labels, others do not.

Add descriptive labels to the unlabeled channels, allowing other board
dts to reference them for example in aliases.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 7df93bb37d13c..ce63545abb6e6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -58,7 +58,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 
-		i2c@0 {
+		ddr_i2c: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -84,7 +84,7 @@ eeprom@57 {
 			};
 		};
 
-		i2c@1 {
+		fan_i2c: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
@@ -95,7 +95,7 @@ fan-temperature-ctrlr@18 {
 			};
 		};
 
-		i2c@2 {
+		power_i2c: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
@@ -106,7 +106,7 @@ regulator@5c {
 			};
 		};
 
-		i2c@3 {
+		i2c_smb: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;

-- 
2.51.0


Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021076.outbound.protection.outlook.com [52.101.70.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E847AF76
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.76
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123824; cv=fail; b=TtUaiyvyQuDVxqUvY+rgcO1Jr7nplPg25Q/3sEWf6M4adny946VhKzP0ieNxgeXYGmjD3uo1yVq8OhHvhFFQXS3YDG3THF6VfJzTDXlKcMUUb79vGkVaVnbABbJ1B9eAgdjDmeRk945MfObz3yAf5P3LPSYuFlLQhgNyFTtb37I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123824; c=relaxed/simple;
	bh=PzFnQHFMo15lRLTVGX6vIp2DrHaar2CTud9bNwNMHvI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Qc/XxyGHJzREuzqyXgitGY7tAWzHqq3rVZg69rCAaCKe0PJ+/jZ26VKN+rSRF63Xxul+ATaFmZ3lSYWQbZXw/2G4JQH5oeO/A//mSutLx3Iw7Av8yRjXBXD6SejYjZvv7gOa/m23DcQ23y6sjpcRdom8BxijhhMIK7tZAwX+kjA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=B0ik+wZJ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=B0ik+wZJ; arc=fail smtp.client-ip=52.101.70.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="B0ik+wZJ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="B0ik+wZJ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EfSGzv0pzGvvc3VnJq6vUSaatoCesdoBwUX3cf7Ci90SUQX/MHb6f6g4xY0s1+QXbHPkmVqy7+G+9m1+urqSVIYEXEWuc/91ba9pn9BVF3k3r3p7nbURrvDgzGxrb8YlxWQ6ssQJNACQHN1XcTbtsUahUwiX7G+OSoLWFh75kXD5kEhxVaoYZYqpOk8nNjJQpC6oZzLacmakzP4i30it/xTpj1ZQy74zSAIx88A09EuPa/xjYqaEuQHxr3dtTbQhiOjOZBWfMa1/cLAaUL/AULs14qUMf4AWZx2vhRQ1hCrjheImRT6rXUAj5XIMWMVj9e4fvjmjFkuT0IrKREePtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYDinjul30uXcishfiNkyl+TZ7XH9NUT8uPBtA0JayY=;
 b=hy05yZuUUG4RDXLPN+ShD2zqjuzIxgFnU8ne6B5OvplS2qa2YC/Uy4xmum27nYH7G65M34iC1vGGOaz/786Sqi27kIqJ7i9k87CYa46hXLq2QIN3/YrxbTQIVWf+TYF9ZE3HoOn+HL4TwiHpKEmWGghrbizTVrFwDYBgEvQuvqM2ISizNBcTM2hu5s6MZh591e12XSYCSBKcv5inTWLoJ9E+A3kihgjgv7X8mLPCrOwIAcQ/r7JKPB8nQGoOd5kEoxHjM3/jbhSNSMXgJ9rNkcCU1QMoHs0YbrPxwWSMaGBQGRWC8ONg0Q88QQNGliqn0mUBmcHdtXxMQq/l4zb6mA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYDinjul30uXcishfiNkyl+TZ7XH9NUT8uPBtA0JayY=;
 b=B0ik+wZJxTX2uqv5AwVyHkZbKMzxufdqdTKfDK4P4tyr4m59yaO9Na85Z1E6lnSE7WUor7vpJqhDRJFrrHKQdUm93TekED0L9JFPGa3A+tduHtapZkwyBAQgEnKalHE0+q8HfIR+cAnUJ4OgOzbQyO9p0zGlbvUShSor9NtRE8o=
Received: from AS8PR04CA0104.eurprd04.prod.outlook.com (2603:10a6:20b:31e::19)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 16:36:59 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:31e:cafe::5) by AS8PR04CA0104.outlook.office365.com
 (2603:10a6:20b:31e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 16:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via
 Frontend Transport; Thu, 26 Feb 2026 16:36:59 +0000
Received: from emails-3380489-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 12A98807D0;
	Thu, 26 Feb 2026 16:36:59 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:52 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sbzx/F3pXu5bnnKR4YHAPl0GJ+m8c/9iY1aZLUvX8vrGu86HDWwwT+ig4Se5QrSTsND3j+bMjRI3yCnJSP8tXAYXSV1ZML3+XJ/F3A45VO7eO2mA0YcukM4QXHSXq0MjYjl9OWVjNdzjtTIBcLMWgKSbCUITLerGAxi8PAx9wlATWU7rVg4hIYsijbmCAKStQbDdNIOcfP+ScxZ80cb0x9EHmTndGO9hVMbqo71cfbbBeGBoEByeIKlp90xUNwl1NOfxirRngsbelJMrSST2Oq/QDnB4xgIM3QCpxsWOMbN/ciS9Rl4YN+jeyglo+1AQgQKAQeMbTvZV5pOpUATuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYDinjul30uXcishfiNkyl+TZ7XH9NUT8uPBtA0JayY=;
 b=pw89t/C+BzmIgGbQ0UPA5cIaMeyecg+27cu+QpG+mnpUSOsuDm8KzkhGHgMyr2MdYVR9nPr/+leTed6Lqsow2eDstYCqFG/9oFKpyZ4oftfqdDcD9+zsIHrevMvkzdVwF9kOe1BssNfVvXcs5MjWRxoNN9H6+xTm/B1olAwXS9ij85lRPTyJev2avJB9R3tRby7iDUQQaBSE8AmVpxzZv7ilKplUWWcngnwx1G+yKhxa9rG9oLbo0JUCZc7Ax1dm81c6gaOPBT0PC+89C4kbwExT/T4D+2lwCdJxsd68iv85ewCn9M/WQ16IhmNEbkCDsvVTI9iulTPW4bhokrc4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYDinjul30uXcishfiNkyl+TZ7XH9NUT8uPBtA0JayY=;
 b=B0ik+wZJxTX2uqv5AwVyHkZbKMzxufdqdTKfDK4P4tyr4m59yaO9Na85Z1E6lnSE7WUor7vpJqhDRJFrrHKQdUm93TekED0L9JFPGa3A+tduHtapZkwyBAQgEnKalHE0+q8HfIR+cAnUJ4OgOzbQyO9p0zGlbvUShSor9NtRE8o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by DU4PR04MB10767.eurprd04.prod.outlook.com (2603:10a6:10:580::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:36:46 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:44 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:35 +0200
Subject: [PATCH v9 6/8] arm64: dts: imx8mp-hummingboard-iiot: add dt
 overlays for muxable ports
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-6-4533235eeb34@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
In-Reply-To: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
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
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To AM9PR04MB8747.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB8747:EE_|DU4PR04MB10767:EE_|AM4PEPF00025F96:EE_|AS8PR04MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: be3fafe0-7dec-4ed5-7d40-08de7555434d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 lVTw/EGNqQTxPpbjV6XdSrNBROlR7VbIKhwN/TUliHKzN3SNsPZYWg4VuIRTKPjX8g621kmfbknSQLifyiYxog/ZOCexwkxDQS8yG7spgYXKsTEhOi16rJoWGJLw5yyFtgh+q8dHZqIriTwIvlliry8Uj0Qz2mNGRQXdBQtJVjEsjHA7mMYkvx6bn0Jxm/mhT96KnZQfTHwZtrzT0WJjlowxFZxZ86/6TiWwOAvGc7J6E/tGm2+ze2KwnzPJ/CepvyNjmj6XdJAPA2pYXAhVwODsKj1piBwiyaH6cFojMNzekRU5oe1vTOR4356Vw6fZrQIj5M9vBj03yALfyHwS/Ulha9xW/AmJGBmpHSWC40ZtrHpBaIuA9pnbtcTKX6etlR/aSIkwPWXumgSCiD36B4ExESfJgtbHHlJvCRTtZRhcNvI3fHZTj2gvoD3gRbU2VPzsuzBMKY7Gegio678XIw/mr4uxLmr0lCgwp+vHXA8ODn3o2rmP++TxNwurGNbChtN1HZZJ6OUfAkfc+fchoY4AgLJLtFwF+jXHfJPh/yEub4vSbgLdgtcnq+n3T0Bol/7ThtuI8TOG0iWJP6VRiZUHhMAT7e/YKO8Ad2na35293pGazO8fQmGRaYmEbN76qejOVGLcDdxGxAXURdTYtmFWjoW5u6+27+UICv0pVAR0M2mxAUqHMPZZrPdBjlFCdKDxpS+X8QdONAtKCCx2s7bIJb4VDHNMhZOYtzNTyiFPFRNgmaI6G63lJT/jXUjE49/XMNJNkD4i8vycY5rhsOUgcPkKSoT82oCcnGMiZeQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10767
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 464e174bfa17433dad6191c617dcd604:solidrun,office365_emails,sent,inline:c670fe34631ff287f38cd6f3c87efa4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	abbdd443-1194-450d-1474-08de75553a84
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	A91qyfQg9C+jp2hC+H2FtZDGyvgYcGpoaGDQChX2qqAygXfrKNcUSd/vcvPVcr6kAimyZWe40aueiwvMvW4iYs1L/HpnmIljVxuBqtoDPJ07OQerdN0xf20BvvReZ0g/1myvIii0+FdOnl56Udc50u+DOxuIGXXpWbJ1VfzDRSA7+wky1rrKgLDyJDRSvv32iCkhP0MyuyVJTxqgkRw2sx0xhRfwHehhHYWYuV9AxVZPB33oFDgvysFn5VGJSsOJxMkeAwqhQk97JN+b4SCFG2N3mWf8WJqqqG0TzZ1wRyaN2r++nKfV3bQwOUyVHU8rklaU9MDJPeKluKnSA9EKulJ4pICQy/sJIOjG7DBIaUKHYTqPM4y0VeQrHW0oTn0YjBS3gNI+chFBBnney/TGBdhebKS7piHhzeDtJR0Yku6uz5QMNI1/9mmBMDLCYfTI3V85Pp4olaVHuF8yXVOqXxK2UBbL/KgtyrMHuzNgYFum+rNgdlDiJhu0rUjMjRUSVt61WViAdTyXoig/hawVMQmz+2zYXZ8ptgnDA4EYHV5WUmCVA3gQVSs4o5DyFQ6r5GbrEHygjwoknd4Vtlp6zBJVMps0fYY779xFjhFe0E7DVVX2rZEa3qxEy12iQ4ARsKSM7mZ+Jmz1stTw2Kq0/fhRqBXjcrvXk5WcLLHHY5pVPwL8mDdesOBULsOjYaf6P8BWa0LCEIrgF0LiSFURNse4N9YUhXcc6dvNTWetP6GutTrfDzOqK9P4wzMIg/jEw8isHWvKCk5PkPcl9CUQS9ReFZyhbfgN+QanYyuyFLa4AsbbXZRxJ3yTxYKbcdJPW0gWRV1OEdHPIgoWdjrb/A==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nznu/xFF47BR3NzE9I9YDXC4qPUljLAWLTJDozn/qVxqPr1DzCpCSbKN2f+enOSipjsOMl+lbhny64Ri6Ju1zEMKhiO3PqyNJFAZisnBpPKJatOQFf6m4ApTdObxNOHfiZFOscLJI8sQpGpYPbTyylldn1bzSJlz0lBDIoehH6LAhmgNN1MBvo9iltWfVuYetxSIyNyOOtMBzGyHiFZ2UYMo2j3x2I+nW9LSPpsZCc4yr6Ww7cjC/ENtO/DdGZ4uJXdgfxKCYa0xpF+9HhRARU3HE67s9YbIQpGkRUZYCT+VE4ng4DCEm053hDvb1UIs68ZIYSDtSYORzAS8b9XORGkWsfEGPC48JJcut6XEO7+QCXtnidxMQuStAAcERHiUodWlBGXxXTcjJyzVgKxU3X2vOFmNJOk2E5VypX0d38s7iMXrRtR+7/7hY7X1FUv8
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:59.4220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be3fafe0-7dec-4ed5-7d40-08de7555434d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927

The SolidRun i.MX8MP HummingBoard IIoT has a variety of connectors, and
configurable ports:

- 2x RS232
- 2x RS485
- DSI Panel Connector
- LVDS Panel Connector

RS232 and RS485 each share a single UART from the SoC via a mux, which
are configured from the base dts for RS232 by default.

Provide addons for:

1. Reconfigure UART A from RS232 to RS485.
2. Reconfigure UART B from RS232 to RS485.
3. Configure DSI Connector for Winstar WJ70N3TYJHMNG0 Panel.
4. Configure LVDS Connector for Winstar WF70A8SYJHLNGA Panel.

A variation of the base dtb is generated for each addon to ensure that
make dtbs_check covers the resulting dtb, and applying overlay is
tested during build.

It is however expected that bootloader should apply any combination of
addons based on runtime configuration.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  12 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++++++++++++++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++++++++++++++++++++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 ++++
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 ++++
 5 files changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 01f6742932fc..8eeb3297fc65 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -237,6 +237,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+imx8mp-hummingboard-iiot-rs485-a-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
+imx8mp-hummingboard-iiot-rs485-b-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-pro := -@
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 000000000000..e66ee2ce69d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_from_dsim: endpoint {
+				remote-endpoint = <&dsim_to_panel>;
+			};
+		};
+	};
+
+	port@1 {
+		dsim_to_panel: endpoint {
+			remote-endpoint = <&panel_from_dsim>;
+			data-lanes = <1 2 3 4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 000000000000..f8fb7fd0e4e4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "winstar,wf70a8syjhlnga", "panel-lvds";
+		backlight = <&lvds_backlight>;
+		power-supply = <&reg_dsi_panel>;
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		data-mapping = "vesa-24";
+		width-mm = <154>;
+		height-mm = <86>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <40>;
+			hback-porch = <144>;
+			hsync-len = <104>;
+			hsync-active = <0>;
+			vfront-porch = <3>;
+			vback-porch = <11>;
+			vsync-len = <10>;
+			vsync-active = <1>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@1 {
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_from_lvds>;
+			};
+		};
+	};
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-l/r";
+	};
+
+	lvds-ud-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-u/d";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 000000000000..7bbf800b78fb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 000000000000..d4bfea886ad1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};

-- 
2.43.0


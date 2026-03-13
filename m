Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023114.outbound.protection.outlook.com [40.107.159.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C73914F9
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.114
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405100; cv=fail; b=OoeQCNg5TaARrGJljmgsxhd69tJK1Ocp/ErXBWc7d7Dm71RtBB0fIhh3mYw0C0vceqcQFQl26G7KfMhhBffTuNFbyVsYffk2ktWxiO/knE4Js1OCTngDpHNjx2OV3PIScGJEcppB1XCeCJTsUVXboB6WWY6yCNK6qCuCKEgHeDE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405100; c=relaxed/simple;
	bh=TvFKD9nClpgnB3+ysh5WktqdxY6mqF5kIBkKZoxFOMQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sfB/sOHK03fOiNrjK7y7DfzuF3tTlQuYlq1YLva/Pg6I/EDJ+KJT932FBzI6J4blNOIe48YNJEERhr7z+uMrOfEK0N1vwlRlBOPv9BI2lPNzIVA+Se33Lkw7sSpDv6lA040aJRinodVZ8zIBV/WTqeBUhaFsEOnp5iz8OEaexrY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NIqwU/nr; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NIqwU/nr; arc=fail smtp.client-ip=40.107.159.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NIqwU/nr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NIqwU/nr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Tys/51ERou+iTUfmfNJOTpSoSIXDnLkGefjH5Ra/As4F9hrUy1/IsXHiIPO5QHHOdswq1llZjEQW+VrVElE2EbV7hju7BF4M1r9su10OGO/yRIFx3eMyIWaFXXCORY58vwRGXnQ3+zkIdr7HHN8lEqahK5at9sK5YcSOIK+e7jM/3Jt2C2bKbW4yPcQENnvFUEh06JJU6FxOeFK3YrlNOUmX8GwZ2euAFKi1CTWIrECgOxGQvsTv5i83/BXy8dApAmA6CodsLOE1zHt/T6t8ighFFDaDW3IUR7kyQB/vLrAyenLPmjeyRdTOzXrFDF4PFc4WLCI8lKxFEGqMqqCTlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWWtEfvtndFWm+Lm03ABYLL0Pe6DPrRLoOWQVmZxplY=;
 b=jiBlQzpaWVjxuLjHWwymVdgDGXaAFezFV82+9r/Xam6BehuclLH5VtMM2RVHILvYOCZVCMHuDuJ73HdfcuERIXt8MtxLH7kMH4j9al1aARI+Xlcv3MDxtVFgC4mOF1PQO6EOrGyTvnIKpfeApSe9NFGpSpj8wyHxrukHDF8W529YwLBuk4JLKhCFgGrQOW/n7dNwZv5lRdin8O9Bw3S4zFkWXXDcZ3wGAHTEoYeYcuF5YiQhWoTNYDGWrUesAsrWZcEGSy12vS8tR6uHjstAI/6slq738GBejXVsoZWgP+FUir2x5MBhLzudDbOksLTHu0FnTifw+7K+qhtVRjT24A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWWtEfvtndFWm+Lm03ABYLL0Pe6DPrRLoOWQVmZxplY=;
 b=NIqwU/nrSqDLE5pv7P0ejjI/z2HTPy1i1D599V/b6KtTkfPz+StvV7D6GeZbK2DmRewkZYqd+007YpLoTmcz3nk96TbecGgHAupfy/uLf4yxG9g7aU5a4Ebg+oDIP5WgaV+1En7Cv5zLAeKHHuSUY/Z1jclCEI7evddbtZD42zE=
Received: from AS4P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::19)
 by FRWPR04MB11200.eurprd04.prod.outlook.com (2603:10a6:d10:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 12:31:26 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::6a) by AS4P195CA0029.outlook.office365.com
 (2603:10a6:20b:5d6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 12:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 12:31:33 +0000
Received: from emails-7655272-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3CC0380C56;
	Fri, 13 Mar 2026 12:31:33 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 12:31:24 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNseX+diEp8khfEpWMXgUiR3odqpW0zAYzA6LvtptYcxYp4tBM08tz9GtuJ94YFVOjsIXtufgfpLFb3dCARCHXX/hWjZhfQDP2AoB/AYh1VyCLrKYXTAW9fvHOVcogmLdTNnx4EAipoZIPgMMnKNIW6Fgor9On8ZxKhd/CMZFEQmhB18IIRgsfpbmcbWz9W6tPqRZLRLLR8UgkfIVpJVQznIDYokbiFAgBQgJV077W6NxroxxMC772izNbwQ2GAJZDA1jb78iJnH+gLv/2LAE5VvYyDgQ0pr3cYqfwE8dHTyFW6kjB22yEDnF4c1fbflZZTatrPu2STOT2lDmJdXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWWtEfvtndFWm+Lm03ABYLL0Pe6DPrRLoOWQVmZxplY=;
 b=zKH44lJJhRv/fE5nZEO1ViRB9rAuibGDOLbGaIsxBJ3W1ElFjGBOCuUDNlobewJlC8WsTHgpp5qqwaIei/qL3jWuBq8n14foyo5oRCog7obSGtbYVE27sJL+t82ntjB4tMWS1hbeZymwOlQkMqVwTeR+uasx+GWuEwRcoyv+WI9kvssh66jGVCK+gpDoXRnER72SWe3ddUab6qnAlm5ImE/YFUDuJIVu1PPLs7dgCApNAsqVeMakvsCJYOObPMwDf6bBXn6UFriQXV66XdB4NPdj+VdtNq1ieBssEKKOQYVxIhvWjcjXj06kttDCu2ehUqzZWMuMlpKbYvkZN8Wa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWWtEfvtndFWm+Lm03ABYLL0Pe6DPrRLoOWQVmZxplY=;
 b=NIqwU/nrSqDLE5pv7P0ejjI/z2HTPy1i1D599V/b6KtTkfPz+StvV7D6GeZbK2DmRewkZYqd+007YpLoTmcz3nk96TbecGgHAupfy/uLf4yxG9g7aU5a4Ebg+oDIP5WgaV+1En7Cv5zLAeKHHuSUY/Z1jclCEI7evddbtZD42zE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 12:31:14 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 12:31:06 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 14:31:00 +0200
Subject: [PATCH v10 4/4] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-imx8mp-hb-iiot-v10-4-52b3084f2426@solid-run.com>
References: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
In-Reply-To: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
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
	PAXPR04MB8749:EE_|PR3PR04MB7467:EE_|AM3PEPF00009B9F:EE_|FRWPR04MB11200:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5a209a-5feb-4b38-5d65-08de80fc762b
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 KaIudMe2XllIynGrbmLOuOePBqrdJysUaJBC7t3LZ3vDHgLBJgBD0MuLEWMqxnsuspx9cp35ZJjBxlR9CejfX5e7JVTXuSxof4Proj5ieVwDEVJ1oiu7XFasoJlWfBeujgpvMjHzjnUw3jAHNt6mmjwTZ1O1E/QKTKUqQwcbUFqMmBcPsriGrLrxGjUpW55Bl0jSG+QnH0GFWoGunH7gRtQuRG1W4w+hC7GX9cl65ZyCL7NJTO8r1cky9Z8dj0XaWD20fj2AWu9C2yISE5ZzxrYsYrr0wS998eMr5E/en+0Mj3jOdGVKN/0bdw6ZrekG+zWlaQQ7z4Tp8GivOAXBRcIW7jG5VBc+rrAaIn1U0Q30SlwPyVEiihWQIF1F5nm1NXyAS65d2qUWutP8p4+X7z/eNyAvkTrKJONlq7NjP1MyntWMmLILvMyuahu3fxn91ZrA8xha6NCPi4+Giy9INO7tbSVYe2k3/Ks+WiPddQ+OBvg4sCLnzsUJWDJ3tAtybh+E0/FUFpy+luZdF9IzQSQoPLTNs0D1JtBFJRv6abtXuhfszsFLN3GJhzvFQ+YTOxQP1CcOYaa5OQNFpyqfB2HxLyRu37icUMfFWUkPxW5UFbBZBDLUL7oTFPjvZ38HmNrj50Vdf91g6BUAaRWHlC+Ht8aqPcibqfWqlAt3pm+wQstlGlFhVoBZt66n4yfHwKj1a4Qg0TLYajxyNUwfANylQX851loCCvhmtfZE08T4/X1WjdRnOoQ74cvgs6Pp2GuLcvdQs2edGWKEYtRSitwAGNFgwMRTO1MqVm1MaoQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 R9/PFGSklIqF4IKLXJPXpGmpl24/xt3S20GDRujUXZdllsBfKzh6lF/1A+z3c0WwwL6+dNnLDzG5hSqOXZeCy5rIIod+MlPH/JNUXgUpsA2oiEoUS2ctEjXZEKxATz4gbd3ngll0CxHstGNdAvzyLdnIum2TvNH90yAZm5zS646W6WNK3pkFOxLeYTM/u9TpQxUnDZ/7d6SYFESNF3WfAc2TYizWUz+MkS2DAxBHbYUAE88yzDWO6r6mB87hB6pMcuWF1fpucwvnCgr21sDmQOHU0ZpzCWRgA3Nimh4h3dAn/PGUGjkEKce4i5xqzGniA9l15vasZnVcVN19qBb4gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: de03d7435b1243c8b8cacef9dff9562a:solidrun,office365_emails,sent,inline:9289b2abfe3e9fc97e4b402e7c3b6b90
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1ccf316b-b885-4ee6-a1e4-08de80fc65ab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|7416014|376014|1800799024|35042699022|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BudPEU7Nk6M4jMnezp/p3HK1erqj5YJIp50P5ozeY79sGMm7crILxt4M29joafpoZyYAbJiGSO4zBisTDN4NYJzX9j8Sk9nHXWYlMjk9pIcZFChzawO7rE/GvnFcitJPWrrXG8CVdp0aIzrVxfCHaVpXAQ2bZ3UcwtTGzhyY8t2xm/PmICMk/sBn3oLWErNZHv9pQ8H6Er+uQ4y9YYkkr34EcvCCvmo0qkoHqmAbaMQq3YTWBC071AyYMtqyC9hhvaAi/y4yDBVKOHw/QSG/y7SHT43Ak+hKZkjs2p0osdVbTcVfkFfdQsTuDBhys2fJ8zZfegVwj+ieIh701VKSJdRbs4PtHkQHb2RpTtfpyh4idg/II7sVZsJhIPux8Rvhz4Eoj6dlZQ5kNWrWRvRA+vVmAlThy5P50aOYtN47opAJuMUWNHmU9J6x4FFgjdqU/Sr/Y+QX8q4Zx+BJa3+dmV0EXZh78jhmgh1J8iY2Q/ZGCUocv4c9Qu1acaE4TJABJFxJX4gUeoGcfN8xaUz7WHYOWFILu2feboU7JOyOjjMl1+HLH59MVDUXivRqYeVj1o4b22hM8uIkDcYIKHXho8cNCDj4jVzR/g37Jrq/AdU6PM/VfjrPIP0s7boKoVAk4n+22VRXRYFPqttvTsqn/GndJWgt8cXas+EbtyLwBj9RXAJ84Dgq+JV+IXl/UWDILlehsIq5ziPM1OgxtjaJEedpYjEvBq7Y5Lz7uldRfg4YHM0s9hhCQveaYZunb7wOszxyAesfj8hR18utSr4KPg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(7416014)(376014)(1800799024)(35042699022)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LaM/ryG+nyzDWGmPxyFOjWROUdto7D+IfEXPA6OofpcNpCLAekurlk3TdOWEzOXmnhLVFCDK6z/FfZowcwLI4+Bwf7VBNNWWWbPKFdtGxT7epLr/aUI29ENgUIhVAlS6oX8JyIxyDgFlR/pT3z3ocUrGwEtXx94ps94lPRp15ayf8eVD4M20cgfhd4RJ9GSxupqE3faSMSHqj0uI9tVqaCr13iOS+H9cNhNpUv3BsEIr+J0+C2h6SzCa1oioikmHnGX8tTpOioel4ykqxtdW1hdATZJGlHF45Y9olOtSLBrGs3++bHoHvJmNdG9uHDcydbYzR/op3vX9pOlkFrC36Fooq5bxZUwmGTKS8l8pniQQ/qvWGSNPv9+Bg6VPDxpC4Di5Qqes4VIjBjnWprEU0qeWhKbHh9QlM0v63EDnlvXwOiJ7ZAra0WnuxiTV1R2L
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:31:33.5009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5a209a-5feb-4b38-5d65-08de80fc762b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11200

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 +++++++++++++++++++++
 3 files changed, 730 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1ce4955cef0f..04bf4add08e8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -126,6 +126,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 000000000000..18b58634d3c2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&led_pins>;
+		pinctrl-names = "default";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			label = "D30";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			label = "D31";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			label = "D32";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			label = "D33";
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			label = "D34";
+		};
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc";
+		pinctrl-0 = <&vmmc_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		startup-delay-us = <250>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		pinctrl-0 = <&vbus1_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		pinctrl-0 = <&vbus2_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		label = "mpcie WiFi";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		pinctrl-names = "default";
+		radio-type = "wlan";
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		a2vdd-supply = <&v_1_8>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&hdmi_pins>;
+		pinctrl-names = "default";
+		pvdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	dr_mode = "host";
+	pinctrl-0 = <&usb_hub_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&vbus1>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd2-supply = <&v_3_3>;
+		vdd-supply = <&v_1_2>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd2-supply = <&v_3_3>;
+		vdd-supply = <&v_1_2>;
+	};
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&vmmc>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 000000000000..8d0249f1e92d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+	model = "SolidRun i.MX8MM SoM";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&fec1 {
+	phy = <&phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&fec1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			phy-reset-duration = <10>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			vddio-supply = <&vddio>;
+			qca,smarteee-tw-us-1g = <24>;
+
+			vddio: vddio-regulator {
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&osc_32k>;
+		#clock-cells = <0>;
+		clock-output-names = "clk-32k-out";
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		rohm,reset-snvs-powered;
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1300000>;
+				regulator-min-microvolt = <700000>;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1300000>;
+				regulator-min-microvolt = <700000>;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-idle-voltage = <900000>;
+				rohm,dvs-run-voltage = <1000000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <700000>;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3000000>;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1995000>;
+				regulator-min-microvolt = <1605000>;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1400000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <900000>;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <900000>;
+			};
+		};
+	};
+
+	som_eeprom: eeprom@50 {
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&uart1 {
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	pinctrl-0 = <&usdhc1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	status = "okay";
+};
+
+&usdhc3 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&wdog1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};

-- 
2.43.0


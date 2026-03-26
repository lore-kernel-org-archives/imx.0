Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C538E13E
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.136
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528417; cv=fail; b=FG0A9dqX1rjJ3RFV8AxuIFBEIQAzbkGJDYkahGDOT4vGJhBaYEeu0Wxwobj0M22dmIY9IOQb3rZauD5HzqAuZ42Gg2jhDZbem6+A9DCud+JDfHbOtssdVwHJ9KmJAzICfYN5O/fdmn1RKFNIy1JflJjyMIl8qyUZUZIw1Sv3gRA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528417; c=relaxed/simple;
	bh=jRAOXZPFHe28ThCHWX+zZpULrYevACQZPOD3s0HANI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fj9drI3mCurftgPAr9/5DaHwLTjhRGbEFrYo1soRdDq6LEzlvYcU7HPLtBbz9kcYgqZE2rXJB5r3aaKJegL5BPzcZ5Kk2fdw6EZ3Glrql9GAsAG8ilWYPZvLa77d63PYRaSeh8+goAtQaxZLHNUgQgKpNLxmAMLXUWWsn17oUwc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=k2yDiZFy; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=k2yDiZFy; arc=fail smtp.client-ip=40.107.162.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="k2yDiZFy";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="k2yDiZFy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xRWCNKUaLJoJdUcyr54DO1+0hKrzi+d7obH5V7XHnHzzqNm8oQYOy+45ltaEMWH7uz7yUl36FFaJxcfTkgzCaXx8wA+kiJ3XQXb/u7lCvYutE7Uhw09wr3gOq3HJodgeTXFomaNZLYtdCcw8BeKrJs5bB+GIjAChOqeScYXXSoTKRut1gCo0Q93HetBaoYff9Vl69451FiFKEgeUEZdB13qy7hyh+MqaFlpX8PXqoHLzr8aS1Gi1WirhCHoyTX/t8Up066iDomHaB3eJGaE1CljTNK013Ep6IP0bftgUnVOTYDXh+3xm8XrIQTdOj9v3al4lmBmodB0CQ2WSfisIzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRAOXZPFHe28ThCHWX+zZpULrYevACQZPOD3s0HANI4=;
 b=xBZxA67WrNK3F/ZPQyLd8qhRRX3EibZfgxMxQZP0qio6IvFdAGBGb5M3Gv0oRS2Q4e+1+KRXzpTYRd8kttJQIouej+F+rqVCsbYO8AXZLJFvYTdqoJUA7SVMbWUqxLV/S58RYeY9vIhkxRHH7f3Jl/4/WZVOaSZtvzb8tMLa3NkmnUuK7U4ID0a7UVbcxtG3DfTnAy3GnyhoQ/rGO5T5aGy3CYt95m1KHIgG1teHcgnPmVnmPCLhJN2MzME9C+J5UPjl1ly7zmFvcFwNof1Yh5nmFi/O4v/lJCEznRgmMgqIzlAPYD88ladic1pVNSxNyj4Y829hIekfFEWdtizFRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=solid-run.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRAOXZPFHe28ThCHWX+zZpULrYevACQZPOD3s0HANI4=;
 b=k2yDiZFy/0T0n7ynK2DRyzVw6Kmm/tLakxa71eyHc5B5ioJpkbzSsMYnIzmZQFO2PSFDEmc1y2sQLy4I6MfIOcwma/xclyh6YVlYgW0Da6FHrqS/jX89umAOCT3591ew5idDKHcdspKp70k1E4cbJvr3qTeA9EDnuqncDo5NmbI=
Received: from DU2PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:10:2b0::10)
 by DB9PR04MB9817.eurprd04.prod.outlook.com (2603:10a6:10:4f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 12:33:30 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::8b) by DU2PR04CA0155.outlook.office365.com
 (2603:10a6:10:2b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 12:33:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 26 Mar 2026 12:33:29 +0000
Received: from emails-6764122-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BF17C80CE8;
	Thu, 26 Mar 2026 12:33:29 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Mar 26 12:33:23 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzmecQiAkFv9TBk5woHNilOFKLy6pkFTlrR24KL5wlHW4obYpXcbVbdEgn0GG0tgbr4HxS2g7ZvtIEb4brGN6spMSKksYgTFDhQN2DOjEnO9ae5WCR6rAhuFraawYiud7hx8RjQduhOD6Rl0mBlFLhBPWK0UusNxlZEbjuDsl2pp5t1hs7rmgpAcHREHT5fX33HTdDgoxrdM3yFkptVVP6growunt+46nylVefDM6CuUsxKYPjcOe5web/UDIhIfZq3hKVbtTO4osr6Enx8zLIjj5xBFQE+DNtvqbyzKo7stvM81CjCpkZGJOfvhflyjZ8R5wR43BXs3nxDYm80fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRAOXZPFHe28ThCHWX+zZpULrYevACQZPOD3s0HANI4=;
 b=Jiyk9xINIJzH/Xo/Jv1gDcE8Lj7jEELtNzMaEmMRsgeiiAucNsVq0psOjtYYeVf7szEPb7DGRbY0E8UD48g94vM7o4NowMWMgBoIKxmxba9nqJQ7V1/ho8Y50MqgC9NgP4aCnMIRJositimd6btOOub6fgOqGN/sK4cTL5iMvUtEz3YMh3E5uHKaW2mjShPDEFJYtNeG6T/eJkEkBB+BES0kq92ktYXZL5ZOSGMcunS1NSkRdQaOQ4dTu7OA5pgjUCnJp8cInUAd0OSdN173jND60JjlftNgBz8DBoGDU5AqN1TKZ5DfvvWBDQFfkyjXWP/GhINfR3hbGtrwofoVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRAOXZPFHe28ThCHWX+zZpULrYevACQZPOD3s0HANI4=;
 b=k2yDiZFy/0T0n7ynK2DRyzVw6Kmm/tLakxa71eyHc5B5ioJpkbzSsMYnIzmZQFO2PSFDEmc1y2sQLy4I6MfIOcwma/xclyh6YVlYgW0Da6FHrqS/jX89umAOCT3591ew5idDKHcdspKp70k1E4cbJvr3qTeA9EDnuqncDo5NmbI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 12:33:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 12:33:22 +0000
From: Josua Mayer <josua@solid-run.com>
To: Peng Fan <peng.fan@nxp.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Daniel
 Scally <dan.scally@ideasonboard.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>,
	"S.J. Wang" <shengjiu.wang@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
	Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, matteo.lisi
	<matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, Richard Hu
	<richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, Martyn Welch
	<martyn.welch@collabora.com>, =?utf-8?B?R29yYW4gUmHEkWVub3ZpxIc=?=
	<goran.radni@gmail.com>, =?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@dh-electronics.com"
	<kernel@dh-electronics.com>
Subject: Re: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Thread-Topic: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Thread-Index: AQHcvPIfLYxv1YIX80+eN3JQoGUUPrXAg34AgAAP8gCAACwhgA==
Date: Thu, 26 Mar 2026 12:33:22 +0000
Message-ID: <0ca7eed9-b528-4405-aca0-1ce9e415b067@solid-run.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
 <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>
 <20260326085820.GA2770072@killaraus.ideasonboard.com>
 <PAXPR04MB845972866AB6A7E85D1570CB8856A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB845972866AB6A7E85D1570CB8856A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|DU2PR04MB8567:EE_|DB1PEPF000509E9:EE_|DB9PR04MB9817:EE_
X-MS-Office365-Filtering-Correlation-Id: a77643d1-c59d-43a8-dd76-08de8b33e2d7
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 wBqsSxs/qfxnBJ2aDFg967NlEme0mCZxepkLSc1QVfCdJ8djpRZcfPNRNkiBu6cyXzI6PftC5nYIWRuGOo9ZTtnFXoCL4PS5cV3L4gFPNhtRoYOva1ZQVZj1eg+HovvtSUyYq5+HKdRH0Ix7CO1NjaaqvqSjW58DIxsUqCN1bfwzKEMzlgsi9sMdRHznQi5qmRNXnMBfxjraw+I9vUCrQS8Pi+mXlDv6eBMvohQstNNRZxOaKFLe4N4IlA6G3+ZRnAtgCbyPgzFZSKsf0Y3bVU4xP+0GLv9j03345q87oYMTyfyG0UuXv12ZC2UurZWLo9dVHWUJkpFnx6cQTJenjT9QpCXZpLxR7o/QehEVLRH5KuYe2GcP9Jt+9ldH2VkPCnnAS51M/Q3Ewf72HeHpX4y8bDfpXQBzGDVnS4Q6YhTOGvZ8qQhxUL492LEn9qCv5JizzGDlelBS+K8NU0JvIoyuFRN7Dm9m7rG6gNZY68hbOUOlL8ChVwvgW9is4moCJsy76LQE03Z5BjCXkOCrPIwGSFEHm9PGKRXrp+QFGgP9jRI+wxqG0U+fmYEyWlBubSxOGO87zQq/ZR+JNu7MlPMFJPsQGIk0FrOruJZfPKOmNlUE0pQVNdjQwgENN5setmfRzLECq8nexRAJ67iFPZCAQlDbCnNXDidnYNIEOhjmIibX0oWhrrmLS/TRUbLESpkX4ObOu8qc1JA9iZxVeffxAS3hH9koLY1uhOA1y+Fej5CBEcbS21nqbm9aXzJsZZrIypi4Jwy1n4zguzxSb7LshtdlM9BDdV1iWo/dRWE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E6B9BD94259AD47AF6D7EE9F91FE918@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 UEUabCMc5lS9+ir55x2/ez4vO3ZrYsYfoWvFXglpdhn0ayRlurZEGAK93YA89GjuMp/ZvSkgvrTx05Giyj7uMoGLHEf39ycpcXMgI6YgUZWJ647cEzVBeWoeniRQd7mO4jEyPZ2ITGgGQ8AIxhdA3ngs5Q5QWUslfCX0DNg4tCprjHinWYzWjobG0PXLG/cx83giTd6icdQtPFC7zo28aw/6wCNcves2scCqgpBI8CJioLA5seYD2noJaAVsc5oRqFoKtt4FFf8FGCUXHg+CATIncys5AFycvA+AE3DeR/uY/sFfvCWCUBZA1ITQtSIgqpjXZxsnVZmFLROly2jWFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8567
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8321cb1ecf694e48aad07d698542dfbd:solidrun,office365_emails,sent,inline:40d1c7f4ce00def599e120c0460aba8f
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2551b345-fb52-4f02-b96c-08de8b33de34
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|7416014|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Sa6JXgJLVIsRKbvGM4srTQPdOYv4C+DN7pZ9BjNiiRgEaZ4kDDrsj8vgApwihbYFiG8TgrYbZcf7sTwZs2pLadyESbPQMgGSEDPUign8oMWLYDEOJAnB/z8kCd7SbO3Hy05EyBBjgjusX+zlpDxOqW54v3c7WPVQzF5Y9Y4YKvB5e2HVI+kcaVZdivQXH5yVdK5eL/siRH91v4CVYFnsNLCoZEEBzxbqxO7TrbPydN04BdKX0aMX0GHwE9fRfcnppo+/K+1TPK4DGtRRTZDoPr+Gh1l1cbcvmGPQaL2gvUPuKQoQ7kkdw8jJ5zUnAHw9VXp8qNXjLOqb0RYR59Wkln3pCqUkCkWt2B890UTfruMrt4apxkj8jxCaBZKNqx2nMJr4PpXiEAqV9xQ4DifhK8f7N/ar/0F6YQPeHZGohvxFTgqq7ErBW0503jiNt9LiV13pvkJGoin0cPiX06b0ICgVSkv5nZvYclVkQnOqi2OH286sGksUpfgWWzfdaTgATi50HRdS7ENhZcsqJ0qhm+QOofQvY90e8R5e4M2MnTjdZVCf5ZcqK6OkkafnB40myZFZ33biW4FM8cfYxRNqnDJUCnTxZkVlvzCL+mtMFa4jDQzWMJ17oExPmvnuqc1e14svMUEbYdmKny9Dl13kqeyci893fqHdNe0OOZ+o6tJCF+WXTCZIhgDvU1kBprIh6MKtIve2ICRryE6A1LjJNqFf0b/jbblTPgdvZS6O8KSPkuxo+4YdCA8PqlHqMCvfa+b7mjTX+TRP2XnZZZ8eg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(7416014)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5G0K3Xu1egIXHXa/jYay6sXkOiFWH7Mbt5p6F0I17lvr+nFkOVPIlPbf4v3fd6g27O1FGVKU2LAJQs0PuKDdHIPresPHB2qZkgL0bGToKMvLU+TlkxTbiMbx3HmhMUAtDO9xWDsAf/5WUhYC+H58Ny9zUPvQSEUWUNVkbyc0Wx4XWj6a7zR1e4pxGhXEAPWp7kWs06dSiF6CRoHz+FxjY4knBvNzsklukcSAzutWLqiP1dCiftbJ0xM0YsmAisYqkIzBFzqBpTvCxOz9fRxqizXzxx8zbVer5de4VWi5LG926SLvUDuvcSGT03iAW80H4ttZxUh041j+SqoVV9lS7tHg9bcBVs6Dqe+0HezRpZwSOMhafrJT+y8/YM1tCfHtpDDqzuvMJA7j/9y3861t2PT2fW+YSzEdXtZ54TzWdPGoZ5bXo2flBp/VVS08W3gw
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:33:29.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a77643d1-c59d-43a8-dd76-08de8b33e2d7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9817

SGkgUGVuZywNCg0KQW0gMjYuMDMuMjYgdW0gMTA6NTUgc2NocmllYiBQZW5nIEZhbjoNCj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDkvMTJdIGFybTY0OiBkdHM6IGlteDhtcC1zci1zb206IENv
cnJlY3QNCj4+IFBBRCBzZXR0aW5ncyBmb3IgUE1JQ19uSU5UDQo+Pj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXNyLXNvbS5kdHNpDQo+Pj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXNyLXNvbS5kdHNpDQo+Pj4gQEAgLTE3NCw3
ICsxNzQsNyBAQCBwbWljOiBwbWljQDI1IHsNCj4+PiAgCQlwaW5jdHJsLTAgPSA8JnBtaWNfcGlu
cz47DQo+Pj4gIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4+PiAgCQlpbnRlcnJ1cHQt
cGFyZW50ID0gPCZncGlvMT47DQo+Pj4gLQkJaW50ZXJydXB0cyA9IDwzIEdQSU9fQUNUSVZFX0xP
Vz47DQo+Pj4gKwkJaW50ZXJydXB0cyA9IDwzIElSUV9UWVBFX0xFVkVMX0xPVz47DQo+PiBUaGlz
IGlzIGEgZ29vZCBjaGFuZ2UsIGJ1dCBpdCBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZSBjb21t
aXQNCj4+IG1lc3NhZ2UsIG9yIHNwbGl0IHRvIGEgc2VwYXJhdGUgcGF0Y2guIFNhbWUgZm9yIG90
aGVyIHBhdGNoZXMgaW4gdGhpcw0KPj4gc2VyaWVzIHdoZXJlIHlvdSBtYWtlIHRoZSBzYW1lIGNo
YW5nZS4NCj4gVGhhbmtzLCB3YWl0aW5nIHRvIHNlZSBpZiBhbnkgYm9hcmQgb3duZXJzIHdvdWxk
IGdpdmUgYSB0ZXN0Lg0KPiBUaGVuIEkgd2lsbCB1cGRhdGUgaW4gVjMuDQo+DQo+IFRoYW5rcywN
Cj4gUGVuZy4NCg0KTG9va3MgY29ycmVjdCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IEpvc3VhIE1h
eWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0K

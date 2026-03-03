Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11A37C91D
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571750; cv=fail; b=Fj4y+uktnVZtJBikjroXAX9lU6PsqFt+8YgwzgdzDHwhYOCmGPLfcQrKFwmJQwfiY2nmuvnldxmNcRXNixAULDgNIAWIpf7Np5QfNsv8mz0jI85WwFNeWw6hpab2lSiKDjOgK+RzrZOg22TjDfwJCtMldo83IGq/jsmYzhT/tMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571750; c=relaxed/simple;
	bh=zQHIUXwIkKitxH2zS7XvWrFvxMr/t52m+PoBMPwEpSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nxt8NVC3ajJyH5nu/nsreurAPUv/sKoE+LUxlReJ+/ZvPoiVmmrKB06fMqwFr7nBlt35qO3k5qW7BgsGUTLxNTt+SwcJgosB83sSlfKDD6ZmFJ3+8B5uFlaZMkBDnDbRoHIiKwqXnQ3qOl7uLnzzQqdJ7z9xPXWw3CPeJUzUMCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RXMzK/RZ; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RXMzK/RZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjwcM1tVIdpYkdczuVlPq5NgIGpQhJ7kx9QTDbVE76s6NR2OZijMB9Uky+3dILH3h3/rAvG2u8hAFLcpJuF9BpgcEa0bqdwj3i9RMCSkVAuR0xJNmURvJfJXCMW74gwDmGEBciW/tO3GKoGWKGiJ9YMRJ3E/kmDqPRTemUG4Cd+CZNZnl8fqtUG3qsoJB+kM9WFme6fQHOi8TwyHDrDa3mAG8I86uBY2XiVt0aDCzEd01FxptAcuUWBhk9qBI/sBaMfCtPxxLbZWi7OOW2/Y1LpSlo4eA8MtGaBcFVtWsxf7WbuWymRc6A4q8RxVWRAjGG8AcltSsj6ukCHgcfZ1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtnqXfZkgakcKUK6mYyPto6Ynnlh8k2pykv8Dt7nElA=;
 b=LGRTMM5xrsoqO+hOQLLD3BBk0JfBT8TZVRPabz2IB+xo7E83meiknzWvg4tiSdiXhlnyAEmO4e+UyGclm3T65W0QyEv9Xs1gvOfqzmnGZCvvuSmOtUvgGjH2BL2gtqAI07jNO9nKMKc08gm82Hyx9p343ysNu9DZ6wwJWFRRoKXIKISbVK4DG4zAJogZtMzQxLNGLBCvZFwHDkDf4RHlDQJ4uHZxbgibT61hvfufauTlQMCppDqM5CrXhQNnnqwIVe36D7dlP98hinZ61+fTTHdJWiWqtYStMIy7XjyzYBwDJK8p6trB15KKcNbSKemjEDE8A6uRfk2Lb9wFVyjMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtnqXfZkgakcKUK6mYyPto6Ynnlh8k2pykv8Dt7nElA=;
 b=RXMzK/RZPMN/5JoackYM9i1yYCE9SakhDkPnGC2xeJUJ3RZAQaYso9jJb3kmYZnWW0fUxV4RfCc4Lk4eOETaw+lke2ckPPveT3565F2EJ9l2jIUCrsvHyyiKqY/xDXmeDwJFC60XQmQhs8ammBHN5VpidbX3XIHERlahXH11DFW7vPYTPjkKDAD9cg7EuvfPTSPGUrjGa0k8bjKC0phmN+wTqOTfqV90fEd3kp/KS4fTiqHx5J4bI0O6fZh9R1PQohA1nFkZvftlL2FHU5/AHOhO+XlewkDg/oPnlJDzjY/Ko04719AzE9oEZRp9yTsxS/G+bG4/ZUpIkJFnOPaN8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:25 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Frank Li <frank.li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite DART-MX91
Date: Tue,  3 Mar 2026 16:01:03 -0500
Message-ID: <20260303210131.2966214-8-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5ab5a20c07cd0631fdecc7dba03f0ebb91dfe098.1772534362.git.stefano.r@variscite.com>
References: <5ab5a20c07cd0631fdecc7dba03f0ebb91dfe098.1772534362.git.stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: 62855def-6234-4131-46c6-08de79682ba1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 OIZnp0ZjxEaAl7Vl12eURwDQnfHyhPlkcqqhnt7Z8HLXWFE8MaLvOI5hUhEURDDwh+C37wO3VxBbgwQwcGe9ozXy9cr+msAfBatSB6I/Ms5L554UTn/Ilp2h0GKEAEiG4my+RQJjghgjBhEGRvjmKctOiKZ0lSByRHePBsAmevVtWQ6fgtjQX6KJhBNfB3gzktUET/wf7KZNBct5elDaLDz9bNz0gjfApGyiiaFhYzvqFhpQ2hPaU+jUllgwTLe4IfL5nDxPNAi98pEqmo6kAWFu26DdUPYCXCFJ8CvMujJSb1qnIM4RzRctWp1fNPbkTj6Ws7MzizxkCkriOY4h9CLZ5//QZsYR/h9ragIvUSe5vhyoYbZX7JhWoD1zmfnos0xkOKAlNQtpjvTQfYkxvJzmQZU8lLuGiuOTDXRisqyZPLP+uxv7bP/TOAVp5evOSx/8jPcvdzMaxGFLHyOJX/uZbpBbjxI9vA0hLKAAmW9nyMdYJhYP6QQTnr+1HwX9fk6I0fIIwfl3rYX5mxZ5eHP+ZUapISRUnTG1eBL6TtHIT9tJYz1cAymt97PlgpWrZhJ7DH6kbZud4Gcum7o5dUv6piNsA95y1Mb8t+SRJThi/lAWuxE4Nf6xtsy2PmYPuskRZv/Gt1pf/lfxQxQ418EyFAomBMYn5q0Ut+to90NTmvrMAsgYu9HduqmGpnpDU5/6ZtCpuW3MaoGXKENsiNNPYqQsEGgdQkVmZMmodI0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zhatm3Vl2nW3pgefpUgourmkFiRY4uaK87VGDf6v/PEfyjx9m7vzEgqXfg8E?=
 =?us-ascii?Q?rKUpSE8B+1XRlhpGZdPLKmB83MHvnpL7PswJVgUTSWrFX2avNW7PG2zl613Z?=
 =?us-ascii?Q?wrpgVCBePvK/QJeG9AXEvEsMq+EvOBghIj4PDYY2XhVpj87yfI93JzR2PImM?=
 =?us-ascii?Q?imOK+BCo7OqSsikiBDDpEthGGdwLPC2jCZj6SDUZjMZ+WwIOoq6I8wrckw/c?=
 =?us-ascii?Q?m3UxDO8PAcc645Nx4mwc8xd5x15RYrXBZoo+5hbAodl9Kn7cBh/AgUNuSZnJ?=
 =?us-ascii?Q?+Gi5mhaV4qjJOvNwBioA4YWK0ImJP545oqjP5VUwwXeYczH22/RY5wC1oJfe?=
 =?us-ascii?Q?PKsRtlDwvK2nwmAsB4Cn0VPtEzjxq0L6wGyp9ylYfuAn/geOkZphkNrnVqrL?=
 =?us-ascii?Q?iWO50yGmJ2XAyJcbCq/kxVzOYNnnothXlj/zPqj2iAooUciR1FcqOzT+1NrV?=
 =?us-ascii?Q?RJjqWplMO6vY9uxAINDfjV/j9YJNjtUddePt5Erp4vEA+oYMUx8IV/UGY2Np?=
 =?us-ascii?Q?rm2Ri9dwKOoLr+PKFtm2/8CkB32Y8S+KDjvWavJAraPUTg3GbaL1wnnZwJC+?=
 =?us-ascii?Q?+fjfXoNgwdrVmbgw8Qr9cFJyyvmOSjA/nSUJlSxVZ0SdqJFvSoGVMf4gJvPB?=
 =?us-ascii?Q?Bz8YynDDyE6XE99yNqWdqOVGhjK5W/EE0oFcuUDOlEZRjjwalSuU3ty44UtB?=
 =?us-ascii?Q?cX8DOqfu4gNwMft5x5DDlq+yvbSRJuA24KfBQvCyRCZ3oAuxx7DIC0c3SAqX?=
 =?us-ascii?Q?DUBYz5znIEDECAgLV1zYBSvUWRmOVB7IUtsPR8XNX96JLC/+wphN39X++1vZ?=
 =?us-ascii?Q?giR+hxlbaoMQcvR4x9MM90B3cvs/elc10vzz64mWNUsEFnFA3iukFJbwJbqM?=
 =?us-ascii?Q?3qdRmkz58y8dr69QsRPXrF09TwDRBMZ17Az28shY2Dk4gC+afAwr7hV0aNw7?=
 =?us-ascii?Q?ON6OjEKomf+j6PqH4vUbuEXQTDfqIpE3e/t4mVWopNNwjxpIs/YF1uWfApa3?=
 =?us-ascii?Q?aOL/Z13ZmvzIH28f1aX0nsduOEmkXV2RJdUhq7lBEjl+zYkjTVk4fBLJOj5Z?=
 =?us-ascii?Q?cSmO3DKiBsw6+0SFmp78lG2QAxrwfCN6cGOdfMiSpNaLV8DX+KRqExWBm+1v?=
 =?us-ascii?Q?+GYyjrjjok0Fi2i1hchuE1jcXCJMoWFoU+jG4Hm7H0RUza++pI3RA86MAX4c?=
 =?us-ascii?Q?5XY2dWPIwiWzME0O0ko3oh/MY3t3aQzk4qjIbXXiPDCqZcVSVckOs0Wr5Hnf?=
 =?us-ascii?Q?MdWYY3bdHT2yWcjHxf3cUoe9R6ZwzTrQnkrBbBxl41bCluT4bhG69YI2A88c?=
 =?us-ascii?Q?nKxeQuAjS8eocyfSNwRvzyXbtLE3FP5OUM6mYOFtZ579XQEVr5iBWg+rhYjr?=
 =?us-ascii?Q?G/Ux5NgvKfhz1qEK7SprEf3Qhnm5iZzFlS8PEircRCozMHhgkkM6pN8FL2VC?=
 =?us-ascii?Q?ZlxGqfebEDeBk5vztwGg9Uf7QP+E3QsXzf4ZEu8F4l8vutdTOYi1yJbJTTN9?=
 =?us-ascii?Q?jaxp2Wc8DNKEuM5pDfKKXIFZvFo0BTGpnDjliqa46IXNVxxGWthEdRwG7dqY?=
 =?us-ascii?Q?4dzvVfMJHREDH5226nOHjzpEuYRVDysEWd26uiuNmea/5Wfh+WQsATpObepH?=
 =?us-ascii?Q?x/3O+N929+LVHb1VJc6okuiWN5j8sGKFO0ozVvMXtzJ6X853YpC6Dy3pRejT?=
 =?us-ascii?Q?w+BGHT+MulTflNJqW0idTw59XhXlQj5Htu4T/FCAO0ZOvH4MnHOohzcI7CS+?=
 =?us-ascii?Q?2T22fxuGqA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62855def-6234-4131-46c6-08de79682ba1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:25.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9Xl+HMB7Ml82FKLl2jNgx8q3N4wOWS7bU37OdemdaUdWymuUnJwPYQiytvtrc0ZVP7jPCtKy+ba9D9+gNnNRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */

Copyright year is 2026, which is in the future. Should be 2024 or
current year.

> +		buck4: BUCK4{
> +			regulator-name = "BUCK4";

Missing space before opening brace. Use "BUCK4 {".

> +		buck5: BUCK5{
> +			regulator-name = "BUCK5";

Missing space before opening brace. Use "BUCK5 {".

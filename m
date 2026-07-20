Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADC438499
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565371; cv=fail; b=HvfEz583lbVnL/9MRB6fzF1LwwHhXjmxlokoCeWZtKC8A64cwIjoPwlY3SnpQHyS2UekSYGAMVwC5l5GP66wZePyFoymWcDZvK7yNGDipVIySzFAbKzqLwJfnk+4TPxcPDcmn3jETbxoccBCQJLY6MqMCdXEcYc5PvW966WTZNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565371; c=relaxed/simple;
	bh=RxBG5Sz+lfpVdl0AQ8710t13UHdT+wV120TtF8qGREA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhZO86UAJDC2EShjfC4J6OYe9ut8p47DM9DKFWkYvBWyHCZqjxR8eAsSJKvF3NYFrGhjvuK1835bCDWRqV1wueiV2PwSItZc01QdehSXxiq1H8dJi9yISc5VB6yZfYaxan66hpJXJoS4s/CjcqyHkDjjdtG9QH8X1tU/vMy7uHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AIuEwqPL; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AIuEwqPL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8bwnWsA2fWSIIWn8zA8RSOAXkgseCIxdjcPjHUMgDJy6/H3KA3GtO8R2qVsjpH3T1NWHzuQ0MVgyYr5VR2WxaDHQfIDYAvS1am4Wx5wDM1azEfW15Hm8nKD0KUcW4IxlcT+5ow3PHiXUsattR5gX7PJFOzZslHB1QgyVNw/DX29sGZOSRUcQXb67W2b5MZjF23dgm9EFL2/jNqRJ0lF/lCkemO9J4g+J0rkreSb/Lmhf6fyM5JW3cvt8mLCCrRxcdd2cWUyeMeS6fDYLj1LjCoh86997Zt4P7xOaLmX1nGjrnJh27IJQtSJz6B4ngNvEfYZsEOlhn4hEN1x8Di0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kCfMrp20WTtllVC5u0XEOAzks0CbtjZITnr81MIBIU=;
 b=vxmq/dzqG+vQnN4doMcy4BYsql8lStWVqw2rFyuq+JycG3nxr2qZFVMU+NNj252GNq8szJMco1Oo+h4Ux3ydws48ZgfrkweMRrfgIXD8coAZtM8H9WrWOpxYcvPwB/09sWTBs+9rg0w749QyA7qHd8uvlo3IErHCWWhiISNTPs/RMhx5sGj58oiTIVR+ozBIX2860H/J63cS77W+JJfWBM+YSWIGjCIuFTCVquVEB+zyTyf6+EZXb+iWuhtKn1PZxv6YAKYaGvkydx7KbPD9Q4FUV+DIklG2I5zMCq3Y8YVkuA8fohqWea6BoW1FNtCf26UVvLwP+6Bk3/JIe2Ipvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kCfMrp20WTtllVC5u0XEOAzks0CbtjZITnr81MIBIU=;
 b=AIuEwqPLc6tGI0Xd4TO6oadoqArZv615cUtXWBRUkGOE4rnlSW1Td9XCVdoj4Zj2NG9um0Dy6v5DoedNVAjHqOc4NLF9eaiiZHiEAJ3zNoVBJNYP8B2kqO1YpjQZOTKo7Ap+UIKt7YMl8CncuEqZnuIqY5JRU4I8eAqSzEeL02nru0cb+5Msc62NFPsXymlFvnkSpdbAbtN/aULb+KcwvqkxikO/tP2i/U0sWTpOgksf+pP3YIV2fDJJD7DldLaUEZmVR4jp6TP7v5PwV1tL0EyZqVrVtq4aM51osi92T/sp9wTOOCG1IBNYMZvSNRFH3pAaGf3d8/ZYtxS41JjDpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by PA1PR04MB11309.eurprd04.prod.outlook.com
 (2603:10a6:102:4ee::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 16:36:06 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:36:06 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: imx: small change to fix CHECK_DTBS warnings
Date: Mon, 20 Jul 2026 12:36:00 -0400
Message-ID: <178456535495.3773539.2430327215432233206.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
References: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0173.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::16) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|PA1PR04MB11309:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfb0c92-b6dc-4a96-0aed-08dee67cff46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5K9HFzzhCNnJfo3vkv3D43+x5M/5DFPrfsIjGIzZ5O1No5pmhQHyqGjuj7r3TthNaqSp0PN9ClX88jijmhL/COd850pEBO/Vepk5ChgA98GS572KeU+E0dsJ+ZzRVTx7uO3JAcXjBjW5Iv6lWO/vaRSf+kcyybWNqFokP08y7vVOgEjIKwD5ijTm2wgtLHDKLgX3+4zc8rI+XAPAKsqeyEfVbtt2qx1jz8AfdnJnpMoldjbO/En/a6APrX95/eFjV6QVB5hsG6N3wVGbaqWyFLY4b9AXbRinNxl5Epf6s8x6XH3fVhSO0HL6ws95NRMM0NCzwpDJINzGHBwfvW+KtZt0hc8l9KamNp5wa4vy/83EsuenNOn4Q3OH3w2KT21vrKJntx3J0mglDMnia2+DWZPIpfByUjlOSflMNselm0nLez86ZlzXNsfUYVErygLIn7su+xNNoEuAR7oY3nDipjQvswVohXFAxW7ZRuVcomhyUkxJFybdD1susro9kaQXqwcpwJr1I+eGirFPPfJ05KZCX+IbbYMQT/cR1gA5+8OkMdxAB0uvQsO5SLocpcyDPIkavetA0iNkE8ACidjeBB9CLOuA3e5lHfLaNU2SyO1QMukU12ywV0HWWyHnF6afteocbUljzAsf9b/pJ+Bmkh9yXPOBOAA93979UfU+jh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEtIc0VLK1ZtcUFxVVdTby9kQUdJamZmaTc1b2YwR0ZTU014cXlERmZKL29Y?=
 =?utf-8?B?MDlDanFaUjM4M3VnbHdJRVlxeDg0RUVwMkFxUHBkTktUQy9HTlI0Ykhjckxl?=
 =?utf-8?B?OFBqRXdxUkl6Qk9TQjVEWnBYdFNQREFldEtmdnIyR1ErYzRtZVFXeWxhdlVk?=
 =?utf-8?B?OHBaYkx0aVVIbnloYnR2bElqSWNBV25sMW9sQnphNUt0YTh5cWJ6QVNaTHJs?=
 =?utf-8?B?R3VVVWtLNmFINWZRejdGeEsxUVNQZnFvK2UyTjFsREZ5aENZY3pkSjZ5bTUv?=
 =?utf-8?B?SE04aFNxci9CaW1QSitwbVlHM3g5SHNOQWFUbUMySk9ZTFk4dDlpUDExQU5B?=
 =?utf-8?B?VTRMTWx4RnNYeis3ZVFCY2Y0S3VPV0I0K0grNURFbnpGOUlFODMwa3VpNUlG?=
 =?utf-8?B?a2hLTGhBZ0VXNDBQQXVQOERtUEoyVFZqYmNWQ1E5QVp2c0RzNUZTUzUwYW5v?=
 =?utf-8?B?VnBaNnJZYTRsbU02cmx1SkpNa0lUSzhYU1RIN1ZrSzJIRXZNYmtGQnMzYnJT?=
 =?utf-8?B?YmtzYzU2QzI2bHdHenhmeG0vMFZQUUsyeU5WWE8wUWtkTEs5aUdNR0ZFTEpF?=
 =?utf-8?B?TzBkL3h0REdwTHpENWxQZlYxODB6TGhiemh5ZVpVazR2bHU3OVZ4QkxmN1h6?=
 =?utf-8?B?QUxBNUxia3RGcy94QVlPTFdacFNvclJlV0l1K0k0dVBkVHRxNkF2akVSTzdH?=
 =?utf-8?B?NDdiSGYzRTA3bEpna1MrVCt6Z0NuaTRnMldDZ2VtOVBRT2hnRGlPd2w0TTVS?=
 =?utf-8?B?My9GbDcwUVpFRWs4SDFycEo2RFVDVllHaFVPdG5KZ2c5bzlqNTVYdTdvSGpU?=
 =?utf-8?B?cC82VjdqWkhjWXAzNmRZNWY3aGdXN2Yxb3QzUy9wRCsrY1J2bGhGMnYwTkVh?=
 =?utf-8?B?QzkwSHRsQzBjcGpYWFlGVjJLQ3BvWVZCdFlJS3YyR3c3a3AyOFMzYzlUU0Ro?=
 =?utf-8?B?TGRFOUprd2JpUFVINnZ1bnFoV0NlK2JpejVxZEZXNGdIeWxKeEk4dVB5MkV2?=
 =?utf-8?B?c1JkRmFKb0l6MDY1bDZuc3dxem5KTVhidWFOL1lzaGZ5aDJBQlRHRUVkU1dr?=
 =?utf-8?B?Zk53QTRPNG0wY0hJeGpiOEpsMFh6eXdTdWFYRkdsbzg4NGNuZ3cyOXJVWExh?=
 =?utf-8?B?VGJ2c0FXQkcyYzM0dUVlS1VDNlY1SWtMY3NFQ20ybUhMYWVuWlVHajVzZWR4?=
 =?utf-8?B?N0dsR1ZGREZsOG1SM29mZEV4NDdFeUlFRENzbmFoNXhQYldxd3l5bHZXNEFI?=
 =?utf-8?B?bjBHS1FrUEU0R1ZMMHhFWkRYZlgzQmgybEVDOTY1R0tlUHBHTzhUYmwzcWVp?=
 =?utf-8?B?Y3ZHM0kwTDlCbTRuckpuVGFvSUc0SkwvblNYUEg5ZmE0RC95SlpVSUduMjdx?=
 =?utf-8?B?MW1LSmNCRUM3VmNjOEtOdjVmYUdSeEMvN1RvbG1lSzJuRU5SZzkxTzZnQ0pu?=
 =?utf-8?B?YUg5RnhienJhZEJUZHZTRVdGd0VOSE9HUm9tVGxqQk83OUwyWGs0RE9WbDJP?=
 =?utf-8?B?ejdOQVJmN2d5NmtpNGhXZ3RBckJSMitxamFuRkliT2JFOTZuSzQ0VEF5cGg4?=
 =?utf-8?B?SzFuTG5QOUR0S01EWWFTZXhySUJjYWM3UWh3SVNMZ09rUXE5dE53bDFIZmNY?=
 =?utf-8?B?MGtSdExJNnIxRUVwa21MN2tsd2RQTnN5UlBZaURaUWs5VlpQWHB3V2VDVEFB?=
 =?utf-8?B?WkQvUTExSzhUVW01RWd3b0QvRXB1cjVUYkw2bVlwNHpMYkEzMkY4K3RVeTE0?=
 =?utf-8?B?SXNKWXZhaFNEaWg1bkVPQXZ2TDN4Y3hITk1rRUpvOFZQRVJ6SjgxT2NYaGFW?=
 =?utf-8?B?S01Fb3BiRWFmRFQ0L204MDhRdE5US044OEtwNC9KWjlDM1ZIM0djcDllU05j?=
 =?utf-8?B?MG81Tzh4akFrKzNKTFRETmttU0xxOHJDVU82QUt1dE9nbS8yN3ZJUWhsMHZY?=
 =?utf-8?B?ZHlnZmtQSTJxVkVoVmFwNkxoSGdOOHBCb29ZMFo1akZCSFJzL3NuQlNaR3ZZ?=
 =?utf-8?B?S1h2dkZRTzZubWw2VDVCSFNzMTBiNENDdVhIbW90bGJBa2F6a0dqZnorSWZY?=
 =?utf-8?B?REtuRmlacEpMTHE5RUxIVGdoQ0xVLysxRTJPWE1WQmhoL3FDbmFvUjVqVW9t?=
 =?utf-8?B?RGFEZlEvY0hvYVhtNXVGSnlwaVJhaHBEaVJ1YnEyMDNjcU5kZ2NyanBwRDJP?=
 =?utf-8?B?QU1IWkRabTJCVExMdWhaQzVYejJNR0g3WkVUMUoyTVN0WjJhWWIvV3JmRjc4?=
 =?utf-8?B?dEMzVUNYSDFIUWNLNW1pKzIydUlnaVNYMVFJMU4zU1FrRE03emFoYnJkNnMv?=
 =?utf-8?B?SHhHR0pNeG5nRmkxdTkyc1QzVmJhNkpNYnV3b21aejhIU3ovNjR0aGJlZUla?=
 =?utf-8?Q?jew/VzWr4oG48G4X+ManpK0GKq72oBzdIseFw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfb0c92-b6dc-4a96-0aed-08dee67cff46
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:36:06.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFb+ng6Vw7jv7jvkixm0yY/qhS7k4m3ML19COA6JzNjOSe0vlMw+Njw94/ih2DKWY+PPf3rKyUQgMlJ0Ycisdv4rnZxB1z3VASbNlSRtxpKTSDmLInZO9Q+kFbR7gHrO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11309

From: Frank Li <Frank.Li@nxp.com>


On Wed, 08 Jul 2026 16:08:29 -0400, Frank.Li@oss.nxp.com wrote:
> 


Applied, thanks!

[1/4] ARM: dts: imx6dl-plym2m: change #io-channel-cells to 1 of voltage divider
      commit: b8d669c5805736a7664524ec625425111863eec0
[2/4] ARM: dts: imx53-smd: remove undocument property clock-names of ovti,ov5642
      commit: aa5c8f1b5ee936661058455480e6e843fdf1d5b7
[3/4] ARM: dts: imx6ul-isiot: remove undocument property clock-names of fsl,sgtl5000
      commit: 5af3e703f2604f7a3bc44422c1d30b128aa49f7c
[4/4] ARM: dts: imx6ull-engicam-microgea: remove nand-ecc-strength and nand-ecc-step-size
      commit: 12ed4b9ab36a84a5082e13004d799c0d70200382

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

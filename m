Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707337A4AB
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752104; cv=fail; b=R3FmUMboXgl2XRRELqkPsWy5bjrJeFibp7Gkc8gYXdCIYlX5DOnw+18NQhAx4t+psnLvT6z0i48fiRfZrcFb1yFzvi2vgVYxBs1l26s96LNeHUz+L2eYwF5kptdDV7pLeQEc7/D+xLH7IqQAgJCgGunFsccOxSWQxg3tYGbD7ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752104; c=relaxed/simple;
	bh=5yTv3s32p4LpLxCUkJ/4yG7PC4l/APe5pF9J8G0KW8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UX30KT0LuR65Av+xHShmg7ITAlJuC3n//nIt2cS4t2ZTchzebm7skbUeY41RVPb0O4g3GvJBtU+dIk4CoZMOtbKK4fqCoAgjLaljh1xGQVcAwR7B7Szh/Fvl1cVmMPH3AVoTppAzYkcliaRhhV9O76Wm+8S5/g2QozZNDZxKKZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dR2mgVOr; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dR2mgVOr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikJ5RfNQoa/tetT0IBboYU8f8hiinmiytZSZEk0r/mv8GJ0Rm+UtOigYgr6X2qL1O9o6Ub3r4zixAkd7hr31RqwdN/GjCVMHNSdNGXkwDyktpgwZz6tYTNpOZE4TjBSkkXGi0h90+JsCAQOguNGUSb37N+2wMyt5Q8rQXm3sPEWPgkpedKzLYD9FyKS0/c7NhMp2J1bjQJgN/0UciQxGV9J9+rEG7YvrFYjHLmtuJ6ZZZ7qpbd5Z7Lxa1+bwIhGvKUVDDvHKE7Bq5Uu/vPia+2SyMxdiQkoSooRO4ZzB/+BxpbgkbJrJEXHo28XGEr/KW+6HJHl+9EVT1cYIFov/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1ucybvhAmroJB+jRmWJcq/0/Lt986qBEqZ9EiiAWhg=;
 b=uI75xVSFAU/93Y80BK3ZdvZ3AYDokdaJUwFBp0ZIwMo7/IsTYNEMhibTThZFSVLKdueHoiynL22botPDaJAW4A2ODrHVZtPK8h+BFkUX5qkKiWJluTn5lqzxXbFMqQDhyRKCDCXBvWNNKTmmDFPF//PlLyiRpFhn02FMr39Km1hjbsqKAkXaG7NiM7IhYdh0DAsvGYJrh2HC0+RzBPdr77YM977IQUMXBHUPy24L7f4AIDUuSShSg/wJj7gVNz9zteOqGXNSFsxGBHDNrQiqu0Wisk0/ZgNaQcfq8IzK8leiiKOMGfVNmIL0MnQXOmpaJbUHxGXbux1ihobVz7Y3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1ucybvhAmroJB+jRmWJcq/0/Lt986qBEqZ9EiiAWhg=;
 b=dR2mgVOrWJsLe24XPsxJ5z91UHV8numYFli0hqUE2+1SgtW1rkD6MTBHTB6mHA0+G2iwZraCB7/3yP++mioz4n64UJGcsOdcJ52xUgfaMnsOhbQWD3Dy9akef0w5JNH6DEpLqWebIAerAcAnz52oTxubAFztSR3O8lQIhHV0DnJR8dcH8SxOX9Zou5RYIgFNvudJ2V6LzRkX7mGWGet3Iqg0t+kJkgLy2kkjqOcxUERqmYU/icDS76GCW3uyZ2VAnguqelPDhqgqIoCzG7/Wvy/Lpl3WW24ZayTxSC1HyIerZqVjth8sPebprz0gIPP9LZ5tEL97EfrnySnshuxtEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:54:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:54:59 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
Date: Mon, 29 Jun 2026 12:54:51 -0400
Message-ID: <178275208785.2301828.5393918171145559586.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
References: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:510:4::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b6d7a3-fad9-4d22-96e1-08ded5ff27e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+0Q4t4XjbTexVgKUljwmc7RCIllBqhZmaUk+vYSUYMoY4l4LuBi38O3cBRx7TrGfNerDQUuu3V1jo92RSae2FiG87Bz1YL3y348Tei0mrcxeT0R+HJW6J3i0uw436hUCREWpa3SH/bsgeZWXMR/3smyIuiYxukneCVhK5Lp3fW3uQFHftzr4q8hyAH6kJ+lYGIxdxR9zDpowNAdqujLDO3nCLylj7qXU+8sXWyprgjDw98ksjCcqQOorFumXGUnS/m/SYwH9AdIIPrXEL/XaZqGz649WnjOsYVnYPZd1UYisXiy0h4l9F9tHMtcKli9W4sXdi+O1Pg5oFZotYYlJl93/FT6RbpDXVhZFwiUeRj7zrFyKg//WbL4ubVY8/kEF+LHOAWToWT17WOxiUlSwvgqZKxUUM0AWytkN1XZbr63+PX+8CkEc4Mt7Au04f6M+RHvGQ3D8MrAGRQeghDuSXr5cN3BQUx2qCDZwM95fboERjd2Ey7aXOuR9YJOVDupHzVw1keMGyr4XoI3SfYdzQvwQCNHzT+dOfdmja+qcGV8k611Rr3vsF6VPUtW62PZ716M/bbP9xnJkEOr/EJFlbgLMw+suHWTIkPaLfocrP4bqOkALLoNyw2mrEQQwR4Up2xYRFzWdMmGO2QnJDCzbFKYoCXnBpMfiRFz93Qx0MlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjNHMmpsTjQyK3pidXRENlJGOUx6c0FWS2FUWHFUQnlqMHVDb0plekxCUmo3?=
 =?utf-8?B?dktMWDdQTnNMWWFvNmV2M0tiK1hEcnJCejVUZWhZQy96dGcvZXNHMEVTUFJq?=
 =?utf-8?B?YzBwNGVTVDhxR1RsR1FlTVY5eTVXbFpDMFVPbUlUbTFJT2VYUHVNWHQ0ZjUw?=
 =?utf-8?B?OGxZUHlzQTB0WWhxYzFLclNQeEpYeUI3dTkxSVlXWDlkTDJmZkU1TGNIaWVO?=
 =?utf-8?B?UVRTOHpxWU1DTXQvcURYczBLR2wwdC9kYjE5eUJaVFVKcWpSdzRIY3c1WHdK?=
 =?utf-8?B?cHNzWU1QTHhXMFc1S2hBNDQ1OU5BbnJxWWRIRk5FcXFCSDNsOEsvc0Z1bnFD?=
 =?utf-8?B?M25JOFRCTGJHbnBiZ2hoeGZ2UFBtYTFzaHdyR1FiNWg1WjNrTFQzMzZBMlQv?=
 =?utf-8?B?c3BiZDBaMThxZk41dlpSZVB6TTJPUkxhendCWXB4WkQwd2J5dWZ2d2ErSFBC?=
 =?utf-8?B?ellmdW9KRWZ5THQ0L1NtQ3VOUVZwenRoN2Q0ZUlDYmRNV1ROWGc5NVg4MHhK?=
 =?utf-8?B?ajNmcUlKUFR4cnBQbGIrMDk0ZE5ZNEd3cjNQcTE5b3JyNnI2UjN0Z2REUlk4?=
 =?utf-8?B?VkFBY1B6T0dXM1I2SGJrWUtpYzlPaFNZUTNmd0tQSFFlZEloSk9XZjBPM0pr?=
 =?utf-8?B?U2k1KzZmVzYveUJQZkJ6OS82QzJpRXlHQ0dKYjZydEVhZzhVd01CaFJOK1R5?=
 =?utf-8?B?NC9iSVJKMUdWdE1nQXhTMk10T0ZHWlJCb2ZwZGRqalBWNkpMSlpQZmo1blM3?=
 =?utf-8?B?WFppK3BkZGpIRFdlNTMzZVJOakJoMVM4cXAzTG9VQWxmb0QxUmxLUXEwclpi?=
 =?utf-8?B?ODNsV0Q1dHU3OE8zQ1lIYlFtU0JtY0JTWCtkSlM0eHR4aGx5TFkwQmU2Yzl6?=
 =?utf-8?B?WmgzUmh0Q0tWUHJzaEJBR1RiblduYlNMOWgvRlA4NWZmd1ZmWDFCYUFJRlpB?=
 =?utf-8?B?UlA5R0RhZVYzKzJwZXpROGk0T3lYYmNVcjMvQ3NqNFk0S2N0R1JSWjhFQ2ha?=
 =?utf-8?B?NVgrYTdjR2VSVWVBeElYNHpSZVJ1cEd3UGZaOVdsS2EvTEt0WFh0YWVFeG0r?=
 =?utf-8?B?NXVyTDk5bW1ZTHdWRWV4Q2JsR3V6L3ZSWm9sMWlLQXQrNGtUcmpiNHY3TXh2?=
 =?utf-8?B?Q1NUOVZuTzgrbExiMnBxMkVxTHlnZGNtVUxwSlo5OGNJR1IvQktUM3ZsQWdj?=
 =?utf-8?B?U2psU2pJeHU0VDJ6ZXlxbGVsSTlsVkpHKytKOWs4aVJ0cDA1bm1QalpoWWw0?=
 =?utf-8?B?bHYyaUtUZVZzRHBBQVRBYTI5MmZYUVlRUTNTTHNHNlJjYXVPVG1YTTBVYmc4?=
 =?utf-8?B?dDRRRXhiVThFT3d4emZuSjdZOFdjS1hPN21iNkttaEl0Y3RFTkhKT0tCbFBs?=
 =?utf-8?B?a3dyU3daRndlbUhXdFo2MDB6UWhYRWtUZGkrYWdTeHZVZ3RSdHRhUGFXMU5i?=
 =?utf-8?B?aTdnUWtjK0VIbW9vb2lhaEovT0NoVnBQOThNb05uM1JLL1Zyc202d1dMamMv?=
 =?utf-8?B?UHVTRXUzTHFFbVRKU0ZHK0oxM3ZSV0ZPL2FzSmF2bG42b2VRSzdBZFhsOWp2?=
 =?utf-8?B?dEptQlJYNHl0endXN0lqdXlzMmkwZFJIQ3NzdjUwVGJuWXRnTEZBUjBMUlJD?=
 =?utf-8?B?TXpsSTBKckRnUjQxc3JGRGtveGpDdG5vazNLZ3JvUVlkUWRBRHU4ZkVRNEYz?=
 =?utf-8?B?bUlxVkF4bXczVmhRSytHTDUxTFl3N0ltRkNrUlFmVkY1V2lvd1N6alU1MCtu?=
 =?utf-8?B?NmR1Qlh2dDRHUkVJWUJxdDkrZGZhbCttdXBTS1JzTTU1VHpKK0pTYU5zUVBl?=
 =?utf-8?B?VWJzOVRLMnZpSkxJdVBVZ2Jqa0l6ZTd3Z1ZvSFhCWERGQWVMOE1GRFpjeTV5?=
 =?utf-8?B?VTVFOVJ4MGcrZ0VhbkJ6am9lS2p1eHNtVnZiVDg5a1M5ZVpsNkxkcDBHTDF1?=
 =?utf-8?B?d1A5b01RMkM2V2tTY0Rybm8wdU1VSm9aYU9GWUwzSFBRb2VqMFJtUmFmTm9Y?=
 =?utf-8?B?Mk1IU1h6NWJxNmxVTmRKSWFiR1JtblZEemd0UnVLeHozWUVPNkNHeU1NQjN0?=
 =?utf-8?B?ZG9PTFFxdGtmM1NzbTl3QWRvKzhnK3RtVWNQRlcybjlLVTFBbEgrWVRUbzA5?=
 =?utf-8?B?UTFMUnJDNWQrbkxvMFkwTjVDQVZpcjNkZ2FzYk5EQzRYUnZUWG5DWnNLRy9H?=
 =?utf-8?B?NkZFdUtyeWlFWGJERlQwSDdEbERXMmV1WUQrck8rYTZGSjZBWG5pNzN0b0wr?=
 =?utf-8?B?dWJNTjMvYVovNnBLZjJyd2xRUERGNUZqekErZnl6Ullwa25Vbm02SThOT080?=
 =?utf-8?B?M3BpdTdibTVhbW1KVEV5R25zc083WHhpNTFUQU5uWW1qcnNyc1pVa1pKK282?=
 =?utf-8?Q?SMZ6tAq9JwHIZfiEq+fplLKl05fWrrks/+TuF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b6d7a3-fad9-4d22-96e1-08ded5ff27e2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:54:59.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6E0AOt9ZlpazsgJg7oc8LInXJWyiiVGEBCnnVQFbp0Zej+KnLbs6UNmVtiyoalRcLaosZlwyw4n5GHE4eM4C8DQwgSmR/eyI2K++gnhTlW3jYhQrBmnsYbKUGHE9DSJP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452

From: Frank Li <Frank.Li@nxp.com>


On Thu, 11 Jun 2026 10:18:59 +0200, Philipp Zabel wrote:
> Configure HDMI DDC SCL/SDA pins to support reading EDID.

Applied, thanks!

[1/1] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
      commit: d701830f981856dd41149182c5d98ba996bf2d68

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

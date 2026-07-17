Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4849620
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302358; cv=fail; b=H3qTymg0l5qB5SbCXhOjgB6pAo3Xlg3vwWHhMV/gSYAk0SkTCguhv9hT4ZNpTlLtZZrITE17VuNNbHWCdeNt4Y1KOgR9n7McvMhQz5pMMsHhPUoGeT8sVG7xpc4KLNyHzROAsY9kzb3KQGclND58n4A+L0grez3/ybO9rQlhzBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302358; c=relaxed/simple;
	bh=RUn4moW3uD4yEyrCliUWBLyJwG1FVJVn8oYdiki1+M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hEq7gNgJBEgX1kYjLSbZvfEbyWMEDH9HzOjWA4WIVqPmXp3NxW0C/6ZUqxddC5M9TY++lTxBk7JbSrewfYga9acqXGfAw1muve58UfawMujRxYiekOnTtoH5lyrayejfY7D2rlRsZqO3vo0SBrdVI9WUaaHb8s8Ehpg2DDAx1m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kyEXH4Wk; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kyEXH4Wk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOfO5yxUAz1AWyFZswKL9qXbvm2ZVAhAmZ0tJv1tcF4Dtq2haZCwfOLi6aoTwfnGJxsERmKBJRqw/WBPXKxXX3hUPVub96Xd/HSlJg1lMtg5EYJiWdzrxORDTDEB7kAWnKvap83Z7xY26cJ9xWm+JT5AKDyU/qBtnXV6L4/glLXA/O4kkG4R8fRRHNiO3KQJUMUHzepXiN68+ATCYIboYIRobiATyUu5W27uIPMG5jmNtmw/DJYm9a8kJQhBIMrmVOGdUdoUP1/Oh+YFrS2SELGTQQ8Kjev0r5N0g2nTcAIq2+svmBQHZfEWjXONgCg22W2/H73IwL3xKP/8JkhShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXbuCOBiPNN57BJ5m4JDTkx3mbk1UiBM2WvbCogeFR0=;
 b=FGchTdyjhnDFq9xNAmzFjShHcaBWY6jKxdMGyFSAuNQ0Mn/3htCoro68Yrkpge18rDMLPl6HP9q12P/DBGedysZTBiTVWR23lBXwy0QEUAxa+XWEksKu9tFN553Xv/DHgnir+gHFCjtFSbs2v2eicV4N84QDvuzuaV/K4OPyYa0JXedMip0Bf7+SyA/61lSwY29nwhP5ciB9xojI3yYiEw6HzvxYArOs52Unhl65/4rTAeeEoFd8f9r9hdzDQ9/FLRKUkBHnSIwpfgHXttvTCaXAROs0uZ/t9Od114OfdQUKisxA2sKtf48ZVf2myXMqVbXwTF5w+f4Mx39BcMI/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXbuCOBiPNN57BJ5m4JDTkx3mbk1UiBM2WvbCogeFR0=;
 b=kyEXH4WkDDiUw3UcwfC31mqChvxFgx25xBK0ht0wHcmrgTJRaJ3IrZ6UDMml0rwKA8DcZhhHjYZ5b9tGKdir+5Hcsjtd9DaXN3HUbdxLDyUTov2eeVLtXz75ob4B1vB+E5Pp0X8wmlIEwjwA3zz/H2hy/szR5wT6Sba6vyZk/3PDGeC/436gNxiwRbWnI5nIX5yIwEj1nxyHR/mIqU3fh6X7m0oRUKo1VfSf4n+z2rxEazBBpVF3tey30lkvtiGqOIunRdZNkf4cO6m/nKvej0b0c/O436+OC+dgZwB0ykudb0VqNi5yscm3/2enqE5YKinG+swr1ZrUISut1LHBKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9909.eurprd04.prod.outlook.com (2603:10a6:102:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 15:32:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 15:32:33 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v6 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Fri, 17 Jul 2026 11:32:25 -0400
Message-ID: <178430233564.584159.13135506728491044861.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784284092.git.stefano.r@variscite.com>
References: <cover.1784284092.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:510:33d::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9909:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9fa327-b9d6-4b86-8a90-08dee4189ee8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
 V68DKRhnXnvwEDSNxWgegROi2Xzwg4j1nLhd5rDIB6xQ3KblPAfXFShO3uqikdRSsTSz8XfXRNO04vuEShU+gEQbag8bjKSEh6AYzsMqOHtk72fDtcXgUXVl1HfWlq72Hifpo560/T44jwPWLj9vL8qc3Du1AXj7h5CbOrMa9W30YzpdGiZMNOZ5Bp6eKo425UsKp6LEELLrX1zjQAgeck2bUdo92cI5WP1r+ibiHiCnnEOzcx63XfF1ZGcCd1JYUgLlzsqbVkqycsonSE+24tQ7+dGRXDaOdqRyr99DEHb1wlAZn1YvH+kfLS69Wwskdtm8UoxQc+Hsr/uE2xXkzegCgE5Oo19A9IK1xUbozcIRPtvRv9j8EX9skQfiTVvZbL2p6w3AoQP0m4hmXGP11eferMczkFtLC/ODIOtLrMw7LaewcFW1Tk4mqt6P2Y9UtZOHCinKdXtaabA8lK2JdVmh+Vxkuzi4KBzTCyhIyx0OWmflmKMgsh7pwJZv3MNPJv8Tra4ll1ArMUxXwQ4mbPJwEStXZK6R1O2c/O1ZEKybZ61m1gMBycWYtNXXVWY8KMaqft/s/VV2nWNWw9zDXRZG58/bUvfmAU5kkhFKQxoKkwfYXpR7cc9acKU+bcjN+0T8AKjaT/2IQ9RDpAQ1Xd+jdYiiBOEVRPGHQd8428g=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UUpIZW5YQnMwSHQyQ0JFd09LYU9kZndoQlE4SXYyQStyTU0rZ09FZ3l6d1Vm?=
 =?utf-8?B?S1JEMUJwYXdoNEc2RitYanRBdHFiUVNLaVF0V05FZ1lTMzNFU2t3cjZDSzFq?=
 =?utf-8?B?OVl2b2pqL2daS0RiRThWU0ErZXlDdzdQRzZoRTIxSkN6RDY5M0hHMGRSdFd4?=
 =?utf-8?B?dUhyRCt5L2lBWWFqZTBFY3NZc2NNQkQ5U3lpVEd3N0IyZDNoMUFpR1ZjeDJU?=
 =?utf-8?B?bzEvVktDSWxNS2RselYzbWk0TnRWOWhKTHN5UnhLYkgrWUdFRnRKV3dYcmdz?=
 =?utf-8?B?YkIvZ29ZNGhTMVJJZ0FNUHd1Z0JVbGRzK2pxa05QWEl3ZnlXZkZrUFFWN2h5?=
 =?utf-8?B?a2kzMTNmQXJhbHJ3cjBOdXBQNG95QWlUSVhvSWNhVU5NZ2xFRU1hcVErT2pF?=
 =?utf-8?B?QnlxUlYxemEvb25FQXhBMXFiMHpxY24zbTRCKzV2Ukp2QVJSMHhXcTlpOXh4?=
 =?utf-8?B?UDBTd2FLWkEyenBjV2U0cjRRcU1VTDJ5TXdXUmc3ZWtnSDhJdDdQaE1TdUFN?=
 =?utf-8?B?Qk45c1lpVlMwNmRRYmhjdzU1UjIwMVRkRllreWFlMjJCTkxaR25MZEhNbEZq?=
 =?utf-8?B?RnhDWHV0aTdsdGVrUGpWM2pIVzVBQ1hWRjVvWm4xSG83OHZjeWQ4RTNzSWFP?=
 =?utf-8?B?bC8raE9lVWp3dS9pNnM4SzBERnJjSm9sb050T1BZUGFtd3dNbzNHcWZLbi82?=
 =?utf-8?B?SWF5cnAzNXYxelA0NkFicFFCZ09OOWlzT3hGcEJVUUNqM0tLVWV6ZkpzRTQv?=
 =?utf-8?B?N1FyNFdsUFhESklCM3dXQWpNbTRsbzdsTmRVUW5VT1UrUzJNNUtteUxZYWMv?=
 =?utf-8?B?YzdYQ2c5SkN3VkMxVUU3bnAxQTROTjRZRGd1RVpKZnQvb1czQkVYdng3UDRY?=
 =?utf-8?B?MEtRWjh6aGdKZVpLVjhwdWJLclRRV2g4OW5CdUl3aURnVGFUZFR2MW1xeUov?=
 =?utf-8?B?c28yWE54SVVwS1RRWVhFQnNObHVqd2xmaEtKWHErcHZabUZWQWNuMSthajNW?=
 =?utf-8?B?OWtFTWVBVWxlZWpSWEx3bUhacldOQ2MydFhKTUxubSt6TGd6ci85U2Nabjdo?=
 =?utf-8?B?N2psMStLdzdiamtnU0ZhSE1UcUQvdVJjUHllMWx6bFdZczR6YkZMNUloZXR2?=
 =?utf-8?B?ZTRzMjFyTU5CR2VVWDFmbUZzQm03cFNITkF2a0FIanJvaENqUzhtTHozaVpz?=
 =?utf-8?B?YU91bm1CVm8yNUFuSVloSHFVdTBRRW9rWWpqQXJ6U2RYQWhURnVDMVNTSURS?=
 =?utf-8?B?dnNtMlpRSmVHOGE4QWNrSEp3L0FuYzA4dkVUcFg3blVFenR2emttUWd2UXNk?=
 =?utf-8?B?Z251Y1RVeW1aSFM0YldoaHRtUzB4Q0wxVXhFYjJyUUFRUktQdFlIS0V0eDZ5?=
 =?utf-8?B?S1pFc1pkZ3gwUjMrWWErSkwxMTdrcGlZOEVOaW1naS9TbUc3R0VTQXlQakZo?=
 =?utf-8?B?b3JWdTE0blFMVDV2bXhFeFAwdDNxNGloRXArd0tuOVhMWVpjaGRKdEpyc3BP?=
 =?utf-8?B?S1pZUEtuVTVTY1ZRdzJ4WlFhT0RwZ2tLelpUY2xhVURRaDdUL3JFL2JuelNo?=
 =?utf-8?B?ckttTTlTZDN2bzJJMi9DQmFFMG9mdUgxQk8wK1dIQjFQb01oNnVqR044NHBC?=
 =?utf-8?B?ZVpHWnhjRmhMa1kzSlBMTjl6eHpNL3hJY2lEZy9JRzhXOWZDdmtrZ3FOUWox?=
 =?utf-8?B?WFhpV2Fzd2Rmb1pyVFJQQWpiUEZtNC9wbWs5bnJpNWVVamM0bll6TUlKTk5k?=
 =?utf-8?B?eGRwZW9VOEt6WkNmQlF6ZWUxYmM0eXJieW9MTTZQSVpsWDNzTTZSSjV3Y1BU?=
 =?utf-8?B?VWI1QVZvUHRmbW95OVc3dlI2YTN2dWhVcURENDdMUmhTMnJKS0J5SWdseXZk?=
 =?utf-8?B?ekxIaGpsZ3FvY1kzSlBVbnYzRXZNWjY0UmRkMTNJNEhRbVVGS2FiSHpIYnFF?=
 =?utf-8?B?RTM3cHZ1U0dTTFptMlE1R0psVjFCSlI3NjFoNHdDZDNhaC9jcmpLcW1rbjhr?=
 =?utf-8?B?b3pHVXlhemI4RUJ2Q3pPKy84V0YxQnluS3h5b29zRVZsMVRzWXFRSDkxSHBE?=
 =?utf-8?B?QWEyaVIzRVA3djZScHpYRitvem5EaGdabFMyMGU4WGdlbHBzZE50U1FuZW5t?=
 =?utf-8?B?NmVBOTBRQ0RuWi94SnRLOXM4dGJIRVRZWUVnb09nRVV3UmtpcXlPWld3TGda?=
 =?utf-8?B?VllMVzQ5UzhMT0kybUpBeTl4VDVUMi8xcnFuR0NVYldvZEtjS0Job3pJb1JV?=
 =?utf-8?B?dVpVU094N0F0ZG5QRUQydm9lMEp2VnhVbDZ4a0FsaDkwSXQzdXhFclppdW10?=
 =?utf-8?B?QXhGZVpKNEQzb1RoZ1hYK3lTMFdFOUZtdmZaZWhrNE9WeEdUS09sOXBIUW5j?=
 =?utf-8?Q?NeDNeMEZyDNOHTss87LdKFgj69oYXfmVIqdWn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9fa327-b9d6-4b86-8a90-08dee4189ee8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:32:33.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfGIBOzsgyrMsRTTsSJmdq0tYfgxIIhmoKdLWaEy0LKZq83ItXbC3Jizq69oRarD2R1BguOTogc39HIB0D8+X0bfWQ4CKHO8CDCOWtTK6UUVB7+1rQfV95K5KY3SpkYB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9909

From: Frank Li <Frank.Li@nxp.com>


On Fri, 17 Jul 2026 12:29:36 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
> system on module and the Symphony carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Symphony carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
      commit: 4a3f4d08f53242dd6524285fd37c01886aacd0bc
[2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
      commit: 868ced4df4ef1169802c400a685820f2f1fc059b
[3/3] arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
      commit: a40fdbf706cc643671e41b9ac2f9ec3a832e769e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

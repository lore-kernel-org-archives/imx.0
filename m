Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845047DD5E
	for <imx@lists.linux.dev>; Tue,  5 May 2026 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000869; cv=fail; b=qEjmyEIYu3B1wiQ2SReVeXUxTqcOWjrJ+Dzk4dIPwCyHK2l8vnBdAE5mJScl0c/BdIJ7ERNfOv6Tvo/VWt1yJ8dHmLk+1nBlxA3l5Mlzss/FPYxcLxdPYWPizJvMhDVO5jJOkqX+KM7QIbFiKJVD6j44SxbahxTA87Y68SLxhdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000869; c=relaxed/simple;
	bh=6x5qQNb+b1XLObDnbhnW4sdnnFc8DEJjSKGXYvV5ogQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=lX5jHd6gXz2BKyD8psBkXjk4LKOaajo7BHKX7NWUd+OOG/hUbLbDMB0IPY8Btw7tslKNDP52zjMACQU/No9QRoPKHdw/Hr6SOY6S/67d0TxuR6kZF7KtVWVRQnbZeWxBqESVaayeE62gSXIBSXSxQysdm3UETtn9PEa4Osyey9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T4ie82J3; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T4ie82J3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9OCvPtHeYw+4r0OCQZJRcdYBlOuGxSDCFap8iNjkzpfTkYevTABcxtJ0rCq60ndnyTC1VaMBrvmcGdjIooBiIhWVJjjXJHWoTPIiqsyDxfxfUP9NtHUK7aY19hqSqGK1EifE7yzdRxLEOIMFCPk+i6FR0F5siUClxieKIjTUNEM0y9H9RhzD15Ynpnkr+6Z6bz1dkcp9KE2chydR1ur4cmvdNRfpOaw2S/897qvjF/3TaYMhCNf7AY9BMKsnEmk/zjceeHW8krHQqom2wbuocj3rRF15rCLdp2+oQPImV0ATG9FshntH4KNWl5aDqtsqqSiN7EKSQ/08QVUjociHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8Lb6HltNbHAEcjKrhdrVur0JoWbjpywwilZ9nAgU5M=;
 b=jYnzDH5ccAoYUKwmcFsxhsf+M6zPTKh65W6yLkFPC7oUncB/BxRWhNILzHRwFcMuhgL7WYCy6Ptyu0+V2G8x+5Py6KoBfOZp1lehKrzV88YRHBA+BJ3Kw0Ijjor60cnNv0mKOfQGytzp/2H39wFKVgsVSPCscFxIJ7meyPj5LUF6xRHNxIXq/bpdQlIzNKufI2DhT3i2LYeZC9VAJsI28j7O3mi22VngrTjYAkbUvdiUmT9ZyWyUtz/OrZwjXa7KrlsuY/+mHK+ljxy6tgCR4LL2+yKUMFFavqqkd3BodNV65V2JhC9O5F+M71OhcdL4Ebb9daVo/2Ek8kLmPJ9hDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8Lb6HltNbHAEcjKrhdrVur0JoWbjpywwilZ9nAgU5M=;
 b=T4ie82J3VC/pHzO4aQSDwcA1mEbZ0STaoS6oab4bDxjawh6G9z8ICfEVulbJSfMAriozQygdo9bcb5KDm1iXiKJLRHtn/OEtHihNJxBqLBrz99fT+FCfcsDYlurV6hB9tHuzw+wkeiNPYMl878ruoZ6N7yt7lo64lVTZ2X0dwW926VpBko+Iak8Z6GBLV8SuIMwn/n7bTVXtZ32yU0N6gPNbOFv00dSlI3jpuOiyZq49b4uB8AB/ElQyHlCWjjK18uvczjKNetfeP4VZxV0QG1KGwPWqsySk15V8BeU5R/SE2mJkxDFjpKmY1zV19CrOtCcAthgHPSLkoiX9E0/CaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10454.eurprd04.prod.outlook.com (2603:10a6:150:1cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 17:07:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 17:07:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Florijan Plohl <florijan.plohl@norik.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 upstream@lists.phytec.de
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
Subject: Re: [PATCH 1/5] arm64: dts: freescale: imx91-phycore-som: Add
 gpio-line-names
Message-Id: <177800086126.1579154.3760066337500931707.b4-ty@nxp.com>
Date: Tue, 05 May 2026 13:07:41 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10454:EE_
X-MS-Office365-Filtering-Correlation-Id: d76adf79-6780-4a5e-7635-08deaac8d2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|19092799006|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PQo2Q9hauq/FzZrB6OC+NoNMBRzbEz7VmTQAWlfxSr0vrFGCDspb8+gLFPrNMjOefnPsEA1yhyqPOrv7Fmt97V22NRoenZ4SW9+Mr9kLjjuk9cCt4tDi+rKLuOZaiNmwvGVY+OHw6JOb0D02THVZ+tQuEVuKJxIAvxyr39IuH8zDPzFqXcNFqg/n+W1gC+PIfrnnM/Winn3k9vWq3tZxVyY74UcpBiTKpgcuMx6DlAfKSqiq84luB7yF8LYhZVt2y28fOd2Q2RSacTLvajyGiY7eCRCqx0pfosOhlB540Vl++8UefJlPgqzYD6VdynfGtKC5u6m7ffE3yOdwzEfJiKPMKeyOQB3JbL+qOj+GBX6scsoyNEs3p387aOL+oitWkSuz/L1sD9ndQdJE3T8eBayxATrnrl/lrdkiKgGF23BPw70x44nbWZTGP6/+yAuMNONhYNSnqKvQA/6vUnCMAuFMPuwoDxuI+bDNU8EaMST/F8at9zLvUx+3ZpIVAr60Zf6Mt7DV7HT9z/SbNFfr7V4PKh9gl/W7X4bLvOXgmftV3XHvIGEjbqHM4YWjMSKHBb7B7iYbyO/8Frr7xaTyW5VE0xkNXuHx0ucfTzoF2m6EbTx59Uj4wASGx7KsAJnolTAzmOXDQGhgIxQIhkFeqr/LQ0I6yxWtc758lKTAeFR8+yCz09lFH8iC3WGAckAqxxgkL7xAXRZ1dCMDgpN6GcPxs8o7pFZx6B3Ir9hbx7+2V6kzZkk6eC/tPiOH0ucC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(19092799006)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lpcWNWaDkwc2FoeTFqOFE2NEhNMVNkUE5MOVN4VVZrQTJQVUF3OWFTa3Zn?=
 =?utf-8?B?RHV0OUVsd2pIVHhLZUduT3JSOTlDM2FUdEdzMjNmdDNNQ1ZibWxsSFd2cC81?=
 =?utf-8?B?eXFxeEpUaGRnbjBQdm53OGlKSWZTK1gzK2lSbkh2ZXpCRXhoWmZudE9sd0Ux?=
 =?utf-8?B?RjJOT3Z2c3JSUVJkVWpReGRCVllhanJKOUFIOWZucGZvcG5JVzJzaGJGSTFF?=
 =?utf-8?B?WnFSUUNXM29vOGJGK2ZlVk4vY2YrbnJ3bDY0UTcvdUZwWlE4U1NPSlFlTTRy?=
 =?utf-8?B?MUZOLzB3ZjJMb3gzNUFNZEMxREFPeEVrM1JEL2FLcjJxUE82V2wvcnErckVv?=
 =?utf-8?B?cHhxTWUzY3BOVW45eXZoY2t1MnhhZS9jeVV1YkU5cjAwS0NDYVFyMlNDZmxz?=
 =?utf-8?B?L3hML2p5K1BnVWdxMU5VTDB5WTA5WGVPT1FETE9hdytYOHBxNzVuSkMxMWZs?=
 =?utf-8?B?S25sbnNKZ2R3alFXUUdJRUR5Wjk5bnpLZWNYRW41SUxYeENxNUtYbEw4cnFk?=
 =?utf-8?B?VURYWkt4UjlVTVBTWU95bmNLVytNMFpLNlc4NXZLNDdkQU0zWUNwRG83RW12?=
 =?utf-8?B?TzdsOE9rSGtGYVUzMUhNd3JFQ09XOUJ6SGpUSjdDbDE4S01IL21OWmY1UU95?=
 =?utf-8?B?K0M4dVZHSkh5YkRuR1cwZVRYRXZpQ1BSRWI0K01mU1M0TVBFL1dLRHNPMzBF?=
 =?utf-8?B?QktMdjduVFFBdDNHeGJlUkR1dFY2c3pBR2pzS21DQ2I1L21BZm5GeU9pZ2cz?=
 =?utf-8?B?M3R4MzF6SXJzcnBoYStycmprMGRySVkrZFNuRzlGQXV3SExyVzhPdWQ1dFVN?=
 =?utf-8?B?VlBpNmg3TlEzTjlpZ2JuUW52SDZoNGg3blJsVTVvMzJSL0Y5VnlOZThDVlFE?=
 =?utf-8?B?T3I3NklTWU5oVWh3VlpwVDBnczFoNSt2RG1vNmdlNzFuRFo1VHMzbGxGMU5U?=
 =?utf-8?B?bjhPNWVBVU5mWGtYd1JaTjB6WURWbTFBd2RUK3A2TmxHQ1k4M0NSejVxZEtq?=
 =?utf-8?B?QnFJL0Y0MTh0TG1SWWhXcktBVHliZ0t3NE5waEVRVlhKNUh6N0NzdElHOFZO?=
 =?utf-8?B?SzdWb1hrd3B1SFJtMXVpMXBZTVA5aTN2ZDJWbkx4eUY2SGdMNWp1VTF0bFZt?=
 =?utf-8?B?MERvRjdBeGNDZk0yTTk2WWVuM3lGSkxvZXVBZHp4MUQwOWp6QzlSSjRmS2hx?=
 =?utf-8?B?TFEvWjh6QjUrdmlqZlZsMG1pWGdOSW9UWnJoaTNGdUMrN3hXTVNpdkpBQmRk?=
 =?utf-8?B?N2t4c21wMXBzQjBOcVhIZmUvL3VDQ3MySnlRRUJvN0VnbkcvelAvNUhpbFYz?=
 =?utf-8?B?TzB2a1ZxSjBkTE5sbTVUU3l1YU1HRVBhdkpHSUM4RUpRUUpucFVlQ3orN29m?=
 =?utf-8?B?RjRhaENZbitMaVpGdWUvaVI2N1VySkE2dXhZRXp0SkNxNU5wVUlVd3BpOGg1?=
 =?utf-8?B?YmI4NDhsY0taYTdLdG5vQ29JbENHZ3lPemVsWFZPajMxVXYwR3ZHVjR0andl?=
 =?utf-8?B?bTNKWE85dWozTWdCTVpjazZjUE1LN3BXZlRpNUtkWmNXcEhuNkZaVTZmUDNE?=
 =?utf-8?B?b2pROHA0RkZVQkc4UEVrU25vWklTWnlveWZnVlpaWHBraEttenYyWGNLVkRk?=
 =?utf-8?B?ODlVWS9pYWlLanhnay9IRHdXNDVNUXZadWZXT2lQQ1c5Z2gzalMzYWtDbmFY?=
 =?utf-8?B?djZyaE9uRnFKS3o0SjAxR0E5L3RURWhaQnlTUkMyZXlkaDA4Q3BtdVZ4L09W?=
 =?utf-8?B?Mk41ZjdLWjFiOTg0dVFsM3dMalRHVlA1cEJ6NjVXMWVTT3ZHKzZzcmVWRWxk?=
 =?utf-8?B?Mk5JZWZNZTNJQnR1dEpvQis2N0ttOXNQSEZkckM1c3RuQnpaaXZiaExJaFFY?=
 =?utf-8?B?bnV0QllKZW0rTzlHWU50azduWkpvNFNUelo1Z1pENWVHYzFqQi92NlV6dnAv?=
 =?utf-8?B?L2kybXJ5MUZ4bzdHNFB1eDUxWlVZcUNWa2FuTmpycm1mb05DcmVTYkJjK3I2?=
 =?utf-8?B?NFk0OGVEWlJsR1dPa1o1eWRUQXVmTWY0MDZ3VHUvcjBCbkROdGowenVJN01F?=
 =?utf-8?B?MmEvYVR1UzFacjA4b2NQNmtNTjloekZKZ2JaVVFYeHkzNXovL2R6Mm1lR3pu?=
 =?utf-8?B?R2h2UVN1RmMvVEg2V1RoTmJ1dUJXUkNjdmtGamF2eXNRZWhWeTljVVNmNXpK?=
 =?utf-8?B?bDMvTzNLZ1VFT0hXbWtHMGRmby9xamNSQXVKR0UvanlQcWlyTjk3RzNJWUZF?=
 =?utf-8?B?cE84d3hDZG1LR3E5RzlVanB5ZHhua1NtRUpqbVBsYkpWa2NXL1BaOThTNmo3?=
 =?utf-8?Q?XFCsC2xnMRwYtRiQqA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76adf79-6780-4a5e-7635-08deaac8d2f3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 17:07:44.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riJF6/2r1Ou5UTEkd8aa6VN8YG2BN43r2+tp7MS798dFG2yR2z1QmuNZb1QMGht7PqjDrBlO5qGcvfCJeKwvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10454


On Thu, 02 Apr 2026 12:56:09 +0200, Florijan Plohl wrote:
> Add gpio-line-names for GPIOs with a defined board-level
> function on the PHYTEC phyCORE-i.MX91 SoM.
> 
> 

Applied, thanks!

[1/5] arm64: dts: freescale: imx91-phycore-som: Add gpio-line-names
      commit: 20053fa70c1bb283f2e6e9971038a85cfe857552
[2/5] arm64: dts: freescale: imx91-phyboard-segin: Add gpio-line-names
      commit: b5011377d92c43675639e2df17b1a6c218439534
[3/5] arm64: dts: freescale: imx93-phycore-som: Add gpio-line-names
      commit: 16fbd65d2b6e52b88b4bd1dc9e0087d94ba017f5
[4/5] arm64: dts: freescale: imx93-phyboard-nash: Add gpio-line-names
      commit: bbc0071489527587d00aff6b32b5ecf0a74ebf48
[5/5] arm64: dts: freescale: imx93-phyboard-segin: Add gpio-line-names
      commit: e0e40a5776211eaf618890bef8eee6244dcd1471

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C399933A9EA
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965190; cv=fail; b=Un5WP9PzCQDSQwznC/pnlmMEFlhRCACpj3j2EbpHJFJhRnvWQCfmuMQmwDMZ8oOd/ne5eZgNpNUEbglf83IZR19gnhwfxTwiRnLmuj734gLH4oAZt3nxobQB6cO+HXuzBUaD4Ri0dfbMFCzPKPDQcs2JWbgMOBekiEP/zMuVYFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965190; c=relaxed/simple;
	bh=mgk99CNSp9dcoyqDJBrz7yGiDe2ew7Uf+bXhO522pJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jiJTlmoITcdPLn3etFrmlk/jpLDZXsnbUud2UkkxJkb9+iaRwKwCf/4xoJR8356rgLZ6erelF9BjMFFw5VoNIXZxZ5wHUnXpKd7GUTOTxZn+KaWCGc/DDEZ4jZkoNGIEqbG4vQd5ZIHKDvRo+W1GlObgfDgrNGdZxvRVD6dJyxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SpFFyPbk; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SpFFyPbk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6hcCDMyf5KTw+kEtzhKB4pzNKTH9pZDvVv3fVU9uVmylIZCxzoF1a5fcqnuzsdD+UkEhXeRGmSpQIqGv8FzxIubEhNjzWPjz199AYHdi79uQ/DwRdCrkAZeL3rcq0HFi5Wf2tQm3NMStdYakaEJdTSpNvzXR9eGJK9RskmkftClYZV/Yxst9Tev/Z4EE6a0jCNUL1llrx/TzWDltj425o2H8belnVPdstwObf5J+LgfvmroSPOBFLlCj+0VJKvDUeHsBoR+jcmHv7kXnfs9KlsJUkeiJypIrGObZY1zVSj3nlWalWFnmKkD/Cglplxu+mcpjN7d9x+FTxt/FS2fZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm1Me3vDLh+AR61T5XCUcDRJT/sixTK06Ig2QLNDYBc=;
 b=OMDNDi9XAIC/7sd7XEpJ/z1mAfeNMuang56Ynxw0TtHV0tJvyRdPIZrqC+z31mPH1XHfBXDQDwQIrO5b1og6S5syNfM6aZDZiNJBMqsnpv0q+hLVYB9Tmj0JxgMXLBMAfDwV9xljA/sup8jTYkWZjDnV1sEC8Sm8i9sWfpQ7cEStlH8M9sE0E7aAISt6QKt1B8mHPN7G+P7Xid4nfArEtP4jj/MNfSSFHKqteP3x7wHWnQT8U/AOHOcQak30jN+KvqKoMpt8v6GxISZT7seIzQVzFNu0ESfl/VYgzpV7U2fDXO8I9Jji9pmR6U3RRkut1AtWlHSYlPSOzGTETtx3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm1Me3vDLh+AR61T5XCUcDRJT/sixTK06Ig2QLNDYBc=;
 b=SpFFyPbk00yM4S+9hcl/8C8xMqRA9WzIszo/zVwapnnHFtqBW9B11pS1YvQTVtDLumPn60JXvLlfyG542iqI/wvyhSk1FnPWc7eoo/z/qSnuZj8es66CUuhfrxAKAJ/91D4tKMJZIrnWr0s/NxWzrw+RsDlwRVshI8QA66RDMAL0YxSvwhOyolwvSBZnkpf+BN4U28WKV7U2mWY87R1WHukV/5FY7rPGZV0H7mZMq1MwkO2on1SIQaEKZ6C3NWncmrpEMKFGJnlBeNcrH88aMX7FkHOUYYvHiGqqzRDNW0TEPwEaJ8gofonEgiueGcQmpGJpwhAmIDB3cwrbLdU5Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10379.eurprd04.prod.outlook.com (2603:10a6:150:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 20:32:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:32:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: (subset) [PATCH v4 0/3] Reserve eDMA channels 0-1 for V2X
Date: Tue, 24 Feb 2026 15:32:25 -0500
Message-ID: <177196514004.3306455.12484854463618511742.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0166.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10379:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e8add9-bcf8-4352-d7c2-08de73e3dc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTExYi9WUGptb1BQN2VhREkrVWpmbE41TFphcE1QVy93TVdpUnovcTk1Y25N?=
 =?utf-8?B?RTVQMDdvL1VjSE1HRzdta0t1akxuNTZpSzlaVlZTUmQzTkQrbnFwTWQ3WVVj?=
 =?utf-8?B?dlJMRlQyT1ZBS1Z1L0ZWb2RhM3pnaTQyTFhKcFpqWkpnU0ozckhkRUlWTG5m?=
 =?utf-8?B?c2VNM3BkeVVUSjRkTVdFdGgwWXQrZzcvWEdIMWpac3ZUaHkyaWFseUNWV3Vq?=
 =?utf-8?B?UDNxaXpIUmY4cU1nZkFvZ3NFa0VDRlp1SElyTG1lREpPTnBQU1FqTEQzNi9T?=
 =?utf-8?B?anBhQjJNNW9ld3lWTERhdWRzUTJIU0c4Z3FhQ3puc3lWdlJTbUhDK1I3Z3Vk?=
 =?utf-8?B?d1ZHT3IxQ2oxbU93Ni9wcXFXOUNYeW5Xb29QaEg3Uk5jMmxFWVZHZVorbWlQ?=
 =?utf-8?B?bFZsbThocDRnQ2VkMzBZdFgxQlFVbGduUXpzdVVsbzVtbTgybTdReXY4WVRa?=
 =?utf-8?B?c0tINGJZYmFqczZYSjdJQ2ZWU2k2aVk3YXZibWFXNXB2SjdsUERIZ2hKOFlt?=
 =?utf-8?B?UUhPZklOb2c0VGtWbWJySUt1bXk3NWp5NUhkSUR3UGUwOUZRcnhHdjZvY1pJ?=
 =?utf-8?B?eEIrUnpqZVlabnp0K1AyTDlReFJ2Z1h6L3d3eVB2K1NyYnUwRmREK1EwaVpa?=
 =?utf-8?B?V1IwZmEwbzN6L1lteTluZitLSVF6UTd5V0tIWExXT2JtWE9WNStKUnA5ZHMx?=
 =?utf-8?B?K2V6TkVUTms0ZzlpWVZ0anJ4em1HczJ1T2FnQUttdXVqUXVDTVpPWW9wdmNl?=
 =?utf-8?B?YkJnd2wrenZMYjJ0bmVTd1VERjg4VVcxZzlyNGc0UWxhUU1pQndaUlNwVnda?=
 =?utf-8?B?UGpSL2d2TkpsbjdybVVxb21xVkduWDQ2QVFLQ2lNMWRuWVk0aW1lUUg1QTA1?=
 =?utf-8?B?OFZaRGQzS0UzYTI0dXZacVI1UFp6MEhRUi9nZTh6YUNBL2VtWVJtTmxHanRH?=
 =?utf-8?B?TngzNng1R0RNeElrOXF5ZzF3Y2Q2ZnEycWxFUWFjMTlYRVZqY2tVcVAyWStP?=
 =?utf-8?B?RVpuWk5lVFoyVENJbkUxNzhhRXFoa0xMVmp2a01xenZlSHdXaVVYVVBpTjdh?=
 =?utf-8?B?ak5FVjVtM0lhcVB3Ym1LekZ3dk56bnI3TnFsZTJpeGwrWk4wUkNaRTQ5MFFh?=
 =?utf-8?B?djdmaGo4SjE2QVFuM0FqcjhxaEEwWENOeTczR0FLSXpBVWVxMmZOT1pKMzgx?=
 =?utf-8?B?d1FiOHpLaVgvMHNNSFFZbFJmdTIxZnRGbDZNSndmTzB3b0JwQWI3TEpnV3FG?=
 =?utf-8?B?U2kwZ2tQYjMzZEdDREhRckgzTmNvMmUwTHFqZ1J3RHdFU1pKUmdOekMrM0ow?=
 =?utf-8?B?ZmVTdVZUbU5kSERRM3Qzd2JQVDJlTk8vTkNRT243b2NIMUlaOXhzeUk4NWFv?=
 =?utf-8?B?Ri9VV250b09FUEF1MXVzd2lnMk50cTRUVVl4RGpkRUxGMlhtemdrb0pHQnc5?=
 =?utf-8?B?UytYOXZRSmkvc0hZbHVmaDNzbTlaWnA3UnpIdCtZTzh4ZFovMkEvZkovdkpo?=
 =?utf-8?B?eTByTDdxQXZhL0VhUUh3b2MyNE8zalFBM1ZDdVB1bTBDbWk2b2h3WlJ0MGhI?=
 =?utf-8?B?Nk9hTjZkbHJ6NkdleXBodGN3cDdadUozVTdGT1BTTkJMUk1NMWt3TkUvbVJ2?=
 =?utf-8?B?d2p2eUlXSEZTM00yV0V3SG5yWUFYK1FMak96ZFUya3hXYm96STgwb3AxKyty?=
 =?utf-8?B?NHBPRFJmZHVvcGlicGRoRGliOEk2R1dtSzhRdjFFVzRaTXREbXlEMzJUL0M1?=
 =?utf-8?B?UUV2NGkwdG9rTzBlY1BDMjdYLy9oTGFiR250TXM4Q09EbjdDUThwazNKM3Jx?=
 =?utf-8?B?R0RocUNxd28zTXI4bGZqeThRWE1uUElPY1NDcVZtZ1lyZGM4Z0xPR1ZkR0ZE?=
 =?utf-8?B?UU5VU0FxaXI2aEljY0NiOEhtL3pQdzN2RmFLUVlMZzBack9WWkx4RFFyYUpB?=
 =?utf-8?B?MjV4eXozMG5ZdURkSy9ZdnNjSnlZd0xnYVNoY0p3elBKcGxTOVN2aGtCNml0?=
 =?utf-8?B?ZHFoSUsyKzhiTzlnWUhOVEJ5QUEwODFENUFRQmlhQTFyWUpiL1dPR2pKRG55?=
 =?utf-8?B?WlBETDV4Q3VWSkZBbjNmVFI0NHhSSnZzdkZmNUZJdmFzdGJsdHgzdVlIRWVs?=
 =?utf-8?B?YnE3ZmR1RWxCVFNCOE1LdWVubERGOS8zRjkxVUplbG05MUU5aURjMVNRa2sv?=
 =?utf-8?Q?2Rqi/5XJOyv3mtmnEdY+8txq7rZWvK9lF0yCjpChD9uR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW1FZ09PV1dnZ1kzNU02T0Vnem1OZEh0UGFGTWphWmJnVlBUNVhDZnQySUI1?=
 =?utf-8?B?SFhKejVHbTlaamwyKzRGZkpjK0UrbUJORWFoSjJaOGFrdEJJYXpVeTQycWFP?=
 =?utf-8?B?OFpRVHdsa0JHQ1V6d1IzTDBHdlhkRXduQThDclZLR3pETXkxNnFSU3J1bDA1?=
 =?utf-8?B?TGVBWng3M0JOVE14djFrQUR4WlkwRmk0WUJnSXFvR2tWNjlRelgyOEdSZFdC?=
 =?utf-8?B?VHlqTTJZUU9SbG5KQ3hCblZFUnR6NGl5TWRYVDIySmtBMXhpQnJTbnFhU2lr?=
 =?utf-8?B?SThva1l3b2hnR1A4Y2hIZXJNNjRYUTMzdDNnYkRuTHkzSHYvbThHWUFKUEVv?=
 =?utf-8?B?WjNYZHVISDB2QVhBblJaSmJhZk4xaC9jSzBDajYvUXhvOS80ZnBmalNTSXhL?=
 =?utf-8?B?QkwyZmlCa0ZlaDdXUWdPRmxLWE03empOWHJOR2wyT3pZYmEyb09aM2IwemFw?=
 =?utf-8?B?dGV1QWNHQzdUcnM4OStEWjZFYnlQVmEzSEJqQnFrWWtwV1BXMnEwYWpuMGNu?=
 =?utf-8?B?cExqWlF6czZyaktjYmV6T0JOeThZd3F0OTBmbHVVc2ljVVJZNFV4VFg0S2VQ?=
 =?utf-8?B?S2tQUmhHYVlMNldGem5TWXRReTR1VEUxaTV3MFpHNzBzSGlSTWNESEpTOXg0?=
 =?utf-8?B?NmptR21US3B1a1hqKzF5cHdMcVJ2eU5EVm1CcTNKUHExMGhiK08vY1oyVWg0?=
 =?utf-8?B?RDJCbUFHcXhhamRKTGVBZlV4dlNyRC9DemswMzN6WWtETUVmdzdrUzI3aE56?=
 =?utf-8?B?dW9aUjNyS2VTTXRNdDVkUE11MElpWStkeDBTdzZrOHgzV3ViZi95WVVMaXhp?=
 =?utf-8?B?cS8vTUpCY0RYNnVXVGFRNGE3ZFlxYzJDcDZ4TWViM2FkVXpkR2hRMTZIcEZV?=
 =?utf-8?B?dFdlTFZIaU56bEw4aEQ5TDBvdmNMYXRENmc5NlRIS1AxNjMzV2R3RXlMVkM1?=
 =?utf-8?B?bFZIZnBITDZKak4rTFd4WStRRis4M2wxb0MzVkIvdk1YMTIzRHlsL05GMHdO?=
 =?utf-8?B?Z29lRnpST29WR1RRMUs1OVpuYjI5UXJlSU5adVA1ZUJKZ09TSmw2cVpuNVA0?=
 =?utf-8?B?Z2Npc1JoOU1UazBvaUQ0YXRvMXlBUWdpU2dDNGV2YkQxZTFjbXBQWWR4UDJm?=
 =?utf-8?B?b2ZScC9VeFlZejRMUGhaZEV6SE5UajdhZFcrL21waXQyZjlaWjY1Ny9YWkdE?=
 =?utf-8?B?OUY0VHNlYUFWZVZBUlEvM254WXpNd2dMNEU5dTIreDg2ZkVpZHo5c0l2anJr?=
 =?utf-8?B?b01xWld2UUwyWGdNZ2N1TXlJSXZtNHZqWEZCWFBrSXE0L3lwZmNGZFdqNjFw?=
 =?utf-8?B?MWJ3OVJpaHNqQjQ0L3h6clB2aXZTM0kzT0I3WVBiVzZnbG8vVzdRaitCYjVX?=
 =?utf-8?B?eGtuOHA3UHZxT1JxYVZFWmlFZG5ERlE4ejA1ZFVnRU16bUNyQjVlNFlPVStV?=
 =?utf-8?B?b09qSk94NHJkbmVUdU0rS1F5TG9xVEJRTGgzL3V6dStXQnNHS095WlBqS1hV?=
 =?utf-8?B?ejJlOGZNTzkrUzh1VHBMTWJnTDFKbi9wL3RybEkrSUhiS2VlRjBkTGQwRlJI?=
 =?utf-8?B?WWZyeEN5SExCelFYcTFmcXNsZmxXL2tDZWdpOHpvQUR3Y3BPVjhtS0lQckZK?=
 =?utf-8?B?RnZqallYSHBHNms1Vy9uY2l4cEJ5ZFcreHpYQ0VLSktEY01CQTU4SU12cDM4?=
 =?utf-8?B?UldRaHJTN2QvM3Q1WDYvY2EvSVNHMlgrMlpsSndZRkwzNnVPYktDRDZVZzNN?=
 =?utf-8?B?TTVPT3prUVhCNjJEZi9QTkhTbXBCOSt1VDhyS3NxVUwyMERpemtjVk1vUXlt?=
 =?utf-8?B?OEJVeStqaGMweHg2WVp6aEpmNHF6aFRjckdibG5lM0V6cEFMOG5rMU9XVGdv?=
 =?utf-8?B?RVRNS1E4TWQwSE96Y1NKd0dJZGRSdGVPWUMvNTNxdHlITXJnRzZBVXBjUnFi?=
 =?utf-8?B?SmtPd1RvZGxaT0tRclNTVkdrakUrTm1WOUFSL0dQVzZ1NmMyd0FLdUQ4R1lm?=
 =?utf-8?B?enA5VE1oekliNUMrcVFaTnRjbmI3Q1ZabWhmZzJCNnFlOXRBay9GRmxQclBz?=
 =?utf-8?B?Ty9zWW1ST25NTGtsZG9GWXY5SlN0bDhvRXNTUHZQQzR6RTFxMHJPMTl4NGlm?=
 =?utf-8?B?QVVtWmxjMm0xWGx2NnU3MWdsMjM3aU0wVmxBYnBndmh1ZU5CMGM2ZTZPWVlE?=
 =?utf-8?B?VllUdXpMTDRZeHBISDBMdlhPc2VtMXhESDg4ZkRtNnZKRnpvMEZIeGkyeS9y?=
 =?utf-8?B?bnZIUkRXSnB3L01jRnIxRGdjVGt5SlRHYmJITUZhVzY3eCtaMDhBa0NCTTdD?=
 =?utf-8?Q?0dgZQao/KAEDb6BO0/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e8add9-bcf8-4352-d7c2-08de73e3dc51
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:32:42.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImOlPOG5r3H5dTt66ll/uw3f043l0g//UuFwF/CLnIdxJ3a5Lh/0pegRojZn7XZA0S3UvpIA2ihmT742BL2ozw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10379


On Wed, 11 Feb 2026 17:28:23 +0800, Joy Zou wrote:
> 
> 

Applied, thanks!

[2/3] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
      (no commit info)
[3/3] arm64: dts: imx95-evk: update the dma-channel-mask property
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

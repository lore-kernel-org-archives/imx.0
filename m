Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5EA3B7759
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377935; cv=fail; b=T9Cw9jxHaf15Q79g68/9zFU1VYw57ojqzuP0wZX195YoshKD4ULEcXFz3JIC8R7VQtyAeasFjbgv5yRqEihyg8d+hcb7XpW48aPrQYwQ9q8oODSC30u7dA0MB2/Vr2TlBNx01lrZfFjJ45WRp7uzHGgzvXhSxa8oxGJiXJ0O2jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377935; c=relaxed/simple;
	bh=3+YnIKrFeEI7e+SmX2zctqm+mRMvNsWiVrf03x5G5Uk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=Dc3GjCuTLcz2a4GbJQG+0f/YJrGIfwpm6E269hBh2oHzE8dG8TjfCooJfMENsCBDoevi+u9CaDIZQh85leVn8j8ii3VdoGspGORAOhvE8gx75NDNMq1cD7W2N47HdWO6AkfarOJ/FhZsTQPZtkKEBZfn5spDCTJUJzaFOU7YWPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wog1Mn2r; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wog1Mn2r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+Q9jQo5J4WHSNxhMW7AubNKBPdH1nOlU/DmV9mkcYiykIfiO4W6pKRSIkee4s6/JSCl+I8u3L1b1VaSjCxdJ0YGHYZy0CoXXLvDkNdLGIxlL6ExX8Oxwaf5baPcjTpBvkGOK9v08k+spFaYq+f74O/hxqbXtduBQyiX/Gvuiy28dY/g6YUXzFZo8lqDN8/QtRpJCTmllQMlJj5X9hrV/viof0lV6L3Bf0UZQD0ycL+u1JTjZVZd44oUEuiXiOy8BeulW8A2VQrF6s6AskoJ++VrNu++6n9JJdXbSRU8UYP1tx+VUm3YnVxzPRU/gnhgZvFH/y+0u/Zl6JA3CjEODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6/I/CMyi8npqW1jp2r4+50Roc6oKRlxIT/GWAXYrOQ=;
 b=SuDEALrPmO+KAkXgk/1aBw4VKytvtvUIqyX56NKIHEIg8cFHBpMJT9Qe/03hSgy1jyEkOEmlHaKxquKXCH+l3hE+r4Hm4/d43uxUEluFMuKGgHN5YtTTIbynJvr46941BHYktJfIebk4p5zid1vHiWFn3pAAFCBZMKUYtlqXuDIDSKhWaSVE/gnFUGkHApS73T1hKRa8uzo77Oo+jjsVV0ET2TX0OlUb54odO0DpSmve0miwzMWwaUQ77AvQbpmZSNnU8OUkgZnxFRuKdcwikphavSXohTmPNMLLkWklTKKMEE3Q4eUs/sYDVD1GWk8DwwGtsA0vWHvZHSmGHJH/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6/I/CMyi8npqW1jp2r4+50Roc6oKRlxIT/GWAXYrOQ=;
 b=Wog1Mn2r8Aw5AjYsW8wbY7Qx12BHGK9rwC7yoa/DRLAsbdPGpgjQSyE93NsCjgvEbnZ6em8Wbwl1wGjjtQf5ACXgNk+QXRvuEDCe4focO95kAwbnZw1PPGZxtN+Run6wwo1uR5L+TRr2gaTAzShV+wRpz+RyMCzuBzrREJuxKEpHxNCkN4A+lHKhxa21lLYKjp6DtkJDvmuYmUe2blJ4riWPl+yKNj7b3bbgVE5PAM+EDMTXKuJdqUrlkMCmzhyTD+WnQFpMRnVB7w5OxUA7ZhBzaw1XZ1n90a0rZhh2i+79cqiR+OSArKHxz65sMohQVP8lmkEER7lmPjs4+H+c9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:45:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 18:45:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260313174707.26902-1-stefano.r@variscite.com>
References: <20260313174707.26902-1-stefano.r@variscite.com>
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-Id: <177437792900.2244983.17690248521418133178.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 14:45:29 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: d741eb02-a085-45e3-1fb8-08de89d581f8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 psZJ7twDRQbP5Dftd9xz9pgBPwI8dMAT9juNzGfXt04GVP2A/f40ZGLVpLtqgDqs++ZlbMA92ANiRJ94dzmokV9BNenI5l7DSwM1T3UkffJupzOjQMgydkSt07yLHveA/dbLNSL9iNfTp5hP9W1XILa7atGhr/BSR44AWOVh9jFT4YiYTgydZP8fCHWMO4fjvJMcuPK4vWgIZTwtsiC73VOdzDWhaGeXusgNJzMBUyW/jj8TPTk9K6PMEwuxZ3YxQ9SZ6CZavfBWfLylzXFE+9hGZA5Bn+xUMVB7+hNKrt3l7fCoufoOzSWsA+tS2WCasNjHdvljDRfJfd5AI0K+besj6e8a96dVleO6fvHOIFe2lWoh9NfGlFCAQieZ6roZGSI1nKCY5lqwHYsY+lOrCsjlUgzQCcTTwGxtIkiZZGMtvNZBob38V9ITZRx1fen0nuOM+J3TDAGfSQWwo/S2ZJTiGEMUZhLAeLD2iKURQMQKpsUvaK3jmXFhbc7hTfolFS0XefXKVDG6j3Nus2kCc2s2seUVTdhnBXjKLD/550Raja8R9Qf7MMPwhl+dCx1drK14vQc4qH8cL3iO0pdn+DmcKg2QOZhWsxEzQfUu9GIlFOS2ADmDO0nnHatGb9/34fzh46euuqnYOOJVuZgvc4hHBtVvadSaKBKm6QlCV+Se1iDuiuVFHMibTwQ138mUqUrgGqdQx8QD0Cn6llp4TSfwhNZPClUcfgcyUHF9QA+M9XqpA+guvvSERiSg9jkphi2vVstA42f5Q54RFu4ge27nXTwc/r4JU2jFDqKskio=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UXBKMDdzM09jWHdQWEtJWXdGNXBmWm5rRTB0MWJhS1Q4RzBKTDZNWDNyUkla?=
 =?utf-8?B?cUpuSm8wK1lYQ0lSYVBESjlaTWpMQlllV2Q4eitERm4veTJHSEIxaXE1K2NH?=
 =?utf-8?B?RHVXZVlmZ2RLNjEveDR2UW1ZL3RlSTd2bUdGT0hkbGk5MjN5UkcvQ2Y4NnVt?=
 =?utf-8?B?OU5pbnBmOHlaRTR6SkxEd3AvZU51OHVoN3ZZREU0YU04amJCZGtnNTR0bzl2?=
 =?utf-8?B?VWhTRmczdWFaNWU3NFBUQ3B6d1hBcnlHMXY3TkptOEhxY2x1S1pySnV1bEtr?=
 =?utf-8?B?LzdtRE1xRjJGaDM4S0wrVThWSTBpMDFPeGRaN2tCOUVSUWptdFBzaUh5eEE3?=
 =?utf-8?B?ZWpFb2ZrSzZuT3VEanJEWXp0QmJmYWxSMElYZVJucUtEZnl1S3pIQXpQdi9T?=
 =?utf-8?B?RHNqakNLVWN2TEc2SzQ2UWp3QURMTHl2aDhVaHZGdzFkcyt6cEtEcithMURO?=
 =?utf-8?B?RFhFTmR5Qk5KYmpjMG4vdmFtSEV0N1FDaHlLbk8xQTVxTmVXQmR3VUNQSmRP?=
 =?utf-8?B?L2dINkZBR3ZmeWVLMGJFT1hDMUFWb2VGWWFjcVFuT2ZuUVl0eDdZY0VjV0FR?=
 =?utf-8?B?SWJBM0xFNDFDcjBCNDdkcXYzV3l5QnZiSWo2SGNRQ3M3QWQzUUVHVENkL1ZO?=
 =?utf-8?B?TCtocUlQWUxnOGo1d1BBME81bEFuMDQ0Wk9kYURNQUE1Z1g4UURsSG5UZExq?=
 =?utf-8?B?RjJUaU94YVMzZ1pSVVpwYitHM2tVL29rbXZlYmxaSnVPQzVSSzFuM3hpb2Rn?=
 =?utf-8?B?NmRYbzVUbTNtS0NyMXhVcjY3S21YVnNVaE1BSEplak5zbkxERkUrVFhVQ2ZD?=
 =?utf-8?B?dW9IWldSdDZPQWlNeXZtZzRwSVhRcCtYTWtvNnNXZVlqa3FnOHRpVmo1cjdi?=
 =?utf-8?B?YWhzWFN4RHFVSXV0UGtYbkFEQ1VBYUh1T1dlWTRLSjZYd2xBV25TTXZiZjMw?=
 =?utf-8?B?Q09TT0hTYmpkT2plRTNWREFEa3RHYVYwdFl4V1FtRzlHR0lESlhyQmpYdjJK?=
 =?utf-8?B?Z3NHdmpNZHlFMWVuOG9HNXptRTBPemxFVkluRThGS1Jtd2dINUZKUGs0MHF5?=
 =?utf-8?B?WENHNjdXNWp4Zk9pSHNkd1FQWVRodGN0enY3U3hKTUNOczZvdVlmTkN1eXVW?=
 =?utf-8?B?a1BITVZybVVTNURYYmMvamp5V3NYUU5zeU1LUkRqcFliSHVzY1U0TVRlYkEy?=
 =?utf-8?B?TGNxM1g1S0pUa3AwUmRxV1ZuSjNOcS9qTjZjbWpRcWx5OFlTMGk1U1dZTEFz?=
 =?utf-8?B?bWpaenpvRDZOUUZvdnArWUY0ZStxZ21OOUVtVkljWTl2d1ZmL1lUNDYyWG9z?=
 =?utf-8?B?UUxCVGx3VnU3cEZZcjIrek83ZW1yTVZRZ2tqSkhLMXp1TEhxaktjaFFkT0tr?=
 =?utf-8?B?dVJMNWNTTWFVaUdtZng2M1YveG5rMjNXWHlTdDVraGJKMUxNRFpBOUhFWkpZ?=
 =?utf-8?B?QmI3dXk5NStRM1IyaHMxOFpNMzJkVnhCM3kwczNmWTZwWW1IQTI1K3FKdFJP?=
 =?utf-8?B?SFJwZENzQW1MVW1pVEJTbit5YW9CUFZoZDBEL3lycCt4T3pwYXFBNnArb0Rx?=
 =?utf-8?B?Sk9QYURZVmI2ZUFzS3g3K1gxNnVLN0dQeUhlK2tiWEdsRW84MEtMZXhYakdY?=
 =?utf-8?B?OFoyMHMyUGNPRit6QlUrSlNxdXB3bTVpcGY2akdJcTA5RzgzYk9yOU5FbHBh?=
 =?utf-8?B?aUZ1RGQyRFJabHhFZldoOWxjSldZMVVEOHNxTGxzR0h5WUtBakMvMTlHOU9H?=
 =?utf-8?B?cDR1RlNGU0RCaWFTbXFybmRldG9iekpSNnUvQmp6dWg5US9Ib2s1bU50aUNO?=
 =?utf-8?B?OXg0K0VSdm5FUUh0aUE1T0ZYeTR2MkhrOStEcG5lbldXSFczU0FNelFLOTJv?=
 =?utf-8?B?UWpmbzNNMm1OdFl5VTNxR3FISXNlUWJleXVKbFlqZEQ2RG9UZzkzZHU4c3lP?=
 =?utf-8?B?QXJ2Um1UTWxhbU5GRGwveTVHdGFJSDk2dVEwVkFGMVlFbWhtS2F3RDh5dm9U?=
 =?utf-8?B?WTVDSmg1NlJINnZ0bWpWY1ZmNjZ5b3VGNGZBM2dsVGYzVzl2S09iTVdkV2pQ?=
 =?utf-8?B?ZmpFRzducHNSQ1RLenArblR2elR0N1I3WmUxcW56ZjZmQUc0WEVyVFFtT1Mr?=
 =?utf-8?B?ajJPR2ZPQmpVdzZQR2EraHJMeWdSUFlqblY1S0FwaXVtWTU2YktMaGt0VGFX?=
 =?utf-8?B?WVBTNEpFL0RKUmVRSVRFSXpaaDMyMHRHMEd2VVFlNktkUTA2YU1VSWJwZTM5?=
 =?utf-8?B?RXlPZHptSkQyVnlCaU1NY2FRVm96YThYTk41Si9HN2I0N1czbFY3dk81UWRM?=
 =?utf-8?B?UGhYaTNhRmtkeFRiZVovUzNYV2pYY21EdERmVWowN1FvMC8zeEFNZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d741eb02-a085-45e3-1fb8-08de89d581f8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:45:23.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1mTj5y3Cs54DYVnhHkmAFWANgolHaJuRPDJNVy1mQVw9I0Kx6howgFnlx7ThXQE/lcCk3kfaBbLGaaueuFn/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806


On Fri, 13 Mar 2026 18:47:01 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX95 system on
> module and the Sonata carrier board.
> 
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: Add support for Variscite DART-MX95
      commit: 5953966f26f5f825cf1fed6f96c1f3138bee6d6b
[2/2] arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
      commit: b5fede0246d012e0fe66588e85825c2bfac626eb

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


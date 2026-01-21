Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6582047D951
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985865; cv=fail; b=SdL5pKmT482yfXA/r/37+kxycVTMW+0AFKKVuUHDgxJ8nydgpVkFgWFPAQ+Jy82xZkJ32PChM/P99aZ7AOx7ALXtERTUxPoFnSPKPLO+DlOqVKdQn1K0wvsFpoY0AhZGnJldeFbd81QfVAHRUWgjgzVK6NxyRngDapkzvWzoY1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985865; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qXL7dIh049996SZK1ArxX2n67IQQzFCcApa3HnEfNv6u8TpEFwNdSjEyhEq3D4l5lD7ILps2GRxdLM0Tr2hiu33T0EvMcwFYrRntNmbYqSJ5ZvZx85Hv1IVrB5MUrIlFG98zoLQT0TBl+G7RRPuTUXXQPUFsKNHo6zKQ5UCxyTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h65MRkCs; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h65MRkCs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+I8lRj+t/1gOwTz8RR9jeqWzrw6EZdUrweLFvFYkgUuVlQXYxVDmbspxOhPdt7ahCuCXMJJBxi9MHqA6CwtPL7J1l+Hx2UIu4rSsXJ5R6ntdnYCfJ50RS4ehoF6SgyVRPKsaui9PWXeBfJO4uuKOp7X4vfCRX3clZgW8LNbPI8OoSMenCENHrU9tEAZDKQhwtr8xt5P0Nkm83TvHipNcdD/S1VH/ItbUVf080YBy0bUOz+UaYVY/AefjR/MPrQ1mGAF8YdhHLKANeeGUYv79x888HAzShQfVRbCw4lcMu7UN5DHutvHtUoZ+gomjk6wfJOnOK1IURSg5pU7gk9EwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=ofjA/QadUEbwRSEle3rHh6A3U5oQ+djz+R04riWZxp2YrS6ujEQgW94in2i+q+Z1knRbLiUcW1fmYM8OXd9TZMlUO+kl/Li0aKvHXeAU1w/2C3QqkEIug4QfczQnxbrjodj45t7bLEemRcPu/cN+eiTPemSNDzSkFgwhWr/EzPpW2XLqFb5oip/T9qTgnNKY51vcysavXxUhqL4AHCUNKjPtxBw6DDQp6UyCzr3o8AcoIlKwAtm0QnBDSgBpdVwI3YpYNeLPPME+T8YOFQCUCknavlgNoC6yO2TpJBnWbHuYBYa0aXCwJz39B0qNDfnBoNIYwOlSNUxSfgShnsc6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=h65MRkCs55C/4jEl6aXZcfDM+5eTcSvzxiDtGB8qqWwvEiBXmxrzh4eLCEt0sIjwfx09dIbky4te8GHYbZAfaJ7qZURT6X81YdTtxFsAciKDTOhislfCSG05HTaMnGPy9XL9pkPxpV0aE8L62gdWAOtQu4XHONJEP+zKm92U6a0kWt5MyenwcaXSqFlgmlFpvdgh7JFwaD2e339eI/WKBP5d6EtqyXFlqFH0z8Wy4K8tYPX6jXLDDImo1fftcScd9AsfnmUIgTmFX9fjjp1nTo5zVNK4C7lot+SnEwl/UQi2LiZnRhRmMMaVE7RCJ43akEy1EafmjhhV5hBCv7Vppg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 08:57:39 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Wed, 21 Jan 2026
 08:57:39 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 21 Jan 2026 14:25:38 +0530
Subject: [PATCH v24 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx-se-if-v24-7-c5222df51cc2@nxp.com>
References: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
In-Reply-To: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768985744; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=Ql5f2ce/Sgm3bBPtPIpVVo8e1nwkqJEvyI9nX6DOVT4DMgGiHx7YOUsfoDa1duxEMm/a9elVD
 meIInbM+EZ/DaSPhfVfAGeRYW2Y1X+Q4Cqfn/CP/6GnwMMpVrMTsNv8
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc37f4e-7777-4ed9-503c-08de58cb20ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1QvTlZlOWJEY05LbVNyZ3ZiOHZyWkordmREdHJMbnh3ZTJJaFhMMi95YkRL?=
 =?utf-8?B?WlBNYS9tazhLVFo4Z3NacjJIbDlaZ3JCZEF1ekhDT0lQR01yWEkrVUlYRHJ3?=
 =?utf-8?B?ekJGQjNhb0xtR0l3YzFQZGhlTXlja1NqZG9mNDlDZm45dkxjZGZweXBlaHRy?=
 =?utf-8?B?ZzhZZUpMK2NxbU5DTnVDQ1RSSkJuRzMwQ2xMblAveE9EZFU0V0dWMVRtVC9O?=
 =?utf-8?B?RVFicjdweVBZczVMb1hnaUxlTVI4bFNBSWtBZnMxdFVZRTdJL1VwUGZiMThY?=
 =?utf-8?B?RGFYOCs4R3psTWpBUTdrREl1bVh2eUtHbEZRdk9HYTNLWEdqWHNlZm9mYmVN?=
 =?utf-8?B?K3NOSmQrNG05bTVwMm5lZDJaWXE1Sk9reTk0NGRtb1FxckVua2R4Y2JkeUxQ?=
 =?utf-8?B?dFUzUHJhVEhIb0VKcE9WVmViMXlOTy9xSkxjZ25ER2oyOEZMNUZHNnZXRW1v?=
 =?utf-8?B?YnUvNGhFdTBlNUdxb24yWjBCMFF6WlhCaEMrY2FPN0VFUzdmN3BSVkVDa0ZJ?=
 =?utf-8?B?T1R3T0EzQy9rZy96T2RzdlF0ZVdVdXBwcVhRU1VOeWpBejZ4RHV6dDRQb0Nt?=
 =?utf-8?B?NFpkd2Z3ZjFOdFhSbnFnbjNLbXdhMnhWYzdvN3N3ZEsxQzRYTHM2S1hJUlRs?=
 =?utf-8?B?OWRsR3h0MVN3MVFGQi9DOGhiOXpxNncxMXc1UHIrbWRQTHdSQ3RIY1MrY2tC?=
 =?utf-8?B?VlR2ek9EUFlQVzZPTTN3Ymo1Q0F5QjBTcFlhLzJzOEdGMTJkMUU2OEhWaTRC?=
 =?utf-8?B?aU5DZDFLbHlYWkZVTUlUcWtTV3Y2dWwybm81TUcxTnFPK2o4TGlPaDd4RGxs?=
 =?utf-8?B?VEtGSEFqUmc5TlY5eFlUalFNYzREMUxCekxCVytzb1pvaUZKbXFyRW9MeWJG?=
 =?utf-8?B?OEVzU0ltMjJIckRQcHdpaEVyMTQ1WnJxeEVlSXllWlpLNVdQWXhZRUlnZHdS?=
 =?utf-8?B?aWVMTEVjMEVzZStDTkRnUkNwU0tXM25RNlczbms2TE1xdlBJeHM5WTRRd1lC?=
 =?utf-8?B?bEZqZlpHUWZ5V2tPMnlmalZVMlVFMDlRL0ZFdE9Za2k5T3V0MUx2MS82MXRs?=
 =?utf-8?B?ZkdLTEcvUFpHYUtLY0VycUxCNktQWms3N25IaVBEMlNqaTRsdnFWZC9WdmQx?=
 =?utf-8?B?VDJUY2pTdG01R2lrTTNTaWJ5WjZWMllkaEQraFRnQ0dwclZyRFQ3U2FMQlJV?=
 =?utf-8?B?cVE3SzRodXhqeTRXajcvRTVRS1VLYWwzRVRXWVU3a0xnWU1PNHhVbzBTRWIy?=
 =?utf-8?B?djRuKzRRemtWYmRuOTV5MThBdEMwZTNDejF2TnJTeE8yWCsxYmg2bDF0Vkdh?=
 =?utf-8?B?UlVuTmJoNEhNRkJma0VuMjF6VFZyRml4am9sdlpNTmFEMjhlaEJ1SGE4SFd2?=
 =?utf-8?B?NWJUQ09xNHExaG9XSkQzZVlHQ3RkKytkUFd2a0Z2bFlXelZoZXptcERFTWRI?=
 =?utf-8?B?ektBcUlPM2NLeEZuN1hoVXBOc0pDc0tEYnZZdWtZQi80V1haUFg1ZmhZUDZu?=
 =?utf-8?B?RzJmenQzV3lza1N1aWdWY3NHdmdpcWVkOThQejBoNDF1Qk51UFRaejh4em9J?=
 =?utf-8?B?a3ljUDErY1Q2UzZHV2ZMUUpmQUo0SWZUZm5qbE5zVHY1TTBmSFNDNFA3Vm5z?=
 =?utf-8?B?ekZ5K1NjeCtmdDRWN2tiZUp0amNxV2dkdlVoK012WHFOV3QzMGd3R05QbHlK?=
 =?utf-8?B?L1E1ZjVlaXBVbTZ6MzNBQnhDc2NyV3phcVY0cXU5SFlEOE5na0pIMFVxLy9J?=
 =?utf-8?B?bkNQVlovK1hvcHBkcWxiNHp1RWhkQUFhM2ZXS29iK29JS1JValBidHRDUVNG?=
 =?utf-8?B?Y3ZTdjdhT2Nzenc3N0pDQjBiR3dFU201U25JNzV2MnJudVZUOXc1RmtnUkZE?=
 =?utf-8?B?NDJHM2toOGo3SFdsZWhydGhpS2dmUEkxR3drbVVqRVZRSS9YWmZCWE4yN251?=
 =?utf-8?B?dkhUUk9lSEZJZzJxZWxsc2VEQko1RS94ZFJEUUJOMkVUWUxsTkhDUlY3WEVR?=
 =?utf-8?B?eHFqT1FTTEppNEwyMFQ3M2EzemxlTlpwZ1IxeFI3d0NsZ0VBZ0gray9XTVlB?=
 =?utf-8?B?ZVA1UTVicnVyTGNqT1BmaSt0L211U0FjRDZJSGRtaEZCTXZnbHdPZkJGblY2?=
 =?utf-8?B?TlBsS1hRUGszVUN6aGFlZXgwdTVoTkMxajl1OWM2VUJIbkFQL3pyRE13MUt1?=
 =?utf-8?Q?bsx1Umsn5Qxx0lSKBuPXHKg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1U1R1Y2b1d0dzI2dlhlUlBqeFo0dklUTG94TTJhV01TTjByWTl6dTBkenZr?=
 =?utf-8?B?UXd1ZFVDNkYwR0dmUWpCVHcwZEY5em90MnczdTlxYk90TnY5cXBib2w1WWhR?=
 =?utf-8?B?dUZDSXB4WklGK3hDWWRqbnRoUGRJT1dmMU8wSVVUbFJaNFBVekR3UHBoVWNP?=
 =?utf-8?B?cmsydTZ6dmc3em96b2QwbzR2TmlPQ2ExdFRkQW9KRFlqeENUWlNoUExxdllm?=
 =?utf-8?B?TXNQUGNoekZhMUorNjhXTkpkZ0F3MEFtMnl6MWZncDkvYnBFVm1xRnlhNERX?=
 =?utf-8?B?THlnUWlJL21EWDJsTGorS3JkZmZJSUlhdVRHWjBmcUEzRkFZY2VVcUZZenMx?=
 =?utf-8?B?aUQ1elhFU3F4cE9zTnMwMjBEN2R6ZldKNzlZU0J6UTVxTXd4V08xM0FZNUxl?=
 =?utf-8?B?blRqdEhDMTZhQk9sdkw0YjNPNWRaWWZkL0g0K3prZWVoaTZsZWFOQlQ5dG5k?=
 =?utf-8?B?NHhDeEYzdS9uY2UxYXd1NjJIRjNzYk5WUTZFS1RqM3NtbkFabXVSU0JMaXlH?=
 =?utf-8?B?TmZlR0V2NFB0K0RKeVNiSDdhTVp2YUt2RVRhRFhjUXc2UytOUTkyYmIyTVhV?=
 =?utf-8?B?V2o3aU5KR2RQSkMzV1FvcGRXU3N1WDVwK0p0eERGZDU4cktaYW51elVEbGJs?=
 =?utf-8?B?bmJaS3R4Uy83a0pCK0ZvNk9LT3lOT3pKWlN0bW9RNmJublMvaUZZKzdLLzRT?=
 =?utf-8?B?T1VEMlRjZjQxT0RGSGR0U3k0dGRNVkh5VnE3a1dncHFNK3A4dml3SlRjZnVF?=
 =?utf-8?B?cGxGS3FRTHRhQS92ZXc3eTlpWGt4K3dJaFhQd3Ira2p3cFNjUndXWDRaV3Q3?=
 =?utf-8?B?SkM2VEdacXU0VHpFa1YxdFZYS1hxSjduSFl5U1R4alpRckdRWDhmRm1LdmpO?=
 =?utf-8?B?VVVSdS9KRFlNNDRCMFl0UGJhcVc5ZDduUythcHRZYVpDYlVGK20yQ3o3UnN1?=
 =?utf-8?B?V0RwM0FLNVVPMGZRTlUrWmJCb3hXUVY3bEZIbk9IS0ROMXFlS0pTWDJicmwr?=
 =?utf-8?B?QmdsQVN2NmNIcUlndjZwRHA3Vjk4bDlzMURCeUhCUGM0NU5TSE04TjQ0dzhJ?=
 =?utf-8?B?OHJpNUczUGNMRWRKcTRwSEVYOEl0bnJPeW9wMVhrMzdEeFZIV2VWSXpMYnYr?=
 =?utf-8?B?SVBXck5Wd29KZkZoVlV2SGtJUmwySGpKaGFsNmI5M2RDdTlnbVlxQjM4ZDg0?=
 =?utf-8?B?VHltZldmVEFRRGNGVThoSXgyaWhyakFZdm9BRVRDZ1FHM2o3NG9TS2V2Qlpw?=
 =?utf-8?B?aGZ3ZE5LdFhuVHk0MVhZTDZqQUdmU0Z5bERNa1JYSGlzYUV4d2FrNm1iUjFW?=
 =?utf-8?B?aFRZbXlNeDJybGc1emdFckZxR3hma05JS0tiV09UaDhaT2RZNHFWdE5iOFBP?=
 =?utf-8?B?b0xjTzBlRkx6dXZHanlNRi9XVE9DQVVoQWlyUTZxN29maVBnSDRYaXNoQ2tX?=
 =?utf-8?B?ZEN1UkFwWmVzQ2x5dWI4cC9EaWJuUGhDeDl6QTZya2JUMXNvdHF2ZVJZN2NB?=
 =?utf-8?B?NmM2VXlPM1hoS0hOTk1lR3hqci9FbXJiRTg4RXh6dm5ibkwvMncyN3JhU0Fn?=
 =?utf-8?B?ZUVDUzZidXJLM3VVREVmcSsxR3kzTkFQNHZ6R0ZVWnpTTG9RRlZmSzBJMURZ?=
 =?utf-8?B?SUJZOUIyMms5bE1odFZwVHNmK3orSTdTQWgycEJRRlYraWJNQTAzVWxXQ3A0?=
 =?utf-8?B?VG9mb0psaHpoeC9BTENoU2c3MGxYVVk2RjhjV1Y1UkY0K1F0ek0xRk9CVXh0?=
 =?utf-8?B?NUFEbGRvL3pEemtLMTJlOVE3VXluM00ya1ZyQkRTcUVOZ1l0UFRLZ0tNWloz?=
 =?utf-8?B?SDdEMEk4YlA3K3U2Y05GQ2lPNG9ac0kxaHRZNnRLdFlKRlIySFo0eVZoODls?=
 =?utf-8?B?KzNJVGRLTVMwQjR4Q2JCd0pyNlRncG02Zm5RMGFIQXhvN1FzcHZzQS9BRmFC?=
 =?utf-8?B?MnV6MWFQTUtubXRqVEhoT1lxeW85N0lraWMzcjRmNXovcS9zUlVET3VlTjUy?=
 =?utf-8?B?Z1E4VzJMQWI3ZCtnL0o1WjM1UVlkMXlGa1hZcHNOUmxHMEFUUzVaNEdZUWhn?=
 =?utf-8?B?RHZvdENvb09TT0lyWFNvR0xZVmpDanVZdnpIdmlqRDhSczk3eWpibk1UU1RU?=
 =?utf-8?B?WFBaVjFZWlgvem42NjkzYjJkTGN3Y25KaXp3cStyN3NmN2VrbFlaSVRobENu?=
 =?utf-8?B?cG1DblQ2OWJSNHA5QlAzdlZ2RHBxUVA2ZmR4ZXYrRExoR2xNTUtkaTF6VkQv?=
 =?utf-8?B?TStJOFN4cGkvT1RCbjNFcXBtNTFlbjZmaXA5ZlE5eWdZVHNubDJib3h0aHVt?=
 =?utf-8?B?ODQ5TTZPRnlUK0E2aEljb25Fek5UYTRYeXJwVTRZWFBRZmFhOXY3QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc37f4e-7777-4ed9-503c-08de58cb20ed
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:57:39.1501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMWJZNTCKZ+ATjoNGE2wgaXEf/q5h0FGuBqqOLfMvLWMt6QGoUa2kSFX9iSgB75Xn5o9kwh71wVvkO2qmVBKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0


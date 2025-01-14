Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2055.outbound.protection.outlook.com [40.107.247.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F9207A11
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877418; cv=fail; b=kMZK/22n25S6FCwIcdr0goxtLJuPqCaup/5erDpjHBb2Ce/+GroP59B8BpoXaDLE7/LM52S46iJXfXtaq3jXdc0gsKD/WLEVsg8Ye4o4jSIKIY5FOhkspVuR7TJspV4mQgJu7evUaF3eChn0uc/1HB46lDeeNhsNCKovefzTlWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877418; c=relaxed/simple;
	bh=jXYHYmPl19jXYojLzXNGE34gMOyMmkAoiqp6CPMxh5k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PmU9RuzO1gu41hkA7n+B/KRiyoO/tSxgK42l2XFNk/yGd4L3AQpO+UhIe8PcBHTR6IO946pDxvmwR2jaQp4z3UAkWYzRmxsbAcHUjC15WiZtDOPkf3bx6nCrIeOc7sKX7Vs2C7QdipNQwPYHl/mSEdd1pEMJWE8YmEWYnoCbe3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RK25juOp; arc=fail smtp.client-ip=40.107.247.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RK25juOp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIDHPdCiArESkgXNiStoXYDvMFwwU4IPevS7G6HUVpbds4EGoxxNXw56KelKdvvUyEJkn5fQ3ggK291npQzzeLQ3j1m2uPwDCNtjnu5QcQEZqqROcUoF1tRlk/E67WFs3RpVU7brAq8P7KfyctOdpg9ufAG0hJQnTd0xCuBYh9IRo0x4Sfa9LQGFkCeWZ7FQOhHZTtAXjd3H8+Z7VgoYyoxYXxAr3s2hcY6YLpcOQAhRqQ6U3YukYHCUFDpL7tUrHOm+HxM1NUubDGumkX5eZpnPzZ2nm1+zUih3pSZKVE1nIbOEp+/9ydxUUA7tAYGtugG8FywV4JhqO9zSnFQyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=;
 b=KH5v472NL3uwDAwWOcNeOH45jqfyMa+vkLhFv5rvLaiP1Df1m+Nqy5I11V0t/Q9syFqtYFaaPeBtiuK7yToRxt11uWWZQ64RteuIWwV+iQ2j3AIM17jPHl2BVaFERDJlb+NyvoQKa20PAyXHipVUsMdvMPHgKsfpDh28udVZadGY5V5zhhkJq4VLCRmxFKctf/0SKoGSI1VIVI7V1uFZ9jwBu7Nxj4Hm9mxauGKr/s6OYC7bSU1FkMg9bmZCb0royhilpRnvT/9eq6urTq+2d71Akqh15cz1O++jpxAP4Rq68pBPmukPhV6ruW7qi9SgueHzh+EVKL6GPuGR7fxR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=;
 b=RK25juOp9Nv+bNi1h4M2n7wV3qWrEWe113KHcIM6UGf7yYKQeO8aEagoTwy8nDLhlNRhebm3NLNBKHWPw1EXFqKdFypUqhH4SZttirb3DgkbsLZulo6zjJWpCepspzWYh1q/RDXfh70IqaG3aLNeS/bTEG84k8BEB6SxFQiw6TsEj8Jv0mkdGoBjLxFENSFoxyBG04YYXlWStVWM+TPwCGrVg0uKG0j+A5w6t/FZeWxpVDcXPuj5wiGv1+kUPm1tR5mYBp0jL71uavsqeSclntozlOuV+TgjvQHmtstmR2zY+HQIR4CSAo9W77fqFORAshZWNWHYcLd4gToIgw45qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10396.eurprd04.prod.outlook.com (2603:10a6:150:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:56:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:56:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 14 Jan 2025 12:56:25 -0500
Subject: [PATCH v2 2/4] arm64: dts: imx95: Add #io-channel-cells = <1> for
 adc node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-imx95_15x15-v2-2-2457483bc99d@nxp.com>
References: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
In-Reply-To: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736877404; l=659;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jXYHYmPl19jXYojLzXNGE34gMOyMmkAoiqp6CPMxh5k=;
 b=uq+vefaFpDJP3+lHbpFndy5j64ACfj9g1DAvNHOlghOOqZ2r0bZhZCyrGQfeSh2afsDsqRPLN
 JwqZ8sxTnxKDY2SDqYW5RRxZJ2xf+ix1AVQ/NZrnTUtSa4oATfaMrY9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: c404bd9b-d684-4546-2636-08dd34c4d452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnZCMERHVXdrNDJvSUVBekRSQVJWbTdKMTZBYktnUDBocVdhWXBMUExKdXRx?=
 =?utf-8?B?Tk9FTUFRU2Z6OTBnRkhhUWIxTExmYkE0Qkd4cHZGd3B6c0hLc3Z1NS9NR1ls?=
 =?utf-8?B?RTE2YnJkVHRDU1RZdU1zdnozY3VLK09GUXFQZ3k2Zmh3MGYvZklhcG5aVXBo?=
 =?utf-8?B?d05MQ2FlcEszbGRDTjNWN1NObGNhWmlKOUJlSGpqdzZhbVM1TUJkYTlvMnF5?=
 =?utf-8?B?Y2RhMEhjMG81cmIyZ1hKNUVSb3RXSm9hZFNTV0Z5SEpTMzVxMTdsbUpUc05m?=
 =?utf-8?B?RmFhK3BiclI5cTNiREIwRjZmQTRSMHZkMjM3MWQxZzFjcGlibVZwMm9teG53?=
 =?utf-8?B?SnlxYk55TmFIRUVZdU1BWklFQkE0TEZ0cUFVREVjbWM1TUM3clVOeWhDbnZK?=
 =?utf-8?B?U1JKTFVJdDl6OUQ1bXZuZXBGSHFsZkFEUktjUm1MazdrRGJWZmZBQUl5MDZo?=
 =?utf-8?B?eUE0aHVwZWpQYVZ3L2pGMHRkRDczVDBYNEFyMDF0TVVxV1ptTDZQS3BsR2pp?=
 =?utf-8?B?MXV6OEpyeEtzL0xXWXNMM09kZlBkeFE0K2JzWnQzS2JLb1BoVmZUVjdpWGlw?=
 =?utf-8?B?YUI4WmxjRnNCTHNmUjFGSEhHUUdJSEJDYlFscXl2Zm01WFN2MUl6ODdKSm13?=
 =?utf-8?B?K2tQbmtMV3c1RVBIRGhLOGdrMzZDZU5LNS9iN1M3MklkL1Z2b1FZZlBTakhP?=
 =?utf-8?B?TWg0by93OXY2aGpEMXNiK09maCtKMVpQWU53YVp1WmpNK2FmWWp3TUg0cFhh?=
 =?utf-8?B?N2xORk55dU44VHJHUkZZNHpjT3lQM1B4Y0syMWdBUTg1SWZUR01PUmpDYjBV?=
 =?utf-8?B?WFdzemRDUkFzSFdXeml5SFV6ZE03dTUvZXFheC91OStTYmVvR2hLbTZTZitR?=
 =?utf-8?B?Mk9wVUkxUFhQdUx4RjFTTmdVcFN2d3VnZTgrcGlua24yYkFlZ01UVkoySGNQ?=
 =?utf-8?B?dW9lRm1LNllYdXhCR1dFalNrU3ZDYjUvZ1cxenZxcmY1MGJ4dTErQVNhSUMx?=
 =?utf-8?B?RGpCSEQ2eWUvdmN3UTB4VVUzUkV3Rm1uaE9CbWRaT3ZIOEVaWkF5QmFOc2lM?=
 =?utf-8?B?L1NDaUtkeUQrcVBlUGM4NCtUTjB2ckhBZDRveThCR2lzcVY1blZhdC9LRDQr?=
 =?utf-8?B?d05DVnlVZlo3OFhVOTcySE5aK0tDaE1MVTBYblExWXVrOHZqeFRPd2NLcHpk?=
 =?utf-8?B?SUhBZ21YK0crTjBjQ21ING1tMHp3aE5MRkdpS1JTeGYvR0JEUUFrUUsxR0Fu?=
 =?utf-8?B?MnVOcVpGbUtXM1FBTFA2cjZHUmRMaFVITjNCaUVWUVE4SklDSkFKQWxtS3Vl?=
 =?utf-8?B?ZHFERjZNSE11WkdGV2FaQ0hER0V2cGZpa1o0dE9rNFA4Q0wxT2k5dnJjZS91?=
 =?utf-8?B?ZGJJczBRK09jcEZpV2FTYmJiYlhkV1ZVc2dyNHNKWHlJck5SZm5oNWxwSkNU?=
 =?utf-8?B?Z0lsUlRpZmJDdHBKVUtuK3VxdE5lVUZVS2ZXbnFKdGorUWxrajZVN0NEL1ox?=
 =?utf-8?B?eGRGaWdRaTJxeHIwNXMya1hjTUxzcVA3Z0FaR0UzOU1Lc2M3WlNLR0oxVU5C?=
 =?utf-8?B?bUo2b281bGJoTy9RS2gySUVPcm1RTDhOQmJZdGZ5UnpNYXRjYUozaHRUd1do?=
 =?utf-8?B?OWVaV2pzQUxpUEdnMEE4RC8wWHBDdU5iZGdYbTVFZkpSRE9sY01PWUd0eUFW?=
 =?utf-8?B?MW92bjlnbmFCaXllZlpjK0VoMHRMb2IzdnR2cUhGWnQ4djZvdUYxMTVCR1Vw?=
 =?utf-8?B?cGR0TDFqazIrY21PV0d0TzJJc2JueGJyTHg4dWRERllPYS9wOFVRME5wNTRp?=
 =?utf-8?B?QnFMVDhkSVpGV1hoRUNsWlhqSmxzMTRUR2cyQityRUpBdDlzL1dkUVlFTnNs?=
 =?utf-8?B?VmJWRzBETCtuak1DUWNTV2Erb2xJSCtDTDMwa3JtVjY1VXVSaFhMT3NaalFP?=
 =?utf-8?Q?TSSP9oC4DZNdaO2NNAaK7zixMOraLNha?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUxnQmVISUh3WUUycnR0Y0d4QmRXTTFLRExBS2Z2Z1pLdUUreTEwcHZ0Q1ZG?=
 =?utf-8?B?UWNEY0NmWk0wUWpkYkhJdHRiME5raDZrZk5LM1lnbW1Yci9mV3lqOGtXQW8r?=
 =?utf-8?B?OUNET3lpRmh4QUZJUGRCdEErWTVZU2NhdnFvUGNWUDhDK0Z5UkV2UmZRei9U?=
 =?utf-8?B?dUkrTFh3bkU1dXBRaGNWYllTSFJCeWRtYk4rakd3Q1NuK3ZxRHZFMll1QTNE?=
 =?utf-8?B?alpBcEc1bWtkb0pzbE1FamdFaTF0b2lBOU5Tc052cFBvM3VLU2xBUnFUZUFx?=
 =?utf-8?B?NytHczFSb1IxS05KZksyWDh4LzhjN3U1MlNrUmN3REdKcndCTUpJdDNhdmZw?=
 =?utf-8?B?b09vYTl5dTNFYmJ2S2FSaFpCL082OTgzRFAwSUdUcXJINmJycnFXY2RpMGtl?=
 =?utf-8?B?U2g0cktNRU40ZnJFaWxRZmJWakFJait3cTR1S0Y3RDZhRnZUL01GZ0dOMTV4?=
 =?utf-8?B?QnQ0OGJmcWtHekJqS3VxaVpMZy9KOE9rS0hrWWg2azFnSDJselhOZTVuYjRL?=
 =?utf-8?B?R0YzVzYyK1BaLzZMaFRRY3VzZVJSZDNGTHM3SmhzU3JHVnhNbXYwWTJPbDY5?=
 =?utf-8?B?NlJRMkV0bzhkRk1KcUh6WkVRSGxtRmpHZDUyNVhDdUQ4VnByakg0L0dyT043?=
 =?utf-8?B?aFJsd2RjeS9DYWZtN0p0eFNXS0srdThuTHJiMTZnU2JkQ2lJOXBzZ1JQaHZD?=
 =?utf-8?B?TFloQVpmTWFRUGpZRmJTRlpCODVGWERvVkVkUWthN0JHYU9rWXFDRzdjNGJK?=
 =?utf-8?B?c0J0ZzlSajVtYXVCSyswYzdTZ3RsRmxCWnloS2t5SVFXMjhvbXNuZmV4YVgy?=
 =?utf-8?B?L21GRE1TSVhYa0JwNlZDTmhKWXVLdjNGMFA5b2E4L3VPL3VpVUVqZ1BxdFEz?=
 =?utf-8?B?ZkFiYUNKTmsxdzFHLzRkKytZRUluczE5bk9LL1VuQ1JrMXRZemdubDFyOHJn?=
 =?utf-8?B?VHE5TEZQcW1wL1BpUTJEQktzY3pIQTY3bDloTWhBbjlBaGc5ZUp4VkNlaURO?=
 =?utf-8?B?dVozdWRZREZESnBzRG1jTlRpZFVJTnc1Z3R5Ymp6bUViNU91U2JTeGwxTUNE?=
 =?utf-8?B?RTFPcFZkcTFRT2FuMHN6UFJ1VWlWMW4xbmRpRXlRY3JFdjJTTnNTK1hpbXQ5?=
 =?utf-8?B?TC9GSVYrWFBDYkd6WjZnUXM1RUROcnlvNUE3dVhPTCtnOGxOWUljaVhqTExp?=
 =?utf-8?B?T2w2NXluNGticjFCNnNUcFJ5RmtESGs0TUhqTCtsT2FabXppVXVqd1U5c2V1?=
 =?utf-8?B?cksyUHRxZ0NCZU5qT2ZOMlJjcmlhbjVSbDdTd2NFd21JTUUzMlJOVGFMQnUz?=
 =?utf-8?B?TTAwZGE2SW0vVXpOQVNGTE4xMkVHVUxYdWNuZWpCWlNQWk9veFY1ZnhZMCtR?=
 =?utf-8?B?Ym5PK2NRUTEzNEx0SU9xdHB6Umx6R3JZTVBJTTgrUXdnWXZzWTdhN0xHWW03?=
 =?utf-8?B?K3NXMDVNSE9UVVNvTnF3b2xLZk1NcWxMSzlaNkZ4WHNoQVAwUWFpWFA1VU9E?=
 =?utf-8?B?blVuMXNNRm9tUmxKaE1jM2tlQ1M0Y0ZISnlLckIwY1J6cmdQa1gzQ0diNUYy?=
 =?utf-8?B?SFBNem15V1BUTEM2NzN1TVUrVHdpYXJqQ3FvRmJxNlZmaVBKUHRVRGpJd1Ft?=
 =?utf-8?B?RXlydmlJeU9yY0cxUnFzbmp5QndtNCtQM21IaFpocmhRYWFjSjFPRkRVNS93?=
 =?utf-8?B?OE95ZUhQMmZDdXN5bmtHaDAwaFV2TlZ6cE1xY3NOSExSNVIvejVJbGYwcVNP?=
 =?utf-8?B?MDgvZldBN21sUHRibXZhWXdTaDZ3cURJOTNXZnp3Vmk0TjkvU1FkUldCbVRD?=
 =?utf-8?B?Ykd2MHBxa0tiSmJSeS84cnNYbmJ5SXNseDUvMTE3OE1nNjRUcWZvNkpzSTBa?=
 =?utf-8?B?a0NPb1Jhd2JPWVlxUTNLRE9wQThpcWxGcVdPQ3Ixd0t0VnhLZGNicjB0dFZS?=
 =?utf-8?B?eHJPKzY0eUtRREY1WDNWcXFLb0pma0QzRW9QNjJOS3NrS2Fya0dPOTVVOU5K?=
 =?utf-8?B?T2xwdEwvL1FWdTNZSE8vMmI5Zk05cXcxYmFkcnpwT3JIRDhSRlE1YXdhcUV3?=
 =?utf-8?B?Q0VINDRhdGJtNnNYaW00ZS9NeXQ4MGlBaVhzS0lDdFREbzBaT05sS2g0VVpH?=
 =?utf-8?Q?JBrjCGXFvQv+qCqAXnIlQWe8f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c404bd9b-d684-4546-2636-08dd34c4d452
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:56:53.7795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S/9NJbfzDJGOXE8BadbksIqH0CBAd4vhEpcT1U5uy3LlrkxjNPhsftfcX90q9KCCSbKktL94F/tljONegmqIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10396

Add #io-channel-cells = <1> for adc node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 6b8470cb3461a..06c50369aa2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1379,6 +1379,7 @@ adc1: adc@44530000 {
 					     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&scmi_clk IMX95_CLK_ADC>;
 				clock-names = "ipg";
+				#io-channel-cells = <1>;
 				status = "disabled";
 			};
 

-- 
2.34.1


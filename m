Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795610929;
	b=mZ1qyFN7JxV4sM9NsTN+FYD5acRYpY5BKi/dg/hoLIEKmVX059iq7io+7LP4gCG81TAN
	 ZuFrMB17k1GBnf57bfVqe59WMWcIbuwoRy6N+JREI8IysGVW9yvaNr8gDZz7vPVHxUTSM
	 fwqheP33MXb3zZXOmcxxZBxG3LF/ctUzMwZLk75+zcUQMG5fKzRVrTIDp6PrG5N4x3o3N
	 fdqxuCKG7NYPJoBzBojGNQE6boo+er+sOHlYf+oeJa6fbGx+1mUDk40nPQ9HL6kySgolI
	 73wdajpReOv9Z0wUhEMv/ufrpbdIRHUYsXFLTFxxV+Hu5XuoMMyHmV6k1bbbdmjPR/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610929;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gIxNGJh9r/0LR8h76mQywE6/SXVHi/IXlHHJzt9sNhU=;
	b=Q4LpQEsBSDPCQChCWMXu+eObOdLrkjFU0iJEZJlXb/C3H39qUtDN+To5QKe3Jjr8P0n3
	 FmwjOrhPCUzxBBMS3le5MGWzJc0XxezhVgK5FVQoXbwFYkoDZvU74vSAamQLlhHQJhoeT
	 LvROvY8P1fB/xgoi6d4mSaCd4f+aXuIm8aBEYTgxA2mFqECuyLA2hjVVDd7ilJydO4O+F
	 vS904WLQr1JeXMtuAkOdBnpLSSfAysdmYjrhr8dAAKeXZcQVLqyBsrPJbdFOaFmhR8/Ur
	 LP7g234Daw+gVlRH1CvxU2VqtSFKVmUdQJjikAPIzmY9sYTWbloYMzP7IGM6arQLpdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bNFSaFNM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79257606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 12:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79257606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bNFSaFNM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqr+R9o81rWAH4MEcrGjGe9zzGDwJ9tD2JrH2n8XKSKAn1X2zqJ39gDNtrMm3u2gbyQ/DNItVJmmkKisPeOsOu9Z4CaVwcznLQK2bKo4bdqE0bxBvVpPQZi5RwTUHGpv+83N7+/Z6k3Hb8+Cn53FRT7XSjxGmxZt96jKpO6/S08Qj4k9lJPRTHKqtE5rX400fAqsim93QIBYIUq5oGgq9XGzdwinKTL/FobmWQ730GjuOjXD22Bn5Da88z/Qdpz4PYjXGVoAZIk7k0a1oN/mpIuv2uQCUUm4+kQ6cz3NFgX2QnOEXYa3IvXymaadyj9BKRGFxrOZ/k+U+mxPQft5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIxNGJh9r/0LR8h76mQywE6/SXVHi/IXlHHJzt9sNhU=;
 b=sdamw6c56TrDbGGHe3dAAFqslYGKydfUDspePsNnCS3HmZTvs9dDhFHeterw17ChteP8Da/JS8GZKCe8tFC2DY9WS5p5t0xUDsvqOpj7tUiRTQ9Zu0NwsBb15635B/Vl5OEldyDscoqkYltqEiTcxd+qsqSoAFG7UiicvhppS9wUEqblFhSFxBWb5LjOafU1U5yDgtHlsxfkiucHwWj2d/2/W3jQO5bI2QQ1fkSA9//njXNFATDdcl4rT63lTGNJYcUIUgSW3xDZGL0PauDQlttokL+xgF8hv4+/9vWiYOIv+TVRxIFHkWAkooBf13Sy8HQMhYdYC433Ob0TYgI5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIxNGJh9r/0LR8h76mQywE6/SXVHi/IXlHHJzt9sNhU=;
 b=bNFSaFNM381rMDEVSFR5IFhYAFhl0L/DdmurvNbWz7+r2gIF2RssazyDliBJKPcLnJbBovr5NkggDSPGxdN8XuEsJ46TY2AAPjf2wWTYch4BIwWavbte7sXgwBfX9UX2xR1ob21K844d1RPFg9YVi+0G6U/rmckjcX7FFxDIw8fb/Vgq4lNCEJPG6FiK0BeCGHwd9H+rWswGFgriO30KiwfH/I9RmXi+rKcOYO5/9Y5Tnr+crWzDOKIfxbxesWKO5WtS0wsu2tLVqL8zndHi/tiWmr6P2KSixKwfQ1d9NIBRi8EDTqG+yYDEe5UcAIDCHD7QbNCJmEhuEa3V/f81uQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 12:48:44 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 12:48:44 +0000
Message-ID: <745cbfe2-2467-4faa-ace9-0c4a242aaed8@oss.nxp.com>
Date: Wed, 25 Nov 2026 14:52:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7
 support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
 Stefano Radaelli <stefano.r@variscite.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261125121952.29502-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261125121952.29502-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 26137113-61c4-4034-9c16-08df4af27086
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|23010399003|18002099003|22082099003|6133799003|261009223027099003|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
 jCEr81v75eh9z359CyzvCOu1H7il4cVWUrRI2bAkjt5QFraSJEibPBuki+3UyuDUymRWvZU9uTtuaQOtstH18Rsgl4P7Hno4f2m04NhrVpVT83KTRPIkzbVoAmVjAIMR9Ma2WYnZk4Gmbj2nfK7z9LKlx7qL3cugB8/c8vejP8eypasvnji2NAsVCfMBr+NHOpummk0908XJnkVsjjo/IvbDigTU5jvO1lxy28L4LCz6qpOs9HRB0AoU1s/aul+1+wiNL89EkjPYJ2hGcrLMsXycVlIqKCC+nMDkXyonZQTgRJbzw8zh5SqskAkHhpd80/MX5hK5pYwZtGUaLMApubFikWbg1l2kL9IAUzqfyOtSUt6Dflj1zARjzVmOfPp/Gb+2W3J5dsk/TacVDk8HTZP03NvsQZm+On2vX9/9oaNQuGgdvE6n6+NJVQqvQ03YWYCVqFEZSOworAUUqydjHDNrsPX59VZjXvD2aStbos4dv0I40aSi7O0TB2XPpoBOrBrc/O9RNpgeSF1FDDWBXQeGrI51NfjDEMoMPHaFgcYMIC0A6swwEhgN5wa9v5851pnPjIFvwnwm5bfKQNV2wRzNiVHCQMZFhs4hej0/aVVhKjwQn937rcBqPRQ7OSZB
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dlh2ZlR3cUZ3cnduelJ0L3J0UUxHaGNMd0VISGhVbVFSdEVGbTU1cHlhVGd3?=
 =?utf-8?B?ZzdwRExFTXB5eTh6QWszazRrd0ZFc0F4NlhsS1p6V2hUNXhNejJWeVh1WFo1?=
 =?utf-8?B?UzZ5RHdJazh2Q25XUm1VTUEyaGlaTXoyWjNyNHFCMkxPOExNZDdJNzRQSUV1?=
 =?utf-8?B?M090aHZKSFMybkhHeXREeisvVUIvY0hVRVBaYVhMYi8reE9CV2kyZjlqL1hn?=
 =?utf-8?B?b09NOHBLYXlUWTI1L1BnUkM3T2FRbXJjQldwWldabkZmR3IvdnlwNmJNVjd3?=
 =?utf-8?B?Zm5UWWFON05UQWxnMkVDc2RkMUx1a2p2RVE5d3lyWmo5M1d0K3FaK214dkpP?=
 =?utf-8?B?TFpERmE1T1NheHdYZUdBMkxDL1Q2aDNsYzFRcWM3Um1VU3dYSTRtT3BwU01E?=
 =?utf-8?B?V0VoalhMR1BpM3MrWFRudGFUd3VsRG1UMDhmVW5VSFAwS2Znb1RYUGh6VmZh?=
 =?utf-8?B?QnVCbzFaK2g1ZEh1blpWZ2ZTVFBpTUFDWHNGcE9rSE1EQnkyb1hJWHZ4ZDNR?=
 =?utf-8?B?QVNnNEd0N0dvYnRHaUdGK21kcFZOWHdla0d3Njh0Wk5aeEZVUWcyQ3l1bW1m?=
 =?utf-8?B?QjVHUWlJSXhSUnVNUWFvT1MrL0JoZk1jYWtleVlGVEFpNDRZYm1COU1KTUNX?=
 =?utf-8?B?MExlZzlMUnBnTmVLbU4ySXhKM3laRmozLzFMQkc1YU9HZnlHWHh1dmNQSHRI?=
 =?utf-8?B?Vk9RNVFOdWhpak1TcDJ1S1VReS9NRmpFUm93dzR5Q3RyTVlKWWwrRlVDVUVv?=
 =?utf-8?B?Sy8zTis2R0tpaUEyVUx3SVlLSWt0RTlkdk0vM0FlalVNWmdiQlp1VW1NRGh4?=
 =?utf-8?B?V1BPcVB0cHZYSGNmeEZGZ2lXdE8xV05ucG50bXJXbzBKZHZxb3FMSlBEWFRv?=
 =?utf-8?B?TFVtTUl2QWQ4Q25LM1BlY0RveHFOQ0c3Z0pFVFNoTE9SbnJOZjFTN0tBYnBr?=
 =?utf-8?B?Z1JGYWk5d2JqNGM2MnRjNzRpUDFFVjhkUzcvWHllcjFVL2J2WlNiMjl5ZjhF?=
 =?utf-8?B?ZCtTUEZIUU9wbjF4YTEzNVBRTVBwb21mbVdZQlE4bXd0U3dYYVFTZTk0dUxh?=
 =?utf-8?B?UEdKdkVIelNxWk1vRG5nSWFTMXhaZENMVFI1alYrZWVjMjJtTEpJR2oyeXVH?=
 =?utf-8?B?MVVpRE9McmRNUnJIVnMwcGFUSUlRSUhsSWdMM0tibkszZ3lyN05lNisrZ3p4?=
 =?utf-8?B?aU9wZW1xRmIrMklBR2pFWlh2eFErL0EyZ0Y5ZVR1dmxuZjRBWllOT2Zpb0Uw?=
 =?utf-8?B?Q21HdzlXY3I5MUwwdTlOUUUzV0d5eXd6MWtrL05aNWZiN3BwZkNuZUJmN2N3?=
 =?utf-8?B?UHJvcUpmbElIQnBDcDdraWVTa1U0MThDOVNaWGpwQXlyWlVmWEMraldmQXV0?=
 =?utf-8?B?K29jcXhjZDdIdGlMelJiZDNPd1J0SlJkU3IvMnBpWm1KOXpzVTIyUC9xMko3?=
 =?utf-8?B?MlBkbW1YK2I4SW5vWmNhWkk1MWhmajVXamFMVHN0T0d2UTZueVBXOFZZYXgz?=
 =?utf-8?B?dW1hMlJJQkF2L0FNWTF1czRSM1J0RjkrNUJpVWRIL0ZNYnovUUNZVDkwMzAy?=
 =?utf-8?B?MmJOeEZWZ0JNc3BrTXIvbUwra1RsS3JaZmMxS1oxTUpuT1krSld1Tk52RUpI?=
 =?utf-8?B?SWNnbytHRzJCVFdUdnArTEdFRFg3ZlIwNlRWQTVBWEFhOGE3TEVuK2FkSXky?=
 =?utf-8?B?REtMYWh6Q3dGeUhVMndiMElQZy9PRGFHOS9pRkRPNzhkNG5yREFsSVh2aXM1?=
 =?utf-8?B?bnMrR2t1YkpjbUJUYTVaYVIyWTJxMGFHZHNEb2p2dXFkRThXcUpiYVlmMjFp?=
 =?utf-8?B?M0d2bFRtTDJIeXZNenpsWUxGRUE5VFMyVnNGNjl6aXZqTDlvMlM2V2p0NGdT?=
 =?utf-8?B?dFAwcVNIaDJyT3V3Rjd1RVl6Z1RDUGlRRVFRNzJhcDhvMzA5SmFUS1UvWW5I?=
 =?utf-8?B?UGRyWTYyVmVuOWU1MGlhMUVjVCsrUk9MV21xckhaRk1NcmZHV2Q5VTBMUFRU?=
 =?utf-8?B?RDF5dmpOK0hTZGhWWGxJRGh2OGFjZm1DakhzSTBicjRoUGEzOWIzN0luZUhU?=
 =?utf-8?B?YUNlOCt2ZWZORFJKUGozYnRybnFTQVdxK05hRG9KWGxBZjlQQk1iOXIwMVB2?=
 =?utf-8?B?QUxkMHcwUS82Q2lDaXl2K3U4UEd3eVpsb0dvbTZsUW9NR3orOHMzM0lVa1p2?=
 =?utf-8?B?cjN5Nm9walVaazl3MmV1YWx6MDhtVjRqck00Z0hqZjZMNzZqRVl5VVhkWnpD?=
 =?utf-8?B?VjJ5dnA0bGVmcXR5ekkrQVVlY2hPTVdwcmF5V2I4ZkxrdkYzVDJPR3hYRGFD?=
 =?utf-8?B?ZlhzM3V6ZDhJUEZ3VnhNeWdHVDYwZytXYzVGMVk4ak1KZmFmS3Z5QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26137113-61c4-4034-9c16-08df4af27086
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:48:44.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQL+2AogkQ1cnyARb6WKsPtDCSyMntJRI7ifHo+s768v5JH44sRmFDSkzswUtO4dsO0/cWU9nKHu4w4a1EfAAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 11/25/26 14:19, Peng Fan (OSS) wrote:
> On Mon, 23 Nov 2026 13:49:46 +0100 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
>> From: Stefano Radaelli <stefano.r@variscite.com>
>>
>> Add a Cortex-M7 configuration for DART-MX95 on Sonata.
>>
>> Place the reserved memory, remoteproc and MU7 configuration in a common
>> include so other carrier boards using Variscite i.MX95 modules can add
>> M7 variants by reusing this configuration and providing their own
>> peripheral assignments in a board overlay.
>>
>> Add a Sonata overlay and a combined -m7 DTB for remoteproc and RPMsg
>> support, enabling MU7 only in the M7 configuration.
>>
>> Reserve eDMA1, eDMA2, FlexCAN1, LPI2C4, LPUART3 and LPUART8 for the remote
>> firmware. Use PIO for the remaining active I2C, SPI and UART controllers,
>> and disable SAI3 and its sound card because eDMA2 is unavailable to Linux.
>>
>> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>> +
> 
> [...]
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include "imx95-var-common-m7.dtsi"
>> +
>> +/* SAI3 requires eDMA2, which is reserved for the Cortex-M7. */
>> +&{/sound-wm8904} {
>> +	status = "disabled";
>> +};
>> +
>> +/* Reserve the peripherals used by the Cortex-M7 firmware. */
>> +&edma1 {
>> +	status = "reserved";
> 
> Should this be disabled?
edma1 is used by the firmware so the correct status is "reserved" as
per dt specification.

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#status




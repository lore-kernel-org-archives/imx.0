Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013035.outbound.protection.outlook.com [40.107.162.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F33612D2
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910470; cv=fail; b=gv0Hmt3eQAuIFzoNXmxI7tLZH4domX7dFcUzRG3PEVHJaJ7YcrSwdgsAIEZ5sG/n06NL/i1MWxStfvLFaa8JVUvrckf2ZW8wVvelahfg7vEaNW9Zxr9v5YfUj0l8AyZn6fVaSAAGohDWYHFkqz7JzaasMlLcXKT4PxzH4XSktQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910470; c=relaxed/simple;
	bh=x/VfKbbkI6XlcceNIre4f3hcJYIuH5Q1X/yzLY22BI0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R2BxgmITLS3bXz7DcDO52ACQhhTzI2etWOeBCmD/U1M+RNozbPwP+hZbaBL/XoL8SYL+pLtW/absVngSwFQCMxWYYvQAazjI8jSipugTbHv23aW6NtF5CIkbD3hVup1qGGFx430bUbVhyes+//REGldL5N3eF0urFOVINC/Q8Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DF1Dj10z; arc=fail smtp.client-ip=40.107.162.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DF1Dj10z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyDwizi+yWeMRP4NslBPvMYufxB6bXQ5qAvA+/lB9KXGjn68BsNGbHuhz9c2cU+0gHG+Ae10QFA9pjBI2C0EKwTcznsFk2QjZtFzi2yYjQPTK681v+n4xppnLp9dKQ/lUUnTbQK0AGR/EmzWttCBGVVh7B4h5FWlRTYHHvj+F69feKEJiUgL4HC7ruQSuIAJGauTpL03sopwId4YekIEjlguWxxydeDDXWD5HxFBJ9jhyPLPX0KsKv5lm83ITsXu51xJNEDe62tiopoSNrHh6sbkwdfkHYCC2Zj1prtlVI7uAySoGk85AcbTb2kRBzUjQgqt639lPWTFaUvaGuQ2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/VfKbbkI6XlcceNIre4f3hcJYIuH5Q1X/yzLY22BI0=;
 b=PAf/RbeU0SRpD/t71f1zn7NkPBv9eQv64nIiMdhI76SIKiCI44Mjkp3EvpDgJjzVJhYl/rYa1xfogLtJKEMQLFlVFQ2rnnZVVrY7edQv3w8LYwS7honAY+5lghbK3g1S6Bqg+5DBoUT0H6uMVDx0wDTBIB2D8a6DiDEuJSfsBrDg7E4j5jvJh7xwaXvbWxnzrMftY+RiZ5hMJSIcLAZ4shi53LSMyslna2nGRZobpenkWBhUUk4PaJ37kpz/SBeMW16nfo1gTZFPHkRpo+DtSrltkEOAfiZXmjsLVlGd15qDQZHIiVo3A2o5RkZPvRsZ8rXO6O6BaBWeWUHSF0bp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/VfKbbkI6XlcceNIre4f3hcJYIuH5Q1X/yzLY22BI0=;
 b=DF1Dj10zdQYRMB/CHO6Wr4B+EhgPzjxKX6X08ECo9qL9fQWVhiRIEmCon9NXrxCwmhuzUPPo/dr1k0duTbgKV2hLzHFedyHPMYWXk1gG6z6mKaPTYKmqiXeEgj5KLWKkKUivc5LX+H4gswiUMpfazBSG9wYsE2jcxov0iB3DjYttro8+Dym8HEPxB7Axq9xRhWD93qKtzY8u1wZbMMmCDex1FujE1i44YtrBi9mvlywRtLzpgnDU3nM40YYvzgcfOi7QRCHOh2gB65zQvkX9GDuWy27WpzaAnT7wz/Swz2ut1CV+9CNFIkegGcyeVPjRrFzeKXUlsW9hL2jSHjQq4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PA1PR04MB10724.eurprd04.prod.outlook.com (2603:10a6:102:48b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:54:20 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:54:24 +0000
Message-ID: <e35dd53c-a090-4b00-940d-2bf5cf3b494e@oss.nxp.com>
Date: Thu, 19 Mar 2026 10:57:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-1-2eedc01d8af0@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-1-2eedc01d8af0@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::15) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PA1PR04MB10724:EE_
X-MS-Office365-Filtering-Correlation-Id: 9195814a-3a68-4c56-4ffe-08de85951ed1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h3ZTO2cxtHRqCg8ajo2rg+9BIRIRfgSMzkC3Z+Fgs6SyTpkOL1qfRzhf8W6/PT9FnFxpCLC1TXnNF8nFcsscGBdz/Gbpdwb7B/ATfR9UqZDZqbewCuEkhLnoZom2KNDm3VfHXStVoqnDD8lQc3h2XFdmGiEL0rX7IVuGaM/w0B6gREFiLSlrmL2zpTpVxcO3XVmqhdNwIGR6ARizeYUeDQQeZoaRLlUcDsNw2Vym78eunXBc46pEl6+yoSaHgQ5ZOJ2eUQAM/2WOMoYgOoyF6BTQLQBhYvATKsKNn3Sx3feiz3kE2eCFLlPmL8aY+JKy+NnZvQNAn8ao8Z0VxMW7hOf1sWWZIFOzrGpn3Nw1VLx1wqWsYxiLz57gOQvGqiKBPtYwFfuDjmjtLUnEmcuv8FGPuoo4eCvxSL/aDB3mqBsrzk8Q+SRR8HAAyQiEO6AYiqZA2741BY8C3LA2BhV9bdlu66ZLTwIuvgjrQXPvE8pCq1k78moPWqqetUZLyXtPrcro/lw44MS37x8cQ+RJuKoDkjOJfJo2is6WkczRB07qsTy1RECgU8m2rolj3F0+I/gNVc+SFmCzSruwezyJvxGVPJPtIKE9aj162j+/X7BEVrrUnpA6Vf+hlpm50UqFUmQ/oev8541j06mOkRbi5p9evYwp/TOVihdR7j1ePuYdGR2/4/KsPLmCzOoynqHb15JLGDJybf/b+0PnFkHzo0gZRoSvglQGGQRJ7r91vkdnwgDlu/0gePHTrdzJ8PXNPkBkoGWA0wSuQ21ZqdiJhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXRaUGFYRDBrY1JDWE5YeU5EcTBKMUJiaHE1cXQ5QWJiN3prR2tJcWpXYmRH?=
 =?utf-8?B?dHJiS0hzTElPY0VyeUprUG1yNWtaWmxCY1BLdU9oWXRSU1ZCd0F2bkF5M3Mz?=
 =?utf-8?B?NVpvMnlWdW1HTzI4UWtoRkVMcTdJZTlRYzMzaW5zS2xNZ3hWQmJlZHBzMVF1?=
 =?utf-8?B?TkZXczlIS291emoyU2VWcmNFcVcvczdKaHpKRGdWL3FJSVNtU3JpTVVOSjZw?=
 =?utf-8?B?VnFQRUpKMmlWcEFUdFJLMXh1aTY5clEySCtvT1pxUk1PelNaYWsyUjBWMVB0?=
 =?utf-8?B?bW5Gd1BvK0huUEgycUVwQWRSMHRmUEc4b1hOYjc4RFdhWEg3dGZUOTM4bW5X?=
 =?utf-8?B?VkZlQ1V4VURXMkk2L3QzdHd6K0hwVURFTWcxMTVwaWVkTHNCNVlPSC9pb1lK?=
 =?utf-8?B?UDRhaXpEaERVQXdkam9RcTUyVld4emV1TWVvZHZvcFZNS25KamxtVWl1eGJz?=
 =?utf-8?B?WEtHN0k0VHdpZGxiZElMZzlyeFU1OHBpQVVDQlVndit6OGFxY1h3Vm53ZFpL?=
 =?utf-8?B?L3pKeFM5NVQ1cGQrd0tROTZTeUNEOXpOZmxQSHBJZHZSWENtOEhGdFJwejZG?=
 =?utf-8?B?R1BraUtZMXZramVZUFYrZTBQcmpUdmhIOGQ3SzNxNXowcVo4MTBrRDdOUERK?=
 =?utf-8?B?cEFvZ29meDR4dXQ0cDFHakl5cnVrRkRsWWNycituSlFwSTdQaElVbzRDTklj?=
 =?utf-8?B?ZGNtYzlqS2poNEQ5M3k0OFFsaDNyMEFzNWQrWHZ5d1c1NTd3UzV1Y2tRU25J?=
 =?utf-8?B?NGhrMElUY1NqOGNOZk91SXVWVW5RczdnSVVYcmRMTzlaUWtJVkt3Q1l3aUNL?=
 =?utf-8?B?OVpPVkR2V0RnTXhQVTc1R1ZkSENNaHYyUFRKVkhuc3JTTVlrQWFOVStCa3d2?=
 =?utf-8?B?NU5ENkx4dVUvT0VZcklHbjNhZWZsajJQaElJRnRjdStkcGk1WHR5aU9NV0Rt?=
 =?utf-8?B?M3VaTmg3UEtTcHFYYUUzei9LZVloUEpwWXFwWHo0NlVWT2hXLytzdVNqUk5M?=
 =?utf-8?B?emRDY0hSZklodkpYc0Vta2toL0VSVTBHMDluUmlTdUhPYlFKd21UdWN0OW9K?=
 =?utf-8?B?NEhqK0xGZU12RE5HaUtLdENGa3VzSGNFWHlyWTByK0ZqVG1mUmx6T1gxamlH?=
 =?utf-8?B?aXczSk1nODB0eWUrT3NueHc3NFEwREtiM0kvRWorZ3JxVXBUSmcvbC90TGVP?=
 =?utf-8?B?OHR6WUhqZ2hreWpuakhjbUhqd0xlWTNvV2RxMCtFeTVtbUZna2NwS2tzNkZ2?=
 =?utf-8?B?bUs4OHVQWi9xOWt6SFdhVTUwTXpnbTJmUXU4bFl5bDFvak5NbEFWczV1SXcr?=
 =?utf-8?B?ZU9aNUNsRUlYOWhtc0pZMkdIT3VybkQ4ME15OEszbWZDdXg3UndHc2FJNng2?=
 =?utf-8?B?SmFkNDBYKzNsd2paUHVhWWVSTTZGaVhZVm12Yk5xNm9rSkhOQUNtYUtqaTQw?=
 =?utf-8?B?TFpEMzFkZ0hXWkJuNmlyclA3N3JTVFA4M3dHbk1EN2RMM2xQSVdpVVpwdktu?=
 =?utf-8?B?RXhRRzJrOS9kWXRuTFVUNGgyZXBueTBzcW5BVlBnY1JmVk13bGlTZUVySnEv?=
 =?utf-8?B?TzlsZDJhT3EvQnkvVmE1L3EyRXppcEpFMnpza3dyUnlxbHN2WnBIVVBkbTlk?=
 =?utf-8?B?YWZQdmFYbEY4cGVHOWk1N2FjNVJRcmNkcUdqOERHOXRrU1loT0dtcjgya2Nv?=
 =?utf-8?B?ME0vUGlRT1NhdUlQdFYxUFZiS0xUczJSNEhVSmVwTGFIa1g4aXpxRkJPb3ov?=
 =?utf-8?B?UzAwb3E5R3FLSFBmd0dBQXZnVDdXeXM5K2YwY01JZWxoN3hoTGVGZDFFelpX?=
 =?utf-8?B?OEJ4bklOelROWTdBWSt1T3JvQVV3NUJodzlFN0pRZXpwamJuODZDelVEMUZW?=
 =?utf-8?B?eWhtN2lreGwyR040WVJta1NkQ2N6b2lWSTAyeENqUk1jdFhWUEVTMFg2RUs0?=
 =?utf-8?B?eS96QmpWZkFlZkhQTlN2bUFBeXdqOEljcWVLL1l5VVlsTStDWC8rdWc1VjJw?=
 =?utf-8?B?MTFMcGlWbkJrYjdjNGl1bDNRZG5JTHZzeS9FNUErekdLclN4Z1RrQUQ0L3Vm?=
 =?utf-8?B?SFdrbjJSdmEzRkxoMnNZcUFkcXJlR2toWDNHdzQxL3doWEk3RDFrRWo0M2Vo?=
 =?utf-8?B?QVYrK3FCKzliQy9IZDN2WU5NQ0FPeWNubWxFWDhZcGpvSUo0SXRHakxGQXM3?=
 =?utf-8?B?RkpWa2dDcjBmZFVDcm9NWERtRWFVU3Z2eFV6RllFemlzdGM5QXppeC9VZUc0?=
 =?utf-8?B?TEd5alc2dnRNOVM3R0J4NW83WHhucEtwSXFGWEJnR3BUa3N5UWVGMFAzWlc1?=
 =?utf-8?B?NEd4NXB4ZUU5Rk5xRyswWHExMnc4c2NXMktOOWcveGpVWjlHMVFvQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9195814a-3a68-4c56-4ffe-08de85951ed1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:54:24.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIxNbqxZDGy7MsfToGw+Z244u4zNF0kyyY9R5+oR1Pt30LjWBarcTOVOfuYeL1uiRjB0iQRZVw0uK8bYiliOEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10724

On 3/19/26 10:18, Joy Zou wrote:
> Add compatible string for i.MX91 9x9 Quick Start Board.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



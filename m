Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630041;
	b=DFuty/LPzG37FapOFcsoARrjYUdasjVVEs6bbR1F7qS9J2YRluitwiuP7wC0dqSBPqHt
	 eGWsmvBx0fU0or1cYDfq0nPbMg+CUm/Wu/yR8U7oe5NBpydMA4PbOuK6RW/+nCpSOgmdT
	 X+IRUbIwGmJ0Rp6M/cK4S6eTjv/bKiijmb+RPlretUMzKEWt9T44byKJaWe+/icNTQv+g
	 VPaTkCecfmKciNZO/0cx5w5uEb0fR9ADuxHV783K+/z6TcKV1c20/9shY8iRP7bIRgVpa
	 au6vfGw2hGUQW/ZE6F8QIIDX9GbFuSOmN92kP61CqSLlz38T3en0IdLsDtgRissO5qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630041;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=XwTcVsJsvlegJROqPJ7WHLq+fIHacICkpmd/cPJwMM8=;
	b=cf3OY0DFHQiYOrAfuJ+reFGdlGFB87IwpYJS1KfLvnkLp/5WCWIuTQTmybeGbQinw+2W
	 b6JgyMXdgIfXix78Rqi/lWjm4Rnfpc19Q98YSMIw5XUFm9/Qye/Zg6ho2HNC4MdGmSFvZ
	 BUAuaACq0+5p1c4paS+JabgdThfxWoQ9IfAYTPNSqO+auq1+Z612DuCrYxkpbrd26miXi
	 hHzoaIFUYf76HpTuI0ekqKYjAa4uCi5CdlmGXHjQ+4l9/Ftbr6m2iLui7Uk7lAT6JgheZ
	 tCjvHua7/xMvL7scjLWu0ViqXbU9VvrkQThsn8P9D9jvK8wd2M8MpML024FdAoinqXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pqSsThs0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.11
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127B606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C127B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pqSsThs0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwkZt9XGFRZZLihcLckGl7U/2iFhBa58ZmggoGFZrx7V1JoUr48sJGlixCCYDsNzDIGCYGwksDinGzub9sqheYzVCtFBKmBPIfJT8lMkWpLErrbVdtsJWWq7AT7CPD7zNvXiX24Uh2ff13W1GCSX3FlHFevOwpj0qq5kJVz1f5raEK8NxI6dPK7pbra93Nk2C+s3Tnoh0XT9BWI6yBBHy3K8fw3X5Gd4X/HGnp7IJMxERvUg0I5IWHdFI3mTEZMxuNx4hltAQ2X7EBKbzPD/PYQkQHlDjvLWgtVYf3yVCOrtwHexjVGB0MlqkjGd/0Q85EnUldin1oOmZ+IVKUKDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwTcVsJsvlegJROqPJ7WHLq+fIHacICkpmd/cPJwMM8=;
 b=hZ1ywF5WgXwy+wbdG+SSzLVXaAnMfLyV2AosvsTyz5+BbgN0GCecb5jqUCv5TOYrRWQUOLCSM0FgH0R1l5ZtB1gENomoc5VSQ91CZ4ZmOIRFzP3dmpDAcTLaC5AFkLolg7//JGiYkDyFAobcuKGzpVGYfE8Ev4YzOUsovX9uVctBdrLAk4TIxZN71KyrKW2e/+Si/JtVRE/I/pJFmTmzceAaoE2D7ym0I+by4Joz/5Zi0SWBUaNCC/ZpAuiqZMzdgdG6W+OLyXzdoNH/ig/scVQ66WgucdnYG5J5kASVfrEeVAifPGmEFnaiOiletBeY4kbqQIqstlnE9K3TmpQirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwTcVsJsvlegJROqPJ7WHLq+fIHacICkpmd/cPJwMM8=;
 b=pqSsThs0mxpZZ0YT1CfR1EA6SZzRK790CD74TGf1iVQ1NrsesNCizc281wZ8B2AhJL7ono2RhWkLQCnC/Y2y4X+IIDn/xw0fdhmIgPouHGeQ8SQ3i4bxgKaWbAP9TkOQAMM+YF3YVyCOwGxtU05wkUBjEJSzVlbo1iSFvOC+3lWLOYegm8uXSuElzt95lfhpso5yJp01hYaPTstFtAryz4Lo5Ra/3z6euQPFqjoog1cfg2xlx6oWClvqdej8tHQIlgqEJ9eNpU75R7OiDNWvglCpoODdKYPxkoDLekTcZvu5KYotLS5Bgv9Oxri9LPgG2uDo+gqvzZDUs4YLrhgsPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 18:07:17 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:07:17 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
Date: Wed, 25 Nov 2026 13:07:11 -0500
Message-ID: <179563002608.3152769.14994139895163818293.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120181727.33321-1-stefano.r@variscite.com>
References: <20261120181727.33321-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPBP307CA0022.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bcfe15-e690-4346-7dae-08df4b1ef123
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|56012099006|261102123227099003|10067099003|11063799006|261022075727099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 NyDhT+938YXLhnkp1gOldK0DMW5eIxa37j8uWfasf68P5ihCVRMkaxo7W2jzJwCufZQDlYkGTvacP+BpU4z+/j8SyPf39Fky8EZsJ8YB2C2BD4f+hriSnOdWJ1pcDlocGGs8XBF3cs3BzbE0wHWe8RIE7HtSgy2RQPlltCcvoGTm+J05GijUehfkMdz5s/ur8or8whFzFI/lt8a6Xwz7goh4lOjjbogAN1smKaGeJfkwctY81d6wl8w2W4dHI85K5aOnjZ2mulojlZ7mMg/NC8tGHoQEIsVNhIcjvWoBQSxaboIzs8GxY+V/TXPPaplQplmsLweaJ3mEg8v7uglmW3En3Pr2uW7zpBR+hH6TtEb+EyV8VjTZnjpZh+rvHkskLztVobHOFuc4aZYXvutebRjX6JUVj7CSzu9yAHP+I7adOWVr/uEet4CkxU1vngkMsx9Uj7S/L4Uj2iCp34RmMgyUzMteEoAZQzLb/cyFWLyJvQsWmtLzlDgtd+nZWlJ8495p49Il79yIySsPvb6j98dMp6KIL8Vjo9sRYz2WuwGWRCwbtPuy1bVgmKSPPtXNfPO+VfAzyCzCuGXcOz9FRWICFM4nUl1ca9x6O4iTI7aGbLtrxBfGn18hczOi/EvCHvFaglBVJMwONKQ6yKgpDuQkRKocqMvZo3CAAtCO0b4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(261102123227099003)(10067099003)(11063799006)(261022075727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VjF6cWRDZUJ3QndQNmFMS2crVHM5Z0FMYjRjMTBidGxHT1VnTU10MzVHak1t?=
 =?utf-8?B?KzJvTHYwNzZUZllpOHdwU00zWUZEQWV4K1c0Wm5PMmhzTFRXM0NHMVo4WXZL?=
 =?utf-8?B?ZHpaUERWRGd3czJJU2gyZjJTOWhMdEhBL0ltMEFPaG9aMlgxYkNWWEt4a2FL?=
 =?utf-8?B?UXRLV3NTK0lxQ3Q4d1J5azJQSGxWU3hQZlBrSEQ1Wmpra2N5TXA2cy9WNjBZ?=
 =?utf-8?B?QUpsaGd5dlJPRzJBeDEvcHVvaFJSRC9BQ3Arc2liakZQNlN3SGpYeW5YblFm?=
 =?utf-8?B?MldYMWprclJQaTFDLys4YllBY0FxalBsVTVGeWw4YkQzTXoyeE5hREloVllO?=
 =?utf-8?B?SFhvcTRjcEhzMEtvQUFpNlUxZzUxYkxTc0dhWWdBYkMvRWorQUZObTk3Tkg3?=
 =?utf-8?B?VlpURE5ZTkN4aW1UOEVVNndoVkd6WXdsZ1FrYU4rVE1jVm55ajlOUzk0d3lj?=
 =?utf-8?B?QzFRM1RGcFNSamU2SFkxN3JsRTVyOVlZRnVtTEdEQmR6b3RMK04yUFJMOExa?=
 =?utf-8?B?RmtNTkFPaENWUVYrN2h4TlBPWGxMQUUzWGpBVlkyZmRkS1hWc0dJbGVjTjlj?=
 =?utf-8?B?dkZ4YlZ4Y1ZycG1xNUhIZXk0V1BxMkNMcXEvTy9Ja01hb0Y4T2VMS0w2S1lW?=
 =?utf-8?B?S0NoQ2twQzdaMENWajZseXVTMkgxTEVGZmZuZ0lYcURCNUM1YjRodmNsWEQv?=
 =?utf-8?B?d0VYRTY1eXJ6Um1UTXM5WUlybUp1YUs0VHRTTkRnVXlMaTJmb0VwbHVTdFQv?=
 =?utf-8?B?OEFhZ0lWVE9aaUVpTis2V3FsSVNsRzc4MmwwNnFhK3RyTVU5Si8rVzl6amU5?=
 =?utf-8?B?Nk9VSWN5U3lCdHdpOFA0VU1iZjZtYXdFbHlkUVNhekVJUzNTOUNEL2lweEoy?=
 =?utf-8?B?WFdMeGIvcEYwMjc2S0ttcXdIWTZ3cEJvc2lUOHNtOXMyeEt0blFaNFovMkZk?=
 =?utf-8?B?YWxtSUZoMTB3aFVQZlpZSlFGc0Z2ZTZnNEcxVDJieVVtcTVGNzlZYmpaQlNE?=
 =?utf-8?B?cjRmTEd6SkpEUXd0Ymw5OXBweWVQcm00M2FkMTJxM1EzMFFJNUhjbkF0M0lU?=
 =?utf-8?B?dElxVC9jRmswSSswL3p6eUZOWWZKOFB0cVE4NG9QcEF3NUQ0alZiNjlSbEo1?=
 =?utf-8?B?UVNlMXFZNElYbHE2d2hGQ1ZwUFpDSThnbDNkaVFBL2ZVM2RjVVN6N2ZSbjUv?=
 =?utf-8?B?UnlHU0IyUjNrakVtcWt5NG15OFhQeW1wY3NYbGo3MjJLV01RZ1FJVWFrSnlk?=
 =?utf-8?B?bExXQUJPb3l2WWJtNVZhVi8rdEVsUGNvWEtJM2lnS2FVaUVQaGNGSlMyenpR?=
 =?utf-8?B?S1c0WXg0NXB2a2VCQXlOVU1nWnhtSGs3b1BEb2x5YzUvQUtWR2dSSGd0UlVQ?=
 =?utf-8?B?eXdGUHZ2dEdOU1RDK1VOOUNETWJwRTBvbVlxZzlQaXk3QkNCREcwUE00NDVX?=
 =?utf-8?B?YlVqa1dNdXlVTVVabVBFZGlCUVRweVcvRndqdHhLRzNNcGtGb2taL0t1WkFR?=
 =?utf-8?B?TmZRWkorK3lvaHIrT2pXeW02WDVKeElvdzEvQkkrclZpVFo5dlhLejZlYWdq?=
 =?utf-8?B?V3kzVGFBS2tXTEN4S0dzcUpSUFkzSS9UTmVVVWRjdTFjTVZ3QnZEWkxqV3p4?=
 =?utf-8?B?QTlMMWF6akQ0NWw3c2pzdm8waFQxbUdJME5PdW5pRnErYnpCcW13bXJYaFJV?=
 =?utf-8?B?NEJQTGM1WjVJejRnMjhNWmNaQzZTUWE2aUlEYnRLdnQ2UW5IOTVrWWNXaysv?=
 =?utf-8?B?RVo0L2tuWk41NkdiK1hxa0hUZnNhRU5wbitVSXpaUkJ1R01NYmpiM0libW9Q?=
 =?utf-8?B?WTluMlhmZGxPSmR1QnB2K3gyb0t2cnllek8ycVpaUzMvT3Z4dmtSVlQ5Vytm?=
 =?utf-8?B?U3pGTXIwNTJGK0QyL256WmUrZjR1NnRaSkZRQlErdy9YZklZVUwvSGEycGN5?=
 =?utf-8?B?clYvL01aZzRrT0hLMWpHOG5zTzI3TDNGK3VEcjRsVzFtYVlITVJGczEyZ2c3?=
 =?utf-8?B?czhQR2lxWURDaERQMU54NlhMRTZFTVZ2UitzL00yRG96QXBJNXBzV3ZTeFd2?=
 =?utf-8?B?U0o0NGsxMCt5dmx6a20wSHdXcGF6ZzB1bnhPUmxHb3RWNk5WdnpnbXg4QVBT?=
 =?utf-8?B?Kzc0WDVMd1RIRVdWMitPeHpWY29aT3lwNFBCbmF5VXNEYlNmQkNRMzdwVWZM?=
 =?utf-8?B?dHVxNWxiZmZySHZIVFRkSnJHZWp5ZjVIQ2R0UFJUbmZER2syVXBTWWhaelkz?=
 =?utf-8?B?UXk4T0hjR21IdHRJRnNSVzAwOE4xODZ3TEVzcmN3eFg3eGZJQ3Z4b3A1cXAw?=
 =?utf-8?B?WHBZVnVDb1M3Ykw3aHZwMnBta2NMNzVnQ0Z4bWJ3ZGVnVzBza2hpc1JjZEZ0?=
 =?utf-8?Q?9v52BKzdmCvIuNwI1cgkaXn/TGerx4F5vZalk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bcfe15-e690-4346-7dae-08df4b1ef123
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:07:17.7379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBcPTeCmdTVnjs1G2lDVXO+6UPjtJO9aD/y2npMP+RKfkllDRZD8QJozzkw3Q4Eq2bc78MG5dYhZ8N+OJLYKMqTbWxEkK98YAI3+Uq7wKm5+ieHe6OpN7+KOA75Pp/9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 19:17:27 +0100, Stefano Radaelli wrote:
> Add Cortex-M7 configurations for DART-MX8M-PLUS on Sonata,
> VAR-SOM-MX8M-PLUS on Symphony and VAR-SMARC-MX8M-PLUS on Echo.
> 
> Share the reserved memory and remoteproc configuration through a common
> include, and add board overlays and combined -m7 DTBs for remoteproc and
> RPMsg support.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
      commit: 155719b8c629e560c940e601db9af057fca7282f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

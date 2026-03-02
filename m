Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F840B6EA
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467779; cv=fail; b=cZZv46y/KuE71C2MzXY7HHMLJXeimqfRViMwbEb1kE8DMYjjBUBkKmruAngTyDGlyaqoou/OJkUcebHp1omQNIA1IkrOCSL0Nx7JsFR9qXPmHrlqa231xMCpfj9SmJ3Edlhylay0QHYSz0E4Ul2/0Bf5zJOuznPxOeT9gz3uVx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467779; c=relaxed/simple;
	bh=azV+dAQFgiiC+c9rJl+uCMyyvo6Ch9Oi2Ye7XTkKJIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E7GYMYqjywLi9y8yVJaA0Q4+DlCPn28Mdn7DNVUUyNhv7Gh9IN4pqhx6ExhKH7wm5/CMPrrbwlzMfYLMGG3+wbakbQ9r7b8Mu1t3w/+IlPY8PHv9/By9bQCaRl8GbRvsIryTUjnGj0gAb+WbzOJuAw+V1EF52S4GYGD9kxG8qrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Cy6VZ5Il; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Cy6VZ5Il"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBYuKN9/S57GCV/zLpVVeW7czU7ZAphIBLQn37Qy2rKNQGg/Kj/zEGd1eWabKkTVeArrfV1AhuGcv0pUSHc+8PqY2fm92T5rxS6Vv1Qm5G7vEGQJv0htDeV4IoYbTjjix9EpwchzS+8u7x92EXuRKN1OPA9oWzUec+WUvoPpYjXx/S7ShT16EPE9ylUiAfuGCki1ydFCQINYbOXSZnElWSptv72xZmJVOQndeAwG5HADSfjFkOvcTSNM8+NX+3IeD6keFYeEETh+d14P2MtoVbKzRFwNdB43kwXe9/bdfXKo7Fo4WPxHhTcKYGyX0+KjGJIAX541l6OCNMQCDFf/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QA1SS/prgwUJAHXOCWnDV5mSiXGc0/dCpI08kxHzqM=;
 b=ZVIvQdR0wa5YvWW6ZheyP4JuM918G1rF+JsVMu0dRdlKVCt2EJwSdj3i99Mi+tfOgvUPOMfePsqUsMJErwG7sIIuaxnTtHKh+0tfhOp3mxhBHPDZj8mnbLNFz7B57GNVUEeYVsBnYBWNj1rlEgbkcyYJ0VCBbdK8iwSadbu92RsQv4NuwTbsRcCMm4agkAtVV45TxbNksXUB0qOnbqBYa8laCw2Dzkmf+BmNPK0jcjPlBV4BxKt/99LF+kYGTn16/qtcX5EtW6ewxxK6Xjr+dJ7QImzOL5hcexPHCVSqofl35dJQEIjplp52MvGMpiXPgYqhga4YZthoq4WwFhMxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QA1SS/prgwUJAHXOCWnDV5mSiXGc0/dCpI08kxHzqM=;
 b=Cy6VZ5IljD7ytuvW7zh5EsoXWHwwVY9Zn7ludXt7r00pXddMnkoMJQi3kr1ZWq9PYj+M2zIYRkrp9hXfPYvC9Lgco9riz7tPTzKgrD1el1hAKMVRGbNQXicF3myoUpbU8r3SO1IIZR2fu3oVIr+aBEnI16mxxJvu6JHOqgbwTO26VV0q/Tw91wDzGfPWbzNxn0qXSw9mOSrBUEtUKIKsYEU034w1S7OdT5gSU3gPDJg1xsVBFgOQC63C/ZJqbpalEG0rADltatVDO5b4UmtciY0vL7QAutPHhUAa0+Tdyj1tSx4b3mpRGwUG5z3DHlzjUCtM4zkJ71APT1/w2RuQ4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 16:09:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:09:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Date: Mon,  2 Mar 2026 11:09:16 -0500
Message-ID: <177246774496.2043722.2744255019349587022.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204022306.2372889-1-sherry.sun@nxp.com>
References: <20260204022306.2372889-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a05f06-03d1-4534-6787-08de78761832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	cPs80RuH5OlE6wP4yWrJ5bqdBSljCyvr7ID7U+pn0LwjTbdKXoXaLZzbcD0v8gBZG8qxdQhiaspn21QGjKU7O9RfrCs4cgCENGHlSBntA9Tpt0c3SAOxUoOmpijUF9itfr8htvL6ejAeqcpkv8nDRyn9wTsWzVAzMfsz2vYkwnk0WvX+/ZKp18TgA7onu0zpocuC9RdMnTyGvYQL7INRcF6pjqvFVgPjra6TN5zEMkoba7lqOtYEuysHXvfgfV3/1xuyMtPy607MWBuZgA8qFZpV0GPTb8ipAaM7afjAPyueu5yimRjM+g1HkPnabLzkgaiyA3cmQJgSGId8hhmyVZbVLNiLLoGX4zJRJMTOSKehgoUdFuZb2AUAi5c2jDRAnyT7D6+V8HEPWueyTOj4H2+p7GZsxKyFWzPobnyMDQupVWrHyGPCqLExk549oRcD1gDuCDep2ucgIsKBiYwTeWNTHaAR6NAhItrudQ0tz0jTMGYLAdCCwhdq09f4ckN8vmrWAIYH6rs9L5mVDJLAz9N/V5d7TvCPzeabV7wbnJ3yR9hAxffiY08ABsBTGjxnMI27Ah9epVwnfqjJU3H4lZhLWHxTqPm+cfZFNNNgak1cYJLxOYlMerJsmiAUC12+30BkO8w8nC/19Awpafv0GMdYyBp8zVXY3u8d3t3mXi6iWoTUVpgswpXSiV0ZI54TXiTdSBTkFbtAtnQQz+DriDU7wPn9SBNA9q5Xf0dVZia7HknpkZYSa/IhINixTt1m1zEzJdqIwGLexhEVxL38O9g8WzcBgqi8uglfOKnbppk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmE4dlFVVzBBdUlhZDhpUEhpRTJLYmFVdHpESk55cCtVdi9rdDFuOUJrRk5j?=
 =?utf-8?B?cHBXZUFyWEJwZzNxaXpROVdvbGF0cW1HVkFtQmlPazIra0hvaUYvRVMwdmhQ?=
 =?utf-8?B?TTdwZjRGQlcxTlcwSEZ2Q0JkOUNNb1JDTHBXSzF4WVRicG1NUlY3SjVBdTZE?=
 =?utf-8?B?bjYxRDMva2FhTXdPbHZwa0RLWkxmSy9SNWc1UlVxSk9YM1BsS1BqQ2VoQmhH?=
 =?utf-8?B?WkZVbXliU214b2RwVFRKTmxhUXRySGZFN3MrT0JrQm9GeDVvdHBsYmltbXN4?=
 =?utf-8?B?d1dPdnptZjcvc2J3UjNUdFExcnJSR282Slhub2JIL1RXSExGNmVvOU5JaEFY?=
 =?utf-8?B?cy85TmJ0L2k1OGpIVnZzUjIwVDd1SEl3bUxYR25QbGVLVDBRNGVtSlE2eEJl?=
 =?utf-8?B?UDNxOGZmSGlkSnJXMVRkQXdLcnlwUDdUTXpCRmFZQ2grRUNmTEkyR09YMWps?=
 =?utf-8?B?bTZQUmJ5L3F2NVEyS0YvY2xCYjBjTnNiWlhkOFpXVENqMUVsMXZrSHhPUXdi?=
 =?utf-8?B?YjJyZWpIYzFQVTNpa3g4OWMzTlZIcFQwMUNtZHg0WEI2U2xHQm9pWk8rYXlF?=
 =?utf-8?B?eGViR0Z0SEVjZm1WdVBwYlpVMnc3a1dnaXhUbGhBL0w0VTVNWEF1L3RUL0hC?=
 =?utf-8?B?dnlteng0emdVMnpLWEt0eThESUhJU0JGbnFreXhQU1BPR25ORW9OL1ZWK2NP?=
 =?utf-8?B?ZmJZcUJMTG01QkdBQ0ZwWE9DQXM0azRhTjJpeGR0RERxYUYrNlZ6VjVvL004?=
 =?utf-8?B?U1pwVnZrZ0xDWHg4U2FrdVBvcVJHU1FRUXBoSy9CZitYWVN5RHdoZmhyWHJu?=
 =?utf-8?B?Um4wWDNydFZlNFE1RHBtZkh4c3AzNnQwKy8vSzBCa2VsMG1NMTR5WUxKK0l4?=
 =?utf-8?B?djlKZ1FtMkhucFRmaDZXYS9FcHVXWTR2dDR1cjZhcFNtQm1pR0lIRDNndDFH?=
 =?utf-8?B?aUpLamtodzQ1TVVqWXBUUHBoVW5kU2w4T3lGWnY2RDIwR2srN0VKREltZUlW?=
 =?utf-8?B?UHg2TU4zL24wNnhWT2FDdWRIcVpGVmF4ellVN3gvMW05QzFOeVdIdnZFRXNV?=
 =?utf-8?B?NmY3Tnc3R0lPN1J0QzdRQXFEWW12Wjk5TDh3NnNmVlROUVYrcE53bFl1dWwr?=
 =?utf-8?B?U1BmTGVGRFdTQ3RHMUNPbHRuSGM1bGJ3TFZJa3dUUzNpTTJodSs2R1RPWDA3?=
 =?utf-8?B?azl5WnNxT25XZFhjeklEdHBlTGRGVERLYW5TMnNxR1BNeElyZFVEV0lSNVRG?=
 =?utf-8?B?UHV2dDQydExxT2NPU0h6Yk5qaXVwQnhmeFpGYXNTOERQanozVWJrZGFoRUtM?=
 =?utf-8?B?V0NxY0Y3VEJhTTA5dUJJanZJTTdWY084clBMbUk2SFY4Q085Q2s4VXcxTFY5?=
 =?utf-8?B?N2ZyT09tbU96VkZmWmlNUnNLTnhrRklteXQwcWQweHZFTFl6NFFYUVEvdVBa?=
 =?utf-8?B?bCtaZS9JV0hBRE90MThnNEQxdGliektnczBhUjFDZFVGVS8wL1pibVVkOG9u?=
 =?utf-8?B?MnJ1TEZLTHB6dWxsNTQ0SEpGWUNxVUJrYi91SDhMOXcvVnhwbzNSenI4eWUw?=
 =?utf-8?B?Y1BTWW9ibzVHdUpJZVZhNFhSQWZaay9neHUyWDJ0bVNHdlk2cC9OS0liY28z?=
 =?utf-8?B?dkwyc2JITEQvaWtWRGd3Q0lmZVJRZDlWMDRLRSsrUGRRaTVjajBWcGpuQk5r?=
 =?utf-8?B?aVZnN2JHRkhKVE9VcVBLSWZXaHpIRld5TTc1aXlUNWtndmsyd2cwUS90ajAz?=
 =?utf-8?B?d3d0NGFULzhDWjRwOUhydlVGUVlLS0N5OUg0eGdzR0tERlBVWi9zTFptTlNT?=
 =?utf-8?B?dmoyNkRxMzJ5dVIrSkp1bDJUZGc2SDRkTi9zRTBCWmY1b1dhVHluUk4veTlu?=
 =?utf-8?B?UmVyelRydXUzWTBDN1ZVb0Z3NitYcTF5clB2ZkFlTWMvL2JtaGl2d0g4SDBs?=
 =?utf-8?B?ZGdiNVBqS0kwZk1WVDFWMVhXMzNlemEvSTNHNy9lSjEvQXpFK3VidkdKT3Zs?=
 =?utf-8?B?QTVpUkFETFFUcExpVXZtem5PUDBULzFBNGlDOHlsZ2tFS3ZCK1hyQjQxVlFa?=
 =?utf-8?B?akVOeFFkaHRwd0JlbnVTS3MxSUFVbHYxODNyVThzZDVRQjVrK2J6Nm9nUlM4?=
 =?utf-8?B?RGM5d3Y1Q1NIM0ZDUmcvQkJkcnNyQUFVZGlqWVdRNDVVVG5lY0ZsSXJnTkh1?=
 =?utf-8?B?bDlzUXRtRW02TWN2RlJyNUo2bWNIZ29xR2tKNkJHWW5qMENNV1RXVDJ3b3JW?=
 =?utf-8?B?WVpXSHlkdXRYKzd3NzEvdDFRcmxyUzdGYjcwSmREajFWMm5CZHVlalZxNEFW?=
 =?utf-8?B?QmswUysxZFpNK3NUMncwOTZ1L3hsbWlBWlRCZTFaT0Exc2lJL0hLQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a05f06-03d1-4534-6787-08de78761832
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:09:34.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE+KwJgHVy8krNlR77fk05Z0QE6s1NSuPHYil7EogYcCBBFrzuBG6wVb2zz256sHtAz11eDaD1ayD9t804e0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043


On Wed, 04 Feb 2026 10:23:06 +0800, Sherry Sun wrote:
> Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

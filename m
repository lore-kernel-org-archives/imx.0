Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679B3CF695
	for <imx@lists.linux.dev>; Thu,  7 May 2026 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167629; cv=fail; b=ewBsiCSMGVsssr3QwLdu6f6L/AxpCT/j3fqb98q4t7g7KnvvqOnXWxJFdDw6cXm51+qU1HvuUZbwwZlxEmr/Y3hvGC1SjxzG13nt9hAVMKHEeg64I8HxZdET9B7zm0/NtR8A/a3s4ioj5Odv6cZISMWduVUlqe2rGUvibtpMkK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167629; c=relaxed/simple;
	bh=vBCmhhMqqlVvclcEGsvMZX4ldURUoWJ0+edYkWDrqYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dzb+vn2y4LFLjthUo5ODoV+rO5QIBTazdkW97TQx+ONm2/FdVOqdy179ObWZqJWJ3I9/7BIdiBPhdo0lUVtLVDfBNrC59NS7tzYBBk4aoRsee+EBWbzTZxJwP4fE4aEQa14gPeNRzOstg0JEStSTK/a/pMCu4duaU+PUgwSCMt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fXcFtP3U; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fXcFtP3U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3QbN93sOv/NzLy3Rd+gzehJO8teogRCgMNzTQKYQHX0BwWpn0QFicrTnWOp4giDS7iDtLvg6L6w6UkN4WO62HY2uNL+PhIzSrsNoCVCOfvEbtIDQCLsRDxSwhZP0ybdekxqswPJzsZKPhTtc58pZo4c9+Y4qLf5Wq3Y8RetIPw/Vqi36BmYdcpLFvPk89ZsoF3ebx8wQlNf0oEygfUgiP3ul7QWisdLyqKp4690tjEJRIc+0yfyehDlV0In25uyqWG7NxH48axJEjwhLzuYhtCFNtIhmIUpJEIaNJhz1eRVkiz7QIpEjUPNB4cX2fcegk4it1ujf/lmx/iVtt8y6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBCmhhMqqlVvclcEGsvMZX4ldURUoWJ0+edYkWDrqYE=;
 b=gP/83L8owybjkMOgh42tNtifzEUv2MdeXPrjBvQ13f8dndHQbPdhEG7ChqOB/PQ6S6aeGc340uD1TIU7KmjNeA1eE3+Brb6e6zLu6FenZ2sR/lIbGQR0lCigiAce1XPnhQqlMV2Zdr8kP/CajhgJyCAFtCjBCo6TQHaJFeAyyB7GB3tyYT6vxu7pWA5xLzk9QAAYeymAp4jyW1NZrPxceDcP1T8OYZmvK8IZxIMCKQ8lLfJzCTu4gUEmcRKWHaY/1192ACu3Q2MRJAsT2ocU3kQuUl0FjMGopZcY2exlaPBF+PwJt8ZdKleD++oigGBVCmpkM3dONooQRKlSydKt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBCmhhMqqlVvclcEGsvMZX4ldURUoWJ0+edYkWDrqYE=;
 b=fXcFtP3U382DdQq2yineZlVL2/0ERXuYTXwmVgE1g/6reeaZqd5jTJXZpLXMX21yF3YOhk0YMWsA1VkyD+74dwMxdAf0tCx9puDSB8CdDB68SEykfZvtHijwTEaSxAfKT6PxEgwoom9dcdSkaz/COZmRGopl9ylSTnE+Zbv93WQsPZnjPJ/D6QumnBYuwXiQX9oQQgPXznqGmdk1Z2TW8QwqrWNmBRLC/Hl4I+ESr1BBho0J9Ug67SwAPhsqmoJmyRrLZC5j3xnfUWXZQNNL1BnadOHZAk77Jn/u/CX9ufjm/Zd5OCs8IccbrHtvys1YGpUfog82dbh6A5PcpeonzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8806.eurprd04.prod.outlook.com (2603:10a6:10:2e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 15:27:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 15:27:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	frank.li@nxp.com,
	imx@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: bound read copy by user buffer size
Date: Thu,  7 May 2026 11:26:51 -0400
Message-ID: <177816572724.177840.9501752518116481193.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507133016.1737279-1-pankaj.gupta@nxp.com>
References: <20260507133016.1737279-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:806:27::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d4bec2-34b3-4275-86e0-08deac4d1817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|366016|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	d4MFi8VICB4YbM0uqjBqCUElzqhxHqb6gCWEbDEJAuk7/k7BlyMLoqRo0hAQnbvFlxdsF+ny8YvKb3wTZfXlcGcFw7FMs9t5xXVw5tUw3j9GSv9sJPtAbgHe3KEnbyKulqHZ+PLyME1dacJRH0aTVpo6oshWxwhTuYHbbD2aI/zHPeMzuYRuAqlkitnCJT84rTjUtt71DuRIbjP3k2li83A8F9/6j6uUafJK0nieEr5o/nVhhu5pltaEzgu4hVC/oIkbCqZ22V60C6OiuWWxOfN5xH1aZ7FttukPFejd7Kb/63emICXkbnw5lsgBvuxgo7hIHVcNHiiLWi8v4iwVTG0Ulru5bULtuCljJ0yYjKolAsVYnKcofsVQOq0DfVRMxim6w1HklsugNV14Gx+dAsci8Wsrl8wC8PrkzRzSHt/rSZN0IGinQZjYpzY4JExn03VCAeB6PR2TMybIn/6eIptp0EB73wVqOzINSxm/w33UHM1MrDOVM/1q70f4SCTOJ6pVNaSAfBh/LoAjwMS6+FPSTNzXxFvfLOyIBeFCqE52xe3mmlhVqhnIlbhhRt7guVKQaedVhec5xoLB3MCLWa1Kgprr8RTAQcLxgN7vZvWJlC6q7C7JCtcBFoiXz3d8AU9WFeZR3Jp7aPS/BxiJe6JMgomMNiQRzcZ5LHxJAQF2zkuONYSEfJ7nGznRlITmLcPh2b+6eYtMFHpAOlJVxFxxXmJELKeVvp/m9zMHwKX74w5Kjl4cYtYvH0Bh8kNN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFSMGZYK0JqRGxIdjQydlBTYVdzeEpIV003eWZQUmpldGxoVlUwakNZcmNs?=
 =?utf-8?B?UURyQVVadVFscXVCNjVRUitPckRENmdnTGQrOGRobU1KU1l3eWlPcDVGanZa?=
 =?utf-8?B?QWlQbm9qUjdQMi92STdST243VGlBZ3BaS1AvTWhramg0dEwyWjRMTEFPckFB?=
 =?utf-8?B?T2p6WDdIWEpmNTdoM1FmMHY0Tkc2Q3p2SHVhejJiWGVhS1ArSHNHQStpdzBp?=
 =?utf-8?B?WlJsb1RuNDZkS050TGIxMTFZdDF3YzJzTDFZRkRVVVZkQzlobFlMSnAzWXZU?=
 =?utf-8?B?dUtJVGxvZkt5MW42MUwzQmdXbnZtQkY3UTcvRllrRzVUMXA1Qmdka2tSWUhl?=
 =?utf-8?B?OHcxZnU1VlBRN0l1V0lhRHBpUkhUUi84Mm5sMnZmNUZ0RzB3b24vaFVvZ0FT?=
 =?utf-8?B?ZUc5SUNQL2xtWkFlWUZROVlTVFJRSVJpZ0xHdCt4bEx1L004clRSQmkvQ2lY?=
 =?utf-8?B?UngydGNRWi9MM2NFdWxUMW9KR2ltUVRhT3NNVjUwbnNFRjNOTWJaQmxTS3V1?=
 =?utf-8?B?dEFuWFZ0SGdNbFhRM0ZHRHRUK3JEUnIvckg1R0svQXNaa2NyODdpZStvRDlp?=
 =?utf-8?B?ZUgyL0tONUJaNUQ0OGZ4VURsNS9JNlAvVlVxL0tDdS93L0NPWmFLcHk5QjE2?=
 =?utf-8?B?eUwrbHR4ajA3SVBiYVVZcTk4OUVSMWIvQjN5STJ4cmI1dFpFUDMxdlFqZ21I?=
 =?utf-8?B?UitNazJOOW91WUc1M2xYaGV0NlBPaS9PdThxcW1DU3cxVzBmRWR6RnRXeUN6?=
 =?utf-8?B?Wm14R3lkSDVpY2ZpTEg0QXROMUIrTVFIb09CQ2ZQejFGcFpBQWF1Zm5tbnhk?=
 =?utf-8?B?RllHeHFvaVlQVVdacEs5bGNyUWdNQ0JaV1VvbTRkK2V1K1A1WUF4aGF3cWxw?=
 =?utf-8?B?ODRDTmh6VVBkV3FDbGsxVXZaR2JMVmFaWnBYcEdmUVNFdXJLdkl2aFFWc3Ix?=
 =?utf-8?B?c1FueWxpLzF3SFFlSzd1REdtMVpYVWE0WlU5QjNtTTY3Ym5zYlVsWXpRblFT?=
 =?utf-8?B?Q2pIcTRKc2FIQXNTeG9uTXZhLzNoUUJSeDY2UHUrUzZpaVQwaXpHSUMzNS9X?=
 =?utf-8?B?Y1ZiV1REZWZTUWFUZEs1eUV4VTRMUTd4WTRNb2tWQXFHS0ozd2F3aEJCM2dK?=
 =?utf-8?B?WUdzNXpFZXp1OTBjZkV0S2trZ21LY2NtYktGd1RvYUVHZ0FlSDluMllKdjRw?=
 =?utf-8?B?RWFwWjJ3Q29qS2MzMUJZYitPMjlVVGRCU3lZdUpQbzFzazgwbGJqdjc2RDlZ?=
 =?utf-8?B?QUFtQlF2cnlJVVFSNkpOY1dxcmRaTUlTcFdmdyt0NWlIb0VnWGM2NWxGU0tx?=
 =?utf-8?B?cTNIOEJoYXl5U0xwU2EyNGNBWGpiZ3pzSTFvMUlxaWVUbEluMU1SQ085Um05?=
 =?utf-8?B?MlNTUzFSLythSVNjZ2dYWGRySFlud2pYYi9MNklFQjhSeDNEdW8vTWM4WVd6?=
 =?utf-8?B?aEdlY3FhN0dycHZZRnljSkFRK0U3UnNBeTJXYU9iVUUrRUFkODZod3VuUHhJ?=
 =?utf-8?B?anBnaG1qM2FEakdNVWMrWGxtNU9ZSDhrQno2by96cC9sUWk5c3A5RFhxNmdt?=
 =?utf-8?B?NlNMN3lqbGNmMFgyblBWc0tGOVZMaWtPeW5tOC8xeFVHazZJNWh2Si9aWGZ6?=
 =?utf-8?B?eE9CbjRHZTQ3MWlPejQvZVg1VENYOVg2MUNqWWs4NEhDRURYUitYK0hvei84?=
 =?utf-8?B?R3pXZ2lTc2luVVZhWUh5TjBGQkZKRGd0TngxSXBQMzZ1RE0ycXFjOTNaSEZV?=
 =?utf-8?B?Mnc4SUVsdURobG1UOWRZMGR5RjZGWFBFVnBRK1dFRmpQY0RjelJSUGZONmdD?=
 =?utf-8?B?T2htM3phMjlmaTJsUUhkLzNzOEw0Y3h6eFp1TkpZRW5lWm5ING1JVmExN1Uv?=
 =?utf-8?B?M2dMbUhPR1p0ZlZJUUVBQnZUdFdFYjNJL0NvQjhzcEUrdVRIMnBObDAwemVz?=
 =?utf-8?B?N1JIK05ObS9EWmtPYU80bUlsdXRRMGIyZTNwakZ6VzI2Rk04a0Rya0c3ZnF5?=
 =?utf-8?B?NVEvNmVtUUZwcXl1Z1RhWlRiRHMvVUExa1h6L0gyWmFLQ1hDNGFHWkNmYkJS?=
 =?utf-8?B?Um9LOGFrQUI4VStvbWFCTUJHc0ZzLzFRaE1GZktDc2pZV3pvNG9QelMwemJQ?=
 =?utf-8?B?cWxxa2c1dUpIOENOL3NkNU43MXV1M1dNZk55T3IwK3J6SE1ndjdwTHlieklM?=
 =?utf-8?B?ck96QTRndEZFQlBDc2k0RnQxQVhKQkFON0ZBd3dRdm9Udnphdm80c3I1SXQ5?=
 =?utf-8?B?ZFBWYjJIZjJ2NWd3NWhDcnRuSldTcHRRN1NjKzJQTktjcHFFQU95anYwbzdW?=
 =?utf-8?Q?ZGEOINLeLWXksxl1ly?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d4bec2-34b3-4275-86e0-08deac4d1817
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:27:05.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i21cBCBOSWeJtJRZ6jA/aHk4E7Wn9T2qosfSUROR2mujDQD5YGuGfDiEdB6T+xWZIyvt1wsGuQ6RFDung6Owjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8806


On Thu, 07 May 2026 19:00:16 +0530, Pankaj Gupta wrote:
> se_if_fops_read() copied the full received message to userspace without
> checking the size of the user-provided buffer. If the receive message
> was larger than the buffer passed to read(), this could overflow user
> memory.
>
> Fix this by limiting the copy length to the minimum of the userspace
> buffer size and the received message size. Also drop logging on
> copy_to_user() failure, as returning -EFAULT is sufficient.
>
> [...]

Applied, thanks!

[1/1] firmware: imx: secure-enclave: bound read copy by user buffer size
change min_t() to min() and squash to
4de71839142b ("firmware: drivers: imx: adds miscdev")

Best regards,
--
Frank Li <Frank.Li@nxp.com>

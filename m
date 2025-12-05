Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA02FBE09
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764922753; cv=fail; b=ABauSbT14i70Z8haayfEFbIlIasBlY70onZY54d6Ym/N5h45maiyBT5jI/HRRdm70RWC640u9h6toy8CuUlkEHMmaLgkOR0eOU1EP7XTRaBxCZcP2ZiMdQGKTrbqmzq8T3hWjTPa3VEakUGZdHuy3jl74AIlw+pJYToxe+3GcaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764922753; c=relaxed/simple;
	bh=sdH4fCTTf8yK897/XJAwj4nLIsQreo59fYB0RAN8ZEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mB+PHC6wcbcjm2KsZXgXga2D3yQz7IO6uThPOnd/lXfWCZWAIgW1ANLsis39wy0PLgv+k0cUQsdtht1Yg5Juawjiun2EcTmwPqUYlzVUP4Nk5PoOf7YY7d1NeQAMv36booMBoYWSkys5jGAzmMcZLkDJPYMjqh8R0uSsOjNPqB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GVyj+k/5; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GVyj+k/5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrkrAqqvOkNkjwWKeYKCLCSPkZqKxt6H8Im74y1XD79AQerzo07QxWyqvdue/FyansTdZr2d3beNr6x/QulaobLhA0dVxS5u+TSxY3jgj2GWsTjm9TgtSA0TyLNv1BqZjC8rKkgIDDpa8AJsBa1cLDFoLHies7rqtEqvhZVd8jynt3J/XM9DDwuBq3leZczSDWpYoene911B7kIqxeJWI8uhC6VpVAUcQez2wnvnN2jj4sgGxdhZJPRrzSwQRXH61Hs0XHqBIenuvEmlcxabfybz756wSq11mUR74kt40oTpKyKI8rX9MHVUPVscnSs7VFG44vBxGJcpeLN90L8N4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSouyr7fZy6u6sj6TAe1utK+lQ7+d8Tt2340iX4aWhg=;
 b=xGAkCFkoA2eb3yMQWlmKIZoD/gIDcivuqt7dXRiJt+hBJZr4ribHL75uB4akx6pQU15fDhM12024nLIilfQAeU+5EgI7CLGuXWsRp28IgyB9Cqg3WsKao4Iy9XHVoqisdr+TUfqOcFaiuPkReZ7cVdTcPr4EEhi6wGUrGKnJc4egqyvvySILs01VlzUdRILu+tv5DxzOSe19EbO0JA935DF/xFFx2RMLVLXS3cKiLKJh/PdnEWeM0vdQY2M43Ta8Ra+nmKng1bb2BE+z1wvz+D2MW0KBGmjeDa6Roa50UuW6IbLEGbU/aFNPwf9lV/4aJD3FKpe5aV93D/GUZMxIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSouyr7fZy6u6sj6TAe1utK+lQ7+d8Tt2340iX4aWhg=;
 b=GVyj+k/5FCWC/qUz7kbMYh5temaCLt8VhXSF8KmDNfgQseaIxf91sDQzw4BPILTcHhsmKkmS9cWj3FXSv6VWrIXA6vAZnGntwAaaB3kXlmiGE+ATCY6kgdc5YSPpVqsHJxOPeneGoNCGP8KAwqYdkzJPOMZ8AiDuC3HXq//uGBAMmStv+YhU5BDNKav5GmtzD7BPZmRMOpmheyl5zX7BoW/DkvUlXHkRPkzsIejifL4h7svKRGqmIOFMgAG5up3duQOHEKLp2ZJn7YXHPC/JF54hmIXbwnTc+dST4OUTQI2ndI5mMBsGVZlaG2p4Gy8wdxRcTrDZ7jT6qKYm98M2VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9074.eurprd04.prod.outlook.com (2603:10a6:102:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 08:18:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 08:18:57 +0000
Date: Fri, 5 Dec 2025 16:17:52 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aTKVMAMQ6v_BwD6R@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d5fc13-5b2f-445b-d42e-08de33d6efbe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGp0RUxIc1RFdUF4SExMZlQrQjVteEVvc2NFdCtkSzd3VmtRMys5VXZLcm0x?=
 =?utf-8?B?bFJ2R2t2eTRqMVJKbi9xM1llWnpFeUd2Qzgxdlk3MFVuc2dEU2NmNFlFZi9U?=
 =?utf-8?B?OE9zRmozNURjWGFRQmZyaDFOMFV1QnNJdmczSFJkdWQwM2FPV0VmN3pERkdP?=
 =?utf-8?B?Y1pqVGhRalF0bktjTExkRjlEQlFDcTVTLzc4cFhURzJiQlg3RFZBOGdIYnR2?=
 =?utf-8?B?TWh6N3dKQkJVVzgvMlpzb1ZTWEVSN0x4cnBPMW9BREdoWWhoVjAweUhpT25i?=
 =?utf-8?B?TUVXTTE1c0l6N2FrRW02Ti9VejNuZ1N3RlR3ampqcXVVOUdQcUxnNDdIWXRN?=
 =?utf-8?B?WDQzK0RVVXBhMXpaYkM5Y3pxNklBWFN2UDdlN3JmN01BTk83dW95LzYwYzBQ?=
 =?utf-8?B?My9iRXdNNHAyU2pmYlFFU3VodXprcFEvLzZ0TFJBR25mY05qK0RhamRXZ2lp?=
 =?utf-8?B?dGpuQVJ3dFIybEhzbVBmalVnTE53YXVZMVBUWXZLYUswcGNhWVNQbFV1Z0NP?=
 =?utf-8?B?Z2tKR3NocnlVUVNEOFRZWU9oK3ZVZE0xUWZaYTNnczdYSGdlOW9JQmxoYVQy?=
 =?utf-8?B?SHJ2eWtraUtnWEVQMVE0RllQT3pHSmNzaDRiSVZHQ04vN0tKL3l1NjVrcS9x?=
 =?utf-8?B?TUZvUGUvNENtbWxzNkVNTGl1QkYydkNQU3hhbWtDdG9aQ2VtcmJFUDM5S3Aw?=
 =?utf-8?B?M1Q1cXIrQ09IOHlpazZYWTlsZUpNTURFVkR6Y3dUWTdTRmdta28wS0t3SDhi?=
 =?utf-8?B?YWhSeXdBZndwMXdlN0wrR1J0eGdrcHM3Rjl1OENwdGRKVVFtaldaYlZscjlG?=
 =?utf-8?B?YWR1RlFPajMyUlJWTkMzR2IvTDErMGVlMHF5MGFqUU9mcjJtZXFxMXN3WjdS?=
 =?utf-8?B?RnJIMDJNczRoS3RKZDdWQmlLSTNMR2x3c0hBV1diMlNCTEo0VnZHY01pdG54?=
 =?utf-8?B?MFVhQ1ZvUkduYjFQNUE1VXZxeGxXcDc5WkVqU01BbDQ1V3E4TnBhbDdBTEFF?=
 =?utf-8?B?TlBwUFQ3UnRvRnZkcG8xWEN5UnhCaXFna2RjVDE3UmpTTlBJUEtDTHhvQ1RC?=
 =?utf-8?B?bzgxdUlsQXhMVnE2SHVQZzZMbXFQUEt5MitWczdjY2hITkIvOGtSdnN0ZGZX?=
 =?utf-8?B?bzFlVXExNnpWV2tqdTYzb0ZhUVdzSFpySTR1K3huZUhjakN0UmY0Qmoramh2?=
 =?utf-8?B?R1ZHc01RMUZWSUZ4N0V6aUFmbGhrMU1WVGx1azQ4SjYzaVUrcEtueGpDTHFI?=
 =?utf-8?B?S2lWUnZVZlZraHFkakdZRXUwWHpBaUZOQ0FYY3oyWEJGejFidGxvS2R6NXZn?=
 =?utf-8?B?YzNaWjFMbFRXcEo2S3FBbWRlS29ZRlQ4U0VQd1ZwRXNLbFpUMFdOUHd4dnBB?=
 =?utf-8?B?RzdIZDZOdklwaTB2OXpEL010aFNwZ25Iay9DTlZCNzEyRGlsdktJbzBZRnRy?=
 =?utf-8?B?VEgzaHJVYmQ0bEJHSkJEY1MwMjhDMGI5YzlVZlJGNXlNNjJkZHhvOE44bEs0?=
 =?utf-8?B?b05wT1pHS1lYUTZTR1FoNlprbnl6blZjc08xWmovYnoxR0pOMzdvOHBYa1Zo?=
 =?utf-8?B?T1dCRnBrTE1wWml4WGh1NTdVVXV3Q3R1Z2VkeTZQTytuUE95cjRWSVhCT3dE?=
 =?utf-8?B?cXJ6V1RhQUxQZGRCSG1CMGpQWlhuVFIxOHFPbWI3UEhMQnNUUDRoT0RLN091?=
 =?utf-8?B?Y0JWWEFNNTlwNUM4cU1sMndOWkxoRFZwL0xrU2V3alhRWVk5T1FsYkYzTWlx?=
 =?utf-8?B?K2NpR3F3OE1Ya095QVhBY1VLbGtxbUoyR0szSklyYkdnTkZUNWdib0FXNXlT?=
 =?utf-8?B?bnlyRFR0ZngvTUdyZlVEbTJJNFZiZVVrN3dLNFMvYWNIZFNiSkV3d2NCeUZs?=
 =?utf-8?B?TU00UXBXcnZMRnZBQWVNck5lcWlqRUZSZWhRS3VMQSt1bGtvM05EQmE1MHU0?=
 =?utf-8?B?SnpCVzYrYWxMeXY2LzdvLzRTS2NGRE9Kb3FxbVlyZlZmSHJuWEtmR0V3TVZP?=
 =?utf-8?B?a2M0aWYySEdIWmNOZFRYYUlzUjV5SXZLT2M2TUE5ZEUvNml4R0ZLTzVYT3BL?=
 =?utf-8?Q?Q9CrlU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak8xbGVtM1pVMW9EZGxHRWJ6YmJlM1FtSEZmMENHV214c0lkUjV6TkVteUQ5?=
 =?utf-8?B?aWJCMTVPMEVUWVhkYXdGZVVpQ0xPb1NBWDQ2alh5RE1LbVlTVVp1RSt1TWZZ?=
 =?utf-8?B?MTl3MjkwT2tGNHdHNWQvOC81VjFkeVpxZW5BNTdRMUcyK20vVTcvSTRBTTNT?=
 =?utf-8?B?T1lKMzllYzdFV1R6MEE0U3dHZXNoQkNNMmI4MHN2Q1BCZkh1N2Nsc1M0N0s1?=
 =?utf-8?B?UGtSc3kxbVBhZndYNkpqNDBCQTJTaXdwa3Q3Um9JOFRZNzZpZzJoeDlTdWRU?=
 =?utf-8?B?ZkNmaXFSN1VvNmw4cWZORVBiYTFTN213TU5zVElyY2loVVVMeVhSNUorcnNS?=
 =?utf-8?B?RzI0aHo3ZTNCNFdjY1hnYWdwLzB6QmxacURtL2Z3Y1h2a0IrcUJjVXZMcGpn?=
 =?utf-8?B?OG1Qc0luUTR2eE1mZTBoSXFpK0xsdytqdnBBU0NYRmNvcXRSS0wyY3VScnE5?=
 =?utf-8?B?VlY3MzRjQlRpWVdjWFp0d0p4T2IxdDA0Z2NwSnRYcGNkelRJcXluR3k5RStU?=
 =?utf-8?B?R01mNm9SYUF6SkdlTHJUQW1JNlFkVHoyZzZnMkdjTTF1V0ZkVFMrMDMzaU95?=
 =?utf-8?B?ODhUc09zUzlVVks4OUJFM1dMQThqNkVvQ3VPT3RhOHpoOGo1czFaR1NLc1dt?=
 =?utf-8?B?cDdIOTB6RHIybXZCVmYzU1lScVBWMEQwZGovcU9oMk5jWDZjR0xBL0YwVVFC?=
 =?utf-8?B?YWt6SVptWXVRMkNHcFE2NVc2L1VZUkVkWlU2TDB2UDR5RG00SkhLaHU0K0pw?=
 =?utf-8?B?YUNHVURkVjcvbkUxM2VIWDQ0OEZzRmtLZVg5b2VOd3R4Y3lWbkI1aUtXUHlr?=
 =?utf-8?B?Q2M4WXJKV3JadytGeWY4Zk5ncHpKa2cxcHk1WUE2VFJ1Qjg0VUpidGlJU3NN?=
 =?utf-8?B?S2tzaUJNSXdwemlFSkFaNDBmSnczdW54TXpPZS9aRkhZYW1yM0o0QmFHVkxJ?=
 =?utf-8?B?UUNFLzBUT2phZTRLT1pETXlVRU5XdFZwWVlUNGx1ZndBUlp4NHFYeWgrbEhM?=
 =?utf-8?B?MVlPZmp1d1gxWVdYcWJhVk1BTjJZVEtyU2FWY3N0SExQVzJPR1lpbEVSdXVx?=
 =?utf-8?B?N2hoc1IyU3orT1U0bmozR3FuMENkNmV1cUhzaklnWHNSSWx3dlZQTTMxcy9H?=
 =?utf-8?B?N1c2WXpvTHYvekpPaFdBc0lIVlpxci9XbUdjUUd4QW5oZWNxMmRzeFcyRmM5?=
 =?utf-8?B?dW1nZGtYa2tma2dKVEt0bTNrWUNyZDZpbGxrR2kzeHlTVHdWL3lHVFMzZG5O?=
 =?utf-8?B?Nk9zNm8xZkhhRE1qNm1HNThXVkMycncxTWtoSnN2bGJ3UEJ1ejFuUko0OU9j?=
 =?utf-8?B?TUpqSnNVM1g2VjZmRG9nNi94Ty85dmR2dVBqZmc1dmZIb25WeTdvZ3ZuZnUw?=
 =?utf-8?B?VDVyb0tWdUM1RDNDdDZ0TS9aa01Yc1F6em1PeVBLZHM0RmVDbUdydFVQb1Nz?=
 =?utf-8?B?TzN4eTBKM2lnTzQ5eVBiNEVzSDl2dlJteW9qaExIdGlSaW01cy9TdVBnN0hq?=
 =?utf-8?B?UHFMalY4MWZ6c24yQzR6TUZ5TldGVDdSVXdQZk9xMXVwL3ZseWNTcVV6aXB1?=
 =?utf-8?B?SWtwU20rWVRYMWlXVmVjZFhiTjdnSWRHZzBaNDFuZlU4alZ4bmNBN3JYRUsv?=
 =?utf-8?B?Q3JVbTlzQnhPYzgrYVVMeGZrSkpOVU9BbUJCM3dBZnUyMmsyMlRBL2FYYWcx?=
 =?utf-8?B?UlNTM1ZyY1lsVVlxODBuOXplVkpFVzJDeWF0MzBPaXlLYm94R3YyM0NMTEQw?=
 =?utf-8?B?Q0s1MDl1T3k5YnVOY0xKQi9veEwrVFFWODNJR0E0RWdiRWpicERXY282WFlw?=
 =?utf-8?B?TTVFZU8rZlY1blZ1ZXJBdkc4Y1pTak1SQmR0dDZiNC9jbCtpQjhFa0w0QkxY?=
 =?utf-8?B?WFp1OXF3eElDdm1kTnpVYlpqV0xXdWJXTTY5ZWtVclBMRFNRaDZDTUpzcUM1?=
 =?utf-8?B?NURaZkx2ZGtCODk3UWtLcUZrdGNleGo5eFJtZ1NXcjJyRE5NdWRpY1RFQlpB?=
 =?utf-8?B?OTRhdnFkeGtYWDB3MlRsRFZFV0xEMVNMaGVXVUVMKzM2ZXAwNjNBelJCWTlO?=
 =?utf-8?B?ZXc4cnZvQTdxMnFDU1VwK2NFM3lGWmNnckR2SXBmZlpSQlJRRnMrVE5sUU9H?=
 =?utf-8?Q?XO7w+Jctj3n2dpwGZuH17Th0P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d5fc13-5b2f-445b-d42e-08de33d6efbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 08:18:57.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnKyU+FAmm7kNi9I2xXB471iPTl4EW7DQs33LnQ/+MTgnDbFURjNDa4y4RVWExXZNb2LjbJhSxaQrikZFyOFgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9074

On Thu, Dec 04, 2025 at 04:25:38AM +0100, Marek Vasut wrote:
>On 12/4/25 4:01 AM, Rain Yang wrote:
>
>[...]
>> > > For the Linux working environment,
>> > > CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
>> > > 
>> > > Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
>> > > of its frequency in any OPP entry within the frequency table. Removing it
>> > > could simplify the OPP handling logic and reduce unnecessary complexity.
>> > 
>> > If the clock can be disabled by SM, Linux has to make sure they are NOT
>> > disabled, so they must be described in DT, right ?
>> > 
>> > > [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
>> Currently, only CLK_GPU_CGC shall be described in the Device Tree[1], as it can be gated.
>> The other clocks (CLK_GPU and CLK_GPUAPB) are always-on in the Linux environment,
>> so describing any of them in DT is not necessary and would not be proper in this context.
>
>Since this discussion is in fact unrelated to this bugfix, I would propose to
>fork the discussion into a separate patch. Can you please submit a patch for
>the GPUAPB clock ? Note that I believe GPUAPB clock have to be described in
>DT, if only because DT is a hardware description, and to make sure the GPUAPB
>clock are correctly enabled by the driver.

Okay, I’ll submit a patch later.
The commit message should reflect that only CLK_GPU_CGC is enabled.

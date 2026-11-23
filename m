Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795469826;
	b=Et3rmS3UZwKyOLuIX5aq8D1C3Eax+9Cz4ezUrP28H/vF8nLTEPRKHdaCCU8/IughLJlx
	 r8urO6YMV5VDmBAh/8baprvchGbZamfvGfOQ68GJHUy44yooHlNdhff77uesaJ+V50djJ
	 StYnWvROkNNky4PuvylMQRKIGRXykJsZeCU7kAj8A4oZvfRiRhDq9Z3BhAw1BVKpXkwlf
	 kWd9oXhC9wVvxsPT3z8lwGOXVRor6sgeyAj9M4rwfQ6pFidzPWRdlW7/uaHsx+hhKRoez
	 gNRfXc7I15nZLMVthXXFbK6YG5zY0mAnx2IZnr2x3q0C00Wk+hGtGVLXvSZkRLue13w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469826;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XfVMnTI2ibpny/xUpk0O2eOYmHvKp24bbYE1fFwDZ9A=;
	b=GIDzaBFcs4d/8TaOAx+Uaa6WM80jH+OCHy9W0YkEiszJXQE7+ZlucnB44RUHv+bD1G4H
	 rX7l4hD0I+4PsMbiGbtfJitLE/7222Z1u1e3sv8GZPejmNrLMPRjomVCkpg7tXeqOT4Ct
	 aKu5HoHN3A5zRDeqcKrz7zxkTlbHYYDLyacVHmk8C9G6UKsxjpdnwXYG+EvKCxScOC9KQ
	 FVdSeqNMJkfsLwBaORM6bAzkmzrcJtF/2AIuA57eHEjyw4LvkoY18gO8ysNhlTPQ87cmo
	 sHSNQiLeAJJ0jyuDKWgrhT0k766jjrN2OPCsrDKnUoXiy0VbIkHg/lZMJaW7Q/f0UIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fqFpj1Cj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.23
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF52606A326
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF52606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fqFpj1Cj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UT242SqX8CiUMP8t2JOir6YgsoN2XwyeaeRIw2b9+e/xaU4cneQyTZJRSbZ4ce1ifQ5Wv1nfPLmwLUAG9vYmm+v83eSXpyw6pJqEBrOlQlvnh3/T3H59E2Ga5dWQRjBIYC0/qkAfNPcyqLtrCEq3aFcT9g0zkz4AW+Tjy5mp1vhQPEtMggyUMv6c+P6dmmooGPpgQJqkowyHOc1Znsj9CcA09nBIt68JBvoyF/axrBKCLWHu8I6aSlW/Wl1O6jPngRu5nY4I8bO+crqHGB60m0Mpxm6W3/NXAeLnwF2fCPBZob7XGDqzpmydTrzCbmzHLHRU44KQ7Jwcn+PR9+FOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfVMnTI2ibpny/xUpk0O2eOYmHvKp24bbYE1fFwDZ9A=;
 b=KSwSBV1SuiP0D8WJAuLHvKhFIL4Msg9ppcwPEjuqnmlaRJ8ABVHJiONjmXpxK9eFBv5XnSSl2MDCDCNUldHgotYaTb24dNs//1MF5ad8lr8dy98cRhOPqi5Ix8OlwXrFm4cVpoHoQMzB5DQ8YpBB9jZ+H21wV4BwNUemLHzeLzGzBngem2pCRXuqWL2AdzSD1aqVDJf/hlkZ0HEGf8qIe9xIlswQjfStxhMFwdos+wqzQQ/evuFCAwFweCHiqd+AmM9YaDuOPdbna4IAaD8iMPnb7Tg+tmDDPUGUidCGW/xUX0qwOt+S0G7qQcMbFjd/FbdUBqIwDG7+acVJwV3z9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfVMnTI2ibpny/xUpk0O2eOYmHvKp24bbYE1fFwDZ9A=;
 b=fqFpj1CjivW5WmEzCPdSjbZeXJYJBFFMPrKg7vNfDEoOoojEGSyoQQYk/b6NjsUv2zBAEP7JuwKQGb52bkL+QZcbKQe4a9tWOn4ko/VetJHe0yl0rVY1zgB8bTwzKTqL2fcIxyqk0u72X1XS+AWIG9h0OvnWnhXw8nrFj+bKUxeqr/mkvIGp2sRDSQuuMto8B8+Ko8iNZFGxBASd1swJafQm+qXG3VQThdgzmwDpWNG84nAlajr7kt1WTq9tOrTYosPRmJavFm8ZPhA8frJHUqHPnvxwD5lzYAGqF9qW6tMtXBwKJjoPclN0DzECPbw6ym9f3GbS3+Wq7/gzVudBrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9750.eurprd04.prod.outlook.com (2603:10a6:10:4c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:37:03 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:37:03 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/7] arm64: dts: imx: Add DMIC codec to replace dummy codec for micfil
Date: Mon, 23 Nov 2026 16:36:54 -0500
Message-ID: <179546980623.2970474.13977810236408998910.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:510:2da::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab6899a-ed61-4682-c15c-08df49a9e9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|22082099003|18002099003|261009223027099003|921020|11063799006|56012099006|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	U+WxrBhLhet0rAHuw9b7o/Ly1lcekGWIsMa6VGPBVghHb83PHsqD7z+rlMCBOERBFBs23ixkrCADjmanCayiEP2fKXXquqRdlGLYzbT9TA9b90KNP3RdavmItGdJqRIOiZruvbmPUkpvMTTdkOQcRF0e/jmdW2BALEau1/C+jrrUs72KZ/iT3CroFSwxjuTNYInKZqk0fEv3bNv2Eun5ecHJ9w3dVBPzbdaO9M47PlDocdiOSqbwOIdz/5obH80NWarqabTVYORhxyXxp6ooA+ouWOymGVVGvlB/J2D4iDJnXvVjih9qNCu9Zwb2j30KryMGQbB7F5o8PEtsnYNxXaAA/8PBmbhRennJjC2UaBwKsFf4MgZ0daQ82MeMbpCrWJK+bWeV0pEk/oVZ6TrOvgY5zRHyW1BjN96UzhIPyFe28Y0SzkEJSBJm5EgRDuGnTSHQhpamC4SFmQ35Xc4JIPjKFaxRlqAHgb+OXn6kcq14gUqpiFbw4J3abrN0vyVn7SwhCKF3U2k9sM7PUpJ9ccf3r7FrqOcP7nvv3xEmQgLmlT77Zyvspfj6ZkSmBONGo2HojQLuXwhMZw3A7YEYJOwpxdn5Zc/PL5J6nlJLzc1Vh2Bv9s4kvkA01kZcW+Oy5IAp+CsPyAN7e2zyWatqCzASglkATzlr2QWxmkRkWNHX7DsIw4fp8EvDee8q5qRCFRRAOGjchbHu9PJIIrBG5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(261009223027099003)(921020)(11063799006)(56012099006)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCtOS0ZIWXVOUXN2eXpYR3dacVhpTWE0eGVwN0JyUEQvN25vUS9RdkpYS0FT?=
 =?utf-8?B?RDNmai9laFhBRGplSEhvMHNDYWZBd3NZNURqc3pFdmRuSXVwVkNaL0xTWFdm?=
 =?utf-8?B?STY0VGc2aU1MekdhVXArSUhkVUNydG13S0Q3dnNrbzdHcGNTQXl1TVBIMVRJ?=
 =?utf-8?B?ZlZ5T0dkT1hXa3ZaWWZITlJDcUVZb0IvcnlEKyt4cTJ5Nm1jQ0lnV3dVSlVv?=
 =?utf-8?B?VDdtVHlZMXpVNVU0a0NyWGpqUFA5eERITjF0dVA5Njdhb1diaGlUT1VtUS9y?=
 =?utf-8?B?QjRXOGJ1aXlFZWo3TjRaeWxnOE1jWUlMTjZOT3krTUNsRm9sU0N0MFVITWk0?=
 =?utf-8?B?U2NZSS9KcDNFdTFBNUNkdDlVTURoQTRsakZnTThKZEQ4V0R4MXpkdTZHTkkr?=
 =?utf-8?B?NW40ejlBM29Vck5CcW1sWjk2YmRuTjAvVy9hbzlQd3g1R2dJUU5CZjdSM3RP?=
 =?utf-8?B?UmdGVTdkdTFPSkJaUW5YZ2F5cHlrZU1ZV1Q2cjljblVJbktuRU5hTk85cUhS?=
 =?utf-8?B?alptTFNNd3gxTXdNNlBiWHpNVHUvVDJzc1lTclBKKy8wTnBMQWlJNW83UnNz?=
 =?utf-8?B?NjVPa0pQUzVMRFMveWNkcktrUndGd3ZCdUxRTkQrMzlSTGhVRDR4ZFBWY3M4?=
 =?utf-8?B?VmZyTUtFUkMyRWNvd015dXBuaXRNejdkeEtRaWxmMlQveVA4M0RYcGUxMWNK?=
 =?utf-8?B?ZzRqNm1UWUEwc0w5R0o4MzFkcDFRdTJ3ZTlJcG4ycU1qNTE3RWJSZzFEblJ2?=
 =?utf-8?B?ejhuM0k0TjFBZm5vKzZNZ1RidUYydE0xYWdOZEhZM01Cb0JHd2hGZzd4VjhK?=
 =?utf-8?B?VW5XNmt0QURSVlZHcGRtNTlXL01jYjVKM2IxdXYwVEZwNG5ndGdraVRCWklJ?=
 =?utf-8?B?UHpVK1h2d29YT0cyOStoN0tYbzFPUmd5SGRpYW5RSDJiR0V0RnoyVlQrcWtz?=
 =?utf-8?B?WjY2Tk5nTTY3NVhrV1l0T3JuYlE0ZHl1UDFGdk51Tmw0K3c2TWI4SHA5akhV?=
 =?utf-8?B?QzZuQXdUYzNqRUN0YlVrc1QyQXJNM045aFRZSVlYOHJVelViRzQ2N0U4L29j?=
 =?utf-8?B?QTR5UnZEa2hEWTRDb3RjQmhiK0EyWW0wZUpMemZ5RHN2YmdKanZlcFM4MVVT?=
 =?utf-8?B?cGU0d2dnLytQR3lrZGo1Qzh0Q21OTnR0eEYwc3l3c3M1eDdsbHY2NCsrdG45?=
 =?utf-8?B?NWJvMmtWcFBFdkpVTW00T2FSaUVTbWxRNHlmcmk3V0dDOGxEc1lmYjN0aHpC?=
 =?utf-8?B?bFZhZ3lvWFk2TFFiNTVVUlZ2QkFTQWxkYVloaHdTWEJiK1owNHJIclpoM1BN?=
 =?utf-8?B?KzNZTG45bFlIczFRajU3Ujh0WWQvUHJmbEZmOEpHRy9HQ09ESXA2RlMrWXAx?=
 =?utf-8?B?MHlTT2hETXZqZVZWSFphT2tvY3EvNFZKNW5Ua25weEJQVDFBSytYWFd5Y0NM?=
 =?utf-8?B?ZkFDaEZ5dFlQMTVRRUlNdHA1OE1NOTNPc0RaTGtORVVEUi83V0pWMlRKYWoy?=
 =?utf-8?B?Zlc3eW96dmRmKzJSdTJyU3FvYzY5ZC9ITllSemhyUEZPTlBVTmY5RmJZQmpF?=
 =?utf-8?B?Y0JGdFdnc2NGMGNLRDhRanEwSXVKNitrTm5yTVhZYS9uQVBxZ2pvUnoxaW5M?=
 =?utf-8?B?Z2N6NDdDTDBNV21KaWJjN1NHQ0RxTFpORTlxUEZHVjZrRlpZdnlTRmwyd0I3?=
 =?utf-8?B?TTRpMSt6YWlyOVEvb1RCdytSUThBTEp0UkVNYlhjb2kwOFQrbVcwS1VnMVJ0?=
 =?utf-8?B?KzA0S2p6bTR1cWFjNXdRNWlYWTcwUWhrUHdJMFI1OUJINnZoK2xsNzhmQXV3?=
 =?utf-8?B?MkE5dmNUM3UySW9Za0xtMldEYUh0Z1FCRWRRSHl6K3BRaytBYmxSMjRnVmgy?=
 =?utf-8?B?UU5rSnNtVDZCRHBRTmxjVXRHampkSlRxUFFMYk84NFkzVHQwNHU2TlpiWXBk?=
 =?utf-8?B?NFQ3Y3plL0Z6Q0txZWhhRk96Z2hxQlVndVlyLzIybUxaaVAvZUxSaHVIUUtE?=
 =?utf-8?B?c3JkSWNub053bmNWaWJpUm81K2VndTNSeWlhaDdmcHh1MGVhSmk1TFhqb01B?=
 =?utf-8?B?K0lUdGJMUDQwaWZUK3FHUndjL1o3Kzc4VHhSNXFIN25sczFTRGFXT0FxVWpj?=
 =?utf-8?B?YXVMSEg2dWtpZ0ZqdzBVdmZQK2Y0Zmg0UnlRZkM3L0Q4TDVCK0xuTzRpTi9G?=
 =?utf-8?B?aFZuUmJpVlc1c0ZRVE5PREkyU0xBQ0dCalVod01ZZ2ZTR2J0WTlHMjdiNnhD?=
 =?utf-8?B?YjlQdmVvWGVVdFU3L2JVOTF2VDAwdTZKcytlWVVZT1Q0b29UazB6T0VRbjdM?=
 =?utf-8?B?TEtYcWRsMlhndUdqZDBOMDQ1SGhEQ3IxSEJtZVNxbnVUa2oxenNqWFlMT0hW?=
 =?utf-8?Q?XEPK7o7p9c7l29R99UjUc2iwOdHwRl+h7pXR9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab6899a-ed61-4682-c15c-08df49a9e9ad
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:37:02.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3l223AkMWiUB6M66SUI+iICHjamhQ1T029m6SPz0LXwljbd/kfC79Ds1OZd5V/PcJqEFOtXR2N8luQsOfHTzhMleCnvoYyvyWPgTxn6z1hvF+miHqn4NVPQqAN+uD3ii
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9750

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 11:18:46 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The micfil audio nodes on several i.MX SoC-based boards were previously
> using a generic dummy codec as a placeholder. This patch series replaces
> the dummy codec with the proper DMIC (Digital Microphone) codec node,
> which accurately represents the PDM microphones connected to the MICFIL
> (PDM microphone interface).
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: imx91-11x11-evk: Add DMIC codec to replace dummy codec for micfil
      commit: 7602e981f6e410649f6daf59c61865c5e93a0d1b
[2/7] arm64: dts: imx93-11x11-evk: Add DMIC codec to replace dummy codec for micfil
      commit: 6f50780cc68bbec81354eea8bc78401a177cc8c8
[3/7] arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace dummy codec for micfil
      commit: 34978907311f7db40793aca8e116436bb61dffa7
[4/7] arm64: dts: imx943-evk: Add num-channels to DMIC codec node
      commit: ba132d64d5fe93ca95b00dd53eb7aa650648f412
[5/7] arm64: dts: imx95-15x15-evk: Add DMIC codec to replace dummy codec for micfil
      commit: e62e25c28ac14b1cb5c38779aacf23602cf539d6
[6/7] arm64: dts: imx95-19x19-evk: Add DMIC codec to replace dummy codec for micfil
      commit: 7f9a85882dd0d9e64165b3690d243140d9e05212
[7/7] arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to replace dummy codec for micfil
      commit: 430c04b678f803244dc594b1cfdcec393938d52c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795601523;
	b=44Ok1PCJl1plETXUMjVReHnzShJsLUUkj99F2EpKTYjzEiJFAhvyV5Aiawasy1BtbU6r
	 dHQOeTbC7qA59L/6StFlSS5H6X9Q/zhigXAfBFJ4qU65LZ8QN3ttfjt0LXS/11Hm0+NtU
	 OM20zXPnamHYe2O2ttZo9Q6c/SdH8dolcqWiUDV0sRd9Q4HR86X3Ha6p+fTsaOdEZCWLC
	 cEI87+p5H9Ql5WD3jOx8xDcw2Cvum5h5TXLY9t66AkGgUUuqStCNLg7QK/O31HXR+i0SO
	 Wfo2JVExmT959ZH4aOCcZgZXisAY34NCHbZDRDrhdkiadIui39kcuNkA41wE4M2hmew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601523;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=9sDkmYR2R0Uu2QYn8J7pV08RFFlnmvwwohoU4C6Y1CE=;
	b=p9zrc25Z32eJo2seU7Sfrk1jELC2807HESiAjpP5hBZ1LBOmPH85+eISGIdm8rz7U1MB
	 JA4rObmRB7lyIjkAGvgT3cO3qy0GA2r5jx5rLGVAWnhyjd9N0HVw6h9LjSoeBQXv12CM+
	 wDMlksYM1CCPg0JFn+k9fSo5fF7pam0ui6LCQpAJtGSufnVD5R8pFfUjlkBDZXV70GXJY
	 8v3BJ0Shigs8S7wuYy/nd8sRHIP6l3SkAx6t6q/6Uv7omPsc+W8g7ALoaQY5+kVcRbh9s
	 cljes1WNvZX4tpW4pQmCX6KBTU7uBuZYaiGOIHeoIg8kFXTx3QCoxj1rxKXSkY+VauA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ONLg3CZy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC78606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 10:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC78606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ONLg3CZy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co1jWqM+gwXlzVvvBBt7Ro3Ino5SXBcioBh2BG0In57+78dbQVs2YFU19DZyCTAGmU2v7LLavABNSvDzatHebhrkCu0XiucsGvolGVZBVa3ePt6fCjtYM9PYmmbbEXtaNfbxACfdwweYsZY15/qihvvvbge88ok9hCGp9zJdQ62CTnlTw3wImnYFqJi9kmScglIK+WZsbY+L/XOaM4u6q3XNTnXVrMnnhsL2jTAqD6PqSSxJ6JtmrPrijAglnpM7sw4GsFFOj/yvaqZftzFwPOXK7Bk7Y8NOlg+OqqlbK/qDhiVK2dEJn2SQmU25H67VVtYF2cIHkuiyCCdLv/fq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sDkmYR2R0Uu2QYn8J7pV08RFFlnmvwwohoU4C6Y1CE=;
 b=YaavMX5g9z88+i/2hqlEIQ+d1WPxI/BjFTCL6ai2mS7Kpnv+i+7e9DuxoFrkYnZhfzclbYdcl+9mKR8+KIZRmN89RTkBjgWTuWT8pRwnZbCtyAPOrQdWnGmKO6YOXr6eNZe51ecmr8YvHqO6HoRJVjB19Z0OVQcZTnyi4lBCCMDcMuRQJKgJyWX8NuiqU5KYJibqeQBFJ6SwJG7/lGUotQXVNg2egrQC7/V9j8zesM9vb3ZANfOVoTooquxcHCWIX01Qhy/ohTKLegEmmkzn/IEbsNUoziH+pNniQGG1LWpvfqUs7gw7LCMFRqDBxbcpXN5rebA0Ay2EWW+S9tzhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sDkmYR2R0Uu2QYn8J7pV08RFFlnmvwwohoU4C6Y1CE=;
 b=ONLg3CZyx8Fq0a5D+5uunrys+oOZISGlAoV7ZhedSgivokg8IsDIwEptvWXoZwuaV6ZGNwUw3hYJNmgbV3ur6bIpQ6Fer8pjVNk1yIpSuJbdKIQaLynREtm6rdY8LpY9iXafL1HiE6LMJRdasAYP7wsP3DKvBysaAaHM4zkbDRugHzUoVobDEHjpuyvSlEr40GNoqGTKDr580yIZszTYFu1AonLjto4ygqZkA8cfLB4Z4Wogk6SMXtkacWqIBekeBGW3Cc+CfWFVeDFkauiko+6kze3S5n24FZuu9PLORnzSccWGkxF4jlHrr1SYA3s2ALjxPQL8TCUD8l18mmekSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM9PR04MB8746.eurprd04.prod.outlook.com (2603:10a6:20b:43f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 10:11:59 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:11:59 +0000
Message-ID: <a5af086a-2112-4a51-b478-999c505b6dfc@oss.nxp.com>
Date: Wed, 25 Nov 2026 12:15:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ADLINK
To: Dinesh kumar v <dineshkumarv85@gmail.com>, Frank.Li@nxp.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.hauer@pengutronix.de
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 festevam@gmail.com
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
 <20261125082222.136238-2-dineshkumarv85@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261125082222.136238-2-dineshkumarv85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM9PR04MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bc8ae8-3ad4-4b77-ad2d-08df4adc8ab8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261022105027099003|261022113327099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	JzCdyqopkzDopaCy87IDaYQRjDtAdhhGB+NONwKmLyfFerQlckiv8rM3bfh/mgopI42Y3gJhiIlszOXqx7vB7xiqd/rxGrTY7tQCSaiwgNlYdaDxE4SbeK/JdDQQzTwEIlPlxZY6YOKtY/KOfEVEhHMpwXEsq6JWfyYdpoBds7m274/vM7mfysGHiwpEGKj4LGxsj7ef7AWiHfjS3MTCgj0ps0ykQtTCZzZNYgVaQ2oRHvY1ROBfeA+/uBmAn+1qRD4xKABs664nq7JTVYau2LYQUFfzJ00NusBiOo65A6mEsfJ9LTz7v2909A64mv+tz8Lx0iJSrdJd45lBUXRZXCUPq/xsRVv39FhE1cbpOrzr22l+OpZGUhpsTdLn0fkV+3DJagY/uUxMmhPfB/RvjDrzlSU6qHZEb/dTZnSOMyU3LL0J8rOL6otE8lEh2ONFTeU51I/Hi8+8ZL69TUQXi6ulMOnOXUmH59P+SplZi/z/uP0ZIt78V29TRJPM3TXqKzqxPeknU4Dzpo2lKBo9jTCp+bRlr3LNCZ2+HIKZFLyx64SKGbG2XXNfGnlhhgAZP4mRhwQS/ofEe17g6g3KfrfODpfJzXHcfaMi/CPfHTx00lVQrqlok+5izCgECHwLwQKRsgXoZJXO9UPquwWVhW37B/DGIQMvS2SaV+zpXXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261022105027099003)(261022113327099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2dvZWp2STRWN1hYWGpVUDJ0RmNRanpEb1RaZ2pZbi9iWDRwa2FFbjYrdFRU?=
 =?utf-8?B?bmwwdGg5VzkyU0xyUG1DL0FTNWl3eDJNK05WRGZtdXJaUEMxajBYdHNkZFJs?=
 =?utf-8?B?VEUxR3dvYlJGTTRSZmk4Y0JpWU95RDVMUmNQVFdMY081WWRvVFF0TERzUDJV?=
 =?utf-8?B?a25uMjJTNFZZQkthM0Fhdy9Ca05KMnE3aEJzV0ZnQ1pxSE5BMEJIRUYxQlQ5?=
 =?utf-8?B?MVNFMnliem9LQmtEVmFXaGRQSGRaTkdoNGtGdmRaWDNieXRqRVIvV0t1aDEz?=
 =?utf-8?B?M2pSeHdYcWE1bWZQZlYvM3hxQUJNejlDMURWU2g1VE1lV1c3dWdDNCtVZHRx?=
 =?utf-8?B?ek1FOEJYNUNyUDEycFFtM3hISDdiY1pSQTZrZC9uaXhRekJxUS9PQ1FFNUlo?=
 =?utf-8?B?Z2dZS21PVGlwSFlpRGhicVg5OGlBUVZLbWZzaTYxMEZFeTNDcHdLQy9ZejVJ?=
 =?utf-8?B?NVhRdFlkVzhrZ0lwSVY1SHpKS05nVWtoamJIQ3JvYVlsWUlzYXhpeENEbmYy?=
 =?utf-8?B?d0NkUi9qU0ozS0pVU3UzQ3cwVUd6ZDFaNlpmVi9vSitGU3NVelM2b0l0eWsy?=
 =?utf-8?B?bmNDaXJYV1BTYUVtUEd3VGUzMGJLUFdCVGNTR29PMWw5b3RrZlJNN2k4QVBZ?=
 =?utf-8?B?TlBCVnVyZzY0M0ZYWHJ4ZXVwTWVIQ1AwQmhWY1o0ZE9lTnRTTzFVNFpHSldW?=
 =?utf-8?B?TmFwcGRtZDdUNWJmVlpCNHVBYjJ3OGNkeUxEZkhNYlNJRkV1Smg0SDI2Smx3?=
 =?utf-8?B?TkpIdGI0RmUxbFpoOU0zSmQ4dGpYUG1vTFI4WUhaMG5UbXptajlHK0tXOUVz?=
 =?utf-8?B?eXh2MFVtUDkzNHRRVEtTR1pvaFdtWXBNMWtoWEFpUkV1bHh1N1pHT25zQUJ0?=
 =?utf-8?B?dWhtZ2UwU0drbVVWV3RtbkwraTQ4ZXBxeXhqaE4yN2J0NWdkVXUwSXkrS3VR?=
 =?utf-8?B?azlMRFl6L0k1ZUJVVVd3dWRCN3Q2MEIrM0QzZzgzKys0bDhRc3ZxZlNtTndv?=
 =?utf-8?B?a2gxT0pZRGd2TGFsa1NheHZjVERqa0wreDhFd2VIK08zVXp6T2RHQWJYUkZr?=
 =?utf-8?B?Z0RGNldzdWxkTmVLUW8ycVlxa1ZIZVd2QW51QWtyNEhlTFNSOGsrN0ZzNENT?=
 =?utf-8?B?WXNpTkVLNHdYRU1Ed3h6SWtDYnlncnc1OWdpY3g4S01WUGxscmlGcUZudFJp?=
 =?utf-8?B?REx3ZnEwVm4yT0Nwd2cxdTlSejRIc2tFek5BYmQ1UGVjaEd1cUNCUFB4aStp?=
 =?utf-8?B?cU5FZnNidGk3RlF4VzJzVVRrdCtyQWg2bXFmcmNxaE9KUDhhOG5YQ3FYY1VI?=
 =?utf-8?B?aSthekZRMGtBYTQzVVFSdTd5RDQzZjhZd2NJVWRVZmxnVXRjZmlmWnJjamds?=
 =?utf-8?B?N3FzQytDcGhTdnpIM1pYdjJYblVDVDFGQ3BHaEdaMU1TdnZLMTY3N3FFZUpW?=
 =?utf-8?B?dE9OelZEZmF5MHdSVTh5cWZHZmJQUVdMMjVRN0dLSDFGemZkSllsc0lGZDQv?=
 =?utf-8?B?bmV6MVgvWE8zNG1SNHl3YStGK3hXZ3lnaUxsbXAxWlU2UGtrT1doZ2VXd2R0?=
 =?utf-8?B?alRZYjJPVlluYm1WcXdXVWhWc2hWM0pFOUN5VnJlOUI3dWgrOFlIUFRoWjQz?=
 =?utf-8?B?ajJRV1NhVHIvcW5zQm4wLzY3L0hFRWFYNndHSEdCazZaR2MzRC9ZQ0tsaWFU?=
 =?utf-8?B?UVhEalNTQmViRUk1UkdoNU1ZbjZyZkNod3IxN3BFUDkxWE9lZ2VtTjlPRmk1?=
 =?utf-8?B?UjhPci90YkpaVjQyc203UDZPSmhVZHFUcFl5N01LU0ZhWjNwV3g5YTRIQ2Qy?=
 =?utf-8?B?a2lSMEtwbWF4UDArZFliK2ZPamhqblNCUEJhbUlMeHpUbi9maXhFM0RuUWNw?=
 =?utf-8?B?NGJITmlPMzhnQUtaUm95dmZPV3l0cnUyYmZCN2JoeFFodkR1T2VQTHRxL2gv?=
 =?utf-8?B?NkNIKzRLTVZXOE9lMXA4aUZ5TG01elZWZWU3K3hYTUx0Q1d1aWJFVlF0aURz?=
 =?utf-8?B?OHNiRDdMQXZLa2NDTmkvOG5xbzg0TkJuaGxtSHRrTmVteFpGWjhkZVdUb3k5?=
 =?utf-8?B?WmVPQmJwUjFtRmUyU0xyWGdxYUtoZFNvemx6NVpqTitscmZRa3JmOGI2ZnZP?=
 =?utf-8?B?Vy9STGREaEJIb0pMd2FiYVhZV1IwK1pzMDA2ZnYybVFGdGdmMXFnTlFFR01t?=
 =?utf-8?B?MUNaNGt6Rys1OVNjSlIyMGJnZ0lVSzF3ZW04alA2NFV5UmtnUk4walhKZXFI?=
 =?utf-8?B?bGw2WlNrSHphUW9BVS91dURGckZqZGxaU1NVYzgwaVVWbHlHZCtLL0FJU09p?=
 =?utf-8?B?WUlUT1UxNGJXWXNKTnF5UTR3cXR2OGZkRTlZRFUyckdqa25aQWd3Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bc8ae8-3ad4-4b77-ad2d-08df4adc8ab8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:11:59.1855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LO6l7ZR+q3q9qJm6I2fzkmWz5OyIyRDuUGAsZT/SHdqVXaUg3sDNXYVsNFC7bOzYoyas+QP0PPCZAwG/BtSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8746

On 11/25/26 10:22, Dinesh kumar v wrote:
> Add the ADLINK Technology vendor prefix for device tree compatible strings.
> 
> Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index e467da45cd7a..6bbfa5619ee4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -70,6 +70,8 @@ patternProperties:
>      description: ADI Engineering, Inc.
>    "^admatec,.*":
>      description: admatec GmbH
> +  "^adlink,.*":
> +    description: ADLINK Technology Inc.

This doesn't look to be alphabetically sorted. adlink comes before admatec.

>    "^advantech,.*":
>      description: Advantech Corporation
>    "^aeroflexgaisler,.*":


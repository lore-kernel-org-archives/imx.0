Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613345;
	b=SYcYTeLjBssjmI2owMSCbGUssvykJ3bbQZfmyLr/xsBlZfZYgeAdnWeQaNCnI1ZEnKON
	 3xXUzgCL3QEd80ZeZpBse3ULUcboQXfSOyZIsSUP2RDCo8d9jsYVwHhO9InLfhpVTpWBc
	 2+Suoq1X8BwzO0F5gTLQ89syaJh22LU0XRul+RrlhWOZL+NBiUYKlX9YZvLZ3UfZ9HBbs
	 PnEp4/xUPpkMUZcE6MEarU44tqG4TxcajEIXcK1Zh5MFsaMLzZAyfWNrVo/lc0eHAor7C
	 xt4aRNu8t4SxLm4XJ7gIr/Fv5hxY5vd9IrgBd9uwpJCJEc9rByfOm2m8c6oKuBOEsuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613345;
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
	bh=88TKQVdvODL2UCBuB8MBE+Ndg2ClKfzfs4K509o1ydk=;
	b=wCQneQZRWWo4knlwY0F6ek372XUs7y77hMw/6npN28tiPmKWgZrdpPw+h+Lfl0G3k6dG
	 GYcyuvcD57/v7GFYjEmxKO/1m7ignCK13oHSaz8z2GJKkjn+0PnxpLaiii7vI9if34abi
	 O74ZUGqONnv3J/bOS7E71p98v2lxLbD13xb+fQFnEDW7kn4zJTFoPeWuYGEkEqji1Z9WL
	 +p3aBkpqlC84oydnQIU9m6KkcEpzSRnZ9KTVvXD7s/Z01TrjaiZVJ1rAQwgebLrDTOSX2
	 vIqLf9aBNRfjx8c2E9uNX9oXWkSjNpYnI8+EKCNkDZvwvElOLrrlSG9dzCvUsxj0B1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IzHbtzZ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB630606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 13:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB630606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IzHbtzZ4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yat7mMtqszlBgypjQIESHLSdgPmoKfucCJkkQfqvpEroeFS2PfpZJ5Nas1bVA3VKQOGVFalgdTZtZelm7DCC24y/Dr1HUf3XxvKfLya/FT7AhwkMUUOUPXx4c8S4wCIK+iXUzf3rtqRCFy7c/NcL5f9Ig6ByZ5bD0vv8EpFhFQ4dXYyw+EqGTM6uQj7OMptR2rE2STS8urTiOAJunEI3kadcy1woTI+qIdVW1PMuNQLehRT+63N13jnJu3rnRZSWEyse7jlysle2JHg1qPhT0mWvF1V2CGchjg8Dvtn8fN7+niay4Yit5GXKxn7mITGfzVRIfl+3ck/NRqqBCBVcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88TKQVdvODL2UCBuB8MBE+Ndg2ClKfzfs4K509o1ydk=;
 b=cBjMuHei3LG34xVd3NkKQNlUHU2jEnpbiD/d9t5mFdDLQe0Mj2cm6rTp5/xebDRr0i2ukWXYgp/zzSjadCvV48SPhkQHmgMjy52AqZbPdDZAd4s1mcCiKUj4KDYhMsvkTjz5s4UfVpQFmoYawyXnH84QkMAazuQVlrKcOiA0gOAeiN5671Wzj5N4uN5vWSgF9lFiOFTb9dsDEVe2c8yq7bfLYfoZ3KT5184mbc7NoLH14XtPPTZ8a1fBbN2kOZkuvLREirL9R3FR8xMizHW9WHY+pY4hYvHslk1ffHMr3KSv3t45PgQyyG7brqQAj1HaCcReyWH6CUMoVE+3zCPZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88TKQVdvODL2UCBuB8MBE+Ndg2ClKfzfs4K509o1ydk=;
 b=IzHbtzZ4xVnPdxsLv37VIbOBaTdXFRynpwOgQv6JYcKqXFte7reYFpVkmYzuzHcsI1XSm0h5san0Kx8He2v3bYdtKEZspxY50R1W+U75qEdkWz2cE6dG4ta9R8WrH9Ozx335kdfjS3dIfSqF16lSQ0zbmOCe+co79K5WGpCwJnBDpkmtAUScMiJKMhV9RXYZLLgmEu0jNr1ZGZAwJmv7RIEgIVPEE0bVCCLp5gjPvxbCdHAvmh4eiFVq5K6qBYNnSdg1+vW2VzI+8SWUjIdgFlymrk463uCjr2suYcXr09vGemTBcPpsTOFDVJVmNhZimoFRafuW1Jb7YzJSMr+zaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AMBPR04MB11840.eurprd04.prod.outlook.com (2603:10a6:20b:6f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 13:29:00 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 13:29:00 +0000
Message-ID: <834e6f05-895b-4035-b926-871eccddcf1f@oss.nxp.com>
Date: Wed, 25 Nov 2026 15:32:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add ADLINK
To: Dinesh kumar v <dineshkumarv85@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 festevam@gmail.com
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
 <20261125113845.297658-2-dineshkumarv85@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261125113845.297658-2-dineshkumarv85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AMBPR04MB11840:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae2d01a-608a-4f0c-9d64-08df4af810b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|10067099003|11063799006|4143699003|56012099006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K+6ZuH+5YQ0q0Eoytm96fYIAkDPEp6/jjmjfP5aCzKnC4UjY4AEf+yNqE/HUy0kDl+m3e+JNkPTCWYndEX1MqUM8ckM2na502fx0wTz7hU8u3HFwyN5KZ7E5JU9y5ufOVdvEo9VZKmNJ94mrGKC6g+0NugL6wJjOjIVMuJrNGXTuIW4FZYjo23eq8DrmTK2v8TFT7rRDu6Osknc7RiNMQ+Pfu0mxkhHChnTNZ/c2SfFnM+lb9dz38sIoM58y9CIfGdI5mDiGMkGXMI8Ew0rVdorZ6pRMpu+F2bECgHOH5hH7CaxSXchGly5csvH3J5g728LcSqHnJKURfOJ3D3EdDXM3lcSOjdE6M9R0pfo5kaakIC3IXet1F+VHGcvdRXhymwU8t+QdLjzrWpP/6imJE2/DZjeN/ezIkjwkhYh9KHdT4XsGKQFmoSzKx1XbuVnXBoPV1JqW9IrEb5/+t5/y/YiAe9EMHpYrmvEmK3OhRdgZQO6kErEZLTeNa/OqKnUuTbIlwhJ9x3Qap6nmHdrR+m00cqAbvS5l9Xywkq7glyqhPWMd4vO1sm6R7G5u3+ZBYMNfDjxgzYX8jkUi6cVQb795S7TfacN+JDJGAvEGm69YNn4KZ9S8IZ9FNn3m0e1isAoRzapqCGeyEZ+45Rf8Rcc7eQp/9owogFiLGl/6mAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0hOK0Rqd210TnBsRnBZZWxzNzJIUmhyck9nOWlCK2RZNHVQS2ptOU1OQjd2?=
 =?utf-8?B?Z2J6blZtNUZkMm0reUVRM09FaWl4eVVVT0pBaU56VVI2bkEzUWxFWGo0cGl2?=
 =?utf-8?B?WlJiZjFKNkxxWDRpMjRRdUtadExxWll6a09ia2JzbnA0MCthYXVaZ0ovODBJ?=
 =?utf-8?B?K3lvRk9jY3REaGxkVGJGN0pMMzJjNzVaMXlINURsVGpPUHczTzRJaGV6OEJp?=
 =?utf-8?B?K1NDVTNyRUFrNW41cXpqdVFsTjI3Y2FDNmJOQnB1MXluNEs4azZpeG5ERHVZ?=
 =?utf-8?B?UW9UTEJtbldnd1UzK2haWDQzSXhRelA2a2tNVk5SWnNWUXhOMHJvTlNUdTEv?=
 =?utf-8?B?dUpqU1V0WXVYSmt6MkM1NUpYbXcyM2pJcWdta1BJQ3AxSUo2eHFYWlFLeDha?=
 =?utf-8?B?MFNvMFRCbTVhRWFQQ05ONmxOY3ZjclZtRDUwUWZFODI4TlE0M08xZXNzVzJs?=
 =?utf-8?B?aGtTSE8vazc4dy90RTdOZFZhOUthcjhSVXJqRDUzMGJXNWgxR1lrUFFGZUk5?=
 =?utf-8?B?L0E2MGpRYWVWaTdMT241aFJ0VnFxSGxnNnZObmpIVjFxbndjSlhsSVRSSXVr?=
 =?utf-8?B?ZTI4NjRhWHozQ2x0VFdpZ0VXMUtYMG5RNXlsSUVWQ2g0elRrbFN6Q2xKUitB?=
 =?utf-8?B?MzhJL0VZaStpcE4ybkNBRDkwWEZkaE51ZkZ5ZVU2UkNCWk5BcHp5VHN4dXNQ?=
 =?utf-8?B?UzJtT296SVUweUgraTVBTWhBTDlIMEt1VmpBZCtEZ3Jnc1NaZlNSNzlHbzlU?=
 =?utf-8?B?dzhmaitoOXRVaDhIN1hBVWIvendRcGJHaTN1OE1ZWUp2Smc1Y3VYczRjajAr?=
 =?utf-8?B?dG1DYVNzR0pxaVdCSE9IM0k4a2daM0VqVU5TamhucjdQUkZLYUpTZElsOHNm?=
 =?utf-8?B?Q1Eyd0k2V0d1WWxqR2ZUN3RXSk0wY1krTGlQaWdkM2RIbUhwcE1vaC9YWTJt?=
 =?utf-8?B?Wi9TYmZuNUMzZ3pQMmlGcnAvNWpNbTZzUE5Qb1pCRDJEczZyWENWTkc1bnBk?=
 =?utf-8?B?bnBBRnYrek5mVmFoQXhvVlBJOFIyWGxRVk0vZDRDNlprOHJDSDZnY0xadUwr?=
 =?utf-8?B?akxKb3U1MlREWXhjRU5LUm41MmFjOXN4VkFVc0w1NURFOE1DaGQwWTRXRnRX?=
 =?utf-8?B?dEpaMzB4MUJMY0tqMjg1WTRQVUVlV3RjOWhsMzYwVDBTdnFHbU95emNUbVBB?=
 =?utf-8?B?b1Y2RlMvWFFZZ2dIWlYrMG1DNHozeGFWV3dRS2lpYVAvN1FZd1VTeW4yVFJI?=
 =?utf-8?B?ckZaN3ZaZXE2Sm5oTkxYRU1OK1Q5VEVLMVhYbUw5N0xJVEpMcWVlYlA5aFU4?=
 =?utf-8?B?eXdRRUM1MzBJL0t0WXUzdmdyQUphN2dBOXBXeHhNTy9QYkdWNXNBWmFScCtD?=
 =?utf-8?B?U0QrNlRZVnp3eG5WaFYyZ2Z2NzFDMjJ4RmNSNmU1dmJiTm1jR1NaWTk0d2Ev?=
 =?utf-8?B?c3pGa1JCK3oyQTdDN3BweUpsdTRHQmtWM3hIRVowRUVmVnA0ZlpyYjkxUUdZ?=
 =?utf-8?B?QVRML1NzYnM2M0FLS05CSWtJc25QenJtWi9yU2NieVhOQUFubSthT3M2SGtI?=
 =?utf-8?B?V2dOOS9kZFkyZWZhSTRqRnI5bUVrUlJsY3dhczdBRisrTUFOYTdkMHB3VUph?=
 =?utf-8?B?QWZZdmU2ZHNJS3ZDa1NXTEZvQjJiYWpsRDZLL1JKcm1VMnlwbGNnU1U1Ti8y?=
 =?utf-8?B?WUUrMkRoY2ZpVXBuOU5pZGdiNFlEZFhqd1RaSWtkRzRvWmVKZnFPYWpGQktl?=
 =?utf-8?B?YXpva25adG5KY3drSXBDb2lJb0Nyb3llU0dHTmRadEgyVkd2dVpnaDZRZEVC?=
 =?utf-8?B?ekxEK2xlajYzK1dJMWJzUEJYVDErOTNWYzcxWUxoRnp6V3FOclVJUXpnY0Rm?=
 =?utf-8?B?VUFPYUZJWENOL2tNUzY2MkF6dXp2N09xblRTWlhOL3kyNXdNakg4alhQaFFS?=
 =?utf-8?B?U3pHaUZ2aUdCd0tkTm40dmwyaEwvOHdlNEZkSUpvZDAwUlBZeTJLR29VRFVZ?=
 =?utf-8?B?TGZRM3hpZlFuN2hTb2hGdWdSQVNKZnZxTStuMmQxcjVlM2lSNzlxbThXYzJG?=
 =?utf-8?B?NklHb0psNFJ1K0VjUUF3YmY5cEtEOWhmZ01xUmZLMktjYnNXQWpPcW81N1BJ?=
 =?utf-8?B?U3UxYmpIa1ZrQ1czOEFVY1lXTitGWE5KK0hrMGkreXAzdUVUWi9VY1pBenkw?=
 =?utf-8?B?aHZORCtWU3J0NCtSZkFTWUlqYzc3UGFzeGtsRFY4d2xEcThzRjU2UG1CZnJl?=
 =?utf-8?B?cFFkV0JlWWlWYkxkYkI1bDluejVrWituMldCUjNRc3lWQWJzN0t5bXJueXJm?=
 =?utf-8?B?dHI4YzJFVDhFR1AzSE1lQUIyZmIxNy9EZVlXY3I4UnYyeTRpVGNxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae2d01a-608a-4f0c-9d64-08df4af810b9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:29:00.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo9O8mUVwf8A0ehaxfu9dC39CUdDryw8DNUh1+hxMdhZ88uli2l/tyAX/CGtmZwVS9xIL6a2/RRnpBBlhloUKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11840

On 11/25/26 13:38, Dinesh kumar v wrote:
> Add the ADLINK Technology vendor prefix for device tree compatible strings.
> 
> Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



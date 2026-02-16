Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333730596D
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242911; cv=fail; b=M6ymOmzbOGLl1pAFxG8eJCRVb9o3KrNvoB2oIycHgij50pCKybHCv3ooThkf/B/663xhyWsvzsljJ6SqkPXHYqC+SmRP2DXhQWqHObYcefJ/dM+g5oTL8BhcVgA5dnsyaC52ZwOeiTGhUHe5yCniFJKAK0xA6Ky+ugLX4hN0Yno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242911; c=relaxed/simple;
	bh=AwcBkG890a2A8Fbr3OjaHs6Mls8EG/xuD8eBtruPGqk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l9OFcJYW/S5pFn/ZsGN40Z0QMQqrdEjIKMiv3v6X/98UxIlfoylVvgLIHWWkjOmgz/+1tJVwdTFhozpjCBH2/QqivCXBs/i0tLX2AEboNoaI2KA24MjT/4GchHSsIq682pDGXwwbyOMY8UHCSrydSxikrbLzGmUTh7beza8qwpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HshQSrsE; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HshQSrsE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZBT0/Q4M4ZmSE4oTx4byHY2qddDiRWm+D405WVHKQ8Sb7P8MAoA3GA/NtqyDHHAcjHuBH+GvTqLV6STBPjU87EBblys38id70dF/YAgkdc44IX7LNTSxAxY+Rx4xpIR0mkalMZCQtKV1qrcSlz6njLquV2LI0E1Tl7PHY5IU2v2PW2/K6Rlm/GOSrVD5rKtB4RUm1jhrZdpwg3aC6ROWivVyMZ1ESUFD2VIwyRein1x4rjqE1+jtuFqMtZj5XooQFdROswEyKqVVsx/AbsyI1rf3bYrpT2ZSRMCQOTYwNdFX7/89SwpUCz8eZc6Os9Ump6kKmFqyiRwwJ5QkINWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwcBkG890a2A8Fbr3OjaHs6Mls8EG/xuD8eBtruPGqk=;
 b=nd19BKC2v2DMpqXxplSDK9ycWDYyXrzkCo6z5p2E3LKfNsbM+dIMU2h4dSb+Mq92m2v81z/9K+9HnKxDHduRwzMxDQSAY7UYlTK9St264DqQkDOHFeDlPZD/sl1yQRlni1p0A3bhnsb+1NZm7CxkQNPgkRAu0xxlp2tnq6kgtwJDciuZdSiFkzlYM5/I+BjLPAAwcXn4Bb+V04+0wF61TVoiKRt09c1cKUCtVbVVfizDPx5OYJdNf4s+XG0SjC6uCa5qXLqGVkeYbaLBAJCMTeDzzEc91shGI69jO1zxClfeUqLeHB1T+1mSQZZY/H47xXB3xuojEFwc1/13O2FYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwcBkG890a2A8Fbr3OjaHs6Mls8EG/xuD8eBtruPGqk=;
 b=HshQSrsEm4dihfYEHOwPaeIGsHh86W5UZwQhCxWNGg9ReSS/Pmqk0ioMiQVmPSHURUQhrwuj/PiRHw0bE4kT/Tr6uNeHTQsxUzcD6EKU60E54P35VYHcAKSJtrJ3JHiio203g9N2X/xJY9NW1mVEb5E+M6WPs6C+jMK86tQeJ7njMXu0L/N7C7w+0jVZJh8oZt/hZLCsgPAI0K5Z32YqZn5UgzD+cNGhLpYhdjl4DLjbPfdinB9ARSIaA2Bt9PZle2yZoqrDm0rFK69UBDP/dkHMHjH9KmQILeg7HItlv80h9Yg/4hH+b9gmZdD1qqJd5josforP06Re5wQjkuSf7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI1PR04MB9788.eurprd04.prod.outlook.com (2603:10a6:800:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 11:55:05 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 11:55:05 +0000
Message-ID: <309c1f16-5a84-4fdd-91c2-b393453bfb09@oss.nxp.com>
Date: Mon, 16 Feb 2026 13:58:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: svc: spelling corrections
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, imx@lists.linux.dev
References: <20260216061755.2801697-1-rdunlap@infradead.org>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260216061755.2801697-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::15) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI1PR04MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c0dd60-cc5e-43df-3704-08de6d523982
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE1HV0RUc0NJRGNianMvTDl2clNSM1BLSis3ZDFERzZtb1B4d0d0VFg4Z1JT?=
 =?utf-8?B?M3ZPMXdZY29hbUxFN0NUTWVkTS9VeXh2aTREWjJkc3VrcWRwM0l3Tll1OE9P?=
 =?utf-8?B?TGdUZUFlS3RoeEE0ODVVWFV3OTdhR09DZWowKzhIN1ZjbTBXbmhSR3VXTCtG?=
 =?utf-8?B?aWM0NkpZazYvZTBSTTdabndtY0kxaElCQlhsVlA2dE5OcUNoVjFpTk42ZWpq?=
 =?utf-8?B?cTVpQmdIaDVtTFVqeWFwTDdNM3B3QzF6Z0VHdGljTWtuSTQ0SjJPTFVaaXA5?=
 =?utf-8?B?anhFdmhsY2dRYk1KWnYybk9aNlZRbHhrYmlqSkVlN3RZNlNDZTB3czBkbUd3?=
 =?utf-8?B?ZDQ4MTR6VUlTcHdyaEJOMk54NkV1bzdLZExCOHhodTNteHlMT3BteG9xREt5?=
 =?utf-8?B?VkhwRGJlSE5NNmNxc1pLS2U4RGZ3QTAySzVPa2F6VTJjOUJhQVBqMnR0cERj?=
 =?utf-8?B?a2Y1ZnNsSGxGQUlqZW5leUk0Uy9Rcm1oQUpnSGVQWWs5aXVLQ2JUcytiZGxJ?=
 =?utf-8?B?Wm45TWxGRnNpUXdMck1FUVBkVURtelNUdXovL2d5TWU3UTdCaHVqa0had3pp?=
 =?utf-8?B?Uk1NdGFDUlNnOS9WL3FIVVZCcnlwemdVdWRxMVZwamx5RVJsTUo0aTlVTFRi?=
 =?utf-8?B?Q25vZmlpUVpmQ2hmam9zdldoZHQzc081OTQ5ajBDejRnWFAyck1IQ0VRTjZt?=
 =?utf-8?B?eHkrSzltRVRaRW1SZG90blJXa21UZG5HWG0waC9zbTBSMVNSUmhiOTVMTC9O?=
 =?utf-8?B?WDV2T3Y5RHNHQW1XRXVKN3dtVEJ4OG52cCtBRlRCQXlUZTZiZVlmYzFKUE1G?=
 =?utf-8?B?dXV4MkQ1N2g5OWYwSTRsTnNxdXdXTWY3VzdMQ1BNM2N2RU5ON2k2eEx1OEs4?=
 =?utf-8?B?S2tUYXFYYlNWcnpKL0laVGdPUDZ0MDhRUWxyL0VLS2ZlQU9yZTJZeTB3M0tJ?=
 =?utf-8?B?am1kbCsvM2dBTXRIZTEwZVllNE1oTU8rOC9LaFZxcHlRcGFrbGZzVGU3YlJQ?=
 =?utf-8?B?bWVMdkxxZ01LNWd0cDRyWjhCSlMxR1pIL2lRUVRrZEh6Tnl6bHFrTlpvOVI4?=
 =?utf-8?B?VzhSNitPeTFSOXk5a1QvTWpaQ3htV01sTm14TncxUkFLTkdIZUtLYXpvd1pk?=
 =?utf-8?B?Y3pTN2hrT3dKOTlEZkxWVGVqak1DdGY0WVB4QlVybHBld3Z6VGlkNEhHSTJn?=
 =?utf-8?B?NlZNZG9wdUlWQkx0VnZ3bnhxRHNrV2M3RGU1d1ZtR2s5V1FrczlGck0xR29k?=
 =?utf-8?B?ZzV2RFhuME5Lcy8wMk1UU1RvSWoyMGoyUkp1KzN5OEp5QUpEa09ENUdsS1Z4?=
 =?utf-8?B?N0lnd1BiaXdsVlNhSW4rRGhwcEJSMytZK2FKcVRIUXBhN0NveGRkUENEWDk5?=
 =?utf-8?B?Y0VNN3ZkVDNNWkx2MkZEYWV6NUVKYmZNTkJWZGJqSnRFVnFaTk4rbUxlTUln?=
 =?utf-8?B?RkFScHdpZE11MWRIR1lwUUt0UWpuMG0rKzNETm1HcjdhejhLM2hnZ2xpZnB5?=
 =?utf-8?B?Q1FpSUNpd1RWR0FNbDY2T0VsYXNIMWlRRWZIajAzRW5RQkN0Snc4dUw4cHF0?=
 =?utf-8?B?RS9qTUs2T0ZBR2kyOFZYS2tTRXZJQlVMdXBXaTg3MzVTM3g4RWI1SnV2NzBO?=
 =?utf-8?B?WkttMXlqT1FQZHlaWUUyTjN1Q05mbHJOTzdITmIxKzVwK3JMYnFKZDRiL0pa?=
 =?utf-8?B?emJzOXg0U1ZvKytwZitCbkhsWXIyZkZwaCs4N0JvVitpZmtGZEw3MmtnNllE?=
 =?utf-8?B?SXFQMG9sWGRDNmdTcEowWjJRT2E5YVNTUWNDaWZoeHZmSit5ZGR3d3RHanp1?=
 =?utf-8?B?OS9XRmZ4UGJOZm56TzkvNmI5M20zT0gxdkdhdFA0ak1qZkErNkJDaGF1akJE?=
 =?utf-8?B?WG1PeEtONTdyRHhOaUJwd2d1b0U0ejE4UStFVEtHUm5SVFVTcHF1Z2wwcVp0?=
 =?utf-8?B?TUpxMERsQmw4MHdRSHJpWTd4NkduaW12UFI1TG81N3RHUEExVHVydGxCemMw?=
 =?utf-8?B?ejNKMENodVB5aEllNkY3c1dZWk1WVHJSVWFnZ2dnVXpsSCtTckw1Wk93WXNK?=
 =?utf-8?B?bHBlNWN4OVFTYkxVdVdoYlNDQUZxdTNQVFRacnh6SXdGQ3l2UDVMcHhKQWM5?=
 =?utf-8?Q?66Og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNPUlNuaGVwSDZsbVNzdUl1ckxEdnB1VmVkcTZ2MHAwKzZ5d1JyRTY1a0l3?=
 =?utf-8?B?dFJzUFJya3NIczNrbFJ5Qk1uWXBBdjBTNUpuU0RSZTNxYTluUzdrb1ovcUVp?=
 =?utf-8?B?MTFNR1daY3JhQ0hQb29HZmZFZ21YUkJodS9pNEFoUUJNYzUyMm5ORXB1Zi9G?=
 =?utf-8?B?d0tvckJ6aEdPMlNNWGlINHhEeUF0U3NWS2pMd3lUSmc1VWxWRlRxTnA4TnB0?=
 =?utf-8?B?SE1LU2VXaHdyN3A3ZGI0aXlKd0FGU3J6RnBXNVhyZXNtKzg2RFc3SEVrbUE5?=
 =?utf-8?B?a1VuaFkxd3Qwd2pRVkRuYlpGdnNQK3NVWE8zc1lRZENZem94WSszZGZaVm9p?=
 =?utf-8?B?OUJrblJsMWdZYURmM0ZHV0JuQ2xGeCt2Q1p1TEFOR1dpSEhWWkJBVUJxSnEw?=
 =?utf-8?B?VjIvQk5KVzVRR3c0enJ0ZG40VlY0cEc0SVFQdmZZR3pXMWxOT0t3eE1mRmY1?=
 =?utf-8?B?K05hV1RWUUpESWppQ3NDdC9rRkpQOXFURUNtMjZMYXJZSEUxSGtiMng2blpj?=
 =?utf-8?B?WVNhSnBKejZ0N2ZnRm1TR0s3azlTaXlMV0Q4eThVQlpPdGxhWndkV3Nwdlg4?=
 =?utf-8?B?K0ZIMFpqUGx0UEtjVmdER3BBdEVzbWprajV3ZDJ0T0hMK2R2Ly9oN1RxMGZp?=
 =?utf-8?B?OXI3c0I4NmJnQ0EvcE1tSkgvVk04SDVzTkpVOEhUVDBPL3p6SzRyQTBjWE5D?=
 =?utf-8?B?ZWp4RkJsNS9PcWFOck9vS0g2d0V6dnNXYmxXc2FBZWdzbTdqb1VhVXJWaytG?=
 =?utf-8?B?WHlRdFZQWTk0eTVLZ2ZmYmNhdW5tcGZWU2tsbDA0ZnhqdllyQTgzSUJtQVls?=
 =?utf-8?B?d2Q3R1hLbDc1azZKLzRuc3R3Z0NOL3FTMDZvUTVmOTdwUnpYRFdtdVB0SGVD?=
 =?utf-8?B?MXFLeUpsdCtONE1FUHlUQUZZMVdFVldJMXhlU1c4SnZLdW9RaC9WZEg4Wkd2?=
 =?utf-8?B?T2Z1NFpITDhpSlNxaFd3djFRWjVwL3NiUXNSQ1VRV0J6SG03TlhqYjZvZTFr?=
 =?utf-8?B?Nlh5UmV6cW1lZmwyNW1IMjRCLzU4OVVNN2k3YVRzKytmRFNtMzFKTktjZDBt?=
 =?utf-8?B?NEF1c3RmOVE4QndwbGRneThGdkljUFVBT3pvMU9DUksvQWFmVHV4SnBzZWZP?=
 =?utf-8?B?NnpsWWJDbTF4aUQxTm9KbnMvOTVEeHFManZGOUNGZUxRV0t6bHVMYXc4VkxB?=
 =?utf-8?B?KzhUQmlFT3dvcjBIa2llQjViUCt0N1ErRmtHN2djb3E2alcrVnVHL2tRZkYz?=
 =?utf-8?B?dllWV1NLcU1SRHRGazBmaUU3L3g5a2hRelFGTVNYMDR5R1Z1VytTd2ZpaExq?=
 =?utf-8?B?K05UNThVWFJScGI5QjhtZ3R4R1QwTHc0dytIV2tFOWJoelJxRm9raHduL3I4?=
 =?utf-8?B?d1pLMXRGSTdnbkZRd0VPYmdWOUhEbk8vd2x5eUxvSHppRFVYUGcrQjhsOHBt?=
 =?utf-8?B?OGZwcm1sOTFhcmkzaHVWN3VsQ0R6QmxYb1locm1Gdk0xVGFlZ2ZWa0V2N3Jq?=
 =?utf-8?B?eTNkQ0xWZXVRaEhlOENXNmtOTjRUZ20weUZxbG95M2NYYnhWRHJGMUdtTFlP?=
 =?utf-8?B?OW9nWUFUTS8rQ3AzSTZtcWJsWS9TSTZUakNIRjB2cmREZUtqcFphVlY1ZlY4?=
 =?utf-8?B?OVNXOTUvTlZpQjZPSzZZTjFmYWZENzlpM0E4QVdaWW9oNGdiVFdjc2NOanVI?=
 =?utf-8?B?UVJyTkJSZk1ubytjSWI5Sk1lZ1JmZk4xVUlSU3E5ZGdyTTlCSFpncElYbzdx?=
 =?utf-8?B?cW15bnFza3RZWlgyWVRjWXNFcXpucGR5WHdPOWdSOW1lUTIyUE9nOWdkZ0JR?=
 =?utf-8?B?VGpaRWlJbFI4L1VlNS9oZ00zelpIN3hUK3RYRklLWXNZYlpIWm1aOG42bTRP?=
 =?utf-8?B?ejRNTkdndUI3YmlhVHJZS1kyK0xrVWhoK1pJZ0pCNXYyL0dqcVJmai9Bek9R?=
 =?utf-8?B?Ykc4L1NheFRQVXBkZmlreStNbnp1N0FWL3RDdzJkRHF4VEt5VGFVZWg2SGU1?=
 =?utf-8?B?V2ltY1RwLy9lQ09QWGpzYXI5RnFHbDRZdEdJTm1ZdHVNNmY2a1M5Wm1STmoy?=
 =?utf-8?B?OG9lUTVNdWFWZEVtNW9hWnp1OUV4VUNsSElzY3ZGZXFNZ0laM3VsYk93VVBu?=
 =?utf-8?B?UmpXd1kxS0tPdWxOc2VhM0xhRExwVEs0NllkZkpldHFDN3Zib2lwUzhjWUpu?=
 =?utf-8?B?anhQTHBCbThzakJZdzFFMDRubTYrV3lQSlJibjhnQ09qbDI0dUZDbW9BV045?=
 =?utf-8?B?enpnWkpFcDFHUnBIOUhCdkM2TDVxQnRmRGpoWExxMWR0UzBaTUFBYkZ3bW92?=
 =?utf-8?B?Mzc5amVoSmdqaHhkTXBzSDBSWjBmc3BJZ3JxRCtuaHJ0bExhcVpHUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c0dd60-cc5e-43df-3704-08de6d523982
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 11:55:05.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy9gQxKJalvf+xfNBIuY9P0haGgeKBe+BljLZTcsVOhazH3hXICKYjmdTCeDvoLe/r4zbQAzoXiu7gaLCWLjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9788

On 2/16/26 08:17, Randy Dunlap wrote:
> Correct spelling for 3 words as identified by codespell:
>
> svc-i3c-master.c:340: tigger ==> trigger
> svc-i3c-master.c:532: reamins ==> remains
> svc-i3c-master.c:734: filetered ==> filtered
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>


'tigger levels' sounds better IMHO :D.

But anyhow,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794431198;
	b=UYQVLFVyXkTkG7kQ4VoKem/wcQxh3qU1dxbPOsD7x2zY7lDU/zyb64GuQlmOthskuXZW
	 +jxTprCX9MZp752FriphBKyhHl3Wv8ENqTPwxIST9l1jxuFopTP4r1IsZlnizn8D0N/d3
	 q5PyDSC/cOUkDxLqxAicSOiJ3LcoTqEYNAEUSkeV/X9tXfrw2xZOpA/C8rBhN5BO+2A59
	 ZAFE8PD35LSqJo5sJuZEy7JWyenweZWSdJlG3Wyn/PlCsp5YxFiY1e7piizGw5lW0jmsz
	 o2G2JD0PRlX2X0J0oBMYnOqndFJEsO/b7sdKgmiYhuo35gz2Jl6Wyx26RZQvsk5ENAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431198;
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
	bh=N7HNNg9t+6fxpZI43pk7JoqlFUJH38u5ZiFrDs09p24=;
	b=ceWSKqoxwPeA9chyiVnPv+nNbluetP7i6RsDQaonxy+DZDB3ZuVK7TJOfM5gN+NbrR2+
	 YWjUcGGb2U2FJi4mPWDEkQuwM1f9utty7B7x0Nc28xPI1saUjbCfWYe1nKnTUvXmPYc57
	 7Thd4K6sFevjoDwA8x1u4mwdedOXDBrpqEH13ncwq7Li/eQTuqbFNlNelTCBSJevWtOxf
	 zlRcDRo+r/pHD41aESEGttbD3ewz+UCv5iQQcnJ0Exiz595RwOFzN4gOdlUUk5WyYX557
	 nBxGJpU8DwUZ2dEu0VuaHvb9kqlbPJ2P4Sg3/2FJshlb1pzo26F8bebHyPXGDh8YvsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kiTRVJiH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.55
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A224606A32A
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 21:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A224606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kiTRVJiH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OngJnO1TUjnh7QGy8Q9nPuTzcqEK3ZrwS/5dSTuPt0iri9jqLGUbePCtHCbJv476hb9xu8jmFO5dIgVwQcYtUmU5JMqGZytZ1f08KrMbMkvSieiUvBypkqT2RKEdLwDCgd2RoCauczY3NYBCwZyo/fTU9xzUk97J7qtWQ5gIMwjrNGpMDfKYiFkFLNvllrhfomfFw+oqwjLdrJu01yeLL9E4jMr+lT23DXF8Qer3lfzwVQT8H72ZqC+SuMQVAIQiqW1zHHJWCLXGssip7w+TzA4Bx5j7TT/S/cLYOShlV80PwYrHpgX54kHUCx7qjOsi7BDnHdToRPcUFFEWI5dI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7HNNg9t+6fxpZI43pk7JoqlFUJH38u5ZiFrDs09p24=;
 b=bWFjwn1qW88539oy2G/9b/q2tPJag5kFrNpK6e8F/OQxQQfZrgdQfpfXI1GaNHIAdtHGCBy/7+EYxkCCJ/yUbRd5o48WtTu8OIcuAj+ZUghQyojEZYYB+7SeKMYe1XaCNUmauQBZjHzPe7NpZZULkZUFgb75PwfmE39J6heHTY1rpVr67GASolUDsdQ/Zjlo3zKGJhogNY7wRt9SqYib9+/9f3JYcVvgtChlE17iak8OfukCreH9j3nIxbAnuNcoz+6Ia7UnavoLuvFsc/oNWo0yMTT3LUjgZLM0ltSNQiWFzd3Y0u7goxaCpv2l9KOfJ3kGrHrvg+kNFt0li2iS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7HNNg9t+6fxpZI43pk7JoqlFUJH38u5ZiFrDs09p24=;
 b=kiTRVJiH9E/4UPEIkr0tRyfOdzNSMMuByBWcoR5zPu1u6weubm4DjN4Uv1DSwD6pGmw6+lFs4zhNPPgopNgZNluZ5TOr/LP1XzzAPrdf0rmNMJxBI1AF4SsRKHPCQspsOy7iXeb2Vjb8YR4Yb/grC2WYeB2JDrLThkeXlGdMupJrQj+bkTw+zWWvy0d29HoS2DjcZ1x2iy7QUxpG6nhxDeQUHCAHepxSv6zT/RGkIYQDxe565Hbtd/+FwVOSi74iGc8kpyk4ih/tYa0lbBU1ZecbawLC9yBCKyGiJkp5z1nlDkreKhL6kO8n2jVwMLtEBjkSfmcpTg8CrbqKeovagg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB12631.eurprd04.prod.outlook.com (2603:10a6:150:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 21:06:35 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 21:06:35 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V7 0/2] arm64: dts: freescale: Add chargebyte Charge Control Y
Date: Wed, 11 Nov 2026 16:06:16 -0500
Message-ID: <179443117286.3974627.4204952513726774313.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102142649.8566-1-wahrenst@gmx.net>
References: <20261102142649.8566-1-wahrenst@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB12631:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d1a27c-c277-47e1-dac9-08df4037ab36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|19092799006|1800799024|10067099003|56012099006|261021121427099003|261009223027099003|11063799006|261028144727099003|261026140227099003|261022105027099003|261102123227099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KRJWMH+98noZGqpFYyoOSPT/bkQNyQBGx8nhmEOSiWtklY65etFVmUYPRRWCwvIr2+KA5xRtoW2S218cjYUhCkEA+y4m7eqocJ5ybPnqF9w11s9yF5paunUsXMCttvH9DE9PkLvwhYEMxBPjrz9nilHkDhnyFkuG6F7Xvv9OpNF/Hvu7zbEUz9UZE/46v5Dhapr5dEDCXQDZWY+nut6s5YCOMN4KPQk70IG6MjQfV5EhDmo5ETNLBzzOhEGkyxr24UMYCJJ/TfX507hXjgSVcPOU/yQDS2Z73cWgVgvblH3XcRwB/CXj8C8prjtwtagAjPNQGTOowYBVoZmE4QRUEGSij1Efdo32tItRF4qP7AQy2BLHiTlF+Mg6AeCH2G6A2LL6iJECLAwB2GA9AHo6aJjE8J0+SYztpiFFWskpLyqJH0nWOFGoI76am912Wu6T5W6xAfwGIfVQvwybiK4XIrwzPLNvqozUbtALqyUNMuS+VIQlBg4ccWEOqMsgVCe4jdQ7S+TszswHE1dHBZQZh9V08bsFNcUsFPx4JAk5HqsZKRIITkKJVV2Tns/xYBQLm3X/KCCtH0ECl+9x/3TP8hIg8iDSzfwdt2tVBDgek4jxSGA3NcIpcZQAzAXRaOcGscYc3/UcorTNE8Piio0Fmd5t/Dmj57zq9ql3grvcfdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(19092799006)(1800799024)(10067099003)(56012099006)(261021121427099003)(261009223027099003)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBDSkxneWZ6bEVRd3B6S2VpV1J5dTF0MlplNHlQdTI3REJrSU02SW0xQ05v?=
 =?utf-8?B?OGExQklYbHdmOHZwQTNPdUdZbFNpTTc5eDB0NFE5cW1sMkRwMlZ1R2Iwa00z?=
 =?utf-8?B?cDNUc0s5eVF1QTFERlFwbnlZVmQ4ZlRLZnMxbTJFS0JQcnRJZjRDUGlSRTI4?=
 =?utf-8?B?eFNnVG8wRTRaSWwrdk1aOUlyYm9IQllKdUljY2ZwVjI3VHBrdzlFWDVRV3Fr?=
 =?utf-8?B?NVkwVjZKRnpMVE95NWlGTDg5T0xuMTVtYzJoNVhMbkMvZyt5ejN5TFhCRlJm?=
 =?utf-8?B?ZkhOUUhMM1hpRWRXTzRZRzcyWWp3QlpuR3FCNmlUVkdHeElqK0s0RHJrejV0?=
 =?utf-8?B?NVlXUk9ZVTJ1VWdISkVscXQzeDJta3psclk0Y2l5NVRaV3VVZXJWK2tEQ2V1?=
 =?utf-8?B?WGJjNkVsRzl1MWtBeHgwRTBVRnBaTWU3K09tNHVWUXUraldhQXhHdmMvNXFh?=
 =?utf-8?B?cDQ1MWdySklZMzZvTkdHZE02S0c0d3Yzbm9VTmI5VUp5Q3RGc0hCTjZtcXNK?=
 =?utf-8?B?RnhDZVRLQ3BsTVZLVTVnQzcyby9JNHpTekIvZW5jQjRvMWRUZklHeEUxQzZy?=
 =?utf-8?B?S2NUaUNIeFJRNXgwalp0UXBLNXVZbzFNTFFSZ2ROcHFGT3dGa3VpQTBNbDBW?=
 =?utf-8?B?K2FRSmY1b1E0TUQxNU1wa1UxaWlhQTlXRnRpTzJLeFpoZ0dvek9nVzN4Ukkz?=
 =?utf-8?B?a0k4bjZJNmIzd0VvYzkzRFo5cnhabWs1bmErTkJuYWtva1paR0hwclVqOWF4?=
 =?utf-8?B?eWIrVWQ4Ykh3ZTdQUzY0aHNQbG1iZjBqZTNmaU1pWWZ3SUlPcEc1SHA0OFpI?=
 =?utf-8?B?VFQvVllDZTdGL1hvbzJKRzF4L3hHemlNa0dUbm9adHFWRGtjQjFoNWdTTlJo?=
 =?utf-8?B?U3MxanhTTXZqYUQwbXhQNFZjdjl2d3BHOEcxbFpwcWVHSFp0bzZrdGI2a05V?=
 =?utf-8?B?MXRCMWc2VkxXRlVXZmY1ejZSTThJUzB3SElUSVRocVRmN2VjNE9kamVJSGda?=
 =?utf-8?B?cXlsZlRPSUFBNDJxVE9LTVU5R1c3dGhmVUdQTFZVSUNwZ2VYL2luLzVKM3lS?=
 =?utf-8?B?RnF0NG9KQzJET2VYZ2dNbzZmTDhUeDJSNXB3bXpySEY5c1FWRnhpcTlzU1FI?=
 =?utf-8?B?aENkZHVNREtuRnZTTWo0Q1Z0ZHdmSnRKdE1YeHFaWFN1RGc0R2pJa0txd1VV?=
 =?utf-8?B?OExyOXVLU2t1eDNtV0RZUlUxUXE2UVRoekNjZTJBa0w3dVk1cVUxaHQzWXJj?=
 =?utf-8?B?WlZkN2RGL0tPdy9FRFRqUzF0U0hlaHY3cm9SdGZ1dHBWNTBHYVl4dFBDK0Vq?=
 =?utf-8?B?M05RMk1UbUQvUGdVTWo0R2VCeFYvNVVtQ3kyWXR1Vy8xNzgwVUN1K1NnSXBG?=
 =?utf-8?B?UVZzREFvVVFmRUNBUGtIVVFwMURkSFZpLzJicWNuSVcwbG13eE0vOTJ5NFcv?=
 =?utf-8?B?cFhpRDBicTV5RzRqTjJKNFAweEtJZ2pzTFc5UHI4bFEzSHNuVm9PUGllR0w4?=
 =?utf-8?B?YU1OMGVlSVVDM2x1ZGZpUzdPc0QyRUZCUFRsOEFSN1N6RVNpcDVnL2VuVEQw?=
 =?utf-8?B?TVl2L2xnYy9qNDYzQk1RN000bW9KUHF3b1Y1NWQvYTZtaHQ0R3FqbDB2Mjhi?=
 =?utf-8?B?TXdXRVlIOWEvcWt6QkFEY0hjanVPckUxWGFLMlFIMDVhQ1dINW5GR0pzclVY?=
 =?utf-8?B?SEZxUk01K2xuK3RRcmlkVExldmZsalVvMXNyNTFKbm9vaXNHQW9qb0JEek9t?=
 =?utf-8?B?SkxhVWhuSi9aUW52ZzBmK290UDZEV3d4blp0U0ptUnFoSDZtTlZGWDFTY0V4?=
 =?utf-8?B?MS9xUU1ZNWc3UlFKT3JiZmpYWTdTUWRpeDc2aFd5ZXZyYWxXeGlEMUlMaVdp?=
 =?utf-8?B?cmFISHFWNkNYSVUyZmpqVW5LdDZSNm1Va0d5VEo2eVE1dWdzVlBMcVJaaWFM?=
 =?utf-8?B?ckhpR0FFMEg2NkFjbTNUUUQ1dGZyamJBc1ZEamFmMHc4cnZyRkdTU2hITjh0?=
 =?utf-8?B?dWpkNmZIaGdEMDRCZ3pZV1pJZXRNRWpxTUs0U01vNlI3Kys3U3VPZGFkbGVC?=
 =?utf-8?B?clVwMExJdmt3QjR0OXFJelV5TndUUkNXSW9XMy84UHp1RTQwSGduS0wzMGF4?=
 =?utf-8?B?WWtOMi94SFNBY2piWWQySGtzcllwSWp4c1NZSEd1Z1hsWXRzOE1ralBkcSt6?=
 =?utf-8?B?dW94Njl2ZmxIdDNEMCtZTm9QNDR6RERJblY3Ky9oMWlPekw3dGoyZTlMaTcr?=
 =?utf-8?B?K2VqbzhsSmhwR3R6Uzl3c3gzUU15MndPcnZUL0tXS08rYUpic3JWZnRGeXI3?=
 =?utf-8?B?OTJBd080ZEQ2cURXUVBsT1I3Y2Vpb3d2N2RFQy9CVDJGRXIxMDVjU29Oa2hv?=
 =?utf-8?Q?/wBcyHpJ0hG0JHSFDhXfQ3Zy7D+t7jpLoqIcR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d1a27c-c277-47e1-dac9-08df4037ab36
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 21:06:35.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNfBYXDLNf85NkKhnebprk/roVKtQ1qtGaSQIeDbcbwREYhMhQztVSwkA61akMoyF1K94c2Y76zg9FBKP7mNdPM+xKtvI70TkJNQUQnUHN3opLCZIkLQiNhGxyZs1Zev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12631

From: Frank Li <Frank.Li@nxp.com>


On Mon, 02 Nov 2026 15:26:47 +0100, Stefan Wahren wrote:
> This series adds support for the chargebyte Charge Control Y, which is
> an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
> Charging System) charging stations.
> 
> sashiko reported in the first version of the series [1] that X_nRST_LAN
> is available via GPIO line names, but there is no reset mechanismn in the
> device tree. This finding is valid. Since the reset line feature isn't
> implemented for LAN8651 driver yet, I like to proceed with the current
> version. The LAN8651 handles reset via SPI commands and in rare cases
> we still have the possibility to control the reset from userspace.
> Btw the pin has a pull resistor in hardware, so it's not floating.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add chargebyte Charge Control Y
      commit: 3c0397f90fde224d620ad0f6ca2bcaff88ed4466
[2/2] arm64: dts: freescale: Add chargebyte Charge Control Y
      commit: b3bb1f678463062030a086d2098403240113c4d8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

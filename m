Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795402293;
	b=jjJq4MaPPyHSqy2YVqyHha+rUyoUo6uHBmnHiAtbDTaza0EixppZup54Y6zR9vYPGRu+
	 xS1TAucBZUpoDxZq0BiydezYf+8gvGpy7Ds4D6fn2RqHrCqNtUQNm7fJiUlx5pO7oTzkm
	 o2JCAqaJAZ9PCnH1pWtRGXRYn37Dz8BhgMZtpOdoMTLIuwhY/8eYNQgRvcAHFwyOfKekV
	 x/cuTfKGVV/qmVnamQqzHtQeXw8pcREN+ss84K/CklvkVZ/snWj9/E/WkNBPi8Kjv4W+g
	 Apms2lYq1WLkYbm4gAcA7DT7a5EGrkXAP5x+HCwRH3awqtRq3dhEpiugoE1Y2Arprkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402293;
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
	bh=jO4OjrwybHVgPGZAeksIgQTLzHs1YcoLGx+MT5zCWeM=;
	b=WInGLORAkDUxE914CYVz6Gc/gH0KQXDq8EYaQw5Ij7Oz6URbP2+8ane8BXa8N9Q9l6Pu
	 1r+tKSjioJJzX/VK9BZCtBvKzxPYpKsLVPwuFoXTZvqjFCLNtp8RwvRZVM3B9OiKu3oq6
	 zYk1ccarvcZ/QUUU4NdWetZVYigYI93yrJ8ELvB6yUI+rgnpnMhSQWgKFh2+q5eU9XqSP
	 csF54VOjW9NmbvomiyM5xEcooHRwMeNm2SSBRWJOOvbsY2c2/qwfUwf/ZUSXA0XF7Dd1b
	 UptUozD2g5j0fNODLFubz9LU62AWNM60l7vo7LP3t1zvSToZMY2r3M/N2f4IWBnebTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YKsAcq7s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.64
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929EA606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 02:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YKsAcq7s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgy81jFPiHqM3Su2NKPXSuRDPQEe1HVS723IKnXqS+Y8g4vshW46fed7l+1T1NZihYyiMwOCAFgnDNYECrwvLqvaTZQ9QNpBVfv/YRkvlINlP82qFEil50SEbakYoEbHonXk9c5kgjunNJtCRWBSVbaVCgtVCMK1Rly1/M8wDOb3W0LpD/xcXWuUk9wvd1goD7MxMOGP2KKX1d7dqcKdpFk9PaikMEyNtACIRuAkaqhtDTCdftkkx+Nj/kuNCOaWzF7IhqmuzwmkGu0beMCZPBdqbn1NEGVjCrGEdSJkO2vjtWOMsvoCPtnHwAGfob9PPT403ifVqFcY/SDt0KoF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO4OjrwybHVgPGZAeksIgQTLzHs1YcoLGx+MT5zCWeM=;
 b=DzKFja/j/mtxxEUAwXSKEiOm2LTFfR1nD0L+B8CrirKFr8r6/u/IX23UIKGECZFxHjp9CKo0cczTWG31gnarX635CcksaMpKyOJThGCtVuIByAfcZDkDzq27LMG9XwzaIgvCx2OI4kqoWYqYTr+La2IDrJNM6OHTSxTYkoL7Cdkue6kOucGf8xwPl/JmrkQrsI0mU4ZEA9QszhSN/xX3IoWxDxMP52GJ0lN8AM05s3VJDazgJonFPCd53jrmSrMI6CxsM2GeTX9UPueqWVw1teUSp5xFaLEMXhZLKkcF+3hKg0/YzdeIU6xYJBF/OZYIf3lj743XAUFRh/23qlWGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO4OjrwybHVgPGZAeksIgQTLzHs1YcoLGx+MT5zCWeM=;
 b=YKsAcq7sqSkH9Iy5JK5BkPskuV8R8QZA0aiqXI0lG0ACuP8cKwtVHYoYdjtxwFburkVcZAqSChudWZIVZ27wAjSJU9sIppLENioYTLZ2hURgItlaUwW/bj+HjCAxP3OIE+RaUS8GQEtL+yJ25/YCz4xiHmPMpnS7XlO71gbAZv8MndMdVJHP8ubcQkuge8gAQbVpO+cJhzRTrLMpIrTomjEDC92+OwafvFpuiunu6zZh7JbUVEoFsqrxCMx94axUMrXH3lCZZxEJ54Bz9pOSnOTMKsjBCxNoJi+iuR9c4xF4KYIRLx6HK0iHxkiC8fjS/mTAkuRYg7h+QZtJxrX6bg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AM7PR04MB6839.eurprd04.prod.outlook.com (2603:10a6:20b:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 02:51:28 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 02:51:28 +0000
Message-ID: <97c93f9f-0f53-4b47-8c6c-a2b056865e18@oss.nxp.com>
Date: Mon, 23 Nov 2026 10:51:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: freescale: imx93-11x11-frdm: Enable I2C
 level shifter
To: Freimut Diener <f.diener@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Justin Jiang <justin.jiang@nxp.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-1-78dde22a56fe@pengutronix.de>
 <MRWPR04MB12117B415189A3EC52A69934E94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
 <87cxrzbxy2.fsf@theta.mail-host-address-is-not-set>
Content-Language: en-US
From: Joseph Guo <qijian.guo@oss.nxp.com>
In-Reply-To: <87cxrzbxy2.fsf@theta.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
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
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|AM7PR04MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bd8edc-1199-4330-d83d-08df490cabf9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RK8Lmc63bSkc7ETxuG49FK1GSM7Skorj1w2TtPoMtGmLncuUa8NmN9NDIr4WTPXVurEjmCkf/heBNY54SlzlwWqwVreD0SBPEmBVKH34lRui6xFIIkx/7TRqNvKHJOmoxpRwC0gkmRNytMZLondLbHjhMpdAJKFDaNGn6M6R4vuR+AobqvjHRv4HqgVq1ilIlEEfBflEArLS4djP7VUbrXZA9lrB/znzXvref210iDuIShCQF+B0xcihIjnbKfD/OE2A4q1aUH9QWSD0yy7v3tIiAT5dEdvqgQEJthJdIHyXzwbnajTd7KAkWlxAaHHJAqBUIjpNy9CS7U2PrB4nSjXBakWhXOp2JyBhrYLLOZvakNIdNm+mv+wLahjgMSUbONC8zIMntehL3uc5n3NrR5t61SAR6/UJnH+lld1bbFZRKPsKRmyC/hSggR94RD9ljQZf7x0uhRqIq5KI1f6iwQabfNjmvHNcdIG2NdmoSXih3lUx2WiArQK+sIuKT1vwhq4aSA3a0JiGQAC4oDHJoc76FkFWtVvY0rWpc/qawxiZqAomzia01s/BV42fozIN76Yf3j1Etx2WHIxAMzEjuQl4w5XhwVaJZnyzZfE6Z9YwP/THH1HKIvxELRdqWiaunsr9mTmh5DDqptMLO4Zl3Codh3lffuf/S0y/sY/kzNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWRQbE51b1kxTjdvOHpEWkg0UjY0Uk9NTlh5ZVlSeVhmdTdNNFJ3cTA2MEV5?=
 =?utf-8?B?L1hIbjBuMTdqODZFQVJGc05JaXRrblhtYUNvcTJuYmVJcHBPV2dKdTU1TDBh?=
 =?utf-8?B?RWpRMmY3YkMzUVJtNkFud2UyQWNpWjd6OUI0R0VzQjF0OGlpYnRqMU1BVFRa?=
 =?utf-8?B?dXd4cXFHRGFHTml2LzQ0WndOeFFrS3RqWjY4b2Z5UGgrdkloWGl5SE45Umdp?=
 =?utf-8?B?Y1ZzRGFtQ0VndFpUajdWbUhvNW94NmdKTitRRzBBU1lUVFMzQTFOcllXQVpE?=
 =?utf-8?B?NjdhODd0Z0x1NFRlalh1VStTSDE2OHdsbjVVSzdNV2hqbUxyd2hPT0lpRFNZ?=
 =?utf-8?B?bzRVQWtiYXd0T3dRdlhJK09ZMGoyN283Y21hT1BIdWEzbDUwZW9jNG1lMEJZ?=
 =?utf-8?B?a2tGVlhkbmRoNGoyYjdRaTJkdzhBS3pNZVJKbW8rTEpWUnI0YVdDeWpsUCtu?=
 =?utf-8?B?cGMxUVdyYjU0dC9wd2VuTXQ2YzlQZmo5N2VGTUlxcis0WkdSL0pVMEhGWDYz?=
 =?utf-8?B?RS9wTklUSnpXSlVzbkdzd2lEUnk5ekIxSUpXdDFubFBHeHgweWZnV2tWd3FV?=
 =?utf-8?B?UDJ2SUtBWHRMUGNvZ3FheVk4aVk5RGJHa3VDdmMrMVRwSGZsTTNHQUlmK0xF?=
 =?utf-8?B?Q2lwcit4ZnFrWElmZDNxR3hKU2xIZ2JkekV4R25tMUxEZzEzMUs4T243RlUr?=
 =?utf-8?B?Y2lDZzlZL2t0ckV5c1RIU0pSV1pyMTRxb3VKOWlQOENnQXcva2lyTXcrdDVI?=
 =?utf-8?B?VGplSU41c2tGdmdKOG9NV2JFL05aa1JON1Qzb1FOUmpOc3h2ZlZiVkg2dncr?=
 =?utf-8?B?WUNVZ0MwZ1k3MGZGdTRVZHQyQWxnWHpxTVg3cHMvVjlCZEFER3RvbkpMNWQz?=
 =?utf-8?B?cS9UamZOeVZEWXRxdzFCN3c2d3NZZzZzbDJGWUh0NjdjQWd3SGVManVpUW1E?=
 =?utf-8?B?VFB2OFFwTFpET296WHRqTlRiVFJSa054MHdrTVBuTmR1dzNPZDF5aXZvTkd1?=
 =?utf-8?B?OHI0MThiYVkyM3o4S243SE9vZVlNSkpoMDBDTG5hNWxNSmxhTGZUM2RMQmx0?=
 =?utf-8?B?VzVzVHA3bStnclFBT1k5eW1INHFxWnlOQlJ5dlJiYU9ET2ZEeFZUS0tpWmFh?=
 =?utf-8?B?SzBJLzh3YldKU3E0ZUtKYlRKbEhMaGFaVmdkQ1lLcllwSUEwb1lLT21jK1Zt?=
 =?utf-8?B?VUxnclduVVJqNFhibmdzTVorWVZtMHN5S2hOWTVJMmR6Q2ZWSTRTaGliRzc3?=
 =?utf-8?B?Q2wxWGRJcFYvWnd5UTIyN2pZUWlwYndzUWhiZ0duV0t6QkFsQU5IeE1BTWhj?=
 =?utf-8?B?Uk0zV3N3eWlQZHQ5U2VJWW9LbjZoZElhVUdZNnE2YjErZlFickdrUVh5Zlg1?=
 =?utf-8?B?VVZGemVjUlRQa0cyZ3RqYXpYTk5XVDRaMmcvbm5NUjRIRElDakRWRnV5UUJk?=
 =?utf-8?B?NXViNUhrWGhaYmtmaHY3SHVvYjlEVUV2MGo4bWZRZGlvd21pcE9GNEVRNzd0?=
 =?utf-8?B?UUNhbnpLOThxaU02MWY4K1FTZTNDZVB1eHRiM1VOUklWR0txdWhKMisvU1Nl?=
 =?utf-8?B?S0pMaFpKYyt3d1ZwVk5zNzNqUFRqc2E5UlorellpaWZQTnNaVDlHNzBuSERl?=
 =?utf-8?B?UlZNMTBJajd5SHpSbGxzKzl1aWpsY2Z0YnkzN25qVnZScFA4OHlZUy80djd0?=
 =?utf-8?B?bEw3V1M3elArdmgxaHRVWVF1UndJZkNZZlQyVWlUMjZwTDNwL0d4SVYzaFRE?=
 =?utf-8?B?dFBLQ3BqUVVZeGp2di9rKzB5UFU5a05HdVdaajdOUHNPNk1PREVjTUFYTDFM?=
 =?utf-8?B?TTIzYnRJTHprQTdSdDcyOFErNlNNSHRTRVJsYkYxL3dDQ3drWUl0SXdpeHBY?=
 =?utf-8?B?d2d5NGpnV0dnTHpzV0x5RWFqYnZ5ZFkvUmxzeng1eWZHa3ViQVpqdEo1WW1P?=
 =?utf-8?B?U3dmOGlZMGdwR3ptQjBXbWo4dkdBd3RwV1pEYWtMQXowUFJIc0M1U2pMVERU?=
 =?utf-8?B?UGpIV01CK3BMb29JYnN3bHgvdHhZdk1HR0F1R1UySHVYb2VBWGZ6TXp6TWJo?=
 =?utf-8?B?eHJMTHprY0lrUVBkd1FORVh4dStra2ZhZ3dFLzRzeGZjL0FOYThPWG04VlFK?=
 =?utf-8?B?TGIrR0wvelh6SnQ0bkx2c3MvaTRIUnp6WnllaTlQWkJSOGNsd3pyQVNvL1lz?=
 =?utf-8?B?N3RCSjlOWlVPUk9kUjk1Q014c0pIN3BPa1ZTdldDaWloKzd3QTF6WUZaNHh1?=
 =?utf-8?B?aFlZcFRqMm9WWWdUb2VWRktDcTdQRFJpZTRMYzdnQ2txZG9NVDl0ejk0SnF1?=
 =?utf-8?B?VDlrSXJNUG9LQjdkOEp2aXlJVnFZQ0hCeEUvalh3TENHSDIxQTRoQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bd8edc-1199-4330-d83d-08df490cabf9
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 02:51:28.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byHfUEVJsZgQTDuLvNWu73j/e/nm55YoZGiX/33REIZlOSwqUBasGvApHIr/1j5QoKIu2M96eNa0ZrpYBPnb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6839


On 11/20/2026 6:26 PM, Freimut Diener wrote:
> "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com> writes:
>
>>> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>>> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>>> @@ -49,6 +49,12 @@ pcal6408: gpio@20 {
>>>          };
>>>   };
>>>
>>> +&lpi2c2 {
>>> +       pmic@25 {
>>> +               nxp,i2c-lt-enable;
>>> +       };
>>> +};
>> [...]
>> Can you please move this into imx93-11x11-frdm-common.dtsi?
> I don't have access to the i.MX93 Wireless FRDM board.
> Are its schematics publicly available?
>
> Have you verified that the I2C level shifter is also present on
> the Wireless variant?
>
> I'll move the property into the common .dtsi in v2.
>
> Best,
> Freimut


The i.MX93 Wireless FRDM board have same design.

So please move the property into common dtsi. Thanks.


Regards,

Joseph


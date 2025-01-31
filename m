Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14021C1F29
	for <imx@lists.linux.dev>; Fri, 31 Jan 2025 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336992; cv=fail; b=NihoEidvQ4f/jmfJqx2rDqDVltzA3i/spPuIukgVqKkJ/QB08wg7DKL6p/esHQOSma1rPLxM6qxjJNq9vPBJCrhekhQ8P9GwbdaT2jiEYTclLt2uwgZ4nDTKgGM6+lFbm0DuuZLOstRt2cZ8hZ/G9hizEnI9Pi5FF1Qv3qqTjUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336992; c=relaxed/simple;
	bh=WOt3c6r8cvJEG/w8aTEZxvWTaDxsGl+DFDEhHhO+LQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sRu+BUFynnw+VJaqhu4Ov2ZXI+HBC39VDF2GWMMayyZpUaODATzuV8WXLdn32DFOG66QNJmV3IvmY35XiOf0IVZb7qtMdqw92dxuhu+yiyL3uPYcTclx8nyHYVUqDz289saaPFogUv7FKqRwVWU1cayzlLXiPcQTINWFgjGprqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NRYFSUH1; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NRYFSUH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMXsun7VXRDOspohqKSNHebyDvg/NQq3+BzzQjwuEgy1scp96kbSkgYeMGiTUdM/EHRiUVnQSHNBL3lKHm4xCQ4Tkj3hLnuuPOeWQa/KcC1NyGIh2TxHs7qaHfjPfw8Xqf3y9SJSjXhd4a5qE4Tl6IM3XBCrTzrO1KQkcPx+K5Duejj5oyAm9mWDOzPprc1Jy4DjVx00eCGOPOpKi1/HfcSYn/c+QNMohSfwsrJQebpCZYTdMp0w823J/vdQw3+8nQUbc+wuKT749c0UkS1gw0LQaHm1JYItulKvhBdYcP0I/PLbS0qupZyOZq5vAL3k856fYQ4LHj0U8tOtLi7j8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOt3c6r8cvJEG/w8aTEZxvWTaDxsGl+DFDEhHhO+LQs=;
 b=D4xNpYRXyFFAyOjZ6BvD5CLOai+WIs6S9YuCY6+xGz4N6KWchOBiaMsUAbHI/azOKXJijNlodflJ8jt5nQotaQAbmSFHRxBbopw1R0lapEljKa8xVbd6Nu72xf0JjJKmurTQZOJK/jyMNxwm7OkiujYerZSHIH9rcIV4xjEJZrgBknOS3RglSbRkkWPcYbkiFH/U9BJzzQK782bSoLHU8SwpfVazx42zdxr8RkHpHEhI0W0WYRmg3pBHoowOq1a1VhjibTeronBG7n18Tj4CbmCBmv+P+ikZlx1nSAKdoMUVNqNFfrz7BJAgE0MfW0G51jFfvjsdur894P6qTdJTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOt3c6r8cvJEG/w8aTEZxvWTaDxsGl+DFDEhHhO+LQs=;
 b=NRYFSUH1p3f7QhIbXOy38WkXYmOUqEU2q9Kc6ZoJle7S5P3TPEA2f72c3GKWpxs08aIN75Fm77EAzMXm7OU/Gq72hl1goUDRVzwsRj0gYzRcLod+RUzwgErAVOifKMT4Lwpi4dsiS9y3lktJy11QSlP5stzmHuRPWYv+my6UbAMVh2NKLcHSDIGUl/NSetj08PoIl/NCDyvrMJzGE/T/GiG8E91WMNC1GL12XOoSV+yLqeyij9qrY5cBb4MRlGqlFL/n1IAJLm0+UaKhg9jCr+hRiJ2APiwfCKqdiXypduazSp1lGwLDvujaOokkrWprRrXhPzgIHsnr+SUp9P+5Vg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB7688.eurprd04.prod.outlook.com (2603:10a6:20b:29d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 15:23:05 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:23:05 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx
	<linux-imx@nxp.com>
Subject: Re: [PATCH] reset: gpio: Add self-deasserting reset callback
Thread-Topic: [PATCH] reset: gpio: Add self-deasserting reset callback
Thread-Index: AQHbc/QG3dH3xbFVOEG72DtbFtlnrw==
Date: Fri, 31 Jan 2025 15:23:05 +0000
Message-ID:
 <PAXPR04MB918558F4F657E9C1120EBAEE89E82@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250130215306.60589-1-shenwei.wang@nxp.com>
 <dca86a09-b763-4a0a-bb46-9cf6043cffe2@kernel.org>
 <PAXPR04MB91858A6F0917109DFF33110B89E82@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <40676b09-82bf-48b5-9a06-3057cd595815@kernel.org>
In-Reply-To: <40676b09-82bf-48b5-9a06-3057cd595815@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB7688:EE_
x-ms-office365-filtering-correlation-id: 7efc4b83-0428-422a-898f-08dd420b28fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0FTTXk1dGJlcVpBRUtiTzJmZ1lwZzBTM1dia240Nll0cm1nUGlLV1FMYlBv?=
 =?utf-8?B?Q2ZveW1HaVp1VUZGVk9vOWNlTlRiaTlnQldwMkI3b3U3bWpZRHRXL0dpcGVZ?=
 =?utf-8?B?S3h0ODNudVJ1ZCtTd1ozOUVtLzVkRTl3clFnTmN4VmtRbEpuM3lIakk0Wk5W?=
 =?utf-8?B?N3p6TEJScEljVmJFY1ZEWlFBQXR3MTRJSlNsM3UvbkF4cVBxNVp4djZKekZz?=
 =?utf-8?B?VzUzQTJyK3NhQ0JPbmtvTUZPRk5FTXhYdS9rUkgrb09Fdi9YVlY4K0J6VE44?=
 =?utf-8?B?S25NT3J1eTh5SDdmNTBSVEVHcW9oYTBEbFg2WkZ2R1ZZbnJoRkpFbTRyZ05x?=
 =?utf-8?B?dENnSkYzVnR0S2huR3Z3VXZXY0c2ZWpJUUVYNXM4SE1sNFJyOEs2V01Ddk9h?=
 =?utf-8?B?eC84T3orSWpHYjFxTHBnR2JJVE5lazdKenlhamFjUUQ5V0FwM0FPWHp1Smc4?=
 =?utf-8?B?KzltVW1kMVJCcFFJTFpKTTBDY2JtT1QzVkdveXRDRmRhQ0V2MkkvYzVUTm02?=
 =?utf-8?B?Z0Q3Mm1jc2NMM0NNcTNIM0hlVlIzZHR0bENnZHdDNlQ3SjhBQXBsYll2b3Fq?=
 =?utf-8?B?bGNWYVdQMnEveFBjckpVSVRLNWRSWTFrTkNsdmM0OU1vMWt3VlVueWIxbWVl?=
 =?utf-8?B?VFJhL1dBb2JnRkx6SlhhN1NqTFIrM2xlQXJjL0pqUkJ5RTcxc3NPdG83cHc4?=
 =?utf-8?B?R25zTmVGcWlUblBnRXhhU2JXbEcyYzdCQVRXMDdQdEdQMHVOMGt6ZEZjYVlM?=
 =?utf-8?B?cEYxbGtlK09uQ3VXWkxnNllmTXBFS2pKZGdaMGNseWh0RUNUNTFJdGtBVEh6?=
 =?utf-8?B?R0dBNjh2Rnh4cnZKbmdkU0d1bi9wM0tFcTRtZ1VWZGg5NXJPdG12ODJiSlhJ?=
 =?utf-8?B?SlU4UW00TWxrMXVOM0dzZFZXbGJML2YzRTVwSm90WGdySURaYk5RYncxYkdL?=
 =?utf-8?B?SWprQkxzdVJWQnpDNFdSZTA3Y0dZYkUrK243MDFFcDg5V2g0WHIwczQxSTM2?=
 =?utf-8?B?aHdpaFNQWk02dmVLbWQwd1V3ZHI4dFZka21MQkM0MDJrVzY2MWF1L3Vsc1NT?=
 =?utf-8?B?UnUyUERRYVF3T0xOcVQ3cjBncGJ2TmRaVUhZenJmZGJmMjh2TVNxaGF4V3ZP?=
 =?utf-8?B?b01QT1JoTnlTNjdnWEJhV3lCMFdUOW5Scm5DaDR3d2ZETFp6SmxnVnpxenZI?=
 =?utf-8?B?ZHdRWEh6OThHaEZLY0NveGRnTWxMWnVzbWZ1L2NUdVVXSEdINzY5blBBNTBZ?=
 =?utf-8?B?NzJsKzlkMmg0UUtFZnh1SWdURFN4Ui9OR0NLT1dJWUplaEIzWGpaU1NEV2Jr?=
 =?utf-8?B?aGMyam9GMnZtdTEzT1JZVEVabGN4RnlzdVdNOStlQmhMb21La1MzTk5jSzB2?=
 =?utf-8?B?WWFFc3RjVk9UMDB2cFRUdVN5SGFpeEY4WTdUdjNNQllSQldqVC9aZWlzZ3Y1?=
 =?utf-8?B?ZGh1TmIyV0NLZVQxS2ovQ0RpVkRwUWxHeGZENFJicSt1MnY0elZOcGNBaEVq?=
 =?utf-8?B?eEkydGJ5cmNGbVNqOVArNUppZ25CdFhFVmpQMzNwVlNkUTVzMWVCSnlqd0R2?=
 =?utf-8?B?Yys4V0pqaWNZbXdOcHJ6cnQ5a3VjZ1Z5RWVodlh3ZDZJMFV0OU5XSE90dFU4?=
 =?utf-8?B?K01tVWZIeUNKUXlPVDU1WEhXOTIzdnRrb3lvSk1jN3R2ZFNtU05pVStYMkZh?=
 =?utf-8?B?M2I3TXd3TlFTYzlnUmJnQU5BY2V0SlFYbDFoNnF1disvRnFFcHhVYndhVnBX?=
 =?utf-8?B?SENyaHl1RXFYUGRVR1ZmUlVtZjFMcW12VTllZllsZjJzek0xaldBeTA0VHYr?=
 =?utf-8?B?czVHMXFZeENlTjdhbS9YUGtmcEVwRm94cFlrK3lkWDRMZ3AyL2xFc3lISURu?=
 =?utf-8?B?ZTFmSTRtREtTZ3hid01jSER0czZEdHJwaTNpYWh6Z3J1cHBpUDVNTWxubElj?=
 =?utf-8?Q?BpPcPXAuKclwtJng/1ZepjAeGAVQL0co?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bklnMlM5YWpwSmZCa2dxR0d2ZkJ5TElvM2RLTHZoajRlTDQ3TFM5MnM5MHQw?=
 =?utf-8?B?TlRmSUxDaWtiN3JET045QnFza21zYVQyb2h0UlJqWGtPTnRQQXI4SVlmdWlx?=
 =?utf-8?B?RVVqc3JFRFFtZ2E5cTllMjI0Q2lyUTFSbUs4T0V4b1FGMEJrZURCc3YvbWFQ?=
 =?utf-8?B?eWt0azJUTDRtZWxtVDNvd2hYa3FjOHQxZlVuK1FGaW90THc2blVpWjFid3p1?=
 =?utf-8?B?QlZTVHhDK1k0UWFsRlhzRG56K1N5aG1jYmtLbiswczcwRE03SitoekV4RGZH?=
 =?utf-8?B?OUVOb3JpWDREcGJRZzQzK0JMUXdNSWtMeUp2RHRQYTdBWENieDZJTWRxNXk5?=
 =?utf-8?B?T3dCaGRiMjJubzQwYzczQmw2VHVBalBWWDlJQ0xnVy9QTmZJb3BWN0srRlRH?=
 =?utf-8?B?NXk5cGJIVFcwOVJDandEZ1VHODVqaU05M0p3Q0xoU1owdVBCWVhpYVVjSWcy?=
 =?utf-8?B?eXhuYklUeGYwajN5c3hpTnE1Smd1RXQzNHBMeU0zNmNOQ3RkTWdlZTE4TTg5?=
 =?utf-8?B?cVpaSEt4anlOOFlnYW9LVGhVbHBlQ3dTM3hKUWg0ZDVDSEE0Ym1TeTVpczFH?=
 =?utf-8?B?UWJNbzVtOCtFZ1RzWUZGNnJWelJOTHlOeUZ6aFV5c2ZleUZCcGcwVlBwT0Fp?=
 =?utf-8?B?ZlErbEdFZ0ZERnhFRWdVZnpyNTI0d0tWRk1OamdneXdkbHozMTBzc3NyK3J6?=
 =?utf-8?B?RzJGSm1tZXdnVktWanJ6Y3Z0cUxBOW1MRStSLzk1RnI2bzhEdXF3RlBYRnNU?=
 =?utf-8?B?enZPb1NlWnFFaWZHdzd2bksydEdwam50WnppM0NwUzVKd1dMUEYyclZlQXZR?=
 =?utf-8?B?VWRGRGJlRUVsOWMxc244YTkrV1RncGJUSXhnMGwyQ1hYSGxJNExZeTJUSitk?=
 =?utf-8?B?Uit5QjJCNnI2aEVTcGt6VXFJWGlicVdxOTFMZ3BRbTRDZVE1NWNqaHZCdC9M?=
 =?utf-8?B?VmZ0M2pVeTlqKzJKSUM1WDExUWpCSnFuTm44dnlpak90ZzdzV2NUWW5Ia2xR?=
 =?utf-8?B?dUl1VWdhUzNzYkNIdUdkQW43UWhFNk1rOTlaRHE3Y3p3MUwzOVpDSTFuaHhB?=
 =?utf-8?B?cG9EaTd1b0xZaitHK0xuNlRDamxjMk9hN1kxVUUwamFTUGk4dnJ6UFdtK2oy?=
 =?utf-8?B?Yk5kM2NxV2RudzN0RTVxWW9WNUwyUzd3TXJsVHB5RFhTOE9OVld3N0tFSjIv?=
 =?utf-8?B?NXp4dUduYmxtSkRhZVdaZ2hnNUkvend6Q1dFc1hZMElsNDh2OGs2YnZjaU9j?=
 =?utf-8?B?dzRoRks4dzlRamJiRytQc0lZZm1jS25QU1hINWk4c296RmVqemFiQm1YNzNR?=
 =?utf-8?B?OG55OWlRZVI0QkNqRDJsalNmZ0JISFBiYnlQMU5aT0tWUmlEeTBNbXlrL21x?=
 =?utf-8?B?ajBxcEkwU2czK0RpWEVtSkNzZnlRVkxGZkluVGo0M3ZQVmhxNkRYOU5WWkdC?=
 =?utf-8?B?YXNWb3h0dWllNFdrRkpGNzA2a291dHNJY0dNaVVFeWd5amNJOEt6WURzVXpV?=
 =?utf-8?B?c3B5b1BBVHZvRXlmYXZNcm42QmdqdnVFeW9SSXpEM2lOMEFUQ3ZORHRERUN4?=
 =?utf-8?B?eE0xYlowUGtQc210Zm9qVGZjcVBUQ2hsTGlaSkQvK1hrajJOaWFMOVh4QlBV?=
 =?utf-8?B?YmZUUkJ1NWVjT0pTNWN6cDBaa0FwT210MG1IVXlZbjVKNnFDVElFYlYyOTN3?=
 =?utf-8?B?V0pobVlWWWtFV3dDS2R0OGUyT0dYcmZQdlB6eHVYZUZscnZ2T1B1Mys3SnJi?=
 =?utf-8?B?UVZmZERyU0JhMnZlSjVmUVE0TWxaQmJOQ0dYMUpoWXMzMHZySkVVN0UrekNv?=
 =?utf-8?B?UWhUdnZNMnpyRTJjSm8rdHZzM1E4cy9JY0tTR0NhN3lXQTJvcTJiZHBNcnpX?=
 =?utf-8?B?RHlTSGVjNEhrQ1NiSWM5aXJmc3FldC9BSmFUWG51NHVOYUVlSlhJUFhnYXNt?=
 =?utf-8?B?d0ExZGprRUVKaUU5QjJiS3M2N0g0WkFzSTVDbUZ1RWJ4N1g0dElSZkFrdk9w?=
 =?utf-8?B?UDFVd0R6OFFtTGhvbVBGdEVJUW1INW1LTy9YV2VER05yUmhFMHNYZkNaQzFo?=
 =?utf-8?B?ampTbm5HWitrNmlRT052VnJwbHVDVXhSZ3llTnVDVXI5U28vbURwdFZWOGhp?=
 =?utf-8?Q?FQ3Ha7s/egUanXcMv2OiFkIUY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efc4b83-0428-422a-898f-08dd420b28fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:23:05.5614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEo4qV4B/pGfp3BCHHKzXGLC2bxgoevYZQ0khf7FNy3a0xOllFpCpqNql3CDgxYpQKO1f0QCBaM2H7gRLQQ3cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7688

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMzEsIDIwMjUg
OToxMCBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47IFBoaWxp
cHAgWmFiZWwNCj4gPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBpbXhAbGlzdHMubGlu
dXguZGV2OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhU
XSBSZTogW1BBVENIXSByZXNldDogZ3BpbzogQWRkIHNlbGYtZGVhc3NlcnRpbmcgcmVzZXQgY2Fs
bGJhY2sNCj4gPj4+ICsgICAgIHVzbGVlcF9yYW5nZSgxMCwgMjApOw0KPiA+Pg0KPiA+Pg0KPiA+
PiBObywgYmVjYXVzZSB0aGlzIGlzIHNvbWUgYXJiaXRyYXJ5IHZhbHVlIHdoaWNoIG1pZ2h0IG9y
IG1pZ2h0IG5vdCB3b3JrLg0KPiA+PiBJZiB0aGlzIGdldHMgYWNjZXB0ZWQsIG5leHQgcGVyc29u
IHdpbGwgY2hhbmdlIGl0IHRvIHRoZWlyIG93biBuZWVkLg0KPiA+PiBUaGVuIG5leHQgcGVyc29u
IHdpbGwgcmV2ZXJ0IHByZXZpb3VzIGNoYW5nZS4uLiBhbmQgc28gb24uDQo+ID4+DQo+ID4NCj4g
PiBJZiB0aGUgYXJiaXRyYXJ5IHZhbHVlIGlzIGEgY29uY2Vybiwgd291bGQgbW92aW5nIGl0IHRv
IHRoZSBEVFMgYmUgYW4gYXBwcm9wcmlhdGUNCj4gc29sdXRpb24/DQo+ID4gVGhpcyBtYXkgZ2l2
ZSB0aGUgdXNlciBtb3JlIGZsZXhpYmxlLg0KPiANCj4gU3VyZSwgYXMgZGlzY3Vzc2VkIHdoZW4g
dGhpcyBzZXJpZXMgd2VyZSB1cHN0cmVhbWVkIGFuZCBhcyBkaXNjdXNzZWQgd2l0aA0KPiBTZWFu
J3MgcGF0Y2hzZXQuIEJUVywgU2VhbidzIG1lbnRpb25lZCBuZWVkIHRvIHJldml2ZSBoaXMgd29y
aywgYnV0IEkgdGhpbmsgaXQgZGlkDQo+IG5vdCBtYXRlcmlhbGl6ZS4NCj4gDQoNCkRvIHlvdSBr
bm93IGlmIFNlYW4gaXMgc3RpbGwgd29ya2luZyBvbiB0aGlzIGZlYXR1cmU/IElmIG5vdCwgSSdt
IHdpbGxpbmcgdG8gdGFrZSBpdCBvdmVyIA0KYW5kIGNvbXBsZXRlIHRoZSBpbXBsZW1lbnRhdGlv
bi4NCg0KVGhhbmtzLA0KU2hlbndlaQ0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoN
Cg==

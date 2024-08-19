Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02212B8B
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 02:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724033457; cv=fail; b=pA/qANPJK+I9XurhCZKt2bu2Db2CoCguuyMSCt7U2GFPmcbdTxT5J+TMiOzEPUyeTnvfdEk29CBrbsX7V4xIfr8bGVOAgtaiC35JKTNaOtp84VGPPiOTPbBt7qu2mXMQuMILyN3fZMxwaeGIc+YeYVzd3P8shRq72C+VhJZ2M+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724033457; c=relaxed/simple;
	bh=g23lgbDbiH7ukosrb7+7al/HVWT2AgPGcHb4qsBz1Mg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OG7csJ1aj4eXFXD2w2aMU70wvkEakAbjm293lqlWTPakIX+aFUnOyQ4mVdWl5bIerzzIvsduHMfGuiyHZ5AtrFpav3FmxSDW41cpkVNOHFLvY9vky/JQvEhfMQYh5vdLNVK5Txeb44HPvffYd7j810z3aX2v+ORH6T/sBZn5KAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UGnV1Oqy; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UGnV1Oqy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TccNjgL8Kv8qhvwK4/SxdArWgTscvDYiz6sykdtCrqxpVwiFFY/vlOZVCUsh8GGn980pM1wqVh1oQWl0Z2smwyybr1i4qMNi7ynVKmYhowY/JaamSpffzvWV2QEjD3WA/Cme6Opfcs5sQ5cyC+JgeGfZB3N97Le2Cl8hAe5yATMIXXKnSjDVTs/nWlPU8GOkAWLM97VlcrQ0FqIdqmhlEKHMr+0iPCoRFqQfstM+SNDJAKotndfqB/QvNZ8TdrDJwMQQ/WbCRKnGyVo/fpCCBzAQOzAGn+ZhbKJ1rSiMJPfQZWyjc5R1RoR4TgzIZsEnhXa2DDbjo3Rjz/YQjoeSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g23lgbDbiH7ukosrb7+7al/HVWT2AgPGcHb4qsBz1Mg=;
 b=ERPT5rn1Sbe3DGkWrD6ub8ebRUJjc/T2gbHBT5tqxWbyr+MWPbHirgYT1/F0WOzi3aQkppGxj3XvMCZCBRmVaOUtVi/W71vKsmyIQlG+1b5mEPN+YaSDAJKTvex4Lxu0QaV2Audfonjp2WyHShowOeZQL/pJAfbCmy8hl+1IfvYBvIQ9Np8iGdjMDaW0RJU1zDHerksLZxhVJBXwipxzPhmcL/kJrtv59G2snljb8MsGYJ9zYE8geC2BeJXb1h3+0trNSRGKjPhLRiJB7Dh7NUAA8CvODbfzsFVBkWBa3G7A/6NKWmPrN1H6DmLYo+eVt/oR6pAI9oVGqlEgsHA7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g23lgbDbiH7ukosrb7+7al/HVWT2AgPGcHb4qsBz1Mg=;
 b=UGnV1OqyF3CTgLFA5zP/pq3tByQsSITkuZzWSRAmDbFopi9LPZY1uJV4z/v8uPSR5MFL11d8+/3iQe4gHukQp0mHhS4eIEXZ7pXOPL0fvl0ytsnKgwgIllErIjDxDoV+xe57zwHpVgi9+ZmtPQ53cQFPnBj88Opc+wr+2KKHpqHyfiwqCYCiPPnALiZXtA9XQMTchT6jZqB7pOqSdtR3ix6k0nUlNIRYaQ2G2V0i6uNbXCQ5yxQgKOAF6KJNEVr54FCfMXfRUQ3L8Vm9nNIlQ4FGVsnH2/p2YcwovMZDKagG0lycDcBN2YFFNIxdbESk/pO64ZF92/0Q6v/uExJjDA==
Received: from AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 02:10:51 +0000
Received: from AM9PR04MB8382.eurprd04.prod.outlook.com
 ([fe80::5328:8a92:1dcc:e783]) by AM9PR04MB8382.eurprd04.prod.outlook.com
 ([fe80::5328:8a92:1dcc:e783%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 02:10:51 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, Fabio Estevam <festevam@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: spi-fsl-lpspi: i.MX93 ERR051608
Thread-Topic: spi-fsl-lpspi: i.MX93 ERR051608
Thread-Index: AQHa7+NzTZvNQSbhB0qfx560xfXgdrIt2OjA
Date: Mon, 19 Aug 2024 02:10:51 +0000
Message-ID:
 <AM9PR04MB8382F68AB0BDE5B6BF092567F38C2@AM9PR04MB8382.eurprd04.prod.outlook.com>
References: <fdd11a93-b9f5-4742-8b39-56e6897b8281@gmx.net>
In-Reply-To: <fdd11a93-b9f5-4742-8b39-56e6897b8281@gmx.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8382:EE_|DUZPR04MB9966:EE_
x-ms-office365-filtering-correlation-id: 758c85f9-7cd5-45ab-47f6-08dcbff4261a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?TVJzWjNTaXVjM1NpejZZV1U3Q09FS0FGdHh5dnhVdjJ4K2FYYXBnSjlRajVZ?=
 =?gb2312?B?aUQvbFZ4MUROQnhCdDhIbTN2VTA3djRpdlg2Uys0U1MyY3F0RWJhZmJvUjdV?=
 =?gb2312?B?UTNjY2lrdkVGVjN3VDRNa2xNdXhYTG9oY3c2MEE0QkV5MmNoVENTVTVUM1Bv?=
 =?gb2312?B?cGFEakZxQkJYdE9DUG1ZcmVsWmhQd2h0WmU3UVJDU1Z0QzR5alBDUEVpS2Nt?=
 =?gb2312?B?dnRwS3pnVWRxWVdWZmVXdkVBRkRrVC9xSEtHckI5VlVjMllpRVovbUpzVUpW?=
 =?gb2312?B?bUtjaU5pWWtvdDIzaFZ6b0l3QlBDRTNWTUhMRmVQRWVzY1BlMHRZQk9La3lp?=
 =?gb2312?B?bm1yYk9adkRnTkI4VmFXSHhZaFVvRDhyS0lkQUM0bE5meXdRMDZJVENLNDlh?=
 =?gb2312?B?WEJVUTNqSkxvaGJEVFViL25GU3VwaFNWcjhJcWhYZXovbktTL1JMUVNYYTh2?=
 =?gb2312?B?eXMwZy9IMHk5TDRNcjhMdDBWdkljL29Vcldmdkg2WHF6UjhheVovbDVoemJK?=
 =?gb2312?B?OGxFcThvdWVKdkEyQUJ5VHc4OWRkbjhPYmVpUGxDQUtEdnh4aUxjeGJoVHJ6?=
 =?gb2312?B?NTBIM0VleGFYSU9YZWV0RkFPdVBIUnVleFpaODhzb0dUR1pSRHp3NGlOZGdt?=
 =?gb2312?B?UUJxUGJwTWxaQ0pXa1ppeEhTZjVubnhuV2NXYThObGh3ekxsTGtqODdVL0E0?=
 =?gb2312?B?bzJ2L2VDUkJGUzFqODV3Y1BIa3FBTXRGOWVFRzl6citHNzZsWUQxOEdLL0c3?=
 =?gb2312?B?aXJFM0RkRlpJamRKdjJCZzVZVWROV3czcmFqNEwxeUQvNVlMR2lDZHU3QWZi?=
 =?gb2312?B?OUkwTDk3eUxLeEpYblB1dzI5V0o1dzNpVlpKd3FLYnlYVXk4dEJzZ2dUMytz?=
 =?gb2312?B?QVpISldPR2JrQjRTbVNWalEreEs2Wk1Xa0wwSUZxUFNtd1ZKUmNRb1VSeXho?=
 =?gb2312?B?dWhaWEJhNGFJUVE2OWMvaEFpMTV0UEs0L3l0LzhRR2Q3KytpZ2t1aVUyWmdV?=
 =?gb2312?B?UWlRMkNLWGZHTmFKRXNCUlM2UzZyQzBuRnd3c1k4MmJDT3ZYZDJsWnNHbm5Z?=
 =?gb2312?B?ZndjdnFTb3l2WkVOMFl4UFdKM1F0RUMwcWZtcldGVVJGeFRnbHpBZjI3bUts?=
 =?gb2312?B?N3FZb2Q1Z2ROTm8wWXVlSmYxYWE4aDBpbjJ6NHBKY003WUFrbWo0RE1HTmwx?=
 =?gb2312?B?dklxT0RuTDkxSTVUZ0NJaDY5d1I2blJJQWp4bi9ZZENiZmkzVWo2VGJJZHJN?=
 =?gb2312?B?VXhKeVZmQzJxYUZpSHZZeUcxdkdJSFpNVGkwUG82SysyMXZXL1RQbEg0SzJ5?=
 =?gb2312?B?VjN5Qzlud243N0tiWWdoWjhDWk50Ri82OWgxV2xZOU8wZ2kxVVRYZGk2NGQr?=
 =?gb2312?B?RlU1K2FvckRLZWNreUt4WUI0Y3FmSzF5Q0ZmQWxnQ2RNU1hCZmZoeDZ0akl2?=
 =?gb2312?B?TmZTREVRVllEaXRXeXFSNlRmQ0N2d3dCSlVTOW80cFJPaFc2NVFuZG93dzhH?=
 =?gb2312?B?NFBFZVNXZk4xM0hXY1JNU0RyclY0QlFnWjNLdDlyRlNZY1JyMkxNSGtZaHcz?=
 =?gb2312?B?djlUZUZoM2UxTEFJQjdiMGZqc21SMUlqVGZUNm44SkYwUzVGMXd3NzZYTmFF?=
 =?gb2312?B?azhoVGljWE1WK1BNTE5sUVZiSTdPVmgzRHdFSDhwSjA0bDJ2T3RuanNhclBD?=
 =?gb2312?B?R2xaSk11STNyeWxIdkErY3R2VWxqaG40cG02UFFwZDFRU1FrK3I2cHhXQkt2?=
 =?gb2312?B?WkRnRitvSTBhVThzMVJIT2c3WkdzU25oZEU5emtCRkFOUy9iVkxCWlkwYlhS?=
 =?gb2312?B?UXRMcXEwelh2N2hiTlJlMmpTZ0hGb0c2dmxDa2pUaFRoVWdDamhscXJKdjdL?=
 =?gb2312?B?OVRGT1FiQkE3ZkNVazd2b2NmOWxZcFpZRTcxNnF3L1lSQWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?b09CMEZZMW83TWR6UnlZZ1ZIVjF0K1ByajhabGg0K3ZFQW5kL3g0SjBkZ1hz?=
 =?gb2312?B?VUQ3aHNndVpkMnZPS1JVTnJYMkZuM1B6NXB2ZHBTclNVc0JSaTlEQWhjTC9x?=
 =?gb2312?B?cmRvcVB2cXZIazlMODVrV3NRZW5JVTRCc2cydXgvSC9XOFZkZGl1UlJKUHl4?=
 =?gb2312?B?cE5oTGpkOFFhRmRrSGxnQmhKYmZoOFlUVXZ0c2RMSWNlWVkwRmVGdkl5YUhk?=
 =?gb2312?B?UEJLN2lzT3FDQlVUeDErM3JzUGM3T3RFc20yQUFKMCt1eGhnd2lKRlY3d25o?=
 =?gb2312?B?VEJZbDZoTnJFRjB6aGQ3QVF5WVJRVzBzOVo5QXBZRVYzczVITDliZkhXOWQx?=
 =?gb2312?B?cjNPTWxycDlaelRkZkZIV3BUN1F0RW03MWwvQUZIT011MHROZy9wOVlVeVVS?=
 =?gb2312?B?L0ovQ0pqZTNpM2N3NHpBNExqQjRZQ3UrVGRtTGVXOVdwVVdoZ0NMRHRJeG1t?=
 =?gb2312?B?NzBCNVlSL2M0VVdQNng4VzlkUk9RRkFKOXhhdkdmcytyMTJ5WVFLZ21uOGhi?=
 =?gb2312?B?dHdRc2JPdHZsTWVPVzZyanBieWY0TnZaYWIzNFRESGg5aUtMV3hTUGZPeHdP?=
 =?gb2312?B?Zlpkd1VmREh5Y3JYUElnTDJSRUx4a1d6YXZreWowMHFPT1ZodGlEd1daMnVp?=
 =?gb2312?B?cFBaRis4b2d1cFMzZHBQTVk3cnFFZUVLQzNhSVNYWERtUllON1BQUDIyK2kw?=
 =?gb2312?B?VXFXZEhSTjJwUHhCbkRyNTNMWGI5SlVrOFFleVFBcFJWNTVyVXVsRmZjTk1N?=
 =?gb2312?B?RnlkNG5vVTFFSGpjVnNHeTNSS1VtRWdsTVZqMWg3UDNCd2NvM2NPWlhJb1cx?=
 =?gb2312?B?eXZIdXdWbGZ3aWxkK3RlTFM3L0xzV2FJUkVTVm1RaXkrMkdpZitjekdhN01k?=
 =?gb2312?B?OGNLTzNKUVZjem4yeWNwaHpsVGJ1L1JnbFRFcUhaZW1kUjRCNjgydlRpUjlp?=
 =?gb2312?B?N0szL2lZSW9acFdMb3pXVDhSckNDdzRMVVJneDN3SCt1dnd6d1pOL05Jc0ox?=
 =?gb2312?B?azJTN09RZk5QYkZiSXZQTklVUjFTZzB1RHVFRlRDZDRvNU1iU1I4OTJIcldy?=
 =?gb2312?B?MlNnSjRrN05YaFk3cnQxUkFqRk5kaGM3VGlVVzBKYWNmVTVMc1UxcTA1RDhz?=
 =?gb2312?B?SXc5bWdXV3cwRllRUEdaTnkzYXNZOGRQR204Rkk1SkQrUVJoelJUMUx3TitU?=
 =?gb2312?B?czRBb1JXbHAwdVRnK3JPMGVYbXJqZE1wYXZLTHdEVTgwQitWaFViUGxvKzNy?=
 =?gb2312?B?dlJ6dzJ4R3ZacTRvaERVYWlNSEtFQTl1SEFRRjFHMVllNWl3MGxrRU9PTXNk?=
 =?gb2312?B?Q2lxM2tFNFFQNFd0MExheWRtaUVKQjA0UHI2d3BBZHlVa3FYRVhZbjM0eVQ1?=
 =?gb2312?B?VnV1VVRZcldpTVhVQk54L1FaL2ttUUtZZWdMaUl5WFVVeU5RdzBZNVNhaGZl?=
 =?gb2312?B?Zjh2WXBQbmtnR1BxakpTVUtQNGpQeU5kTzV1Z25pU2QxQ0xWQzBBS3RzSEZD?=
 =?gb2312?B?RVYrdEhOQTRMR2x6WGZjN0pvWFJnOTc0SGtMMmpnQ2RyM1lRbmdxb1g2b1U1?=
 =?gb2312?B?QWRiblUxTEIyeCtFL1dXS09KZHdZdW82ZGlGSUN0d0s2K21tUkRTNTNUUmpz?=
 =?gb2312?B?VlBjZDhzQS92WTBaMjREcjZOamJqWXZ6L09DVWgydkNOa09ZejBLdWh3UGtE?=
 =?gb2312?B?KzhSeXFXYmNYMXNWYzBCZU9ITGVRZ0gzSVZwVnNudGoxMHlvSlg5bmpycFgz?=
 =?gb2312?B?akxCQVJycitzTlNNMzcyQlhLb2xsSGVQY1VlUjdSeG94UWpyUHNqaEdsREgx?=
 =?gb2312?B?TXQxS3pBZUVnemFXQ1pVcGhzMXVRR1BDWHQzUVlJQThuUDI1ZXhhajBtMGZZ?=
 =?gb2312?B?aDZTVkNHVEVqUzYwb2hVRHdwQXBHNHptajVneW9ITGV3YmdFd2twY05YemNh?=
 =?gb2312?B?NGk0WFZMQ1Z5cVpuK3A2U2pJTy9YOVE5VnBITFZDaFJqWHJ4dVJyWWZlakhI?=
 =?gb2312?B?N0lVMHA0ZTExeFg4TitjaFFBcGkrQXc5dmZDeGhmd0I5d0ErTUZmMjBELzgx?=
 =?gb2312?B?bnNkUTljQ2ZHMVJ3Mmx6dXFmZ2RMUVd5K2REWkZoUHB3RWx2OFNiOWpScTBI?=
 =?gb2312?Q?8gfCaMS/jMXg+atqyrhVT3CL/?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758c85f9-7cd5-45ab-47f6-08dcbff4261a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 02:10:51.1451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqoYyH96Sso3co0Ddyy/3Z1fJdnBr2vQRZf5uRNVdSvKTMkJ01VGh1Wl5oDYh2LMy5aGoW07YmYIQzTBSBD5lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

SGkgU3RlZmFuLA0KDQpTbyBzb3JyeS4gVGhlIHBhdGNoIGZvciB0aGlzIGxpbWl0YXRpb24gYXBw
ZWFycyB0byBoYXZlIGJlZW4gbWlzc2VkIGR1cmluZyB0aGUgaW50ZWdyYXRpb24uDQpUaGUgbGlt
aXRhdGlvbiBpcyBzdGlsbCBwcmVzZW50IGluIGkuTVg5My4NCg0KVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgYnJpbmdpbmcgdGhpcyB0byBvdXIgYXR0ZW50aW9uIQ0KVGhlIHBhdGNoIHdpbGwgYmUg
aW50ZWdyYXRlZCByZWNlbnRseS4NCg0KQmVzdCBSZWdhcmRzLA0KQ2xhcmsgV2FuZw0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0
QGdteC5uZXQ+DQo+IFNlbnQ6IDIwMjTE6jjUwjE2yNUgMjE6NTINCj4gVG86IEZhYmlvIEVzdGV2
YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IENsYXJrIFdhbmcNCj4gPHhpYW9uaW5nLndhbmdAbnhw
LmNvbT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47IGlteEBsaXN0cy5s
aW51eC5kZXY7IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1
dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBMaW51eCBBUk0g
PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4NCj4gU3ViamVjdDogc3BpLWZz
bC1scHNwaTogaS5NWDkzIEVSUjA1MTYwOA0KPiANCj4gSGksDQo+IA0KPiBhY2NvcmRpbmcgdG8g
dGhlIGxhdGVzdCBpLk1YOTMgZXJyYXRhIFsxXSB0aGUgcHJlc2NhbGUgYml0cyBpbiBUQ1INCj4g
cmVnaXN0ZXIgYXJlIGxpbWl0IHRvIDAgb3IgMSAoRVJSMDUxNjA4KS4gVGhlIHdvcmthcm91bmQg
cGFyYWdyYXBoDQo+IHN0YXRlcyB0aGF0IHRoZXJlIGlzIGEgc29mdHdhcmUgd29ya2Fyb3VuZCBp
biBpbXhfNS4xNSAodmVuZG9yIHRyZWUpLg0KPiANCj4gTG9va2luZyBhdCB0aGUgbWFpbmxpbmUg
ZHJpdmVyIFsyXSBkb2Vzbid0IGxvb2sgbGlrZSB0aGlzDQo+IGxpbWl0YXRpb24vZXJyYXRhIGhh
cyBiZWVuIGFkZHJlc3NlZC4NCj4gDQo+IENhbiBzb21lb25lIHBvaW50IG1lIHRvIHRoZSB2ZW5k
b3Igd29ya2Fyb3VuZCwgYmVjYXVzZSBpIGNhbm5vdCBmaW5kIGl0DQo+IGluIHRoZSBsaW51eC1p
bXggcmVwbz8NCj4gT3IgZG8gaSBtaXNzIHNvbWV0aGluZz8NCj4gDQo+IEJlc3QgcmVnYXJkcw0K
PiANCj4gWzFdIC0NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3DQo+IC5ueHAuY29tJTJGZG9jcyUyRmVuJTJGZXJy
YXRhJTJGaS5NWDkzXzFQODdmLnBkZiZkYXRhPTA1JTdDMDIlNw0KPiBDeGlhb25pbmcud2FuZyU0
MG54cC5jb20lN0NkZmMxODljYWE1ODg0YzlkMTQ4ZDA4ZGNiZGZhOTUwZiU3QzYNCj4gODZlYTFk
M2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM4NTk0MTMxMTQyMzAxMDEzJQ0K
PiA3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJs
dU16SWlMQw0KPiBKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMCU3QyU3QyU3QyZzZGF0
YT1CdyUyQlMxYWxJSk9mDQo+IFpRaUdUMWU5RDdiUm5xeVJmVjhkczN4NE5keWJiYjNzJTNEJnJl
c2VydmVkPTANCj4gWzJdIC0NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZWxpeGlyLg0KPiBib290bGluLmNvbSUyRmxp
bnV4JTJGdjYuMTEtcmMzJTJGc291cmNlJTJGZHJpdmVycyUyRnNwaSUyRnNwaS1mc2wtbHBzDQo+
IHBpLmMlMjNMMzE4JmRhdGE9MDUlN0MwMiU3Q3hpYW9uaW5nLndhbmclNDBueHAuY29tJTdDZGZj
MTg5Y2FhDQo+IDU4ODRjOWQxNDhkMDhkY2JkZmE5NTBmJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNk
OTljNWMzMDE2MzUlN0MwDQo+ICU3QzAlN0M2Mzg1OTQxMzExNDIzMTEwNTUlN0NVbmtub3duJTdD
VFdGcGJHWnNiM2Q4ZXlKV0lqb2lNDQo+IEM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJU
aUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzAlNw0KPiBDJTdDJTdDJnNkYXRhPVNzWCUyQlhU
TGRSN211VDFFMDMwZVJMeFFvMXlqTXQ0UjBHdXVWRjdYdGh3cw0KPiAlM0QmcmVzZXJ2ZWQ9MA0K

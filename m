Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB16212B21
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550530; cv=fail; b=i3K2UdsxHTEqdiT4Qb11y41kdluQMnCKPxoXJZ2UbECv+CvE8UI5VvDB0VzVbJY4B84QyVCyBJDZ70b4TQunmuPeTfZnibqcKu6Q+/dFnoHFFdpRGRz8yi+41zbDiOBBw1A3e5OpbLfkvQ1AaObM2B30fOfi0qvA5XTeQJsQP0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550530; c=relaxed/simple;
	bh=vLsKeh9jqgdQdrmmvLIiZfPR0Uxlg6F7h8Dzd3YBbe4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nIVDo3dZk3RGGzkOIALgtwCOs+vBzuLdwZm4Gh0Oom8rvNQRYpFAz8u13cSapy4EutwQOv0NO6HFgGvXawVI0orVEk1dMo4BroYjRGG4Yuk2U201uexuck4YKH60F5SJM/uYiy9OxaQD4c7SUQ4IcUpSDedHmU7llHvMfym5Gls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bz9Dyaq9; arc=fail smtp.client-ip=40.107.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bz9Dyaq9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwj0GQa/s9WiQLP+9JyWdFnzGTVoSg/jPwdtx4UHFtyAL/6KLUkSW6v4omTQrvDfBIPNR02vEIB1F10t9tGzMPu7sXna9UnpcDBhTh6v7b49HIXSadvTFEohg/xMBrhy7n45LPpzxNtqMKShYUp1ckp4jWr/ebTxhxbJgg1C59JYkkw3nCX06DbG5pnQxD6KBzAi3hDcQlhWQKAwd4EZIK/b1gZDs5oroIniKwGXGLbNz1fGpU8viBrudbpBX9Bvl+ZMtPsMSF0IyVhUJEZRkjRncqj6gAI8ubwZ8AHCughqjDfdSF2hFBDbayPDvSFPBU/HMO94Z+bVtW1LEPOtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXBJqqR6/7AdekOJX8zfrECr98iwhPtJepwAyiFqV5s=;
 b=q+ju958vJvdzmrq49M2uGhPn15O2U4wRynb3nWs59+Qzr3aMSLLFlgogXJeJl/4q1CxKFFkc1hoKRcCWl/IF1wCZTsxg7RQuTV42dY2aYLX958hRB/J+Lqs96BtovAVbqMljySxLaxF3seIb0SXiZSGc+DUSxmK9UguLMzm1kbL+giLDMbYZIVaVpzHSHcS6HpbzlZAoanaJBX6uFrBcqpchXfPckK5hSkvQc07NGhKRwWrtIdq1Q8rFoCk0QTaWszMd1rBuK3v9YjfFoSsurQV0CMwWHa9ElrxphTRKgLY+yMO0M3uqD1S7EIi2FGuXg8MCCpjnme2oK+u9RQQpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXBJqqR6/7AdekOJX8zfrECr98iwhPtJepwAyiFqV5s=;
 b=Bz9Dyaq92hBtaBN+EVwxI28pBfsrYsZpsixHp6W+R8Ypz/yLV31vDkUrvlbigdmfuwsBiTTvFWdAspwAK/7rk3V9uA5Y4ZEpMKNi7qbDTtlQkQBrIXWgj9rSNZbHBXLNg8Y3KeYIw2p3kTH3NVk33xY7BZva4DSiWlk0Jm/BEY+WtIE6QktgslPoPnEuquNj4LeFmuADhF6uU8oKV1WwhguECe/OZP6aDeUt3dRNKoSjcnNbseRVDkdH4rbUjb47UVRbjHtvrDgoHAecYQbEwXwtgRNv4zuNzXE7cb3gOZiKYAsjHwMLczBA9tT4rCF+zxELt9HTyoXwl7x9ItNFkw==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 12:55:24 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 12:55:24 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v12 4/5] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Topic: [EXT] Re: [PATCH v12 4/5] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Index: AQHbay5xsrxnwIDIm0mBTFCSNYWD5bMfleGAgAF9hZCAAZZagIAAEYPw
Date: Wed, 22 Jan 2025 12:55:24 +0000
Message-ID:
 <AM9PR04MB86045B01999B7B2E91434D4E95E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
 <2fb2db33-9d45-442a-bfb9-55173751f20f@kernel.org>
 <AM9PR04MB860468CF15C1CC4B8EB257A695E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <63fb9cc6-b57c-45bc-8da2-7bcb871d9887@kernel.org>
In-Reply-To: <63fb9cc6-b57c-45bc-8da2-7bcb871d9887@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|PAXPR04MB9024:EE_
x-ms-office365-filtering-correlation-id: 110e6294-7965-4e39-ccd0-08dd3ae409d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFBsMHpwVWVrYlNyRzZqQm9PdVZaOFFIQWltWVg5dVpHbDI0aUVzUXJKNjRO?=
 =?utf-8?B?VEJBZ0lma0VmY2pqVjlRWTZIaDE5d1pBU3VZWkpiS3hRR09DYllkeUVoRmRU?=
 =?utf-8?B?R29QV2Ezd3A1ZHpteFkrQ0VTTmk1UkJCMjg4cm9yY0tJNmdhZ0VMcE5Yc2RG?=
 =?utf-8?B?a2lldWNPdEFpUy9wUGZrNmdRUEh3Sm1SWU1PSFpPT3Q1RXA5R2swOU82aFg4?=
 =?utf-8?B?VlpLQ1FUc1lrVGdtQ0ZZaytHWDd0V3FoT3VSbVpIendPVXI4ZmNyUVRncW1E?=
 =?utf-8?B?T2oyZFB0SmRnV3R0OFNvYUwrRkhlT0l1clNuZ2dFSWtVMkFxSHFrVW13cjdv?=
 =?utf-8?B?NzFDbFZrSlhHK1B0NWlHZFgvaGE3VmhmRStZVXhSQ0RvaTFXaHRiSkRZdUpO?=
 =?utf-8?B?a2xrRTZLUDdTVlFSSVJBZzNMenJiSFZQV1BOZnZhU3NaRlZVbmYyUTlIbVB1?=
 =?utf-8?B?QVlGWkdhSGxFd2F0M2ZTUmZwTjQvUnRJVDBkVUpCOE4zMk10QmNkeDZoK0J2?=
 =?utf-8?B?TWI2S3RCeU5RdEJ0dC9XcEtkaHRMaHE2em4ydEYxblRLWjcxaURPOTZWZ05m?=
 =?utf-8?B?Vi94akNubWk3WFlWSGl1WUkwL1ZLYzFmOEp5dDF4V3RxZ3lacGZDcVp1VW40?=
 =?utf-8?B?cXUrRkFWODhKclZMQUV5bnJrTVNna1UrNEo3dWZJVlpEa2ZoYTBvSld3ZDhH?=
 =?utf-8?B?L1J5aTRnWXNETWoyOHAydXBqcHB6Yk92VzFadDVQOElrU0FVSXpZTWVVNzZT?=
 =?utf-8?B?U09RQjNaeWk0YWVFY0NZWDdlVFQ4eDZmVUhNcVd2ajhuVWJWdE1BZko0a3Jz?=
 =?utf-8?B?RUd6UFlRbjVtWmcxOTJNejFrYVR6dGM3b3RzamZlWHR2NU56Q0NpelRPeXFi?=
 =?utf-8?B?WmRHdUJCS1c0Z29zMTMyRXhOWng3dXZuWncxVThqd0NhQnFTTWh5ejEzOC81?=
 =?utf-8?B?Tjh1VExBQjRwMzFuRXErbmgwYWo3bnVIWXBYWDVUZ2E1RkhCb2NnWXNQRmtM?=
 =?utf-8?B?YVNNK0p5d29kRks1ZjB1V3Jjc3FDZ3hhYWNCSTdrM0tOOHpGOEZHb1hINjBG?=
 =?utf-8?B?UTJRT2w2ZVBJR0lFVlpab25xTkFLdFc1R3p6citxN2ZNYTBmSE9KeUd4MzBE?=
 =?utf-8?B?NWNjOFRid3czbUdKNG9LeEJlMnBFOTA4NW5YejdRa2NaL2liZFc1RFcvM0FM?=
 =?utf-8?B?c3V5N3BvNXY4OHBaemd1S2hHRWVDTm9raHBKUWhBMUhCdkFCR0QvUVM4Q1JL?=
 =?utf-8?B?YzBFK29VaVJ6ZnI5aFlCTWNBTFZvRmVEV1MxYml2SnNBUlF3blliRTM5UWx4?=
 =?utf-8?B?cGtDTEx4Mms2SmZPWFBrYllabXJPQnNjb2FIR2RRWXBxTWNSN2tYdk51NlhU?=
 =?utf-8?B?QzVGQmswWjVVM09UYnJPYUJqR1BCT2x0WDg4R25mUkF0YTVQK2xEMEN0cGN6?=
 =?utf-8?B?WFl6WnVxWjYrcUlTOVZyUUxGTERSajRFeHowdkViczRXVzVFUnlqY3NDNnN6?=
 =?utf-8?B?WUIxM21DdlgyR29HcUFZTTMrYkpRY1hpandHckRhSzZ0aWcvRkx5b2tFM3M1?=
 =?utf-8?B?TU01NWd6LzV3WXJaZkVBbkZ5bUMxK24wSXd6MEtkUVplQVY1YmRRc015TDFv?=
 =?utf-8?B?ZGV0QjdlVUhLQXRjNERTb3ZEbndTa3BVSlgxT2NCTjVreXViemhRdHRDY1hn?=
 =?utf-8?B?QjQrTCtlSURxQWVONFdGakROdDMzUCtuNUlWYlpOb2pOSVhGK3dCL0UxL2po?=
 =?utf-8?B?ZUhKUTRINnF6c0gwVlJ6UDBqZkxKRFRUWnFKck5hd0dCNzN1OGlkSmx1T1VG?=
 =?utf-8?B?MkgrNFZjMEZRU2NNNnIrdDZqUkZFdnNmd0Jpbnk0M3BQOEtBZHJOM3labDRk?=
 =?utf-8?B?WFhQb2dwLzh6T3IrN1Q4aFFnZUNHTzFKZHVJK0FZSkRTSzRSNTBBTS9EL3J4?=
 =?utf-8?Q?d7PnXTc3JoPsd/9O8op0IFhkHfQW7hZx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmFNTjlFUC9lb25zcjZxaFA1TnQ2WEdrSzVYL0FmTzdTLzhEc3ZqSFdhYk80?=
 =?utf-8?B?c1FXTTd1bDRJcGZiSzVwTThjVFEydTR2N0tab0VkNEhheVFralNQa2h6N0NR?=
 =?utf-8?B?SGpFcE5sVVNLOFBDMnBZb1NUeFp0MXB2Zzk0d2VkWGk2UmxoTGhoZDhQZnF2?=
 =?utf-8?B?b2Y0eGxueWU4bWt4NTJXemdyVk5FZzdNTDJOeTFpNExyL0tNMDk4UW1KcENJ?=
 =?utf-8?B?WUxYbGlKMG1OTE5OVVZMN3dVcVg5b1ZHblNPSVRUNUdKWHlPS2lZbUhNVVY2?=
 =?utf-8?B?WTgrRlZuOTV2Y1FRTnJRc0o0ZzFFOGx3WUU5SlI3bHAyT1paZ0QrV2JSeHIw?=
 =?utf-8?B?d1dRUzBKZEdXTGMwaVZDbUNZRnA2Q0dwNExPK1BobTlnYlNxOUoyU2tHNWFH?=
 =?utf-8?B?SFM3NUQvSFluVWwwSmcybXdQTDdQbFNvVkpYNHRmUlZKakhldG1OVGNENlZ1?=
 =?utf-8?B?N3cxS2ZJWndIRTk2WFc0OVd0QjQ1QkJZd25YT0tRN1NOUTJXK3hLa01ycC9C?=
 =?utf-8?B?am8rY3hYTzEzVFRxRURLYTFPWXZMRnRXNVVPVGN1dkJqRnhDTHZ3WHl4Q29Z?=
 =?utf-8?B?UkYrbkltbERLMjFWaDR6TUNYdGg2NGs2bmJwWTNkYnZzMXdNSUlyRzRJcllW?=
 =?utf-8?B?a2RqVnl1WmRjM3Fyek9veml6MytOYldDTEJ1S0h4Z082YlA2bmpIbFc1L3hP?=
 =?utf-8?B?ZnNyblRhSk4wRXkxMFJJU1gvRGxBYkZvRGxYdGljeXhIaFJRWWJNbGphOGs3?=
 =?utf-8?B?dFFJZW9WMW0rYlhWQWpNZkYwOGZCRFh3TXZxeTYyNHFOYjYwaTV5OWVlTWR6?=
 =?utf-8?B?MldpK2dGY2FRR2ZEUDdBN1poWEJUZ0g5MjY2Y1ZZeG51M2d5aDR1MmlYZzdK?=
 =?utf-8?B?azlyYzdXQmpRa01zeVdkaXpoVVdsbHNKcFVpSUxVM1JQN1FTNHYrdVdzdU1h?=
 =?utf-8?B?NUN2b3gwNGthYWJxNk1vVmZMWUFjWWUrRzdZUko3UzlmTmFMVEdINko1YlRY?=
 =?utf-8?B?OEd6bVBEM1ZESUtmZy9YUkNNNWx6YkdmcFJuc2d4YXluSVl6dHkxNUl2clh3?=
 =?utf-8?B?TENXTi9Va1ViWHpYL2NBUWZRMVJHK1NkYURVRThGWTZWd3YvbW1RQmVja0xu?=
 =?utf-8?B?RXp3RnVBQ0gxcC9yRSsyOFdsZ2s5NlU4ckZtQmtna3pJMXlKUXV0WHdocXpD?=
 =?utf-8?B?NWIxODJxTGNyZjhXeVVuZE5SRk1wTUl3cythQU1NMUp2dXVZVWo0THRFRThi?=
 =?utf-8?B?dENyZEpCdEZJaEkyaGdKdG9EdkZEdGNybHNOa0g4TmJSeUhXTUtoQVdWN09T?=
 =?utf-8?B?eGFKQUpRNWR3Wkkzbld4Z3lmdUhFbUdzTWxXYlFJcW5iVnNoSENYcWc1T1pL?=
 =?utf-8?B?NmJRWHlUWnlpblZFNTNDTkxlZFJ6Qnk0STZucXdqQStHazRsb28vRVBGQThI?=
 =?utf-8?B?R1hSWUhsZC9VUUFNUFlPMFQrZzFCS25acUh6czZwRzRBQjlJUENmRWFwelNr?=
 =?utf-8?B?WFNSV25rRTlzTmxSWEJwcW0wa285bU1HM2VDRlQ0OFhvTmZJbEdZY1l2eU9H?=
 =?utf-8?B?NXZUd2ZXdXdNbnd6M0h6aHpkWXdseUJmUnQrWlNzRGR6R0RNNC9uT0FWM0Rw?=
 =?utf-8?B?YmsxOGNZV2RYUTA0S2pUbFRlQlFXRkc4NGRGV01rRGI2QnlUc1UxRm5mN29D?=
 =?utf-8?B?eUw0T2R1UHVjQkZjOG5NNzJ1aThHcVRBUGI3TkgzNDdSNTh1aFB0RVBmZHl2?=
 =?utf-8?B?c0djSnJTN08xUHR3V2s2WUtEVDdBWk1oeC9nK3BZN3o2di9WdUo3RlczQ21y?=
 =?utf-8?B?VDBTNWgzdzBvR0dFRU04ellwTHpVYW9qVVJWNkx2ZWI1QzBqcnpmOWhDNjBK?=
 =?utf-8?B?QzI2KzdybkV5U1VtRHMzZ1ZWd3lOZVpIdTEyaGRYK3pOWi9uMGFLL21aUWFW?=
 =?utf-8?B?VFRnVFcrS3o0dENsZkdTby8vQmpENTdLb25sVEE4WUkydTJ1RFhIMlZTZWpQ?=
 =?utf-8?B?czlhdHRpbFc3M1lBY1JQbm4yUGJ6RjhpYkFETUYzTyt3b3NJeUxVYi9OSlZT?=
 =?utf-8?B?V0JkRVIwY0VYOVFocE1BdWl4UnIvckFiWmdrN1UyamltUjNXeThlSDd2cTVN?=
 =?utf-8?Q?/NZqYxwIC4Dj9XRZCdcsqo6NQ?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_009D_01DB6CFA.FF9F37D0"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110e6294-7965-4e39-ccd0-08dd3ae409d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 12:55:24.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfNO7uq9f+PmTAOXUhSpJE2c+/EHl8wfsoUjFQGeycDdrwRchf9l3mgjaVipKKlNE67xofHqQrgXF6BagUJ29Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024

------=_NextPart_000_009D_01DB6CFA.FF9F37D0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

> You got comment on this, more than once.

> Rest of the email is poorly formatted, so I am just skimming through it.
> Fix your email program to send readable content if you want some answers for 
> stuff I missed. I expect all my comments fully addressed, not just some of 
> them.

There is a bug in the outlook.
I will remove these lines in my replies.

>>>> + +static int se_if_probe(struct platform_device *pdev) { +
>>>> const struct se_if_node_info_list *info_list; +     const struct
>>>> se_if_node_info *info; +     struct device *dev = &pdev->>dev;
>>>> +     struct se_fw_load_info *load_fw; +     struct se_if_priv
>>>> *priv; +     u32 idx; +     int ret; +q +     idx =
>>>> GET_IDX_FROM_DEV_NODE_NAME(dev->>of_node);
>
>> NAK. Node can be called firmware and your entire driver collapes.
> The macro is updated to verify the correct-ness of node-name.

> NAK, do you understand the term? I provided the reasons for NAK.
Your suggestion is to enable the driver for all allowed node names.
1. firmware
2. secure
3. secure-enclave

Understood, will allow these names for the driver.

>
> +               (!memcmp(dev_of_node->full_name, NODE_NAME,
> strlen(NODE_NAME)) ?\ ((strlen(dev_of_node->full_name) >
> strlen(NODE_NAME)) ?\ GET_ASCII_TO_U8((strlen(dev_of_node-
> >full_name) - strlen(NODE_NAME)),\ dev_of_node-
> >full_name[strlen(NODE_NAME) + 1], \ -
> dev_of_node->full_name[strlen(NODE_NAME) + 2]) : 0)
> +                               dev_of_node-
> >full_name[strlen(NODE_NAME) + 2]) : 0) : -EINVAL)
>
>>>> +     info_list = device_get_match_data(dev); +     if (idx >>=
>>>> info_list->>num_mu) { +             dev_err(dev,
>>>> +                     "Incorrect node name :%s\n",
>>>> +                     dev->>of_node->>full_name);
>>
>>> Nope. "firmware" or "secure" are correct node names.
>> New check is added to validate the correctness of the node name for
>> this driver. Replaced the message of " Incorrect node name..", with
>> the help message.

> You did not resolve the NAK.
> 1. You cannot reject correct names.
Ok, Understood.
>2. You cannot add undocumented ABI. You could try to document it, but it will 
>not solve the first problem.
Ok. Will not add the ABI document.

Best regards,
Krzysztof

------=_NextPart_000_009D_01DB6CFA.FF9F37D0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMjEyNTUyMlowIwYJKoZIhvcNAQkEMRYEFIT4e0J9Hm35ON0g34HR
thP5nOYtMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQCnThnO8sKrNrtkWnLp58bmdMgsvih1LNdOStmE8FJZANO9kXK9AiI73kVNYTYs5jy5QYXVoSh2
3xEkMizk6BVXo+w7lCwd+8XukYajMGYz9Gs1cAOGcrICCe1xX97YQbCw6xhRCjRVJMhq6ENHvNMO
SG2ySJrGAgpcls2wL4639Q9aIwgMgA0EbGxm4nGKqpZmV/kVX/RlRtTNt3pl2MFox10402MbtwLZ
tMCNOwcrSmRQ5KAFOf0nQuH7Nx527zpDJDSQHATUVIQ+8DJDKYuKG7DfsiCPg2MSk7IjLvkBozTh
LtYXl6DOukEBc0a3RWprzjTr6pQD8DZNbJHqHifzAAAAAAAA

------=_NextPart_000_009D_01DB6CFA.FF9F37D0--

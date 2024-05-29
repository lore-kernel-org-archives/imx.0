Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0415B111
	for <imx@lists.linux.dev>; Wed, 29 May 2024 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716953039; cv=fail; b=obbFtX84CoYwtK0WZtxQji3sKz6YuKzLkrk7fp1z+2jDuSL3UYiUJCqAykemlAcGa8n9m14UHUw8qYfn0Ee5xC2kCf3uoPkzhse7vuXa1l5dY/TNTivs36y9b1GCvcKoI1qO7YqjVD97Rh6mjHXTlkZ0ZaciX5uJnFlJS3l9dbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716953039; c=relaxed/simple;
	bh=ts54Y6asPlFPBgXHV4cKok/w5D5Zjs1mPhurSb1zfK4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iFi6fVBoS5b6z9zyALt6WWw7xpDCu+DjB2Qww65zNEMY3pAKal+Nt5rQvShjHn8+DrB8FhaZCGDtev1cHRot2AnyFibWkpTLjECQA+atmOQL9c4cgMEhHzs01ATOA69+Yxphg/san5dSC6Y/k4kLJ4x/UoFCvtMZg9gTL/3yTDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=eiLb2cYY; arc=fail smtp.client-ip=40.107.105.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eiLb2cYY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asbAJB1myWlQdbLzfBf2xLKQF4CBxZ47Ogt6tVExUKb9WZos5GwXm1u1VI0+G0u0ukJ+MCMT0bhs0EPLChrj0MHXOeT0BYjOsuqxI96SPw7JMg4ZpQEVzfl7nyY9xS1Oilt2Q1bvI+1rrWnbY5eBh5eAWma+Zkh+Cs8jy9t2J7IiKbxxxO0P6BxYYNWSarcn17oujfekfjiW6Fu5pVKXVHhqSJ/YADM2NSciUpU2yhkCjxT2DNW6bGHWtr0mpsnuKCWCW/eUd3c2NRKBhTWRzvo6XFhHEe1ZPQvyh5AXiKNySR95RPAIEEhfeHH8hSaZt7raysKtGRuFjLzHYO1Xvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts54Y6asPlFPBgXHV4cKok/w5D5Zjs1mPhurSb1zfK4=;
 b=hN3S9w1FlMXCaQu/nvRgJqtLg98tiOWceYX3Vzdgu+qgkg4z04xb+RYK8kVlJUutKam1MgHnlMDK4IJJm6OvBB384vT7h7sT1sNqW6uFR1vTbeBRgaucio5s59LXy3C7BgV2tf1w4C326V4imnuorlA+R10zSscdFG7g/oSWhdVch5GP3y9Hcd04Icp4AtxcCzpiMIoeC25gURZScnR/ljXKz0lcpuLWADt7fh2EY4Y47PxConDFy9Qzv7UQBTE5/RImQaWypsl8feswattn/Pcnw5pLQG/juhGQHfqfSt9zfSvag5oUTlJhU7iAQdmh7MJw2VVFUb8By01HEyPD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts54Y6asPlFPBgXHV4cKok/w5D5Zjs1mPhurSb1zfK4=;
 b=eiLb2cYYGeirPA1fChBmigbu8XoU87tP0NbhJXvlKrO+G9BQyYGKi128rGu/Uh6B37LbZX+YaS9T4lsGDGhUkl7jDRubMlI3OwaN4FW94B8d49RNnYSkO7fXZ05wOiTltmOXZ4tFAP1wxahlHmal6clJEqKh0JDx6QYpJ2u9wgo=
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS5PR04MB9999.eurprd04.prod.outlook.com (2603:10a6:20b:67f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 03:23:54 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 03:23:54 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: RE: imx93-11x11-evk: SD card is not detected on 6.6
Thread-Topic: imx93-11x11-evk: SD card is not detected on 6.6
Thread-Index: AQHasWbRjLM4mkhcH02QWFHZxMrbU7GtitMQ
Date: Wed, 29 May 2024 03:23:54 +0000
Message-ID:
 <DU0PR04MB949617775A095B8DE513D97690F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
References:
 <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
In-Reply-To:
 <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS5PR04MB9999:EE_
x-ms-office365-filtering-correlation-id: 1ed9f842-c9aa-47c7-a1fe-08dc7f8ec4f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUtVUWNmZ2NKbURnOUo3ejRFRlRaTGxRUWhJK2pnNDNhZGg5bUtmck9QY1RM?=
 =?utf-8?B?OFZ6SzRld3E0QS9wbkxNS1J1YTdQREhMYUJFcVkxWWo0M0FnYW1NY2hMYlM5?=
 =?utf-8?B?VC9EQ1dBK2QzUVRoUlBxOXhjaWdjNEFMWFNlOHV1d1Y3YWdrRys2ZFp0WFVw?=
 =?utf-8?B?REkrUHhMa1ZuV2dUeFNTWWxJOSt4dnV1dGtQc0tkL3dKYnFERCtKSUtwQ1c0?=
 =?utf-8?B?ZTMya2JSV1ovc21zaFRmWW9Jb2tUUFN3bUE0d0tOdzhqR1RYTXdlbmxpU2hH?=
 =?utf-8?B?T0NBazlUZnNyMVFtQzZmWXJvMGVlZnFyV2ZtSEc0VFZ4NmJhSzNIM2p6dE5x?=
 =?utf-8?B?dDdaSE4za3I5eGdmazFZVlgvZ3V5MVVuVDQxRG15SGNhb0VENlVKMU9hYzc4?=
 =?utf-8?B?TSt5cEdTTi9aZkt2N2RzQjN3SVJPaFJHVWw4RklySDVvZnp1SlZnN0hjMzR2?=
 =?utf-8?B?V0Nkc1YyTStUZ2RvNkN1eHV0WlJFTTdyMGJHL0hTUlArazdrQ3NPNmpYLzZL?=
 =?utf-8?B?L0tvcHZ6N2JZdzQ2ejA5NGZ5YnJCd0NKRUFOSVR5Q0cxNXh2N2dWUU5nRjFx?=
 =?utf-8?B?cnh0aWtCL3ozbjN0SHg1amhndXgzMmFNc1U2RlNIbHBPck51TWVhdW5ld21L?=
 =?utf-8?B?eFc2RUlNSTNxSmhRSmdjVW8yNHhpejMvL3JjbTNjSytTQm1DenVuTndkLzNs?=
 =?utf-8?B?WllJUUVINzVBcThEdVZlYkEweDRYN2IyQnNsOUg5VTV2SytyV2lLd0xOOHoy?=
 =?utf-8?B?QmoxdzloeVhnSy92QVNoTWk0SlhZQ1dSem5XZ2E3TGFoanpjMzVVYnFvZkQ2?=
 =?utf-8?B?cW54QUlMci96SVJieDRJaEtMVFJZVWx0MERnRHZuaDBCSEFML0tMbGNTUkxD?=
 =?utf-8?B?VlIzSWlwVWFscFRIcU8zeS9HMTRvSnNlM3lQYWJ5L2JwU3Y5YW1lc2FDSndh?=
 =?utf-8?B?THlrODYwYTF0QWJYL2JaYURrM2xwNUlaTUQ1YU1SY0J3UzE3K2pDOURyU1hB?=
 =?utf-8?B?QVFDZU9HZU8wcUNpOThObE5kL0FzeGxpRUV4UG9ZZWxrOURTQ1o2b1R2b1A3?=
 =?utf-8?B?UjI2eU9IVnB2eDEwL3JNVURXK3l5TDNsVi9zeU8yeENqM01VYlpZcUM2OU1Y?=
 =?utf-8?B?UFhmV3pMQlpZdHpqdy90T0ZVRU9sUmtkbmlFV0V2b1RsUW45V3NwY0VMbnlS?=
 =?utf-8?B?d2RMMFh2Wnc2U1ZscFVJMEpzOW12eEU2dEVuZjNPS3k0QW1BSTQwNEJyYWx6?=
 =?utf-8?B?dXBJTDhKcG0xZ3BaVkRjNUIyWVpTU0hxaFAyY2Y1cUF1Szd1N2FYa2pNMHE5?=
 =?utf-8?B?N3hzekppTVd5V01xalVUdkh1Nkx0UUJ4N092UGlUalY4V1R5N2gvRWhjWDJR?=
 =?utf-8?B?NHY1NmlsT255ckRUTXVvRGhTWTRaMTRJTjhFd3U1cGU0WUN6Tm9saXFYaXFT?=
 =?utf-8?B?WHltNUVsSUgyZTA2dFV5a2twNWM0VmQ0MjZqUTJTSURmN2N3eTRySG56KzVS?=
 =?utf-8?B?UG5RUGlQQ0MwMzlOdlpiT1g3bXBIRHlORWZobytjejNteGFxWEFIK0NXTStn?=
 =?utf-8?B?Uy8yUkdaRUFUWHhnaTJpUEZFbVFScDlnOGNUWTRMZjJTOWo0Y0phSmk2V1pB?=
 =?utf-8?B?b3BSck1wWm5wSFJWTDRSWmhXM2kwRnpURWVPZmcwZU0ySTMvdVkvVUV6ZXpU?=
 =?utf-8?B?MVhVWThwdzRkL2NRaGdpUUxpKy9FV0I1Zjg0SzJIUUxzTDFtQncwZ1prem5E?=
 =?utf-8?B?NnQ3QjBDUjU1TUlnZVN1TU9aNE5jZXZnMTR5QXpCbmpHZmozbC9RNDg1Mmcr?=
 =?utf-8?B?Y2t5UGM1Rk5kb251Mngrdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVV0Q0I0Wi9hRkM4MHkxazcyVGdKSzM2cVVRTFdneFozbkNJcDd1ZVBTRVZK?=
 =?utf-8?B?Vi9aOHhPTTZpMnIyQzhCakpHbkFmNEt5RmVyNm0wdWtPVHQ3YU1mbGJ6dnVu?=
 =?utf-8?B?b1FIdjU4RkkxQWsyb2xsNHJQSENvRVgzNTlnamF5dmJXL2VsT3dRTEJQcCtC?=
 =?utf-8?B?U2NiQUhVL3A2d3VvYTZrNU1KMjBBSDlWL1pmbHNXRmdWOXI0TmdwMVBkUzda?=
 =?utf-8?B?WUQ1b2liUG93eFlQNFI1ZEZBVUFjd0d1MUVnZ25NQmJFcHM4dmI2ZWNtcENz?=
 =?utf-8?B?TC9mM3pzcHZnSVl6akU5Y3BLY3VIQzFQdVVSRVVlVzdETjZoYnVOYlR5RS9Y?=
 =?utf-8?B?OUptZTNIdE9aODVMVG0vSzBxME9HejQvanBIZFZpMitZVDRTbGU2aEg4TUpD?=
 =?utf-8?B?NXJ6Zkc5UFJHQnVBMCtIZ0ZsRkliOFVxbU9BZlYwN1NvNG1ITUM4WUZ3VEZD?=
 =?utf-8?B?UExBYVNINmtKV2hLUGpHSzJISGR6bDdBWHJsYTRkc0EwNXZISEJOV2FSUlBD?=
 =?utf-8?B?N29nVDcwdFVlR0tWazNCYXUxT1pFVVVlamVIL0pJUWs0UXhmK0JTcXhyU3B1?=
 =?utf-8?B?Z21ubmpVOU9iNlNYRXZIeG51aFV6RUU4Ly9Bdy9CeVhGUHBaeVhFZjhkbldN?=
 =?utf-8?B?T1BDZnA0M0RPOE1nZjZBMG9tYm92bHRSSFMyeUpjSFNZNW9ueFdOUXFpZVVD?=
 =?utf-8?B?TnlCWXY1RHUrc3J6bkJ6Y0F6ZmZqZUhvcmZkcHNuWDM0SXJqRUVkWVUxL3Zz?=
 =?utf-8?B?VU9RWmQvSFlHaXRVd0QrVTFTZ29GZktlWDU4dnkzZmdpREZQSWdhT0t0MUNk?=
 =?utf-8?B?K2lxL01RalgwOTBPcWNZZGIzSTNkQzd3RlNPcDVZWFRZUyt2alBRanBIT0RQ?=
 =?utf-8?B?R1lXakdFUGMwYjlpNVNPV1ZIU3I1cVlpenNoOTRoaVlqbi9MSU8vTTV4dFJp?=
 =?utf-8?B?TE0xZytGRCt5dmNFam1WUzQrN2lKcDdnbEtwOXdoL1JodnlZZW82S25Md1FT?=
 =?utf-8?B?cDQra0RCRXlZb1dDR3B4NkF0M25ZU20rT2xaN0RPTllPeFF0TldqeEhZdTFE?=
 =?utf-8?B?bWVFQ3VUdGxXUmtKdEhPUkg2MENrSk1acnNkTU92SHpBVjdNVVhHR256WGJt?=
 =?utf-8?B?Sk56Z1ZpNlJVRVV1YXFzaTlmbWdCWWNLc05sS1FOMkJaRUc2elhMSlY2SFVy?=
 =?utf-8?B?WkF2QzFxajY3YnJ6eWltMjBNQUZSeUJETmVSMEUxQnROU0EyRFlmWW1uWm5M?=
 =?utf-8?B?NFc5WmM5TzRRZitTditsVmRZZHAvd09XRERGYVdCRU84d3V5aU9jMTNjVlU4?=
 =?utf-8?B?UlFEZ2ZORDFKL0ZUVnNuem5BWUhyclJtTFVJbUxrQXV6YUJqNnFLR3doWDBK?=
 =?utf-8?B?b0Y3dGNJRXNJWWQrUk9YVitqRktEZjJvTzNRWGY0KzdaZDNoeTJnZE1lN0RT?=
 =?utf-8?B?b0hjV2hIanBPV3NyUUJ5U25BYXQ4WkhmYitJN1JYYlVVcFh2emMyekJvNUpB?=
 =?utf-8?B?S0szdGttL25iOExGS1JZZWhMSytsa2ZnY3BRRHhyUGRFQnU0OGFqb3FIWFFm?=
 =?utf-8?B?SGxWN01xOXVwNzBjTmo1dkhLTFAra2l5TDFWWE9oMUx6aklJWlMxdGRLT2My?=
 =?utf-8?B?NExnQmRlVTBTWGpOY3JTVzQ4bXp2S2YxZjNWZFg4QzJzbXJPaG1MbE55QWQ3?=
 =?utf-8?B?Nm44d1I1ZFpibi8xNzBkYUFweFFPNytOTzNHdWhjcVpvd0syblorVTk1YVNp?=
 =?utf-8?B?NVlBSW9rdm9MQ0xQRENVQTl2YkNsZnhrOHFNVjA3d0djVEIxaHFvQUFFRnVZ?=
 =?utf-8?B?akhmc2JDaG9NUGI3TUhJTHFHK1hjNmxpcTYyOHBFMStzcXJoVlE2c3BnYU9o?=
 =?utf-8?B?MWZoWEJ0ODJJU1o5aTU4ZERtRzhSdmRROTF5VVJQV0JLeXJCQ1FNZlhlWmI1?=
 =?utf-8?B?QzF6VHJaS0txV3dMWjA2bzB3OFo2YlRsNEQxSkpCd0h2T2pPMllTOWtpa1lN?=
 =?utf-8?B?emJLODI3MVRaNXlHQldKVERIc2NtSnFmdFJPaDZyQTRNZ1NIOHVYcmYwZW16?=
 =?utf-8?B?MjB5dnlhTmtnUXlvanlTMWxnc2JWYVVwK3gyL3Z0UERreXRqbmlZQ0Eya2Ja?=
 =?utf-8?Q?WYHg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed9f842-c9aa-47c7-a1fe-08dc7f8ec4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 03:23:54.5811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzTzDzTLWfcGEtuA+NQ6eJWy1IPvRjRFD7Cd3ZxAop2OlljkHMLf+3Dyg87qwOH1iL2GSFZdUWrdFXSUBt0l6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9999

SGkgRmFiaW8sDQoNCkkgdHJpZWQga2VybmVsIDYuNiwgd2l0aCB0aGUgZm9sbG93aW5nIHRvcCBj
b21taXQsIHNkIGNhcmQgY2FuIHdvcmsgd2VsbA0KDQpjb21taXQgZmZjMjUzMjYzYTEzNzVhNjVm
YTZjOWY2MmE4OTNlOTc2N2ZiZWJmYSAoSEVBRCAtPiBtYXN0ZXIsIHRhZzogdjYuNiwgb3JpZ2lu
L21hc3Rlciwgb3JpZ2luL0hFQUQpDQpBdXRob3I6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0Bs
aW51eC1mb3VuZGF0aW9uLm9yZz4NCkRhdGU6ICAgU3VuIE9jdCAyOSAxNjozMTowOCAyMDIzIC0x
MDAwDQoNCiAgICBMaW51eCA2LjYNCg0Kcm9vdEBpbXg5M2V2azp+IyBlY2hvIDggPiAvcHJvYy9z
eXMva2VybmVsL3ByaW50aw0Kcm9vdEBpbXg5M2V2azp+IyBbICAzNTYuMjQ0Mzg5XSBtbWMxOiBo
b3N0IGRvZXMgbm90IHN1cHBvcnQgcmVhZGluZyByZWFkLW9ubHkgc3dpdGNoLCBhc3N1bWluZyB3
cml0ZS1lbmFibGUNClsgIDM1Ni4yNTYyNjJdIG1tYzE6IG5ldyB1bHRyYSBoaWdoIHNwZWVkIERE
UjUwIFNESEMgY2FyZCBhdCBhZGRyZXNzIGFhYWENClsgIDM1Ni4yNjM0OTldIG1tY2JsazE6IG1t
YzE6YWFhYSBTTDE2RyAxNC44IEdpQg0KWyAgMzU2LjI3OTY3MF0gIG1tY2JsazE6IHAxIHAyDQpb
ICAzNjIuNjA0MzQxXSBFWFQ0LWZzIChtbWNibGsxcDIpOiBtb3VudGVkIGZpbGVzeXN0ZW0gMTUw
ODkxMDQtNTZlNi00NDQ2LWFkYTMtNTUzNWJkYTU0YjQ3IHIvdyB3aXRoIG9yZGVyZWQgZGF0YSBt
b2RlLiBRdW90YSBtb2RlOiBub25lLg0KDQpyb290QGlteDkzZXZrOn4jIGxzIC9kZXYgfCBncmVw
IG1tYw0KbW1jYmxrMA0KbW1jYmxrMGJvb3QwDQptbWNibGswYm9vdDENCm1tY2JsazBwMQ0KbW1j
YmxrMHAyDQptbWNibGswcnBtYg0KbW1jYmxrMQ0KbW1jYmxrMXAxDQptbWNibGsxcDINCnJvb3RA
aW14OTNldms6fiMgdW5hbWUgLWENCkxpbnV4IGlteDkzZXZrIDYuNi4wICMxIFNNUCBQUkVFTVBU
IFdlZCBNYXkgMjkgMTA6NTk6MzQgQ1NUIDIwMjQgYWFyY2g2NCBHTlUvTGludXgNCg0KQmVzdCBS
ZWdhcmRzDQpCb3VnaCBDaGVuDQoNCk1vYmlsZTogKzg2IDE4NTUwNTI0MzQ4DQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21h
aWwuY29tPg0KPiBTZW50OiAyMDI05bm0NeaciDI55pelIDk6MjMNCj4gVG86IEJvdWdoIENoZW4g
PGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gQ2M6IG9wZW4gbGlzdDpBUk0vRlJFRVNDQUxFIElNWCAv
IE1YQyBBUk0gQVJDSElURUNUVVJFDQo+IDxpbXhAbGlzdHMubGludXguZGV2PjsgbW9kZXJhdGVk
IGxpc3Q6QVJNL0ZSRUVTQ0FMRSBJTVggLyBNWEMgQVJNDQo+IEFSQ0hJVEVDVFVSRSA8bGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPg0KPiBTdWJqZWN0OiBpbXg5My0xMXgxMS1l
dms6IFNEIGNhcmQgaXMgbm90IGRldGVjdGVkIG9uIDYuNg0KPiANCj4gSGkgSGFpYm8sDQo+IA0K
PiBPbiBhbiBpbXg5My0xMXgxMS1ldmsgYm9hcmQsIHRoZSBTRCBjYXJkIHdvcmtzIHdlbGwgd2l0
aCBrZXJuZWwgNi45LjIuDQo+IA0KPiBXaXRoIGtlcm5lbCA2LjYgdGhlIFNEIGNhcmQgaXMgbm90
IGRldGVjdGVkIGF0IGFsbC4NCj4gDQo+IFdoaWNoIGNvbW1pdHMgc2hvdWxkIGJlIGJhY2twb3J0
ZWQgdG8gNi42IHRvIGdldCB0aGUgU0QgY2FyZCB3b3JraW5nPw0KPiANCj4gVGhhbmtzLA0KPiAN
Cj4gRmFiaW8gRXN0ZXZhbQ0K

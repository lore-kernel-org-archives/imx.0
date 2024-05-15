Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83853AC
	for <imx@lists.linux.dev>; Wed, 15 May 2024 01:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715735170; cv=fail; b=mlSr8jTbpbUs6G6Jl5+Ljx9zIqs+jMi3JpgWeyH9sVKMcjDH7Bhreg8D0DNjDLcz2VodfAoKZ9vFOwAG6R1fEUC7MEoUBC2HBQznmgBV70sXOe3OquIibGwlSiVQoMklBWWBEjrobJvUJbmVtedV9nWDwN01ZB9rD7rsfEcWPVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715735170; c=relaxed/simple;
	bh=iK87bTxdhvT3QklA03ceUxUd3+Q6dtRHX9UPtYyDJoE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mUAZjKiiEdbTHnvGKqTB0B36/F7fr6TrfFKVeuvdsKwBwhNzdRZa8xXTArcq+tjsgKPExp1zyn0UVXa+qmhcgjjIdkRCFojjr02r+W4a5lbYsDdotUsMxTp1NuP8+sizOTefJy4tsCPsdmt90UT3QuVHKDBf2VMkYHMBKaJSQFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=MeVpjoLG; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="MeVpjoLG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToKCDpoc45TLfuD8lFNKKYAGN3UpIeHkNQzXp10CcE/HYmZRYNwYq7TcHPZBBWHb2050rzw4rI6xIpjqTP/Lvx8g0c/3iRQpLi2Y4aimhVasEcZ84w5S1walPxYqgvt4zdR0jUBU2tuA6cm8HSgj1rZTYmwd7l702UZsripsaDfAfQ8LNJ4kIbUqHzmug8A6PuikD4gM5nUJydoXJV8vxR5OJYESj63nHnmvKNXAIk4Ce6VQci8tnf7gqJqiwo/7AuZSnW0HEuWHhIlughT0YYA0m9I5qW7feNX6GOB9yMCH5ouxgG7DynbIfHtQKZwqcj22l6Lr5I61K0jz49V+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK87bTxdhvT3QklA03ceUxUd3+Q6dtRHX9UPtYyDJoE=;
 b=dtaLXpd30SOLGXzcjx9JB69nu5B7jJUv2TEsqMreKrxCdPSSQ3suQm8I70iVENieaCfN9fDiug5Hb1RHEqc4qBpRjZrVVps0F4RKWsOgOwKfH1xghT3rC0pafuX5vUiDjh4x0jNnfwmmBLKomE0yWyx9texwujV+fWCJpQTIfzobxoVkpGw9gl09XpGPt+p+yaoPR4ctAOBKFV58IcMffpOj8Kn9hPtZf9GQHiYXaoqAliYnZeeLZsDED6v+sSCVAUjMrvXux8YzXJRwXkepml+0wiiGrFaSaY/GxBpmw8wEP0H1/983kOP2fXZ6HOfd4xWaBcSnwz9QOVW131AqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK87bTxdhvT3QklA03ceUxUd3+Q6dtRHX9UPtYyDJoE=;
 b=MeVpjoLGQ7Q3+cQQd4aTQ4xhiF772B3QunsWbNMBZlk5CjG1Y6NhRtlkIVujCRZfSJajjEuKjpGumddTCiYwVzZjmcMVQyPrk0ahYq+zdLGvG9FfxdXNOjRHLJwn7TuVvk9UoV+HW2Tb8U5z/uCFjnAmieHEtaqaIJ5QIBmmWSo=
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 01:06:04 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%7]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 01:06:04 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: Frank Li <frank.li@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] PCI: dwc: Fix suspend hang when e1000e network card is
 connected
Thread-Topic: [PATCH v2] PCI: dwc: Fix suspend hang when e1000e network card
 is connected
Thread-Index: AQHapcYz1MNe4t+sM0SQLvwd46LuKrGWkQcAgADrcKA=
Date: Wed, 15 May 2024 01:06:04 +0000
Message-ID:
 <AS8PR04MB8676006023CCA1541261D8E88CEC2@AS8PR04MB8676.eurprd04.prod.outlook.com>
References: <1715666198-9140-1-git-send-email-hongxing.zhu@nxp.com>
 <CAOMZO5Az++MyYyi6zJbut+iQheSZygZA2YqNGqAjxgjO+_QYeg@mail.gmail.com>
In-Reply-To:
 <CAOMZO5Az++MyYyi6zJbut+iQheSZygZA2YqNGqAjxgjO+_QYeg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8676:EE_|DBAPR04MB7269:EE_
x-ms-office365-filtering-correlation-id: c8562b92-b93a-45ac-a2be-08dc747b319a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?ak5pajY4aUxTNm9IUE1OVmxiVjBSR3lsa1JLSElXT3k5SldIUTFHOSs0TEJk?=
 =?utf-8?B?Y25aeDRnWWlZUVFSOHl2bER5d3c3RW4vNnNKLzBZZGdNdGtvZGdaak1jM0VM?=
 =?utf-8?B?VXJJUkhnaU1CRFBVWTJPMFAxbVgvSUZTSmtEZDZqdDQvc3I1aXFVYjFsQzJ5?=
 =?utf-8?B?Z3gwdU9ZTmxxeW81VWxXd1hjV3JZQ3pHQmtSOGk2d1VhSlNTQjJpM3pEVTJh?=
 =?utf-8?B?T3gxeG9COEM0dVRPV1hlWkRmMGNVTTFnOE1KSXVlWVRyTnVUOXdHb0wxMlIv?=
 =?utf-8?B?QWNCamFOb0t0OTV3dmVySVZhRU4xUHRSNzc0bkl1UHgzdVlZclUxa3VPNm5F?=
 =?utf-8?B?eE1xZE82aXBsa3dmQUNDZjlueG0wZVVPQWs2c1JyNGMwYkRNb0M0eHo5K1Ax?=
 =?utf-8?B?MTFyTDIyRGkvZStHVTJtbHM1eVBQR2VodEdldktyWDNLWERDNXpJSXdaN1B4?=
 =?utf-8?B?aVMrMk5vUk56SmxwY3FYWkJOaXU0MUVpN3FzbW9YbnF3K1VDd2YxV3NzcE54?=
 =?utf-8?B?T1RNMzJGNnRMa0dBN2JqbmZiZnlneU5rUEVHb0k4Y2I3SkU5OVVSaDlqanoz?=
 =?utf-8?B?VlJvUFRubitHQUtOdDRKT0lLWUFoYWJVc012RVVjNUR2WmFsQjFXK2wwZHE2?=
 =?utf-8?B?MmlKeEI5d3Y2NE1wNDFCcjJJY2ZoR3NuQW9hSG8xOWFjVGozMGJEb1BNUFJl?=
 =?utf-8?B?M0lXR25YNFVmYWEwWDZqSktpNTQ3R3BYTkZnc0ZsVk9BMDQweFRyMWlzUEo5?=
 =?utf-8?B?cngyVEtkY21mSmJBdDUvNGdzN2ZBa25FNzVEVC9QTklqU3JJRFdoc2dGMG16?=
 =?utf-8?B?d2Z6SXpFajhja2J6enBFRTNoRzBmS1d3Q3lDWmJNcWIxSnBnakhacnBnUDlh?=
 =?utf-8?B?ci9hT1cxdEJaSHdGMDlsZ202czN3Wm1XbEZrZzAwTU5pUGtVUnBITk1kWCtT?=
 =?utf-8?B?SGQ1UFBrb1NWaFNMa1ZyNnZDaTg2SVhVUkxCU3BucTNFTWhseTFMNjBrd1N0?=
 =?utf-8?B?MENLR0R4TU5neHJHNEhjbnV1UkhtM3JkZUtXbkgweTgxdk5rampOclBTdTlQ?=
 =?utf-8?B?VkdKaTZyVml4WW1DNkhlLzdKZXhJdWtIZlFOUjdoc3JpZ3N2czY4MFh5cjRW?=
 =?utf-8?B?U2ljM1V5cjkxajNqQnQwNGcwd0I1QlhSckhHMU56SUU3VjYxRlpIKzFGWk5D?=
 =?utf-8?B?MW1ZbW5YdGk3cXpyeDlmUVZQYmNhRGZwbnRwVGJ1OFVMaE5zQVVnbHJtV21r?=
 =?utf-8?B?SDZTK0xzTTYyaVNwUEtabHJUeGZvSkxLSTlYS1BFUFNMd25XZE5xZDBuNlEv?=
 =?utf-8?B?Vk9UejYrVXJhUVF4aW8zT1BzampFTTJ6QzlRZGxMZ3dTS3NUUk1xVTFvZmh4?=
 =?utf-8?B?OFVieGVaM2xEaEZMK09NZk1VSmgzM3RtNEtUdFE1b0YyZFQyWnEwRi9YVjVw?=
 =?utf-8?B?TlVpcE5CTmc4c3E1RE1MZXZJZlpMNVpJcXVSQWVWNWd1TnJ5SVJBenVmQnlH?=
 =?utf-8?B?U1ZSaThCVjc1c2l4UmxJczVHY2F0aVFHUWZFYldCcWxIYzViQ0czWTQyenJj?=
 =?utf-8?B?NWtZWDJTNWs2eElBNGhtUTFWbFgwTnY4MU0zcmR5UFNBeS9FamI3Z1FnWlRK?=
 =?utf-8?B?cVZjeWVJcjF5SnYwUHRCaEdhSmUveEd5VHFIOHBBTitrcDVreVB3cWNmYlU2?=
 =?utf-8?B?ZDhsY0t1Y0N1WDBuSGRsTFY3YVZ6QnlUOUx5M3VPUHd1c0NzOEJ6WmlzUXda?=
 =?utf-8?Q?H0dEPiL0SRs9LDcrkve4uf5zqKuVDrTE+IgyEG/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmR1RzR1ZWVyMFBBci9YS3VzR0NmQWZtT3dCZTNYRlUrZFg1bzYvUnlVRkZZ?=
 =?utf-8?B?L28rYUpJTjFuQzJ6UWRQUUI0QWRqVXFFRkVhSEVJK1JVMmZJVENncWwzSlZR?=
 =?utf-8?B?QjZIbjZjQThrM3ZFNjA2bUVjNFhLQ3FtMG5sRVBtSUVsWFRtSENBZCsxbU9U?=
 =?utf-8?B?WldRNURDZ0s3T1lscytDU2JzaGIwaGtzMXZpVThkV1Y0MzRFeUIwcjhqamdF?=
 =?utf-8?B?ajJuQ081ZGVPbVFPZGQvbVgyL0tYZmM2MzhzREYyMU5CNEd0OVhtMUFiMEs0?=
 =?utf-8?B?dlJGWTVxeEFhVTVBR1cwbjNEWktKR2dUYWFlSFBXYkJESHcwZlJlWUpoNVFs?=
 =?utf-8?B?NWlHRFY1VEV4cFhSbng0ZjV6ZlFXSEVaR2RvZXV5MzBDbVVDWnhZTzAzQ0RT?=
 =?utf-8?B?SXBSeFJLdmQwL052RlBuYVhSQTRjWVJYcHdLQTYrRkwxUGVSVWNZWjdGR1VF?=
 =?utf-8?B?MXNCM1RPNjc3bjVqRnJhOS9wOE1yOEozdFhLT0pLRzR3UEgwRkxHK214MHcv?=
 =?utf-8?B?N29VakdQY1V2Y1J6T3dRcmJqdnhTSVBEaDFSOGpqZ1poWkszc3ZEeHN0cDIx?=
 =?utf-8?B?Sk90cEloOWpvUStRYmsxYi84ZFlhMGpiWnV3cWRVNnZIQVB2NWdBTkVXazJH?=
 =?utf-8?B?N2NyTHdtVlBEOGtBeXd2VU5iek5QNWxxZFJpclJrVW5pcVJUb0IxT0xBeGxR?=
 =?utf-8?B?aXJZeDN6YmlwODgwU3IwdUtydG91ZDlzWVZrZE91VmZkeEY0ZzR6dHA4eGZM?=
 =?utf-8?B?SmoveXVIbFpMTGF6MHVUbXNHMEpydTJqdVNNdHdpdXpaMDdSaHhLN0wweHRt?=
 =?utf-8?B?TkNXL3JHWmNqR2I1QzYwOTRFb2JxUWh3UXhyQ291UGlHUkt2SXd1RElpTnlI?=
 =?utf-8?B?Ukg4S0NLaWxhZlJOQVZOa0lWL214VXhuT1ppcEhCVTJ3T2M0QTVDWEFaaVY1?=
 =?utf-8?B?U2RvOGJZbkJjYUcxOXVYUHlLUWNPcXQwOVFwRUIwNUtEcG9hKzZPcnFwVHdD?=
 =?utf-8?B?VVNyNFFTV0FGQkQ3K1Q2cE1NNW1HUi85SThwTEJDdHpZRTIxQlI5dnVhNi8w?=
 =?utf-8?B?T3AyMjdtc0RWSi9jeS94ZlU1TjV2akh5TXRlSnNMaHdTRUpCZkNpV1N2MkU0?=
 =?utf-8?B?NFpTSEZkbGp5YnBXclNRWmdqUEJBcU1oOC9MU0ZjcXNSN0JLdE9kWXhUQ0Ja?=
 =?utf-8?B?SkxkQWFidW5yQWxWUWxhV2xLRmNLZlllNzNyY3ZDTGdxQTFYUVZNM2RXN0l0?=
 =?utf-8?B?cEdkZmk2b2NROWxtbktnTzM4dytsaXV5RWFjK2o1MmJwVFZmTkVYZHNOMEds?=
 =?utf-8?B?bjIrSFZ6ZDRNdTluL2JTaVVIWFJKaVZBbkhwbngwZllGZ0V2SlJYZVU0TWVO?=
 =?utf-8?B?NW5tVWl4UVdra0FmY3BlOUF4QTBnYjc1Y2I5Ry9uQnI0dldJczh0WG0wdml1?=
 =?utf-8?B?ZWxjUlp3bUt5RW9TZVVOTkYrQS9tTFdJUnFVLzBWalhQQkUrWURIUjhlWGhU?=
 =?utf-8?B?SEtGMXdQTW1YTDYwZGFzZGdBWjd3SGFBSnFDTE1jVzhMRDgxMG42N2tMSVRN?=
 =?utf-8?B?MEZGUlI5bHBjZFc0THkvUHVGSUxXaEJDblRLNWNscDNKSWhMV28zV0M2d2Zz?=
 =?utf-8?B?MVZPQW8xWW9jSWRHT2NqTytmYVlzNlN5ZytGZlRHdzVyU2pub3A0YmFNUk9N?=
 =?utf-8?B?d1J5QTJvQjJ0d2o2ZzZsRC8va05VVlNpV2hYam1naUliNkwyQitSUkVacHh6?=
 =?utf-8?B?aGNtT0FScE1VMjdyWHE5cTNTdEk3UERZMmI0cDVBQlVYM3htQS83UlhGdjdF?=
 =?utf-8?B?c3pDalA0OEF6M2hvT05BYnJnN3gxY3VuOHE1OW9aWXM5aGdEenFiS3FQbjlj?=
 =?utf-8?B?VERIZ0NHME1vWjVSdWpMQ2JkSXhObElsQkUwblZ1OENxWEpsS3BQNi9aQ3Z0?=
 =?utf-8?B?NWwydDhabzlQN1FrSk5lOFYzd2FObGkyV0VUS2NPY2lKODFkK1hCYWxpbkl3?=
 =?utf-8?B?akkxcEpMUXFuaStDd0RIZmpxdnZjaTZKdnZUSWpwZktFeHJtL1duV2ZmeStP?=
 =?utf-8?B?YUdHQ2V6OGFoeUxMdWw2cmVlNHZJZ0lPRXpHaTRuSEVYY2ErL1d1T2xXREFt?=
 =?utf-8?Q?FpZx307fduq72JL1rZ6pgAfb/?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8562b92-b93a-45ac-a2be-08dc747b319a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 01:06:04.1246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1yWk27QxT1/3awNjVFFe/DFrSoPjtZvZ56jKnUDgt7sVdAlVAp6KTd8iVGzl+bXwcazA8DuBCYfwAwEudnmTPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0
ZXZhbUBnbWFpbC5jb20+DQo+IFNlbnQ6IDIwMjTlubQ15pyIMTTml6UgMTk6MDMNCj4gVG86IEhv
bmd4aW5nIFpodSA8aG9uZ3hpbmcuemh1QG54cC5jb20+DQo+IENjOiBGcmFuayBMaSA8ZnJhbmsu
bGlAbnhwLmNvbT47IGlteEBsaXN0cy5saW51eC5kZXYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
Ml0gUENJOiBkd2M6IEZpeCBzdXNwZW5kIGhhbmcgd2hlbiBlMTAwMGUgbmV0d29yayBjYXJkIGlz
DQo+IGNvbm5lY3RlZA0KPiANCj4gT24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgMzoxNuKAr0FNIFJp
Y2hhcmQgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBJbiBkd19w
Y2llX3N1c3BlbmRfbm9pcnEoKSBhbmQgYWZ0ZXIgdGhlIFBNRV9UVVJOX09GRiBtZXNzZ2FnZSBp
cyBzZW50DQo+ID4gb3V0LCBvbmUgUE1DIHZlcnNpb24yLjAgZW5kcG9pbnQgZGV2aWNlIEUxMDAw
RSBuZXR3b3JrIGNhcmQgaGFuZ3MgaW4NCj4gPiBMVFNTTSBzdGF0IHBvbGxpbmcgYW5kIEwyIHN0
YXQgY2hlY2suDQo+ID4NCj4gPiBUbyBhdm9pZCB0aGlzIGhhbmcgaXNzdWUgYWZ0ZXIgdGhlIFBN
RV9UVVJOX09GRiBtZXNzYWdlIGlzIHNlbnQgb3V0Lg0KPiA+IE9ubHkgcG9sbCBhbmQgY2hlY2sg
TFRTU00gTDIgc3RhdCBpZiB0aGUgRVAncyBQTUMgdmVyc2lvbiBpcyAzIG9yDQo+ID4gbGF0ZXIs
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFpodSA8aG9uZ3hpbmcuemh1QG54cC5j
b20+DQo+IA0KPiBGaXhlcyB0YWc/DQpUaGFua3MuDQpZZXMsIG9uZSBGaXhlcyB0YWcgaXMgcmVx
dWlyZWQuDQoNCkJlc3QgUmVnYXJkcw0KUmljaGFyZCBaaHUNCg0K

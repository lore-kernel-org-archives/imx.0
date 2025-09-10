Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020108.outbound.protection.outlook.com [52.101.69.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C12C2356
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494169; cv=fail; b=nzVCIOPKrlKIYRyXgLe7oOlELO+95nMXYWb44/g8qDxqhjPB5H/WD+Q8ePxY4PuN6o1CM6f+aG0AdbuR8VU/3delDFAlNKqDlCzRt9RiF02yZVWJ5l8SkkMEjwufkYgy/OsDruGMZli8Zfap3EcmqzDlrJ5xOdxrTS0c/BkiQSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494169; c=relaxed/simple;
	bh=/Zael4WzEkrWf7OicJCdpC21pdwhlA244JzGd9hJ3A0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ldhti8Ol5QLKx8CYFQTYfbdosnI8vVx/tmV3xuaaYSNPRhCZYLsIb9DDq6hgeeJkXokw15bHnhc7z7R+lguENdikP1mN7lUoU51jY29tvawQ4qaC21Lz67/OK+WwzKTAr43kjzntUapr2ASLKv0YqMYsgmHF4li1pNQ5pyKHTi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=LVxBxBCd; arc=fail smtp.client-ip=52.101.69.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="LVxBxBCd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ0PM/F5zWUDGZBe1tu0fR7Ib4APFK3ajsRFI6b19atTFpbyojhbU/jmAfprH5Z0DfxeMw7pcL1fwjH8KmiY67DOL1ceGizZDp7lP7AUGYZiH0IIs9Fz2meN+3Aro42CXzZ97JBPGyaOsEai56/J8oeEraoGdWz0/A2F21hf9BiCtwhG6SUHydVXXlTBEv/62hmaA+vqMp3Rnxj6MNCq/4HuA9CZPfDCeKfxc7mKnDK5zxknE5AQ+80ecAHytoxMjaYgeD68wf08qjBsR045Jg4sMvw3X6wyFFN6S5/52RBlmuTUx48qh+wYnqHnR1hw0/yH3P4wap60jcMu66kozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ+pU18LW+MqoLuyPstY9pxTmMaDygPzNP+JVHHORrA=;
 b=sgcbh7XPGjTPSfIeN2lshIy9hNeWifvkqdkNzP4bZiIZvnuccUQhdpyqnsR/E/TIloEGeq0Zko4SBDkD4sZYHcdzdac/ePfJrmEhvvL2nlGEvv0oDrvcXdIDZWyYXNXojC+ZvSX4EEc6dnDz+oyDLkS5BKBPDB6mBJkBwLDwQRIbr10imUkbwLXsr0DvGZeYqvPeCZ3IkbwgPT25GoPwXLyZq3MqJDKOFt596TWK4cN9pM9NnAdtHCK6DJfpPY00gBVb45p2eTz46ht2s2hn/qMbq2rEzGGMv4pw+yNsUzLZjvKiVW7JEaz69tcz0nda6sue1BfxO7FGPj0vAitteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ+pU18LW+MqoLuyPstY9pxTmMaDygPzNP+JVHHORrA=;
 b=LVxBxBCdFW1VRNAYAt18Qju2axJrBtK6oX1buvdoqVypNFZMOVatjAIcEt5QnI+1aaydF6hYFmR3s3u3o2R1jyub13+i0GI1xbsoDJf62I/KWBVYAa/k2dmKwlxyGhH1NnCEVxBaF2Elkli4K5ZG0nhu4F+7l9/KENlCoTJnFaLn8I6+CZ1y6i/d6jeCN/oCSYRH+9C73skYGOhZ4ygO45p+LSbTyjuQQ6axu+r/u144w/LRTVR8ycIPFMdw32cyRTyXuX3Ssu7JqZxxSwHJjPBBOIo1SrmYDnBwEutQMZHFF9aIqOuy/5y6hrHqqvZEJL6W2oGJ3k+rn47oEyugkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 08:49:20 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 08:49:20 +0000
Message-ID: <42b98b9b-5561-4a46-bab8-a5dc60b69669@gocontroll.com>
Date: Wed, 10 Sep 2025 10:49:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Strange PMIC behaviour with rohm bd71847 on Ka-Ro tx8m-1610
 (imx8mm)
To: Matti Vaittinen <mazziesaccount@gmail.com>, imx@lists.linux.dev,
 LW@KARO-electronics.de
References: <56e7a430-79dc-4598-8e58-809759cf0711@gocontroll.com>
 <f5736f7e-26ec-4a20-8f4d-82d45e719f3a@gmail.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <f5736f7e-26ec-4a20-8f4d-82d45e719f3a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0145.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::12) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|GVXPR04MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: 44474782-b05c-4981-3689-08ddf046eeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlVlTTFvWC9jNmM2UDBnZFcyWk9aMUVEUTJoaHE1RmtIekVFaHc3MFRXQzNp?=
 =?utf-8?B?WUEwSzB4dWxjajlxR3h0ZERiejZ2RUtUTjFMZHJ0WXZZQ3hMYmsyK1J5RDRj?=
 =?utf-8?B?ME9Nd1hXTXFrWEtoK0I0ajZTZTJqYnVXU1NRZldGTHAvMXFZL05XSlcyUThm?=
 =?utf-8?B?aS9DbTBmbG9LbFpITXJhcTRNOC92L3BlL01VZ1JXVHdNU21LcG9uNVhDNlA1?=
 =?utf-8?B?OUV6emtNbFJaaUVJazc5ZmpWVFYxTGtBY0FlL3FmSWpGdk8vKzJzVDNEVlNW?=
 =?utf-8?B?WnlsNkg1Q21nWmo3MHlMVWZ6RzZpbkhmajI3amFJK2UzL1BPMGIzVEJScm4w?=
 =?utf-8?B?LzRSUTRDL2lZTnpzaXh6eUVvSXNGOEM5d3lOc2FtSmh1TGM5eC9pMnhocTNY?=
 =?utf-8?B?Ni8yWXozTXpUTjNycFR2ZTJPY1R4UHpXZFZxNG1rQURTVmVzRW1YKzVORTNK?=
 =?utf-8?B?bWFCM0VXenlzMnU1VVJWaENMZ2hHQnp2blVPR1pOZGhzbjgveTN2UnhhVU55?=
 =?utf-8?B?WHFWdXZwRnV3M3ZSTTZVcG1vcU1nMm05ejJXRVZXNk1QblJQd1czNnRkL1pv?=
 =?utf-8?B?azBiK3lzSHhrM0g5QzdDTjhvY2R2aHUrRktzRG03RlBSUTZhYTlXVFVna3BD?=
 =?utf-8?B?dzFKbW9HQm9xUm9XMjZBTjBhNUY1RDd5WHU5dVpnbEVuZG5iMVVXOGdwaURq?=
 =?utf-8?B?aWFJajdlWjdjbVFrNis1aHE2eUpQZ3VSbllZaGk1SEVoNDByaWpqK01FOERY?=
 =?utf-8?B?dFN3SFpOanFlZkZGMjBHZzI1QlRHdHJQUHE4V2lLV1hyZCs4ZGZrVGY0QkJm?=
 =?utf-8?B?MlZ2d1dFNENuaHBSVHpEcGxaZTJjNnI5QzR6bUcyOURNZEtGMENIVnFiTFRV?=
 =?utf-8?B?aDk3M1c3eEpRMzZKV0NFVDF1allaUXhpS0UrQ3dWK2N6ZGpzcWpDa3RhWkVp?=
 =?utf-8?B?UitQbndIbjg0Y1NqaDJTUzRPVUZiWklMaVF2cXNQcnlheEdRT0MrNHJSVEdw?=
 =?utf-8?B?Uk9YVVRzTXdVeFpOUlF1REorSk1JS3BSZEhkVTFFaE5qS1hKOFFQVjd3aGU2?=
 =?utf-8?B?NVE2ZVN5YTVvZjNoTXhyaDlGckhtNzkvNjBEQWNmY3drYjkxWWRIdk5RbW5D?=
 =?utf-8?B?aFlFL1NTdnVLREdCS1VnMTZQeTJQQTJwMlZHdUd0c1hoeVBhdDgweDZaS2NZ?=
 =?utf-8?B?R1BRd0YwVFgyNVpzMlhGS3pOS3JDQjVUaHRzbkJhbDdUY3RMWjFBNWpDTURY?=
 =?utf-8?B?TldBOUZZTFlMR1pYakdobHJhK0RHWnlTM0lKVHVhZkhxL1ZEN1RXY01PdzVF?=
 =?utf-8?B?eVd4Q3hYTGJPODQ5cUtZaDUxcWo1a3JjQVdHTHh6RVM3b1pLR2xKakJ1QU5w?=
 =?utf-8?B?N0hHbDlwL1dSSFJCbit4Wmt5RlV2UHF4T0NHbWxjS3hBZkRpOFNMcWNoaU1P?=
 =?utf-8?B?enZyRnNveGxlOXRQTUNiWHd5bkNoUFlwZnpRQzYwUjQzRjJhOXYzdTU2K2Jm?=
 =?utf-8?B?R1JwZTF1bjA4bmw4RllUbE5ZMXB4OWZiRWZxbEU0elBEOHpIMzRBMUt5TmJV?=
 =?utf-8?B?QmNoRWxOVk02VnZQeTU0QXpBai9rWng5T2J6TlNxTU9sSDMxaG5WZWFQSkVu?=
 =?utf-8?B?aThvSHpSeU1IdTEvL3d0aDZlUzFlZlNhS1F3ZEV0dXRPNTJJaGkvRVJ4OWx5?=
 =?utf-8?B?QW94SDkrQUhlcG1xbFhpMGhaUTB4dFZyU0w4UzlhbE1mb3FVbXJsU1diZDQv?=
 =?utf-8?B?Yy83WDY1SkRsU3N1NHJXbkc0VHBtT3UyQTZWcWp6U0xXalk4Zi9FMzIraEQ2?=
 =?utf-8?B?MzRHUVdpWnBtOU5HYWY5Y1JYU0xmN2c1SmtaRE9RbUQvd1psbitSdnBkVGh3?=
 =?utf-8?Q?34Auh8r4mLYYS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1BIYktFOHN4bldTaENVMFdwZkR1NUkrbzI1c3FZNFA3elo4VFhzMW9GRTdp?=
 =?utf-8?B?VllZcjBRNmw1NGdFQ2oxUG9ITUVRd1NPWnpqTi9mMFVpUk9FRmx6MWtjdTJs?=
 =?utf-8?B?Sm9FMjhkMitXSXJGT3doWW9HcHpBM1dYSzkvS3BrYWtlWVNYR3l4S3FKN3ZF?=
 =?utf-8?B?TnpuNFRWck83WGlqMUl2TllXSzVLby9HbDBlOFZ0cGd0eXBUemFDdDV6Ry9U?=
 =?utf-8?B?blNld1FEcTM0Yis5STVxeEoxZElscUVGUzdoRFpUYWRTeDB3aHpPVVhQRHFM?=
 =?utf-8?B?dGNFU3hMSXJCM1hCNnBSQ25oMWl0eDFaZitnbk9CVnkydmlIdjVSSWZUSWtS?=
 =?utf-8?B?RERjbE1Ecy9uYVNzOWplSXVHSjArS1BtL3gvOE9Gek5veitaTGVtQWc0MkRv?=
 =?utf-8?B?ZThLRHZXSDQ5RUVwYWZoMVhRRTlpUFk2azlJZ0Zja1pkaVozSENYMys5ZnVn?=
 =?utf-8?B?V3VSTFc0Sy9GVVFmVGp1ZkZkbHZRbUZWck1jOSsvTW9FRm9kL25aSkZMd2ZS?=
 =?utf-8?B?WTBGV1FVeTl0TmdianJnZDJIMmJ3VTdCY2wvS1ZzY2FMbDRUSGpiQzc0V1hs?=
 =?utf-8?B?d3ZSV1dWdUR1SElna0RWWVk3MDVtN2ZjenR3WHI1TE02S0tDbXBjOFVINk8r?=
 =?utf-8?B?SUQzdTVkaXRRR0V6WmF4TVlLS2hHVE1TanFpYnBTK3FOa043NVBDL2lmbTB4?=
 =?utf-8?B?cGdRTVR4d0dKNGQ1WEdTTWE4TnpQQmtKcDRUd1hOeWFrNVFvNVlxY1BOL3Nl?=
 =?utf-8?B?SnhQQkdkZ0diQXVPL3QvbnF2MU5vQ09PRHRBUUtNRnQvMkg3SFZuRm5WVE5S?=
 =?utf-8?B?bndZRmtGTDRkWWVkRXl5L2NZMlZRN2FYQWxzbitxa0FBaHVXMVIxMXU2RFlz?=
 =?utf-8?B?OGJoZmp2eWdMQmdtcmR6c1lTZXV4Z0dSdzFHUzNVRy9ncWpGVi9mMWZ4Z1F0?=
 =?utf-8?B?K1FGZmRmMXNaeWVhL1VnWmRUTlhSdC8vTGlsTmpSVkJnbTEvL2EvbGFTbEFi?=
 =?utf-8?B?dnFWNHY4anpnc2xiMWc0U2gyY3RGSWZvWGhaZFRGa1NpcWVQNmFtaHZYUWo5?=
 =?utf-8?B?aFRSbW40cHNRQzFqdk1Ia0JJQWxqSnc2bnFrYWM3dElEL1NUY0pKN1F0NEJs?=
 =?utf-8?B?MlJ0VDdxVkR3ck55VFI1WGpsMFhqeHJvU0t1UGpLMG9KS1B1QTFJeUlQUWZJ?=
 =?utf-8?B?dXl6eGtJenBuTENLZGg1cVR3YTRxWW9XZ3BncjJzVko1T05NNGlJUGpuWWhK?=
 =?utf-8?B?UHhCVGVoVW8vQ3RiY1p0VVUvZll2NlZPQWNuUURBRTNxM1NPOFN3WW0zWUha?=
 =?utf-8?B?dUF4SVAzcXpjNm13b0tkWHNJYitoWUhJdXB6aTBtQ3E5am83dlFJOTlZMzFn?=
 =?utf-8?B?amRoSGdjVENDNUQ1UE9oYzNrUmloNGk4SC9wcExvMG1qOGIzQXR1VndIR0JV?=
 =?utf-8?B?dENTSVo4Zk1kdU41QkwzK3lQYVEydzIwbkZuT2RmdE9TemsvZWpXeWpRTk5M?=
 =?utf-8?B?dklsQ1hvMkppdkpMaUdhOFFMUStNOHp5bEljNG4vM3N1VDNHTjE1ZjIvd3U1?=
 =?utf-8?B?WFlEK1o2UjRxSk9lTVd0Q3dkZFo5Q2x6RGVkRWdpUWV2Y0J2UTJpOFVuZ2Ns?=
 =?utf-8?B?VGJuU29YQ01uaFhSeWoyMWpWQmpDaVZrczFZYjRtN2hrRHFPUXFUU3QvSWZ3?=
 =?utf-8?B?N0VYRmJuUFBFaWJ6L0tyTnpvcUVjOENMdk1PN1p2K2thc00yV0FNNDMxWStx?=
 =?utf-8?B?NVhlUitjVVMzZXJKU09YUHZleGN3MWlDY2hweHN2TmJMYmRYSzFudVFnaGFT?=
 =?utf-8?B?dS9aTWg0S1ZyZkpENmdMVzdLU3cyaldNM0gwbkVQaUFkYXFoVDEyZWpUZ0Rq?=
 =?utf-8?B?WFU5WVArK2dZNVlmMmJ6NHQxV2lNdm1SbHZLTmZZOTVWL2xzbWV3UFN3UGtm?=
 =?utf-8?B?WHUyK0dYT1VSTW1qSnBlaWRmczQ1RTQvek5vZy8za2R4L0ZZSU94RFMvMklP?=
 =?utf-8?B?WXMrcCs0NHhNcmUzTFhRQVVsTGt1cHFkV1VBdjM2M1dpdlZqNCtvbDU1ak1W?=
 =?utf-8?B?WUhRei9HZFZYaFYxQmRTZHFjUzlzQ0hUcVpoM3BtM1g1S3FmNHlZaC9LMHlu?=
 =?utf-8?B?SVI0YXNab2taOXA4Wlk0UkJmMzhJem5kTXFjQnMwK3dJd0g2QXQ2OWNUM1Vy?=
 =?utf-8?B?cXVJRDZhU2FaMFM2QVZqNXNUVGUxRGpnbjdzcldoRmM3WTBScVd0bEs3clU4?=
 =?utf-8?B?bUQvenNWZHpkOS9qaW1HdUwvV2ZnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44474782-b05c-4981-3689-08ddf046eeb9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 08:49:20.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lyg0TgGEMBPTVTZvrOv3luBQMRbi+6XAUlNVMXaHjeiVtKPgUJy/p8eoWyp4lVebK90TTX0JIwocv5wGm40rb3PdzIdKvvWzTHaF2u5UAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

Hello Matti,

On 9/10/25 08:25, Matti Vaittinen wrote:
> On 09/09/2025 18:16, Maud Spierings wrote:
>> I have been having some issues running mainline Linux on this specific 
>> COM. Specifically with the shutdown/reboot behaviour seemingly being 
>> inverted.
>>
>> I have now figured out how to make shutdown actually behave like 
>> shutdown. It seems like something is setting BD718XX_REG_TRANS_COND1 
>> (0x20) to 0xcf. The only bit of code I can find that touches this 
>> register is this:
>> drivers/regulator/bd718x7-regulator.c bd718xx_probe():
>> use_snvs = of_property_read_bool(pdev->dev.parent->of_node,
>>                       "rohm,reset-snvs-powered");
> 
> AFAICS, this is the only place in kernel touching the TRANS_COND.
> 
>> /*
>>   * Change the next stage from poweroff to be READY instead of SNVS
>>   * for all reset types because OTP loading at READY will clear SEL
>>   * bit allowing HW defaults for power rails to be used
>>   */
>> if (!use_snvs) {
>>          err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
>>                       BD718XX_ON_REQ_POWEROFF_MASK |
>>                       BD718XX_SWRESET_POWEROFF_MASK |
>>                       BD718XX_WDOG_POWEROFF_MASK |
>>                       BD718XX_KEY_L_POWEROFF_MASK,
>>                       BD718XX_POWOFF_TO_RDY);
>>          if (err)
>>                  return dev_err_probe(&pdev->dev, err,
>>                           "Failed to change reset target\n");
>>
>>          dev_dbg(&pdev->dev, "Changed all resets from SVNS to READY\n");
>>
>> }
>>
>> Even with rohm,reset-snvs-powered set I still end up with 0xcf.
> 
> Yes. The driver is not - due to historical reasons :) - configuring the 
> reset target to SNVS. This should be done by boot SW if SNVS is intended 
> to be used. Then the "rohm,reset-snvs-powered" can be used to prevent 
> the driver from overwriting the config, and to prevent the driver from 
> taking the control of the boot-critical power-outputs. (This is because, 
> when SNVS is used, the SW-controlled power-outputs will not get 
> automatically enabled after reset - which may "brick" the device).
> 
> Some more discussion can be seen in this thread here:
> https://lore.kernel.org/all/87bjs3auj9.fsf@geanix.com/
> 
>> I've had to add the inverse in an else block to get the desired outcome.
>>
>> else {
>>          err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
>>                       BD718XX_ON_REQ_POWEROFF_MASK |
>>                       BD718XX_SWRESET_POWEROFF_MASK |
>>                       BD718XX_WDOG_POWEROFF_MASK |
>>                       BD718XX_KEY_L_POWEROFF_MASK,
>>                       BD718XX_POWOFF_TO_SNVS);
>>          if (err)
>>                  return dev_err_probe(&pdev->dev, err,
>>                           "Failed to change reset target\n");
>>
>>          dev_dbg(&pdev->dev, "Changed all resets from READY to SNVS\n");
>> }
> 
> This would've originally been "The Right Thing To Do(tm)". Introducing 
> it now in upstream would be risky - as discussed in the thread I linked 
> above.
> 
>>
>> In uboot I get:
>>
>> i2c md 0x4b 0x20.1 0x1
>> 0020: c0    .
>>
>> So something in the kernel is touching this register when it shouldn't.
> 
> 1. Do you have the "rohm,reset-snvs-powered" set?
> 2. Can you read and print the TRANS_COND1 at the bd718x7 MFD driver's 
> probe (before it instantiates the regulator driver or other sub devices?)
> 3. Please also read and print the register content in the else branch 
> you added, before writing the TRANS_COND1.
> 
> (As I wrote above, AFAIR there should be no other places (in kernel) 
> where the TRANS_COND1 is written. Are you sure this is not done by boot?)

Okay I don't know what happened here, it seems to be fine now? I even 
checked the loaded dtb in sysfs to check that the property was there, 
and it was. Now it just seems to behave correctly? I really have no 
explanation for what happened there but what is happening now seems way 
more reasonable and how it actually should be.

Could be that due to the wonky shutdown reboot behaviour the register 
values in the PMIC were saved in the registers from before I added the 
property. Because u-boot does not touch this register at all. Given that 
it doesn't actively write something with this property set.

I'm very sorry for wasting your time because it seems to be fine now. 
Now onto fixing the reboot behaviour.

Again very sorry, a day of patience would've resolved this issue on its 
own it seems. And many thanks for the help.

Kind regards,
Maud

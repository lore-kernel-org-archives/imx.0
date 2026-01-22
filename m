Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42D3F0769
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072578; cv=fail; b=Z8KyQsLMI7sQpHy4pzeaGkn4rS36A/laczR08TwF6n4Zu1Qe4ZufiSA4Ei7UI7G/l66gr8Mpy2f42NYXzSY45DQHqTMCUv7JDnRYTaKeZ+ExgzON+nb3rISPGPHtoznGLMEFg7a26fI49nlDHY2psNi+W65gf91jglLYgvGmNuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072578; c=relaxed/simple;
	bh=4PrLlTuui88ihY8Ujzv1w8o+318HpwKaEhzFuV24Lqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mCb2ZyAYbXhaI6ZgyPmBsKBZ/TCc3SDsMC/kD43mwoHK5AV4EqQYtgrdhbX8+OOOgebfbzep20hObw0SC/8rHsqSOdEWrmw+GBqP2jfbjg02hSH71hYL2zcSifBVDkgGsz60sxHX+QPcnD+KkqQ6/RU0NXetQRXgcuZf38hZhZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eyxcTufI; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eyxcTufI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBr67OO5hMTB8NFEp+FfPmcK/L/UJYtBNLHIGHcDqtr4eQBHDKbCgHJubtYk2aReVM+xPH9Bs3a8EDy71XNfsWrN18J3jX+8dkWG0sc0QtPKAem5gunkq691xh/VwKBJsyUa9A2Zmf6O3zM84YoS5VkBlhF45wprrwOuNUOSgqBis/8CLacwLGc+GNipmipGJfxh3prmrQlNFNE6mgV4eR5kaMZo0bKHrJ9hDMmUAY8kTgVOLVFLRZ2krDeRTigsu+dOH9411EkE151yW5WHl7IxtiTkdm7P1hUNyRzjjyNORJaPjtqXhTGE2LL4HpG5iJ+SCHU7MuAWp7YwCbSyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csBCDdqJ/y07HbzsEhAPP8LtfR01UsWVeuCBaFbZghY=;
 b=eGblqXEvXBdAh4WMwkk4ULgNOtQip+i0MAuchwbAffIn+YS2aD4qXINRX00OdCuKBkB0a7VvOE0p0iwPH9mTISOvfu1n7ZRiFH+F+on4TmpupcASh/lLiQ3m3N7qTJ7LMDqsMNhEAAkMT7z1Y8Za83KflgAlu0gDbtZbp7UliaQo7WUj5w5gW+4jYOu7oSZV6FoJdtT0HC/P+Ll1Qlpmnb7gBJM89mwtNYh2bxKQmJDoPwuTeVg24GobwTFQI01G9rhUjeSYrCmjW6V4O6s+yhqC1mzEYmRImBhktK7aLP7p8NkYP5DN0G6EOgKCLpLC9glGcr8hDh1urFREhrNQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csBCDdqJ/y07HbzsEhAPP8LtfR01UsWVeuCBaFbZghY=;
 b=eyxcTufI1EaBlVcdrh1ibGyUV+oHuccGHVPfufYLTIgPC4TxLhJUhEFkb02vb/Qb8pVGx9XxzAqaX69XEPX+nYvpgsstzP/SUaUDZlC1Hemm/X7QKTUcXp3wxdCEcqq/it8mKwjOFt4Oql9m+seaJqpm5GwLM2C3SrcIwboTYs02zwMXRqLZmZiSFIGPgXQCYp04WDHWk4tEjCYY3P6gplUvahPmFNNrvlWOHih+h4Bpt8ZrWv7W0yU+bu/ESaDlevYh4LfJVBn0A25Xnt28Xl8RsZ4rHLo017qkAW8h83YyQlZASRQwInFeDbvvljUztYritklcYWRiiWYYRg8wmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 09:02:47 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:47 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	Frank Li <Frank.Li@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 9/9] MAINTAINERS: Add entry for i.MX94 DCIF driver
Date: Thu, 22 Jan 2026 09:01:47 +0000
Message-ID: <20260122-dcif-upstreaming-v7-9-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4ad445-a2c0-43b6-b0f2-08de59950342
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTVoRXJ3U0s5YVZ3VUpGV3BKWnVDdkVjWHcwUUh1M1pMNjRlRDZUdGprd1pM?=
 =?utf-8?B?VkdvcGhPdTlOeEFIUTRzMWo5M1JSR0R5ZUZvcDhzYlZWNjdPYjBUS0EzU2pK?=
 =?utf-8?B?YVhZTks5K1ZHRi9zYmJWdVhwdlFTVUdQNDVSUVNjaGVMc0ZSTHFZRnR5Ymxw?=
 =?utf-8?B?MVFrWCs3VjB1YWRqbTVnOFViNVpQdHZrc0dSOEUwaEVXdUt6cE5VdjJ3KzZF?=
 =?utf-8?B?SStHWmhNVXJBVGdocW1ZM3Z1WjFvQjRMcnhZVzNnYWNHSk5OOE5sdzlKZXlS?=
 =?utf-8?B?RFkvYU1jY25OdDdqMFp0OWRlV2huOTBvQURsOHM1VjlIUmIrcXcrWjl4bE13?=
 =?utf-8?B?TURxWUsrWnZMcklJYWFRdGp2emhIN1JnM0JCckRjcDdRcFhUNHd2TjRzdDlm?=
 =?utf-8?B?MkU4K1ZkUnNZOFNya2U2ZmNJRmlYSU1DMlhtWjVUMUQ0TndINEhsdnQvNHUx?=
 =?utf-8?B?S2RqTFZuSndEL2R6cTFtcmFXWng3ODNESmZWWmdIVDE5Z05aTHU3QTB6V3lm?=
 =?utf-8?B?V084LzBNRk5BQVloeU9RTkQyWDBPdkducmZZenNtRmRMN2hTNjl4RUNhZngz?=
 =?utf-8?B?YzBiWWVXNU1QU2tEUnJjdjFQUVB5ZE4zOCtMMjJrS3JNTWtWVXRZblVmUGJL?=
 =?utf-8?B?ano4VGFxR1RuWlUvaE9UaEVhZXRxR1F3dEdUZDV6enpoTzVFS2F6c2E0Y0tT?=
 =?utf-8?B?ZE01M3UvczZIOHZqS3lhNTI5REN3S0c1UklaOEpVdlR2V0JOZWc3VUkyV3FW?=
 =?utf-8?B?WUpkTzhIZkJwR3MyRmNUR3VUM0huZ1d6Vm9pRGZjeUJ2Yy9HbERJT0VNMjdS?=
 =?utf-8?B?VXd6TTgxSDJ3d3hLaUp6bWZ5ZFdDditPaTIrZ1Q5cS9PWWxTbXFaVTRJMlpa?=
 =?utf-8?B?cXp5amhNZlZKWnZ6RzdvME05cW5BU2tHUDRDU3V6TERJS2l3QzVjV0haemIy?=
 =?utf-8?B?UitCa2NPVjZEN2pTOXE1MzhMNnhPZGtGVElEZTN5U0k5MkVtLzBGUVRpZWtx?=
 =?utf-8?B?bEFmYm1EYmRkUXlpRlRiZW1MQ2VMUE9ZYklxRndhZUQwcXhkdVBTK3NyRExO?=
 =?utf-8?B?KzQzai94dW1jdXp3WUw3NEs2eTNId0Z0YUdqNTREaDFXd0RiUHQxNkk4ZlZz?=
 =?utf-8?B?UlRtejBRT04zQU5FV3ozV1NqbktkUk5Ba3RGbDZLMG9CT2RXY1RiRURGQTRv?=
 =?utf-8?B?UHc1RXpqRzkyOTVzdStYWGJoUzR5RE9raG5BS1hrQVVkWHFpWVQ3Z2pFOXRK?=
 =?utf-8?B?WTlHcWFFN3dQVnRBWXRNQWw5dHdyZDlsaENjWXFFUkUxOFlZQVcrTzFGZ1FK?=
 =?utf-8?B?YlBUYVdpR0ovRTRoTzFPR0xEemY2RWhqNnYya2NBdFo4Tk00STJYRUxocVB6?=
 =?utf-8?B?a3pqNDFuQTVPcXJSMG85SFlWMUlUMU5QTUVDSEpLQWtWbzhaTmc5eHhjbHl1?=
 =?utf-8?B?TGVJZVp1cUdxeGV0eDMzaXhpV0M2dTFFL0ttdGpuNGgybnBveUZlVlUxMjk0?=
 =?utf-8?B?djhBU3BRRVpwbm9QYUgzeGV2bDBTeFdnNjFiTjltUmJBUlFTbm1kTDVxaTNZ?=
 =?utf-8?B?cFRKcDFteWo1MExrLzRyVzJ3N1FpaVRwcDdVb3p3L0V2bGZCdDBiQ0RVZy83?=
 =?utf-8?B?NUZKT0ZTUUcyL2paYmxDYU4ybTYzVW44RElPaUh5SlVYZ3A0cjg2Yko3NExn?=
 =?utf-8?B?b2VkZWJiUXdyb1hzcTVQZUlid0I2M3V5RXdJTXc4NUFDQ0JDZ1M3dWs0VU55?=
 =?utf-8?B?b2RCT0V2K3UxbFloVFEzN09pVmZWVklld0JETWszQlNLK1MvQWtZNmd3Q3J0?=
 =?utf-8?B?L3NWS1gvSVhDSTJLYjNUd0YxOGFMcjY1YmNXQituQ2QxaWUyckVIUlFEMk8w?=
 =?utf-8?B?WVp1VnN4NjlhTUtKQUpOMXJha1I5aHBIek5Dc3ovT2ExVE84R2diTFVyc2h1?=
 =?utf-8?B?SFBwZHFvUUFmRkdvQUVOSGM4V1RBNDUwc255Q0twLzg3QXBkNWR3WFlEamty?=
 =?utf-8?B?b1NRRHpob2VRZVI5aXZDNWxkRDc2Z2U4TE96Skl5UGttSlNUbDR4bktlN3Nh?=
 =?utf-8?Q?a/BHM5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTYvWWtOeEVndTBNajdqM1ZTNTBsQlhHOEhja0hja1dXTzM3c09KVEV2ZStZ?=
 =?utf-8?B?Q2ZBY1FoZ0RCdE50b2c0TWlQcGw2aE1YV1U5ditEWFVGZGo2b2RDUmFhWHIw?=
 =?utf-8?B?RlVkdk9DY1hXM3JIa0ZGbEFHa2dPU0ZBaXBhOFhhdFZSSlo1anlSR0dVTnlJ?=
 =?utf-8?B?ZllnaGhZSlQwdjllQTJmYWt5eGlvbTA0SThWekJZdWFyY2N3blVGdHFKblhY?=
 =?utf-8?B?UjRlNnBzeFR2eDlSc3NQTG1lWGN3MFltWER6ajczaVBGaW5wczE4Ylh5cjNN?=
 =?utf-8?B?VjByOUlLZ0xzeEpRdW16NHRpemhkSVZSRnRtSGkvNm54VFpReWRZU3poWEdR?=
 =?utf-8?B?VUdpbjE1bXBjSVBGS2Z0YTgzTWRWb0xpTzdxL3pEVmZJeFhUOTN3NU1HT2I0?=
 =?utf-8?B?c0w5ZURjSmY3cUEvcEwrOUl0NlFZNHFGaEw2ZW1xUTlHZE0vbSt6S0pSRjdp?=
 =?utf-8?B?dU9YK0gwK3BQU04wcmhJdmh0V3FRT2loWVJiVDdhQkhZcDBMMUJseVp0RHBj?=
 =?utf-8?B?RjBqbDFuM2VkRlNYYlNZUitBeTRFdmYzT01SU1RiUGV5cFAvUHNScTEwVU1q?=
 =?utf-8?B?Nkd3NUFsaklTS2JrQmMyREZVWm1YYWdhNHpscUxVN0VxTzRmbzM5ck0xQkNa?=
 =?utf-8?B?Nkt1cEV5Q1JzTHQ2b2xXSmVEcWxOYTRreHFRVkwzVlZoQzc0TjJhaCtXYWFq?=
 =?utf-8?B?V1dyWWhtQkVvUzd1emc4YWQvWGUyNU5MUnZGNVFqRnlSeGw0cUpIVGF4SzRI?=
 =?utf-8?B?d0pTSzlldlRsQSt2dlNTUWNZLzlqMzdSRUxGRjVxUUpBdmZCQ2g5N3ArWEhr?=
 =?utf-8?B?RW9lRjRSRS9ScW8zUGx1VnhUT0hxcTloOEZWWHJzQXV2WWZXRnA5dlM0eW5C?=
 =?utf-8?B?dEZnWlIvaTVQcmNPUzJMZHhCVFRNc21weFVSNzUzUkVpWHVRbTZSUVpjaU1Y?=
 =?utf-8?B?OStDQWxCK2EvbHIxTE1ZWjd6SVBIUzRLanIxTEZORHp0MkUxcWJvZFM4T2hh?=
 =?utf-8?B?UUJaQmFwNi9KTzg2RTllOXRpUjVpa05yUmVZOEphNkY0SnZaNmszd2djbTky?=
 =?utf-8?B?cHdSbFpXaTkxNnhDcGZHQkw0cCtxWExJWjQzWHJod2V4NlV1cEVVZ1VTNTk0?=
 =?utf-8?B?cGRnTVpQR3A0YUg1TmxCNVUzT29iVDhFNTgvU3JHdXlTVGNpZjgzSlNLTW15?=
 =?utf-8?B?WlF6Q2txNXlaMjduQUFWTHF1LzkzNjNKallKajM5S05KNVNadnhxWGhhZVNy?=
 =?utf-8?B?amxYcHIwVnFteU1UL29XV2hLZHRnMUVzVmp3eUFmcmh3U2lGcU1TU0E5VndB?=
 =?utf-8?B?dytkYlR4S1ZKYXNBWFM4clFoWEdTcjMvVG0xKzZFQ2VrSEVLN3dCdko0T0pT?=
 =?utf-8?B?Y0ZOdjNDMUlPZThyYVZGWTlVdXNINElnbzR6bEc2N2FhMk9pZk5paUJXeWNN?=
 =?utf-8?B?cXBYNDh2STdYREp3Ny84WXZzV0VaTXdlWTNmVmhqNmdVZ3NCUVErVFBiUWV1?=
 =?utf-8?B?SkRTWnd3alJYQUNQRzE3SWpheW5zeEpPQ1ZzSnF3cGowbXNuV0pVMHlOTmty?=
 =?utf-8?B?NjNWVk1xR1Izai92bkFHdWpSQm5IWGFjdW9MaTBhM1RGbjh5NGtDL3BCdHVr?=
 =?utf-8?B?YmpkQ3ZiYUNPaENvbHplWnBVOHFtRzhOOEd5eHNlbXNnMEtIRkRqKzVmNzlP?=
 =?utf-8?B?OWJtVlFCU21VVHArRHRaMjRjK0JyS016d0NId2FRa0V5eHUvcWhhanQ1N0s4?=
 =?utf-8?B?VnpMVFlYWEtZK251Q3JsTkJiZE1RKzV1RUZzNXNkdkc5MkVaUWRENFJrQUJL?=
 =?utf-8?B?NUxnS0FoWEp2a2w0eGtLWVNSckNHTUl0K0pVOXVlSW1YM2JJLzRRRUJvdURp?=
 =?utf-8?B?Yjg0R2ZCSithWkZBT3JyUkFLZmk4ZGF3anlEMjJhNFp2cERvTFd5RDZKUnRM?=
 =?utf-8?B?SDBFSytwTEZzRUdvSjQvUkpzZzYrL0lKWlVWcnZ3NlZoT003M0RxdHpFdHlP?=
 =?utf-8?B?N0doMkVLbGc3bFpPZ21nc00vNk1zUFRnU0JLK1d6bzRpTXUxSksvK2Z1eHp1?=
 =?utf-8?B?S0NZaWFjRWNjRHZyemg4N3lwdmxPa0xteGlzcVBZVk85M0k4SUdtRm8rSVIz?=
 =?utf-8?B?eVk4YTNUdE81bDU0UUV4cmk0VWRjdUM2K0JKREFjbzc4K3dLZm84NEg5QVda?=
 =?utf-8?B?N3BxQjdST0cyWm53a2oxZ24zeFZmZmFaaTBSQllkdVkweUdEV0xKZ0xIS2hM?=
 =?utf-8?B?bUpuRkQ0aEdZZHJSdmRWTUx2WGs2Kzl1bmJUeTViMHdoT2xlVTEyUVU4R0NE?=
 =?utf-8?B?MlF6YWNXQjM1VXUwR2ExUVhmRkVxdWIyenBYTTRkZEZHVDhoUHNDRzlGdTNM?=
 =?utf-8?Q?TbExwhKP+fRDJPl4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4ad445-a2c0-43b6-b0f2-08de59950342
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:47.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPFVp+bWXbnbpiwZMT8prDlRGUqrfwEiJe6uMWdCEAM0vB9oHH3r4+I3/+fxAPn2uvX5woDXFBpw24gGONl+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7872

The driver is part of DRM subsystem and is located in
drivers/gpu/drm/imx/dcif.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 044bd9e473163f3412725497234e1be22f168db8..5a9afbf3c8198d6bca49a9a65abcdabb81f43733 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19041,6 +19041,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 94 DCIF DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
+F:	drivers/gpu/drm/imx/dcif/
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>

-- 
2.49.0

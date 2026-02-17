Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2A356A13
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334410; cv=fail; b=jxMqoo1d397UUUxx2RZWmJ+ZL1AMwwhEOVUfxtB/y74zP/bA/uw0Y2vNIKfwDjNpf9PF9a8bV1OI7YuoNF7t9U2Sha2BlsytQ8wgzXgl+C+60mlmcbo2xm3TKsLWhe5TjXVq27qe6hC2qOZ/2BiCtXEinm8oKWMdEPwzvbJALZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334410; c=relaxed/simple;
	bh=oZfF0iaqtJDlBf0pjmgjTXfcsGFifeNjb6pxZSaT5/U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GGechyTrS2i13/jPqAwlVopgNaa/YzAcR6y2JM9/D+nI+rADFxvOdUEzbudXJxSyV0Mn+Sr6IWqB7rpXr2Ij9eswSozCU+01Gf5w/3RmhO1AjpiRM70i8GLXpAFk6Bvn5AcIKe6sP0l2BfxvyAcmhbApBZaJzuhbo1ozY8cIEhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nU/OYFJ9; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nU/OYFJ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqZ+aZUttKyy4wYea/kIhOceM6Y6BsJbjLC3k/iKK2wKDF7lWRdSfJb5jDO5ltbtEWsw0peEY43RJV7O8sOWC77zIoBVXlDfQ0kh/BUSYrOb0gNhrJ2IaegBwKIl6gmlTfCgY9R1Q7pHgTk5J88leHwbnslVzI7gKEAVH5rjof0j2ORc19W32m4htmIUOyMqlOmvmRTugtoKFs5ce4GclUWzlkjKJn6SB24/2H5DEbvYd1UidpIRjraj2IZ0emNSg8L6aC3dFU+78epqH7qNouZJM+IuKYDVh6sPc5ubnjzjFpw+ATaFrwbqbSLQANm8BFaANfubrdMo9n2ghzA2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4b32zHjpuCQl2tQQhEOu3Tnf9yYsPWKmZS/OIB1GQ8=;
 b=mU5hTpUk+ZnEmNZvTCrT87uPszFCwl2k2YJm+WKtBX8HGyrvkxFiwo05RB0DJnegoEn6j6KpseE+J0SR4nx3U1qjaJhBOqx+fsEjn0113D5/Ur63X5qedHptp1xozPNaqYZcTnWYfvjpnahmEb7cGYkNSv7kqxgPmCW3cTY+FWt85W1ossJHXfw43UGQtFuJKf+7gTjjgjj8sy6akTrXdwZU0qy7r6z8wRs5YkKR5mqX2noTZqHQlsq8Znd7gKFm82Efso/OG1Ph1EZbvW6UjRjSQ13rKQfmnm2sTDvnRESvFWmCGGbFn7q1bZBkKWDvKSxdciIA3jx2ez4qvSf0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4b32zHjpuCQl2tQQhEOu3Tnf9yYsPWKmZS/OIB1GQ8=;
 b=nU/OYFJ9+wD8dMeDR2P8Sp7stPfkzYh5N8qs0lE2j80ZPIckfPNQaPX0XCuzdYOhyIC1gDFsqCeXKzsjSNBq4jtStcUQb3MZpuELcjrZ/5wDZQ+7sRK/q8bH4rFcmwQkrJ+yTax3iGRmoyu7oL9C/lBDWsnvDnjYNZySS0ITOhlZUK9tzkTH2EggVZqZJxjF+35z+wHKwipjKv6btaN2LzUgmFgm/41aDq5qykAkTnm+EeYOy9tUpQxDeWwdvoLuy+Bt/f1OQoo8CFmLa6e6yn78Wwcr9X/epigp6nyRo9PHD5Xy5tIk7IcMZSJTK8zhTkJGvTJHHCTJrHUWdtTLcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AMBPR04MB12208.eurprd04.prod.outlook.com (2603:10a6:20b:75a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:20:06 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 13:20:04 +0000
Message-ID: <600ec825-4402-46a5-85df-1e57f0ade49d@oss.nxp.com>
Date: Tue, 17 Feb 2026 15:23:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: imx: b850v3: Define GPIO line names
To: Ian Ray <ian.ray@gehealthcare.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-4-ian.ray@gehealthcare.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260217125952.53997-4-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0046.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::11) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AMBPR04MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b5d62a-7b07-412d-75ee-08de6e274328
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW13VTRobm1mVnBNY0NENWJ0ZktkR3VIa3UwZW9qbU9RTkFqRFlDMCs0NUp0?=
 =?utf-8?B?Yk9jTkFZVVNVcFVHUkNFWTZFelJXQVRqbHRYRVlpQ0cvOGllTm5GN3VoWkp0?=
 =?utf-8?B?SWpNREZzYlBUVzVqaEswR2wzYTJmdXR2TSt0NkFzRmRrYSs5TUxibnFOYkND?=
 =?utf-8?B?OXBQbUdvU21rZkRSRTYxZVozMmVqeTNFTnpFZlgvZDBmc2pCRUxpM2YrUTJx?=
 =?utf-8?B?TkxVLy9GM2o1Tlh5ekcvVllHUzFIWjJRMElSdWxHNkEyV3FoU09xUll2Vi8y?=
 =?utf-8?B?N1pOZEl4eUJiRWtQSDB1Q3ZYdUdWRDZVSkQ2Z3VEdU02MnExdnhCWTdCUVJ4?=
 =?utf-8?B?dkJlUFlBNnhFVmdQd09MNjJRVGRueGtKWW1NbjY3RDduVTBJWHA2OFhpa2Ni?=
 =?utf-8?B?YmtIU1RJZVJZTThZSlM1ZlNqbXJaVFlKcDJ6YWFQYlR0K1hvTEF5U3FTWVVy?=
 =?utf-8?B?dWUyeWdUVEttRUJINmlablNmV2ptcXYvQThtUkxHM3JpZ0tCK09Eb3hwNGk3?=
 =?utf-8?B?TWZyVE1nVUhQWmdYS2MyMjZlVXhxOTJ0SzZURktHeEdCV1VSWkw4SDQ2ZFhM?=
 =?utf-8?B?ZldYZFU0N3h3Tis0OVFJNThwT1hxTmlHVjVhT3M0Ym1yeWtGTkZPOHloMStk?=
 =?utf-8?B?WUhqZEw1aTR1Uk9lTW1sV2lTL3c2b1d0N3ZJSHR0WGNQU2tMcTkraVV6dDJ2?=
 =?utf-8?B?SVlkN0RORDlCL2V6dHUzQnJSaDZwZ3dNdmlhTC80WG9MekZRMlA1ZFVwY2pC?=
 =?utf-8?B?ZUNsYWwyOTB2Y2JJdmp2UHM5SXJVNFRlN3dWZGdOczJkblJZa0h0Z1VoZVMy?=
 =?utf-8?B?UW5wUzlqeXJ0di9mb0c4dm1vYnh5ZmlDaU5Ici9MaU1HcCtTdFNOVEpWVGZh?=
 =?utf-8?B?enRRTEN0K2Y2eGt2SEQwZ2MxSVpUSnlzUHZPc29idmYxdmZjRGdQeVhnRTFu?=
 =?utf-8?B?eE5JdGwrV1p0MVBtdC8zWWpjSG5SRGlNVVc3dzlhNFRoSUFNWGtMUVlUbE1u?=
 =?utf-8?B?dHp3b21ZaXdvbjNNajRsUHU1Mzcvb3JCMkxmM08yTGVuRFFvU3FwUWhBTFVn?=
 =?utf-8?B?eGtqRXV2SHpYUE5iNytFZWk1UmRLUWgzNjJBeWVJcytRVERUUDZJc25KR3VY?=
 =?utf-8?B?Z3huYkhZRmdpeWs2MzZEekdiSDRZaEhNalhySC9NZDdBWEs1a25XcG9HSitx?=
 =?utf-8?B?VktiWFVRdXQ1V0FaYmZoOThlRkxJNFIxOUlmS0FXSWhOcEpZbW55T2dna0VL?=
 =?utf-8?B?d3c2NDYxdW5VelZ4TW9jS1RQM09tcGtLLytBSXNyajhzWEFTS21wbnowM3Zu?=
 =?utf-8?B?ZzJpRmQvajRCb0hMNEw2d3p5anJ5S1o5NHZtSWdoS1UvemxMWVJjMVRDbjNY?=
 =?utf-8?B?STFpdTFHK3o4bWxLVGw0RG0wamI4OW1uR0RzcnZhQlA0Z2tlNDhrbmZ5SGdU?=
 =?utf-8?B?bGVIM2x2UWZGY1I0VVpBMUY1M3lCYUU0ZllEcnFBdWFWY21nQ3hZQVcxRFFG?=
 =?utf-8?B?Q0kzQVQ0bjExSHJsS0t3Zk05Q2NwM2dCaTQ3QlkwNU5udlJCODROQ1BuclBF?=
 =?utf-8?B?cmVCS0pCVVRLeE1ITmw3SVRUU080VFlMcGFnY09aM2pqM0FLVy9KL3pZWmx4?=
 =?utf-8?B?RnYwT0ZLMUN1djVQQUZxa01rYmowdmtwQVc2cENIQWVubUdKWVdPdmNjU2hO?=
 =?utf-8?B?V1g3VkZ5Vk80eUwrTWhmR2NqNVp4Z2dYeWR6MW5mRDFVd3B3NEhFQmE0U0lq?=
 =?utf-8?B?dFhJcGREVTJ4NUtibVVMU1YrL0l6cXZ4aUhXN3FQMldtNW5CcTRMSEo4SkNk?=
 =?utf-8?B?ekJPTUdqN1VVNE9HbFp4OG5Gd3QwY2ZuZ0JtanEyeXJKUG82SzdkT1AyRlA0?=
 =?utf-8?B?OTY0RXc1OXFPTERHUGczWU1EMHZLekVqWjBtOGF2UDZyMndMMTJPY285dDh4?=
 =?utf-8?B?Z0EwVEVOZ2ZmT2tkTmhJQTVkamsrNnpENFF0aDRQZ1FiczlJNDh1RXludGZT?=
 =?utf-8?B?ZUYrakxxamwrb3FIa2tCRVJ6YS90bEJhYXRSYkVud3NoTDNmdEZGWlBTWjhs?=
 =?utf-8?B?QUcxdEE0UTNiRTU0WHBob2QxNzFhZDdrbkhzUUxsR3N0cFF4b0xoeG9UQjdw?=
 =?utf-8?Q?8PHw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkx3bXExdDNmTTB0aXU2QkdlSWYvMUJLNVVvdC9NZUU4Y21xbFFXUmREdmJV?=
 =?utf-8?B?dXUwTUx0NEVpOWprRUhDZjZPeVRRdlRwU0tCRHhIaDB3REVhaXZYTElEdEhk?=
 =?utf-8?B?OWE2eWtyQ0tXbDYyVnovUUFJam0vVmFtWFROSlhDY2JKYUVLVFlFcDU5Nk5t?=
 =?utf-8?B?RTRiU0k4WUU2ckZveENtdTNBSmUydHJ5U3N2K2JwSndmUkNBOXpiNlByMld6?=
 =?utf-8?B?Qll4MUJHckdXdGNycXlWcnlxbXdHV1A0bjJrWXUwYkpOMGtpVktGSjhjZHVS?=
 =?utf-8?B?eHFxWi9FTlhjTk5MR3JMb2R1dGpDbyt4NlJGcFdzTEIxM01TTkZWZUVDcVVG?=
 =?utf-8?B?d1FvaEw4UFd3STY5Qi9KVzZzS2g2eXRsVTFTSktaQ1J0YTc4b2diZDUwMHZ1?=
 =?utf-8?B?aWxjbm9ZZTArUkhIczY4K2tqZVg5T01BVnl1TGZJdStsNmZmN2FnRVFvRkl5?=
 =?utf-8?B?VEZYQmx3RjEzYUlacGxWRjFHQ0w0OWlaWktNRXdhdUlDOUlrd0FIV29PcFQr?=
 =?utf-8?B?c3NNMUtxdWdFazJqR21pN1lkWTROMHpnYXo1QjBIeWtLNUVMVDdsWm1xbktk?=
 =?utf-8?B?K1FXUnY5KzZ1R1F4a253RmErby9JREp0bzBvMXV5eklSV0hGRGl1QTZMUkJS?=
 =?utf-8?B?UUdsZFdEcXRvTFpkeVljL2E2UFM3ekJyMzc2UjR4YWNGQkJZbWdMN2pOa2o5?=
 =?utf-8?B?Y2RSQlM0ZlZDb1cweUJoUVRSU20weEZScmpMYTIwL2VSYTh2WFBkQ0Z1aTNW?=
 =?utf-8?B?SXhOK1I3c0Raa2c1TmJRTFZnMlZhYnYwcDdUdlBlZ0Z3a1psK09uWStCWEV1?=
 =?utf-8?B?ZnJxZGMzSmtmZFFmMS9HYVZBWUxjcGVHcmFKK1JPSmpVQnVRUVFUTmZPcUxW?=
 =?utf-8?B?SmVtakJ6VVZQNGlOSExRS3hwNUUySGU5Z090ZmN4TzFlQWRWc1Z4OFg4enZM?=
 =?utf-8?B?MThjWjI3TWFjRWNnWnc1bDVYWHFTTzhoR1IwZFdlMkhRd2t5cVlPWlMzWkQ0?=
 =?utf-8?B?WGNHenRZOElKUloyVG8rVk5PNndLbDRPa1lYMDJsQS9VbWwvRHBYM3lPdTZP?=
 =?utf-8?B?YUh6RTFhMVo1VE5BTnl5T09XMDFRaGJtd2lrVExvUGdzdUgwa2hIZzBJRVI3?=
 =?utf-8?B?V1RiNmJJeS9JOW1WYVpiOHltbzJIMk5SYS9PVWZaZCtGeGVpKzQ3RUVES096?=
 =?utf-8?B?YWVYWkZRbVpzSGlGK05reFI3VjZ1QTNXUW5CenZyYkN2ZmQ0cTByZHhHWFlN?=
 =?utf-8?B?KytwVlo5eFBoQzdyNnZsQzRMQytFbGhWRTJrSHZpcjNnamc5TUUrWUtZVGVn?=
 =?utf-8?B?dm85emh6ejliZWpWU2hVc1FTSXBPbXJsdXU1UDFSYVhlQVBBZnFyQldPYUxR?=
 =?utf-8?B?Rkdpd2RkTjJaMHZyZTM1T29VMUJnZGxBZ0R6VW9rU0NrcFBuakVzVVZPUU1E?=
 =?utf-8?B?WmI3MmZ2d2Q2UDNiWGljbEdkcXpXT2s2c25UTW9UUUV1cEx3MmpMNnpGMUFi?=
 =?utf-8?B?SXcyeVZQcnRMWEZTOHNQZk8zYXdMQ3Zzc1daMVRTYlJ1NEFnaUl4TEd6TUZY?=
 =?utf-8?B?OXdpV0x6TkJTVEFMNkI4dVROOGxKTm1YWm5KejIvTDJUclFVcTZKVWFXc3ZS?=
 =?utf-8?B?RGpMbDh2RWwxWENjSXBYVk5zaTRidGdRUGpoTm1KcHZzcENZcHZyWVZrTWxF?=
 =?utf-8?B?S3Q2bmJ0SGV4bDlqVUZZV1NNSXFkeXBrUDlVTXdwbzBZV3drbzZLK1lCRFhC?=
 =?utf-8?B?QkRiQjhpbDN1MkFyZk92WXh3R1ovNExPSHczcmJGTVZCYmV6MzlDaWUwWVZt?=
 =?utf-8?B?cVNKQzh4VWxwekd2bUdqbW1hbzBwVjJGcDdsSTVxeEhJazltQ3VZVXpack1w?=
 =?utf-8?B?YjdXeWxuS2l5aWUyU1ZrOGNYMmMweVRTbm41T0hHanFtMmRlZEhveXNla01w?=
 =?utf-8?B?VFZTMGptSDhzYjR6RHp1MXlmUjNsTmp5YWpwSHdvTVUxbzRXcmVkODh4bGJl?=
 =?utf-8?B?dTI1TlExaG1wc2IwSmFyVCtoMldjMkVnOE4vQWt4ZlJwNDFEUlliR09VVUFP?=
 =?utf-8?B?UWNudnRDWkQvNDlLLzJhWUFLanV5UEJ2UGFLWnJnTGpqSlEzdWVVcG93dDNi?=
 =?utf-8?B?akVSUGhvTVQ3a0R5TUR5S1VqTGhiWk1sU0Nsa1hzR2lQSkRlUXJaUmF1NjJD?=
 =?utf-8?B?OEpZR1R6YzRLYUZNdjFQak9qUGZKT215K3BCa08weVYxT1Exd0djRlFxc0FC?=
 =?utf-8?B?UnpEdVRuK1doa1Nub0xVTGJNblYzMXNoZDZyTzRadXRjejBxU0lFUVB5YWVr?=
 =?utf-8?B?b3FUMUVaZUtrbjgreGp0N1lWSy9UWjVsZUhpcGNQVnZzUW8wRTRMZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b5d62a-7b07-412d-75ee-08de6e274328
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:20:04.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yFSwQXssShqS1BNfKeCfXDFZpOzZOTxzR6t5cvgo4Q25IRq0UB8BhIwleIw4Yqx2OxqQT/95JRW8xBGs+uijw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12208


On 2/17/26 14:59, Ian Ray wrote:
> @@ -72,6 +72,18 @@ lvds0_out: endpoint {
>         };
>  };
>
> +&gpio4 {
> +       gpio-line-names =
> +               "", "", "", "",
> +               "", "", "", "",
> +               "", "", "", "",
> +               "", "", "PWGIN", "",
> +               "", "", "", "",
> +               "", "", "", "",
> +               "", "", "", "",
> +               "", "", "", "";
> +};

Looking at my latest version of code this node should be a little bit up in the

file to preserve the alphabetical sorting of references modification.

e.g

+&gpio4 {

... then

comes

&ldb {


etc.



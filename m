Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50BC218827
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595930; cv=fail; b=Ejc4ndlzu/Us2yJqOJzYz/IBfIGBOsnnceZ0xJR/1mxpdnW+Yl+bo/1gJkQKVN8/vU7r0vDQ7M52cfab9CR6ZDkMc9URjjUUHG8qY2zUIhDVimU9+/UqUJcdSVnSqe2OaM1EnOOUWUV0ToLGtdgKZZjl4WsXVNTzHUzZySHK5Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595930; c=relaxed/simple;
	bh=AF7DDdD9TO+At4H9LEQ0Ec7oewEEjItryMmgFaa4WSI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BZrJUv2TJ78PdWcMukCZDU6FLymsZSj5VKCRQKp9wM7+tKPZyC7DZ4G6wZM6oPmCna16Rau8ThSkomFN+3SXdVEtPPvGd3rpGPV8y0MKrkImkY3xlDOsn9WHs3HsVTI98pOD5a/JPs6jV2/GaYsXSCL8Y4ronIAtaDbUQEhI2Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LFDU/Ms9; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LFDU/Ms9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDHD90LKSehhbF+KP2a0vjk66RVdqJGhkZrI2dLi6CF8QYcec36YFO0x9kj46bQ71xLQ3YH7+znsBobJHgdqOSbmdcERHGUyvLgn67oFJ5WQzXkc/B3tZfrvLNIAz3JH7iGRhf8ra6QOc643wSij1BFuMH5Cim5LLxxMwYIyZxXxn826Lnse87n6fIF3yn6O1RbEyo4ZXD53E/dh1Fk2H/THt4oBqEiRObcFqinYBxZO2ZZssSiSPYVPJEYSNdTO3L+GMdT2OWTI5BfMFvfDcSyi8d0oOgqBsINiKGm55NBPRrFFPYHGq0ugrIa7LoxoTNSsCbdFuLf6ZR4QaSs/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlnloQ/JiOlm6uqYrtKp75tAgz6nYdwAps8q3SPJm7Y=;
 b=HWTvwiEgyAsxoXOrW58e9egXbR4m/muZS4fSAqAEc/zSNL6J86/098esSstI4nsAQJgnbfpU0p+0wYrQA0tTlBqJOrrXYQj0yhi9PvjXsrPUmJe6xj5UUM44LQKqUYnyfEhwHsYTt78ozBJ6/0q3MDW4X7QPjkKANADqvG1Ts33ezXD1OeXQ86HJCxi9efBCyPMPrA7H9gICnkANlkrxhOOSjRN346uPrE9+rf3/4s3WSIflA02w6J8csh1yYI6X5J7Jdmws766ku2ZHoLLBsyEW3/0Yv/R9LnC0CwLXPqL/idPI3g6GtCTh/vzBdrdP49rzvoCqlXR8C/5uo0LAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlnloQ/JiOlm6uqYrtKp75tAgz6nYdwAps8q3SPJm7Y=;
 b=LFDU/Ms9cVWK4R9eoE+8k0ygvTrv4S8pW9SW+c6BanejphABAS1DnkezjhyLsHlN62HFli/YQxHNLz9kKJ959rQkmCSM2ICWRGlxZQ69OPRLz7G6A6xmuo/jyGUK4Z90xOCesW9Mn7gTpcQaLoU1+yDHXk/XMMuW5Q4RlN8kcalG6nDfsVz3ToUlVlTYYxf2Eht2yVTzOKr9sk2k5ecsz3pMi/oFMVN96gOD4NENrcKxtlYnqeZToOrS+ush6t5RN0DcK/P0WNrl6J6s3HPe6PXS1z175gNPQ5CSLR3D8xTzMLZjjWprrzHSj12EJa5ZlC2taUREdkLW1XfUpoMYMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9245.eurprd04.prod.outlook.com (2603:10a6:102:2a0::6)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 08:12:02 +0000
Received: from PA4PR04MB9245.eurprd04.prod.outlook.com
 ([fe80::7e23:109a:9a0d:875d]) by PA4PR04MB9245.eurprd04.prod.outlook.com
 ([fe80::7e23:109a:9a0d:875d%2]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 08:12:02 +0000
Message-ID: <a31ecf12-96f6-4e4b-854b-6b8ba40a3c38@oss.nxp.com>
Date: Thu, 19 Dec 2024 10:11:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: s32g: add I2C support
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20241213142250.2532559-1-ciprianmarian.costea@oss.nxp.com>
 <Z1yH7BFbYuJ++Vd1@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z1yH7BFbYuJ++Vd1@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::14) To PA4PR04MB9245.eurprd04.prod.outlook.com
 (2603:10a6:102:2a0::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9245:EE_|AM9PR04MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 54481399-1703-48dd-e5a6-08dd2004d174
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWFtbVdiblhaa2FIWFVvUThmd1N0MXNWdUJEbWUzU1FvUEs5Zk03K2s3K2V0?=
 =?utf-8?B?aXB2bnQxQmhsZ1RhMEU4U1ZWRVc3dUR4WEpVKzVGTFpSNUpaM3I3QUFkNmZ4?=
 =?utf-8?B?akliMWdBbnZWSXl4Tm85MGsxK3BpenpTY2pVUXUxUWFXRXRJNzZRSi9aYUNP?=
 =?utf-8?B?UldKK2tKM0Q0ZUFUTHZaTEdlUFFoa3d0VUowdkZBaTV4RnJxQlhobXFYNDRN?=
 =?utf-8?B?NzZxT0tad3JOQ0Q4MkxMZ1RrekgyalZxOWlPaVJra2VWN21qRmt3K3VPeXRZ?=
 =?utf-8?B?U1Fpd0hQMVc5eTdYUVZBc0EybnJrYzBpNk9mbFlhMkp0dVErNkhuWlNqUnZE?=
 =?utf-8?B?SWZ2TEVhSkF2YXE4anJUbVAvWWFsNHZpZ3dubmQrNExpYVU2ZmVTR0FiUzZj?=
 =?utf-8?B?WXozaEdqYnE2VjY1QjU1aTNKSVJtckZUUG42QlA1cEZLTUVtaFVlVFEvOUNE?=
 =?utf-8?B?NWExSGtwaTliQ0ZRRUhEb1c4cE8wWjdWUWNmbFZFZkdZVmFSVjVNaFQzREJJ?=
 =?utf-8?B?Y1lDUXJzMFU4RHdkUUhyRlhQTml1WjFkeFdPTGUxUDI2RXRoSEpFdlE0akRQ?=
 =?utf-8?B?K1pGWjB2engxY2dDSzBMUEVjd29uVUlmaHN2clVWNUczV3p1ajhLNkxoNkVB?=
 =?utf-8?B?ejFub2dWS3ZIcU8xVFdZR01PR3EzRXYxdjdhVXV2VFM1SzZRRTgwYURrZ2NO?=
 =?utf-8?B?Z3RTN3YyTTM1MTFDbW55dkFpREM2aTdqQnd1anNPaCt3aTV6S1ZkeG4wY3RO?=
 =?utf-8?B?c3RuaTdBeWt0ampHSW1aL3BuZmp3NDAzNFlxaHJMNDk1NThCV2RpUXc4S3JI?=
 =?utf-8?B?V0xQSEN6a1RwNHVIei9xdnVxc2h6WjZSSlMwREt2VGFXcVhIS2VzOXAwVWJ4?=
 =?utf-8?B?Yi8yTVRQVFZKbEMxYms1YllMSlJ4T3VYWlZ2NHZmUmtHeHBzeFpWM2NmRFk1?=
 =?utf-8?B?K1pxcXpyTGt5YjVZaFZpOGhPN0FqL0tXeERkZjVYNCtzbTcxcWp4S0MxN0Qx?=
 =?utf-8?B?SDVuY0krUUhWOXhnY0JjSFlRWXlFM29NTFlaM2FOeWlsblpNZVVrSmtrZUVY?=
 =?utf-8?B?bFJPWFFreURFS3Jwd09uZVJuS0djcXFMMHU0Y0ltZUNrMmFGMEJYa0ZsN2Q0?=
 =?utf-8?B?Z3B1QTk2b2ZNWmg4Q042cURrbGVhdUttc0dYa0NQeWdkMXdpWHJkUW5adnY0?=
 =?utf-8?B?djBVQlMvMVpuQ3NhMXY3NFFwUEdhbHZkZzViRlFCdVFrR3d5TnFpRjltZ21P?=
 =?utf-8?B?TWtFTmdtTStrNHBnWVlvZUM4ZGVGaEE5YVlUcWc2ak8yTTlDeUxJbzBLdDly?=
 =?utf-8?B?WkV4MG1sY1BhTEdQQTllcjVwUlkxYU0vZkxWcTJLYkdkdE9EQ1NnRjAxdkF5?=
 =?utf-8?B?MU00OUJUdjBVcm5WTUdyNzU4am5pQ1BnR2RzR01XT0FOdjdjRzhyQkNHQ0JL?=
 =?utf-8?B?enFYREVYZENHOXFJMml1K3RxME9DUklFVk95RHdrdGx2cVRDaXZEY2JUdjBU?=
 =?utf-8?B?SW1UckVyV01UUTlveTRJelJ2dGFzVnM1Sk1TTkdqVnRhSFRGdVVjQUczWDJI?=
 =?utf-8?B?eGVXS1p5cmNlTWRQeDM0eGtiMUQrNGNWc1I4VXFxWVlNSnl3QnhXRUhjMFd1?=
 =?utf-8?B?bHpNclFJWU02WEE3TVBjQzJ5Vnl6ZmlvZXB5NE9wMFpiQXFYYlZBSlgxSW1W?=
 =?utf-8?B?OEd2ZmsxU1BTNHJKdEV4eTcxZ1A5NWRSS253OEtxM2txK0tUMTZRYmt6VkE2?=
 =?utf-8?B?WVNNM1JkeEV5ck1wMUd4Z0hFY1dqZWZ5SW5OZStkZWovSzAvNVRUc0ZpSjUr?=
 =?utf-8?B?QUJnL3d3Ungyd1ErZVpGL1QrcVBpZlQrTTdFS3dMbVZmVzhYYzZlcEwrdkND?=
 =?utf-8?Q?0UpykpcLcgLJb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9245.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXUrZ2RSMXhZRFVPYzhyZXJLM0NLRmpvNE90ZmlMOS9XSUQ3Q3I0YmczZzNC?=
 =?utf-8?B?RkMwNk0zdzkweFRYQWY4YTVuTVZUK2c5RmtTMW5WYkdhQnV1T0pqSW9HdU5E?=
 =?utf-8?B?ZEFyUHV2SjhNcU1KNk53ZEZISVV0SDNyQzR6QWR1OTJWN0ZGdkhPcTJxRmdS?=
 =?utf-8?B?aTlRMnFCOUdIcUszWkt0QWl6OHJ4SGk4UDdlUUFDSVRKS2pjOGF3VXVWd2Fk?=
 =?utf-8?B?SXQ1Y3d5L0Y5QStiVEFQYjJOSWx5Z29adzlHWUQ1MkNiZUZQVWEyV2lnNDY5?=
 =?utf-8?B?eGYzcXFSaVEzaXo5dWNJQkx2MklTZUdrNlE3SHNoK21YM2J5czR6VGR6QktU?=
 =?utf-8?B?U0NvQlNCaEh5QVl3eVpFUzFTUjhwZHlJU1NWVFdwR00rRU5lVWlyZWlLOFVE?=
 =?utf-8?B?dUtBd2I1SGdTNHJQckg1ckVvRFJ1cjFCUXNaV2VCdktUeUxQL293Sk9oQ0RK?=
 =?utf-8?B?ckJHNm1CVmlxeVpZZy9YaVpKOEM3N2YrQ0pnd0kydGRoSm9TOU1EMzloT2dX?=
 =?utf-8?B?K2psNW1GanlKTHFnUEdaTThWRW1GRkJIcEdwR0d4T1E4T1p1RnRhQU4rZm5I?=
 =?utf-8?B?QzVtRkFmVHcrT1FTMTlvTU9Xc1B5Y2x2UC93QXZjNkF2TkZGMFhKQUxXZmt4?=
 =?utf-8?B?bUZxTk9leVYyVkdBZk8wRStKVWswY3M3emFBZDlpSGwwVmR2RWhSOUtOOVlF?=
 =?utf-8?B?aHV1Q1FmRW84N1RWdW1uN1RrSHhwdjRpZE5BWTZNMW1kcWMxTEVkQVFXcGpI?=
 =?utf-8?B?TzNWZXF3U2dWN1lITG1pQ1BzRjhpQ1RSMGtpbXBZZGJwbnIyeVFkSjR0bjEv?=
 =?utf-8?B?cnVYV0Mxb1JMaEYwczczeUNpWHVVTnVyQ2JqeGU2QXB2ZXpjaHgya09FcVJi?=
 =?utf-8?B?TGFlMzVvQ1o1czhiMFdzWGE1eWFKVyszNEVlckwyS0w2c1RQY0FzOEtPVVFy?=
 =?utf-8?B?KzkxY0dCUFI3ZXJma0lYWHNPaW1OWHV2bnR5SFlqVGI5L3diWGFzMVpXTGkv?=
 =?utf-8?B?SzdEbDF5VC9SSzFJZ0JyNXlwYWMwakNjY0xLeEZFWFJCVXlKZ2ZRMklkdnd2?=
 =?utf-8?B?dUk4b21VM2lQZk9CcXhCMEptTHNDNm5JdWU4MXl6MVpDWjd3VnhtUkdqQ2Vk?=
 =?utf-8?B?UUFySkFPbVdkM2REWExLUm1XT1Exby9ucDBXSlNjdUlneVY1N2ovNTVwSXh4?=
 =?utf-8?B?UU1QeGFUNmFIVjJSOFFQckdCZUpSUWxiZ0ZsQ2psS1VRRTlkTG1INU4waTZn?=
 =?utf-8?B?d0JzUFdaUnRldENmdnU2OHoxSnR1NlF2NmMwbE5vVVFNOVpkdTFCTHRGVmMw?=
 =?utf-8?B?dElkYmdRS3JNUzN0S1RLRGsvUkZSME9jNVgzWFRsdXNYSUlpR0FjWUpmektE?=
 =?utf-8?B?YmtzYTF0Ly94cURHRHM4MW9rODNrTzZRMzBjNytJSTM1NVRqYVlZblZiL1M2?=
 =?utf-8?B?MldiZzdmT3U3UHFIRkRVa1JkQ0J0UG5wK2M2aUJHNmNsR2d5S3RLNnNDR2VZ?=
 =?utf-8?B?S0lsR3pJWWNSNmsxb1VDMW42UEFnYzhlb3QvL0MrbVZGT2hSTjZzKzJKTFl3?=
 =?utf-8?B?VjZTKy9SMFMvK2RjUWZSQjNxMzZRRzAySHhzUVBHbXB1aDRGQ3dobGlYQmRi?=
 =?utf-8?B?bVBBRkJTbWc1UjNuSG80OUZrQlhldWpUY0Z4NWJlU1dSbDNySkt1cFFBSEFN?=
 =?utf-8?B?aTd5WFo2U2N6eFBONTVsWlkzZ1pFZldNdTlvbDNOYjZ0cjY4YkdEQ3FBT095?=
 =?utf-8?B?dnlROVdEREl6QlNuWkRBa1Nlekd3c0lwZ1lzeGFJQ3BUNnVIYlhVNWN3Smpn?=
 =?utf-8?B?Z0xmRzY2R2p1emlVQ0MvdHJkbXorQWpTaDNqUHIxa3h4SUtIK0l3ZExNc0VY?=
 =?utf-8?B?YytHRlZzMXdUOVBEMVVqNU91VTdKY3BHSngweXdKYTdkcnc4ZmszQ0lKK29Q?=
 =?utf-8?B?cWlXbS9aNjBaRFhobjdoTC9NZzJRUE4zcFJ1Vnd6dWpKcVlIZk9oQzZMN2x2?=
 =?utf-8?B?NERTbWdFZTZOd3QyckZXR09CSzZoMm43R204c0lQR0xUN1FNOHZQaE1leDdN?=
 =?utf-8?B?aitnOEVCVU1ZTzVpWU51d1dPUFQ5YmZpSVFwK3NLY3dHN3FFWWE5cWE0Q0ox?=
 =?utf-8?B?NzZLUjFSK0o3WFRXODYwdENOYTJnZ0tvcVlrQWpGQ0V4T1dHai9pc1YzLzBS?=
 =?utf-8?Q?fWvNTm/vd6dOQAnmCpYPerY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54481399-1703-48dd-e5a6-08dd2004d174
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9245.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 08:12:02.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2o6IU6L4viA9X0/yR7onobgtsoGOrE5UCOt67lHbr3AlEKhWWxBS2fNJjOTtW9mt8B/8sskIovtDl4X+D1A2SDtTIAvZxpTZRfdlwNlp8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825

On 12/13/2024 9:15 PM, Frank Li wrote:
> On Fri, Dec 13, 2024 at 04:22:50PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add the I2C Devicetree nodes and pinmux for S32G2 and S32G3 SoCs.
>>
>> With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
>> (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
>> are quite similar. The common part for the EVB revisions will be
>> centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
>> be placed in 's32gxxa-rdb.dtsi' file.
>>
>> This refactor will also serve for other modules in the future, such as
>> FlexCAN, DSPI.
>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
> 
> Change log here!

Hello Frank,

Yes, I forgot to add it. I will add the changelog in V3.

> 
>>   arch/arm64/boot/dts/freescale/s32g2.dtsi      |  45 ++++++
>>   .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
> 
> Shawn require board dts should be seperate patch
> 

Sure. I can break the commit into two parts (common & board dts I2C 
support) in V3.

>>   .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
>>   arch/arm64/boot/dts/freescale/s32g3.dtsi      |  50 ++++++
>>   .../boot/dts/freescale/s32g399a-rdb3.dts      |   9 ++
>>   .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>>   .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 126 +++++++++++++++
>>   7 files changed, 382 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index 7be430b78c83..0e6c847ab0c3 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -333,6 +333,33 @@ uart1: serial@401cc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c0: i2c@401e4000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x401e4000 0x1000>;
>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c1: i2c@401e8000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x401e8000 0x1000>;
>> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c2: i2c@401ec000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x401ec000 0x1000>;
>> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		uart2: serial@402bc000 {
>>   			compatible = "nxp,s32g2-linflexuart",
>>   				     "fsl,s32v234-linflexuart";
>> @@ -341,6 +368,24 @@ uart2: serial@402bc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c3: i2c@402d8000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x402d8000 0x1000>;
>> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c4: i2c@402dc000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x402dc000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		usdhc0: mmc@402f0000 {
>>   			compatible = "nxp,s32g2-usdhc";
>>   			reg = <0x402f0000 0x1000>;
>> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
>> index b9a119eea2b7..c4a195dd67bf 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
>> +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
>> @@ -7,6 +7,7 @@
>>   /dts-v1/;
>>
>>   #include "s32g2.dtsi"
>> +#include "s32gxxxa-evb.dtsi"
>>
>>   / {
>>   	model = "NXP S32G2 Evaluation Board (S32G-VNP-EVB)";
>> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> index aaa61a8ad0da..b5ba51696f43 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> @@ -7,6 +7,7 @@
>>   /dts-v1/;
>>
>>   #include "s32g2.dtsi"
>> +#include "s32gxxxa-rdb.dtsi"
>>
>>   / {
>>   	model = "NXP S32G2 Reference Design Board 2 (S32G-VNP-RDB2)";
>> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> index 6c572ffe37ca..666e4029e588 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> @@ -390,6 +390,36 @@ uart1: serial@401cc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c0: i2c@401e4000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x401e4000 0x1000>;
>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c1: i2c@401e8000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x401e8000 0x1000>;
>> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c2: i2c@401ec000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x401ec000 0x1000>;
>> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		uart2: serial@402bc000 {
>>   			compatible = "nxp,s32g3-linflexuart",
>>   				     "fsl,s32v234-linflexuart";
>> @@ -398,6 +428,26 @@ uart2: serial@402bc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c3: i2c@402d8000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x402d8000 0x1000>;
>> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c4: i2c@402dc000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x402dc000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		usdhc0: mmc@402f0000 {
>>   			compatible = "nxp,s32g3-usdhc",
>>   				     "nxp,s32g2-usdhc";
>> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
>> index 828e353455b5..5f8739c068c6 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
>> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
>> @@ -8,6 +8,7 @@
>>   /dts-v1/;
>>
>>   #include "s32g3.dtsi"
>> +#include "s32gxxxa-rdb.dtsi"
>>
>>   / {
>>   	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
>> @@ -39,6 +40,14 @@ &uart1 {
>>   	status = "okay";
>>   };
>>
>> +&i2c4 {
>> +	ina231@40 {
>> +		compatible = "ti,ina231";
>> +		reg = <0x40>;
>> +		shunt-resistor = <1000>;
>> +	};
>> +};
>> +
>>   &usdhc0 {
>>   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>   	pinctrl-0 = <&pinctrl_usdhc0>;
>> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> new file mode 100644
>> index 000000000000..a44eff28073a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * Copyright 2024 NXP
>> + *
>> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> + *          Larisa Grigore <larisa.grigore@nxp.com>
>> + */
>> +
>> +&pinctrl {
>> +	i2c0_pins: i2c0-pins {
>> +		i2c0-grp0 {
>> +			pinmux = <0x101>, <0x111>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-grp1 {
>> +			pinmux = <0x2352>, <0x2362>;
>> +		};
>> +	};
>> +
>> +	i2c0_gpio_pins: i2c0-gpio-pins {
>> +		i2c0-gpio-grp0 {
>> +			pinmux = <0x100>, <0x110>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-gpio-grp1 {
>> +			pinmux = <0x2350>, <0x2360>;
>> +		};
>> +	};
>> +
>> +	i2c1_pins: i2c1-pins {
>> +		i2c1-grp0 {
>> +			pinmux = <0x131>, <0x141>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c1-grp1 {
>> +			pinmux = <0x2cd2>, <0x2ce2>;
>> +		};
>> +	};
>> +
>> +	i2c1_gpio_pins: i2c1-gpio-pins {
>> +		i2c1-gpio-grp0 {
>> +			pinmux = <0x130>, <0x140>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c1-gpio-grp1 {
>> +			pinmux = <0x2cd0>, <0x2ce0>;
>> +		};
>> +	};
>> +
>> +	i2c2_pins: i2c2-pins {
>> +		i2c2-grp0 {
>> +			pinmux = <0x151>, <0x161>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c2-grp1 {
>> +			pinmux = <0x2cf2>, <0x2d02>;
>> +		};
>> +	};
>> +
>> +	i2c2_gpio_pins: i2c2-gpio-pins {
>> +		i2c2-gpio-grp0 {
>> +			pinmux = <0x150>, <0x160>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c2-gpio-grp1 {
>> +			pinmux = <0x2cf0>, <0x2d00>;
>> +		};
>> +	};
>> +
>> +	i2c4_pins: i2c4-pins {
>> +		i2c4-grp0 {
>> +			pinmux = <0x211>, <0x222>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-grp1 {
>> +			pinmux = <0x2d43>, <0x2d33>;
>> +		};
>> +	};
>> +
>> +	i2c4_gpio_pins: i2c4-gpio-pins {
>> +		i2c4-gpio-grp0 {
>> +			pinmux = <0x210>, <0x220>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-gpio-grp1 {
>> +			pinmux = <0x2d40>, <0x2d30>;
>> +		};
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c0_pins>;
>> +	pinctrl-1 = <&i2c0_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c1_pins>;
>> +	pinctrl-1 = <&i2c1_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c2_pins>;
>> +	pinctrl-1 = <&i2c2_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c4_pins>;
>> +	pinctrl-1 = <&i2c4_gpio_pins>;
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> new file mode 100644
>> index 000000000000..50fe6aaa1605
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> @@ -0,0 +1,126 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * Copyright 2024 NXP
>> + *
>> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> + *          Larisa Grigore <larisa.grigore@nxp.com>
>> + */
>> +
>> +&pinctrl {
>> +	i2c0_pins: i2c0-pins {
>> +		i2c0-grp0 {
>> +			pinmux = <0x1f2>, <0x201>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-grp1 {
>> +			pinmux = <0x2353>, <0x2363>;
>> +		};
>> +	};
>> +
>> +	i2c0_gpio_pins: i2c0-gpio-pins {
>> +		i2c0-gpio-grp0 {
>> +			pinmux = <0x1f0>, <0x200>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-gpio-grp1 {
>> +			pinmux = <0x2350>, <0x2360>;
>> +		};
>> +	};
>> +
>> +	i2c2_pins: i2c2-pins {
>> +		i2c2-grp0 {
>> +			pinmux = <0x151>, <0x161>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c2-grp1 {
>> +			pinmux = <0x2cf2>, <0x2d02>;
>> +		};
>> +	};
>> +
>> +	i2c2_gpio_pins: i2c2-gpio-pins {
>> +		i2c2-gpio-grp0 {
>> +			pinmux = <0x2cf0>, <0x2d00>;
>> +		};
>> +
>> +		i2c2-gpio-grp1 {
>> +			pinmux = <0x150>, <0x160>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +	};
>> +
>> +	i2c4_pins: i2c4-pins {
>> +		i2c4-grp0 {
>> +			pinmux = <0x211>, <0x222>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-grp1 {
>> +			pinmux = <0x2d43>, <0x2d33>;
>> +		};
>> +	};
>> +
>> +	i2c4_gpio_pins: i2c4-gpio-pins {
>> +		i2c4-gpio-grp0 {
>> +			pinmux = <0x210>, <0x220>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-gpio-grp1 {
>> +			pinmux = <0x2d40>, <0x2d30>;
>> +		};
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
> 
> I remember I have said "#address-cells" and "#size-cells" should be in
> dtsi to avoid copy it at each board dts file.
> 
> Frank
> 

Yes, and I've moved them from board dts into a common board dtsi, which 
is the newly added 's32gxxxa-rdb.dtsi' as per commit description. This 
way I am not duplicating any such info in 's32g2.dtsi' and 's32g3.dtsi'.

Best Regards,
Ciprian

>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c0_pins>;
>> +	pinctrl-1 = <&i2c0_gpio_pins>;
>> +	status = "okay";
>> +
>> +	pcal6524: gpio-expander@22 {
>> +		compatible = "nxp,pcal6524";
>> +		reg = <0x22>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +	};
>> +};
>> +
>> +&i2c2 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c2_pins>;
>> +	pinctrl-1 = <&i2c2_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c4_pins>;
>> +	pinctrl-1 = <&i2c4_gpio_pins>;
>> +	status = "okay";
>> +};
>> --
>> 2.45.2
>>


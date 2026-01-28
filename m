Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020135.outbound.protection.outlook.com [52.101.69.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C77367F34
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.135
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612467; cv=fail; b=gsKHjF32oz/1LFzjRq8ZCM0WxeNuTA6XS3M3yu1kTMYXvmVAAA1YRlkSOMGtLIFiyM1nOCpbXVsMsDYceEd+JxN9Ecm3ZUY4ziQHIDe/P70egl9PbLqIAIqGUTRrBn57a94xixe7c3Y0kMK02tgAFe78O0saHGP7/lprwQavMUI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612467; c=relaxed/simple;
	bh=apF90Ju7rz/60aX3naelCN6phNuKeBWXXZNifibsbEU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=abi5/PUMbw14l/y/MXHZw8h1lfM7VBpIwcT0LTL99sJngDdtLrPGqX2K7w614Q9drOr9PTAQOkSkvPpGsXleb4s0GGJrSP9c4Y3WNRCdqmZpf3O6G28RbWHCzVq0irjM7LoHM7pnAHhCK2GX5D12cun5sGyfxhxGOnFLHsfm+f4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NTmOPWNZ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NTmOPWNZ; arc=fail smtp.client-ip=52.101.69.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NTmOPWNZ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NTmOPWNZ"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JG45Hr+pNObUIP5o/pUPFVl9inxOx6DCkmwm2vVh1I1uX6Mng7htxz3GoAuNRKRhoj2PGC728dvO4QtRyJZKPPUsIg8xN0x0vTmaqFokmq1u1d6nfCOabci13451zUsEhbcUq7Hyj7WedENgpscwPHNbvXJv5q+5XRGpwXp0kbm53UMDtwWqv3KOQUahHVJ1I10q2zkgwp5CMoCRzMLnK+ynfWQykZ1GhFBZDzfXftA0//bZcXPRObDady/T4WZ2b7IkJ7INyWtOfbLlV7ypGqf2PxtwSe8s33WG2uBbawzXqghuTkx56kUTOoaSs863yEJfjG5E/MIsMa5+aM2K/g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apF90Ju7rz/60aX3naelCN6phNuKeBWXXZNifibsbEU=;
 b=Fm/zP91EU3YEKG27okLcv0isLLL38rf/lqzjxk0V/xR28qbXvA7hwPHsPmAMTDctDajxdPukMrwweQVhdx1EqDRf5MU7y07c0TggMD/QidsfRSSkXt6I8aLJH64hG/LQdKStoPKCHw0ubniaK+WrWq16o8zzeygOiJdv2/bilOxYpppOdvGvHyfX+RFi8MBzBD4KDrYuVa/OMhHdsINPkjf6Z7DMzx7nw5bh3jRB0CwGgpnWvRHze/YX030hX1MN0fxYjPTnjR2KE1mh9EC1HxOkh8VIYBCJ1VFc5yZzV1MiLZ329//VdpLawL4Feuefz+OGAcmuTKRhzu7r56b89Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apF90Ju7rz/60aX3naelCN6phNuKeBWXXZNifibsbEU=;
 b=NTmOPWNZ/rdZ5SnDCkc6Bgon3crp8Msejlh7mpdta9d3A6BnjyITolIWjJKNcPoytM6VBmjyZYrVndfMAC5SVel/+93SCeZXyfedZ4R0r4gXNlvgYm1/0L+RfYFiIZU+p6FZhh1dPWfOzKjUfsvDjWy/LjH7mo6npKkJ5iXNoR4=
Received: from DU7PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::22) by AM7PR04MB7047.eurprd04.prod.outlook.com
 (2603:10a6:20b:11b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 15:00:56 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::85) by DU7PR01CA0026.outlook.office365.com
 (2603:10a6:10:50e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 15:00:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 15:00:56 +0000
Received: from emails-4404942-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-51.eu-west-1.compute.internal [10.20.6.51])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 06405806A1;
	Wed, 28 Jan 2026 15:00:56 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769612456; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=apF90Ju7rz/60aX3naelCN6phNuKeBWXXZNifibsbEU=;
 b=O/8l3FohZO+lRtmUO/h6XmNc+c2aG0r4tLXRvZN17JlwN4K/kjOkTzH0h9u6x9gsWkmP0
 h8k81FvknCh3HlWlOPbuxl96NxUy5sXM6EZdLuw6E4dXt1cCNGAgPHBQFldvlW0ZwMpvC66
 2IFJwepPkXqoCQYRdysKErdICLDDRsY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769612456;
 b=pMCNJMXNS1aVjI25VOzjCgOwA8j5Y9504zREnQ0HpL/jzv6XD+921Z+px4E7QDMfWoTr9
 GgR/chSw/xVaRW2mPGvo4B1w/bS/4iINmGBOQKS+m0xC1fi+/MQBSZbi6TMoMggJa74Hlmf
 7/tro+TBvCdg0qdzejRyXFlEYvN5ODU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx5SJ65EJi9Zu2sOQwai9cYowFUH4/Y8zyUrJNE5FJKzvbzkenBHoxTny2Uv+g636KhKletuHp9cvbkYCWl5Al00sBnv8byxwiYuSRtl4I0hE2bch6nBYN+1uYVRMjmgBRQ2EwM+glsghabvmLiQY+meDVCpZInboHBIMNkdHEq0edRv3L9Fb2qtVO3TqslDSeloN9A6TLWO0Mmz0n5zVo7AVgxZSxE4kJKXrM3N1HrzLubLHjIjEPErJTWkzwZBVWpvIsGoubAuhJCXn6sLHhyVyhmCxkr/qoUsr2Co64XrUck+yqQuxw7VMmQxtPJ/XsWiLP+8uVr+zEnR/RuyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apF90Ju7rz/60aX3naelCN6phNuKeBWXXZNifibsbEU=;
 b=Zzys3KTD1yW71MAL3dEN4hlv5ub09dDOq2q4+bZBwKconhdZwcksrAB/EztHCPIApUvLW4GQPOvHhpblT8CCSeJgz/ipymcKR8oYLYpydxInAU3BQPM5hc6GfP0yPAPvLfTqJqy91ReSzHsfx9WAIdcKXg7nWTaVHhFQwLkdPaGOo/gmTRaqjDfau2jHjPAshsbbEg02sxJ2XaGB/d31kDcc+OnfS3tESCM2Tv2laiVbK7uQnuLI5LUo1spVwBB5ParM8Mu+YKmY6hiRqeXBJLWu+9fktKs2ehfJLIe1EnTF3flNE/EphVPshYfwKIEVFVi1oNDqhwx9QNX0EJ9zcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apF90Ju7rz/60aX3naelCN6phNuKeBWXXZNifibsbEU=;
 b=NTmOPWNZ/rdZ5SnDCkc6Bgon3crp8Msejlh7mpdta9d3A6BnjyITolIWjJKNcPoytM6VBmjyZYrVndfMAC5SVel/+93SCeZXyfedZ4R0r4gXNlvgYm1/0L+RfYFiIZU+p6FZhh1dPWfOzKjUfsvDjWy/LjH7mo6npKkJ5iXNoR4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS4PR04MB9385.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 15:00:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 15:00:45 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 4/8] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Thread-Topic: [PATCH v7 4/8] arm64: dts: imx8mp-sr-som: build dtbs with
 symbols for overlay support
Thread-Index: AQHciHk0pYUqFPTMZUuGv6voUzirrrVdFy6AgAqloAA=
Date: Wed, 28 Jan 2026 15:00:44 +0000
Message-ID: <d12da5f4-6c46-4b55-983c-67c2368b1f82@solid-run.com>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
 <20260118-imx8mp-hb-iiot-v7-4-ef1176119a8e@solid-run.com>
 <aXE2MU7728bJ8xjn@lizhi-Precision-Tower-5810>
In-Reply-To: <aXE2MU7728bJ8xjn@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AS4PR04MB9385:EE_|DB5PEPF00014B8C:EE_|AM7PR04MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: af4ada01-e8b9-436c-4454-08de5e7e0a1b
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WXI2WFFzeGV4VXRvdzlSUG9YSTg1cnBDMXFBOHhONG5aRi9aTngyVjdpdnha?=
 =?utf-8?B?UTJPdThYNUVhTU96RnJsNkdUb3FNSVdiYlFEaWxtN3Z3TFFwWmlaekt6OW01?=
 =?utf-8?B?MGxVUWFWOGliNXdNSURsK3FoaGF6dllWMnFZUUNXNUNPQnFMZXcvSGZtdXFB?=
 =?utf-8?B?QXR2NUkyVWY3U0NFOFRIdXdod3hWcEtHMFk2NzhkN01mcG5HVW5nc1J6YktB?=
 =?utf-8?B?Q1pEVHBqeU9PcE52ODY0QzUrd2JlQ294V1JJNWxNM2NDdWZ6WUM1UU0zWFBi?=
 =?utf-8?B?QXBoNnl0dXpRVE1tUFA4UkE3Sk5oVVl0VzJGQUZORkpSTFhWQVhCZ2t3cEwy?=
 =?utf-8?B?SEZmTkdKd05uOEhITlVKWnh5aFpFR2FWWGRDYU5CblZUa0kxNDgxTDh3NUFO?=
 =?utf-8?B?TGRtVUVqUlEySUgyVTQ0Tnh4VDJSY1BzNm9IVDhSM1IrbHJYc2xXb2pEbity?=
 =?utf-8?B?VTBBYUdWazh0N3BQK3ZPZ2t4RVpLOU1LbDVuRHRSYU9NSHV5VUNReVIyZmFK?=
 =?utf-8?B?OVFMUDF4YWt6Q3VzY2tOTDNZTWRuR2JvR0F5WE13QzJrWlVuTVJaUEE5RXFi?=
 =?utf-8?B?MloyMHJhYzZKd1ROeUtuek1rbWxwVC9qcXZjTVpBUzJ2SVNjaUR6YWJXci9D?=
 =?utf-8?B?SFphTEUrSU5mNW9oYzRkeVYzc0E4aDJPMlBzMXRsWGRLUTdFQUdId29jQUl1?=
 =?utf-8?B?SUR4MzFOWlZOSDl5aWRMMDVMV1lZc1RnUHNNcUxiVFJiVlRkVlNQNWJCeWg5?=
 =?utf-8?B?bU84cG52cEdqazhjM2JCekgwZlVGLzlsYmxOR2p0bFB0QWtkRDNGV0w4cGgw?=
 =?utf-8?B?QzVzQytaZTV3WHRhYk8xU2doSGVnQUU3bm1UOFBsSUdFdVhROXNpczVpN01Z?=
 =?utf-8?B?MWRUYkVDQ0tib1k1MlBVMHB5RG94LzhURmc5TWwyMGZzcUxjUFV1K2dHSDBL?=
 =?utf-8?B?ak5ybDRnb0h6b1ZlWEs3bVkrVEVmUGdLN09IVm1UdzdJTEhYZ0pBeGFVNjBu?=
 =?utf-8?B?azRjUUYxK3FRZSs2UHlFQ05uWHg2WThMV3RlRzBBRDZHVXdhZk52UUVvSWYr?=
 =?utf-8?B?bCttdDZxYTl2bHhrTCtWTlgvT0lzRXpjTlMvdS90VHhvRUhZKy9xRHVhUkR5?=
 =?utf-8?B?bSt4UTNCTmYxSFZBdEMzQUNSUnpablBocndxVE81T0JKZUZTd2FXM2I5R1hQ?=
 =?utf-8?B?bDNMUU5PZ2lua3U0dmUyblVRZk5YS1NScTZ0K010cmVVMU50dUU2YjM2akFz?=
 =?utf-8?B?RStwS1d3amhqWlExTlh5cnVsWldVUE5UNXJyem9RQmY5US8rNXhYZjFXQ2Jr?=
 =?utf-8?B?d3BnTytzazRBWmh0am9QVTMrNUg3U1hpZlpxZmNyQ3FBbi9wSHZhU21Na2NO?=
 =?utf-8?B?bnJabUpxQ1hqTHFKTFZQNTdrQkp4a1hrcUljQThqUjN1KzJKVVg3NTJDRkU4?=
 =?utf-8?B?Q3J1NXludWVaNEN0ZG9wRVRJL2tON1U3eVljVEpJRmNxeUZuT0FDYmFJL0pV?=
 =?utf-8?B?UHJ5SHR4dVAyZGIxdGRzbkorRnBXSHJSMHZpWnI3clhZWElXai8yQUgyL2cw?=
 =?utf-8?B?VisvS0FkQVpjUmQ5UDlQRGM1SHZuaXVldWxRQjBHRUtIMGhmSk9mZGk3c29M?=
 =?utf-8?B?TmhpUnFhUGhkWmltTnBFYTJsckNqcDBOY0g0WUswOE1LTUtSTmVISGYvdC9G?=
 =?utf-8?B?MElLc1lRY0U1N1RQQ1V0cEk3UHVqaFZUQ2lyWkNkaE5BSTFiNkNlOTFvOXpS?=
 =?utf-8?B?REJrNmRycWdQUVVlR01kMThiOSszUlNIdUJSUzRQNzljM2xpUndIWlh1dVNI?=
 =?utf-8?B?QTNGQTRwR2Q5RUUxQzB2Zm9PYmxZekY3U1oxd2VOeXNrN1BJcTI0d0psMnF2?=
 =?utf-8?B?R2RtaE1EUWJCbjBhY1pqV2h4ZzVtRXBoY3lKZEZGbnREQnozOXJjUWluTUR3?=
 =?utf-8?B?cm1tL0xGSnZxNVB3bmplSFdPcndEWGd0aW9jSGF1bDNsMkcyY2VBa0MrRDB0?=
 =?utf-8?B?Qm8yY0txeS9kamhReGx5YW1OOU16aVhzTU1kaWlpRnRpVU52Y0RjQ0liUjlI?=
 =?utf-8?B?VTVwdkhyMkcxUk9OR25KYXVGRUhUQUZYT0tQTXdpQk9NVFB1R0doUVlmbEhI?=
 =?utf-8?B?RktzZEJ1ZTRsM1FHYk04dHZCWktNQlpGb3d2a2xEWTh3Q2s3eVNhTUhWakVK?=
 =?utf-8?Q?9LU1dmYjOxLHki933+szCF8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A55A7BDE8E7623448DD8C37A315CF3F1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9385
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a981808748b4491ebb78f9724001d5d6:solidrun,office365_emails,sent,inline:542bd80e4450dd43529c7d8f437737e6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2df6f83f-d8d7-4431-ec2d-08de5e7e036d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anhkUkEyd3JWQXUvYjBLVVNNUkpxMHczcEcyOThsOHZJY0FzaXlyUHQ0a0pH?=
 =?utf-8?B?Qm5aN2ZzeGgweGdqajZoY2pzRXE3SUdXcGZzVGVvcUlYbGJVZGJ5VHVnN1RE?=
 =?utf-8?B?Rk9kZG5IN3QwNFRrMllNY1VzczZTZ3J6WHd5WCtpRFdPNWZwRTZvZ3NjWS9u?=
 =?utf-8?B?ck1Ka0QrRFBwc21LcGdVeGpibUU0eVpYV3BxQTNmQXVOQmpHejEzQ2NUWVl1?=
 =?utf-8?B?TEhFVmYvUjVhbDhPY1hQalI2UzNvQkphM0ovYWVoTVNtRy9teGxYQmlMZUR6?=
 =?utf-8?B?Q1VPOFVoYnh6bmsyazNKUUp6VGNBWk5ZWGNtRy9wYkV6OEEzVmdOUjlXK09L?=
 =?utf-8?B?dkcxcEJsUUVmZVlDUFVxc08zRHFlTlNRSmNUWk9EUXRaRnZOM3c3U0F6Qkls?=
 =?utf-8?B?YS9kNlk2MnU5WlhZNWxsdm11ZGlpTHk3MVRjb1JZMG9SSlF0R1BUdkJVOXR3?=
 =?utf-8?B?VjkzL3lzbXVuN1NVK1JlOG4rajNmYStHUGhVUWNGZ0ZpMkVHU3JqaXJSQUJR?=
 =?utf-8?B?QWhBUDEyc2F0cTl4RTFrY0xteklSZlk0dkp6M1ZIeUhXTVN3N3RpUmoyWWRi?=
 =?utf-8?B?SVV0Tko5TDh2YVZSYkg1Sjg4bmQ5MEhWOGQzTmhZUFU5WGxTSFkzdGxXQTBz?=
 =?utf-8?B?UGg5SklqNXdDS1BwU1ZMdC9STGl0b2xMa0F3ZndBMlFhWHc1a2wwNElsMXpV?=
 =?utf-8?B?ZzdxanFXSm5Ealk2V2lMOVFXa2lwdHFyOFBNako4VFJvdm8way8zK2VucFZN?=
 =?utf-8?B?cm55TktDbFRZdVhzdUpkblJuT0tkbDNFOXlNQnEwZkJXSmpCbVZkeGRZb3Ry?=
 =?utf-8?B?bkMzVnVvcTl5eitUZUxGQnpBV3FwbGhPaGsvYktlaFhWT2NtbVNvdFRZR3NZ?=
 =?utf-8?B?QVNxa2pQWVk0QiswMGtkb0NRR3Blb0dFTHF5eGtOMVZIdk91YmJ1T3lOc1BX?=
 =?utf-8?B?Zjh0TkhGd3hGeWlDUU1GWk8wVVFXbkswR1Q4RWNMcW9DaEhZY2hUSGhqWVJI?=
 =?utf-8?B?T2VKbDNHQTVGZm1CMStDMVV1S3VnUEtNVVhZRTFpeElWTGg3S2hWcnJFUGhv?=
 =?utf-8?B?a3hGUjVrZ2syVGlkWjdIdVV0Ykc5dTQvQjFjM1d3ZjhQQWZkT1pibjVUb0lz?=
 =?utf-8?B?TjhETGFZWm5XT1VPMmM2SXh2elN5amh2WFhyMHpUSUNoVXpFa01IT0pZVnZu?=
 =?utf-8?B?WkROK2lQWWp6SHk4VFgwVXhkUElNNWExUjQrbTBZSERTNlBHZDVzcEJvd2dq?=
 =?utf-8?B?R1Q5UEtTQzlzRzl4MEJtMWc5TlloU2lrMjdBQ3JTQStvbXVTSklsemQ0WVZO?=
 =?utf-8?B?MWw3Z1NhQVhOTlNhb3lDS1JtS3M5RUdIcGxWN2dYaHowOFZjandmNklROHhm?=
 =?utf-8?B?WFBKRFZLekUzWGhrcUFWUjdQVXFKbkEya3hTRHJtUzN1QTVDU2pPQkc5V3B6?=
 =?utf-8?B?U2sxYzQwcDlwMEhaNzZCNUV6MlNIZTZ0OU5MUytIbDNUT25WTmpac0o0L0dn?=
 =?utf-8?B?aUIvNWdFdWRJTFh0dlFwUmlqcWNDdXRxd0tBdktlblA3ZzBHb0RkZUJ3VWxS?=
 =?utf-8?B?dUZheVdvam01U3VBVU5XbUl0cUJZRjFIZGZJbW9zZnExeGVQbG1CUDd5Vld1?=
 =?utf-8?B?cS9qNTNGejVDaisxRU5SVUpXbGtKTUduRzR6dEJjVDFsUzdpY0ZpK1lJZG9B?=
 =?utf-8?B?OFErZjRRZ3BsRFpodDFidkk2bnJqblFXRStIZzZTMi9TL1cva0VqUFFSMXpO?=
 =?utf-8?B?M0hkQUcxQWxBVUxOTEhDZDJoNUpSS0ZVRGRXWUxiSWFrdWN6S1dHRGljcVRh?=
 =?utf-8?B?dTVMSUNEelI2ODBaMG9zVjNLWXRBeW14Z0R3ay9UWXdUUkw3QkkyU2l1Sy9V?=
 =?utf-8?B?aXFRcmswRWN0R0J4SGFLYnluUkNLdGhBWmdBaEFTdnFSNUFZMDBkMEVhNFJz?=
 =?utf-8?B?WUNZUmp0MWpySGRBem5SV3ltRXRObnZGcFR4VWtoaEhxYitHbnN6dnNsNk1z?=
 =?utf-8?B?YWM5UVZOTmp4aWFnVnFKeEFlcjFsSUExdURWZE12cmhtY3lqZU1yMHJNdXJ1?=
 =?utf-8?B?dW55ZVdSdE1FaHh2bWRrdXBqZnNkcndYRkkvY3hKQ3MweVVWRGhHMFpXdnh0?=
 =?utf-8?B?RDU4MnllR3dTZ1o0VEdwZzlKL1BYWXVVTjdZRXFhVWlOZU4rK2Z3R0FQcWFB?=
 =?utf-8?B?QytQNEp0bnV1akV0V1lqQ0NHWU91bWwwNHJXV3JSWlpSUUxLam9CQ2hiRG5n?=
 =?utf-8?B?NjJZRFN0T3RBN1o2aUw1RGRTa2NRPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:00:56.1199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ada01-e8b9-436c-4454-08de5e7e0a1b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7047

SGkgRnJhbmssDQoNCk9uIDIxLzAxLzIwMjYgMjI6MjUsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBT
dW4sIEphbiAxOCwgMjAyNiBhdCAwMjo1MTo0MVBNICswMjAwLCBKb3N1YSBNYXllciB3cm90ZToN
Cj4+IEJ1aWxkIGFsbCBkdGJzIGJhc2VkIG9uIFNvbGlkUnVuIGkuTVg4TVAgU29NIHdpdGggc3lt
Ym9scyAoYWRkaW5nIC1AIHRvDQo+PiBkdGMgZmxhZ3MpIHRvIGVuYWJsZSBzdXBwb3J0IGZvciBk
ZXZpY2UtdHJlZSBhZGRvbnMuDQo+IERvIHlvdSBtZWFucyBhZGRvbiBhcyBvdmVybGF5Pw0KWWVz
LiBJIGFtIGNvbmZ1c2VkIHdoYXQgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IHRlcm1pbm9sb2d5LCBz
aW5jZSBzb21lIHBsYWNlcw0KZHRibyBpcyBjYWxsZWQgYWRkb24sIG90aGVyIHBsYWNlcyBvdmVy
bGF5Lg0KPg0KPj4gVGhlIFNvTSBoYXMgYSBjYW1lcmEgY29ubmVjdG9yIGZvciBiYXNsZXIgY2Ft
ZXJhcyB0aGF0IGNhbiBiZSBlbmFibGVkIGJ5DQo+PiBkb3duc3RyZWFtIGR0Ym8uDQo+IHdoeSBu
byB1cHN0cmVhbSBkdGJzPw0KTm8gdXBzdHJlYW0gZHJpdmVyIG9yIGJpbmRpbmdzLCBhbmQgZ2Vu
ZXJhbGx5IHRoZSBkZXNjcmlwdGlvbiB3aWxsIGRpZmZlcg0KYmV0d2VlbiBkaWZmZXJlbnQgY2Ft
ZXJhIG1vZHVsZXMuDQoNCk15IGdvYWwgd2FzIHRvIHNob3cgdGhhdCBkdGIgb3ZlcmxheXMgYXJl
IHVzZWZ1bCBvbiB0aGlzIGJvYXJkLg0KDQo+DQo+PiBIZW5jZSBieSBleHRlbnNpb24gYWxsIGJv
YXJkcyBiYXNlZCBvbiB0aGlzIFNvTSBzaG91bGQgc3VwcG9ydCBhZGRvbnMuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+PiAtLS0NCj4+
ICAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUgfCA1ICsrKysrDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPj4gaW5kZXggZjMwZDNmZDcyNGQwLi5jNGM2ZmQ2ZGU5NjMg
MTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0K
Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4+IEBAIC0y
MDMsNiArMjAzLDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bXAtYXJpc3RhaW5l
dG9zMy1oZWxpb3MtbHZkcy5kdGINCj4+ICAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4
bXAtYXJpc3RhaW5ldG9zMy1wcm90b24ycy5kdGINCj4+ICAgZHRiLSQoQ09ORklHX0FSQ0hfTVhD
KSArPSBpbXg4bXAtYmVhY29uLWtpdC5kdGINCj4+ICAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSAr
PSBpbXg4bXAtY3Vib3gtbS5kdGINCj4+ICtEVENfRkxBR1NfaW14OG1wLWN1Ym94LW0gOj0gLUAN
Cj4gc2hvdWxkIGl0IHB1dCBiZWZvcmUgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bXAt
Y3Vib3gtbS5kdGI/DQoNCkNoZWNraW5nIG90aGVyIE1ha2VmaWxlcyBmbGFncyBhcmUgZ2VuZXJh
bGx5IHNwZWNpZmllZCBiZWZvcmUgdGhlIGR0Yi4NClNvIEkgd2lsbCBjaGFuZ2UgaXQgYWNjb3Jk
aW5nbHkuDQoNCkV4YW1wbGVzOg0KDQphcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2Vm
aWxlOkRUQ19GTEFHU19qaDcxMDAtYmVhZ2xldi1zdGFybGlnaHQgDQo6PSAtQA0KYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZTpEVENfRkxBR1Nfamg3MTAwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtdjEgDQo6PSAtQA0KYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmls
ZTpEVENfRkxBR1Nfamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12MS4yYSANCjo9IC1ADQph
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlOkRUQ19GTEFHU19qaDcxMTAtc3Rh
cmZpdmUtdmlzaW9uZml2ZS0yLXYxLjNiIA0KOj0gLUANCmFyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvTWFrZWZpbGUtDQphcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlLWR0
Yi0kKENPTkZJR19BUkNIX1NUQVJGSVZFKSArPSANCmpoNzEwMC1iZWFnbGV2LXN0YXJsaWdodC5k
dGINCmFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlOkRUQ19GTEFHU19mc2wt
bHMxMDg4YS1xZHMgOj0gDQotV25vLWludGVycnVwdF9tYXANCmFyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL01ha2VmaWxlLWR0Yi0kKENPTkZJR19BUkNIX0xBWUVSU0NBUEUpICs9IA0KZnNs
LWxzMTA4OGEtcWRzLmR0Yg0KYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlOkRU
Q19GTEFHU19yOGE3NzlnMy1zcGFycm93LWhhd2sgKz0gDQotV25vLXNwaV9idXNfYnJpZGdlDQph
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUtZHRiLSQoQ09ORklHX0FSQ0hfUjhB
Nzc5RzApICs9IA0KcjhhNzc5ZzMtc3BhcnJvdy1oYXdrLmR0Yg0KDQpzaW5jZXJlbHkNCkpvc3Vh
IE1heWVyDQoNCg==


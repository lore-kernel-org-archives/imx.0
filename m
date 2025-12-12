Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622CC310764
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530337; cv=fail; b=DoSsCJ+8fssVtvEWlv4fXHgH5IqgOBNKKPx0JI9w6UIzSUGso9J4HaRri6sR2zWwIvSUOGnoZ28AfjNynxCsSbdyuLclG8I3n3KoEw0PDvWkkZIaxUzWZjUskK55UoOGjVEyRyW1ToIE/66/ONEcmwZUvX9nvr4igiCaVheMfbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530337; c=relaxed/simple;
	bh=+ePCYrT/7xtJexWiUON8tZ6z6TF/CEcj6p5vY7lEr+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fP1fjX9LOf4azHieTOngFKI9+dtAMdqS1mQq9hmMAJYoPuP7hVLLBJ1vPx8EFJY/0FCk3R2CQdWQX6E4GxHNkasV8F8KUFZpIiCzoWBYm0zzASvxVGvLXWUttXNGpQNa3MCd2CzVD5POoCLWPFu3Vyo0jrUZPXnzjDaZwpwXtTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P5mP3I/t; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P5mP3I/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzwG8ei71GLa7Wuv7gInkAu79qhAyGs+LUXUbGVMo/GhVvOYdTXkcJ23PRL6OcDNN0hvtjEWSnVxWwyek8RoJwWL8+Fl6UVJOFQHeJj4o7GAwhf2sZcvWKLij0C0poF+/YPFwTuVQzS5AGVEXA4+J3QwsjlKXZiSu38V2tKEmZ2M3/5RLXrx0kX7j+al5WChnpvb37heE+xSOEN9DiNVG39ZnBOtV4sYqDvKmEF3SbXX/JQz9APqvnRSJMeL3HdHy9+CASax9Zu6LMK2nK0E1lWw+Ik7ljEFyFIucHZhFWvqI2Wrypf6kDrXDxgIykDKiQk88n6O5W9mI5plz0eoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ePCYrT/7xtJexWiUON8tZ6z6TF/CEcj6p5vY7lEr+4=;
 b=dctblTsw150MUak1PiLqWaX8PY0+/qGKjZ+NsZVHsucukXUugQoMsJL6Nk/2dZxRc5+c/XXJ6zTKLUeBisfmiZY3AY9j+8Nsz2Zg+6SF4wYU4DKkhShz4VBUPF55ban9J/hzUtMfJLSOwPWwzstG9mQquRLaQq/W/Qz8OoA/JAbtnckrwETOjVUsT3Ff0O5k/9LkgUYYT+GLwc4ABhYMzf667cTIxsbwXWTt3DPEI2VeZikWTy31WbYNICrUPFvwcwaaP3p/uPsC3k1NT9RmKWR3xz1YHr5kuImb4UCEhzzdin3CE7unodKf/MOsbdZGC8ZNyuVnwMPI5/7ehcheNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ePCYrT/7xtJexWiUON8tZ6z6TF/CEcj6p5vY7lEr+4=;
 b=P5mP3I/tBiyo5Kk8hx4sWSaqippiMOqfZdOTu84DbFDspPXILL/g4g3UO5K5IB3sQ+qI1Cxu/uOl8+hp9fjGOAe2h74iyzkUE+HsH5NAgkm0RcXz2ROtOTNhYD26OyU+BWgxgkLJFiAZv+BKLBlPeUxUBAtMZuFnnlj6dCs9kc6f9u4hcLsnglx8c8uEiQppbOt1xWTiDd6po9LI9w3QpgypLJI3qYr8epEVKBX94NAiNzecsHqREKk34unmAXC6ZKHTlfWjQ8h67+rXc5fQC2ZLs2/C/3++6G7yGX+ypIi2LdWCW4d72HiAzDY01MI6VCT8GWs+XuYXOWfokv2K/w==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 09:05:29 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:05:29 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Frank Li <frank.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v20 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Topic: [EXT] Re: [PATCH v20 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Index: AQHcZCDyTcT7+LXTOkSolFAmviM5prUQNdCAgA2OpYA=
Date: Fri, 12 Dec 2025 09:05:28 +0000
Message-ID:
 <AM9PR04MB86048456E6BA337E3AF5754195AEA@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
 <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
 <33d659bd-eba9-4b47-a374-32b6c763d640@infradead.org>
In-Reply-To: <33d659bd-eba9-4b47-a374-32b6c763d640@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GV1PR04MB10524:EE_
x-ms-office365-filtering-correlation-id: ead7ce10-0a07-49ff-d38e-08de395d98c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bU1kK1VJV0tvM2xTRVBRMTJTd242ZldLKytHL1BJWjJOeEhDZHB6L2VORE9O?=
 =?utf-8?B?TzVWdE40aUZxQ1ZpZmxBMVR5dmtVZDVWMUFlQlVlVjRJcVJTY0ViZGxUdXFw?=
 =?utf-8?B?MzdSUUNOMDlQNVpUY3BpR3hLTmNnOHJRbWVrMEczYzhkTk14Ykx5bGVKc09R?=
 =?utf-8?B?MDhTUjZwQzlYcytqb1gyVmEvZlNKd3FjZnQwQkJEamo5WXVDWmNhTXIwZENN?=
 =?utf-8?B?NlJuTFI1ckxXZVRkOVM2K1Jod3JPWUR5NXR1V0FHS2h2NHNUdTJmaEtoQXg4?=
 =?utf-8?B?eDRtYm93VHk2SU5WNFVkMDA4TlpRaUhaZ1MwbTZ2ZWtzbU8vM1BxbzlTUnVV?=
 =?utf-8?B?eDJCMGpOcDFGTTJrUEUyQnY4SGhLaWwxU3dlOG5UZC9NN1BkMllRNFNmTHcv?=
 =?utf-8?B?MzFyYm1FSG5nbFRINU95bkJRakFHWkpES1g2NEtJNUJDai85UmlPVUFkVG8v?=
 =?utf-8?B?ZUY5L3NSU0hhWUNJRXVoR2QwYm1NZVlRLzdmc2ZyU3B2WmphRkdrZm5CUTBK?=
 =?utf-8?B?Z251Z1h0TFdGejhwSmhnZFJuME85WTY0dUkvZ0doMGtzeEk2K2x1ajNnbUFp?=
 =?utf-8?B?MGJxSlB1UWRsU1kvVlZ0TG43cEtVYXBWVlFyMkcxNld5cnhJQXBLQUxoNm9Z?=
 =?utf-8?B?M2hlZHM2M01wYlFkS1V2cFBCTjFKZnVGRElrT2VwbnA0Uk1FY2pzZW9GSW5T?=
 =?utf-8?B?WXY3a1dVRHptaEh4Z1dqVzJ1QW80M29JQ1cyNjBycFFwVVFwUzVjdmNqY240?=
 =?utf-8?B?SEtGbGZVY1NiQWRjbUMvSldYUG1hZlBnVDJjcTNhRjYrTyt6aFRRYWd4Vzho?=
 =?utf-8?B?S0xDNFQ2eS8yMi9QaytXSzZKbW1EZzFmUkQ0Qytza3JDdEZibFEzNmUrdXhn?=
 =?utf-8?B?cFRzcU9oNldlVGxmcVRsWFJHRUxqYVIzM1lJNm9KZytMdHhYOUpJR3Vtc3BP?=
 =?utf-8?B?QnFOdWN4MUk1dmdPbUJyWHF3Wmw1M1F3SEhTZlprbHMrZXF1R29EVlJuOGt6?=
 =?utf-8?B?Qk05Y1JPNjczcWxqSmxjbWZjdXFUNi9HWWF6ZTV2Mm44Tmh0TEhyazJjcFha?=
 =?utf-8?B?VU9uUG5ZZlpvcUVEaXptMVFzdnhObkkwTDBKUk1xVnJHWDNlRlN1bjFiSjNi?=
 =?utf-8?B?UE5NeHhWNmRMZk0xZFdCRTA3RW5EdVBGTkpuWFNjUEQ0WkVpOWI4eEg1WStu?=
 =?utf-8?B?dFJoZFJ1bzg2LzErbFN1M05JUEVZb0lzVXdYdCs0bW9jSGxuT3pIUit6V2ww?=
 =?utf-8?B?T0ZpWFNzVTB1R2RDOXhVU3djWWloelBrSkkvNFh0NnZ2Y3l4SmhEOHVlMzNG?=
 =?utf-8?B?NWoyUzZSTXE4dVpsMnBhWW51VEp0VWkwZkFwK2RDMVAzWGNUb3RLNlNmZERa?=
 =?utf-8?B?MjBZc1JhMy81K29KeWJqRlB0ZlAwVlcwa1lvRHM5d3d1Ym1JVVM5Vk5iRU0z?=
 =?utf-8?B?VC8vTm93cG9aOUUyQlFDVEhKZWxVZk1aMk1URUNxOGhBQXNEeTlqZWNPRVMy?=
 =?utf-8?B?SC9IL1c2ZGZTRkZDVTJRcGJTNUxXL25oQU9telBNMXZIL0lkang1dDV1RFN3?=
 =?utf-8?B?dkh3dHZyTUxObHZDcitqNGk0ZVdpbittVWl4RWx6RU9RcHVwdWh2UUpIL0F0?=
 =?utf-8?B?RHdOOHo2RzZFNDVnU2pUaWFJUnpxOFkvV2NaNG5HS3hVTkd4eUpwY3lXYWk2?=
 =?utf-8?B?dW9UdjdaUzFPS3BFM1RyQUZOWkxodUNkQUE1WXBPWXhaU2tqejdLYURPQ3hE?=
 =?utf-8?B?UVB1YlFObC9UNzJYY1Z3S0VUU1VNajR2Ykp0ZWZmSkZid2Z3UEN2dCtxNWRY?=
 =?utf-8?B?UVdkWHQ4bGtVMUF4RjVRckovbGFPcVZnTjBJTzh6Zld4NTM3UCttcE43OHNa?=
 =?utf-8?B?QlRvdW5wYzFGZTFJdGIwOXlXTGZaY3l0TkxmK3NvMWlYWGxWK1VOa3grOVpa?=
 =?utf-8?B?c0tyMytPY0s3RU5ZakgzTndBdWxVZVNTeEdPcWRDV05tMXFGN2F2d1cvaXNJ?=
 =?utf-8?B?ZnEvQzdhOEdaa3Z2NUV0L25UVkw4OC83Vmw2TVFMZlI4dEUweFlBRUpJaUp6?=
 =?utf-8?Q?pYYYOh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0htNCtzMU5ZUkI1MnR0b2JJb1VZcWRVUDh4eFprenR2eCtzSnRVLzJ6Y2VK?=
 =?utf-8?B?VVFEWGJzQnhJZzkyWDJ3Y2lqWmZkNFRLNEpHeG02MzhnTnh6TEJ3NW5WSnVi?=
 =?utf-8?B?eHJwOXkzSUx0ZTBIUHMxbGhlbGF3bnhzUkFGYlhXTVExWHl6K25DeFF4bWJO?=
 =?utf-8?B?VTFJL2hTZDlybE43SEF4WVk0b2w5TTM2dUczeHRndGN0eTM4OENBaXY3d0lI?=
 =?utf-8?B?anhJcndwQkNtTU0wUUlBR2hZSDBzSWRHSUNNb2NSbXZqRmduNWdpeWJoVW41?=
 =?utf-8?B?TEI5dzVtdm5lRXRRdzhkMS9QeGFBWFRuY3RjNGdpUHVwWVNVSlAwMXhzQkJ2?=
 =?utf-8?B?R293b3ZXNVJHeXpvdkJoMEpGeHVmOE9JZ0NmaXQwUUtEZ1B2c2xKcUNPQ3Rk?=
 =?utf-8?B?YmtESVFHM1llLzFCL2JKbXBlbDljbDJBS1BIa2l1ZHdvejVHcFd2MmhVUGg1?=
 =?utf-8?B?Z21sUHpBZ1p2dEtreHY4anZDTjg2RDVLcDJsQXI1d3NhcXV2OHJNaHM3Zkp3?=
 =?utf-8?B?R1Rlc3hxUDkzZ25RUDEwMVBERmc2R1ByTVZjVG05NDlOMjlUbUdzZldxK1Fy?=
 =?utf-8?B?K2J6T2w4azJSbVdDNE9zRWRPTXZuTUFPdDRyQ3BxVFZscVpJME9jNXJwcHJI?=
 =?utf-8?B?TEhhSnFPSEZtK1QwbnVLWVc2aWFXUHNZMVRyTm1Dc01KM3dGNFhWVmFhZEZl?=
 =?utf-8?B?UnVCRWpwaHpycGVjOW0xclI0TEc5eC9iTHVzcVRuc0RzRUlNa3NkNFNraC83?=
 =?utf-8?B?RGVLUldpN2N3WEhlTkV0eGZQaXVYdFBjdVVReUR1R3ZjOW02QkIzaS9mbmVm?=
 =?utf-8?B?V1RYRWpGVWpQQ3ZlUGl3eW91YjJ5eG1JSm9ZV1dnTnc4OFZZdDIwWlJsMmFx?=
 =?utf-8?B?ZVh1dlM2V2hBc2xnNE1DdVZ0NGo5UjVaZjVuNmdobkkyUzhoTk40Y0xOTmhw?=
 =?utf-8?B?NUVWWjNiRHpPamQ5T2RwM0JJZ09oTTVTUzQ2VGtrRmFmTFd3Q3ZDOTVXWVRt?=
 =?utf-8?B?NlQrWFU3bWRqamdqSnZMRzBtaXVWN2JGWnRqYXYvczc0UmVwNnB5VFBsN2pT?=
 =?utf-8?B?aGtNLzRMblBvaGo0MlN6M3MrelFETWJMZUVxRnFJbm15SjR6TjlLenFuZzJ0?=
 =?utf-8?B?TXNmT0JpRnYrVnVDSmxmYzlDZVhsT052Uk1uQnpIdnFOTjhpM3dQd3VhM3Jw?=
 =?utf-8?B?TVNFTFR6Ymx2V0gwZFNYMTI2S0ZmNm5nR09TeURUYTIza3hXelMwQ0lGWmdZ?=
 =?utf-8?B?RW9JMEJrZ2FDTzVlRzhmeG1jeXd0dUkvb1FGUmdkYVg4Nkd2UkFCQjg3Uk5F?=
 =?utf-8?B?cEx1aUhOL1Y0VTV1TUliRjBEY1lITWFTTThMR1psTklBNFVHaUhYWnJNMjBF?=
 =?utf-8?B?OWJkQ1pvNEZwR3MxVEQwaEp2MDBxMkI0VFE4WUJxa25IYjNKQlJoQjdmN05F?=
 =?utf-8?B?YnBTNzVnekxxaTEya0JDSDc4WXAzelEyYW0zUmllSWx0UFBXSE5BZ20xdkl0?=
 =?utf-8?B?eTk2M0p5S0xuMGVPb1ptZUtCcTFZaWR1K21zR3ZwTFRJUGYwVVR3NlBqVlQ2?=
 =?utf-8?B?WFBPak9oZUVoaHdtb1p3REZvR25oekFkandHMzcxV3R5alBrMVFuaFptV1hQ?=
 =?utf-8?B?aDRlOExqTVA5b05qakdwVHNKaGFwblBYbXNZaU8zemNiK0h6Smo3ZmVnbkh4?=
 =?utf-8?B?UU5hTVFnZlErVEZBNHgyR05ZaXZmNkJ6Q3FQTWx4Qk8wZi95cDVucG5YVDVm?=
 =?utf-8?B?YkZWSUJPanRsS1RrbHBwaEFJTWUzajBYWFRQV2ZNOUt2cXd1MnU0UEFhd21N?=
 =?utf-8?B?WVU3WjUySVhhWms2eEZnYXN3dTRTUXJDTE1hZXBWSU1ZdVdna3Ixem5PZUhR?=
 =?utf-8?B?VGliTGYwd2g0SzRmckRDUm1EWU9yRWVNaXFiaHJWWXRIckNEYUdRbzBpbVRC?=
 =?utf-8?B?ekRFTjBJUlhCdVIxdzJGalZIai8wUStwMUhmS0k0ZEFWczRHand5RVd6RHdX?=
 =?utf-8?B?TTJodW5OWEcwSHZjTDFXb3JmNW1rSnp5ZytMTExsM1pCWHRLUUUrT1lORnBi?=
 =?utf-8?B?bkFFZHhSd3lvSnVad2pYR3Ric2xuSFpYcHM4MzNBV3VVbHBUSEhodWNHeDZO?=
 =?utf-8?Q?xGfs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead7ce10-0a07-49ff-d38e-08de395d98c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:05:29.0173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1X/uPjD7+gwjIwJIIb/94rVf1qQ/wo2DfayoPKb2kvSKjZi2D1fm2ttqR26C8WXrxXd/HgciajrhU6PXVc5+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

PiBPbiAxMi8yLzI1IDEwOjQ4IFBNLCBQYW5rYWogR3VwdGEgd3JvdGU6DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZmlybXdhcmUvaW14L0tjb25maWcNCj4gPiBiL2RyaXZlcnMvZmlybXdhcmUv
aW14L0tjb25maWcgaW5kZXggMTI3YWQ3NTJhY2Y4Li41ZmU5NjI5OWI3MDQNCj4gMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9pbXgvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMv
ZmlybXdhcmUvaW14L0tjb25maWcNCj4gPiBAQCAtNTUsMyArNTUsMTYgQEAgY29uZmlnIElNWF9T
Q01JX01JU0NfRFJWDQo+ID4gICAgICAgICBjb3JlIHRoYXQgY291bGQgcHJvdmlkZSBtaXNjIGZ1
bmN0aW9ucyBzdWNoIGFzIGJvYXJkIGNvbnRyb2wuDQo+ID4NCj4gPiAgICAgICAgIFRoaXMgZHJp
dmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLg0KPiA+ICsNCj4gPiArY29uZmlnIElN
WF9TRUNfRU5DTEFWRQ0KPiA+ICsgICAgIHRyaXN0YXRlICJpLk1YIEVtYmVkZGVkIFNlY3VyZSBF
bmNsYXZlIC0gRWRnZUxvY2sgRW5jbGF2ZSBGaXJtd2FyZQ0KPiBkcml2ZXIuIg0KPiA+ICsgICAg
IGRlcGVuZHMgb24gSU1YX01CT1ggJiYgQVJDSF9NWEMgJiYgQVJNNjQNCj4gDQo+IElzIGl0IHBv
c3NpYmxlIHRvIHdvcmsgQ09NUElMRV9URVNUIGludG8gdGhpcyBkZXBlbmRlbmN5Pw0KDQpBY2Nl
cHRlZC4gV2lsbCBhZGQgaXQgaW4gdjIxLg0KDQo+IA0KPiA+ICsgICAgIHNlbGVjdCBGV19MT0FE
RVINCj4gPiArICAgICBkZWZhdWx0IG0gaWYgQVJDSF9NWEMNCj4gPiArDQo+ID4gKyAgICAgaGVs
cA0KPiA+ICsgICAgICAgRXhwb3NlcyBBUElzIHN1cHBvcnRlZCBieSB0aGUgaU1YIFNlY3VyZSBF
bmNsYXZlIEhXIElQIGNhbGxlZDoNCj4gPiArICAgICAgIC0gRWRnZUxvY2sgRW5jbGF2ZSBGaXJt
d2FyZSAoZm9yIGkuTVg4VUxQLCBpLk1YOTMpLA0KPiA+ICsgICAgICAgICBsaWtlIGJhc2UsIEhT
TSwgVjJYICYgU0hFIHVzaW5nIHRoZSBTQUIgcHJvdG9jb2wgdmlhIHRoZSBzaGFyZWQNCj4gTWVz
c2FnaW5nDQo+ID4gKyAgICAgICAgIFVuaXQuIFRoaXMgZHJpdmVyIGV4cG9zZXMgdGhlc2UgaW50
ZXJmYWNlcyB2aWEgYSBzZXQgb2YgZmlsZSBkZXNjcmlwdG9ycw0KPiA+ICsgICAgICAgICBhbGxv
d2luZyB0byBjb25maWd1cmUgc2hhcmVkIG1lbW9yeSwgc2VuZCBhbmQgcmVjZWl2ZSBtZXNzYWdl
cy4NCj4gDQo+IHRoYW5rcy4NCj4gLS0NCj4gflJhbmR5DQoNClRoYW5rcw0KUGFua2FqDQo=

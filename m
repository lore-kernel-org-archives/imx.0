Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795168259;
	b=SjDEbZOoxwMbFtE9fCWzrrJMIYm8b1kLG03ejyu2dYx1ADeWiF6d07++SomwZCTwe5Mx
	 ltLqWskLyD963bO0F0ZOctrOHdoCqhDvdTfxiF+iAPDFvoXC8fny2vnhztzLH3vUA78qr
	 a951MPRvLOlVTSOh6W1hrlUQ0h/v2nNV7RbLV57ht153uot3yPEZR5lIxbK0aLjTlOmjF
	 Yay6LFJAGFX8YHpTMxa9h1tWdTdQyb71cRiq/ATM8TYjs7iLTv2jFsWCd7gyjVIbHDiEw
	 MCgu++vR1hJRHitJ+w5U1CKX2LI0fGIoAX+gfyvctL1Qs8w60cwFy8pdak+q6n1kEvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168259;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-sharedmailbox-routingagent-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HZ9Je+5USY1Rn+9x+pNMd10xWgcHQmwS6j/iRcUrGC8=;
	b=NJo3isw65O3FKh6MVAgvU+f+8uLFhKQFsEC7+sDwxVlQD22z+f+BfKWabIzWE96y1It4
	 pV9ihf3vRiaMxIPuOQ5kGLGmxcyC5s8+gjS3ioaQ/ei6tS1iV/qX2MKqNpI4wWc+VEtHd
	 JOfGktJ/t7a5C42+8fGIuimLkBZNukAL84Wuunn2fQhq0WkkhdW3z51B6ie3Cv5h7Qs4s
	 /W1ciqnmi63G3ZxXbb1uqyNp02na+mtjaWl+Dv6/z/FKPizgDdBDSAyrA94lIA5gG+n7A
	 lqy3Bej6+Zq8kiDcw5KjOcG5mTKNS+/+H7OV0wS3xUJ9DKUtZ+BjINFvTVhJ2z7vxJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vp3bYRRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.41
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51768606A32A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51768606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vp3bYRRK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG54RmOI2zU4MAOyi9ioR1iYIxU1jfPt+ENVBy2dgtJ6NpRcOe9VbG5MgzXuvrkH0IMO4YP9MWNkcE8dR0qgUWnL4/guKoSBU84t12xcg44TifzWd6ESslva1zCnZ9Oq9m+OUj6pUXtlrEsytu/NDr4KMdhGcCzczNAxpLMGYu1QbQCP+efkRvmx894yjP/nEii1XgmnV9UypBdWt6aTX3jEuQS2iLn8O/XKj9hy8E8tcL2zRHQIsXKTQVsBepk044udQhQKxcHYqCfcVgwMGuVNdrIlPeZkNxF5rzr4G0DJ+w5NuQ4qoZD8sAwNHVBEBocCByQbzTO/8mFnDZntvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ9Je+5USY1Rn+9x+pNMd10xWgcHQmwS6j/iRcUrGC8=;
 b=M4cnVeLLKISpEHYf0wXlW3My313zr2D/yuiXDR3oex1fBa8/4C3vZRL3YzC6N5ocyptWuACk2O70IZSblL1ErRs9uF76XmzOyF5DN191eiYygjzc0Y5i0o2m/0HBxMZ+hwEhtJeCYiRv6CYs/LdHE76QRb1M4P+HU7V0VUCZ/Kl+TdEsr8ITbc0gH0fG3tRPPLhdsEqD4nTtyQ2eFRS+OEgbIVYQOKZoHTKEjfkDVWbNrcuQ78WLbuw6AZssA8G2j0HeE7iQbu9LtnHvims1sDC79Q9Hq0yathBeTTaF7HNwlAD1c2VfxBqY31iO2IfI0dnweMaRJodlEQrITC5wug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ9Je+5USY1Rn+9x+pNMd10xWgcHQmwS6j/iRcUrGC8=;
 b=Vp3bYRRKUWXN72Jzp6MXPojx8A8koF+lYA9bFMFBQarvwPipX+0AqB2orGnyF0b+fOohkwnc+Mw5AXc6j82iHVkIh9eUSTIUwEEyZEZxmGvg2caGjfGQRD3NAUeIfTHx6YHaoY1RvhyXW8Ca4EpTmenm1DuHLuohlJq032cMKxEJrEmwJtAePymOjHq3hTAGup7eOkUc7uQITkDVGEYmiTOPBWhzZXkZCkvBvnHbxG1o2cbC8jRwIpm/WUdR0JTqyburlC4ekHn60Q0JJ5epbJJq2in3bMc/nE9gNKIBbDMOozkzbEToL4o9yPWDUoIVB4HC+1IL1qMlGipj/MVuMA==
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:50:45 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%3]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:50:44 +0000
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
To: Freimut Diener <f.diener@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
Thread-Topic: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
Thread-Index: AQHdeNLPBG4PNoud90azCLHrJkVmdbc2t0Cw
Date: Fri, 20 Nov 2026 09:50:44 +0000
Message-ID:
 <MRWPR04MB12117CE93FD323459E370D08F94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-11-20T09:49:34.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12117:EE_|AS8PR04MB9048:EE_
x-ms-office365-filtering-correlation-id: 0d53bc19-6ecf-4505-6451-08df46ebbf2f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|38070700021|10067099003|4143699003|11063799006|56012099006|261022075727099003|261021121427099003|261022105027099003|261009223027099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Vc2UP0RiLzH3KgerLNz9MwcZ8xwaiyjGyDOWkxzb3ACICeI44DZRomWD8Y9SDI+gBxtMoJc9/nli0XqOLX0DsBV50hy5r9JqjdhTKIWtMJF/rtLpmE22nWalYlUyqj5b3dVTsbAY0ar4tF4WOGR1gxz/JqY8fvk28d2g8M6bklr1PaT9BrMR0I9zLRE0MFSMUlAlS6Lc51uBzY6+EajvvkDQMl+gMxM1DF26FZwvU4lUDjSGImhEYuKQZ+0v6G/fw/R5x4izpUBvy83Tw5PuQeJjCVh1UGj0U7C0nWWWBIfjMOTCHgFbnBOVRwjzmNl2ghl9T2agTFT8Vz/jOsd97sVBa6Ui+cePFxDm4BqGwxZh9G7OVDJm9Xr7WU8x9DWrwkCnMkFAI2lcVcyqncWujsoRNPo8KJfN7tbYe49pEKkrjk/wH5vA/UTHLq7BmwT6S9q+gdgJzC406+TJBHupjN2up7oewqnm78Cggjgx0SW2L55IhC34zpNIZKusjEmb8WQlEmnklM67jc0TcQiAVwu2xQSlBriS7Pk6hfoFvaFwIAJVSovckEXohRW6AZX3nTzP4Zu3H7aNCFd2MBj1aSG733wiOohQ+wHnaqSiX3uf0I/2DskRkgdhjgnZZ9WjHD1yqo2MHJxj6THngfUeABVPTvR4Xy2id70E0K0NjTHKeiVztc6ewf8NAQHdUsepLGoaO0tWRESpw60e1LxjYD2zAZWiZT6nSPlPrDciENM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDFERnQ0d3Zjd0trSDVXSTdQazV1V0hLaU1XcExNYmxrc0tQdlZkSGlNVGVS?=
 =?utf-8?B?RWZpL2RTczlWTTBydVF5VmlwWTZOelFRWTZ5aGRsd3ZVeklsZldIMG5jS0tE?=
 =?utf-8?B?QURiV25ZcXVFRkxXK093ZnVMV0ZmVTFmNTBmRmVENnFkUkZiTVF5WDRRRUxz?=
 =?utf-8?B?SkFqY0VtMllNVnJWZktnNENYL0xML1oyWXY5OE5GdnRkTFJYMVZIQnI0d0U1?=
 =?utf-8?B?Q0NZN0FVTnluRWIrb1VXOW9odzBXSW9aZDQwMzVWd2dFWjZsS2NnaHlnclNm?=
 =?utf-8?B?aldWTkRCOFVhV3pKOFgzbVFTRHlFOUMzWnpXQUF0T21wREZMMldUQ01TcDQ5?=
 =?utf-8?B?U1BRMVFCQkFqdkFZQXp3T3JZWGVSMTVBaTNucE9zVWNVM29qR1EwVnF2Q0lB?=
 =?utf-8?B?T21CQXhRbzZGdCtxSFk0YkxpTW9jYVlETmU3aGFLakhTV3djS0Y0dTQ4T05Q?=
 =?utf-8?B?Z3UzVDlzRS81TU0yclRFSXNMVmdzc29wd29qYnlnNU8vOWhaTzUwY3diY3dj?=
 =?utf-8?B?NTNzbEJmdVNkaEZlWWlVVXB4Z1l6d1JDN0V4QkMvL0hWdGNFa0lBMWVuemV3?=
 =?utf-8?B?eE5VQXpNTTFnTnIwbjEyQzBsV3JiWU14NmFNWk83RWZib2ZFd0NhZ3NSN1Ra?=
 =?utf-8?B?dDlCWDlRVU5zeEg3a3NDY1E4aStublRyNnhMdEI5NENrUDV2OERTb3pKc01h?=
 =?utf-8?B?dktBTjhRZjU3VWswTGV6UzdBQ0l0WkRYK29HaXNtTkdpSG9PT0pBbGZFc0Y1?=
 =?utf-8?B?ZTJ4UTNFTU9ua3hhc0tiS1hidkg1ODBCZExsb0lNTGxEOVkrRjYzcDZXV25n?=
 =?utf-8?B?SFNkanA5bktMSSs3RVM4OEhlZDN5RWU2UkZvcmFXaWQyZVpiZU1BWjUxT2o1?=
 =?utf-8?B?SzJlTHFEYWY2cHBJM1JHamx4K0ZCa256MXVVVXdoOXpUaDFIWkFvVlVJSW5W?=
 =?utf-8?B?RTZnU05icDFZb2dtUDRvK2JJc2pEQ1N2dmdZWmZ1K00rbGJVdjl6YnNoQjl1?=
 =?utf-8?B?dTc4NGl5MXhjRXhlK0F4N2hocFppNGVwOGFycEtOZ3E1YURrbGwycW5Ic0p1?=
 =?utf-8?B?ZnBOKzdRalVVa21aVjNtcGx5WStMZmxoTmt0T0VGZ2c1VEdlc2swUkZBRkFK?=
 =?utf-8?B?NGVlZzhYZVQxRVNJMW1lQkVWYkhzT2JRN3Y0elRwdWp0OXRsU2g3aWk5aERH?=
 =?utf-8?B?RGpXSVhDai92QTA4WHF5d3pSeXVXeExDanhVVSs3ZFFRM2dQNUttQUZKd0Y3?=
 =?utf-8?B?OE4wRlVGRUxEdjA2YzNRc3lyUEE5aktuVHcreE1UUWM1Qmw0TjhyR1prTDdo?=
 =?utf-8?B?U3dUNWhFdlhtQnd0bzZWV2lSeExYQ1I1VkRoZThWeEVYUFpvSEkvMGo4UTdP?=
 =?utf-8?B?dzU1MG9EVHdMT1BDeUFhRkJDNVpoWXVsTTFoMlNXcWJBbnhCaVkvbXRmTWN5?=
 =?utf-8?B?YktJckRwbWNGdTFCZzg3aGdhUWFoK0dXUGVVUEdBV1puQVJTeDJxT3Y5QStZ?=
 =?utf-8?B?T0w1NEljalRTQ1B4SHBmME9zdjVVNWwyeFlkRkdaWE1xbUZpTGVpd0RBZE9U?=
 =?utf-8?B?VEJXZGoxZk9OOHpqcUttSDQ2QUZqZ3grSUdHYS9vRmMvZmdTY29pQSt4UE9k?=
 =?utf-8?B?aGhsN2RkN1VjdUw3dlpXWHgveHNEQy9KZzh5dkxRRHFvN0JVMHJRMWttVXB2?=
 =?utf-8?B?NlFVZ3pMUzFIanI1cU55QjlabEZiVXNJOUcvWGFzS0Zsd2pZdUpkeDdQOFUv?=
 =?utf-8?B?WmtRTWE3R08yS0xFNmtIcGlzRlVhMGsybzdUWlNEREdiQkNaZVVHNGZHcGpq?=
 =?utf-8?B?djdxNlFRNzFmdXY4RWxHQWpuUUx1T3lTSVJtSitZMzBCYVlBYTJ1YzN6cnRG?=
 =?utf-8?B?S2xxT2g4cFUzQUluOWZZUzFSUDFXTUJPTkJrN3htK0tiZUZBQnlobElqa2pO?=
 =?utf-8?B?Qm1aeEliemVkSW9xVHMxSU9zbGp5T1B4eDE4andYQXgvN3d3THBmTXV2bEtW?=
 =?utf-8?B?ci8vYlpxNnFZNXdaWFhtSFVidWRFcmk4SE14cXZjRXUvM1Z1dk8zWGhVcEVW?=
 =?utf-8?B?S2hOZE1OOUxNdkpUc2wzNDhzcXZYU2h1U0RYeFFsNmIzZjhhUEwyc3JMeWVh?=
 =?utf-8?B?MWF0S2F1ZDViK1RSQ0pMM2l2MElrUWpCRW1WbHJsVGlUMTBJRVZPeHJYWnZm?=
 =?utf-8?B?S3EzdTFIakpiMWhKakdZZloyR25VUVo3cmx3UjFmQlR0bFZKSUZlLzhpdnht?=
 =?utf-8?B?eFFiQzU1U2VjR09OOFRUb2M3bjBPZWRodzEvVEZENjFSMGNMdisvcHhVdVZJ?=
 =?utf-8?Q?os/ecpgysL5asuMBzv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d53bc19-6ecf-4505-6451-08df46ebbf2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 09:50:44.8470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIemXpCy2xXRCd+K6QDOGfuYBXmML5FKaVI8Mk81JTmeujW4E5xMpDNdTe8xfnSNeMbw/lESXl0K+1gc6xt6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

DQoNCk5YUCBDb25maWRlbnRpYWwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogRnJlaW11dCBEaWVuZXIgPGYuZGllbmVyQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiBGcmlk
YXksIE5vdmVtYmVyIDIwLCAyMDI2IDU6MzcgUE0NCj4gVG86IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBD
b25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlA
bnhwLmNvbT47IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJv
bml4DQo+IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
DQo+IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4ga2VybmVsQHBlbmd1dHJv
bml4LmRlOyBGcmVpbXV0IERpZW5lciA8Zi5kaWVuZXJAcGVuZ3V0cm9uaXguZGU+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCAzLzVdIGFybTY0OiBkdHM6IGZyZWVzY2FsZTogaW14OTMtMTF4MTEtZnJkbTog
dXNlIDgtYml0DQo+IGVNTUMgYnVzDQo+DQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZy
b20gZi5kaWVuZXJAcGVuZ3V0cm9uaXguZGUuIExlYXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFu
dCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0K
PiBUaGUgRlJETS1pLk1YOTMgZU1NQyBjb25uZWN0ZWQgdG8gVVNESEMzIHVzZXMgYW4gOC1iaXQg
ZGF0YSBidXMuDQo+IENvcnJlY3QgdGhlIGJ1cyB3aWR0aCB0byBhbGxvdyBIUzQwMCBvcGVyYXRp
b24uDQo+DQo+IFZlcmlmaWVkIG9uIGFuIEZSRE0taS5NWDkzIGJvYXJkLiBXaXRoIHRoZSBjb3Jy
ZWN0ZWQgYnVzIHdpZHRoLCB0aGUgZU1NQw0KPiBvcGVyYXRlcyBpbiBIUzQwMCBFbmhhbmNlZCBT
dHJvYmUgbW9kZSBhdCAyMDAgTUh6Lg0KPg0KPiBUaGlzIGFsc28gYXZvaWRzIGEgcmVzcGVjdGl2
ZSB3YXJuaW5nOg0KPg0KPiAgICAgIHNkaGNpLWVzZGhjLWlteCA0MjhiMDAwMC5tbWM6IGRyb3Ag
SFM0MDAgc3VwcG9ydCBzaW5jZSBubyA4LWJpdCBidXMNCj4NCj4gU2lnbmVkLW9mZi1ieTogRnJl
aW11dCBEaWVuZXIgPGYuZGllbmVyQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLTExeDExLWZyZG0uZHRzIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My0xMXgxMS1mcmRtLmR0cw0K
PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLTExeDExLWZyZG0uZHRzDQo+
IGluZGV4IGZiZTM1NDNlMWVlOGMuLmFmNjc0ZjNmNDgzNjQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLTExeDExLWZyZG0uZHRzDQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLTExeDExLWZyZG0uZHRzDQo+IEBAIC03
NSw3ICs3NSw3IEBAICZzYWkxIHsNCj4gIH07DQo+DQo+ICAmdXNkaGMzIHsNCj4gLSAgICAgICBi
dXMtd2lkdGggPSA8ND47DQo+ICsgICAgICAgYnVzLXdpZHRoID0gPDg+Ow0KPiAgICAgICAgIGtl
ZXAtcG93ZXItaW4tc3VzcGVuZDsNCj4gICAgICAgICBtbWMtcHdyc2VxID0gPCZ1c2RoYzNfcHdy
c2VxPjsNCj4gICAgICAgICBub24tcmVtb3ZhYmxlOw0KPg0KDQpIaSBGcmVpbXV0LA0KDQpUaGUg
dXNkaGMzIGNvbm5lY3QgdG8gU0RJTyB3aWZpIG1vZHVsZSBub3QgZU1NQy4gQXJlIHlvdSBzdXJl
IHlvdSB0ZXN0IGl0IHdpdGggZXhhY3RseSBwYXRjaD8NCg0KUmVnYXJkcywNCkpvc2VwaA0KPiAt
LQ0KPiAyLjU2LjANCj4NCg0K

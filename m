Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59A31812C
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626330; cv=fail; b=TDFW1BrOBJ8ieovWp/bGB7t1FW163rgVuUV0lZr4QrIkYd4APHbsbyr3P3z5inlKUbFGtwekOWlv628pbONpDJIb22+8H4aGQLNEyqkMYwkhTW99/J9FPZb08a4xa2Uiay3T5EU8CWMjGJrP9SVpzIkfS7MeqlksdBkBcdRj1LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626330; c=relaxed/simple;
	bh=iHf5boFIjYVilFxMDKK8G79ubNvozCF3WcMqE+Px2gM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X/O3c/AQZlzTIJXJ80ATwgDPYElxPKIUF/KvToTm4oLT2ot6Y1v+kLEVRmvl2I60a59rbe7E5qlv1kD0pBk0wEV3zaYuJsyA0fXqpbO/Zz/JdMQDGUsCBzic1Erl7Co7Rc/s0/wipGNF35+RKjf9y0aFdbAGtQ5qEGeLl+IVick=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N26ORFdh; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N26ORFdh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+1F44v2P7g1Dwdo24+2/Qk51qThf0lAIave1YUIKcWnDDyAw9RiEMRVf1nQsddd1Tc6MxjGhBNNlwIZ3wqdBbXh8CF8IPW9B7wdrCDgm27SBbf7w/6SG4Y1oH83Kv34zT/VNBO9TljNYjp3LPGqLDFlIue6a07dC0FwtL7R2fYZcMmhvi/FD2/N2PFjozN1/VargRIt4qehaeq6+o7Nhqv3f+6IkAi2+ILcSwfFV07gp8WeFcXJQNdOt+aYG+4u6uTPO3uVil/o+lOki6ZVmOdBDBDQiW/aZU3VNEIAVRGNew4s9LjtXGvAde6IeGq0BPABpho6JlSwRgUcB3r1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHf5boFIjYVilFxMDKK8G79ubNvozCF3WcMqE+Px2gM=;
 b=MNVgk3i7aTRx0k24LnyVu2jI8mb2MOWikCWnEeZqyz95/tgaJpcXjxv3lIFvd/XqrO6/AcHIhUSKsrpnt327BB42vu7IE91i698xfJHRpSOj2IIRT+FbRdAEeNEBQcKXld17S81XrM5t8zKEV73pknJOq/Y8Gdu6ZJv0YlctWgTqGl1g49soV/zpERZ9mV1qSNNxzdREyqTVv57U7mQgeKm84SebBQt1qSMZDLlTJetlrFAYGqcNvXHDFHnNOggON8py/eJ7lidOuKGkKjrenCsunYoWONCL+VvS1rxwJX7VtwC9Eu77BuceggkE8bMWhsI8RU4HItVAsiJBeSxi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHf5boFIjYVilFxMDKK8G79ubNvozCF3WcMqE+Px2gM=;
 b=N26ORFdh/ZZ0WteFmzjNQUjDtEDnNFf1KJPwNBPTZ2RyiHOYGCcwrOYGlc7H8q19ojM+KuFpRTBVX9LDYPN0BMVBsnHJq39tW/ZS0YsNFSNR/PSv7KjsGFyhvOJl6iABLwjHMfzEHHq4un2sVOcRxXgHMQqLpsbwzUpl5zJrUefI2GjFy47pfM870P6sUh6uNHanxtbNUJQuShefiscWdPYe4sULoOtYrJmOqW0gx3GVE/b3005Tcc6VFslqhrVmX3WWaOGbr0e24n+C4EQkCk1mOnSCZLBMQ33iD/rYHce7b9PhLXmTZljWo5ILWO7CnZaept0qQHecy79MBIihyQ==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:38:43 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:38:43 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>, Frank Li <frank.li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Thread-Topic: [PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Thread-Index: AQHcmYj3KibrjA+Z9USNPmLPXE0SYbV58BGAgAAbgoA=
Date: Mon, 9 Feb 2026 08:38:42 +0000
Message-ID:
 <AS8PR04MB88335A77628AFD5B0E10B9D18C65A@AS8PR04MB8833.eurprd04.prod.outlook.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
 <20260209055745.1545129-4-hongxing.zhu@nxp.com>
 <VI0PR04MB12114A744F552574963ADF66C9265A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To:
 <VI0PR04MB12114A744F552574963ADF66C9265A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|VI1PR04MB7086:EE_
x-ms-office365-filtering-correlation-id: 4994971a-a218-4770-2075-08de67b6a1fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?dHEreHVWMVZMN1VpdkZBK2ozcXVyWTNvQ3RwR05hZ0xpb01aS2M3WXEzelpW?=
 =?gb2312?B?TmZTbVl5czZ3bTZPL3JwclZGQUV3cGNIKyt4S2ZLTnp4bXlGOXFLVjVlV2x3?=
 =?gb2312?B?SXV6SDdSREk1cUxRY0UrSHdvcGZRYnZubC9MTlg3UnV4RWQyb1V3dHUrc3VJ?=
 =?gb2312?B?N1RoWEJDbElkRVJDVGRHRHlvK2hjUGw3aUpDNXFWVlEzbXliRmRNTE0zd3dq?=
 =?gb2312?B?ZkpMUW9ZT2FSZm5maGN1dUdJRktZT2kxTytxMEVlOXJmQWZDN3hZUzRFWkZi?=
 =?gb2312?B?VitjYkRNdXBWdXQ4Vk1rb1lQWU13OUE0NDJ2Ty9adzU1eUhCT1FNcDAwdkhC?=
 =?gb2312?B?SExJR21xREd2OGJscUl5QlFiRHJIdDJaSG95UTBNRFBBYWcxV3VlMnp1TnpM?=
 =?gb2312?B?VS9SdndQQVNmR3l6QkFTTGJYNndhQUxRV1Rnd0J6ZXZxaHpHZUJzZCt1Mjhw?=
 =?gb2312?B?NTdpUXl2Y3ZUUjRoeURUVUJXQ0hzemloV3dZZFUyYWtBR0I4SE9wd3BDTVpX?=
 =?gb2312?B?cEwyVVZZVml2MVk0SXBMZzVPOXhWWnJVVzlGaFR0NjhYMS9iWjBzS1FjTEph?=
 =?gb2312?B?UEowUUh6Q1ZBSTVKK3ZBb3REbGxvSWdBL2N0dkQ2VnQ0TnlTZVRRL0NiT01i?=
 =?gb2312?B?aTRkeEg3dDBKRVZ3a09wSlFiOG54TXk3MGI1dzVVVWx0SlhkSEdVOEhmbXBL?=
 =?gb2312?B?YUtheTUzYVZweENsZTdUOXl2dHNYejNqMitoVWs4S3pTNythRU1qMW9IcFIz?=
 =?gb2312?B?Q0txaUVIRERwT2EycEt6c01iSmZueUxNVXh0amRQYkpHenY1VUZzV2FOVG9o?=
 =?gb2312?B?Smw5UmZ2dXUrbGRJWXFYYWhSUklleStYV2hBRjFPendLQzFWa0pGOEtDMjBQ?=
 =?gb2312?B?SEFLMmxNeFhWeWh1cWtLNFVoaXlhVHZOSEtEbUtmUWFFMTRBVkxNSmtEVnNu?=
 =?gb2312?B?eEhsNmd0ZW1ienhBZkZkNUt4b2YxOEhRWXg5RE9kT0VWUTVlMEV0aHp2Y2Qz?=
 =?gb2312?B?Z2JLMzNybnAzdW9SVmh2bWRtQ0R3YW1kQ29DM2pHUVRSdnk3TnJHOC9QQWx4?=
 =?gb2312?B?SVExVUJMUC9VVGsrSUYwb0RmL0JUaWpBaCsra29TLzBUU1FpOUg2bHJLd0dy?=
 =?gb2312?B?aXdUeER4MS9sVThtMEJLbkI5em45WThiY3RIR1pXTzFnS2d0SVpBMlgzZFUw?=
 =?gb2312?B?ZjE4UkxOMGg5VGNYL1NRdW9MaW9uVi9WTnJLWVNDQnZJTmRQYUhTTXhoYUJq?=
 =?gb2312?B?MTM5YzNRdTA1eXZBSll0RUdtK0cyODU4ZGh0eUNBYWtMcHBPS1lGNk9vVmlY?=
 =?gb2312?B?Mithd2xGdmFvaTBZMlUySTVYR0FsWE9qenRJR0NidmhGc3NvTnlnTTdSUGFV?=
 =?gb2312?B?a0JkQTlBUm9KSW0raFNBRUtISkhybWJETllZNXdBQ29FcU5rUm5RSDlVdml1?=
 =?gb2312?B?Y08vOVRVeEZpc3d5OW1yWi9CTytvbjNUZTBuNTRKYkFsN2dvdWRhOEhQOUVI?=
 =?gb2312?B?bGhseVpud1FCMzJvVWVnVnppUi9ZQkxsRjFlWmU3UW1leFNNdFpWZUFLQXdj?=
 =?gb2312?B?Sll2clUzbThXMWgxOTNzQ3NEYVZYNkdSbWFUSE1pRXQvdGdjaGt5VENXOUhn?=
 =?gb2312?B?RlBVa1Q3bGk0cEZHUjMvbGZzL1JES0RoN2E0SUd3dXB6K1h5b0thTGhROTNT?=
 =?gb2312?B?SHdtcHpjUmc2ZU1qQkp4TFhlQzNWRXIvZHpLazRZYjNvR0NtcWlWemJsMm15?=
 =?gb2312?B?TWlDWkRKdHNpOXYvMThEUGpaN200RTg3aVhsTm0wbDRQRUlhK2l5ekg4K0p6?=
 =?gb2312?B?WHN4Rm0rWlhHSmhlam9JbFRkSmdYOEhBMGxCMXcrcTAxWkh4Y0t0KzBLU21j?=
 =?gb2312?B?aHNWb1MvZW5scGFjK2FXWU9wKzRmeHpMT3VEWVBZU1RXMk5WOGFwekNnV0dx?=
 =?gb2312?B?cHpESlVYZkRQQzBTVE5KazFtZnRCcVBOTHpHcHJtemVmNldnczNJcjB0bUJn?=
 =?gb2312?B?NWlXV2ltV3Y5eEg2RkUxeDZMdmZnUHh2aG5zeUtMdkpsY01wT3p4ZXZ4TnNS?=
 =?gb2312?B?V2pqWUVpbFhGUk15cEVZZXNLZlV6R21peWdxTDlsWGtBTFl2d0oxMHEzUTE5?=
 =?gb2312?B?V21XNUhFVFJIRnRLcVJHN2dRTHM0V1FUdFhYZFNUNHdmemh1Q0ZyR2hOeU9E?=
 =?gb2312?Q?QwexlavbUNxnjizOtG3VvuI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Y0xUUno2NlNDd2FwL0FGRll4b2VId2x1Vmh5aDYwU1NnMjFTS2JVVlVmYkdr?=
 =?gb2312?B?ZnVvaVpZYVhSTGovSHkwckxVL3EwN3ZKdzBHTkljRmplWjBwUWZ2N0hadVNY?=
 =?gb2312?B?Y1B6MlpMcU9UeVJxSWdjQnlFMUlmeVdwanp3eDN4VS9aSmgzZnNobW9oUUIx?=
 =?gb2312?B?WkdYQUtPQXhaMVBSU0VCWmlqekFnc2EyZ2NzQjVpbkxFd0pDTXhid25lYWJW?=
 =?gb2312?B?dXkwUDE0M0g1WjZMVGlYeWJiWFhQQVB1TjZnTjNHYitEQ21kZzdPTk5saGQ5?=
 =?gb2312?B?UzFPeG5oalFwTSsyY0s3NEdMOWFURC9oWEx2TTRUSit0K2pxRDNDUjdzQllv?=
 =?gb2312?B?VTZRZ0xUQVVQQjd6MUZOa3g1SEhkWlJxYmZoWkxwNi81MDZhbDM4VC96bENz?=
 =?gb2312?B?SzRsUld4aTJPYk1Lb0tPaEsxMzFrVTN3dWFjNzd0R2RqU3BCVk9YQ2JpZFJI?=
 =?gb2312?B?bHFtZExFYS8vSlR0dHFCM3lQNktveENYOCt2SGF2UmUxdWdKZE1haEhiaVZ2?=
 =?gb2312?B?WktoWWZSR0F6SnQ2M0FPblNzeTRnQi9yeGN5aWFJZ3dyMXY5ZStMNlpwUVQ4?=
 =?gb2312?B?VlV3MC8wQzNRVDVxajZWeHBwTUF2STN5dG9FeDVURFRFeWQ0T0lOdVgzV2xU?=
 =?gb2312?B?R0MvVVZDNzNGcVRNUmN4Zm56TzZXTkxUY25JZ1pxd2dYV0piZzN3NWVtendQ?=
 =?gb2312?B?S29OUnVwUDgyQWpXM2N4OG00S3BDcGpmWEd0RmJoQWlpMnVlTEJZZ3prYlRu?=
 =?gb2312?B?UG5tVW9lUXl0YXIyK2dyYnh4dXJQU3Jzem9lY0syaEJOVENaOGlsd3dTWmov?=
 =?gb2312?B?UlRqYlY1emFFM3MzcUZZL3hyZHlQcjdwL2JSZWlyK21YQXZzcFlmV0tVa1FU?=
 =?gb2312?B?SXdNZjBiaTIxVlh1UHhWMmtaUE5IUDZ5NTVMVFZmVVNBVUtQWC9hdFpWaUgr?=
 =?gb2312?B?Ky92c1NDejNZL24zNUVWV245TGd1Qm1lZ2dQRkFDbVhid0lHbFFOZGtlTkFY?=
 =?gb2312?B?RE9XSGlKQ0FoNVFaN1JsWWxxY1VDODFQTzgvd09sN05Pa0R6ZzlYWGJMdkpN?=
 =?gb2312?B?WGlndXptMG5BRDA3eFY5VWxJNkNEVjlkUUF1dVU0TVE0L3o2R0tRMHBJQnAy?=
 =?gb2312?B?b2djM05uK1RROFJTcGRQUmZWcFhSR0szSnoxNHgwRDZkbWNVSUxsZjc5MTln?=
 =?gb2312?B?VjY3RUdJYU94aWdwZ09lUklFVlJkUzZXM2taRGVDVmxUbnhjVk55emRQOTZH?=
 =?gb2312?B?N3VyeUcyUlBwem5nSGpaRTZqWWVxLzV0VVNDSmhRdnJuSlAzTTkvVExCbkxK?=
 =?gb2312?B?MnN0Q3J2YUE1RTFLUHVxa05yQVczVlBnTWJIY1BFUStsRm5adzZTb1NPYmZD?=
 =?gb2312?B?N0tCYTlrOGszMkx0VEMvWlcySHNYR05wTUpEY2xLNlQzM1hwcGlpYVJZQ1JM?=
 =?gb2312?B?WUJEUFVac3h6TVQwN2Fpcml4M0EzQk9lcytiK2lUeCtJdEl4ekpST2sxeE9o?=
 =?gb2312?B?L1dMRzNkcGxTTFFyRGlsaDFmS0tDZHVDVFBRbHJhemR5TnJ4TDdQZnNPOFNp?=
 =?gb2312?B?WENRdi9iYjZ2YzQzK2R5czNWdWJaYTQwdWRwbS9rODhkWkFHclc1aFN4SDF1?=
 =?gb2312?B?V29zUDdDZmpuMEFNUEJKa2luMSt1TjBoQVhVNXhhWnJjMkZROERTeTlleEZu?=
 =?gb2312?B?aW10ZHBEVEliOGtqQlRkZVJSTzZNZmZpcWNxWUZYYjNYaEYvd1NZSHZnRHA1?=
 =?gb2312?B?dE5VaDhYSGprdFBlV29GbUM4TndWUTNwL2hHT2pTY0xEcVRkVUxxSnlMc1JO?=
 =?gb2312?B?V2FZSlBFMm9nWGFMc1dIVW55bmtvNURMaG11L2RJQkNaS2tKVE0yWTNja2pE?=
 =?gb2312?B?QWhJUDRjb3VienlqLzJEc2IvNVlYbU9zUjgwczVUMDBZdmsyS1FldUVWTVk5?=
 =?gb2312?B?dmZCRzZJZWxvWXpSL0d0cGIwQVQ4M3JGNzMyMVhESXQ3QTBjbnBlbzRmZzRo?=
 =?gb2312?B?N1Bab0tnalNsQjk5MitzOG1PNUM3UWVYcEs1NUNZTm41a2ZnYU1zbVY1cHUx?=
 =?gb2312?B?VXA0Mzl0aVVjdmFEdUZJTEUxQ3FvKzVodkJNOFJteStWM1E4T1pRY0FqTHZQ?=
 =?gb2312?B?TWJJQ09sU2Mrb1BtMFpuRWliZkNTUU5ybzJkYjJ6WElCZVlObFpJTWhLakIw?=
 =?gb2312?B?dzQ3bnc1MWV2QVBxSzl3MGpRY3RrQmhOcTR6SXNaS1B1ajJVZE1EV3FZNUJL?=
 =?gb2312?B?RlNScEpiWXNSREFVR0hmcHlEL2UrWDVPdHMyVUE5WjRPUTZHL1dZbkp6ZWha?=
 =?gb2312?Q?bNkG8svgnJqWbtAK0U?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4994971a-a218-4770-2075-08de67b6a1fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 08:38:43.1325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYQ50/Y+DGbqMiqOinxEU6/15rD2DRBj1PNAMZ5QVGRmFVLLcBLBkBZek/8YOArKOYtR/Jt4lkdK6M5SUNNGLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGVycnkgU3VuIDxzaGVycnku
c3VuQG54cC5jb20+DQo+IFNlbnQ6IDIwMjbE6jLUwjnI1SAxNDo1OQ0KPiBUbzogSG9uZ3hpbmcg
Wmh1IDxob25neGluZy56aHVAbnhwLmNvbT47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsN
Cj4gcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5v
cmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGZlc3Rl
dmFtQGdtYWlsLmNvbQ0KPiBDYzoga2VybmVsQHBlbmd1dHJvbml4LmRlOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggdjIgMy8zXSBhcm02NDogZHRzOiBpbXg5NDMtZXZrOiBBZGQgcGNpZVsw
LDFdIGFuZA0KPiBwY2llLWVwWzAsMV0gc3VwcG9ydA0KPiANCj4gPiBTdWJqZWN0OiBbUEFUQ0gg
djIgMy8zXSBhcm02NDogZHRzOiBpbXg5NDMtZXZrOiBBZGQgcGNpZVswLDFdIGFuZA0KPiA+IHBj
aWUtIGVwWzAsMV0gc3VwcG9ydA0KPiA+DQo+ID4gQWRkIHBjaWVbMCwxXSBhbmQgcGNpZS1lcFsw
LDFdIHN1cHBvcnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFpodSA8aG9uZ3hp
bmcuemh1QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDk0My1ldmsuZHRzIHwgODINCj4gPiArKysrKysrKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDk0My1ldmsuZHRzDQo+ID4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NDMtZXZrLmR0cw0KPiA+IGluZGV4IDc2NWQ5ZDA1
ZTQ4OWQuLjUyNGJjYjU5NTExNTEgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OTQzLWV2ay5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg5NDMtZXZrLmR0cw0KPiA+IEBAIC00OSw2ICs0OSwyMCBAQCBjaG9zZW4g
ew0KPiA+ICAJCXN0ZG91dC1wYXRoID0gJmxwdWFydDE7DQo+ID4gIAl9Ow0KPiA+DQo+ID4gKwlw
Y2llX3JlZl9jbGs6IGNsb2NrLXBjaWUtcmVmIHsNCj4gPiArCQljb21wYXRpYmxlID0gImdwaW8t
Z2F0ZS1jbG9jayI7DQo+ID4gKwkJY2xvY2tzID0gPCZ4dGFsMjVtPjsNCj4gPiArCQkjY2xvY2st
Y2VsbHMgPSA8MD47DQo+ID4gKwkJZW5hYmxlLWdwaW9zID0gPCZwY2E5NjcwX2kyYzMgNyBHUElP
X0FDVElWRV9MT1c+Ow0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwl4dGFsMjVtOiBjbG9jay14dGFs
MjVtIHsNCj4gPiArCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiArCQkjY2xvY2st
Y2VsbHMgPSA8MD47DQo+ID4gKwkJY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsNCj4gPiAr
CQljbG9jay1vdXRwdXQtbmFtZXMgPSAieHRhbF8yNU1IeiI7DQo+ID4gKwl9Ow0KPiA+ICsNCj4g
PiAgCWRtaWM6IGRtaWMgew0KPiA+ICAJCWNvbXBhdGlibGUgPSAiZG1pYy1jb2RlYyI7DQo+ID4g
IAkJI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsNCj4gPiBAQCAtNzAsNiArODQsMTUgQEAgcmVnX20y
X3B3cjogcmVndWxhdG9yLW0yLXB3ciB7DQo+ID4gIAkJc3RhcnR1cC1kZWxheS11cyA9IDw1MDAw
PjsNCj4gPiAgCX07DQo+ID4NCj4gPiArCXJlZ19zbG90X3B3cjogcmVndWxhdG9yLXNsb3QtcHdy
IHsNCj4gPiArCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7DQo+ID4gKwkJcmVndWxh
dG9yLW5hbWUgPSAiUENJZSBzbG90LXBvd2VyIjsNCj4gPiArCQlyZWd1bGF0b3ItbWluLW1pY3Jv
dm9sdCA9IDwzMzAwMDAwPjsNCj4gPiArCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAw
MDAwPjsNCj4gPiArCQlncGlvID0gPCZwY2FsNjQxNl9pMmMzX3U0NiAwIEdQSU9fQUNUSVZFX0hJ
R0g+Ow0KPiA+ICsJCWVuYWJsZS1hY3RpdmUtaGlnaDsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICAJ
cmVnX20yX3dsYW46IHJlZ3VsYXRvci13bGFuIHsNCj4gPiAgCQljb21wYXRpYmxlID0gInJlZ3Vs
YXRvci1maXhlZCI7DQo+ID4gIAkJcmVndWxhdG9yLW5hbWUgPSAiV0xBTl9FTiI7DQo+ID4gQEAg
LTY0MSw2ICs2NjQsMTggQEAgSU1YOTRfUEFEX0dQSU9fSU8yOF9fTFBJMkM2X1NDTA0KPiA+IAkw
eDQwMDAwYjllDQo+ID4gIAkJPjsNCj4gPiAgCX07DQo+ID4NCj4gPiArCXBpbmN0cmxfcGNpZTA6
IHBjaWUwZ3JwIHsNCj4gPiArCQlmc2wscGlucyA9IDwNCj4gPiArCQkJSU1YOTRfUEFEX0dQSU9f
SU8yMF9fUENJRTFfQ0xLUkVRX0INCj4gPiAJMHg0MDAwMDMxZQ0KPiA+ICsJCT47DQo+ID4gKwl9
Ow0KPiA+ICsNCj4gPiArCXBpbmN0cmxfcGNpZTE6IHBjaWUxZ3JwIHsNCj4gPiArCQlmc2wscGlu
cyA9IDwNCj4gPiArCQkJSU1YOTRfUEFEX0dQSU9fSU8yM19fUENJRTJfQ0xLUkVRX0INCj4gPiAJ
MHg0MDAwMDMxZQ0KPiA+ICsJCT47DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiAgCXBpbmN0cmxfcGRt
OiBwZG1ncnAgew0KPiA+ICAJCWZzbCxwaW5zID0gPA0KPiA+ICAJCQlJTVg5NF9QQURfUERNX0NM
S19fUERNX0NMSw0KPiA+IAkweDMxZQ0KPiA+IEBAIC04MDAsNiArODM1LDUzIEBAIElNWDk0X1BB
RF9YU1BJMV9EUVNfX1hTUEkxX0FfRFFTCTB4M2ZlDQo+ID4gIAl9Ow0KPiA+ICB9Ow0KPiA+DQo+
ID4gKyZwY2llMCB7DQo+ID4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfcGNpZTA+Ow0KPiA+ICsJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArCWNsb2NrcyA9IDwmc2NtaV9jbGsgSU1Y
OTRfQ0xLX0hTSU8+LA0KPiA+ICsJCSA8JnNjbWlfY2xrIElNWDk0X0NMS19IU0lPUExMPiwNCj4g
PiArCQkgPCZzY21pX2NsayBJTVg5NF9DTEtfSFNJT1BMTF9WQ08+LA0KPiA+ICsJCSA8JnNjbWlf
Y2xrIElNWDk0X0NMS19IU0lPUENJRUFVWD4sDQo+ID4gKwkJIDwmaHNpb19ibGtfY3RsIDA+LA0K
PiA+ICsJCSA8JnBjaWVfcmVmX2Nsaz47DQo+ID4gKwljbG9jay1uYW1lcyA9ICJwY2llIiwgInBj
aWVfYnVzIiwgInBjaWVfcGh5IiwgInBjaWVfYXV4IiwNCj4gPiArCQkgICAgICAicmVmIiwgImV4
dHJlZiI7DQo+ID4gKwlyZXNldC1ncGlvID0gPCZwY2FsNjQxNl9pMmMzX3U0NiAzIEdQSU9fQUNU
SVZFX0xPVz47DQo+ID4gKwl2cGNpZTN2M2F1eC1zdXBwbHkgPSA8JnJlZ19tMl93bGFuPjsNCj4g
DQo+IE1pc3NpbmcgdnBjaWUtc3VwcGx5Pw0KPiANCj4gPiArCXN1cHBvcnRzLWNsa3JlcTsNCj4g
PiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZwY2llMF9lcCB7DQo+
ID4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfcGNpZTA+Ow0KPiA+ICsJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsNCj4gPiArCXZwY2llM3YzYXV4LXN1cHBseSA9IDwmcmVnX20yX3dsYW4+Ow0K
PiA+ICsJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZwY2llMSB7
DQo+ID4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfcGNpZTE+Ow0KPiA+ICsJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsNCj4gPiArCWNsb2NrcyA9IDwmc2NtaV9jbGsgSU1YOTRfQ0xLX0hTSU8+
LA0KPiA+ICsJCSA8JnNjbWlfY2xrIElNWDk0X0NMS19IU0lPUExMPiwNCj4gPiArCQkgPCZzY21p
X2NsayBJTVg5NF9DTEtfSFNJT1BMTF9WQ08+LA0KPiA+ICsJCSA8JnNjbWlfY2xrIElNWDk0X0NM
S19IU0lPUENJRUFVWD4sDQo+ID4gKwkJIDwmaHNpb19ibGtfY3RsIDA+LA0KPiA+ICsJCSA8JnBj
aWVfcmVmX2Nsaz47DQo+ID4gKwljbG9jay1uYW1lcyA9ICJwY2llIiwgInBjaWVfYnVzIiwgInBj
aWVfcGh5IiwgInBjaWVfYXV4IiwNCj4gPiArCQkgICAgICAicmVmIiwgImV4dHJlZiI7DQo+ID4g
KwlyZXNldC1ncGlvID0gPCZwY2FsNjQxNl9pMmMzX3U0NiAxIEdQSU9fQUNUSVZFX0xPVz47DQo+
ID4gKwl2cGNpZTN2M2F1eC1zdXBwbHkgPSA8JnJlZ19zbG90X3B3cj47DQo+IA0KPiBTYW1lIGhl
cmUuDQpJdCdzIG5vdCByZXF1aXJlZCBhbnltb3JlLiBTaW5jZSB0aGUgcG9ydCBwb3dlciBpcyBl
bmFibGVkIGJ5DQogdnBjaWUzdjNhdXgtc3VwcGx5IGFscmVhZHkuDQoNCkJlc3QgUmVnYXJkcw0K
UmljaGFyZCBaaHUNCj4gDQo+IEJlc3QgUmVnYXJkcw0KPiBTaGVycnkNCj4gDQo+IA0KPiA+ICsJ
c3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnBjaWUxX2VwIHsNCj4gPiAr
CXBpbmN0cmwtMCA9IDwmcGluY3RybF9wY2llMT47DQo+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOw0KPiA+ICsJdnBjaWUzdjNhdXgtc3VwcGx5ID0gPCZyZWdfc2xvdF9wd3I+Ow0KPiA+
ICsJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArfTsNCj4gPiArDQo+ID4gICZ1c2RoYzEgew0K
PiA+ICAJcGluY3RybC0wID0gPCZwaW5jdHJsX3VzZGhjMT47DQo+ID4gIAlwaW5jdHJsLTEgPSA8
JnBpbmN0cmxfdXNkaGMxXzEwMG1oej47DQo+ID4gLS0NCj4gPiAyLjM3LjENCg0K

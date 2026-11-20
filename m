Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180680;
	b=xphNzlG79gippJAcxaPEsjBjRy8Rph6ys+xJ6UW1tRSqQJF0R8oZz2xezrd5ncJQV0Lf
	 4ELkpEByma9yiMH64AnyEByZwLrmsq3MgxY2OIc5VXiGL0tZUOfOaADvgfdsIcDGFcPc5
	 sD85SjNfEACQ2AldbXbbSf2Zhue4u28ArfZqE3FKURndj1BYkFLrMSE8T6WXSYtINkn4s
	 9fyrfInJvXxZ8THR+bgUDwq0+CjEALE49CY/vLbee64D+Z2QAQw+esKWjCJd/VlBcV3GD
	 B9KQH8P/5zj0FHVuj35q2da5BuZg9afI2N8KjN630JYgzkkccwG4AUh7sIsfJ2KADog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180680;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=lYar4ERybMkVAFfEuT1COCnv273MJ26JG6qyPnO9NUE=;
	b=vdVi+6O9PE3Nus1qBQeK9DiBxQJfyKUcYeVAktxT5EdRD+BaruTuqDwmGSmcfwDDuJt5
	 k/NjZxwwNGK87jIZXVpuutmY/ahvGlFr7fz7bDsqJjpxwWubdTKZNBZsojLv78FN27CR3
	 lZxaDFKpM2jI4s3vJoxHbQifuivL0WDVEIdTDphrv/xwK3VYNrMv1t+dxMHFc3YOQATBU
	 urE+LBjxcq5WNT0+gVDFMMhJHseucDLngB0pMIIdMdxeqSLFxfHRwSZcMlXHihsjHLIyk
	 XobqnfXkkW5he32slD3AXNtNI4sW2jeqB5fiDgQl1kOyZnhBpNCW/4Pd4oXx6IaIaoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=k1F1h0nU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.17
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F945606A331
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F945606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=k1F1h0nU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAq7/Ysnr2+KlT8LcduAkbuHAIAwsNGs7gc441JHmMx5aajS1y2B/Veisy0ZyRjICBK3wgnjNq//IimLHiRqkbwD+xU68jU3O4Y8QegNWUrIHAEL9Ro5HeW9gfMYzrkkiGcPZrAnuO1DHWwiwI5mzEcaGwWnBqXyoUc/IZeRDK2J3iw1G+UVZ4lUjmeeQn5oDxsndYAfAyOCPoBAFLSjRb1YK+rCPG4HluwJ8tCC+gbbQNB+a6RWdFmnUh/vnul0lLpn3lyQ9ft3uuyoYlHqeTmR2y6TqTrO4bqWLdHN2YUvxJu1bcEbQonBnIEtE648SgcIDuFbeqB93ekOkBfftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYar4ERybMkVAFfEuT1COCnv273MJ26JG6qyPnO9NUE=;
 b=oqs7UkIFvlpik/BRP3Z5e2woYTtTNiArzWRlgy0i82SHG96KO/F8s291k37y81s9OYOgPit02J+9td6BBQoz8Ce9j0EsMg+jZHQFfAw+LWu/TORn8pfmNxbqqHyoKf2LLSau64uaR1Lzp9qLbRbDvI0VCXeY4D/6MfvnlQCpwXoUIi5UxL8tLvN6u3CkNYN7wIUOdPZsihEUK/h6069wJbrgv5OdE9XoFRIcubz3P3jt1i7BsHcYeskET+NHtqjBjr+fd1J5qTNaxnQ1Uv4UleXTCtfDhS4/yJmv9tf0F/DSLH00XpNmpmlt/XvnmHxLpu48jw1XnfvQWkT1oMfDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYar4ERybMkVAFfEuT1COCnv273MJ26JG6qyPnO9NUE=;
 b=k1F1h0nUM8+TEZjrBJNDfOuud8sDpvGd4B42u9BeZBMRThUCIM+ETIUylmfhT+bG7dmfHaS4Yyd4HTz45dyIcTfpf54F6MyT2gXjCGclvlS1GFaHHXXWIhfuXWOwrOT/7hN7Zppmf1H13mtXMdzP1mewh2cqlMPTBQSKQXyYLrbaDzEP+iEaw+CiFDF93erumAQWoE8ugkUS8zaf6tjH8nQyn0WjCiuEe7fWmGlA3fM+Y+CokRmIOeki/xHap/wMcx31g/a/gZwdlpqDUiXQxY4gnvR8rSJqYiZt7FqyMqhRK4Y6XlQF3kmd97QIATUpSoNsoFC5hAYtEOapZs2COA==
Received: from GV2PR04MB11740.eurprd04.prod.outlook.com
 (2603:10a6:150:2cd::13) by AM0PR04MB7012.eurprd04.prod.outlook.com
 (2603:10a6:208:19e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:17:53 +0000
Received: from GV2PR04MB11740.eurprd04.prod.outlook.com
 ([fe80::ca5f:7e1c:a67a:a490]) by GV2PR04MB11740.eurprd04.prod.outlook.com
 ([fe80::ca5f:7e1c:a67a:a490%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:17:52 +0000
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: dl-S32 <S32@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang
	<wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Russell King <linux@armlinux.org.uk>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM) networking
 support
Thread-Topic: [PATCH v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM) networking
 support
Thread-Index: AQHdeHFy941yQ5MhvU2TY9th978Ugrc28Tug
Date: Fri, 20 Nov 2026 13:17:52 +0000
Message-ID:
 <GV2PR04MB117404F745B116346797F1BF196782@GV2PR04MB11740.eurprd04.prod.outlook.com>
References:
 <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
 <20261119220034.1658710-1-eballetb@redhat.com>
In-Reply-To: <20261119220034.1658710-1-eballetb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-11-20T13:14:22.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB11740:EE_|AM0PR04MB7012:EE_
x-ms-office365-filtering-correlation-id: c5955cb7-ba53-4cea-3c3c-08df4708ae88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|38070700021|10067099003|56012099006|11063799006|4143699003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|18002099003|6133799003|22082099003;
x-microsoft-antispam-message-info:
 DCLa/hbBoFwnKVeKlxxO6hOqkIrOoEJKL+E/+YZyu2woydOkVF9rl7UQgyNh/ovsW0Du9JrFpR+buATRAfQWPJO3mwgz2RFf8ADk6BnzRXcZ3hWPNNp5Xm0RN5APG5TFlH0/YovhN6uziDaeexWbEl5qQripJBwP9tuH8KpPYI58/043SaxBCRLiYS7i2bp4QvgHXdKnuXGYmyYc4lpcvZu26XkvqxaRmtsUFvx1dtQyAsKskPnAXmcFV4PvBjlFIUJIEQBBvMvxG3GvcLfBtqPfninEPSCBRujnsZ6XDAzILM22SR90s/8zfy443DEmdE2WaXZZOPQ8LzjdPDi8SqHs97hJ5WoJb1G6I89Riq5yDAdWoohKLuS7wPtulLnpZxUAtrNBNNc9yx1iMIgjh8gWa74tWFWbHupgA4oU+8cDgB5pyhdn/7FYfrorSKWlG8+shUXuY1Wap5p6Xy3CENfimuCslbCwqVk3kjfQ5yjqM/HHj5F8E1BojNSByPFZHt+1JdrBpThPY+E1Nfzz9HFvCcUJyHsCJ/UBcAf3e8neEubjwCZA6i/S7d99M2FCSY3jrc+qNTbCE/I00Jd+yMG0gRf0pHNB7Y5L+K4gRtybZIE51piOvzt8oI/G/20vhYHrRsD5UYxeQdot55s/IdnGyAKk3N00K+CEqjXKFP7rRK2NP53dgDH8vthUIbcAkgnoIE6X4HVaVLlW3Pih9Jo36jH0R9rkig3J6+oe1qk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11740.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlpDcXlHcGE2TDYwS1VpMG9aRXJhV2NESThYa2p6d1lQa25TWFJUdWtnWHQ1?=
 =?utf-8?B?dU5UQVlNZzdhR3dEQWZ4NE9JckxNWXhXYzljSlhPRm9RODUvWGRpQ1hSQW0v?=
 =?utf-8?B?cHhXQ0Vld0M0aSsybVBpdy9QUm1BZFlNRXZ5dzlkVVJUS3FtelJLME15OU5Q?=
 =?utf-8?B?aGZUYXBHS09PN1RmTWlRZWhhYWVjRGRYbEpVMytwRXFIbTdBVVBLckVTOVdn?=
 =?utf-8?B?L2FyeUl5WFpib1ZUTm5HMFp6bWprMUt0anJrWlYzN0Vja3pBc1Z5SkFNbkhn?=
 =?utf-8?B?a0lUaFlsT0ppeUhJZGM3ekFBeHpEcUdMVUxDQXZ4MmJUK1BWd0VaMndvMXlL?=
 =?utf-8?B?NkVoMEVvUkl6M1RQYXF2RWZrc1FTcmJUM0t3M0todU9yRmdLd2lTdjIrcDY3?=
 =?utf-8?B?SG95QXB6dk5BSHJPZXBBbmxXc3poR2FRQ2laR0M2Q3RtQkpqR1RRL290ci93?=
 =?utf-8?B?ajNUVXdsb0hLK0ZEc2lQejdZZ1ZUM0Jqa1BDNGprdG9BTlJmc2JwL29nRHpE?=
 =?utf-8?B?TStRV0drUHZoQUZCYmR4NFEzTlhXTXFuYnZhd1ZWTUh4ZjVtUitKVjllZHJi?=
 =?utf-8?B?KzdzK0hlcFkzSXNVZ0Jpa2JZWEorWU1WY1BNeHBQc044TTRBK2dqRzBJVXJ5?=
 =?utf-8?B?V1V2bk5EMjFxakFnYUdTV25sV1RsdGVSaXJJbnA4L0liNHo4NUo4U0lYbmV6?=
 =?utf-8?B?OTlhdEN4WDBXUGc4T1pFOGhkYnFraUo0UGZYOUZlS01ZL2RsVHk3VEhFdlF6?=
 =?utf-8?B?bWF5eDIvUWtqOERzKytMYnJ5MVliR1FNSnJPZHpEbUZ5N0pXWHJMRHhPcE1n?=
 =?utf-8?B?eUlvMDhZRE9ielIxcFEvTlMvWGl4RWRLMUwwbU80aTFGeFRmcGlBMDBpTnFu?=
 =?utf-8?B?TXZ5U0Z3dTc1OC9iMFJEYkRMMlJhd0FQbHNlZStmYVdmRkhlREFpanJUTDd1?=
 =?utf-8?B?MmRpNVZwVWdxbXNLdmE3R1FDNGx1RWpEK3ViNndnbGFqeDNYelRSazZxYzlS?=
 =?utf-8?B?YmpZdkNpSGphMVg2NkEvQ0tYekRCQjF4M3lYS1VEbklXTHo0QzBTRXBQN3hl?=
 =?utf-8?B?YnBCdXRrTHYrcXdTT3k3b0xveTUvejJYV3NFVDBoR3hFWEJvTEMyb1J4bDho?=
 =?utf-8?B?WlJONmo1TWt1RVN0MmIwMGFnaWR3YnJuTE1BVXJXUEdZRDlaQzZiYXZoMWhN?=
 =?utf-8?B?aEc0NHVadWVkTDRIaVF5VEo1d3VuTEE0cWozclEwY1ZUemJoRW80cFEwb1lj?=
 =?utf-8?B?Q3ZjQ3lMN20rcVZvK0d0R0t0VmtnSjRONTR0OUNkdUluRXFvQTEwYzdic1hp?=
 =?utf-8?B?Z3hCSFFXQU94WHhSV0JJWHdkMjN4eUZhZkZ6dndQR0c3NEwwb1RhWGg5Smht?=
 =?utf-8?B?czRzY3dBU3oxRHd2aDMxbHhzS1B3Smxya2tpOEZyVUVjOG9VTVpXVld4eldj?=
 =?utf-8?B?c2Q1Q2o4akpxRFFseVVRR3h5b3Z0dWYyYkFLNlN2cVVSYlNEUE5yaVl4Q1Fj?=
 =?utf-8?B?VFJ2RTkzZ2o4amltUm93YTZMVGh0bHBqV2tNaTBZV2srcmZvSnRtK0lWTWJI?=
 =?utf-8?B?bkl5NGFpay9DbzNWQ3FadDJJaEhxdWt4REhUSTRKZnBKbGJPZnQ5K2lnMkQz?=
 =?utf-8?B?U0xYU3hMcXEvdjMvbFdNM2RvK1U2dHV3ZlpkaXhqQ25LTlcyUHBlY0NQOUpU?=
 =?utf-8?B?Ty9Wc2tQekpKYTZQRTNXWDZPSlZwdVRoZjEvcWpJNmx2SUk0ZHZQb1lvNnp3?=
 =?utf-8?B?M1VKVG1QeW9HS2VnaWdQaVp1bXgvby8wSTV0bG81VzhUSkdLNHlSTzNqTGEv?=
 =?utf-8?B?UC9jQlJtTFJzWkd1UUNvUFl0WlRjTGFJU3VpVEh0SzRlcG5HQ1g5Wld5eHh6?=
 =?utf-8?B?WlFXQ3RjQ2kzd25VNzh1LzNOd3A5Njh6Wm1uZmw4VGRWTGY2Ym9zZnlMS05V?=
 =?utf-8?B?QjQyTTN0ZXpuUzEySkhvV0R2enluRHR2YWQrdjNHQ29nNlJ6MjRkNU14U1dX?=
 =?utf-8?B?ZXBCVGNraVNFZjlXK0d0ZThTZDNkR3ZoWUZlN1dSblV0UXR4d2pPQUR3OTly?=
 =?utf-8?B?MkdaM001VlFBTDNvZE9FTG9XL2hBdDAzZzR6d3IwTElzVXhGWDZ6M1FLM0Zx?=
 =?utf-8?B?c3NGTmwxVVh3c2tZdU56aWlBUVBzeTN3TnREWHpUSWE5SG1IQ29teTZCNGJG?=
 =?utf-8?B?bzJVdjIwWEd0dXhzUXFFQ2xNaDVrSi9EY0w2T0g0WnVyUkNRRWZJQStPanBl?=
 =?utf-8?B?YXJhZGcvUGozcVVReHMyVTBXcGp2amdOajhBRzE1S1Y4WFlaQ1NXVzV6T1o0?=
 =?utf-8?B?UHlydlBuL1F1c25JRGg4bWJzZSt6WnovenNLaWRlUWt0R3gwUGl1QT09?=
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11740.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5955cb7-ba53-4cea-3c3c-08df4708ae88
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 13:17:52.3039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ena9R5cjnNujuOvtHaWgXxxmqM7hhGGTrMGK0BJqnHSlyGWW1Xv7NLNRaQE55VItvUHBLy57Y75iBYqjHQZUNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7012

DQpOWFAgQ29uZmlkZW50aWFsDQpGcm9tOiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlYmFsbGV0
YkByZWRoYXQuY29tPg0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyMCwgMjAyNiAxMjowMSBBTQ0K
Wy4uLl0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwLzZdIG5ldDogZW5ldGM6IFMzMk43OSBw
c2V1ZG8tTUFDIChQUE0pDQo+IG5ldHdvcmtpbmcgc3VwcG9ydA0KPg0KPiBPbiBGcmksIE5vdiAx
MywgMjAyNiBhdCAwNTowMjozMVBNICswMjAwLCBDbGF1ZGl1IE1hbm9pbCB3cm90ZToNCj4gPiBU
aGlzIHNlcmllcyBhZGRzIG5ldHdvcmtpbmcgc3VwcG9ydCBmb3IgdGhlIEVORVRDdjQuNCBwc2V1
ZG8tTUFDIChQUE0pDQo+ID4gcG9ydHMgZm91bmQgb24gdGhlIE5YUCBTMzJONzkgU29DLiBPbiBT
MzJONzksIHRoZSBFTkVUQ3Y0IHBvcnRzIGFyZQ0KPiA+IG5vdCB3aXJlZCB0byBhbnkgZXh0ZXJu
YWwgUEhZL01JSTsgaW5zdGVhZCB0aGV5IGFyZSBpbnRlcm5hbCAicHNldWRvLU1BQyINCj4gPiBs
aW5rcyBpbnRvIHRoZSBvbi1jaGlwIE5FVEMgc3dpdGNoLiBUaGVzZSBsaW5rcyBhcmUgcHJvcHJp
ZXRhcnksIGV4cG9zZQ0KPiA+IG5vIHN0YW5kYXJkIElFRUUgaW50ZXJmYWNlLCBhbmQgcnVuIGF0
IGEgc3BlZWQgZml4ZWQgYXQgYm9vdCB0aW1lIGJ5IHRoZQ0KPiA+IFBvcnQgUENSW1BTUEVFRF0g
cmVnaXN0ZXIuDQo+ID4NCj4gPiBBIGtleSB1c2UgY2FzZSBpcyBhIHBvcnQgdGhhdCBoYXMgbm8g
ImV0aGVybmV0IiBEVCBub2RlIGF0IGFsbDogTkVUQyBpcw0KPiA+IHJlYWNoZWQgb3ZlciBQQ0kg
ZnJvbSBhIGhvc3QgdGhhdCBwcm9iZXMgdGhlIEVORVRDLCB3aGlsZSB0aGUgaW50ZXJuYWwNCj4g
PiBORVRDIHN3aXRjaCBpdCBjb25uZWN0cyB0byBpcyBub3Qgb3duZWQgYnkgTGludXguIFN1Y2gg
YSBwb3J0IG11c3QgaGF2ZQ0KPiA+IGl0cyBmaXhlZCBsaW5rIHN5bnRoZXNpemVkIGF0IHByb2Jl
IHRpbWUuDQo+ID4NCj4gPiBUaGUgZHJpdmVyIHN5bnRoZXNpemVzIHRoZSBmaXhlZCBsaW5rIGRp
cmVjdGx5IGluIEMgdXNpbmcgYW4gb2ZfY2hhbmdlc2V0Og0KPiA+IG9mX2NoYW5nZXNldF9jcmVh
dGVfbm9kZSgpIGFkZHMgYSAiZml4ZWQtbGluayIgc3Vibm9kZSBvbnRvIHRoZSBQQ0kNCj4gPiBm
dW5jdGlvbidzIGR5bmFtaWMgT0Ygbm9kZSAoQ09ORklHX1BDSV9EWU5BTUlDX09GX05PREVTKSwg
d2l0aCB0aGUNCj4gInNwZWVkIg0KPiA+IHByb3BlcnR5IHJlYWQgZnJvbSBQQ1JbUFNQRUVEXSBh
dCBwcm9iZSB0aW1lIGFuZCAiZnVsbC1kdXBsZXgiIHNldC4NCj4gPiBwaHlsaW5rIHRoZW4gcGlj
a3MgdXAgdGhlIGZpeGVkLWxpbmsgbm9kZSB0aHJvdWdoIGRldl9md25vZGUoKS4NCj4gPg0KPiA+
IFRoZSBzZXJpZXMgdG91Y2hlcyB0aHJlZSBzdWJzeXN0ZW1zOg0KPiA+ICAgLSBuZXQvZW5ldGM6
ICBwc2V1ZG8tTUFDIGZpeGVkLWxpbmsgc3VwcG9ydCwgcHJvYmluZyBvZiA0LjQgZGV2aWNlcw0K
PiA+ICAgICAgICAgICAgICAgICBhbmQgYSBmaXggZm9yIG1vcmUgdGhhbiA2IHJpbmcgaW50ZXJy
dXB0IHZlY3RvcnMNCj4gPiAgIC0gYXJtNjQgZHRzOiAgTkVUQyBJRVAxOCBFQ0FNIG5vZGUgb24g
UzMyTjc5IGFuZCBpdHMgUkRCIGJvYXJkIGVuYWJsZQ0KPiA+ICAgLSBQQ0k6ICAgICAgICBhIHF1
aXJrIGNyZWF0aW5nIHRoZSBPRiBub2RlIGZvciB0aGUgRU5FVEMgUE1BQyBmdW5jdGlvbnMNCj4g
Pg0KPiA+IEJlY2F1c2UgdGhpcyBpcyBwcmltYXJpbHkgYSBuZXR3b3JraW5nIGZlYXR1cmUgYW5k
IHRoZSBwaWVjZXMgYXJlDQo+ID4gaW50ZXJkZXBlbmRlbnQgYXQgcnVudGltZSwgaXQgd291bGQg
YmUgbW9zdCBjb252ZW5pZW50IHRvIG1lcmdlIHRoZQ0KPiA+IHdob2xlIHNlcmllcyB0aHJvdWdo
IHRoZSBuZXRkZXYgdHJlZS4NCj4gPg0KPiA+IFBhdGNoIDEgaGFzIGEgcnVudGltZSAobm90IEtj
b25maWcpIGRlcGVuZGVuY3kgb24NCj4gPiBDT05GSUdfUENJX0RZTkFNSUNfT0ZfTk9ERVM7IGFi
c2VudCB0aGF0LCB0aGUgcHNldWRvLU1BQyBwcm9iZQ0KPiBwYXRoDQo+ID4gZmFpbHMgZ3JhY2Vm
dWxseSB3aXRoIC1FTk9ERVYuDQo+ID4NCj4NCj4gSGkgQ2xhdWRpdSwNCj4NCj4gSSB0ZXN0ZWQg
dGhpcyBzZXJpZXMgb24gdGhlIFMzMk43OS1SREIgYm9hcmQgcnVubmluZyBsYXRlc3QgbWFpbmxp
bmUga2VybmVsDQo+IGFuZCBhcHBsaWVkIHlvdXIgdjQgcHNldWRvLU1BQy9QUE0gcGF0Y2hlcyBv
biB0b3AuDQo+DQo+IEkgdXNlZCwgdGhvdWdoLCB0aGUgTVJVIE1TSSBjb250cm9sbGVyIGZvciBO
RVRDIElFUDE4IG92ZXJyaWRpbmcNCj4gdGhlIHVwc3RyZWFtIG1zaS1tYXAgcHJvcGVydHkgd2l0
aCBtc2ktcGFyZW50IHBvaW50aW5nIHRvDQo+IHRoZSBOWFAgTVJVIE1TSSBjb250cm9sbGVyICh0
aGlzIGRyaXZlciBpcyBub3QgdXBzdHJlYW0geWV0IGJ1dCBJIHBvcnRlZCBpdCkuDQo+DQo+IFdp
dGggdGhhdCBjb25maWd1cmF0aW9uIHRoZSBFTkVUQyBQRiBwcm9iZXMgc3VjY2Vzc2Z1bGx5IGFu
ZCBuZXR3b3JraW5nIGlzDQo+IGZ1bmN0aW9uYWwgb24gdGhlIGJvYXJkLiBTbywNCj4NCj4gVGVz
dGVkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlYmFsbGV0YkByZWRoYXQuY29tPg0KPg0K
DQpUaGFua3MuIFRoZXJlIHdpbGwgYmUgYSBmb2xsb3ctdXAgcmVnYXJkaW5nIHRoZSBNUlUgTVNJ
IGRyaXZlciwgYXMgcGxhbm5lZC4NCg==

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795017668;
	b=BJuL7S3KZ8LbUVm2+fH/h/yERTPMKRd3VOmIeH91C5H0JccSHQDRrwWMAKejlmCLI6B+
	 cLm1lBQZbCMhXh7c16/DWhm+qFqDThggQ7oT8TgVf6YONYWfH8btQwj3NeiQbED2ziLIc
	 XAKvcl0ZBfT9A9vwUR1k5xjpjEK2RRhqlc5VMdRHWqDmrd+xSl8XHgN8WPUZ4YcpAJHNT
	 7heM1/Ka4FEBmEOPsg4NXBzpyr8GgjqXQTpyCEyKv9zxnBknAq/ME3HSwKiGZIKbsNiy3
	 0DjqEJo2wV8fE9gNM/ddqYaGlYHxyFBurkXgnQcxi9+xRZxPy4IpZOLt1mAY8y2lbGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017668;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CiXqUQZYouMNgPNGRQIxrM/PyjF7aZMYDgEmHwPJOkw=;
	b=IMkUiZRfi/zTA40SSW4t0GNSOBkKekr6y9AmcCbcDeORJZbkg4JNwTiSW5alMuDCUEWq
	 HZDNtDfldpNWoNk/c/eeNNteDo0UdmjETMzls4406RYJlbP3c4x7SCHo+/LNWD5XyV+W7
	 Ql2tkuhD/h2PI3KmNF45lyUQLL2frtrht5uS9BwdE+w2hsN/w1APdw9sEn+d84zObvXiw
	 ExBIDDfC/vx4sOJsYHsMckBVqDxF0U4Ub+d5+psVemeI86Abn5iM+/8Mh7iDevYbIIN5p
	 64ifRX5W4hO24KUKPAKmvyKUH9Jj2QL2EosjbrzgvjFXvam8vhQH2QYvPi5p4s5FZew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=rm2DMK9Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.85
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022085.outbound.protection.outlook.com [52.101.66.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BA4606A330
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BA4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=rm2DMK9Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsqEiiwDifT6ndvKOzdquiORfp2jFDtOJa4NUoi1qgbRiL+Qnysg6ykZKETRHI9pQehCQuKPMf/CXGqa0B2a67YK+xyh01PKK1k+m4/lguG9vRpR5mD/beqsq5n8LF/Ng6UKjaRc1i7SMj35cNouwdxdHeywqwDzWC0NiOiEyhA9/tOSRsDI33hbws+eDvLmrFxgWnYXczGLX5gfRyWSkaeYCaQWoq4+hx0XsgFqavEfWvrXm63hXAy0nIUROGG+n/IeVSBx06psLVn6vm0N8Z85pmdASluHPDH+NNo9tD9wDAktxkPnyFhacBT0z4XuQLCq6dF0R5hSgzedpoDS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiXqUQZYouMNgPNGRQIxrM/PyjF7aZMYDgEmHwPJOkw=;
 b=DtHalefi3m6w+S7qM2mS1vtIhCriqTT3CFSU35xCocqNzFs13zePPfBV1fmlTks0qWeryoxceDgsqRD9xRUvKwIIvaeNSTeq0PB3OKpN03ZMN1vriCCl7p7QjyLQEyd2HrZxwD4VjrQxQIZnYZQf/f2jy6TiP9LuaBpRBv0lFlRBHWk5cbi4Wu+nsB0Ap+WzGqi1NLzqP9KBXm7QY7x0WqQUSNkU60qyfu3WlcOmus8b5/JyFvjixvNzcNCQf5V3GcUm8tTd9x3Fp8VAk4bxTHnmE+j4hP1ruuGpXyu8j4udqNJIp0ejisM5+J6opaN1/0RZZuJuqB0aaPxm7OcstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiXqUQZYouMNgPNGRQIxrM/PyjF7aZMYDgEmHwPJOkw=;
 b=rm2DMK9QtK8r/pwYKC3FLG6zXMrt+rQx8oElQdpAfHdsIgvXmO8JLr8UbeYXlwDGO/ouQ2ZP6HNjfndkird9h18VoaVvEZi9bpCgKyBoUSVbDOKsSA31gfrKdQLllteUuB7uzF3mMASxyE4+o5mnpG8Gv7h/HluyOyb9G6+8iQo0tIhkztURF54JTUiS8mvA3M1ViJIUcd1bq41tCUqHu5MCflr8MI+yd3zvvfLRHf9TfvMacfTN3iH2R6cRrQSkkkNhMXqgw3r2YgwdDpwlrQRYndH2P3wuLhf1pWwNLT+2EFNpfUjW/DKnzX2iE2iPQTZGhw3+5TsiTTV+Bv7cNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Wed, 18 Nov
 2026 16:01:03 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 16:01:02 +0000
Message-ID: <a2d7056c-602b-4c6b-bb14-211843aa3183@kontron.de>
Date: Wed, 18 Nov 2026 17:01:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, pankaj.gupta@oss.nxp.com,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
 <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
 <180d2335-e328-48a4-b376-a90464279027@kontron.de>
 <3acc652b-d2e2-4a18-b70a-2656b309d798@kontron.de>
 <av3KA89WuUc5GdZj@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <av3KA89WuUc5GdZj@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS4PR10MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 681ef51b-220c-4fef-34be-08df458d253b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|10067099003|261028144727099003|11063799006|4143699003|56012099006|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261021135927099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oWsxDq/x+2tjuiA+2vUupu4NsuvhdwhGjx7DAwWbBZrVxhBw2OxX7PgtNtPvilic0LxFHhVHali2gxvA2GxlL9UX0NUKCuc6Qgkt9gfrFucutNG7wjqWenh1Hp5HhudHn5JhpJjzUfqW32bejyK0Dtstn+ayGeN/ZW2yOu2Z3IHLzWgKtw9plCS26eA40oJaJkzk9rAiF63KzBXfktlVzR5WHJmHhUqOXMageWIweSS3vQwjZsEf78U+r7mH2arFzZyW10B/TCD5YTH2M6xGGSbRrop0nAgWVSHvHH2b78lNQPWxK8EnnEScjdA3zJSranS0FOKnTyIVVSAfCtsmONLLwu7j6BJIawJPRqd0SVnEAwLOzP6Y+qgQdLMAgxtMRYOwwzw1lFicAN1E86KlOz9fKnlFNx+AoIHYJ/j3daxTA64n7z8PhQ1nltIzMLNedZ0JoGmzP+MLOM4/3H8LlRlw9nT1ksaM8d5W4Siwzawii2gYfOf1+hziKuebfZJIDDHoJtfuL0t3cJ2Ckn82BOQ6h5YjbMxW0CI2aSYWkaQ1u7RhG0qIA4xHlfTsKMKbWeMhlyf0Dwku+x5VmYzalBaPUfN7KxwxwjWO5sOaefw51od9DcBbiUXVm2poZeUz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(10067099003)(261028144727099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261021135927099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blFLdGNQdkhJSmZFaUdBdjVTWXk4V2xlcXpHdy8zT2V6NEM3TDAxdlBLaVlE?=
 =?utf-8?B?a2VZUzVzOUNSSDB4c3lZWG83dVlmNVRheWNJeXBvdlgrdy8xK1l6Yzcxa0tM?=
 =?utf-8?B?eTVuTFl5ZFM5OTBSK0RhNGtMY0pZN05YemRyUW1LOFlmaHJscVVCMWE5Yk41?=
 =?utf-8?B?cGJ2em8zS09DUzJwc2VOckpWa1R1NzhTaU0vdENKSndFYkRobHY3bkZHSTVx?=
 =?utf-8?B?cGxBZzJYNmxicStRK2xpUnh3RWtDa05odEcxOURyS2pPclB2MVYyUGxuSk1U?=
 =?utf-8?B?TXFyc3NzU0F6cDFDdkdjUXgyL3kwaml3MzArL1RTcDVDamFPcnFrLy81N2xo?=
 =?utf-8?B?ZzMrdE5QWmpLaDhKdng4V0xablBtU2NKWE80MGxDaDdZU1B3Q0NhVGR3RWFW?=
 =?utf-8?B?OUpLbU9nMmdjNklrUmdFNjMyR05mQ0xWdmREUHNPRzB6TXlYSjNNSnRmZ3Ir?=
 =?utf-8?B?U01ETXRlR3FMc2I3K005NUdVNEFpOGdiMjVoYTl5cjRXWVNQL1d2VTFxMVY2?=
 =?utf-8?B?czVzbVNsRE14MmVoUFV4bHl3SGVRVGJkQTFCNVFyMEQrUm1sT254SnNHSmpp?=
 =?utf-8?B?SG9lTmZteE50L2wwc1pXQ1ZzcWFVRFpPelFuQkFmRkRwN3VEZWJ1RS9GdlBM?=
 =?utf-8?B?aVlWeXFTVWdMVmtqdzF0NHdpUDVMdlc2SEYxa3RoVStZZEZqZmhwS2xoWTBt?=
 =?utf-8?B?TEJlNWJPVlZ3S2hqMkNSVDdqbjQ3amtSRWdlb01YSnRlR1JjUkw4TzJPd3I5?=
 =?utf-8?B?THEyUWN4QUlubTZQQmxBUVBHZjhYckF6VC9nWldKdTdzczQ3MVI2MjdacTFx?=
 =?utf-8?B?eWluM0YwcmZROUZVQ1d2STV0MmtaZGdsTDg2YXAyLy9GUDZFaTF6bGxLekRI?=
 =?utf-8?B?elJlVmdwVFVsNFdQOE1UTC9LUjUwTUJVRFZZc29yWWI1Vko1dHNsSUlsSERj?=
 =?utf-8?B?aGl2TTRncHI1K2k4cnN4ZkcvSDhxdnJQdUNqbFFJM1Bzd1ZDdGZ2VXhmRGcy?=
 =?utf-8?B?aHJscDNCNnB3OHhNS25oV2NXZGVrZ0lhb0FzZWZncVptTjcvWjI0Skw2MXd6?=
 =?utf-8?B?aFdpWkVUbUpDNGZiRFNUQis2WUpudVRiT0tDd3Bka3g3bFZpcjVPcmVnNk15?=
 =?utf-8?B?WWo5c2xDcStwdE9ZaTlJNlVxZS9QSDJHaWpjTjY5eFlZeWorUjZTZjh0OE13?=
 =?utf-8?B?d1NOa1BUVXZ6OWwrYWN1d0FEUXc0cHA1QnFRRU1BWktLYUVQVkNES1NMQitZ?=
 =?utf-8?B?TENNQmdlTXhaSitTMUdDUDlGKytnVnB4dzE2WmhLTFJGRk1HQlgyVzNDRXBS?=
 =?utf-8?B?UkhuaUtRZW50SGJyelFPQmZ6T3lhRC8vZlVIZmVxUFJBTTkrbWh5bk82R0JM?=
 =?utf-8?B?YXVza3lSS1ppL0tRUkgzcGcwME1jR3YvR1ZndW9YNXpVTjFOMWN6ZE1OcldC?=
 =?utf-8?B?b3dtckI0TVRydm1wbzc4TjgvQ05NZ2FmU0JNUm0rS2UyRmlvMU5pTGEzdFRu?=
 =?utf-8?B?UHVLL29YY2hwT0RabHRtNGFGRXJhcVYzdFVMcTEyN0hRbEFQSVFlaUhPUWxN?=
 =?utf-8?B?MlVVbzl1cTd3STJtWHVoNHpWYmhEMmQ4K2JJNTNzVkwxbWFGZHRQM2dnYWQ2?=
 =?utf-8?B?K1hJLzR3d2V5bW1JUDFTcmkvV0lqeEl6L2dQWmVkOXJZK01IaHAzd05GRTQ4?=
 =?utf-8?B?dXEyVm5uQVVhQ0EzZDVVM2JFSkx5VFRpazlyVVc3QVRkdXRmYVhQZ0tTdXNZ?=
 =?utf-8?B?TjVpTmIyamdkTUhrQUI1NkhpY0N1eDBxY2Fjb0wyeW9xTzNxb2FNaHNlem1M?=
 =?utf-8?B?eUZBQTE3dGRLZnoyRkRIMmZmQXJya2xzM24zbVVnQVAyZC93aGsvR0drcmJE?=
 =?utf-8?B?Z2R5a0pjT01BZDNjbldNVVc4ZTlqYTdRS1VnUVFWRWdaQzdleXJhVlRJTHlV?=
 =?utf-8?B?djZ0OUdtL2JtdGMrMWloR0JsOHVnSXRuamhzQm92dHFRVitiQmE3alNWOFdJ?=
 =?utf-8?B?bWhkQ3FUZlhhNnFHRmwvZ3VyUWpPTHk1UkI3Zi9uZjlSVFVGaEdDY0gvR3Jq?=
 =?utf-8?B?ZGZtcUZ1dG80Q3RhZjNibnpjUTF3dThQYnl1Y05yMnhOMlN2UkF2N3lmei9C?=
 =?utf-8?B?Q2g5U3JkSDdMMDIvOXFpelBIeEZ1d2trbTQ4R3l6RHpSb1dZU3hMRVRSSkFN?=
 =?utf-8?B?Slg2U1FYV1BSOTJ3TDhFTFh4NVBvTlBlMFVEOE5kYmVXSFNyclRXNzRzaE1l?=
 =?utf-8?B?UlJTK1ZnNWpOMHJaTFBDUWFSRy92L0orVEtZTHhIWVBGSWY0WVBlRDVTZW14?=
 =?utf-8?B?aVJRYlZaSm1OeFA0UmcvQ0FNTjNKdThPOUJXSjI3Ym9Fb3FBMklJOXBpL3U4?=
 =?utf-8?Q?klv9YF8NNo8K2yP0=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 681ef51b-220c-4fef-34be-08df458d253b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:01:02.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPEiFLnIuJoQlaQ8YNf+N/bLM3YH+e12blvcRsM7/HPU6reC09HRqcGcprHMqKrabjE2S25nj2vm+XnBR3zY5DA4d8BZUpZZPFttzIq5GnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5671

On 18.11.26 16:53, Frank Li wrote:
> On Wed, Nov 18, 2026 at 03:43:28PM +0100, Frieder Schrempf wrote:
>> On 18.11.26 13:46, Frieder Schrempf wrote:
>>> +Cc: Peng
>>>
>>> Hi NXP developers,
>>>
>>> On 05.10.26 16:28, Frieder Schrempf wrote:
>>>> On 16.09.26 16:39, Frank Li wrote:
>>>>> On Wed, Sep 16, 2026 at 03:16:13PM +0200, Arnd Bergmann wrote:
>>>>>> On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
>>>>>>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>>>>>>>
>>>>>>> Adds the driver for communication interface to secure-enclave, that
>>>>>>> enables exchanging messages with NXP secure enclave HW IP(s)
>>>>>>> like EdgeLock Enclave, from:
>>>>>>> - User-Space Applications via character driver.
>>>>>>>
>>>>>>> ABI documentation for the NXP secure-enclave driver.
>>>>>>
>>>>>> I just saw this in linux-next, where it has caused a build failure
>>>>>> for a missing include of linux/slab.h. I hadn't see the series
>>>>>> before (even though it is a v51, which seems crazy), but I am
>>>>>
>>>>> It is in linux-next about v37, but build bot find many problems, I dropped
>>>>> it and request to fix it. And sashiko is online recently and also find many
>>>>> risk. I request to clean up it, and local AI environment have difference
>>>>> with sashiko, so bump to v51.
>>>>>
>>>>> I put to linux-next again to make sure that pass all build test.
>>>>>
>>>>> Other two problems, need more time to check whole review history. reply
>>>>> you later.
>>>>
>>>> So this is still in linux-next, but was not sent in the pull request for
>>>> 7.4. It's rather confusing to me that maintainers add stuff to
>>>> linux-next for build-testing and then leave it there, neither removing
>>>> it, nor continuing the mainlining process.
>>>>
>>>> Frank, what is the plan?
>>>>
>>>> I'm currently rebasing my work for the NVMEM driver onto linux-next, but
>>>> as there have been so many iterations and this whole thing took so long,
>>>> I want to make sure that this is not another dead end where I'm wasting
>>>> my time on.
>>>
>>> I need to ping here, again. What is the plan at NXP to move on with
>>> this? This is blocking multiple features that depend on ELE firmware
>>> support for i.MX9 and similar platforms from being upstreamed.
>> To be more constructive, here is a proposal: let's get the
>> kernel-internal part of this series merged first (patch 2-4, DT patches
>> 6-7, doc patch 1 reduced to kernel side). I currently don't see any
>> objections or issues with those.
>>
>> This would unblock drivers using the in-kernel API, such as the NVMEM
>> driver and this is also the part I already tested when working on [1].
>>
>> The somewhat more controversial uAPI in patch 5 can then be further
>> discussed until there is a consensus on it.
>>
>> Arnd, Frank, would that work for you?
> 
> It needs at least one user for the in-kernel API.

I can provide the NVMEM driver as user. I just need to rebase my series
on the new reduced firmware driver patchset once that has been posted.

Or if you want to have this all in one series, maybe someone at NXP
(Pankaj?) can provide the firmware driver as proposed above in a public
git tree somewhere or send it as RFC. Then I will provide the NVMEM
patches on top of this for you to pick up and send in a combined series.

Just let me know what works best for you.

>>
>> Pankaj, can you prepare such a reduced series?
>>
>> [1]
>> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de/


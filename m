Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792700174;
	b=zzv0rgywwmp7Gxq/JEnC02D5R/NbB+EOivwzkM9kGahKpz3HfF614xnrUlq6aMh3vtlb
	 B50p3DCLlAOCl/japo9lcqBy+fqWkzqCI3GVxijpWnhQnjsNIngPsAtXG3v1FQrUSyXOS
	 KXkGgBKeZyap3fZNUAPpgYk1D2qhTkqKmPJk1W7oWn2NsdqcxQgENzT8ijOMlBTnmQVjp
	 8ouF72Y7PWjMhcMNSdlLn5yzh1UB0eN04nK/HR5jwSRVKxEMRA8a1cPMaI94aZRRoIRxt
	 OB2ppInJu0W7KYkyVQPldqk48tpolp1ALJI/5erud7Y5j7MF/d2DY7Ew+XPzVkljjFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700174;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=8ujaezyWkHzxV35PoBptYnf+3taU2SKIS2FlkIdyjWY=;
	b=LjPSAesgFjxCmIcFSIcCk1UfzvmGyt498umDJKqYKBEI3akv+qY4xFfxmCIM6l/KVxxA
	 OePvkbwyoWbcJUcsJjpDA3t6XqnQwdkQRWpA1l+/uOLMAgokZAc/xQBDd10FnCaOG8hyG
	 zmnbOy1yFJBJ10V6xJp0CUq+tg8Rs/1Icyz5n/IuyVG9yRFCZx9N5JZUZ/waDx1gTsX80
	 VcuQkLdUQcJnGgKx+GuKvLsIdrEPEcYJPKUVs8i48tsFkZw0ZFLa3ROtRcK+vRyeFmiiN
	 k3jmoEtRQPPu/KrAjun5vvlmHLPZ1E+zHznipucJpGCpEwJkhEMyTIDhb1vYOoh2y6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NriW1sgv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.26
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78629606A32C
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 20:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78629606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NriW1sgv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMJ68g153nTZDN2gISu24riA2zNlUcG+XOypHH2/W7aV0BI1pOTYF5AORW4Z5ItAp5beHRDwjj26lEPA3hvQREHaBr5HvcOTicwIVLaU7q3uNvVooUq8j0eW0TlhpB5GJFlA7FJFK9UpZjypbfwpWUX3JEQkGqccPVkkEdfDDXV4Adm2dvgor5ckIDL1BxnM65FVrFaBwk4Jvkr00MPDVVRFSu5YIKrO+kPw8koJviuLjhaQDYXpT0ZGxb4+XxdvZMkcMAjDyShzBEYwQSxslLarOMGgxGIEW58257woHhb4QuFXO3zT1TOFCkMnhf00583jkE9QlcS00hTgFG0L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ujaezyWkHzxV35PoBptYnf+3taU2SKIS2FlkIdyjWY=;
 b=VOakqaOd2QPEgXVAioShXGFACk0RL2e+YeOwOCw4x5uN4j0+0vdaTeOFVK47wMPTIv9mWX7dM7wB15Fua8X9XYtCATxZfyAABemnBnv8OEoTDl+e5c4YcHqkkMJY4+FR8atTKI/QbxWwvEctjmD8cbfiGQMqEcqa+yEzU3CCRJH3dq01gdIBGIGW/83QFtkIA+5HD/bBmxXI2cKqpcq/82V55U+fK5kpidI4WbfxxBWlY7vohMBHlKh93DinPdDB+csniP9l6llbQ48H4/pLQ4t8Xu66M7aUbbMbsT1As7ndNNjKznzZBh8bYI4pJbHhz4e/XLgEHkr48ie+gcXaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ujaezyWkHzxV35PoBptYnf+3taU2SKIS2FlkIdyjWY=;
 b=NriW1sgvWCPxmMkWYJB/c19WXkVzPfxB/fRLHZvMyJk3UeBc2yH5KZ+p/UBpx/NsLfq59btZ/TgsPptbhIEvmD1sOtwd5CdzUPkh13FPfKRIDoeCI2+w/X2K60O6NSykzBhS6e8e+XRlqSAwb7APBfRJaYXS2I5bC+Uzwyr1E+cygxdOZ7tMR0BD2Z0TMq7UL//7Wu8soBKQw7KoqkbBRDRIegFwS9Ln/pJs/JC9JjLlfyevkeqvCDWL7ra4GSVtXSCdwCUnWDIQn11KNOpBo/vbRrmaqlEZ/skvDLqaOysYa29sHZiTOiBVA1UEMbixzvd/sr9lFZPdlkfhhakgLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB12151.eurprd04.prod.outlook.com (2603:10a6:10:640::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:16:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:16:10 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH subset 0/5] ARM: dts: imx6ull-tarragon-common: Fix several issues
Date: Thu, 22 Oct 2026 16:16:02 -0400
Message-ID: <179270007894.1295526.11469671726717636347.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004140123.46461-1-wahrenst@gmx.net>
References: <20261004140123.46461-1-wahrenst@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) To
 MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB12151:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c0d4a9-d46f-448a-07d7-08df30794fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	P5Jt7Ikow6CBIxQYw2iOsulIkzNmSwuDD50Xjlw0T3yIpgbf8ez/OqiR6ssANprxOU3LensfwTjICmVoCWZChi779/SO3e9E8ir4Vi7sTzlTiaRytDUTkU1xoh3xLMefnrW+6eotEnuRGSY3g0Zz9Cj3fI2dKK2jLMx65bb1ugP3NaZHcMJ/yjAKn9+Stw8a61WcSIOLw6hpFCk0aH742o1f+ZhVHN734pU0zCWVzrKM95+QPknsTHN/va/noi8ilIu0hStCcmA8dYDQBCF3bPs42nnlpnLc++HBKxYNS1L7NsR0HRw9TRFQRuWEyr4UIc/V1HRWgMwpvwz/FXfLGZLJ5LzbnPlxYMXk9qse+34WjbhFodgVaJOKutdAuoLqummYKSEm73JKrGA1g42DusylRrX7Z6kJaUDFdcPqU0Pc9Vhkp46gzYWQYl2aj0pvY5w9UOnaQpu3cT9rCcnCofvszPEET9bzIIOSD9WbB491BuSUZCfLJYN5nl26UYQRB32uKXhVEpGbszkJLiETd0Dn+XdbAGTkki9ImB4PYTAiDt8PdigIPDAPleCWygffQFW66fTkreDxGrI/+1y38xeDPDZM/Jcc/DVBHQF3DXwb0+acA4BUs5FS+td7CIb8yD5Kk3V5R+JK+MPKb4u5CRlSCzn7eisQbTa6rQA45Fo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE80V0hFdm9XVVhCMkpsNUVrSmJGejYrVGd5dmlKNDV2N3dBcFBoZ1pMbnZx?=
 =?utf-8?B?dzcwQ0ZDc0o2ZTdySDYwTUVJcXhpQkNNU2liVmxNREhkb2tZcjRFcWd1V1By?=
 =?utf-8?B?NEVXVDZCd2Nzb2F3YnZXYUVDb1FWSGFuVFZXUmxqbE12RWZrYzZXa2xGMzRC?=
 =?utf-8?B?R1VialJRenBaMjU5NEx5eVV4K3I5T0ViSDFVNXUwWnQ1M1ZMcmVnbG1rQVlH?=
 =?utf-8?B?akltZDVNc1JxbGVBUDlCY3dadUJPdUJPdXpiYVkyTlJ5aDYxNmxsbkhYL0lr?=
 =?utf-8?B?ZUQzS0FrK2NMV3E0V1N3SUdrVE9mVjFjYmM4R3BWanpFSTNubTZqSGVxQkIw?=
 =?utf-8?B?andLbUJRL0x3MlpaVTRYdks3WGs5bkNlS0wyeEpCYzBDd29CbWlsZjl6YVdC?=
 =?utf-8?B?cGZ5TXFzb1JIQTZHOXQvVEhGd0laY21HNVNlNzFBbmhPSTFvbUJmOXJKU2dl?=
 =?utf-8?B?bkFTdGV6VDdtNWJxQUUxWXUzdmRZeXlHRGFPNEwybkpwbWYxUllrNGVHSXpi?=
 =?utf-8?B?WFh0ZnUvY0dpM2wxZVlxVktmWDBCcEl6UTRpU0FIVFdqSFdybk0xVFN0RTJJ?=
 =?utf-8?B?RExSbi9nazNiKzBKV1RqQVRZVE9CVVNIMEx0NnhML29QSEh5djduVWRqSm96?=
 =?utf-8?B?aXA3eXNCQk1yUTBlWjhheEhTRHhIUTFQSlltNVNVcG0rTzFBYXdRUHp5OFhK?=
 =?utf-8?B?Smp5ZlcvNDh3WmMxNFdBODk4b04ySDhrSk1qTGpDVE1JczVReU1Qd0hIcVBJ?=
 =?utf-8?B?byt6bU5sSFFZVkpmZnBBK3R6OXBpSHRNd2NMdjNONUJ1SG5HbnlPeGxaYkxW?=
 =?utf-8?B?UUlxcHRJMjVhYW5TSVRPY09UM3FjR2NFMjlVdFhBMDRMd1FQejk3M2RKNUZ1?=
 =?utf-8?B?VnRQVlY1aHN1K29Ic0NVNzVrQUVqa3lYTU13bjRnQXlib1NiQ2dpYWdhcWJU?=
 =?utf-8?B?dkFzd29pVGlSbk9HNEU3ZjlmSHlGM1VKUHk4V0wvVWFCZm5NNWg5L1JSMU9w?=
 =?utf-8?B?T3hzUG1WVUViaGQ0VjhMNitGR0tVSmk2WkdldFpxWGtYT295Q0tIcStQb3d5?=
 =?utf-8?B?WUwrdHZTb1RuODJyRDRpNDQvTDl5bzNIdFNISm1HQU40NERPeS9SanMzR3Jl?=
 =?utf-8?B?RWVUT2dTWmF5QkkzN1VuTWtUY1ZhaDRXcDUzMUFqb21ySkhycHVCMUJVSVNi?=
 =?utf-8?B?dURZdmNaazkvZ3d2YTVOSFdYOUZTMEg1ZHlwU0FGUVJ5L0FQL2xnQTlENnlF?=
 =?utf-8?B?ZFJhRld4K3oyck9ydURYeXRER0pFTzR5T3B3dWlHb0RsS1hKeTk5WmFDSUlO?=
 =?utf-8?B?ZFhrN3FXd3FUMWg5eHJYZ1htdUR1ZDk5ZHk5OThBQXFJY0pQcTl4VkpwcVJW?=
 =?utf-8?B?VTArN3RIWnluUnMxWkpXdG9kRW9ROC8wNkVzNmV4R3lSQkE3bkVkOXJGQ2k2?=
 =?utf-8?B?cUphQU5hQ0tnaGVFTTRkQnRZcFJIekFiUWtBVHYxaTFONUova2V1eXVPU0Z0?=
 =?utf-8?B?TFk2R1c5eUh1NnNRNFRISHdaNFFjdmR3eWYwTWdqRXJUM1BWKzlzTWVlZmpu?=
 =?utf-8?B?ZDdWZ080dFNKOTBYRGFIOUIxOGtabFFDQXp2NXFtc2dZSTBLbmJwREtwMVVU?=
 =?utf-8?B?WDRyaEpYUGxkTWpobmRnMkRwU0lYeUdFaXVJbG1kY0g2NzRKVmVENDlSY1lo?=
 =?utf-8?B?bWRETnVLTHVFWDZxK0JqMzBsTnZaUVp4b0I5bDdaaEdlb0VkT0c3ZlpsOElM?=
 =?utf-8?B?R25qbjE1OWhFTjBqeHM3Y0VyenIvU2FKclk3dnEzbjJKKzFSbWhHaThQaVhL?=
 =?utf-8?B?dk8zTGtuZzRtaFJSbUV6dXp3anQ1WldhNExITGtGSk5Pc3dqSFZLWDdkQkc1?=
 =?utf-8?B?Si9LMWd1NlhBMkMxaUM4ZThQditldDN5V25XZHNzcUo1bEU4NjhCT3NkaGJ5?=
 =?utf-8?B?VDNhMGxGeTJvbGFIL3ZlZXJYL0piQlptQVBVQW9YMnlhOHJ2d3g5UTJ6b0ZE?=
 =?utf-8?B?dC9WZC9tNkJmTHVjTkUzNVVwTHM1N3prZ2svS1VWVXpIOFgyek5WOWJLQXhT?=
 =?utf-8?B?TmlyYjR2SGF0Y1JNMVF1RUV6cWphNk9wMTdYRzV3UlJaSWR5R3RiSm5VYzlY?=
 =?utf-8?B?S3F1TnV3Rnp3YVh3Ymszb2h0VFJva0NHcDV3WTlGd2Mrc0xPY1VYSW05dG5Y?=
 =?utf-8?B?RXlIcFl4d0l1Mk1GRmZUa1FyZUpJMHRodldveWUvYVZJakFUeDNVV0lHc0RT?=
 =?utf-8?B?VDFBNFdsUHhSdXA1NUhYK0ljUFF6blA4V3kvN0ZURjAxS0VsaWFUeWVrV25h?=
 =?utf-8?B?ZEp3TDNEM0EzWUlESlkyTFdyYTVNUXdsNTBQSk9TNnc1U3BpSlEvYzZ1SnM5?=
 =?utf-8?Q?HFepWYBi7DVHSyucs+E9Dgq3ZZUJ6QLT9pStU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c0d4a9-d46f-448a-07d7-08df30794fe9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:16:10.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDhYfMePTIW0M5QQuUOXdHC1LcldcmzwKmGU9x47QxcSKnNb1EqaNvWhXZs6Sw/XW48by5Dz3Serkq2Ic8hr3Tm+QTQXsFsIMREaoeMbC+XImfHeMz8NqTQiIueytfsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12151

From: Frank Li <Frank.Li@nxp.com>


On Sun, 04 Oct 2026 16:01:18 +0200, Stefan Wahren wrote:
> This series addresses Ethernet and PMIC related issues on the Tarragon
> platform.
>
> Stefan Wahren (5):
>   ARM: dts: imx6ull-tarragon-common: Fix Ethernet regression
>   ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues
>   ARM: dts: imx6ull-tarragon-common: Disable unused LDOs
>   ARM: dts: imx6ull-tarragon-common: Fix i.MX6ULL DVFS
>   ARM: dts: imx6ull-tarragon-common: Fix vmmc supply
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet regression
      (no commit info)

I skip this one because I have a question.

Frank

[2/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues
      commit: 1202a3664f912bef4f1d55bbd0aa4aeed4413ac0
[3/5] ARM: dts: imx6ull-tarragon-common: Disable unused LDOs
      commit: 92bdb22202206297bdcf782221cb42b569a69d2e
[4/5] ARM: dts: imx6ull-tarragon-common: Fix i.MX6ULL DVFS
      commit: 0c5a0753eb865e01b66a9a0a1775b14044f8b057
[5/5] ARM: dts: imx6ull-tarragon-common: Fix vmmc supply
      commit: 2b5c99f428ed9fdc3d63525fb5875447ae3f49cb

Best regards,
--
Frank Li <Frank.Li@nxp.com>

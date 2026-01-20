Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1AE3D1CCE
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907625; cv=fail; b=GefO+eVFNuvsuvQWnLZK+Xn7I5PC8BDBuKIWtynsdte0pn4JXDI2Tp5xWiykfCHiTKuTblNx6p+hLcfQKF9e0lM0ZpCK1JuhgeP9cw2ApFofQcus/uUjIE/QtLMt2xajyFnA4ZhgJiJdDc6afEH/AC3pwulTqstD0+32aofj7xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907625; c=relaxed/simple;
	bh=pLcO0fbwe21EuI2U2/mrmhfC3rEaD2UgXq37UJfg0jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PT2L/pXD/+eIHivkt4HPJV7E05QvmMAXDBWlYMRSrrgyF8Ub5V7IPi6q/BkluJB0J6bx95P7OLYYfh4RMMnuWHYAv8q9NvsZUn5G4sZhphlFWa2uK90uvVJMj0GjtL+WrVa9QA5hnw+d2dQDP8dCWoHMybfud8pCF9zcBztsi2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Veu1bdA9; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Veu1bdA9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GClDlCzz7xU66yLzSzegIOdAL1YmZT1S0jppgjVKZk3+aRAL5dcySN2nQaWWEK1UYere68iIwwh+sdQD4PInYKCYsEn+EQH8jSYYfhqJhD1PYwbhY2Sruk54j3pksgAcsSsQPIpC8A12sHSTniagBN5AfVPNekkyGVgSi0+f3WQnCxsAAjjruoYB6k2seoAooKie+VG6UxilvPNB3X69V6sHqC+Q0CW+VmGJhQPdgZ1lE62eCiLeJmDXkn93XvaPFX8I/FPt6Csid3+sPu67PVGOi+K+y0oNI/U1QqBPX+8sorOEfJbvjz8TN7WcGYHjIrr0Z+/lLV0HSSJFEQ7qiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BKv5fGtdwoDghtGmHFpFtqygIXZjBb3e+F4RbhCUj8=;
 b=LY3n/RvQTqt8WzEqmDD3XlBn7JXFghmB44GrRbN8q+yoVgxxaipKbxlI8fGzj5CYQRqAVEXbp3Og7ERU1j1kWKh0LQzzH7xAis61sWMoCB5DwXo8SXvbhDjnvG/QwX3A5SajVrBeJTHCtZQylugWrIoqmeBwBWRynu5km6lpiwS4KebofzrkoiDnE2d/BW9x+643iI1kLFeiOto/QcfHmjDDikGVeXA6W3q0pxK1WPQXm2kUsrumsEWwrPGiM70C8wX9onV0UBV+qcyMDeLCY5eiXkCjDewxV6rbN894AEtzbLseSjMiFCQM7Xp7rlBrhLvMa0AyINktbH1Kco5Eww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BKv5fGtdwoDghtGmHFpFtqygIXZjBb3e+F4RbhCUj8=;
 b=Veu1bdA9MYkJSGnyzZZKd6FaiSgrbJtEpSbOVL7ofVSn1gL4LOlGs7j6PeNtKw7kVqu/KP+13lIqV6Nb+NgHjCPl5K+8YkYzg6XIyDCT3KPay+yWA0C+rp7iFx4hTi7GRY8yxxCr9I2A5+CwZeIg/nDyYLUX6ZNOJ9qqLpQz2edvOq0zTXb7Wy5ooQ4BOyUClAPKLeL0jpMEO5uQq1cFifSWqkE2vaDyP0hOUdi0AT1SinbYySt2uj4pEP65q7IUR30LDXNMTeFLoCPmPDv97qF2giYuMbk+NlsuzdDWEsW0ZObiiLlsyxPk8Ve0negcPdS+9q+39ypBj+PlHf2bwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9363.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:13:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Tue, 20 Jan 2026
 11:13:39 +0000
Date: Tue, 20 Jan 2026 19:06:21 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com, 
	jun.li@nxp.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <fmdje7ftwna5vv5xrzt5e7hpv4juzwjurhvdzzrfeifaeyyblj@givopw2u7vmn>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
 <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
 <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
X-ClientProxiedBy: AS4P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9363:EE_
X-MS-Office365-Filtering-Correlation-Id: eb40575f-df99-461a-55e0-08de5814f68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEhWM3kxck9BU0s1ZUozUzlpRmNtVEVmaGhnendqRUZvU21uenNTU0RSbFlN?=
 =?utf-8?B?RU5HN3VScGEycmRFSTZnTjRSRDNlM0JaYU5iRkZsOFd6SXgxdXVoWmliWVk3?=
 =?utf-8?B?aktTNkhXWG5TT25LRnhITFB5azI3TG1lbkVESUZweVJSMW04OFpUaktsUXFD?=
 =?utf-8?B?N3hZT2dWRE5HYitseG03akpLMFRtK1lwb1lvNEc2ZnljOXZUTzUyRUNucEdB?=
 =?utf-8?B?WEh4U2FNa3JrdnlreUhRVTEyNEpLbUpSUWdQWDVEWGFVMmMvajU5ZlNiT3l5?=
 =?utf-8?B?ZnF5alpGQ25DbURuWnhvbGlMTnJJa3IvOWcreWlWaXlxbmFnTUNnMTlBbEhD?=
 =?utf-8?B?RjFDOW5IbXptS213RlBKUm8vNkVPdnZDRjBZKzZkTkR2dmNtV0NKOFZHZmg1?=
 =?utf-8?B?TnRPbWk0N21hNHdxeCtqNGNNdzI2U2hpbjNoTFNFcU9GZklPV01pZ29UcUh2?=
 =?utf-8?B?bjJjRkQrdFhlMm5NMDNhOGZLK2ppUE16Y1FUR1lhWkRucHRBUmFRMGxubWwy?=
 =?utf-8?B?R1JKdVJpcEoveXhqNE9Pb2d0UHNtQ21XbFdldUhNWWJlTXdyRGJ3MG9UeFFV?=
 =?utf-8?B?NGs0a3BFN2xVdDBzZThVRTM2d3NWd0xpTEdVNDJxdG9WSy8rUE1zL1VxSEFo?=
 =?utf-8?B?d3RVd3JZS296MDNKSEtONTlHbkl6cHNsRndFRHdCLzg4UElodnEreEZ4YmNq?=
 =?utf-8?B?clhvNUJ0eHlKeExrekwwbi95QXdoUkRualN1SEJEOUhwV0FxZ2FCc2F0L0Zy?=
 =?utf-8?B?UFdYWkkzZEl3YkJINUgrRW9Lbkl3ZUNsSEVsWEhBZkdpbGx4QlB6OGtjUGVj?=
 =?utf-8?B?emJvOUowNFVuYVJJRU9uaVNISGpBejhBNjgrcFQwOFFiRmhWcWZ2RTNQc09L?=
 =?utf-8?B?cnU0WnY4NHlVQTFHVVNveHdSTndJR0M1cGlvTTdvbG1uYnB1L0xCb3FpN3Bq?=
 =?utf-8?B?RlRsQkprTTJrSWEvT3g1ekp2aWsrcE1uUEF2N09UVnBRMjVnR0hqMU5hRllH?=
 =?utf-8?B?Y3pWS1ZyWEYrY3ZqV0hsN2JBREpYK2g5enVicWhkRjZjeldRZjBrZHFSVnRZ?=
 =?utf-8?B?QWR1YVdHcmJONExPeU15TE1SUjdzMElnNlFwZWVNVXdrb2ZReVFXOFQvQjhH?=
 =?utf-8?B?Z21tWkMyQkFaMkMzQUVLbEJqOE1la25hZ0JaOHI3WWRFUmJiVHhPb1Bsc0xp?=
 =?utf-8?B?R2tGU0JFM2U0dTJGUmYrb1lNNFVqUjBjZWVhcFRxMlR4UlRoYWFnUE5aZVkx?=
 =?utf-8?B?bVRFajQ0bmlYN1FTRjVlV3luUm5KTzBkNUl3ZzIwQy9uOWNDZG80T0tYQnVW?=
 =?utf-8?B?cm9KZ3MxeE80TFZwaW9VN2V4T3NzN09yeDFLSEprQkNhSTJ3YWVQdmUxTWxK?=
 =?utf-8?B?Q3V0RXlwY2N0MVUyaGRGODlsVW15cFpwSEFXai9RSmNZR1dUOElLSjFaS3I1?=
 =?utf-8?B?THBKdW8xcDdYQU9abTRocWhHUGJVV3dKSTJoMVFITkdEeDc4bSsvL3FZTHdK?=
 =?utf-8?B?ZEFpelgwNlVNWHloSW5pRHV6bTYvOWFzZ0Q1N3d5ekVGVlZWM3l0T3oyRTE2?=
 =?utf-8?B?VU9Rdldvc2hEOE1hYVk1eTlkOVlhVlN4MlZScDhZS24yS01kUHRwRlZJOHYv?=
 =?utf-8?B?ckhyNExjTWxENDhKZ2xxSldrU1puRjMwUFhvbW1DUGlReGdVRlhmYWVmOGh0?=
 =?utf-8?B?TmppbklOTllLbFdweHg2L1JsUExwMktRYzRYWXhSYVpOenhXTkhkbmpoN3N1?=
 =?utf-8?B?ZVh6Ni9sRVM0Mys3TVFHeGV5QzZHK1UweDJWWWhKcSt1MEdzRVdFbExLbmZR?=
 =?utf-8?B?OXJ1ajYyVkQyYjJQc3hQOU9zNzRYNGpUNE93YVRoNC8wUnUrb3NOUkdVSVlF?=
 =?utf-8?B?ODNzU2NLUlhObnhIOXRLWTljQzJydGh3c1dlS2ZyYjVxVnlCeDhXUC93d1B0?=
 =?utf-8?B?amZ2UHFPZG9ERDVNLzYwdnIrbzZEZld5bDc1OW56VzFBVDhxZWExYmJRenph?=
 =?utf-8?B?bmx6NW1DS2Q1bS9xWlk0OGlwRW8yMytPUVJlc2k0VXFzNnd4eVhnc01kbzN0?=
 =?utf-8?B?ek1LRmxTQUsxL1k3YWxLMHZvbmFrMzB6QTA3MjNWQWdiUzlGVnpxR0JCYlVY?=
 =?utf-8?B?NVBEM3h4ekNqM21LT2RJUzRML1BhMVRRK054WllRa2poTm0xemxwVDVZQW5C?=
 =?utf-8?Q?6oJHdKw+jlkOz2HStk8ZOno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01SUjVFR3dzR2hvdDdhZURJSERnOVBNREZwVUlaSXIzaFV4cjBKVzNNWm9m?=
 =?utf-8?B?L25qaHNtS0xZWGJodm13ell6MDBxQXI3ZWJvYmRwOTN2akRXVlpDbDJ6Wngz?=
 =?utf-8?B?QVZZUTRvK3FGU2JLSjdXaVZNYmszMmE3NG1lMGRqYXJoNTJ4SFJXM01INFpZ?=
 =?utf-8?B?anI4dGxxZTlMTnFLUTI5elVKQmdyV25reTV1c2tsRW9jTWxHb3RsbDhLVTZD?=
 =?utf-8?B?MmR2UktOaHA1STdoN0pyUGtFNjNsRkUvYUR6Z1hTNVhBVWhET1U3bDFGd0s1?=
 =?utf-8?B?dG9rYjhTZ0hYclNjRHZhZjJxdmFxM0g2R3p0Qi9kK0xXbGRtVUZ1Z2lsd1py?=
 =?utf-8?B?NTNzQllxeW1uV0dhOC9tbFZCL0M0TGN2RVhPREw2LzNuRzRBNDBDeHZJMlhS?=
 =?utf-8?B?em9PWTgweTVHNFNBMVFFUzQzS2hpQzVFNDE1aDVFS25yQXZrVDhnaWIzUjNt?=
 =?utf-8?B?MXBvWjAxcnVrNWlLbDc4WVBNMCtOTmlPUDZmS0t4bjZYbXNxYjlpNGRxdUJK?=
 =?utf-8?B?WVZwZ2N4WlEvN1liM3ZIWDcwYUxqcDIzQVFoajFETEFTczZ3RG5tYUJZTzlq?=
 =?utf-8?B?WDNJN25GYnZjVVR6TjA2T291OTdPM1EyRFNNbERHdnYvcGkrUk1Fam92aVJo?=
 =?utf-8?B?RmVuTkxMQ3ZpbjVNRlhHQjB5MmRGckNGSlByaGd0d3NDUnRqZW5rbXo3QWNm?=
 =?utf-8?B?cUZ0TkRmYW9JRWQ5ZWt3dWtuK1VTTmVNN1BqZ0xneExHZDBTVm1SQmJ1bTcx?=
 =?utf-8?B?YklkWENwY1pXY2JtUHdHV0xBdmJNTkJraGFaN282ZGswQ0txVk4wWTQra2hF?=
 =?utf-8?B?TTh4bHI0bHo4U25BYi9LTkFHMGhZVUZtQzdiK3lyNzMzV2hZa3czaFJkb2xG?=
 =?utf-8?B?UXlsNTFKSVB2V3Zac3k5UzEwM0N5bzNuTjZpL2dkUDJ4eVdtNkY0anBJTW5N?=
 =?utf-8?B?TXVUd0NyOW9CZDdzZ09Jc2JxYnA5aUxlVmNPb3JRRmVrZGZPejBFOWpPRUsx?=
 =?utf-8?B?RnFFMWxIQlBod2VhaXkxb0huM2U4dmdzV3ZrTVlmdkdxNXpEelNvVXkrODQv?=
 =?utf-8?B?Sy9wMGlrdHR2ZmtBS0dJR1Vta1pVZEVleXF6bDU0YUNEWm5iTllFdHFpNDVY?=
 =?utf-8?B?L1pURE8yNHdFTmFDaUpMQW53dWRSMjNyRWRPQXlKS05RV08xUDdaSm9yaTBJ?=
 =?utf-8?B?WnlrMis3cElXSHgvUG9FTmVORGx3V3NyaXdLNWpNd3JCNVBxNFNOZmlQZ1I0?=
 =?utf-8?B?R3JaeGs2bjdwenhNZzAxZlZjcTQrTDM5eGVKVWZlNFpNcDMvMFF4R3NSTm40?=
 =?utf-8?B?OTFpKzVBNnNVRHBiMjAwSjBPSS9WZmNMaXg0bXJ6NmZmQmEwcE54WitPYVRq?=
 =?utf-8?B?OE9td1JjZzdTVmczMEpiTG9LOU9PUXB2TEZNS2NUNktDTVZJRythZlF1aVpS?=
 =?utf-8?B?dm1LVjNNOFlaR2VYekQ3TXVyeE5BMXJKdlVjYU84NXVLS3d4VEdEZnRvRENC?=
 =?utf-8?B?N2ZqTHdjS0sxNFowODhRUE1CM2hjOUJWSVZMVkZSU0dreUZtVzMxNjNYOG1r?=
 =?utf-8?B?TktJU0pKK24wNXZma3NOcElvMHV0dmVPRUl6aHBmcUVEL1MxbjgrTUY1WEVn?=
 =?utf-8?B?cTdkRGQyQU5jQWU4K25YbjQxRWtDSU54TEZvS2lBeWszT0hUcFBLeUVjZE5B?=
 =?utf-8?B?N3dyUTRhZ2Vyd3Z6akw1Vk83dzVrMGtWWVp0YStaaVRpY3FPWWZtOWl1YXJ3?=
 =?utf-8?B?cjgzdXFCaFdFTHU5dGNFeFlJSWR4NEZ0SkdiMCs1dm8zNjJMT1hxbktrUEFu?=
 =?utf-8?B?bHpzbm1zNmZseEhhbzN6U2lvK2xyVkF6eVFpaXIxNXVXa0VCT2xSTTVjL21t?=
 =?utf-8?B?dG1EenVhYnVnV3VrUDF2Q1dGQW1NQnJlaXZ0TUNTRHBIU0xwNlZBMWxoWFVZ?=
 =?utf-8?B?K2ozb0tJZ0hVV1BUenRXMGtIRTY2RG9RZ0U2TnlHTFpMalQyd2lhRytCUS9j?=
 =?utf-8?B?YTNaZTJUcEx6aThHeEZnajVFWC9uNytMTW10MlkwUkV6NGRqWVgrRWxZYi9J?=
 =?utf-8?B?K3BvalFVK3Nvc1A0akFOSytHVzlLWjJMd0VRb0lCS0gzWUkrczA5NHhDK0x6?=
 =?utf-8?B?eTZXSktXSTN0dHp0RVhublBZRkpGbHBuWVlYZ3JkekN6ejc3Qk1ETHlwMzJX?=
 =?utf-8?B?UXUzbDVEcjAzYjhUeTJ0Um96WEczSHE0Z2c5eDc2aEI0UlpGb2NZY09tcE52?=
 =?utf-8?B?b2lkSnZSREJBZUJOVGdYRXpoWDdpa2hFaEZnT0RSaElUdXI3RVNNMzZST2Rs?=
 =?utf-8?B?MDl1WkNTNjNYQ1gyN3NBd1lFdHhMMVRPODdiNjJwMkRYb3JsVkZZUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb40575f-df99-461a-55e0-08de5814f68b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:13:39.5372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EucLfVfBETFPnqBf/O8P033bxW1kvSbBtPkHtaghNz9xr/dV2G4oKhy9wExuzoWGcnih7p3SHnqqTk7ccEVNQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9363

On Fri, Jan 16, 2026 at 04:19:01PM +0100, Andrew Lunn wrote:
> On Fri, Jan 16, 2026 at 07:29:39PM +0800, Xu Yang wrote:
> > On Thu, Jan 08, 2026 at 10:43:01AM -0500, Frank Li wrote:
> > > On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > > > The CR port is a simple 16-bit data/address parallel port that is
> > > > provided for on-chip access to the control registers inside the
> > > > USB 3.0 femtoPHY[1].
> > > 
> > > 
> > > > While access to these registers is not required
> > > > for normal PHY operation, this interface enables you to access
> > > > some of the PHY’s diagnostic features during normal operation or
> > > > to override some basic PHY control signals.
> > > 
> > > Simple said "Export these registers by debugfs to help PHY’s diagnostic."
> > > should be enough
> > 
> > OK.
> > 
> > > 
> > > >
> > > > 3 debugfs files are created to read and write control registers,
> > > > all use hexadecimal format:
> > > > ctrl_reg_base: the register offset to write, or the start offset
> > > >                to read.
> > > > ctrl_reg_count: how many continuous registers to be read.
> > > > ctrl_reg_value: read to show the continuous registers value from
> > > >                 the offset in ctrl_reg_base, to ctrl_reg_base
> > > >                 + ctrl_reg_count - 1, one line for one register.
> > > >                 when write, override the register at ctrl_reg_base,
> > > >                 one time can only change one 16bits register.
> > > 
> > > how many regs? how about create file regNNN,
> > 
> > >From 0x0 to 0x201F.
> 
> Rather than reinvent the wheel, could you use regmap?
> 
> https://elixir.bootlin.com/linux/v6.12.1/source/drivers/base/regmap/regmap-debugfs.c#L546
> 
> Regmap should be able to provide a debugfs interface for you, no
> driver code needed.
> 
> This will also help you with the abstraction between the core generic
> part of the PHY driver and the SoC integration glue. You pass the
> regmap to the core driver, and the funny muxing through two registers
> is hidden away from the core. If the next SoC integrated uses plan
> MMIO, that SoC glue driver can instantiate an MMIO regmap.
> 
> Using regmap is a good idea for core generic drivers which can be
> integrated into SoCs in different ways. It hides the SoC details
> behind a well known API.

Thanks for your suggestion.

Using regmap is generally a good fit for reusable driver and I aggre it
helps abstract Soc-specific details.

However, the regmap defbugfs has its own limitations:
1. By default the register is read-only, add write operation require rebuild
   the kernel which make it inconvenient to debug the issue on the spot. 
   Refer to: "09c6ecd39410 regmap: Add support for writing to regmap registers
              via debugfs"

    # ls /sys/kernel/debug/regmap/2-0050/ -l
    total 0
    -r-------- 1 root root 0 Jan 20 07:45 access
    -r-------- 1 root root 0 Jan 20 07:45 name
    -r-------- 1 root root 0 Jan 20 07:45 range
    -r-------- 1 root root 0 Jan 20 07:45 registers

2. It can't randomly read specific one register with common linux commands. Besides,
   the read operation is inefficient especially when the range is a bit large because
   when you cat the register it always read and output all the registers. 

Thanks,
Xu Yang

> 
>       Andrew
> 

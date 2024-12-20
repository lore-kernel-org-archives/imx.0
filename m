Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E703719FA93
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682821; cv=fail; b=DXILUE2EelFGr5BTJvkepDHW0xek8tqN1Txas4eHn0AO2FlPZYhyzN7oMHOsfmQW1rSJAaFOitrb5acGZNhgIkaqxMnPLLRkSmD8VhXd43wCKyzEimRnS/kDZ7rEceWy1S62flKlancz/cBLQdltjzr/OKLn5mvmyXkGCAkXyEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682821; c=relaxed/simple;
	bh=DHp1tRBCFv1HkE8XVNJyHdg/U0ZR/8Ar9+N4RLv+9mo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tci28Je96ovF728r93g6D+/v1wXviG3eRvGM7V1Y2VIQk748n4DsxaRzDJKsEveemXP9WPghUSYYgzWrB2d+rVVZdCGjFbBC97VrT1Jt2B4UtcDCd7zjNBL2UzydRVck4Yy5bSpNFxInD8R4QlSrc/JCVMYbyWQJK4roCAe2I6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e5jroLRl; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e5jroLRl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvkvLfqvmQpLmH1hlpogalpdQ+6rY+nNI2qXZdA3nXAmoENzlfwOt6KvnL0auQh3FApi88QBHAT9npuKUvUqZ5dvXs/xv9QMmIpBWCXCfqbdMrdyclgK2HjeoKgRsnc2zDUHKy4Sa4BXKCzzeGtlz6Z4mRFNlqNx1G7Ha0iQkWAH53ngIdkoNKIyHYR72hzzXC20x1RCW8g5VN8ZTgiv8WxMDmwYQrC7xfYWZXLlFZY84oX1XN8529AK1sN9+jJRx9Gs8+mTwxKvRZ7W6m3yuPw9xmbvrFOOBABM/16BhTuiaffn9NvYXhps5gHxhq3tdM654FzBxV8KvTW8dWIhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjaZSFdDs5UyfwdtxTN8TAuaYgZ5Vs1B2Co2m4NKxW4=;
 b=KVYkR7DBhdqDUB5JTuKRI9K3XS9DaU4GuBL/Dqf4WkvoHRHaHs207pMfcgwzppa2qPQII8zYgjBSjOpsh4naLmZCUl3mcj6XAPHn+Rr1Sz6RVO5RHh0LPeawk95b+MdmDTiId/k9V9IYD/h9EOAcf/YI0iBRjlrcwcI9+sBmQ+AdZHJTMsz1IYFMP+Ei97JGyOCM6sqNW/XqBJDxrFSMw+XT+8ts5rchzPAFXIZ07YOJXOGxnzm+B5itUd3QlM0GaZ/+nTaogNucFOk/TaqT8HdugNrFEFQtKAbnLz5XlzSoa0xLAvPMV8OEA32YFEFpvzfd2oYKg3EjAbVtNpAH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjaZSFdDs5UyfwdtxTN8TAuaYgZ5Vs1B2Co2m4NKxW4=;
 b=e5jroLRla8GcrOYfFxLAfZc2QHxrCCmfWCKHqBik4LGf/FFom80mbPRSqwFzOmkEgZrjSY2rma1q0JtK0aXoMXxa1/F0tsbAfpwuY1NcOVKxxjJse8x47wxPPyv1CbA0pFgw061d2uaTvHwmp8TY4qGnjl31wZLFze9735CJ9QZtjA+gnB3gsAXsPWTsTt+UPllTQ2Rs9PVMKoVJuJRwE2m1f5uHscCDeqrJZ6aVDKX1whJq/FElWVHbcGauuZx3X31Mown28NDYQt5qXTwli2DmiOjcl3qOBFgizfvdyvd5hJR6vCcY/3qnLhIH16JJnFO9AwG2hPu7l13oF2r81Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Fri, 20 Dec
 2024 08:20:14 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:20:13 +0000
Message-ID: <eef5aeea-6106-4ea0-8d02-8f10df1f39db@oss.nxp.com>
Date: Fri, 20 Dec 2024 10:20:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: s32g: add common 'S32G-EVB' and
 'S32G-RDB' board support
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
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
 <20241219131029.1139720-3-ciprianmarian.costea@oss.nxp.com>
 <Z2RVyO05WvIQUmX4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z2RVyO05WvIQUmX4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::30) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a89f64-5684-4b67-aa30-08dd20cf203c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bC8rK3lrb3k1L1pQcWJsV2NQY015UjVMbVgxWThYVUpSUzI2QWdncG00MThs?=
 =?utf-8?B?LzY2dThkUHpwU2M3T2Mxdmd6Kzc2NjFmS3p2akhEUXpVVGU3MlZlcy9mWHdv?=
 =?utf-8?B?VkVXVFdOejFxSnJjUTBGbTRSRUw4TnpSNmRYcVc4WWwrSkdmb1pwNzZWUW9s?=
 =?utf-8?B?YjJOcHUyU1dKVmFJcmtJTnRKcFFUQzJQSWRTdU5jZjFCVTk2R1VoNWhGcVUx?=
 =?utf-8?B?UmNyU1FOemRCUzlteGo0ZVRBVGlZY3Y1dzlHaFgreWE3K2RPb1JMTzVXOTdI?=
 =?utf-8?B?TU9YSkZDdjRhM2xTSVdSYWFaU2Jmdmp2L2NRSk11Z2VEbXI0aXptZHR5Qjht?=
 =?utf-8?B?Z2pROEJUU2l4ellJVHdaemh2YmdOYmNpcnBTQWhzTWFaWjBIK2NhU0xZVkVp?=
 =?utf-8?B?U0JicDZhek4xVk9zTStqbE9aRUNyQUs0Z0NPVy8rWC9pMXBnalArNnN6K254?=
 =?utf-8?B?SmpBbTdsdm1TZFVxZ0xBOWp5RFJ5aVpMVktPb2NPSkJUMmRSNm9YdjcrYUpW?=
 =?utf-8?B?M3htbEY4elBMZk5XNG5WN005RzZCRDBlYUtEN1ZWL2F4alEzNTY2Mk55djhX?=
 =?utf-8?B?RlJKdzBWNS9ybGE5TnAySEt2TllTV0ZwUXEwL0w4R21ickpScXQ5aDJ1TXU3?=
 =?utf-8?B?MUJidXM2NWpkL1JPaDlvVjF2N0xZNGN4NC8zS0Q4Y2xGWTBmb1phZXBUR0tZ?=
 =?utf-8?B?cUx6M2RTR1VnRDlKZ3FkTGZZWXdpWHpwczFNMTdDa2drRHBqMSs3K29CWE5k?=
 =?utf-8?B?VkpXcGtNYWt4YWUxQTd1UitNRjFhTFRWMXVxVDRLWFRRalZMNEc1OTBDa01r?=
 =?utf-8?B?ek1CbUR1RjlzZzdzODQzQTNSY3VGditRU2ZkVzBVeG1ZVDhpTUZhWmFrMWYr?=
 =?utf-8?B?aWIxVmZzZmtjT0FyMUErcUx6VkdPRWZFU3NnenE0bVR6SUNQOHFqS1hTbzZX?=
 =?utf-8?B?bmk4MTRzR1NVYVozaUFOYS84VjhULzBDTUdXTkRTS1lHQlpvM1RJWlR4U201?=
 =?utf-8?B?RTZLdFozNHV1czZkblNvZTdvWGo0RE5wUFZmK3d4M1ZWMVlva3NpOThYejZl?=
 =?utf-8?B?dzdxbTVFZEJKbTBSb2loWW1najA5aWhSVEQ4UmZ1TmZPVkp6NEZmNy84SnVa?=
 =?utf-8?B?Ny93Mm1JWmRNTmVqejcrbFhsazJkVlhPS2JyYzQyTmwwbTBETzF6Z3FMU3hF?=
 =?utf-8?B?NFhzMzFmQUFpcDY2Nnpjb0hwWWlEWmYyellpUFBvaCs4UUlYUjZVV2NMeXVD?=
 =?utf-8?B?dENaNU9ZNEhQVUVWVzBJSUVUWmNLd2ZFTTlyTW5KRzNvUlpQVk1vbkNsb2x6?=
 =?utf-8?B?MjYxanpCYmc1Q09VU05QR2g4ZDZkOXY1b3ljbGRsZVh2T1JObTZqZUFLTGRR?=
 =?utf-8?B?Mzl3RkkrVXphL3J3aC9QVExUR3NtYzB0ZUNFQ2R5SUJWTkt1QVlSWllwK2Fq?=
 =?utf-8?B?MFh2YWhMcmJnWFBBWFYyVUJBbzhGaGhwNGF1QkZGSWtSUE00ZHhFTWF3WVRI?=
 =?utf-8?B?UDdtWktrTlhQU1ZlVkZWbWNQUTVQN0tyL2FzeFRwUGVsS0ttaXd3Vkt4bkpx?=
 =?utf-8?B?Tm51WnVQZmljekNhaXhINklQWmlRZHNGQWNuY1R2YnVmaUpoNDAyM2VMVHBN?=
 =?utf-8?B?NEJ3cE02OTJ0OUJpSnZLeTdMbllqNnZCSXJrbHVwbjJ1UHM1Sk15MDZ1YXBQ?=
 =?utf-8?B?cDBnZUc0V0VMbEVjMEljRnFJeGozenZ3M1ZOUkZFNXhlZE5vbHRmZDRFZFVC?=
 =?utf-8?B?M3FHOXBwYS8xWWx0Z0x4NWhaQkt2WVBCWGx0a1ZtcXRrQ3RMS3dSb3JiR0NX?=
 =?utf-8?B?L3ZUdDhIQWJMMkRha3E0YkJIb3VRQTNLdG9GK0F4STV1NGlla3AxdTcyR1Y5?=
 =?utf-8?Q?UKbRRBt2wNFgP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTVkZ1lqKzhvSWlyYjBrR3ZkU1ZYZXdQMktCUXFwVVJjYnlQUy9FMFI1WU54?=
 =?utf-8?B?SlFJVG1zVTZNU2ROUS9XSkpVNTBxQkUvR1Q0WFcyWVQrVTFFTm9aR1ZESDBF?=
 =?utf-8?B?TmQzNzAra2JTbGQ3OHdkT2Z2ZDArejV0WThVK05DazY5VGFHWmMxVGV4Zklo?=
 =?utf-8?B?WXB5cXUvYnR3VEJxYjVuU2YzcXB5UHg0ZVVsUGZEQ2VkeCtrYzdKM1hmR0Rj?=
 =?utf-8?B?ZjhETTFycVREQWVtQWlhRHpQRjczSERiU1hhYjcydWowbFpuQklTV0hZZG1F?=
 =?utf-8?B?N1ZheGZ3V1JwbzViemhGUkozUnVKUzFYelZZMnNSVVpjVmtMSjBoMG5xWDRM?=
 =?utf-8?B?VDFpZkhNMUZRcWk4Rmlkc2lZd0VDUnUzbW04bUtBWGQ0aFJsU0RELzEyaVE4?=
 =?utf-8?B?dDM5b3hTTjRld2JuRkRnMWUySWhzU1VpYVo5SFVMYUtZZFZFT003Y0tGaUpk?=
 =?utf-8?B?WWljOUMrcEtxdkZVTEIycTlxaDFiRDRMUnd6b04venlZTWdEQVd4NTZ2dUo5?=
 =?utf-8?B?ejBFTGo2UElWL3YwQmhGNVhJekw3TmI0QVBNV05oYjhwVUdQZmx6ZzlLUGFR?=
 =?utf-8?B?NlpzblMxS2N5emNZMWdIVzhKYUZYNVJ0NW5Ia0lrY2ZOSGNrSUtiQ2tZdDVs?=
 =?utf-8?B?THdhejZzR1RHR1VjRE4wbWg3eTYyV3ZZK3k5aVVQWEhUYW5vWCtRdmF0dEE4?=
 =?utf-8?B?VmhLMENnV2RSWVM0WHZTajBPMmZtNVFvT3BmUXR1MVZFU2ZSNFZDOEhucnBO?=
 =?utf-8?B?aklCRHR3bTE2Ykp5UHVEczVMaG1Zdi9IRWVqdmpnT2ZBZFVHNGIzVWpualR6?=
 =?utf-8?B?UGZZWjFTeU5tbFJEZi9YNzJLWU1JdmpJMXNVWlFmVFJUR2FnL044MlI2aHhj?=
 =?utf-8?B?YWJWT0t0QzFYMlNlM0JyWWthbnZUalpNRXd4anJSSS91NnlnanJacmJoYlB0?=
 =?utf-8?B?RVArS3M0b0xzbk90Vy9HMERBSmRlZlJoU2tKaHc3UXNWWmpFOG9mckxaRHZM?=
 =?utf-8?B?b3lpN2sxbi9HWVlVY09GSjhuZ0JtR1ZxSVpFSkJ5OVBFMWg0RTZtTThGWm9o?=
 =?utf-8?B?QitMY3ZMUHkzbXZaeWp5NmdSc2M2Z2dJTDdqbG5sYXNRNnc3cSt0N0JnQ1U2?=
 =?utf-8?B?UTdTNzJndXcwVGk0dURLVlVXZTN3RExnMVRETWdEWEc0UFlDWGo5M3Z5eWNl?=
 =?utf-8?B?TGJqYlljcld3bWU2bGxUMk4rVm1NaHdVSHpQdngwY2J6cGtmNHo3b3dnWHE1?=
 =?utf-8?B?a1VzMktRUXdENi8vQkozYWZCbDB0OU9WMkoySWZCb2JjU2VIUGdkVytzR1Zq?=
 =?utf-8?B?K293bUpVaXZYSkpnQTl1NFN5M2ErakwrQmllMXFaUjR0cjJ1bVlyTDZpY2o5?=
 =?utf-8?B?dVRHaDAxdVVZbC9vT0JHRW1sS0s4SG9FUFI5eHVkckQxR2FDamJFV1ExdzFS?=
 =?utf-8?B?SzVEV29nRGpneUEwZWsxTVg5d09RSHJCSGIya1AxRjg0QWl4ZXdkTDhteXhS?=
 =?utf-8?B?TE1pOHh0WjVtdElWL3FCSEpXdmQwSlU2bDNPR2VWWTQ1dTkwUVlvZHM4VDZQ?=
 =?utf-8?B?OENqeXVjRWsvb2g1S1N4VlhvT3BXVldBOFRZcTRhelhkalVpS3lCcXU0OUhU?=
 =?utf-8?B?SCtCZ2RWNi8wMUZNQ01nelJKZ2RaVW5RUmQxbWRpU1QyV2RUNXZkeE1yQzY1?=
 =?utf-8?B?SSsvTlhXMzZ1ZVpDak01U0orU0NVWmxtazVQZ253bHNyaHNPc3RCNW9PNUhl?=
 =?utf-8?B?VzNpMkFuS2lrV1c4NFFiWjRXNloxUi9ZMXdqSXZtY00yK3VDQlBVbHZwbFdP?=
 =?utf-8?B?YjhIS1FGbHNJYlFOZW5qRFMwaHFLQytUTitWZlhGeWowOEpYOTZEOVF0Wk83?=
 =?utf-8?B?ZnN0UXRlTmI0TjluU0FYbzQ2WjRaOVhDanRnZ3ZHYmpGR2xGb2d0aDllRGU1?=
 =?utf-8?B?RjFXUFFicjhIQ2xQM1hKOUVBVWduVjcrS3BTbko1bzB3WEJVb0xWRzlHUG1C?=
 =?utf-8?B?N2N4U3lOYXV2MGMwWXFDUlBvYjJsS1M1L1VVNlVwWkNuZXNJajZ0QWtlRXh3?=
 =?utf-8?B?bEtCQjY4T1NFTlBUM25XYUNnZFoxc2ZBeklEQlZoUVpIMlJVQ1NSazBMQjNZ?=
 =?utf-8?B?Qi95LzBja2VMZ1IwdHZ3R0R1T20wRnRZRDJEdmJ3cjhaa1pEdVJWOEhCSWlW?=
 =?utf-8?Q?abB8s3YIFyACWP/uSkwg118=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a89f64-5684-4b67-aa30-08dd20cf203c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:20:13.0014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9EwPWD0UkoH8HH+CYkLSp6syKo1s/0fZWIDZ5UKG9ZmZ/0St8AcYDAHWHdOqHohc1UXL8OXfBo2LnlzRIwY+f+2fo1vANyPKXlLXQemdTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430

On 12/19/2024 7:20 PM, Frank Li wrote:
> On Thu, Dec 19, 2024 at 03:10:27PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
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
>>   .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>>   .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 126 +++++++++++++++
>>   2 files changed, 276 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>>
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
> [...]
> 
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
> 
> 
> I have said many times, these should be in common part.
> 
> Frank
> 

Hello Frank,

Ok, I'll move the 'address/size cells' from board common part into SoC 
common part.

Best Regards,
Ciprian

>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c4_pins>;
>> +	pinctrl-1 = <&i2c4_gpio_pins>;
>> +	status = "okay";
>> +};
>> --
>> 2.45.2
>>


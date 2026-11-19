Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123909;
	b=jvatXYixAAJOkLmI4xRaNJeoiaBhs/wvWO8oYV8OETp8JXIYgPjAEJMnISmYLfCcNQpk
	 G73d/ERcc9sLnX+M14ynwmmnNuj0rEpicY54wrmpj7s5iJf+JbmMcqAzS4jEE+sZFVMVm
	 JM2ceCWOSkFBtAW4Uw8tDGPoBSWmDqNFt+XxoxOAenEVm1aWCBZWPUjtpcf+SwtCUm4TE
	 8Ki6d8UpW+t+glB7PJax0fXkwgD//dBYRT/cQBQiledZuhw67dhpL9BnOMHXlSfC+eX5S
	 0dKpsLktYBzY/d+x3D3QB4zySD+U3Ib6e49kcUBKQfGGZZgLgUIpx+gPjwZBHriYHJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123909;
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
	bh=2Qfmi4oDYFYeqy8GM5nOeAgRfzzw5SKqnceSXZqh9r4=;
	b=r/N3T+cfCNnzOaFbctyAYHxsVs9Xe9gNy+73ZDu8RMp+7b3bphX/MccYaujWB8QG8/wf
	 vxACs8L7QzJrlabBAlbBc2HN9kYWP9+IkMcJm2JHVODs5SvnnJ/D4nIQuyaBdmgBLMiU1
	 tzeSX9hBMkKTFcY2yS1zxCqIljOgy/5N2ww7TkSRTV+Bxltx8h/xsrtkJ0L08AxBlycGF
	 qwH9y9AKIAuYf2eKwaY+60EyChs/BpxiGUPpR9YNifZnC/BcN1Qn1Bz6Kr/yPWhcUi6jM
	 xG65EPbfGSjT4pPXleJ2mSd+edvvqXq0yoQeYciLGNxiRQ+gH+R+TvEHxOYB7ZUXz/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="wc3BT3/V";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.4
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013004.outbound.protection.outlook.com [52.101.83.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A21606A325
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 21:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A21606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wc3BT3/V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq+AgFhJLn0WjcHj7RWD6pq14dOIBcHeF46CxhASP0R6zLLSyboaOwS4FCljG9F8Twp+sanbY/HVxaBj5nmLrP43vQ0KBSTiZdnS10nUrf8iuptEaXROC/+aa+1ERr8W4GFigl04e8qjJjG89xLsraAG3RBtsUc38I8pSZ1OJDJeu7wexMYw0PI+aJt8XJecAK5Zuy90wXckUjIr62KUVoYnwPNc0NJVEHNw9OSu4alktBJw5qCECS0x7OaZIpi2TBTTUhykXsxT+2Dk2g8MRis1BeCgpHMwIEWPGcYlSruS26J5JyOWIIGnA7T/6fq255xphlmVfoz7hGG6MZUqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Qfmi4oDYFYeqy8GM5nOeAgRfzzw5SKqnceSXZqh9r4=;
 b=Q4IsOvE8aWaAqaIOUNFr9MqbUvyOFrtjPzRqK+D9XaQTZJF49Q/UBB/eM+K8ug8qftkP/2IUmn/jOGCt9/tSkxr+8U40e+Mei4FLiOqd+sCUrIiN0ABQBqyQ5Rv38hudw93AZN1posMpO/FenADBDl3UinzxOr8PB0NiPBbJGJE7K0ti2NeszfC0uwDaS+ESc7CuEdcq049B4+3kObE7onmv9lyrdiMNmSJS5MwLZOmgelu67L3ddkssZ9Kn9sJ/x3LqObQjhWMtlZkr4U0/AAKi+FC6ZpTU+3HgF7QKzeZu0URC/+lIl3vqMFjY1TJvBv2XD1fpBGteMFyXk8ePLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qfmi4oDYFYeqy8GM5nOeAgRfzzw5SKqnceSXZqh9r4=;
 b=wc3BT3/V0v0aGf61KJO8MKdb8VEcby01GDe1hu2Nlj+x8+jQMNDquyFF8xx4+vDWgVTp/A002Ktw2GpbJXe172sTwvBtvKkQWYZ1EgTFMzkX344kGUoqW1f4uxZbilwj5PpTW3qL8eebMYXQi12qiXc7vFiAP2LuUkrK6pMqYsI058Uq/+Qh3lRInQUJSzzV0VUvidXW+8B59sNPMl7QfXFfUBK+etcXugeP34qxGfUHiwAtzAChO7PEWhARyexrlI0qOXiU1RxYMiMWsABSytDAi556Lz0v5FjUd6LeHrTbOipY8hMvMEGBv83tvHi/jCGv1HmwquFO+TxuKJ1vPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 21:31:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:31:45 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
	=?UTF-8?q?Roman=20Smr=C5=BE?= <roman@amarulasolutions.com>,
	Qiu Guochang <guochang.qiu@cn.bosch.com>,
	Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Florian Ager <florian.ager@bshg.com>
Subject: Re: [PATCH v3 0/8] Update BSH SystemMaster device trees and add SMM-M2B support
Date: Thu, 19 Nov 2026 16:31:37 -0500
Message-ID: <179512388241.1887807.5998470788971366215.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 8500957b-fde6-4e68-fcb3-08df468482ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|11063799006|5023799004|260925021911599003|260925021311599003|56012099006|260925022911599003|261026121527099003|261026140227099003|261028144727099003|10067099003|261009223027099003|261021121427099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	YKRWD+rl3mUqUq6+xSVbUKTYkeU5nNasvcY7QuYAfPf/xU7PdPkZBsStDp4UaDOk9yy5oC4utpnbU1jMNq7f87zN2k55AJaA/PJjSZ2ooM2QN3qLS4hxCFyCti2YYBn9jisMl17QiqlQzzR2WwaaYheaW86SVZhR5M9+OPgJxHDMI8S5/PDpwuwZgmKw0o3YBA7FwqD9IKffrc/ChLEdpC857b3Jy0Hj/+s8lgFa35az6hXFa311D5X5aHEX5yPSKLW9tUOEyquL+WIBgvdAl2kiRFUce7BrzfpSnAoXdnITOvB3JR6XkaJELjiR9yJN/SqmOgTIWZ0/XiJ9SAGQGXUgwe5GKPHDY9f/o9+12csyYXYJbHAWiTOYC3dNBL3HyktamQDyBIKGn05LKaJnQTz2RkP0c8qT0Ych9xuv2WqZZOxL/ORNCXicIeBSTWsyJeMxTx/afm2UM0sZCl5yjOFam9pBsHckFWNropV/AkE7LsEwxgkedIMNqy2oDDWAc8w2zI8sLSLGnGpK7aOej3gEiB2nWqHm3Gx9qciji0PvDjLrau+sfqy7hTYuniP11Nw69iw4IbCjuIc/p1Gd8pGJJSmsQGXMX+Ev120h/HIh516YyKiNRRWImbeZp8szQPbJHlI3cX7n3wrqrN0UWOlsM2+zqVxYF0OMzHwmaXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(5023799004)(260925021911599003)(260925021311599003)(56012099006)(260925022911599003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261009223027099003)(261021121427099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NERtdDNDblNOL1lsMk5wbXRqYkFGMnlQekNpdk1SM1A4L2kycUpIZ2V3RGta?=
 =?utf-8?B?blF2ZkdTSkxqb3FWbnNleG9rN0kwY1E3ODZMeGNUdkNHdS9Qa1Q0Yk1WaG8v?=
 =?utf-8?B?QzFNVlU0S2VQR2k1Z1AyNnhidjRMbW9vdWJQVUdGdFE3bVI5WFJLVndET3hC?=
 =?utf-8?B?UjAwYXZ4THFJS1lYZWN0ZzhxUEFicUhUNno5TStRUVlVQVlNNG1RalhraVVl?=
 =?utf-8?B?aEY1alRudWc1WExqaWVNRnRmVDZnaEVhSHdXSmRVeW9YZkxBZUwxdWxtVW1X?=
 =?utf-8?B?c1U3MVdVTUZQdjFHbmtVdTNPUzJ3dHNRdWpaRjZlRzlFU2dTVFZ0NkVXVjJ2?=
 =?utf-8?B?enArSE1NYndLVlo3NmovdUk3U0loWUZuNkZMeE1Za0pGZ0JCb2hWV3ZDNlBO?=
 =?utf-8?B?OE5SaVBlN1NkbFhwMnVNak1wUWJaNnR0aHVYcXB0RlJGWG1mQTQzK2N5YlFq?=
 =?utf-8?B?OStHbU1EWlFEWVlMalpQQWhXT1YrdEtuQlNUSm5PckJlbEhpQzBZWm5FMnVI?=
 =?utf-8?B?VExKUmlLRUJ3ejBoUDU5Vy9mY3NSNkxlSXFGS0pvVW83YkRCcVdaWlNkTm1y?=
 =?utf-8?B?QkExMDJmYmNmQ01CMlcyQ3R6b0ZpaERNN3JiR0I5Y25NSzFaS1o4d2huUnZi?=
 =?utf-8?B?MHk4NHNYTDBBR3Y3a1pGbTlndk53UVZSWVZOMkxLNngxd1VjVVcwU2FObFNw?=
 =?utf-8?B?V2d0eUtNWFdkanlDdHJ3M0IraFlzRzlRNjE0N3ZJNEY0U0JtYmtjWG10SjQr?=
 =?utf-8?B?T0dTa2ZaVWJrcGdpNWM5NW1JVSs2SHV3YnZ3cUZBNlFORHFTQXg2anA4UDBI?=
 =?utf-8?B?WHI0MW00dEpYdkFMWnNrL1VYVVM3dnViQnJLdkZRUzJvQXZpVnhGandBWUpT?=
 =?utf-8?B?aDZQRjM3eFUxSUZmZDZGOVV1Wmw3RUpOclBTQS92RStpdTFOZHMyNXFMVGUz?=
 =?utf-8?B?eWtkMXRXQkg5VnBZV1gxdWhCTGp6UkYrTWdYM294RWl3N1Nxenc2ZkJwZGw5?=
 =?utf-8?B?cGRLQmo3RU0zUGEzZDI2b0lobjN3Z0FodGdkZTVIbHlZMFFsR1BXWWYvZjdj?=
 =?utf-8?B?aVNMOWsrUWNkNDVZTDlHR2dQSUhVeWdDZWNrMjQ0WlZYWmdKcEZrblBKQWp2?=
 =?utf-8?B?WjJqdXF6UWNyTzVFNno2RmhVMkd4SDY4K1FLSGhoNTA3SWV3ZzdOeUxlNUFE?=
 =?utf-8?B?bzRTRzY0ZVBFSU5STXNTVkczVy9ZazJ2Y1MzeVQvMS94a1BuQm1sZ2Zxa2xF?=
 =?utf-8?B?Y3hjTTM0Smw3ZnFuNXJhUDRtMFRUQk1yS2ZQTkU5VU4yQ2QwS2JGaFpGVUpH?=
 =?utf-8?B?QkNBY21CNGVpVWRyQTFZejg0RlYycWphRCtiUXlIbENsOEhhVHdoUTZ0OFJ5?=
 =?utf-8?B?ZnRBV1NVTlFRUWlxVmppenZXTFhpWU1scW1TaFZhbWcxc3IrU2YyaGF5MU15?=
 =?utf-8?B?b083Umx6QnlYWm45YTg3aWFuN2RQYUltODEzenM0Wll0azR0bHdUN2pjN3JR?=
 =?utf-8?B?WWJtTmlSMno4M3plTTc2emgwZmFKcDNQQWI3YjJjdU54bjBFM1JjQjkra2hv?=
 =?utf-8?B?QUR4MnpVUDVKZjZLVCthRDJRamwyeTl5RVpmRWZyUmRRRVRGT2xlbzVub3dl?=
 =?utf-8?B?S2lDMGpxNXEvYlhYYkwxeHlZckhaUU1uaGVIVmpWbHNJV1J6STFsTlVqZXRU?=
 =?utf-8?B?YS9sMWg2Z2pCM3BEa000KzBmUVNrN3N5TmlXL3l3RkpUK3pCeUF5Rit4SHg3?=
 =?utf-8?B?SzJJUVJrWUhWNndJdU5iZlVRZytsUG5UbWt0cW5rZTdUcEtaeGRHS0hlakF1?=
 =?utf-8?B?RnFFd21PbUJBMTRWemNaTElwRUFTNmpTamVrMndZLzc0OUViQnc5dENRTC81?=
 =?utf-8?B?azFyeEpwTUNGZFcvWTMvTGtVc0tGN1VQeFVZQWxWZXdlamh1Uk50Qlhoc2dG?=
 =?utf-8?B?c0tWYURGOFBDQlBpZFRnZmJRYkQvU0w4K0xHMlVIY0xWRkcrbUhGOTFRMmE3?=
 =?utf-8?B?c21GTlJRVVNNN3R4eTlnYVorTExJQk1aUXZudC9rYVA1NXc5a3FGKzI5M2pk?=
 =?utf-8?B?QWV5TE1PQkZFaWs3TnBMRlg4ZU43c0RhNTNJNzgxYjJ2N1FUMXd0RTVpalVL?=
 =?utf-8?B?amNkaGVvazFablhBbi9JVHRWd0R2dWtZcTBOVEQ0Rk1oMGNoc1EzTGluVnVP?=
 =?utf-8?B?UENJeUhPOVlMRHN0emwxQkRlTTNxRDF5SGJuVU1xRXZhYUFtb1U3NWVNWnV3?=
 =?utf-8?B?aFVPTS9GbmR1ZXJtZUQ1TEpoVEJUaUJqSnBqb3BscVVHZVVGZmpMTVUrWTFk?=
 =?utf-8?B?bVFDSDFRVUdXRmN4RUpsdm1uc3VieE54eThlRmhORTFPY1daZlYxOXVXU2NN?=
 =?utf-8?Q?YgqqXT1hvUQa/K1p7VMxtgJ2Z5H4JVvN2t7RW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8500957b-fde6-4e68-fcb3-08df468482ad
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:31:45.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJVL/E31LvPdkX7F9h0lvnEcuTNGg9gLEDYqkA+eVTI2WIJDNbr7FLHOUJh7orcbOXhobf7HgEcFi60qf0DCYYcx/5sERcThMjGaIdXlGFGmjTmYlLkt4ggCXCx/Xr+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

From: Frank Li <Frank.Li@nxp.com>


On Wed, 11 Nov 2026 17:23:16 +0800, Haoning Cheng wrote:
> Update BSH SystemMaster device trees and add SMM-M2B support
> 
> Add device tree support for the BSH SMM-M2B SystemMaster, a variant
> of the SMM-M2 equipped with an AIC Wi-Fi and Bluetooth chip.
> 
> This series adds the SMM-M2B board binding and device tree,
> reusing common hardware definitions shared with the SMM-M2.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: arm: fsl: Add BSH SMM-M2B board
      commit: 5e15733765961a9a5fbd3de00e5c2213f6b71b51
[2/8] ARM: dts: imx: Use minimum NAND ECC strength on BSH boards
      commit: 2b04bfdb26b5456e621577d2c0857dcc9b690b08
[3/8] ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and Bluetooth pin settings
      commit: 3fb0f77dec1715816d826ddf602f306822894a51
[4/8] ARM: dts: imx6ulz: Pull down BSH SMM-M2 active-high WLAN IRQ
      commit: d64b81a6f707d538179d0a198c30997bf6700340
[5/8] ARM: dts: imx6ulz: Factor out BSH SMM-M2 common device tree
      commit: 6226c5486c85e086be8545f479f8b07db2a9b044
[6/8] ARM: dts: imx6ulz: Add BSH SMM-M2B board support
      commit: 522211c675c3aa92ad0d3a046d860e4f1b0978d5
[7/8] ARM: dts: imx6ulz: Configure UART2 pins on BSH SMM-M2 variants
      commit: ff35ad2e7bff17aa82b34d0df74ebd17da6232c8
[8/8] ARM: dts: imx: Enable USB OTG mode on BSH SMM-M2 and SMM-S2
      commit: c0bdb8229285c9652f5a50fad97ca97c1d9894c8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795114181;
	b=vtndcL8eJJ0IW3CWkMoZmT/Q3H0XFXA+pSMAxtbvuFvR4sH/aAzRfVnUC9jDNrNrlHAk
	 25QMRVGN1d+ka9LzJeaqvjcomdDdn0kOnxWre1FqmKSm720PUudd0SpHNXS8CvVb+GjaF
	 HM+iPPVFbw69Y/es1Sdbaik+IzzE/8aPUnu2w2AtAUKOLcbptokplELavSMMOyyM4ElOw
	 AAOnp9wdkl6NSKLYzimmPz6ijLPPwPBXOJnztQIJUNOSDZrU+lNqCVjs5B29k05IuNJIZ
	 rVqSpAAGTOmkNgl3hkU92bBkkPbHw1eOj6QH3MruByGWc52kO/Nblgjtk6X/s+Ys3Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114181;
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
	bh=KEv0asmb+0QOlA2ySlZMQOAzyYmRGy1vWCjXK709IGE=;
	b=zbjl9HWwEHl9abT8WSreMyrEOY02RwoL4PCyZ4cLMUnGyzFiJY5TC/i16k5u0Kjs0h1b
	 bpYfUXMHPkCJuwEGxZLxosCGLAxwWULNyERSdbFa7V6q6DsaCXSsvEcHVGCknsHl2gbbt
	 77beC/bCY2BHqkaFYXoV1oLAKQaewgBHK//Ary0cWTESQqjg+FMSHO/rUcLCh2RXU2Is8
	 IcNKxhzp1KmchUbXQGeBw0SwrmY7kN++6pc1r7aAXhHoC4F/GVpwLG5kk1GYYxQXtrah2
	 5iTwQARYScnYMXAzr5Q+Ua7CLcuP1DqIA8/LtWrztmZvDd6js2ITWM+8voGv7JhtLhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=a4o+E2f5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.72
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023072.outbound.protection.outlook.com [52.101.83.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089F606A32A
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 18:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2089F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=a4o+E2f5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRafyHTCStP/Le/VjnDOMPJUG8N80L2t9cRFjxVdKqa4UOQJ1AKG2N1pJCAS/6x5vsSxBxl3x6qu1Z6BE9bJJP6gngTBH4bkL9k37X1V0ucz3fpEBHe/qMPBDzBjovic0rl0MlEbEfRxVpLT380TozWDZiwpYdwzkR7lWD8EH25v1VnSjmJWQkwQs5fIPxoNUx8qaU0dI/RhADBZm8TTnR4lq8UPoEo8pVkNTkns6MAneFqLj/1zR12Tp+lE3JYJY292uiHDY4O8zWDX072ae2rmFNNl5j7V1WUcOxCG5/61nem7PIBfLZ8fcA6qLDRii7HZPqV0Qs+QUbtD5B8sXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEv0asmb+0QOlA2ySlZMQOAzyYmRGy1vWCjXK709IGE=;
 b=DL3Rh0swCAHE+3k8kM3jWlQkQrnEQdTw3LkvRBNbk9q/C6NaW+24PTd2hpDkD8YjYD9MIa1MvqzaXRy+qAWFOjR6DFiXIzdOe8ACE6WuZt4yjFBJrYCvsKWMCiV7JLgn9IUeVIib+CmonbzuxgUYm7qC3MZ4pTyTYbrUAiowkIlFa5jZ3dYE2RJ+H1Lie40JKxOyGX4ywruD/daPfrybkzoUViXi1EF1BmBztpaDh69ymS4fq2GyWeJZPCD8xYRCctpohq8/w7NeHagzBD6BblFao/D4A0foTCZ+mrCvP9Qt42Ker7TJeKBkmBuvzzpKF9Dd9umIxmnukqVljsDW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEv0asmb+0QOlA2ySlZMQOAzyYmRGy1vWCjXK709IGE=;
 b=a4o+E2f5KgY3VEo5AkrFQUExi1hsf1NVQac5rYyGTSkchPc92fmXVHdGf3fjwRXzzSIZKBmuKXCBBePvGD3yQDVGA0D+M/Vv+6G5AVywKxaAdICjZTAqQ6iz1oCLECL5o4qJx+ksZc+9dPPPrWLBJlJJ0W1h3OyV21kTNoECLGoZGq+V2hgfLWqUceZ71dzAGT8N73lzpMaSWfAtarVGslHWD/E2Cuu4uoFTerzwgkPk+yyhoreV3sNYQFi/SqB0HAzardWTLoNSF3+GqkW8FvHkArGSh2rpsj0jUL130Ujj8cnwBD9X5dZMt3r9CSRmdwhJBdzVjPZu3R0/6yggCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS4PR10MB5600.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 18:49:34 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0662.001; Thu, 19 Nov 2026
 18:49:34 +0000
Message-ID: <463b3707-4126-4f32-990e-e8f02d278695@kontron.de>
Date: Thu, 19 Nov 2026 19:49:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v51 5/7] firmware: imx: adds miscdev
To: Pankaj Gupta <pankaj.gupta@nxp.com>, "Frank Li (OSS)"
 <frank.li@oss.nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Peng Fan <peng.fan@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
 <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
 <180d2335-e328-48a4-b376-a90464279027@kontron.de>
 <3acc652b-d2e2-4a18-b70a-2656b309d798@kontron.de>
 <av3KA89WuUc5GdZj@SMW015318>
 <a2d7056c-602b-4c6b-bb14-211843aa3183@kontron.de>
 <GV2PR04MB12271E129EDA863074E4807B895792@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <GV2PR04MB12271E129EDA863074E4807B895792@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS4PR10MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d629a00-da0b-4560-6993-08df466ddaa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|261026140227099003|261026121527099003|261022105027099003|10067099003|261022075727099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	q31J+nS17P1tq2zFVCMm+lxYWcim0N3J/Qmo/gLnyPheVEDirBP1I63H6GBlum7abw/iVrf8VqBDLlmRDw2lq45b4HK6QqlR+045F4wf9TPD3zUmJJMDE+/MWvlDBiFG1dyD0KJgOe0JVpBllCCp2ZCDRXQXvknw1s2f6Bfkd0p8Y6BUaOayI8t+CzBie4dwoYzmU11Yd+ZucNkp58PIYVZ3CVCK9GQQYppnl1Xdq0SKjX98ZlasEmzBCjj7cgy812ege6b5guL8oBJS4s8pq7gDxIxrIOo/EIiQrs9UN6HYbSfWymxT1KwHF4817Wo2cIumVN567pxbDnki4yGgbgl/uL/y+UybQh5j4yTlQZXOUnbAPr/3ws/MfyUv0tQp36d4JiFK0cvjXY0V1DwROGkUgRl1/sx/YtPoEL18v1nfMzGKb4flR5eojRqUVVoGXx3NnG58p8PJwa2ULalqm2Qqmny5ToUMeS7JghgRgwNmp2gOji/VGf0Unv4OJu9ZbbX0EG6+EeJehD/ZFkQlS0FP//gB94JDeoZl0/O8jCEj1BaxlI2lAgGWQaCAHRlaZREmEUrqCr9TjSX8nrK71ryqQMu6afi2ucEt7hYQsczcr8OoQ4qn7jyNTOoqMoOB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(261022075727099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW5ZVkxsNlBZVVFNQUIvRWdyVDhES0tNYU9hUjNMdlQwM2l2RnkzbmZ3VDRX?=
 =?utf-8?B?RE5scEhjcWRxTkt0bVRVcU9lVFgrSGRGYk5iMThPemRTaERtcmkzYUI3WGJ3?=
 =?utf-8?B?TWROeGlhSFBsd2hGOFIxalBmc05EVjVPK3RjQTdMblR2K05FUWxaWXZQTmdH?=
 =?utf-8?B?SmRWV1NpZXpyeldlUGZzdm9hUkhOWWhkUzVZZWpzZHpsUmdzMVNzdDNUL0M1?=
 =?utf-8?B?TkNLSzkyZHlWV3F4a1Y2eGJ1aE1Uczl3WTN2SDJtNFlaVVc3RW1OTm1jdy93?=
 =?utf-8?B?RDBUenh5VkVNMHJBRE1Ma3VEQmtNRFpxRkpkTnMwTW1FRzg4SmdIY1NPOWda?=
 =?utf-8?B?VXdoK1R1Y3lESmNzWTRGSUxhZVpHeUpIbERXWVo3TkNvd2UwQXVZNDJDWDBJ?=
 =?utf-8?B?WGxiTSt0eTROaVFEWGN5dGluMlIvL3AyTUwwb1kyd0lmVzZuSEgwSHE4M25M?=
 =?utf-8?B?MGNXRzd3OEcrLzd0b0o2a3M1QU1FeCtTakc5b3hKOGRza1liZmdBMmdQaUZr?=
 =?utf-8?B?Uk1mM1U3TnB2bnlPVld2N24rNS9YR2lBeGJEWktwbnYvbWs0eUc1RmxkUVhm?=
 =?utf-8?B?WHlIanFUWWF1dEZJYTd6ZHpBRHVOWC9VTFVqU2xacTlnMHZXUlZlZ2J2akhO?=
 =?utf-8?B?d0kybzNyczhtL3F5SkFrT3NsWmJueExMYzZLa2dtSm1kbGtPQS9mR0tTUDd2?=
 =?utf-8?B?Mk5PcldieE9PNVB5QWdZOFJONGxsK2xZUXU3L01GcDZEVmkxeWVDVmVsQnRa?=
 =?utf-8?B?d0xmRmFRQzJYNU02TFZjMXdvWmR2YWY2RU13Z0s1dUN2aHFJSjlMWHQ3di9N?=
 =?utf-8?B?UHM4bDY4aHZRTmUyaE4ydUNBQ25KZmx1dzNsTC9EaTA4K0F6blE2Uk5ZTnFH?=
 =?utf-8?B?ajNEMHd1S0tiYXIrMUZYWDJ4NFN0T1FwcDVwbGc3Qk5NVlpEZGNSelg1TXR0?=
 =?utf-8?B?U3cvVmVIU1d6Ulp2Y0VCcm8zRDBmd0VjdUdzVGRLWUR1dFFRWWtGSjlMa3pX?=
 =?utf-8?B?ZGE2aS8wQXN6Z3pEOVJYYVA2MlJyQ05hQ1FYQ1IvTzU5YzJacEFSaVZORFdQ?=
 =?utf-8?B?RDhPN2hybE8vQnZwSnZER0dsT2RpVUpVTVFVZHJKTk4zMlFGVWo1dmo4Ynla?=
 =?utf-8?B?Nkg5VzBpWjdFRkdLVGdXSE1TR25oMmZNYW00RmRwc0J4VytQTnU4VnhDNGtD?=
 =?utf-8?B?cHBXSE1EVVQrcHA0aktaK0dWZVVhRG1QSi9mcm94R1d0WjMzWmhtMjliT1ZZ?=
 =?utf-8?B?dWxaWkVqVWlnMWlYY05yWU1yME1HcXNnbU12bDFoSUNYY1h3ejcva0NwbFlJ?=
 =?utf-8?B?MWpUWkI0WXpQL0tGOUgrRG5aT0ovM1VFUUZZem9XL1NueWY4Z1dXeDBVSmll?=
 =?utf-8?B?YVFpbzlpMUczZGYrdGdDR3NPQytLMHczemtqSDFYUjJBRWFWWk9PYm53MStO?=
 =?utf-8?B?KzRKUk9CU2hmQjNTSGNpTTRFcjUrdVRZZzd2MXFDaVRDNEdGQXNYcExYcDkw?=
 =?utf-8?B?ZDZYQ0dpTW9FcEdWVVVnd2FrK09BSEdPbGJLdlJmaE41b0dEL3c1SmtvVVp1?=
 =?utf-8?B?MjFoc2VzWGk4VHdkMkFyMkNBTkR6RG5TZ3hiSXJxUW8xN3VxcHhUT05SOEtn?=
 =?utf-8?B?RWFOT3lDVnpZWHZsRlBnaDVPK3BXUWNjRXRFa0dFeitMY0ZTbW1DS1U4QURV?=
 =?utf-8?B?a2hiYmR1YmtXOU5KU2x3UXI1a1FyTGNkYmhuZWR6bDY0dFhKelRGUjI2VFRa?=
 =?utf-8?B?VnlqcFo1aTlmWHNkRDdMWU5KUjV6VHZUMHhrdHVlRngwN0E4RHliL2tHdE5m?=
 =?utf-8?B?eFlYUUR0dDU3enF4akhMUVNWTE1VMlg2Y2prMWNWdnZlb2FTZ2Fja1RLeWpv?=
 =?utf-8?B?aGNEbE9IVHkrUWc2ZUp0MEpmaEorbDFWQkpybGx1dEFaWE1lN2R2NXRMTnBW?=
 =?utf-8?B?TlJqVzJJb3JhSmY1QVNjYzd0ejFhYmg1eFNTMjRsaVE3M3BibktwN2hHYzZT?=
 =?utf-8?B?WTR4azVWSnlxRWUzQ1RST21XOHRyeUNnS2JGeXpGOGtpK3Z1eWowZFFSbFgv?=
 =?utf-8?B?b0x3d2d3SVFlSEF6U3FRaFhGbXg2YVRsMzJ0NzBFa2dFaHFrODU0cWRSSDZP?=
 =?utf-8?B?a2l3M2FBK0dYQlZ2aDFLZ3NuSE1GWmJqSmNLdE1aSUphaGVQS1o4Q3hBalZI?=
 =?utf-8?B?THJsenBRcW9wanNQMWNQbFJMNzk2Q1NQTjI1cWVsaElnejM4c1JVSXJQcGJl?=
 =?utf-8?B?UTFPVXNTVmNuY0xIVDR1dWdVZ3RkTUZVaDZGdzZzZkk0SXlyWjFrcFlKQnZJ?=
 =?utf-8?B?NEtxL1BBOXRxY2hwSGw0Vm94R1N5ZXlHTWhSQ1dTL2VPQWUvVVlKcXpDbXQ2?=
 =?utf-8?Q?+LunzZOOQUJIlgFc=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d629a00-da0b-4560-6993-08df466ddaa1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:49:34.4692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deaWrQduM1ZhyylbaKIJxWj7NtxaGzcoWucDefs1moKjBlKb2iiPZ7yexB2t5hVMR3IBwoc+ozuY8yHCykl/UZhqRp1iSEnngb9sh8IB6PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5600

On 19.11.26 18:47, Pankaj Gupta wrote:
>>>>>>>
>>>>>>> It is in linux-next about v37, but build bot find many problems, I
>>>>>>> dropped it and request to fix it. And sashiko is online recently
>>>>>>> and also find many risk. I request to clean up it, and local AI
>>>>>>> environment have difference with sashiko, so bump to v51.
>>>>>>>
>>>>>>> I put to linux-next again to make sure that pass all build test.
>>>>>>>
>>>>>>> Other two problems, need more time to check whole review history.
>>>>>>> reply you later.
>>>>>>
>>>>>> So this is still in linux-next, but was not sent in the pull
>>>>>> request for 7.4. It's rather confusing to me that maintainers add
>>>>>> stuff to linux-next for build-testing and then leave it there,
>>>>>> neither removing it, nor continuing the mainlining process.
>>>>>>
>>>>>> Frank, what is the plan?
>>>>>>
>>>>>> I'm currently rebasing my work for the NVMEM driver onto
>>>>>> linux-next, but as there have been so many iterations and this
>>>>>> whole thing took so long, I want to make sure that this is not
>>>>>> another dead end where I'm wasting my time on.
>>>>>
>>>>> I need to ping here, again. What is the plan at NXP to move on with
>>>>> this? This is blocking multiple features that depend on ELE firmware
>>>>> support for i.MX9 and similar platforms from being upstreamed.
>>>> To be more constructive, here is a proposal: let's get the
>>>> kernel-internal part of this series merged first (patch 2-4, DT
>>>> patches 6-7, doc patch 1 reduced to kernel side). I currently don't
>>>> see any objections or issues with those.
>>>>
>>>> This would unblock drivers using the in-kernel API, such as the NVMEM
>>>> driver and this is also the part I already tested when working on [1].
>>>>
>>>> The somewhat more controversial uAPI in patch 5 can then be further
>>>> discussed until there is a consensus on it.
>>>>
>>>> Arnd, Frank, would that work for you?
>>>
>>> It needs at least one user for the in-kernel API.
>>
>> I can provide the NVMEM driver as user. I just need to rebase my series on the
>> new reduced firmware driver patchset once that has been posted.
>>
>> Or if you want to have this all in one series, maybe someone at NXP
>> (Pankaj?) can provide the firmware driver as proposed above in a public git tree
>> somewhere or send it as RFC. Then I will provide the NVMEM patches on top of
>> this for you to pick up and send in a combined series.
>>
>> Just let me know what works best for you.
>>
>>>>
>>>> Pankaj, can you prepare such a reduced series?
> 
> Hi Frieder,
> 
> Thanks for the proposal, and sorry that you had to ping more than once.
> 
> Yes, I will prepare the reduced series as you describe:
> 
>  - patches 2-4 (in-kernel interface only),
>  - DT patches 6-7,
>  - patch 1 cut down to the kernel side,
>  - patch 5 (the uAPI / character device) dropped from this series. It
>    will be posted separately so the uAPI discussion can continue
>    without blocking the in-kernel users.
> 
> It will include an in-kernel user from our side, OCOTP/NVMEM support
> for i.MX8ULP, and I will make it available on a public branch so you
> have a fixed base to rebase your i.MX93 NVMEM series [1] onto.
> 
> I will reply here with the links once it is out.

Ok, great! Thanks!

If you include the OCOTP NVMEM driver for i.MX8ULP, feel free to pick up
and adapt patches from my v4 patchset [1]. Especially patch 7 [2] might
be what you would also need.

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de/
[2]
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-7-1a515de33093@kontron.de/

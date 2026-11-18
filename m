Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795006017;
	b=eIA3KpZRoiD6Ml+gLhUnZbnnt9DiVZn1N8Qscb4s9mMZbFrv8tHAmWcCrZL37Yp+yzoo
	 oxMzMGav2eevS5iP26yyw/9OlPMGQx9AJLNOCq8Ew/vmKXMAASR9HngmU/ypY2N2nbo23
	 pS2Rq7Qa3n1GIhEl9T51/TF9wsv4VdsY7xKeD+jC6X9YxA+9fi66ayIv70jt+FkEAgUgB
	 pG1TkJyfLqUvq1yfrfGcoH62Elx1pQdI0u82zCQkukpOXaO/zHmyEBCjF8vAywWN9WEWS
	 phpBPWfl0VEeThr5Z33vW8TOLbSWoJSRsWbFSHHOG9Uo8OtN0DlZXaujC4Pd8nZrltw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006017;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
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
	bh=li65XB04WseXUq8cuZWYwEHkNArGTVKVnfLUbCTETGs=;
	b=Qlm+m6cHqXFZuk68E4wAPeBzZRgXPbR5Ib+1ypt2QXy6jzVycBvUb1dbrpK3vZWG367j
	 sOSQC2GQoqBZjzRHNNOp9p73GmmRvHdnqH8qd0w/s/1Ry4iYfxiz6ickIZgkrkpg3jnaS
	 zc9BJ5NqPgs5wAN+7OSUyOIf8afoIpZK8VUahOMOFIY37SvigFkUs0WJ1ghlJveyU63gb
	 cOFOdPbXo6C0t2yT+Zc/j/86nAISjVfZ/4AVL3ZeHOuRsUsvCvi/lqPN/dSu6+1bIlObN
	 biLORbEJOwL7WxQdmNC+J1TIr/pnpIG9z2LKtU/y0QnX9HFPwgf9bgjKhtOxMgKDKIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kontron.de;
	spf=pass smtp.mailfrom=kontron.de;
	dkim=pass header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=Mtnv5zc6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.140
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023140.outbound.protection.outlook.com [52.101.83.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C464606A334
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 12:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C464606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kontron.de header.i=@kontron.de header.a=rsa-sha256 header.s=selector1 header.b=Mtnv5zc6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9VuuxN8boBa9Tqutycp5jxINfMyYV2HZCcicoAY0FKRa8WkHSGTFPFJ+1i97Acf7zjUsfMGD3jB9GPXgqDkCUTHkAfe+j0QVcqYlPdMThK54/BSMKjb2a16XZZch/5dUZ2fu2W7vtpHlSVf1FaHR0P3toEJb6fXx1s1MUpdROq3+lxphGmDLD78Yf3i78BI2kxxg6+eRAhuyhJ0eqW7ui/bX4W3bfH2J1YRjJz3aqe+oZZ0vXhpShptbCy0mnZ3RIileCt9H8CPkhqF6ml34fyeV/jsPef2gokecQEp11ZL/4xP+ZCZ7TfE1zl4tDKTMnugPVBJt6mTqnqaM0d6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=li65XB04WseXUq8cuZWYwEHkNArGTVKVnfLUbCTETGs=;
 b=ZTTBK69+N/2Gh4QdQiOAEpl+ab87/XX0lfWqhb8hfPbqXMiwLLxr86PK43+hT1CoYQWeaKHl5MVEzfa2lJm0l/w3neLb5O093CQP+PrUuex0zoUc0Kl5t3p/C94GRrOrkPOWqN9EW5lY2NZ8i8y9GdMhrh5sEy98LMLfoXcNTkF8A1kJTcX0CLUAcFVm9nWOikpFI9buzFCp0F1TleLSqtdUWWJsWNosn8jbxNIj7/ClNLeDIb1WN0uSoKci8MoOkwqgiZlv08tFHQFpxgMrewRJD5cHNDqNnuwtjXan5I6a3f/c5F4/kehMklCNp084j2KJvX+9pMZUet6emJSeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=li65XB04WseXUq8cuZWYwEHkNArGTVKVnfLUbCTETGs=;
 b=Mtnv5zc6cN/BUEPpsxiwZXZzf8MBL6qF5udebUndjcr3YusB4h/xAGEPoezHoa1RYxwm6eH27Dw5CaVqVZfofBHUPXySu9fEtaMk2ckrk13O+JVH2QZDHYRuY6/0H/5WAakdowg+caGEcVMj2ynmvahJPwtb0NE+QdbsxfCG2+cKgPH/2WHi8FED31Flws8ONcwhpQX66QYiIPvgiquGyyvzQkzSfzcLjvEnkQzpInVyPp7dD2Ijmc1soHg8ixV7m3b4avdLbuUvk/kwGuFDA9xzRB/rgVSwd4mb0tdYqIyrj3F96Ef2v1Hh8KoX9yfWUqdoS4sGK+dtTg71uftHKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GV1PR10MB679331.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:3be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 12:46:47 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 12:46:47 +0000
Message-ID: <180d2335-e328-48a4-b376-a90464279027@kontron.de>
Date: Wed, 18 Nov 2026 13:46:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
 <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GV1PR10MB679331:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4105a3-89fa-4356-7977-08df457201fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|4143699003|11063799006|56012099006|261026121527099003|261028144727099003|261026140227099003|261021135927099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ky0PdT6lBXaqUqjecjl5xWVsDN41TJKrUDSUO8Q2g/q+iJRpN941SVEYlWJTWVlzl2bqZgMbRwyNb2xkaqeeJMjN/MxaltNb1uUE8rar3ccSjY5P467z5ScWItxp7yJePRhNMA5a+eN1wDpyZsQWh/uoBTpYbmViuP6xv5LLxpZiEdqlYbjFmMcQRXvkAgdr2CcSNFD9kLs51aNDwHp7TH4M7pvIo5Wjl5sWacndVY3KQ6+IZYl0uKHn5hoWPxYNnQygRdxls9INa4y5ZbWqJw0szvE51YqfaMp2PFZXiZqSorIVIpXsweeCO8s53ynE8T2czxO/JNDP9pgfmDnqgrZ9HbrVqumSU7DdWfyKzj4hgfRMCuo0sKPi0UztvGMaaEc/oaX4FimhpjAMr9WH7+KZEeT722haq0WlTp1jHYTEIny3uouOmyGuBbTKstfmM3j8iwMhGzisKVtOr0pEsVelgQKlIe5nljq1Nsc1xlKJq0P7GA9zlM9GFxnCncRrWPybGmFrKTuA+kNb+LTVzipdPxMAuGiZFjG7KoA9yP4/4nXltoyYoK0X/FT+sPkPr3USAq/wjSDOtGwhrZqTwWFHQlllTQT1ADGlp/oX+AsLNvDsIE61dx3uHhbfC7GNUYhC51fLF/obQZX+3ul0VPxPcSSsSyYqw+xUrh2j4gg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261021135927099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJHV05KOHBValhCVGN5d1NqQWRFRkhseG9aWmJMTmRhYnltbzBmYUlJL0Rl?=
 =?utf-8?B?WUJhVC91QWV3dElTSFN1WGNaVmcxanZsSUxQUC9CbE0rMU5DNDRoMU5CLzRE?=
 =?utf-8?B?ZU1qdnh6TXZieGNEc1V2WHVNbVBnRTdOU3pwc1RObytyT3h1c0RoaEYxaEU4?=
 =?utf-8?B?elJKMW5UdjZ4TnltaFRYRXpxK20vSXFOMlIyQVdTL3RucWVKeWxjSHhTcWxr?=
 =?utf-8?B?UDVvcTYyazh4WG43akM2RVBlZ3NMd2R2emJzZjBQUTlRWFEweHp0Y3FhSHE5?=
 =?utf-8?B?UGJXUEt1ejRNKzVRNGp0dlI1azhWajlIajNwOGFNR3lPOUVIUjc4L0tJZ3da?=
 =?utf-8?B?S1pxWG4veHRTazQ4Yld6eFBvUkhvNkR4Y1JEV3RnY3h6T1JTTmlsV3MrTW5s?=
 =?utf-8?B?UkxpZndJNk5NMHUrdHFxT21iZ3ppRXBkRENpNkx4T2Vtd2F0bDFLVSt1alMw?=
 =?utf-8?B?U0xWZ0VkNGwxZy9HVG1reWlWc2M3RVJlL0Y5bmpOSjJLaXBTK0VyNjUvSzBK?=
 =?utf-8?B?d1ZGL2UwRFI3dW4vOTVaQzRzVmhrMy9YdU40MDBENURtaUZlNHBHdUdIalo5?=
 =?utf-8?B?R0g3cndoYnBPOVN3QjJoUnllN0tuSlF2VFh5TUFlYUpMZkdHQ2xabUtNZGky?=
 =?utf-8?B?aUJBL1pya2FXM3A1elprcnRBZGNFeTh5Y3NGMXJ5V3YrODc3N2tXWlNaN0hR?=
 =?utf-8?B?d1RSeUNmbVI5UlNxZ09tbURwQ2tad0NBUGFMVlJxWGQxc2ZjeS9DeThUdSt1?=
 =?utf-8?B?ZCtsQ1FLd2dBNm55Ylc2NWFySVBVY3JRZGNsMTF1dEpVb2hNTzd0SUtldGM1?=
 =?utf-8?B?RHgySWJaeDNLVjNEbjZqaTdIL1NNTXVoU3dpdlhxTVVxZTF0MHp3eXk2OE5v?=
 =?utf-8?B?THFRcXl1eDZnY0pvNUNxUFlFQ2M5T3NqOUE3U3J1Y2Vud3lEKzZRZUZKTlV4?=
 =?utf-8?B?ZG9Ld3Myd3cwOGNUVGdWLzRMNk5mb29mcnhNdUFyUzlyZ2x1a2pBK09tWkdo?=
 =?utf-8?B?Y3lvMDNKRWNkNXNQMENGRG91aXBTeWRwNEl4L3p0RVRYWUtDeERkdnJmajhu?=
 =?utf-8?B?bWVKSlUyWHNHa3k3eDlSaWdseXNwNUgzaUtIOUQxSU1DbEJYaEJBcVh1Ty9O?=
 =?utf-8?B?SUhsV0s2VHZ4b2FpM3FicHZzU09tOXJMandjMlFvVWUza2hNaG11ekhVbklo?=
 =?utf-8?B?T0YwN2dsWEMzcmpWUUlab3R3MnNJQ1JmT0F1K1dGaEVtY0UrT3gzNEV4VFZs?=
 =?utf-8?B?UTVsSHlvWDZscFlqdTkzMG8vWUk1NDQ3ZjFSSE5sS2JEbi80ajlWbG9MTW9M?=
 =?utf-8?B?eVB2OU1RVHV2L0JVUURjZWMzSmxOYmdYaUJFV283UkZucHZIQVJ0MGJIamRR?=
 =?utf-8?B?ZWVNb0tFQkR3NFNHbWJEQ29LM1NFVlo3Vm15cWRuRVEzcjVLRDBkRHVoS3RU?=
 =?utf-8?B?aVNVTEVnOUlpOTFMajVPU3R1YWhKTXFUdU9icjNRV2NVaEdjeEV1R2xiSkZM?=
 =?utf-8?B?MUlrZWZmR2J6am9ZV1hyK2NQSE5iWGc1ckFJZ0RqSkY4ZTBPK1pVd0VUajRy?=
 =?utf-8?B?R0dMUnE1MVpwQ3VSSGN2S1RzL3F0b3RWSVM4MHhQbDVDaC9HNjE0U1pwY3NJ?=
 =?utf-8?B?NlFtNnB5QXI0SnJ0QXhKMXZyN2xnQ1ZoNmF0eEJxZWM3VjhqR2RVVGVLUHcy?=
 =?utf-8?B?Z3o1ek9oTUpWMElHSEJVR1FoTEFDTnIzendhTzlBbW43bHBOeGFCQ2xuK0ZD?=
 =?utf-8?B?Ti9rTXM0anV6d1VYMGllSDB4a3RiMlo1bFhoMFRJSkViZnZia1Q2YWtYN2Nh?=
 =?utf-8?B?SG9Nem16Wmtac08wcjRhdHZsMW1jTUpKTEdBblNTT0dOb0JpeEFSZytjVGto?=
 =?utf-8?B?NE9kemp4dnIybU84Y0h1M3RtMTl2eStLeWFXTnEwbmtmZU01NDE3Y1JGZVli?=
 =?utf-8?B?eUsxMGdKaTd6QnJad3JLR091RmhJUHZNMzgxQkVQOVU1UDh4bFdXSk1DV05u?=
 =?utf-8?B?cHYxdW1oNGhNNkhpVlVWc2tvRTFEVjVxaWdYNGR4eTJnVFo3cy9KNnZiZ25l?=
 =?utf-8?B?UFFVMG1jdHlzTWE3NDFDY3RMYlEreGJ5dHYreUtmRVVBZnVKY1lRTG96S3lR?=
 =?utf-8?B?YnAyTHltZTZqcVVJUTFPQWFLUmNCVkpHMnd4TGsveDNUdXhPL0J6ZXVsVThx?=
 =?utf-8?B?MTVhZkh4QW9wNmJLVVA5QXVENGZuNXdtK0d5aUtTQTBwbWVtS2E3eVlvbnR4?=
 =?utf-8?B?aXd3OWYrSGVDWnpGcDkzV1dYT08yL0xaVzEydHI5RG9jNk1DenA2aTBDVDEr?=
 =?utf-8?B?WXFDSHFNMHo4R1ZvTVJkSk13bzB4UVJ1WkJFbnozV25ORGRBSnN4RGYzZXhZ?=
 =?utf-8?Q?ym4JyVX74TapihdA=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4105a3-89fa-4356-7977-08df457201fe
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:46:47.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLpQ6Fjvh90elOHSSvl5GYtc9+A/5KkBfklhC0Lw9uQaLSnwa5ki3UxIySswKbbcYLAhiMKEE2Ahw04E7Shb+SRN1qZ150XWGHrfE+pmKbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB679331

+Cc: Peng

Hi NXP developers,

On 05.10.26 16:28, Frieder Schrempf wrote:
> On 16.09.26 16:39, Frank Li wrote:
>> On Wed, Sep 16, 2026 at 03:16:13PM +0200, Arnd Bergmann wrote:
>>> On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
>>>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>>>>
>>>> Adds the driver for communication interface to secure-enclave, that
>>>> enables exchanging messages with NXP secure enclave HW IP(s)
>>>> like EdgeLock Enclave, from:
>>>> - User-Space Applications via character driver.
>>>>
>>>> ABI documentation for the NXP secure-enclave driver.
>>>
>>> I just saw this in linux-next, where it has caused a build failure
>>> for a missing include of linux/slab.h. I hadn't see the series
>>> before (even though it is a v51, which seems crazy), but I am
>>
>> It is in linux-next about v37, but build bot find many problems, I dropped
>> it and request to fix it. And sashiko is online recently and also find many
>> risk. I request to clean up it, and local AI environment have difference
>> with sashiko, so bump to v51.
>>
>> I put to linux-next again to make sure that pass all build test.
>>
>> Other two problems, need more time to check whole review history. reply
>> you later.
> 
> So this is still in linux-next, but was not sent in the pull request for
> 7.4. It's rather confusing to me that maintainers add stuff to
> linux-next for build-testing and then leave it there, neither removing
> it, nor continuing the mainlining process.
> 
> Frank, what is the plan?
> 
> I'm currently rebasing my work for the NVMEM driver onto linux-next, but
> as there have been so many iterations and this whole thing took so long,
> I want to make sure that this is not another dead end where I'm wasting
> my time on.

I need to ping here, again. What is the plan at NXP to move on with
this? This is blocking multiple features that depend on ELE firmware
support for i.MX9 and similar platforms from being upstreamed.

Thanks for your support in advance!

Best regards
Frieder

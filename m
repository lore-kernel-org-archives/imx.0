Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42E027A103
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438698; cv=fail; b=Dz1zkFBWROmQF2h34XGFxVanOYS0dfBwlbibNxdQqu+ioaOH8UGF6vAQMw7QJfYJQ+8bKs1/K0eRjCu25BlBHUNxrFUEZS21ufBytB4QHLuDWF8oBkTyQEESbmcVR6vCqEezZeJ/e4GriMPxyf9Eryrf7vMNKQrK31xUmqTntVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438698; c=relaxed/simple;
	bh=fc669KPwZlLJdSy68cUoWNttb9unN06kcnz0Htd6Axc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M/AU0K+tr+dpNL3TkWdVl2AJ6WPa+ESlQrJzJESMFuR0XlQ6OnNAOvDilFxxdO7zg8UWbGSEo4esnpIy0PLUz/uKnLXvNKt9WAyPW8VlL6oa20yYo8WEsmG7IVNOwBsmIPq7a055/Ni0e+eFaBFLR2MMtajkuIsJdVxdvjNylrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fV1k5rZF; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fV1k5rZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJrpJXmCfNmadmnCzxPpwsWuBbqmgC8mniOnua4ohtRV0/HjlklTevmTYCytqKFcAYQFx1vee+cPHZ5u+cV9kj8lGhDD5oWAmo7QEu7Ln9AIPVWZQxD4zSJyRAhuOJSTclio15kmWaqL+aJg77s9ADCJMH014Oc7+wEwxE8yV1TyIicICWn11JFg92EzH7HXY/ReyJTeLIEhb98H0CgTOR+H9wAUfZl0BPlJofRyY5BcIIxBEBF92soZjwmxaPOoEToptQtL9+uzDVd1I7IWtrYjBF/QVQIpEQpPo79IxsxiF2lt1V6XrzRhbUvfA7qNkV/t4pt3IyUqaep1Imh9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc669KPwZlLJdSy68cUoWNttb9unN06kcnz0Htd6Axc=;
 b=gDf6wemz0AJet/vagf+tMy/0Dnv3ddf01/7ZTRv4vZdVt59Anr7YJeKMuqhRzZfO5WTxRDqxGLpRlAQxFuElqUMKG8CpTT43uizwUVP02C/0qPVYwnZup4OQ5eKWYO+SytVeqWcuUdt8c6AJa/x1HruwODgQ1YpwXk23YkBDYIckZiywoJAegmAvLeKKv5V0PHSayExLuu0YKRKU3wKGdD7cLWjAKSdomZvUTjRmmTglzg2G406WEq2eWcqzlEV1akLXu/yLMg8BI9KZbAOCaE9UeYB+87+EMcmU5OE9d9gWX7GPkgqesZRnFBCHx0RY/e9msvGvaa+/uYdTwRZmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc669KPwZlLJdSy68cUoWNttb9unN06kcnz0Htd6Axc=;
 b=fV1k5rZFPEcMLboXm9PKV8an0dY5/wzhlCZCkluh2Q6PHXE8CN8BTj3UunJrHpnCBynEJNeCdK3NsdvOf6PCyjlfBEm4M0V9hRtMwJeZEeSXVFhxNDkfLA/Z/Zb4aCS0KF7XjSj7A7sRRIre7D6qbzXN/VAJ1htJiumr3HZExJXpX4i54O1Yt4YBRnj6srA74FbQZ3jhhJvjRuUTK0JsNJqo3yOHUR9jACNBQzo3LAWfgudx7s1Xz1dm9yK6ijafbE6smR5vryhE5n9vcfuxXIO6NdiQyfd8FbQ7n4zU+7dJxLh6drPmTfHFTZ4nzctLstYATe1WtAUDTUAqgNOA5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PAXPR04MB8526.eurprd04.prod.outlook.com (2603:10a6:102:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 14:44:51 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9542.009; Mon, 26 Jan 2026
 14:44:50 +0000
Message-ID: <edd0b5a9-41c4-41f2-9785-04236987fc93@oss.nxp.com>
Date: Mon, 26 Jan 2026 16:47:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: imx-aipstz: set default value for opacr registers
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 laurentiu.mihalcea@nxp.com, daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com
References: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0035.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PAXPR04MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbe5172-92bb-42ff-474e-08de5ce9758c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWlGRHdENGc5S0ZDK3lhc2JVOXRGTXpKSXpOcEF5eFV2K1M2S3hDVTVpNHRE?=
 =?utf-8?B?akF3aGNKejdRbUtmNXlvZUZlQzhMT3pSYWN1Y3U4cUMzOWh4eTBXM1M1b0JR?=
 =?utf-8?B?OGRhTEJLNE5EYXpEb2RDQ2IxU3NHSmx6RXpRRzFoTTdMdlNSd01keEluMjdS?=
 =?utf-8?B?WTM2aktCR2xLS0RpeVVub1JQWWtwYkxtUmJOYkZiN0xMZnpBa0JpWms3eUtT?=
 =?utf-8?B?Zzc2emZ5MlJzZDVwY2pOajV2ZlpvZlowQXNsL1dacVBpZVJDZFQ3OGlxZUFI?=
 =?utf-8?B?eHhKZ1lHRytKNG04SmdMS3NFNVB3T0lIZytjaHEwdFArQWZNMHEwZ3pHZVFo?=
 =?utf-8?B?K2NWRjlPR0ZDL0N2L01NOXVncXIvYWtVTkU4Y3I0SGxNRDlXbXBYc2Ftc1h0?=
 =?utf-8?B?TkJxY3c1ZGdwVWJrdXRXVGVsWlo0WVIyQjU3YzRiTmVGeDI3eGV4RnYzR09u?=
 =?utf-8?B?L2ZXNng4REJGb0hLNVRwSEFJZmNsVWJlemQrMmpXTUJnWUFVeFJSeGszMFZa?=
 =?utf-8?B?Tno5bU9McjZNQzhkTzFQMmhXalY4UXNEZTZ5MTRQZ1pzRG5EVkhuTVNEZ3pk?=
 =?utf-8?B?T0cxb3NDRGJ0QXB1Zm1yZUFRMCtUUnIzWGh1RDFnclhqZW1xajloM21IYjB0?=
 =?utf-8?B?MWd0U3Zab3dqWjZaLy9mVjNqQVVuTlAvdzgzdTRoNmpFdlBwMTl5VCt5RC9m?=
 =?utf-8?B?b25iQWc1cElTTEtTUXNhZXk5cWxIOXBKL2hBV0h0QXJXV216K2ZDdkl0TFNp?=
 =?utf-8?B?YncvTDhHblRBT1plRlNDVTNqaCtTYWt0YzFxRThKanB3M1pabCt6WU0xSitr?=
 =?utf-8?B?T1JrMWpOOHRFd2hmZTJzRHdST1Y5TTRDa0pXMEczblRtclRGOG8xVkR2T2Ru?=
 =?utf-8?B?RktpQm54OENnQWdKdTYrTEI4WFR0OEE4bUJYK0lwZ1h5U251c3Z5djRMUWVi?=
 =?utf-8?B?UXZ0S0dEbE84ZkNRVHpqS043OTRnUDlpaEJGL3F6OW5pNDN3ait3VkliU1NM?=
 =?utf-8?B?Y0F6SVFFL2IwbythMjNOTmlBVmh5MnJTdCtGd2l3ODdLdDRnQ2Nmc0cycm12?=
 =?utf-8?B?Vk43M0Uvcjh4NVVoUlNlZnNhSjZlSDVwK3ZmQUFQRytmZHJlZTRpOFBhMmE5?=
 =?utf-8?B?MTczSFdCVTRVOS8weWEydEY5KzRwUW5icm1rb1kvYWdIV2drYzlqU1BKZ2dt?=
 =?utf-8?B?Z0xnUHkrUTRNVTM1a1pXb1dWVjBFYUk0T2h3dWdhZTFZN3pZN1VnK0RwNGZE?=
 =?utf-8?B?cm9QRkI2WmJaWFVIVDkvZ2hLR0pSVnNjOWFSM3BlZ2drQmtoZlo4TEF1em5k?=
 =?utf-8?B?NFRlMEkyNS9VcHBJTU9vKzJZVzk3cy9EajA2T1MrZjIxSnVkWXRDWVpKQnBz?=
 =?utf-8?B?TGZXaWpnQ2Q2OGR6dTNkRFQzNEdzQTVQUHEyWWFIb2pKNGhiSktFRjYxWFB4?=
 =?utf-8?B?VVl2NU8zc0pkZElJMEN4WU5rRGxNQU5Vb1JrMEpTaXJmc0xvRDdZeU9NQUlB?=
 =?utf-8?B?dEdMSnE3MlNndU90bG1pWXNWQWMzRkVCVVdZcS9QdVJEOXNPaWd1emxJQnZB?=
 =?utf-8?B?MlNqbnVsZnpYZjJRQ3JZSU96SE1LNHN4NjgvR2U0eW1qNlR5aG8xT2ppT05H?=
 =?utf-8?B?NE1uR2d6dVRNZVVYYkpRT1AyUkl1MkM3ZjJJdWE1bzJoT2tNS1R3TldGVEJt?=
 =?utf-8?B?bWRkUm90Q3RvSmQxSFg2VjlQWFphL1RES1F1eUI2RFVmYlNaN3FQSk1zWDFX?=
 =?utf-8?B?UHRiVlY3UjlwVDFKSWphM3dKLzY2RjFBdHJabWptWHM2eWZka2RoeWlGNFRR?=
 =?utf-8?B?VFZaSE9BVis1ZGpUQ3NqN0tXRSt6MEJjcTBGcGdyMm41dWdQWDlpTmZLTTlB?=
 =?utf-8?B?K1VLM1lqVlNUelBocUFaN1A3UFhROHRkNUhRY0E1Q01yeHV2YzA1NUtveGlm?=
 =?utf-8?B?bTRHWUZYODIxeGhCV0FsWUtsM2YrdXlXL1JGTFZqRkN3NVN5ZHNuQU1MeXRF?=
 =?utf-8?B?SExPTml6VDRCd2FhaDU4VjN4WWtUWGdQT0JGTGs0Z1Q2TWxRcnh6dXhzYS93?=
 =?utf-8?B?NVptS1lOT1VwdGw5bmRqSTZjcU1nZytwYSt4bzQrU3dIemExaHo2aThwQUZI?=
 =?utf-8?B?OHZROW1CZWZoanQ5TTV5SStqbE13VWE3dVR5QmdpcE5EZi96TDhoVEtRUkt3?=
 =?utf-8?B?RFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1RsSlpHTFQ1eDFxbXVTa3dSY0wrc0RWMzdvNmlJYnRLdFptaWdjYkVsd0FJ?=
 =?utf-8?B?OE5nV2ZvZitlbkk2S1dYYmg2RDJLQUp3L2k2NE0zckpoZE5DN0VOYUJaRWNO?=
 =?utf-8?B?UVFVSjNyRWFtNUVZYjFMR1VIbEdwbUhOM3pvUVlsTkVFbXhxejd1ODJlZWw2?=
 =?utf-8?B?Z0kydDJNaTN4S3dGNlU2cCtlWllNWmJ6NVdkTEJmQ3hha0NJaDVnRVRuZ2VF?=
 =?utf-8?B?VFJuMnVwUWxIZkRIWXkxY0tqRlBqYlpSdWhTV0VpdWdyT2lxN1Q5RjBGOG9N?=
 =?utf-8?B?T0RnUlZYc3MxNmxleFFIK0tlcUF5L1JPd1did1N3aXJmVFh6b2pPZDhGdkFQ?=
 =?utf-8?B?VDdGMnRzVkR3ZVNJblZWZHZxOVFMV2M5Uzc1azk1Umg2ME1RMjFlU0lkOEJo?=
 =?utf-8?B?dXliTkcvdGMvQjRSR2FidnF5V1NhOFZIVE5MSmU2amxWLzRlZk1ZOG9icVNV?=
 =?utf-8?B?QVdKQmlyTldlelcrSTVoN1JJdndIZ3NVUE03a1lzcVgzKzNyWCtzTkRLOUtk?=
 =?utf-8?B?UU0yamlSR3NRemJvQ1lmYlh0cUhDalEwdkUyL29PcjBMcldBb1lRejE5Q3dQ?=
 =?utf-8?B?aVNNWkJKZEEzQ254OGFBNTBYR3NQSGJVU1pVd051eDlFM1NDc0NJL3VEc2pq?=
 =?utf-8?B?YzVrVEhoQW5LUXY5NllMc293K3FwUWxjWFZhbG4rZU1QUWRaQ3I5a1JUY2hE?=
 =?utf-8?B?TmVFSmJYWGluNGVkVmxIOXlJdWFJTW82WjlGNTlNME5lTUtaejV3RVhyNVhw?=
 =?utf-8?B?Y2tYYkR6cG9sV2xwZTJBR2c4YXRlYVVXWUVRMlovWjNFOHlMcUlhajN1dXBw?=
 =?utf-8?B?V0lRelE1RjRyRFBXQjFNY2ZBQldXWGhCUjREY3c4VWJIYUViOFRWUWlMWTJF?=
 =?utf-8?B?RGJ3dG41bWR0M0N5b1hoZG83R2kxWWYrc01XdWcwYzJhV0pkaklxS2VyNTVj?=
 =?utf-8?B?dHZSU1NFZDFrQ3pMR3lqbWlvYzk5bVV2ZFVoOEJScjJjVmp5Njg5cDNwSVFJ?=
 =?utf-8?B?YXdVSXV5L08wcEZtU3Evd3dLbDl0UE94UFZKdHVPMEZpS3ZjWGZzNW1HRWdL?=
 =?utf-8?B?M2NTK0hCV3MyOE53WG0xT0duTHRDeEE3R2lSWnNpT1dIUDdNSHZzOGNJaXNU?=
 =?utf-8?B?ZUc0VTR5U3JYQUg0emJNNEViMk5BQnM4VVdwT0xpQkJvTTNwUFNDVmZVZGVm?=
 =?utf-8?B?QkdxZDJlTDVzdWhTMHVYUUlrRzh0WisyTlZOQzhYMXBGTk50RWhYTUhVRnpz?=
 =?utf-8?B?Y3cxcjNEWnZ4c3RCa1lKUzZJZUtXRTJrVm90Nlk2d1Q0UDhzZ0ZZWWpSNTZj?=
 =?utf-8?B?dTdTVHJiOW5URmpqaXVOL0VBVFZGV0xYdFRkeDlxN3A4Mk5waGk3RlZHVXZa?=
 =?utf-8?B?dGFWdExQVlRLRU1QYmdYcUN2K0ZlKy9PN001eFgzL3NoTldwbTNrbmpjcjZC?=
 =?utf-8?B?bS80WVdaVURtOWFBcXFKTmVKMHVsNWc5T2w2WHNjY0VRdDVueEFRZTVlSFp4?=
 =?utf-8?B?ZUoycmVXV0U3K1hGSU5yVFRNdDFEbllsR0tXUXZSSkZwdzZ2b2ZyVEFmSEli?=
 =?utf-8?B?NlVYWitYdEsyT3pQTTNyNVJDU0xDNmRBSUcvdXg5VmowVVVIb3ZTRGVuSUhl?=
 =?utf-8?B?M0NueTFCNWZVUmsyS2ZLNytVSVlMWlVBV3E3Qk5jc3M2bFBmVHBFLzE1K3E4?=
 =?utf-8?B?cDJlOTNOdkFwM1VveEZLdHhURUdBaStORU9GMjRJR2xxVURjN3BCc2RMU0ZX?=
 =?utf-8?B?bkRyZWM4end5SkFNazc3V0kwUURhWC93bHBWdE5aeXJKZFlJcGF6ZkE0c2JI?=
 =?utf-8?B?dHpEMkVXU1kva0Z2eXBQVm0wWnhhR0kwL0xLN0VYOFJ3UHRLSWRYWjExNitn?=
 =?utf-8?B?UXQvOWNVWC9rU29HQjJwc1NFUmlIYXo0WS83SlcwMFo1eXIxOGE0NVVBTTIw?=
 =?utf-8?B?NDFOSExRZDcxTWw2cnh6QkVjTC9HWjJ4M2ZuMHF1YXRiYWFwQzNYRUlhckNi?=
 =?utf-8?B?TFVhY3ZXNjA4R0NBUloxZU43M2x3WnNKL1czZ2tNVkNaeFM4RTUwcGw0QldF?=
 =?utf-8?B?dEVLRmlzQ0ZyN296M3RrQ2pHMjFPMVdSN0szUUxmNTJnOWhpdjlhaE1oeS82?=
 =?utf-8?B?enNFa2lsck55c01Kb3NQT0dMZ05FMzFwWDFodHhaTnZGUlRiSytScHJzdkFm?=
 =?utf-8?B?SEt3dzlGbUNtYm5ueTZ2Q05QYTg1NUtBOTlQdzY0Q0kxMjdqQVZHMjdsV3JT?=
 =?utf-8?B?dkJwYXFiOGFid0JEdVI0SnZudUZDMWNRSjFSelAyb3VGTEtZLzYvTG5ic3dY?=
 =?utf-8?B?TTM3VCtXanl2V3crZmltRTI1anphblUvUTQ3akZMbmpmWVlEWllodz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe5172-92bb-42ff-474e-08de5ce9758c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:44:50.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONP4SU9JUUg8s0AbE5HY9Kr1UmkQj3MhTka4FReK/AD7t8dkdKhPrfCZde5duI+f/bYUAtI+OUD1yCp+nCm5Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8526

On 1/26/26 11:11, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices:
>
> 1) SDMA2 transactions are set to user-mode in this particular case.
> 2) This type of script doesn't use the peripheral interface (connected
> directly to SPBA), but it uses the peripheral DMA interface, then the
> SDMA2-issued transactions are subjected to AIPSTZ5's security-related
> checks.
>
> So need to clear the Supervisor Protect bit of SPBA2, otherwise the sdma
> script can't work. As the imx-aipstz is a common driver for all aips bus,
> so set default value (zero) for all opacr registers.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



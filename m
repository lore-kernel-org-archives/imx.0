Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023122.outbound.protection.outlook.com [52.101.72.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE972D738A
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487534; cv=fail; b=RVpvTxDV/0QRD9vg2Vw+wPSt2hidbFBl1g10nKf8nNk+eQzkd8MnZuYcvm52qlA3Iaa7GuJY2qXDW45DV6bdeBzm78OXt+KPKp++3DxtrMfgkrzLgaPDXPetfO/fyO5GH7KERhwdNIpOGCf3H9pcAn0oS9ekjxFkXDbDJ4slHUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487534; c=relaxed/simple;
	bh=Egz6owPCHvilifVYzU6aCNpIgnYW2eKNz/H3wiy7s3Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T+lDJ5Qavg/8/Ls7kuYZwPw5NA2lxgJ7ykfxdg8jFSYQ//0gqb8mlUu9I7Lr9xq81xwL/hEyukFjC7ulNOAVr1nVwNHSlBEJ5HuQ1bsmFhSfbARoxMb9AYg9tRT+0Nqe2RbNbRBd0ivHb1bPZedbCVdg0NoZQKqe7mGTk/jnYlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=MRzGmZpc; arc=fail smtp.client-ip=52.101.72.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="MRzGmZpc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mfsc0HtCzO0qPxCkj0/GmHjYP+xLg3awxhrQ1L0gOBF2Eze0yEQ55i8+pJsh4JqxotA9VHwNFpqz/zLjjE58s/nkbhm2XipVDYp1MZ0ZCXVwDbsz5/5LB1cnJ3dS+jumdu+8czSWA7V8loh+FfKFAEalqYwyrXbnyCV5nhhkhbJp8bu8wvC2WqQW/cQNUEiqXJJ79V7ITz72ewrXV+/EqwGcd1KrFNMmU0BOzuj60ntOiZFentKbkt/XubbhOaVbFEyb8R0krNAnAAz19nBHUzmun2V8AiGQhissE2jVDN4yZ8fUtgigna7U6+wz6H4uiUEM/m9Kmht49l4N3Sm9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpvGpNloVhpY5v2/imUpk40mTvd2MoonDwQO1g9FPPQ=;
 b=KQz9K/GSUJFkCA0msn8KwpfCE4EdeSLiOA6PiyRYULWIsd7B+vKqn7o6NVKQ/rF6qWiZ8bKxMjMDF1Qjjc9OkiJ8kEuHEH8AZ/rgoANZVegovBnJRcGe6LQqbvywR+1Bgm4jI66teBmQWNvBv1sJUcDmAwi0D7cS0gNQVAK1YZCxOqZbagg1n3JJO5rwnQjWyOjI6nZAOMxHqUpLjX7Ewcaa0EcD1YsArQJCPSR3ojaVg77PhrXYPJ2ttd9oKNMAmJN62bT59WKkuVAG8yTjLsVfsUuIQpa2HhCCEDBuAkvCGR4TjrdYWOUYpuFXWLh0XVBwiiygeiOlTZfrPzY02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpvGpNloVhpY5v2/imUpk40mTvd2MoonDwQO1g9FPPQ=;
 b=MRzGmZpcrQX/fmBTdU67SanGIHdlJ/+6AIFVKlW2k0xlVIpGZTLkROMHMcPtk7yyBm+IBAWaXZbUto3Ph9W3n+Z9OZJEyrnA9D40IqW5nKJRcPtFkzA/IYoKfDEv3xdHEeqZhOuOSyD6tHH7WdsE+jUMe2W6T3TO8C8xCZhluIL/t6ErsuPNCCsJnByIIcNLkctGgmN9ezj2nXbKIutyO6S+tJpbiC+6qrngVLr0eE3XfEpgMY10sxqqbCKzUP0YZs4QfZGNCvaDHdqKT7E3phRnbcL84lrpf1Qa+vbHnUJ1VtekbaqnKw54Efhwa/amROtddMjX1mXl/gu6zOATbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DU4PR10MB8712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:568::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 07:52:07 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%5]) with mapi id 15.20.9611.012; Thu, 19 Feb 2026
 07:52:07 +0000
Message-ID: <1c86a997-4781-4816-9e90-35b15e2b0146@kontron.de>
Date: Thu, 19 Feb 2026 08:51:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp-kontron: Fix SD card supply on
 SMARC eval carrier
To: Frank Li <Frank.li@nxp.com>, Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-3-frieder@fris.de>
 <aZXv6QSq-ydOX5Wt@lizhi-Precision-Tower-5810>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aZXv6QSq-ydOX5Wt@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DU4PR10MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 95eb09d5-06a5-4a57-9eed-08de6f8bc764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUYzVWd5QjRHN2xpbmtJSXArQXkyeElRUEpSclY4blRYNm93MDNBSG5EZmlj?=
 =?utf-8?B?eGRsUE9oK2o4NWxyUHdKNHJQS3l5a0tWNlJJWEdOVVRkd0k1M3NkQkhnZjdM?=
 =?utf-8?B?ZWdsVHRSRkJsa0RBcmFLTlBOeFBsOGlSdzhlYmZIS3Z6SXhYU1ZUNnB3STNn?=
 =?utf-8?B?Sk13K2JrWkJCMlVtbDFIYjdLVnNuMU1vTStib0NaTnYraVJtL2MrRk5JdFZs?=
 =?utf-8?B?RDc2ek0xUjFyUVd3WVVKczFZRWlLK2ZOdHFVRTRiNU5nMFhnWUs0VWwwRG5Q?=
 =?utf-8?B?em1DdVJvNXcwWitBazdtT1lrTlgvL1BnUG4rdlVkTVoxd2xBdllsZXUwam02?=
 =?utf-8?B?WnRNclhkMlluWjduck5ma3QzY1FGNkh0REtKaWNYc08ycG8vc3VDSklLbDk4?=
 =?utf-8?B?UG10akFEd0RERWF3bElhQy9WMVFzYlFWR0lsOVAyc0ZnVmZqZGxucXdZbzhw?=
 =?utf-8?B?YndOa2kwNXM4UCt5UFd1M0h1S3VNR1FtQjB1OWs5aURGai85UGZRaWZ3amRv?=
 =?utf-8?B?eGpmTjFmeEhEcGlVdFhhRk0rU1pGM2N6S0lGOUQ0VkZTMjJRNGVkcEYzR2M3?=
 =?utf-8?B?c3R1U1hWRmU0Q2doTUkzY2dDWExScElPWEZOczRzNGtrdDkyYmI0ZE4yNGlP?=
 =?utf-8?B?REhCZFE1MXZaK0V2NnREREhJckVQNTkyZ2dCZGtCdHptMVlEbFhYQXZwUXA2?=
 =?utf-8?B?eTg4SDJJbWUyZzJlMlJQY0xhQ2dubkpNczliWDRHUnAwcm9zYktKQUg0eXk3?=
 =?utf-8?B?dWVtaEljbCs5SkV1NzJETytnMkRSMkRqMWxDTE1UQTRUMnVEZTYwSDZDL25k?=
 =?utf-8?B?TUFYTHdNcGVQMjVOMDBRdTdhMDdEc1ZGSlpCRjlDRXdZVG1GZHNtYXVVYW5K?=
 =?utf-8?B?cUd3dFRpeE5Kdit3Vmc1TCtvTDBSd0RtdVpQS1hOQXUzbWoxRG90cFNla2hX?=
 =?utf-8?B?OUpRWGNvN1J6b0Q1M0NYSlJiYkZKeW5wS2hML21WOXdGNllQbmlkZVZyU3Va?=
 =?utf-8?B?QVhTQnFDbmYzekR5Ly8zK3VIWnAxS016dUtJUGNZNWxUN2hFbjlyRHVKZWZ6?=
 =?utf-8?B?VUZEUGowdksxb092YmRVWm5FVlBoSXBsbGF1RUlDcEN6U1NIam1sVjRaMEZo?=
 =?utf-8?B?QmtpNHN0a3puQVQyQ1lXWXVvRWxwNlVoSVM4Q1lld3ptVk1RWExTa2J3NXJS?=
 =?utf-8?B?d09VWWhkcUNYb0dNWlhpaE5CY1JINW5PMU5VYzhVNmhaM1ZzakFEam9sTEhV?=
 =?utf-8?B?OUVPbjg4aHFzRFhBRXFTcVFDMDhHRnJENU1qb1NNRDVTblNaUWgyMnFoTS9H?=
 =?utf-8?B?VkRqVWVUMWlJeGlCajdtQWhrT2xRZ3g2aW1NNDdHUXd6MmlXaEtvRzh3dStp?=
 =?utf-8?B?NWNPYkVKS1dVa0JPK1Q0UWc1b1A2bTE1RXVzZWtKbFduS0tKeGRHVFJNeWg5?=
 =?utf-8?B?SThtczQzemkzSnBJb0VZSjdycGxFMjkyMVdtQXBDRmVzdlFCMlE4R3VPMlIy?=
 =?utf-8?B?VUg3ZnFXdFBjaVcrQ1ZwbDJkUS9sT1c3ZURudm9QRnN3ajY4ZzVBemVwak1o?=
 =?utf-8?B?eFhrM2NvZlp5bm83ZVFadkZ1ZFl4ZWZxWEc5dG9JbE5RMkRoeHduY1cycEhL?=
 =?utf-8?B?Y3EzRG9Pd0tJZnhmUE5oRC9BelN3R2RZTVJJNmZkRTR2eTF5WlcxR1dxelJK?=
 =?utf-8?B?RmxlNHhITC9aRHAxNlVUL0dYbVlYdFBQTDFlYi91SGVSbDN0UXFjSVVTNkJ2?=
 =?utf-8?B?WEVmV2dJRHdoRHZDOXdVUEk0dlZ0YnZld0Y3Y2JkUnI2MEwySVEwY1lWWWc1?=
 =?utf-8?B?UmRVSzNFYUZvQXFCYVRiRWZ6VkNZVm5CbHlSMWcremVBL1dCWUdVd1lqbVcz?=
 =?utf-8?B?VUY3ditEcDBXVFF5SkpEVTlLekRPWUtSVmVMQTdEMmE0bUcvZzVhbFZabTF5?=
 =?utf-8?B?N2dodFdsQ1ZCYXVqcTJWUmdqL1ZhU0c3a0J4RzVVTXIxeW9SQ2I2cndEb2tN?=
 =?utf-8?B?R2NmczlRK21EY3o5TGRKWVhPUUc0YjRZNk5FclRUUHdLMi9MeW5NZUtpcVRm?=
 =?utf-8?B?UE5jK0diYVVkTjZBRkFSWWxSclpaYzhWcGRMWXdWNTdkSjY5bWUrWFk1eEJs?=
 =?utf-8?Q?zCkI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk5FSWQ2eUJ5azdBL0N3TEFIVnRIc1VwLy9kVkIyYmFScmppd3dQUXB0SEQ2?=
 =?utf-8?B?VDVZeGRobDJaYXZad1dJOTRIV0h5N2lTd0Z3NDVKQ2tzU0lEZDg5SS9pVVNB?=
 =?utf-8?B?SXErOGZHdGtMYWhwUUhHYkgxMWdjblRWVXZ5MzkyRG12UWF5aFMwenNtZmU2?=
 =?utf-8?B?VjRoa2dpSmJuODRnMXJVWDZhdndVNlI5MlMvUHh1a2xjOVc5aGtHajlWenVF?=
 =?utf-8?B?NHREWjNuREVTbFVObExrdkJreGpFMklxc0w0aDBQVFNYZ3ZkQU5xeGl4MmRk?=
 =?utf-8?B?YmFKd1FQREI0WERYSURuSmJtdDcxTFlqUDd5ajNpcmtadThWU2RBQ3pFT3lI?=
 =?utf-8?B?S0JHMy8zTTZ2dnhIazM4VWd6S1hocHByQTVkc1dicDF0dThVYjlyNGsrRS9o?=
 =?utf-8?B?dTY1cEVFSmNmVTMrMGtDVHlJV21hVFhzakRwd1pneHRhOGE1SEE4Zkx6Y1Nk?=
 =?utf-8?B?RnpXQlozSys3VjBnSmRlTkx1SjRqRzFhTDFsYzhJV3hleWRraXVhelNZZnBh?=
 =?utf-8?B?Z3Rwd3V3cUxVbDl6alA1eHRhdGs3Ymlna25oYW5FNWhLMTZ6L3prL3NtZkxC?=
 =?utf-8?B?ZDhTSmJKZXlORm0yNVVTc0V5a0ZKbU9UelZ2bStJMEs0UUswMlhNVUpPTmYx?=
 =?utf-8?B?YjBveld2dzEzWi8vR1N1S2Z5SUZSMW91UUFUbmo2KytTYTZvTmN2Q1hNN0Qx?=
 =?utf-8?B?aSt0SEFLZXF1dVRCNE94cXFvamxDWjc5UFRhQ01teWhJcjVyQ3hEZU52T1R4?=
 =?utf-8?B?ek1xSWNjRzVWWkU0Q21mSHc5M2U4N2t3T1hSR1I1WGIrQlp3QktDdUVTVUFn?=
 =?utf-8?B?ZFZ5MEtUWTRGbTZ2TGUrVGNvOWp0eGVWUENob3lrNXBLWE5razJLbzlQOWg1?=
 =?utf-8?B?OC96RUt6cXJ5eHM3SzRqTXpBV1VkdFdLUWp0b1l1L0IyM1J3MFBieDFpeGd2?=
 =?utf-8?B?NjczM3hDR25iQkprdWw0YzE2Snh3TkxmN01FK2hna1pXU1JZcGxYSzdPVVFz?=
 =?utf-8?B?OFFSYTNQV3NRZzJOVmt2V0IyTnVxT2J5aEJ4eEdmei84MFlCWXJuWWV4aHdN?=
 =?utf-8?B?aGpBaWYwZHJIYWZvNUwyenB3VDQvd2EvdjF0MzZLOE83NTlpVXByWm9BbWYv?=
 =?utf-8?B?R1FsL00rS2M2MmV2ZE04WE1pcUNkbTRhSWFTNUlzcFFEWDEvenRwUVdHYUY2?=
 =?utf-8?B?dzFaNTUzYkdTdVVmcWpEOWFSazNsR0dhbHZmdFdMVmZrajNRRjVTdzMvRmIx?=
 =?utf-8?B?dWZDa2Z3VEZzZVpJVVZWMlRGRHBlOVd3NUlqYWc3YnF2SmZDUnNKak9KbmI3?=
 =?utf-8?B?RkFkQ0hiVmNaMEM5MTdZYk0yT3ZuOUlWcWQ0cXZMaSthdjc4QmlwdjNyV2Rp?=
 =?utf-8?B?QlZNZW9HZ3lrdUtuTDJWNlZhSUlRMU5KSit3dXhNUGlGT0c0dGlzcGNUWEVJ?=
 =?utf-8?B?azhwZzREMm4vcGRSSWhxdDNaRFcwaXcxcU1KOGxhZDRGOVBUV0xVbnQ3Y0tl?=
 =?utf-8?B?Z3dTdkh1VlZrV1dsV20wd09EdWY1amdtWUZxT2RQVFl4eWxJR0lUbkZBdFZn?=
 =?utf-8?B?T0p1b1o1eXlJeDlnMUpuQkJBUG9WeUFSWG4xa0loZVAvY2NsUUd1VENubVdp?=
 =?utf-8?B?WE53WXpHbkMyanJheXpYVHQ4OEhkUWdHbTAzNUVTcmxOUG94aGVzaHRJOGox?=
 =?utf-8?B?a0lEcTRjL0dJUmNkMjUrVTZnMGM5UVhvVVV3azk4cy94eG0ySUQxUTQ3QTJW?=
 =?utf-8?B?TDFyZGlHOU0rZzhnbzgxU05GbDgvWDRqekxLQzdvaW9aYmxRSUlVUEJNRm56?=
 =?utf-8?B?UDJQeTlnekxlY1lPVWg2NG1aOUhWS3Q2SkcwbWdYSDBWRFpZenZwb01pUVRF?=
 =?utf-8?B?eUl3RFZhdHlZd3cyVmpTRDNVTEliaGVNY0pZS1FiNDdHWXV4dlJEQzlmZllp?=
 =?utf-8?B?ZlVsTVZ1RWxlSUZYT1NVeklkWmNxWi9ia0VhNXpoeE5VMHo3T2o5OVpnMDhE?=
 =?utf-8?B?VDkzZWhwYjhJQnlDdjd0Smd5RTZJRUptamxnK0ZodVNJcjkyTjV3REhwQXVY?=
 =?utf-8?B?bjlrSDlhQ2h1VHhGVjFiL0t6YUpRNHZRMTluSEdaRXl6UUJyOXFCdjN4NmYz?=
 =?utf-8?B?SHlNVWxQSE1XTXpWNjFRTmprTWZWZ0RxN0VLSUt2VVVwMk1SZ1lQYm5mNFRu?=
 =?utf-8?B?SE1NYlE1Z1VvNUpVdVlnaFpuNzlvNFZqcUd3eUN2WEJONm5YRHE0eGlMNUR0?=
 =?utf-8?B?NEVUNWtBc0t1RFNLRHZxSngvNGU0OEJDc1BtY3hDQ0gvNzE5RG1Fc09hUlV4?=
 =?utf-8?B?M05TTHp3U0hOZjdjMWpoeWVjaW5oTWhTc2hvSVJNajVIMVlJOWllZ0xiVnRa?=
 =?utf-8?Q?aVtkazO5/MwRGWKo=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 95eb09d5-06a5-4a57-9eed-08de6f8bc764
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:52:07.1013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49C+sX6n3Ad+JBK4J66+xxMCkWjyXehIkstXdQMLcmyN7bri4CPpG3xbQQQXRsa06nAWhgcSObur7HzqJWCRecditnxxY75S4tfxIfExsxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8712

Hi Frank,

On 18.02.26 17:59, Frank Li wrote:
> On Wed, Feb 18, 2026 at 02:25:06PM +0100, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> The SMARC eval carrier has a power switch for the SD card compliant
>> to the OSM standard definition. To use this as already specified in
>> the OSM base devicetree, stop overriding it in the board tree.
>>
>> This fixes the power-supply for the SC card.
> 
> Is below commit better?

Do you mean "commit message"?

Did you run my message through a LLM to enhance it and now feed it back
to me?

If yes, it is a very strange way to waste GPU cycles and developer time.

> 
> ARM: dts: imx8mp-sm2s-imx8mp: Drop SD power-supply override

The subject line is completely wrong.

> 
> The SMARC evaluation carrier provides an SD card power switch that complies
> with the OSM standard definition. The OSM base device tree already
> describes this correctly.
> 
> Stop overriding the SD power-supply in the board device tree and rely on
> the definition from the OSM base DTS instead to fix the power-supply
> configuration for the SD card.

Ok, maybe this rephrasing is slightly better to read, but again: is this
really worth the efforts? And it doesn't even correct my mistake of
using either 'vmmc-supply' to refer to the property or "power supply"
without a dash.

Thanks
Frieder

> 
>>
>> Fixes: 6fe1ced5ccab7 ("arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier")
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  .../boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts     | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
>> index 2173a36ff6917..74d620dd06b7b 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
>> @@ -249,6 +249,5 @@ &usb3_phy1 {
>>  };
>>
>>  &usdhc2 {
>> -	vmmc-supply = <&reg_vdd_3v3>;
>>  	status = "okay";
>>  };
>> --
>> 2.52.0
>>


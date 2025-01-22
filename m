Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473001B6D1B
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737536166; cv=fail; b=pSXQWgAwTTUG5h2I9+mc1KbIeOLDA6jRYcn9d8V7W3qzIQmNuA96e/lbzcEAudWhCs0EMO7TXlluQWp+yXkzoT7ZRiNqRlWVQZFy7gl9K51udJF4uHfnNhHqBQA9x8HL5G+dYi4o+vATFrMvuHmjeNCiNd7uvP0Q8y78IKnteI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737536166; c=relaxed/simple;
	bh=2Nsj8x65WNd32no/GRsYPIrQiF93evfz4OXvuc1ZP/4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UkIajsb68Tx2bK/DQbBltq9WLSR3a+58FVMNWKKhQCp1WFJf8PjggmuQoVbawzziOACivFELy8P7EBLzI2+RT+xkagJKf4H9KhRiWdJg4MywljtNVggqZ2hpnfoDaPNntibcKbZwzsIr1xnw07vz62huh8T/8F7sayV/r2qR7V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d33ZXZZR; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d33ZXZZR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpSf4dEnRhyF/Ug3A/7YjhFRVJpQ8GcMpYK7V3zCtb0rGZLTn24Itm42pXO3dgO9oR6MYivnf9h2kqjD5Qa4A6rJVS9AYliKjLAVWZK68+MyRZpKWnSoQYybK9drzqquUEVbbr5z8jnDDhnnaDMZKvKzRYsifyHst7DVRiloNfcUX3yXzwAMR5X987X4tV569QgcyYspLJctsm8mlNnpSBWHMVBIyCddJ89X+VS8d0oy0a+/8AcBzr4Zf2Fi5aOWDmJ3kYrML2TWIKvCzzGNPYZ+6TGSni4pDXfXtlCJN5+rz1IaoiKZnJpZEc/JMkm8QELvoX4PfnX+fwq6uxq+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXFRcxZteu2ffOA8Jcz4MOr4xX6x88mxv//ZQ9dVi9g=;
 b=we9sVAHJOO1Z3nYeR0qQ8jrm+RM/Id3wSQE0NzFV5l7IMVQrJmCHxrDdk+JSGs+/auy/bT7c1B9wf47AhDkhSht5eAETmIAoKOsnrrf63rbW3JPjBy3WJdMZZl4/4/ueclL75hTfIyWYB4GbRz+lGy+ff3Jro8P6+6eBUuJbN6xHe8K3Xt+b1WK92K7RZ9mHl4qX5I8IMyQyrSBE6tqjc3lvvCkp+vgpcpnjyMJdvjj0cW+sJ9qC/zu6h+EKno6nFmXZv464I43hCdyaibTxymx3D4eIq2CNe3ADXB3kHc9AJ+yxROHYUAy/auDk7RE8y04k5+xu57I25cajm/XzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXFRcxZteu2ffOA8Jcz4MOr4xX6x88mxv//ZQ9dVi9g=;
 b=d33ZXZZR+auFnzr0ftbvmbs85b6aEZJsGqEQzZyz4W3KwjsHjMkKzepdre1V2CuEdNuAtPoc+xfvDb58KvmrBYj3+DEQU2S9sZIbS/Su6gofqIQbVyjbbtuHvP/GYFCAK0Jwp2GduwrORSN4ou3Cq4zA5lOzPV50TJ67+6BSLf3z9j6GhWxV1X9rVyAA54B7IivnzGjzu1pgIosAiQaf2jknRYr1EZ0zT0s6aT5A6F3bzhraJHiMP/no7Ik0tjNJoIXJnilwfq1R632Mny5sCELS/VIJhnsxzNFJOLwqSsg6I5KRNDQOXHlY7nHkeBVfLSD7Zn8mR7gkQ5f62HViDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 08:56:00 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:56:00 +0000
Message-ID: <7dcba651-a7a9-4367-93e6-2c18a39b7c19@nxp.com>
Date: Wed, 22 Jan 2025 10:55:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: imx8m: add SAI2,5,6,7
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Cc: laurentiu.mihalcea@nxp.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, imx@lists.linux.dev,
 Alexander Boehm <aboehm@eurofunk.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
References: <20250122082928.1321536-1-daniel.baluta@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20250122082928.1321536-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::12) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|VI2PR04MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0d7f15-a072-46cc-c6fc-08dd3ac297a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXQ4M1l5Sk9Ea2xZWnZqaUtEbDNtOGR0N2czNlFtb3ErQjJjYml0MnN3UkRx?=
 =?utf-8?B?TmhRZmdtazQvQk9TVi9sbE5yWldGMVZSZ1pPU25rM3V6R3RlTzdwNDlaNW5p?=
 =?utf-8?B?TTRWdUxRSUlJZllRcWFEdU9xcmx5RGRVbjhJZVlKanJ6cnNNOWdVVzhCYmps?=
 =?utf-8?B?ZDdjWWF0QkNES3FrVWkyRFFIT0NySnBCVUtxUE1Fc2Fyc0s4bFFqVGVaVmlr?=
 =?utf-8?B?TG9SdDBpSldPSzZFNm51a1UySnJneUN1WmZLb255bUt3aU9vM0xieUpiVk9K?=
 =?utf-8?B?RUtXUkhZSnRsWEtGTm5FN3QwZFJKL0NnNzZsVHI1cWpaUXhDTnJrQkU2M0hR?=
 =?utf-8?B?bmRGa3ZmWjB0RlRQNkQwbkIrb3J4MlIzbnplaWppSGFzemhLYzJ5M3FpWHlY?=
 =?utf-8?B?ZHRRN3kzU1JRTG16aVRmNnlqZDRuTWY1bkh0a2E2K0ZDcUN6MFJ2aFJNN2gr?=
 =?utf-8?B?bmNvMG1DV2tVSUlscmp0Q2c4dXJNL2pYbmkzcGl4ZzZDY3lBcEt2TUpIZDF5?=
 =?utf-8?B?N0JHWk5aTDQ4L0JxVElNNkt5VkVHQmE3dzN2TjJtZ3FSL3NmM2VMWFZKRm5M?=
 =?utf-8?B?YmQya1B2bW5MQVI0YVJ4VUZvNTB5bVUyQVJVNGtTZGVDT2VNZWMzNHR0SGJl?=
 =?utf-8?B?V2ZZUHZMR3pRcVc3dytvRzE4VG5PRkx2YnlBYTJySVNFZkpNVnk2M0NxNElv?=
 =?utf-8?B?RDcrNXFsRmxUVDhzR3paaEhDRzRldFNqTW1oTHF0TG5TaklYc0VPMFU0d0pa?=
 =?utf-8?B?ZG1xMVFYaWVaamlCc2phM2cxY2xteHFYOWM0RXRnRjdLSld1WmxtRUF2OEpk?=
 =?utf-8?B?Q0s1UlIyaDNTbGJWWUM0YXdIQ3gxM3oyazBhNTRQbXY2cllvVEhCTUV6eVNt?=
 =?utf-8?B?OVFCK0VPaDZjRU5mSnUweXhoQ3AxS1BNbDlSSWMxZFRxdkM4aFR6UXgzSzU3?=
 =?utf-8?B?Q0tyanRPR2VsSlNMdDVzWG9HQXdERERHck9nRE5LU0xsTC9kRFpReW9nRkxr?=
 =?utf-8?B?YWsxRTRtY3lLNW5GcTkxUDFlV01VRlkxVEtZaWJ5T2Nvb2lhV0F2V3RaTllO?=
 =?utf-8?B?LzJ6NlFvSUZDYTRNU01MdDR3QTQxMjJ2MHdtZVVzeC9XdzFyNjA1V0Y4QTJu?=
 =?utf-8?B?TDFlQ052ei9KKzZmV2FCZmJPOE5lZTdrL3h2NXdTVDFmU0hRMFpMTWRSYnYv?=
 =?utf-8?B?NjN6eHJmd3ZWREp0cGd6ZFhzTWkrZnU3Q2ZjdkpPRnh1eldKU0htUU9QRlRr?=
 =?utf-8?B?ZnNCMjVJSE92QkhiUERNU0dkbTNlakxTMjU3NVM5YXNscmlkdkRINjQ2K0wx?=
 =?utf-8?B?NTU0Z1JaY2EyYVN3QS9BaHltS1A0aG5EdGw1bVB4dm9QdkRjdTh0bk40OElv?=
 =?utf-8?B?elNIcmUreDA2RXE0MndPZlZRWEVXK3pRSVlXUzkzWHRaNUNTdTFNUldpeXVm?=
 =?utf-8?B?WkJDY0hqV2tOVkdJVkxabHNqRGs4L1Y0SE1LblhITDVVZFZBVzREcWJzd2E5?=
 =?utf-8?B?NmVndE53M29pMDZVMC9FVkg4WkFKZTRJTEU3bHA4ejR3R3l2YWcxYldhMFcw?=
 =?utf-8?B?bFZTTDFHdDlldGJMR0ZHcFhBV3VsNm9mL0RUNjJGUGI0SVNhREQrM3lpQ1dR?=
 =?utf-8?B?OGRNSnFJR0lLM3JreFhLNmdBRFRaZzhkUjRTZlJQY0tkc0NzWmZjUFF3SFJa?=
 =?utf-8?B?STIzMUR6ZklOcS9TdVVoUUlrQitPNVhkb2gyOTR0QjFHOGJKN0d0RkJhRDlR?=
 =?utf-8?B?Qk5jL2p5M0ZYR2NkUEd2dHdqa05kb0RacTQ4OWROeEtHRUtzQXJmeWQzYjlB?=
 =?utf-8?B?cXhnekorSVc5S0hEeTlGWjJDa1htT1NaeVRqWHBkZ1puY3F1OGFNcVFFME5S?=
 =?utf-8?Q?OugyelPsmssHs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3JZcGg3QXo2Z1c1SUhYMS9xK25qK2dWblFVdm9KeUNvQ2V1YWlqWDJnL2J1?=
 =?utf-8?B?ZHhuc1VvUzM5cUZBTTdjempDNjlzYXA4cmt5VEtFbXRkMXpsaVhMYVlRUmNq?=
 =?utf-8?B?WXNneGNTS1d0dldyRGJzTlA5cHJXTzU0UVo3WFlNTEROMGJlOHp3Mi9OM0VP?=
 =?utf-8?B?cERaMVJZVmtRSng4QWs5b002QzVVNUJuOWh2enh3U0pQY0RpcXJLQVFLMVNY?=
 =?utf-8?B?NWV2czhxUEdXNk1UdzRIOFhydVdQZUNDTGwxUm1qNmNjNk90M1oySEwxUnpq?=
 =?utf-8?B?a0kvMklyVTRiRG5nODZQWkhFUSt2RDBFd3hWaERFTXNEMDlxV3MvNVFCbFBH?=
 =?utf-8?B?YWFKRGMvS3I3NmZsN3NjUXh4Q0VEMGgvY3ZWUjdsZ1BZbE1iSXZkYkMxZjJF?=
 =?utf-8?B?NDNtOGhERHRXSkVuSXhIekdwUmc2S0RaZkIzbkQybS93Q0lNRnNKM0xOZllo?=
 =?utf-8?B?Zk9ScWdRRVpudm9VU2ZnQ1hydmlqRXhTYXZrMnVyYlN6Q1FZaTVZY0oyMmhH?=
 =?utf-8?B?c00xMDgvQXo0blV0Q1paYWJQbldvNkVVd0pqeC9zWnRLdVRHNWJibnpZaUcr?=
 =?utf-8?B?U0tzcW16YzZSMm5maVI4elc5MmxBTFJiYzI4eTVXRVpNMjVSN1lkYis1VmNI?=
 =?utf-8?B?SjVhNzVVK3FuR2FSc2JKb1o5STE0S3dZYS9RK3ViOU5jcHJiMHllblBUQkFX?=
 =?utf-8?B?dU9wdjlPVXB3MkVBVWxLQWtkOEJHTk8yRWVpZnNsd01XRVJQbDk0dzUzdzJ2?=
 =?utf-8?B?VjFxSllGdzIrRFhsbVdrMEMxNzhaYi9pNENQd2o0YXRxYml3RWtFM2JjQ29L?=
 =?utf-8?B?Qi85SzZVRTdjbFVkeFBNMGdyaVZ4MTRyMWVLU3ovRVNMMzBxN0EyZDQxQ1Ev?=
 =?utf-8?B?Vy81ZTkxNEZkY29VdkhzMGx4M2VPdW5PSms3VlBIcjBMdlBYMERjOFRCSFE5?=
 =?utf-8?B?Wmh4TzlpRUxDVVF1NGhNaTlDUnIxek5objgxTGhORTlrSkoxUndLVjNSNHBT?=
 =?utf-8?B?TkJIL1VKSzhrSDJiSmgwenpvckQwVG9wL0tCaUtBcUxwUm45YmVLUXVOYS9J?=
 =?utf-8?B?VUxENWlpWDM5cTF0L2JHQ2gzc2Q4VnJ3amdzNFE1cUdZaEZMcUxaUTNlUnV0?=
 =?utf-8?B?SlU4R1dyc0d6NklBNEhlUVlKVHJPUzhNY241VDJsNU8xbHhyMGNCRDVWT2ZH?=
 =?utf-8?B?YysxMk1ITkdxYmlHYUkvcldGTkEwSzZJdUM0c3lkY3ZHUFJZSGVSOHBINTVs?=
 =?utf-8?B?Z2RjUTl6NS94QVRZd01PNnNMV2V4K1h2eFhKRGlDTlFGTUY1ajgwQXJwQXRs?=
 =?utf-8?B?a2NFM2c2TUd3NHR5Rm5NZGltdU1xU1ZYMEFWVkdaME15ZXJENEUrZG5pb2lr?=
 =?utf-8?B?czBSdUZORmhIQTZ4OGJGcjdqbkZ6RnJqOUZ4ZVZ4WktiMm0zL0V2dUw2MW1U?=
 =?utf-8?B?NW1hbmJPMHJSSitIOS92ME0zaXRaUjk1WWxJdTJJdlBianVlVm80VjdMbzhy?=
 =?utf-8?B?WTVPZWZxWnJmYnFkZ3IyS0Mycm5Fb0N3am15OGtsRUFRNVZVSGJ2S2QxM2RK?=
 =?utf-8?B?Tjh0a1NOK2xaaHVWMkM5cDJWb1NLRnpUUXFLOFhsdGNGbEV0eG1zWTVNWG80?=
 =?utf-8?B?REc3bjFPZGxaUWd5WSttanVnRW1MRDRXL2UraWdNNk9zU1ZVdEJyUzdDZ0JK?=
 =?utf-8?B?aDF0SGVKNHNPRC9ncEt5cVFWVEpEMkpjb1AraVRDaDRHL0hiTmJUbHVKUnJt?=
 =?utf-8?B?VnZudUczS0x6dVNWWERVaDk2c3c1RkpkR0l6dDQ3TjQvTU4yR0FVWU1tcGVx?=
 =?utf-8?B?azhJQkxJcndXU1pheHRYZG5CT1lpQ2FpOCtFL2c3eWhlNWhjRlNjR3BXa3Ix?=
 =?utf-8?B?S1lpQ0I4dUFEc2IvWTQzekh0ekova3NtTlpsUzdFTlZmbWFMWUR1WlRTODJp?=
 =?utf-8?B?eFdhMjV1aW5QNDM2OTFCZUxNSjZWZ042TzNMb0cyQnBWZ2VPTDExV21ZRS91?=
 =?utf-8?B?Mkswc3h1cnhtaGk1cWZVN2xCSmxXd0lKcTNkaS9pRk5ZL01jWk10VEkyaGFk?=
 =?utf-8?B?Q2RxdWNxTU9iWDRWdzRFcDgwWWxscmRVaGlhT0NSVmZqWFRBdUhTcE9IMG5Z?=
 =?utf-8?Q?gV1ls9Z7u0dbAhzt0/SYC8C/T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0d7f15-a072-46cc-c6fc-08dd3ac297a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:56:00.1116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSOEWAzok0T01/NwbtJteuRfThqcmHCf51J+A+HHSAWLM48aVWcBx4wwLQB4OH9gwnneABQ35G/NAhJrIf68TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977

On 1/22/2025 10:29 AM, Daniel Baluta wrote:
> From: Alexander Boehm <aboehm@eurofunk.com>
>
> Added the remaining SAIs in addition to SAI1 and SAI3. There is no SAI4.
>
> Signed-off-by: Alexander Boehm <aboehm@eurofunk.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

> ---
> Changes since v1:
> 	- add my S-o-B since I'm picking this patch from
> 	  thesofproject/topic/sof-dev tree.
>
>   sound/soc/sof/imx/imx8m.c | 44 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>
> diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
> index ff42743efa79..4ab5814e9117 100644
> --- a/sound/soc/sof/imx/imx8m.c
> +++ b/sound/soc/sof/imx/imx8m.c
> @@ -294,6 +294,17 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
>   		.channels_max = 32,
>   	},
>   },
> +{
> +	.name = "sai2",
> +	.playback = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +},
>   {
>   	.name = "sai3",
>   	.playback = {
> @@ -305,6 +316,39 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
>   		.channels_max = 32,
>   	},
>   },
> +{
> +	.name = "sai5",
> +	.playback = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +},
> +{
> +	.name = "sai6",
> +	.playback = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +},
> +{
> +	.name = "sai7",
> +	.playback = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 32,
> +	},
> +},
>   {
>   	.name = "micfil",
>   	.capture = {

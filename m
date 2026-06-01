Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD2F34C124
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 21:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780348857; cv=fail; b=jTFmLsI2jxpWlw+zG/qnK6TeezFUk9UdWJ5kth1/QRmOmFySGeFjmwPFiDQRv71pwdVJ0QEbGbFluw5FR8ikxLnXJ8fAMlmi+0sejHHrTi+pbaTreoMuQ+QeZ+0TUjiihCmT5w10w4MDSy6P1y/tFPdjXdAWpR0Y8xHZtmUQGTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780348857; c=relaxed/simple;
	bh=G7HLr6/q+i2ejhUOsG/p4ec/wnaw5jDtc5B6lCkfXgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iG+yQqsH3zNUgQhF81KzxfNDIGt1Xc+3NRgArQg3uR3O7X7krSPPcsB3bEXwtAoH6TTj4LPKboTc7R6k5tQzt7RSuzNkJRRgAtk2EbQFdBfy60Klj5AlvKhZtxOz797CcLlBQhkXIfotWSvYV8t0oD9D+IhB6gwfr9sMTgk3L3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bG42IV+a; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bG42IV+a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIMWWZM9UpgZJ80GcO40S4XgQnKzUfLBdRozVyORxm3ap8ka05olhMskQb295t5YqhyF8Ps8KBPynVE4frdusuq/90DN8ctor2iMUtQsYStJ4m5mYzCqx8XXm8ZuF0t1PDgthhukUSY5uhlajjOjmpaCyVN4uNWiziaP591h3AOFjWNYV4v4oVD40vRLqkjhTec5iS7AONs9K6A4LMAPqAED0U9oqeDcvIKf2+G193p9SiCp8vX8/wJI8WqaDhKbeC9+pHkdHpzHDKONTRQCCMkbeVGNB9dxhgB4KbQ0+MNcEYwF1klakTu81BFrzUsgDBHiaV3o+tXMdTNmjorGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMsEZTy970gJIYXwPbVzJM7L1UHzDjH+g6pOuqUbm30=;
 b=ZBdgm4xo9CFVdDCQg6LztLYMPlqjGGMOBFlhtyeVp0a3G0fex+w/40peAkvUnwdX9TwIsuV7zm7yu31uSN4Rcecb1DV0yb9luAHXKX0VleqKbVydcquBPTfqeggwhv9OP8A88TgYuWeJcwVcG4rxJjW3PzsEe0vIXVThcp5N2sWBMNC3bu9qlS3kOeR9Xfih2esAX+ul+Cjnt96uLCOnoMAWjYF+M9VCagGxSs4m3VdFh4MJAM+/BVUSjjifQ85b3siQ661swp3ZLp3dBDnwM1vyof5mjYC65NL3ympL86ASQZhhjYtGujkAwh6vqT1+Z2sdClXMa2zJMoXlFkJ26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMsEZTy970gJIYXwPbVzJM7L1UHzDjH+g6pOuqUbm30=;
 b=bG42IV+auCV7OhHuXPLz/OE4d5GcV9G1gPI7v7saYaIfGhysdLpcl04HTtigjqQn8eDB3Z+g+Yxyw4TAIHReOoPknMQGZrazCQnjrRRG3Mgibv4/abRqD0Auq3QmhhtwyzKkIzKCi7esh1KETo+B5EAHUMNhNjt9EvkWP6mCHoS9CjxSDeT21DUIuLX9xYngRjBD11vrVLi8vIgslI2TGvV7FyiiSsZAqzY9vm/XsZuotEJaG2E7gA3Ppqah/Qs1WI/zBTqTKmLW6JLAcjx4wQT7rr4GVM3lieBf/gFgcsXVaUQ/UGs7WwltwdAkAs5r/Ycr6pCyI23X90vYxPdzww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11043.eurprd04.prod.outlook.com (2603:10a6:150:21c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 21:20:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 21:20:54 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	frank.li@nxp.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next] firmware: imx: Add missing return in error path to prevent use-after-free.
Date: Mon,  1 Jun 2026 17:20:46 -0400
Message-ID: <178034884303.626604.3292111398618136020.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528091446.3331006-1-pankaj.gupta@nxp.com>
References: <20260528091446.3331006-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11043:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7b705e-5649-480e-f03a-08dec023a9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	YRIF1EoPccAypkQogjOMfmXI0WHVJklfbO0aeS62XaHDVuSH0KyE/XdF4d+J2IeVNG7V4SEFCIpGASvyVVnr121IO2QP84p/7dqCDMjmK8uxnm8609okDWQPp94bcfVy6rbagHvizGOnze3AyQZMHyw3tTe6YmRFegOFetS97ztgkaVRMfGicrvB9S769JagXJ8Z84NLWLpc77+TEJ/5UI1UeuU7ywHg147rp3zcBTqniWHyA5aGU5RiBT1xnAYFtZI4Ouhbge2LYCEq2DEjqAucQ2tfxXCejBk5mDL2yrixX9W1VF6/jr6uBWoRcpZY/UDE1FHhFNO3E3iSaxdqFBBNYH8JpUe13otuxisbY8nQcj7pZemg2mVtHgYsjSB50v3HAz/jj2JKgWjWRIM5Z0qlUs43E/n9mzsPMI4uqS7Ml3GVrzXAkauVMgLcnUMBaZT802gajdrACXScRN7rPoBO3wTKxZ8e9+3XjJDWONLU0aoDXPsBPz9qVegXK9h+jdLl6Hwzf2OtPEEHIQKzfjUfZZYYKGGt59JkJIh3T9VZgAOg6F0q07L751UUiQLDAPgYxanUDujhhH6fILwnQJzuye3p28VtoaYm3tKfhcFW+5u9qEMuZCpQ7vR/XolfB2OxdiXSTJICc7JnUzqDgEGmls4cADUNXGdALKRzIEwJcxdMiaOEv9ZQ+tg4eXrO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVZhN1h3MGlTUFNwcHFCSzBnZFVSd3RHWWxpZUErMHRMenhSVmdwdjl4Rk9a?=
 =?utf-8?B?Z3JGMDhUTkdhZk1uTFNLclJ1ZzJoNXFvWXRuczh6enQrWXVxRjVML3NoTTUy?=
 =?utf-8?B?U2VqU3R1MjVuVWJ3NlR0K1JKVjkwM2Y4ODBzNzdGU2VGeFlyaVZjVWowMHpO?=
 =?utf-8?B?MHMreVE0NVFGNE43cCtydzVGTGpZUTBQak5RM2dDRFJsbW9zcnRCVE1TcHpj?=
 =?utf-8?B?bThzeFZNZUlBS0lRYXRMRmdyRWR4Mk4yek1yS3ZHK1V5RWxOclRIZ0o1azdV?=
 =?utf-8?B?M3ZkU09YSEl0SVcxNldLc3U0NzR3RTZ5VTY5Q3pnd01GTitPdjk1V2I3eXpK?=
 =?utf-8?B?SmNtK0FscDBaajRVbCtNWmlvWjBWTnJtNFBodktSeGc2SVZQOXFwUGJnWE1O?=
 =?utf-8?B?cU1Qa1lBS01QcmdmKzl2SjlZaUcza1h3K2FPZnhVbGNEa3hoWmhlMmhnMTR0?=
 =?utf-8?B?aTNOWVVJbmlUc25oYnE0VElWbHZ4UXN0VmRDOXBTYkVhMWx0UVA1TUFBVzBQ?=
 =?utf-8?B?cVpXRS81MjhmK1V6Umt5T0dleTBOcmRiWDVEakNZTHVYZFdkR2l6TzNnNWVm?=
 =?utf-8?B?Tk00YUxGMWNiYXBFS1ZDN0doT0gwakZpTGFDT1B1ZGdVZC9KZGZ2ZllZemto?=
 =?utf-8?B?THhDSmZHYXlSNWxOWnEvQ2xtd0VPVzVSVnd6dHNma09EUW51Yk14V1ZOSzBj?=
 =?utf-8?B?NzVZMTF2TEp5TVpTb2dBQWJCTmdyREZzN2E4Uk1JQ0pobkdqL2VnN1pnVzNS?=
 =?utf-8?B?S3JpM1Z4OUh3ODE0eXFFZFNaTXkxYVViUXVpekw0K056RDRaTWhGd2d1K2ww?=
 =?utf-8?B?UExZd095ak5jMnowV2tHczlWbzdCU1YvZmJuSityU0N6azhIaHh5RlRJUXZw?=
 =?utf-8?B?clN0ZS9wL3k1cGlkeG8wM3A4MTNQMk1BVVJCeHhKMkhFZlVYdUJhQ1N3aXRE?=
 =?utf-8?B?NTJJcGY4dXBGWmZkM2lFVzB2dVhOUVFZN3R6NkwwZmJIeUgrOWlQbmhuMElM?=
 =?utf-8?B?NVcwcjZiREE0SG4xVFhMK0xMa3VQQnFheEZSRFRIbloyQmFZb1ZETXNPU2hk?=
 =?utf-8?B?M3BZTzdEeGtWKzNrS1dUbnJnOUxuUm1yNXlVYStQT2pBb2Z6Z0RzaTVVYmR1?=
 =?utf-8?B?UDRwZ09LcnJUME1UbEpMVE9JcG9IUmZ0aDVZMnVIR2xaRlArS3lHTCttMWVt?=
 =?utf-8?B?VUZValNLTEJaYWgxNGxHdDRNSmU2ckp1NWZvR2p1aWFGR3ZrUlFQQkNkUFBj?=
 =?utf-8?B?UW9IQlRrbzR4SWtKNFJ3OENaeFJJbjZyTEQ2bE91bkFaN3FKdEUxcXZyUEls?=
 =?utf-8?B?S1YycUc3dnd0dXVQSEsvbUpNWlcyS0lDbHVzMDczMm9aNGJhM1d0QS9BazBE?=
 =?utf-8?B?TWo5RThsY09QU2wvckhvMnFkMlJBaUdtN205Z0JCaHNZdTdESGcxMnUzdDRW?=
 =?utf-8?B?aldQN3Z0Y3hIZUpuYloxSGhjZmJEVDU5dGR5RWREdUhVOHd5THZsQ09XVDNN?=
 =?utf-8?B?RVJtUldLMmR2VHZwc0o2bjVNWVNhbHl3bS9MMDN6OHp0aHRNUTQ0bE5WSkdn?=
 =?utf-8?B?YkxyR3Z4aFNnZXdxS1ErckVlT2U5U0g1dVdFcUZ0Nm11alY0Zys3U2Q5Z0lp?=
 =?utf-8?B?Zmloa1JOcU5BNHRsRmV1UjZoM3F0SEJXQ1VlZ1M2a0ZVb1c0M3A5ZmJnNlZG?=
 =?utf-8?B?eUJDVzVUWlVGVXdNcFZkdk5Kbmg2N3N4Nk9uV1pJcytpTmhFdXc1Sm1FeVY3?=
 =?utf-8?B?bjdnRDBHY2FZaGsvTTdGZHZFZDh0UjJjTzFWRjVodVRzdnE3Qjl3VTFWN3hR?=
 =?utf-8?B?b1luWWVlY3BiY1FpZkR0QzdQZ3FpQWZVYWMrSTlBeDRMQ1B3VmJHV0ZXRHYx?=
 =?utf-8?B?RDdvbzNlYTljc1QrWmxHVjdSQ21mRWtyWkZpMFVIcnNmM3Rtajd0VTV6Yzc1?=
 =?utf-8?B?RGswNlExekFIdk9WbksrNXc0U0tSWUdvcm81NFhsN0F0c25WbkJqb2lISWgv?=
 =?utf-8?B?QWh2d0x6NWhSYkttdlpjbCtYMGhhb1kzM0R1OFM5Nm82QWNEbHdGOEdISDVI?=
 =?utf-8?B?SUwvRk9MSEpXVDhISUYzdXpLTGxGa2dtT0NZOC92VkhvUUpyZ0JJZTZJR0lw?=
 =?utf-8?B?aGo5Q3JoVnJNbWZHenFoZmN3RlVHSmNGSHA5QXEzdEpsVVlkN0FkZEI2NU4v?=
 =?utf-8?B?OTRxalRVNTJ0M09iSy9wMGxVd2pVMEFnelU1MHN3Z1BkakUrZjVHcTNLc2ls?=
 =?utf-8?B?UnRnT1dCZHVSeHdaK2xwWjU5NmpZM3prOTNUT3dzUmNTQWgrOVV2VEx5dTlo?=
 =?utf-8?B?a1A3VmFBaDQ5MFY0UE1iaHE1VElnQlNmN1ZUSlNZdXJnSW03ZlY2eTZabkEw?=
 =?utf-8?Q?YpDQM4y/0Zw70fX+VSkjPBjhb7WMWA9pz7Ccv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7b705e-5649-480e-f03a-08dec023a9bb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 21:20:53.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZV0pqwmdGrEBsoJ4/GTCZucyCsGfKnqkDVLUwcQF4PKPPbfykq+6i2QXRct8R7sQU4NGoCxojw4AHmJLtExs1oyMJx2ImxoVXp70mDvrxZ0viyZZ5FR5DgykFEdFMD9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11043

From: Frank Li <Frank.Li@nxp.com>


On Thu, 28 May 2026 14:44:46 +0530, Pankaj Gupta wrote:
> After freeing dev_ctx and setting *new_dev_ctx to NULL, the function
> continues execution and dereferences dev_ctx, leading to a potential
> use-after-free. Return immediately to avoid accessing freed memory.
> 
> This appears to have been lost during merge of the original fix.
> 
> 
> [...]

Applied, thanks!

[1/1] firmware: imx: Add missing return in error path to prevent use-after-free.
      commit: 28599a13adb5db6b4fb63ce088766c456f8f562b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

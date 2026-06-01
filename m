Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909E29E116
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329816; cv=fail; b=l5dh3drLJlgtT1NyCxCdoBxcQ2kVjyN1VFQb4Cok8oQs842gms8+MtrETT02t71r7gr4YLn/lwlJ+qfY7Xec1eeaCl1MsY9/REkBlfkvVlUEZi7io8+0si8kg2XIlrOlBlT2TfQP5j/FJIiw0zrN5SgAi9CfotSk3Du1ICXrbVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329816; c=relaxed/simple;
	bh=CKQ721kTVK0rCshF6nitTOpw5GiBirQPIlE+yagTLeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HC29XgA+qNfj6vwv9cc5o27fg5HvD/OhOJhbtn3QVTRBAv3CCc/satCViGQy1twNjG0wuU6CbCKffRdb/CyWZMnEvWpWQ1v8nwabSf3/4pSo1SP8UjUBtOqWmwyJeIZKf6ehvnsDayE4wGY7kZYKRDrvCNzJRn4gi2B4ogo4Cyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NGTXeqjG; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NGTXeqjG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhFZNpwmzr0VByygonpFRHdiY/k83sKFLPy0N+5EpQjx+v+d/Ssomd/25f12i3pxzISGYlRNHDcsOQeoe3bl1TKF3S8d/jYYh8/ZoXFwq0tHC3LSK7QgaGnJvoKntRxAKifJaKHBD2gSSSlEpXwIIH+0Ja+wkLfA7xJV15/86oufH6fLDW2mG+i5C2M6jk69BbU0xtU4JY/U404KryBQu6P+XrX5OUHSaTHiEGU9mn94j7n+aJiDnUCHHPsjAdlz5ixNAKS/XHcMuyEfh1GsHV5eulWlH7Va78jBfYjPYq6bYdEQIsJzQ6r6bgZ8vuDXeiLRKtNdce1aUmJY1wpm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZuWmPHaiSQGFea6dq+dnCL5bYtB7j49BLBI6PJZw6A=;
 b=kPiu9e1rCMtgewBHv0wqVefcQeJmsDYO0v+TCAtLOuu2k57X1Tds/hYo3ldom7vHLwoQuhRtyYEE6gdsTS1i0XlP4ZU85sBjo6qeCb+hd3IcDlAsCUK2/PPpsE2fxrczHYuf3I5HbRGv4jTv3OMkCKqGyBcm85/ixsgoC6Ig4L6KBhjskJTopmRtjSBUAT5lK0hfaHu63MuWfb+8mgeA/CpOA5hg8t+S0fl8gvWUkBfN9a7eGoRMvPHXE/mzZqllKwI/pYfX/zosN0Q4dqvSes51SvKqgIITAdsD01jLgdYx/R+Uf2lE7tfU424vX9NZIEdSl/2qwdULQdpoVQE7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZuWmPHaiSQGFea6dq+dnCL5bYtB7j49BLBI6PJZw6A=;
 b=NGTXeqjGVJRbcqLJ2oxRIhDlHEWS8Vvwnkuza6RjjM+/reSce0/nL6tlwAweFcjO0KkmyF8Xg+1jqy7bBSp/KGBpKdBZulSkF/7KAorNn+aBGc2Ekj7FDKxP7Xu0w22Iwu20aSortTTCp3oOxB4NP8B5bZaIiosC7Hf+0pRq1EA9uqd2Dcx+V4cxaIRG8mbKGejVo5vWMHSY1MERHhLLxij7zcJvrOmv9QsqpIVjxSEgMiTwClLZRJFHEIvItTBrkLdWS6ZlyH1EgONGUhJZBf3STxGWpl374Ivr6FkBltg+YhkMTThZPdm0zWN0yPJtXFXgGmk/3mGZ5A8iBwe82A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11795.eurprd04.prod.outlook.com (2603:10a6:150:2df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 16:03:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 16:03:29 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	frank.li@nxp.com,
	imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: avoid casting userspace pointers
Date: Mon,  1 Jun 2026 12:03:21 -0400
Message-ID: <178032976789.4078979.2414290984205780615.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507065403.1716178-1-pankaj.gupta@nxp.com>
References: <20260507065403.1716178-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11795:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd7add8-1fd6-4e47-0a69-08debff75261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	AsWIK3UIswaAhx0DWOa2xFCOO+K5kvkb54pa1hGr+0Q9uhwB25Nby66XF6+okpPi9XDU7I3xPSD8pVI5QbJvfgBOkxT5Im/hL/l1HqsPm3ldqMOK/NeeYHBgz0tY3g+jdWQU6DptVP3ttVZkP8k/Pii+aajaCe4rY4phjsNNvIbi7w2oO7jU5fMWtT3IsO9LWAdh6d8vcNWTNUrGgcBTfp4jhppenjg6U7BPIklWRRKt2I/MKKXE1a/U9JVp6rH7lUEGfhsfGyWu8rUjRibmCkN/mcCbcIH7sTnFL2v1a7LIz5ZAMb1UEY6OXFKDfxhyGzvLWfYwqfj7OVZmENgpaQmblrrE1U+bzv92RThdR4IpSwkFx+yLeeKAa4o9ZxgKR6DEDVSNQMJoQ/hNiyc8aQPJaRfL5OgbwXiKgDLHt2NNa2PNeUHq3s5M11wuEbSS8E4TpO3hYIrIr9pE6fu/11cMyTZv7cUWBLRBRu2Wn6ob8WHKAu+ymy355FbFgovkhREX4hvs/xM/Ag5NoQKHMQfIkQXkPWhXlUEgLThsDwV8KdWRUkV09cET9qcWqE8BNf1j/6MtTSmtK0yoSKpGV9Igezyo+NcmLspniZe3pZNJEZDJxFAFP/zHEAJjmR8wN6zbpjpZNQiPfmsDBYcGnIU1pPNYQgQdhPKtXmuygU7PnmMu9IDgngKctS0ds1TT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhoSU9JVVRvanhHMlBvYWZKMTRFRis5Q3Q5TFFWQ0lsT0pjWjBKVUZQQjRM?=
 =?utf-8?B?WDVXMzVMajJQR3JQK1FnM1d5THlDRUxpR2VSS0N6V2NjczVwS1J6Y1p6YmZ1?=
 =?utf-8?B?ei80VHh5RVZ2c3hjdTFRalkrcnRRaXBxakFpcWNqSTFjcG5RRWZaVGM4ZUhn?=
 =?utf-8?B?UVRHcm1rSzZtREp0NERuekp4V2JSSVJUdTdtbzZ3SWRFbjlEWE5LcTQvRUpQ?=
 =?utf-8?B?MkNRdURrYndJMXA1eWttVVZkb29DVzdYSXdnUXM1NjR6eHRhdExUcEJyNEdX?=
 =?utf-8?B?dm9VUjZRUWhwaFh1cTRkbEErZDR1ZjRDYk53bEZGM0huZTAyQmg5ckRtRTlD?=
 =?utf-8?B?M0JDeW9YRzBXQmtqb3N5QStJb2JKZ1gxQjhLUjl6OVE4Z2Q2NXF0YjBobUFw?=
 =?utf-8?B?WVphOE91MG5PdzlYdEdJT0NSRUxtdmdjRVRpcWVUYUFrVDA4Mi9GckMrY0Q0?=
 =?utf-8?B?dE5jdUx1SGEwdEJmMFRnWjBRQWhybFNDeCs4eVZLS2dPTmdSVGNSL0t4OVFu?=
 =?utf-8?B?QktFUm9jTTJkZG92WHl5Nmg1Mk5LUy9DMnR0Rk8rTEtXYWdjOHdLWnRMSFFi?=
 =?utf-8?B?QkkzMnR1OWxEaVpTdDV4aUFrUDNUWmFsWElLTkNaMjJkeG1vRDcraXJwa0ZT?=
 =?utf-8?B?ZUsrRGpBNWNVM3o4VEhHN09UNHRyWldiUjVHVGF3c0RzZ2dBR1BrQlVBb05I?=
 =?utf-8?B?QkE5L2d0WFlMRDBvbDNobVc4V0JWclQ1TVdFeFBWMitUQWZLVlgvbkJvZ2VJ?=
 =?utf-8?B?c1BSZGNNSFhrZUxsUWJ0aks0UTFDKytTRDZNVmtsZWt1dTRTRmpnNnpmL1ds?=
 =?utf-8?B?a0lRWW5VSHlNR2Q5OUM4MiswT0FsMVltYk1xZ2piY1RlTE9janJQcWY5eHdP?=
 =?utf-8?B?NW85MjlRalBMTFVVcEdicFhsaCsyb1NJdEtlc0dtL2k2bEgzdTRnd1F3cmgx?=
 =?utf-8?B?LzNYSmlhQTFZb3B1OW1EQ1dYT1l6VDdjY0VVUDE4dk1pUVFMa2hlbVQ3bUp4?=
 =?utf-8?B?eG9DMlJyZjMveldxNjV2eUwvN1pYMmlqRXNtYUh6WDIrSnFPNEJ0NnNra2pH?=
 =?utf-8?B?N0FVUGhsNnN0a3B4bXlmczBoRHVIMkV6WFZxY0NvOE1LdWRDZ2JRMjZFK0NB?=
 =?utf-8?B?Qzc4bVgxRS9teHA5ZzhHNS9URG9ndk9WZWRnOUlyVFd0bVB3MGRmYXdDa1Nw?=
 =?utf-8?B?WWxWY2Q1eUpUZU0zZGVHc2NCUm9yeVRQZkdEVlJmWUlHRjV0OEM3ZTBqMGZa?=
 =?utf-8?B?R0llZE5Pc2lwSysrWW5mQW9ETGt6OXRucW1KWVV2d212VHdnc0lQL2h5TFhP?=
 =?utf-8?B?cmE2M0dBaGNiNkFIa1hyRDdaODdLbnZ6dzllK0pXeUk1KzA5N0gwUGVJY21z?=
 =?utf-8?B?c2RwWU12R05HclUzd1IrYXIyYndsM2JUQ0xvZ1RVQzl3Z1Q5TngrbUo2T3R0?=
 =?utf-8?B?amI1SEh2UXJ5cEZ0ZWN5RDVGWFhEZ3B6VDRiSGczKzNmaEZPR1FPUHIxMVVy?=
 =?utf-8?B?Wmw5SGY2b3d3THpzOHN4Q0VnK2F5Q3hJNGxQNndDRUE0bDlqbmM4VUt0c1h6?=
 =?utf-8?B?bGpxOERsV3ZLQmxRNTg5NkoyblhDZ3ZUZTRZOFZUSVQ0dU14KytnWlhnRUk4?=
 =?utf-8?B?NnAyNytaSkMvK25GOFhPdUlVMjJyR1JmNldZdXM5aTVaMWVCZnF6dVRTUThE?=
 =?utf-8?B?RTFvSUJKNkVWbzJYNUFJQ3czTGtaa08vWmZvbythVW9hWE1uTDYxV0JEazJS?=
 =?utf-8?B?cHIyYUhGazBoaExtSDdNNlltTWFaUlhNbjRSa1J1TzNjRXUrSW1DdzMvaWx2?=
 =?utf-8?B?L3JibElCN3E5SXkvTGliang4SWlYcnI3anVBQnVsZ0VKNFVDNGN2U2s4S3Vz?=
 =?utf-8?B?bENBS3hnSW15bHJoYVNTNTV2SjNSckFOeEh2WTg3QWp4MkJPOCtTb2hMWXRh?=
 =?utf-8?B?M3VXYnJHVDVEdUQ1WWpsay9TQnVDdnFGRjJMTEdBTVMxMFVXTFozcWY4UVVs?=
 =?utf-8?B?cFhIYW5WZUUyMWU2eTVVKzBOT1pPWGVncUNCaWxZdnNkUnVnbDFBcHRLeDhm?=
 =?utf-8?B?NXdoazFMQlo3VEdBUHptaHBqeUxhamFDZk5mM1R6Ris1SWdVdDY1dHFhQ2Y3?=
 =?utf-8?B?TXJFMmhDdU9meTNKNlZPWHFUcXNISC9nSE1CZFcyemNGWGo2anYrcWd5aXNq?=
 =?utf-8?B?RGpicWlHRmU4bUxNelBrbkNoZW1iRWU4NXpkTk9WM3ZvQ2d4YTZRd2RVaENS?=
 =?utf-8?B?Slk1K25ibFB1Wk0xdVJvNlh4MFZ1S0d4Ykl2RWFyYXFiNWZHVHRCUnBPOUtz?=
 =?utf-8?B?UWZ1L25jOXNhbFE2ODltUGRLRVc1blByamNqam50ZkZmTnRzRmQvODQ3NEE5?=
 =?utf-8?Q?e1QlFIqKP7DNRY6o=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd7add8-1fd6-4e47-0a69-08debff75261
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:03:29.5522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2TDH0z/yUD7MzT7Ayi8n4AGo+e5urN9mfJfWl5TrOSTDxx139h9+NHf5cUS8qPKeYTfGPnP4YEnq14DZRfRTKFZScc4asiD6Pg0u0ed8W8UB1x0Z0tR2083GAS4M/e4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11795

From: Frank Li <Frank.Li@nxp.com>


On Thu, 07 May 2026 12:24:03 +0530, Pankaj Gupta wrote:
> Sparse reports warnings where userspace pointers are cast to kernel
> pointers, dropping the '__user' address space annotation.
>
> In the ioctl and write paths, the transmit message header was validated
> by casting userspace buffers directly to struct se_msg_hdr. Fix this by
> validating the header using the kernel copy obtained via memdup_user()
> instead.
>
> [...]

Applied, thanks!

[1/1] firmware: imx: secure-enclave: avoid casting userspace pointers
      commit: 29fcae80c944312d1fa5dfb433a57ecaabdaf967

squash to prevous commit

Best regards,
--
Frank Li <Frank.Li@nxp.com>

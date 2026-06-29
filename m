Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96E344D86
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761765; cv=fail; b=PrYMK3zTJWhjI0a+VucjvMSlGhJoAH758nhWPz0uDtUCQ+X/lB7sHYq4iNdi4GIsUtjgH/aZ8PBcVQZYPpYBPrDZ4eyXO/qFPnkMiIpS1yVjbL9aYkZbsYffMslEeYIn2aQVe0Y7NbGHnNO6ae4kekebTNDGfe+XddlClpboHFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761765; c=relaxed/simple;
	bh=dqJEx8XSrGxGOKrVVH9aMPkmPYQzb35QZbFawW8SPvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PKKdclQVedY31cibH0pJgAkvh5/ATO3d8fPoH30Jzp1uMheTQg3CRtSlVijEOZ0r378MU4th+8x3Qw7MdnVR8UcGndLSOIAZgbiw7LQ4PDdTJd92u6K8noG/XvoafSR9wdjGD4aN6Q8O+dFj1Vpir9jCclS+s5h3eLMMrdtJLTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MJ9VW4Ww; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MJ9VW4Ww"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmYE+woQ+h3+g68Fnl4L+FGS89sk7utcp9CXpsoW6tBey000k3nOaJyiE1rbwgBd9Xie2slSBLB3Env4fxPs0+qSqfkdwqXsuCeqAJlVKK0kvvYiBEXkkFZVwbvCCK+REsc6SsJIRCQKEHXc98MZzT25UTyGV3HhaSaBgm6uAU8czhFX5IXoBTlsJvt9dzgxfGTNDV0LKxjEz3EXzmU5l3mzzHuIqJYsVMY/EKyYPiw0UNDhdHjEnx1kHId8oUiIFUQpdhXGKrQCNkfkhB+x8a0U1brS4GXMQ8zU7FihHeFNMmolobWW9qsQATewj0NcwSZlhLrK7mirWvmO9AXNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2hixNUqVetajYklc0TuTxkgYbP0b27uwdcHW2U3Dxg=;
 b=kzGZbcsVZFit/Exg9FbupLKjcCMzv4+1Ckbd3HUguNBOWeGnOd6z/GoWNtaq1ovy4vSiXITyFFd2HMq5cU3LNLO/Fuuuiki1rCHvQvM7Q6uUOR7aSUtqdNKtXIvGGzafZ5F9GPsUI+f9diAkWU3C5LlNiNl37MkZy2lPjdBYxq6CoMgmgPAqhyoerqLdOypl6v0L1MwzLmaTjDR4Iw/jPctLJLeAfnZIDP4JKtodnElUUn1X8grmuPeLZQJ5yEZ8YLkvA2AZmiuqKFpzJlrBdGz2lr/RKTgOgMxbAK2GxUYvv0mqBvBhii7W/vQzkU17IHmO3XikS3qqAJpm9rcHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2hixNUqVetajYklc0TuTxkgYbP0b27uwdcHW2U3Dxg=;
 b=MJ9VW4WweJ6MJ8Wl6BP1YmkmXc0alu3O7272F7JcipctkONdGsf3zH0J8pF7Lz+GAvGtUfhyXnm9fZgSnOqOB9Pe1Y1emiI5x/dxvJUAYK74V7H98kGgkMNXTbQlI2PmzZfyQ76TtexVkVq/HmsgahoA7t7C0f+S+HhhKX/nn/Tsa9rtvN27RpG4mv6dMzkiLPn7bVdUdH5brpm6UtA+pL2nuL4TFrMOLs/BGc5Nw5IxK1ykxguk9ADbdiFMfIC+/nxNfrbYaJsbnGxxpWha99+t2LMPIx9ZSWlaspugRbT2LV2oEbQfTePDB1ROpF8AcgHz5bLpYQ4cH3hygf5d6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 19:36:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:36:01 +0000
From: Frank.Li@oss.nxp.com
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor clamping
Date: Mon, 29 Jun 2026 15:35:27 -0400
Message-ID: <178276171937.2424554.17141585139727533269.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
References: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d8752b-cf87-4039-5ed7-08ded615a6a3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 3AKyYAQzpxXR0nOJ+e3qukwxzFEeLeQPsuWStNSTPUiG6t1GPFXqg4xCiAMLjryrrNVSkqhAEY8bqgr0Hc1p9JOWM7xX9Kq91P10grL3/ISDHDPc5SLM+CF2Y7PVpa0/HOohpXDAc+9VkahRFIFk/qYVDrh1W4kx/MNbQFxEgUAzrKiK1VNh7pcrikTNgfgvjtYcOPLX3ClLdKgWJ8u7gyxprdWy1KxFN/MSvUY4w/gS6P3KHM6fR1s8DTlSqjElr4qv+fwAAvAspobM93Fme/XhjAVsFtAtNktZTubvIVF2R+TGwhVK+yb8ZVGHMzPFytvKWLfATdAKDxmGwDwG0zBSemnd4BrP0ZVXbvKB1doGJuEbBP2BlxcbIhpya3ZPEZckEi6OhDiAiQRk8WKfVjovOaTTnDdohwW+PXXMVZBQXNaGgjA2n106bI78AKtg7ZNo7MgEVzUpo2FmtgXNBgFU9Mz1He65aaz8iUQHoRPEk2xITdmtjI+HqIVOfPPK1yba6XCncNdmc9mBEEPEVOBCkI4YvI3by51WqqPCSbc+zhNQP3aHPp4TQ402qx3IARFL01kiNVfDM4K3GP6d33cgG1M5jurRuAr8f41iVtaY3ZFqf7AUAyjlOvCzK8VhG+isYNznUKdXlsJEBQL0Z+/OX7yvQbv/hVO73ka03Ao=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eFo3YnBsRkt2TzFqOTJ5cXRjZzU4MWNxdkU1M3lXeFdSMUIwVXc3dUZ3TjBN?=
 =?utf-8?B?U3pkcFp0S1BLUko4Q0hOdFc0L1BRNW9uZ0pHSVB5dkh5RDRMaWk0ZkJTZVY5?=
 =?utf-8?B?Q040RStWdkh3SmxVSGVXN0ozM2pvQjVycFB4TENkNUF6UkNKeGxFS2FGMlJQ?=
 =?utf-8?B?M0htMEpISnFkajNteGVlL3pTaHliWGVzWW5tWHFCVlR4eTVNUEczSVFnamZQ?=
 =?utf-8?B?QlQxNmpnZnpxNTdmRHlDRTlFNmI3bWkxbEdabnc3SGhINmRWaCtQa1NVN2dW?=
 =?utf-8?B?SjllMDJvZ2Y1UldqYldGRzBrVzloVkFyU3crQzA5bDQ4NEJtSGdZMWUxRVZG?=
 =?utf-8?B?amQvMUZubks1ZHBtdmVXay92VDBRUmRoNUxiVnJ6Mi9qclN2VEFvUE9nMVEx?=
 =?utf-8?B?YWNCRXN6VkZFTnpCVUs4cll1MU9QWjVHb2RhS3FYbWRhd0N2NXhxOE9ENC9k?=
 =?utf-8?B?S0k3T1UrRDhUWm9YS0lneExENXBYUFFFTjkzL1lxcW95aktZbEczMkZWV2hh?=
 =?utf-8?B?dHZKTWtxVkJUek50S1hLK2htbmUvc3d4SUxNZXcycXZRKzV4anVxQ2xwY3Ft?=
 =?utf-8?B?S1VydWtmTC8xdVYzQmdtcloyem5KWUdLaWVjdnIrZUpjcVp0aFU5d2Nnbisx?=
 =?utf-8?B?OWNhdVo2dWg2V052MFVqTk9VS1FQUU1SWW1kRE5tZGlKMlRxSDVqYzZKNjVW?=
 =?utf-8?B?Ukh4YVBpR3BCYitLRnpuUTdRejJlN3RERnljUWJqMTRoWWkvS3VkS2lPaU51?=
 =?utf-8?B?ZVZQU21LR1dleHg0STBaUXo1ZFA1bmg4Tm04czBQTUFEN2wyRm5sMldNdVNI?=
 =?utf-8?B?ekZzWkVDWnFlUmtDK0o4R0FlUVVaNG1wWGtqZWhnaHEvdm1RSXBseHNSekNL?=
 =?utf-8?B?cFJKdEZZVlFOZ2oxZjhLQTF4ZVpDY1hKWDlCNmJnZmgrQW95NVMwK2E2czRY?=
 =?utf-8?B?eWFyMktISHVZZW1HN3BMRUs0V0d1ZTNJVzFTV0R3cW4xT2kycGsydHlXRjJY?=
 =?utf-8?B?V3JSQ2hZbnplZzZqRDFkZ3BPTEsxc2xiaWJrNmlOUzhxNGNoWEUvR2s0NzN0?=
 =?utf-8?B?K2QyVktOVVl2OUkwOHo5WkUydSs0VWV3WVNRZmlJaWlGMXFIT0diREQxcUI1?=
 =?utf-8?B?NExONUxIL2tKOFk0YjF5Y1VkakdvU2x3NDJqbGZZZ1poaTVFRTdoaG1pZDJu?=
 =?utf-8?B?bVhXVkppTC9jVk5sTEI3VWxZZnhySXphaHU1Q2svbU9Ia2lmdThlWHBiNkhh?=
 =?utf-8?B?VHc2Qkxwb2JLMVI4eW42cHh6emdBQXNvQSsvckNRTnpSOUhPM3JKYTFBVzVh?=
 =?utf-8?B?UjF4eEJDQkFhUy9WcGNUclpUSVhiU0VUTGRJSklTUVh4RnpnWkp6UXptbnl4?=
 =?utf-8?B?VU52R1hVSjQzdHNLY04raUhmckhsT2hRSDV4dlFnNGRVUndEd21MRUpqYWtC?=
 =?utf-8?B?bkp3eHhHR0kzYzNneVM5OEd0bS9keTl2bFRKUW9oN04wSm5aU0VNQnNiT3U0?=
 =?utf-8?B?QmgyYWR6UEtRMUFjSkNaT1BBcTZiSDZKV3c3UEMveXNpakZ2UVpzUHRxWXli?=
 =?utf-8?B?eURDYWcwL2pkeE1xcG9IaUg0cmw3bmNlU3VPQytKYzF0ZHVISlByQlFuODUr?=
 =?utf-8?B?blgvbStOK003dHN2NUEyei9ZOUg0eUZPVmc4OFFYRGZmUjJsb1kvT0V4M1Bp?=
 =?utf-8?B?Wk5GTDVyKzgzaTBTZXhza1BrU2V1ZE5CRVlkWjN4UStia0RNWElhaWlnOFV0?=
 =?utf-8?B?VHlDSmZROUZUemhEeUJrUVZDbUR4V09IdE9mQ3cxUEEvS2dKNGpaOFAwSmpq?=
 =?utf-8?B?Q3VHck1CTFRxUE1FblZQY0hwcjBtNzRWaU5WUWRObFVFalBJeWhvT3ljQzBK?=
 =?utf-8?B?VzBBdTBUTmx5bVZMTDBPRGQvdnNHbkhDUGF3d3BhQ3laL0tFbGtVNTAxTzBD?=
 =?utf-8?B?OWRzSEVLR2hITGVBTTJpYW5uZCs3dFh6a2Y5YXBRS0VYSHVZNkRSWElIWHRV?=
 =?utf-8?B?TmZSanFKTkZ6dEhoZlFlL0x2NzhLMGNSdVMrR01ja3NDby9yZnJPU29rbnE0?=
 =?utf-8?B?VkV3eTluZGY1QldaK3BqM2F1Z3luQ2dSTldRT1lWZmhSRzhRSCtaM1VhMG0z?=
 =?utf-8?B?MStxam0zcmRVRkVwYXFKRm4xcmJ5MU1MQkVHaUU5SG83QmQxYWdWRGFiWGFU?=
 =?utf-8?B?dDIyN1BFWUxUcXl4TDBiQS9KUnYxYVA5OVluT0ZJdjZhd1BnSmZVUlJGQ2V1?=
 =?utf-8?B?VXYyYXRZMk16UWVoNnVlRkZsWXNWVHB0bnV1WGNlcXRRSE5lTURsSWVMdlEz?=
 =?utf-8?B?ZllyWEExV29xMkpDeW9pbXNMTWhPRFRndysxdU1leDdrYUxCYnorYmpRcFhk?=
 =?utf-8?Q?iUypAyhXtXo77moQwLqiYn4Eh5704h06jmUjI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d8752b-cf87-4039-5ed7-08ded615a6a3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:36:01.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbwQcFMGfInlq+gxpZhH/4JgEL5mBJCUPIEmGq5qzkhQ07cjZvPOXY9VFFUze9Y8JP37+hkELOMjbXlMio1A8MmgRKPp9okPcvoh2DDXnWQyVf76vB/pHGtrnPMup4Ms
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270

From: Frank Li <Frank.Li@nxp.com>


On Wed, 20 May 2026 22:27:38 +0200, Laurent Pinchart wrote:
> The total scaling factor including bi-linear downscaling and decimation
> is clamped to 16. The bilinear factor calculation therefore produceds
> values guaranteed not to exceed the maximum factor of 2.0. The clamping
> is unneeded, drop it.
> 
> Note that the ISI_DOWNSCALE_THRESHOLD value of 0x4000 is incorrect, as
> that would be a factor of 4.0. This was inconsequential given that the
> computed factor never exceeded 0x2000.
> 
> [...]

Applied, thanks!

[1/1] media: nxp: imx8-isi: Drop unneeded downscaling factor clamping
      commit: 5f074ef2f1fa19d8730f5c0329ff2f7633639875

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

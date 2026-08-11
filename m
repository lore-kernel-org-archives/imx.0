Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82243389DE3
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461240; cv=fail; b=i1Axg49/Oj1LMxq7E8hmaLjLbCNhr5Zjaz41PdxBOJTDugT+t1ZuzWxSctGubGQERlef22JMoncjpGfYYiaXkosjC1Ks7BlrMMABYIt0yf6013ejouGd8V4HyrfhbHr9+rVmAe0VBb4CWNOq2pVbn9zdtJQiQTfJq9dtal/v2Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461240; c=relaxed/simple;
	bh=hufBiOv8zehXkAS/+e8k1W40GVzSYXP0Az8iQUmNf48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AkgUXSkyKecsborHLDg9hffIHaF4L1d1aL92hQ3mnmH3oD3OaB23W+eV/x/cpGbHP6R/MRea56haI6AOfMK1HgKVCtBN5w/fv4mgW4lsy2JdmYBmY52XgnxEPTVSQuO1Xv3w62cFB/ZqymZ3UDZxnT6mnoo/fg3Nuue+T7c2Akg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EPdGme0c; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EPdGme0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jyvs2A6DreEJoYFElFv0bNvPKjSNYqVYpHT/CdGAywrJo1+Vc4GOIaZP1q6SZ7KjCUG6sgGHLx9f6jfkHpuYvZ4+hoStB//lE597WbABV2DXwgFUeNFxDGhqYWGfR86HjLp44xzM/gaM3QrhBE2+4yxSKM93ipp4F5lTZexPnyHebO/qcIFGpw338QYNeaieHM48Y2CCmnB5Uhl2T4Mcjq6DBebdcxufPYZ3uGLntscN4MDJlrIry317l9qqp3wSLxyhHY29tIQplhOiU7CNY9t5DegqmOKFsb6Z8Fj6FRAvWyrMxo1hMHe2faPGc2dW6JRyxU8Mf4EUW8+gVGnGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5cWZShdbjwRmzULLOSoVBLP/IpnygYXoaG718vy28U=;
 b=dSRKoZNlaIPjSnHhhxJORehxjAXWZJEj/o10klDbpwEazDEM/jQuBVeVoP6XgFJ1cUYfnzesALNfyftMNCOWX2NIFs1rje88d+wticNtzsp2afkkMqJWbdMoCaaeozfpMCJboMcsBklFZ3XhmVO+DKYfBtzU5u5WSa+sMgKkrZM6zMrC3XQLc0VbRR89VEUc6t11zmNuOejIpcbLRtWRjh98tL9zUl4GqwiQHjhEMlSGZwuxhuDQ7WsD9aAQHMpwBFDL2EkRrhtuDRoNDCabfjD9aj14iWTx6S/cf4GftrsNYeDEhfpiKon60LlZPSe6+EHWITFkF3Q+cdEouMppxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5cWZShdbjwRmzULLOSoVBLP/IpnygYXoaG718vy28U=;
 b=EPdGme0cmpI6GtVLygsSkjx4NMw2oURjD343rvXE7WcihjNz2ZwoSz8nYjGX8xbE4+xByhpJsbg+AF/vwCmoXOI21bQTkXWiHMdrAY5uQeAaS32lZGvolMTwWlducupwWjg/TT+tu5onSWJYqW/ISln/gyYuQeRmSbyywPzmfcIMlvzgphZF+zRN64bUlTCIJU9wQLimBxsRNSDbKiS0nNVU6V8Vp3ARjv4DLDYBEcoyGMhnjq+P46kT0cVdET7kCG44nT14wDFrCc7hI7Y3mX4RyslcdE+oDCrzJLGz66XKEUpzwyRqkTWG60N/8Lz2OSHJ+epr3CapBUlIEaYilA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU0PR04MB9419.eurprd04.prod.outlook.com (2603:10a6:10:35a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:13:51 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 15:13:51 +0000
Message-ID: <1521da8e-18df-4d7b-a255-5ca133bd5ccc@oss.nxp.com>
Date: Tue, 11 Aug 2026 18:17:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: Add stubs for CONFIG_QCOM_SMEM=n
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20260811123103.210571-1-daniel.baluta@nxp.com>
 <sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::15) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU0PR04MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfb6653-d2e2-4788-df0f-08def7bb2648
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|22082099003|18002099003|56012099006|10067099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	30E5G68nMw0wWIwTH76fS8lGg9dE4pbNnYeoK75kZRNtpChljKpNXYLZaGjoD31vMHfpoLon4tStc3PfUcNU8Q2mQ9tAd/VaGu84IdsMV/pgYbGEFKd8LEHGuQaxt2ykvaRVEBhywIBk1JR1EnXvceBaoswq49cG+zordBjfgUb9McB8YV1x6+FgWWRTih1R2K8zgSzhrs0L70fAK/ctxxkplP1NHZk0jVMRP4d3RgxXzTLlSgkbD6+DRCX+He6jCqk1T8TVWyofPukUVobjSexJ96U9irGBy5qQtr7iTqeq3f8prrAe7jD+WJnN7HoTGv9a7J72IgMI5jL8NPQS9QkRyGQDTjAlMApaDLeKihZzalqjNrfU0BRbhQLpNFdJNO2LJbPoiMWRIMaIsw2vVjCVSCNEXISNlEQzuMvxnomO3iQM5p/qqGVgr7cKZxwPNNCe0Ag2G9UiA0WJS+TWwWgJ7isiE8FEaLLWWaKS1NdzKdsKj+9I3lRl00p3U/q0JEDki+XxAx/ZVJKL6DI3wAM73ExRvpah6kV8B1aYercFDRhqcHISsUhF09CLygZYMa7ocJD0qHg+CqizIsHfuG1JbfVq9LuXhfOmWvdahFm4PQ67IV2tqSuA6YXDsARm9yjea7JIRpyGpagdM/erUFqjGwQTGY3AmYRMhG4sTIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWhFV2NZUU1DMVRBbCs0SEMrdHR3KzFma0tDZktxa3ROOWZlYWh4RzY1QWdX?=
 =?utf-8?B?SFp1MUY1Sk9oOXVoL0FvQWtsemUrblFmNFE3RWNKT2l3WW1jKytKcWlNZjd5?=
 =?utf-8?B?d2hUQk9BTmZVMER6N2t3ZnNYQUVOU1U1ejNLZlI2MHQ0WDFGTVJhdUxyREcz?=
 =?utf-8?B?aFVFN0VpbnRkMm9OMGszZ0JxOUNhUVZLU21POUQ5WUxZdEVkbGswWDhNaWxi?=
 =?utf-8?B?TVM4ZndvUWVLNEY3aFozMHRVd1l3MDJXc0x4QUV3MDRjQitQaTlmMTRyVm1U?=
 =?utf-8?B?OXdTUjNNV0pzcys1MHBYUVJWVVlnY3hMNEIzRlNGcGhOVThnT29obkJSU3Jo?=
 =?utf-8?B?aW03emt2Y01nNGpIY05mbGlPbDFPR2YrSnhJZkx4VWFnbzFsRE9ieHNWdG9u?=
 =?utf-8?B?WDMrQVBVeXBqYVFrcnFEeW9XVVoxUTZaenlDd2dZc0Q5M1BZb0luOXpjWFhq?=
 =?utf-8?B?WG1NVjMrbXRyT1pTZ2tpcWFpc1I3dS9taVAwdWhvakQxZ2hvRWZ1aWpYZVk4?=
 =?utf-8?B?Z3FST3hKaE1IKzEyWUpqMTNLTFVSYVlpT29FdWV4ZkxSZXdMVTQvUldmR0sy?=
 =?utf-8?B?dEh0ZHNoTUYzMlNSM2tGLzJhMlYzVklVTmc3Q3VRNFFjN0ZoRGtvRnBlTXBP?=
 =?utf-8?B?RlNlVUVsS09LbW4yK2hkRWVIcko3WldVS3pnRXRpN255b1dqNnRYWnFKRzZh?=
 =?utf-8?B?ZU50Y2szYlg4dFVJY1haR1hWbmN1Y1ZXTVM4Z1JMS3BtT0hmNlgxVk90cUlC?=
 =?utf-8?B?RkFBa2ZuVnpPV3RSc2xKTzNOTC8xZ1JrZlE4Q0M2SVl4bHY3Nng0OEh3c2M3?=
 =?utf-8?B?QjVDbUZVTzN6K2xlNkR1Nzh1Um1rbjhIWGpXOEhxdE1ONzdmM2FLWkVqdXc5?=
 =?utf-8?B?QkZkK1RreUhiL2wwTEtEa25wWGdJeWlKb3REVGpTTHcrTkk4aDJVVGlSblkv?=
 =?utf-8?B?aUtPd0tXSE5NTFpPdGczTi9nbFlQM3RLOWFzNkVCRzJDSFJuWmNuQUFMMFBo?=
 =?utf-8?B?QjBjR3ZDMmpPVGU0TGIxYkpwVmdoZjY1ZU5Nb1dMMXhqS3JaejJ4akdFbVN3?=
 =?utf-8?B?cmllQ3RyYjdBelBVdzN0SEN2ZTJGSG9RUjZUT0htVHNzWVR2Tit3cWltUEww?=
 =?utf-8?B?OU56K3Jhc1huSDYxQ0FROTZHaG43Sk1YSm0zOUc4S2VzK1FwWFVOQU5YOVlR?=
 =?utf-8?B?d1BVbFRjcWNOVWhrbXNmNUtDWkMwdkJHVnlJUERKRVRjaE9Ncm05bnBMU2Nt?=
 =?utf-8?B?VWpZd3lENmFEbmoxRmNOeWkwMk1FNm04TVQrM3cwYU5wZk05ZHhMQTFYR1I5?=
 =?utf-8?B?TEgzSnJnSGE2WmFpdEtLbnZTdzFuU3dHUEJ6VHRXVU0vZllmUzdnaDJvMlRo?=
 =?utf-8?B?SkVjOHMrT0ptcTBVQzB1SCtNMmU4dVl3UGI4Y3hMNFhCWFhCZlhHOEJZRU9w?=
 =?utf-8?B?OVBZUitPVGlKNzZ3cWVUdW10RVBEL3pUSjlKQlpaTlZhRGZvbmVWWWZISnFM?=
 =?utf-8?B?dHBPZWVVT3V3RFJQVzdtT2dxOFVoWDU2Q093SkRUL2szNVVoNTdDSUVycDhQ?=
 =?utf-8?B?YlI0dU4xVmdNOTF3bkxZdVRITlNraEtFaTR2ZFpGZWVNNm1HdUFsU3k3QXFX?=
 =?utf-8?B?WjlscWIyRlpmaTRqSDFqank3OEZiT1dHUWx0VDJuZkJUMTJWSVlUNjk4cjNq?=
 =?utf-8?B?QXVCdGk3aDZqdE5KS3EvUUdKeWNuR3g5OHRmSEpDUHM1eTBVRExFb1RuZVYr?=
 =?utf-8?B?ZllZOG9SNi9TM2RSczNrTkhvdFdlNC9YUGVuWU43S2ErRXQzWDQ4MnNyUHJK?=
 =?utf-8?B?OGlJYmxrOXhHaVlyYVQ4WUI4ekRBQzhOM3JOSnVsVjh4RzRnVzB1SFFkR2da?=
 =?utf-8?B?cHVZUmFsbFo0RU1OMDg4bURTYTFiZDJvdjEyNWhIRHFUa05IVVVwa1NRNWVx?=
 =?utf-8?B?L0p3TnFQSkFOamY5SzBHaGFmelhRcTlBSUNjVGphSk1teTc4VjN3anBIYm8v?=
 =?utf-8?B?Y2xVZU10UWN3c1R1OVRicnVvTDFtUlIrMjRnSi9qK2wza3RuTDhseURJeVM0?=
 =?utf-8?B?YzNwS0lxektnV2tpaWhMVEVBc3ZxK3kyQkViSE0vZ0w1R01NSTVsUFErU3ZI?=
 =?utf-8?B?b2NoNytWV1pDUm51Lyt5bUZFcnBzS0JPZWc3NzN4c0NNZEdnSW1YOFUrdzFm?=
 =?utf-8?B?UDd0Z21BNmdTWEE1SURqNEpJVlcvL2syOFE5TGJiWG9VKysrNzBEMTRpb3Rn?=
 =?utf-8?B?OWpIUStSRWNIbXA2WVpnMHFPOEpXZUU4czI0L2Q0dW1wQTVNdFRZMy9OVU5l?=
 =?utf-8?B?WHdUekljSWtDcTZPQ2w3QUVUS1JmdmZTemMvVVNkRlFEdUpVV2dDZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfb6653-d2e2-4788-df0f-08def7bb2648
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:13:50.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2cRwqeVKFJ0mnloNj1MW+UMtTle1+O+yrCE70A53dPfxRkvCBpU7zOpZab47SIQElGaG81PbkhtzuCsFP5YaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9419

On 8/11/26 16:53, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 03:31:03PM +0300, Daniel Baluta wrote:
>> drivers/soc/qcom/ubwc_config.c calls qcom_smem_is_available() and
>> qcom_smem_dram_get_hbb() unconditionally. These symbols are provided
>> by the QCOM_SMEM module, but QCOM_UBWC_CONFIG can be selected by
>> DRM_MSM even on non-Qcom platforms (e.g. with SOC_IMX5) thus resulting
>> in the following link error:
>>
>>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>>       reference to 'qcom_smem_is_available'
>>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
>>       reference to 'qcom_smem_dram_get_hbb'
>>
>> Add static inline stub definitions for the !CONFIG_QCOM_SMEM case for
>> all `qcom_smem_` functions in order to fix the issue above.
>>
>> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> ---
>>  include/linux/soc/qcom/smem.h | 51 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
> 
> I think a proper fix would be to relax drm/msm dependency on UBWC_CONFIG
> (limiting it to ARM64 && ARCH_QCOM) and letting UBWC_CONFIG have strict
> dependency on QCOM_SMEM. WDYT?
> 

Yes, that would work.

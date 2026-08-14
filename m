Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1323438B2
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689569; cv=fail; b=pmb6tJNRYjyBTCJA/YU9V4q0jN+VjxmYAjuY4Ei8Ww6zSXwJ1KG8p4obHwTAc4+LTiQCydJq0jHC+wJD/7S5HSavAAdrUJccIGZOOtlD7ktJuvtB24LOnGBK6QkOB78jnnEp7lmQKr/RUL4BAC0/NhP2wztaRSjfsEcmU5Z09eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689569; c=relaxed/simple;
	bh=DFJpWp7ceWCM4u/iExMRAAxp21VLwC5FAPeCqa2ahMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZlrdkRYvJgCaFMVeczZvHN6VZ5hkou5WWJ/5oT0VqL2/dEIXHCpg6SMJlDSFodBSGI3n/QVMxy1c4Dxvnx4C/2U9Qt4ogIc7hb2oWP6uYI/VGU22vDOY5rOEo/zjqLQAbosT7owhf2qMUYmtiXd8SbhSI+BTAtBRjCRvAyyOJNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qBabHezu; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qBabHezu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+zX831ZJNDor7BI9wmGFGIZLEK0vcsw/zJi9Px1bejwlGFzdCL20noRM4XxjRSme980sEe8pZ95qJvYc8Gg1TsUit868T9Pbqmh0phzEh+srmoUqFkeoPrebQQlJMqc/A6pEtXPThFpicrB9hiFO0ZnxdCGe53Bo+jmi+/EiuDKVIQxn4cbWigzyr5AxwZgr2fy6PmewOf5di/wljtfXP0FZyBLGnF1OnH5dywE5XKZF2dHeb/vrxusbQz44J448zdhQe2USCjuOmWSZO7/1JZpzt+S2w8ADwZpAHdpVltlD3Run6Me19jeIcrGrL7DwP4GqgXGXId5ulM6vRNhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeunBTftT7FBCres04xjEE76NlqzH62MUILxNKNVZt0=;
 b=KAuaux2oNW3m1abZJOLSLVQLtlrKTbMWHvXn5GsdYrOlIS5l0cS5d6uheXgJdZftfo6/Gk08D7sMxSrGSvhYKGiePM0F1oOV/L05tymSPzXzSQDQctldHb/AL2TbmBODe+aOFC6uWdpQPgc9NUPM8ILPV2b9rOwK4BD1slm6ucI2CciH0wIxp85WTz8/clmC4gQIEOqURS/90aor4AKVVYCilfuzNgkrDgzA3tDIioHWQtE3rbTAPYmCZfjEzEndD7yuPhyQXojFHlxUEDhgScFO5003DZ1rr5pB3m92ZtKu1MpwAmw6x9MbJA239y/kkx8GMUpziT8E/siAHy1YuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeunBTftT7FBCres04xjEE76NlqzH62MUILxNKNVZt0=;
 b=qBabHezukbY6P6Ci0cQXXeJRJt5sb7tlhT6jvl4pilpLz1Zm/jitSLLXxPBANQmHDE3REshr8DK2CbVSgYfa1zMi9F7kH9klSeWPpPb71XEhNvtA6JwKBObaqttN45NBV/8nUnSd303TuMAMp579rcimgLcKPpXTKCL6fydngmy5/q93U1A82SHlQOv378lYXwQmAgW70Y7FjUQhpo2YVTwn3T2O0f5vw7bnB0PCOiLBMN2ToTneQDZIEOd5D8zv9t8ow1iH8EtBtsse+hkYcSa2GnuU8h5Lb1QK0ZhN5aUTuNA2LPfz9pdHzjwpJcm+SPQ4YoZ4AewGI3koW7c2Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 06:39:23 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 06:39:22 +0000
Message-ID: <0b9128de-e2d9-4271-97b8-9fa0c7f6fa3c@oss.nxp.com>
Date: Fri, 14 Aug 2026 09:42:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] soc: qcom: ubwc: Fix link error
To: Nathan Chancellor <nathan@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
 <20260813232350.GA312295@ax162>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260813232350.GA312295@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0033.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4a737f-cc5e-4499-6a05-08def9cec694
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m9rFu7VnA5/hQ5n6xuvQGl1hOwmFMm+wroDda3vTweo3ghDv7hNhFWaRbHyai0L5xqtjEbmD/spsdkOid9ZD9GC+lSPNRIzLHuZfS6mNFT8VxS1rdFkJkW3pVIHmnjOKjLDZs6/SUPGEJ4HBSwd7ktJwvLVELP/Lh5txBTx4ZQfd42sZjazV0/kLgUCDBr7x4RElWrWZjhFNDjFLi+Ca/2he6NVKlI0RUlWuavarzgJKLi3topt/ybLzX+Ry2/62kKlo+yNopWB7Iaxbr0u1w+Qrd6WjzKw7hAKZ+3KrFygb34G4RBGb0B/YFowejN5q45HZnDaViNcNOAqgG8kXFziI++Bx9lAVRCfu9QUBMjm3PjkMu9HKI5ujF9Ba9f2nkyua8AiqrlTQ5NPzaJqfGk9SdoIqmv3j/d5tBNPKqFvagT7t4G6Hm4deql/ntykEUjuAzU2yTI1YbOrGHmwz6rf1AbyensBz/rbooQTaCx5V/F+faV2l7yWqSgOlS/r9r3x/ONUVoCPyKkQprZ7NZUwUrONUFHPYDe1IatnTTDAhvR1yNfdU4HSfH4hVUWfH7F2wnb2eb7oufKm3fOaXnHpAjyowlG//wZBf/nrfK4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2kyUjRvMm9ET09qbFlJZWVYWnk4NTZVMmhZdWhLWVZ5UlB3b243alIwbStL?=
 =?utf-8?B?UmJoZnl5a3BrUGt3bXFDL01mcE91VHRQTXhHWDdxbjBzOGxyY0docklZQVZJ?=
 =?utf-8?B?RDVVN3U3V2xVb0ZmZnpWNmNYd3B6ckFEZmo4V01UejUvd3lXWjFxVWhRUk5k?=
 =?utf-8?B?UWI5TDVzZ2lJbWVJUlorL3U0eGQzYmoyTWxrK0VTTkljaUVQYnJMWFpVbXRq?=
 =?utf-8?B?bVVDTWJzdGEvZnVJQXora2FTTVhsclhrb2dWWWNUdEt5VWpPd1IrY2lRS0Y3?=
 =?utf-8?B?bDdaVmZLWnJZckhaelorbVdhM3EyRTF2QmZXWTUvVDE3UjRzM3k5ZUp1K1hC?=
 =?utf-8?B?L2VGSC92WDMzd1hNS3ZXcHk0VnZWQmdjZWdjMzhWbjFsVFAxK1k1OHNlbGs1?=
 =?utf-8?B?UEs1aG80aWZTbUJkWkpmMEx5R2sxZ1pTVmpEZWluRTNkVE1xSzRPUmpnRFRv?=
 =?utf-8?B?ZDhUa1hqMGx4OEFIVWxxSTliMEdCcEVKanBIcUc2VkNUd1dFYlY4RkhiZXpV?=
 =?utf-8?B?Y1JlS2k4ekVKWm0ySS9neituWjlIbTdqenFtWXE0M1RZa0x3VFhVVlZhMkU4?=
 =?utf-8?B?UEQ5cnA5L01FSnhGVlV2Wm1zSHdLV0RHSW9qeTBCUFdGaThmbE1WMG9palJ6?=
 =?utf-8?B?RWlReDJnQWpVL3B4Z1U0TVNoVHZHK21jc1lOT3hSbzlQS0ZZSzN3WTgvWU94?=
 =?utf-8?B?VzNES3NKbjl3N3gxb1EySG9hcHBGZitGd1M4SFdBeTdQVEZ4cVBTTDFGUWts?=
 =?utf-8?B?ZWY5OUdublg1SmNrbm03RFhET21IeEQzd2Y2QVRYRVRqNkl5R2Z1b2VsMkVv?=
 =?utf-8?B?UmlvdXFJV1VFY1hEZ3l6NXZhZEtIVjMxcW52bDhkRG1oQkY3dkMvVUd5c0Zq?=
 =?utf-8?B?aGFVUGJPc2pJQjBZWGdOS1o0K2dpM0l6QzlMUXdXNk1uZHR4eWU1bkx0SFNW?=
 =?utf-8?B?azVRNHE0NU5US1NWczBHNTJocTNNRDREdlFjODEzYm1lNjMwSEVuWE93UFk0?=
 =?utf-8?B?WjFhOGh3Q09RaEdlMzJwWkN5VTNjM05WanNQVFNTQ1pFYi9Yak85TGNLRXlo?=
 =?utf-8?B?RFpaei9LVTlDNVEvVE5reExHaFJWQWY3V090WTJDSHlnSW9EVFVkMXBIcFNM?=
 =?utf-8?B?Rzkvc2FlMWlGLzFDOGFRS05SRkhCeWJ5bzJhZ3dXNGZwd3ZvM05kNFBwQmZR?=
 =?utf-8?B?MVJ1U1ZWM2xmaHd0cUR6RU1xQjhyZk5DYjI0VkJ5ZEdndEI4THRBMERKV2tZ?=
 =?utf-8?B?M2JFWmY3T0VhRmw3TlpRRkV5aE9HRmhBS05QWC9kWGM5UVd2UEtEdFp1dDJ1?=
 =?utf-8?B?b25ZQjJiSFo2K28wSWRybE9waUhaZ24rRFBKU0Z0eTErUC9WK0VnQ2dFRDIr?=
 =?utf-8?B?b050SVRpeU0rMDJic1RmMFZZeE1mKzJURFV6WVVKZXBzbDEvVSt5cUtFaURL?=
 =?utf-8?B?Q2huZjkyRjRnMW4xZzlNUHd6em1YYnV0Q1EwTmZBdFlPMjRsS2ZHbHdZS3lF?=
 =?utf-8?B?QnE3U3JhZ3o0b3NLcXRmcUlkOFg4bC9tVGVuWUhrRWxEbnhNUDR2Rm9taEJ4?=
 =?utf-8?B?c1IwWVh3UUNuTVZ0b1VlNmRQMkp6ejFZQkVyR3cyTGFZcnFGUzdMT2VkRWpJ?=
 =?utf-8?B?R0dlb0VpaDZ2N05vcDZHQ1J1UWNPTGMrT0VWWWlPWmJIZnhjYzJSYzRtT2Jp?=
 =?utf-8?B?bXgreTRJcWJ6dHlvUFczMHF0eDFyR2JaZEdCZG5zUUdhMGVpaDhRdmRKbDcr?=
 =?utf-8?B?TGJLZ25sNW03SHEwdWJpTmZ2QlBINW93YmNaZUFJWXFqWlVoa0lCWFE3aFIx?=
 =?utf-8?B?R2dObDNMT3ZGQmlBS3NFOE1TdjFHUGtuZnBSVUhuNTRnTUNHT3gvVjJxck9q?=
 =?utf-8?B?SzVvZXpFd1ZtdUxtQ1VxZkYzeGJvSFpBTjlzUG96RjNya2dia0x5Vlp5d2pv?=
 =?utf-8?B?RFdPQzM5aW9LaURjVlFBTnBCaDBtVTdmdVVabkVJZC9DUlN2SlZRSDUwOWpu?=
 =?utf-8?B?dlcyVEhxc0p5enFIWjgzTGl5dTloa1BOSi82Tm45c1JzS0RTOFlxSWZMWnFn?=
 =?utf-8?B?M3pscFFmbGR2RDlaQXR6djFnTVJ3eXdzQ2RLMVZXS1RMdC8yeVRkZlNsWWJo?=
 =?utf-8?B?N2ZzMVQ5RFRDWXBHNVF4U3BNOHZFMTVWTW03VS9mcFI5ZFVtbDVDM0UyNGM5?=
 =?utf-8?B?ekxEd05uVmcvWkJ6TlR2N3dGT0plNmQxZTRDZzk1bGtmeGlhRi9Ccm01NE9n?=
 =?utf-8?B?Uy93cGVFSWZRcGEvdG1WS2tKRkdKUjF1WEU2bHlCRzRDUFBBM0VCUEZtcjBj?=
 =?utf-8?B?UlVrNlc2U3BpUVZhYWdja0Rmc2hBcTJzSHFrL1JrcjQzQ2V5UVpWZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4a737f-cc5e-4499-6a05-08def9cec694
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 06:39:22.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9iadPnrfngbv/5OGp4IrREnWYcJaEye32AfGmSX6zejMvI7p8L0vuDqHrJ1bNxl8dWRXYubkfbJMyLyqh/bWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

On 8/14/26 02:23, Nathan Chancellor wrote:
> [You don't often get email from nathan@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Daniel,
> 
> On Wed, Aug 12, 2026 at 06:19:31PM +0300, Daniel Baluta wrote:
>> Fix link error caused by the fact that drivers/soc/qcom/ubwc_config.c
>> enabled via QCOM_UBWC_CONFIG uses unconditionally symbols from
>> drivers/soc/qcom/smem.c enabled via CONFIG_QCOM_SMEM.
>>
>> Changes since v3:
>> - fix issues pointed by sashiko https://sashiko.dev/#/patchset/20260812130421.670527-1-daniel.baluta%40nxp.com
>>  - add new patches 2/3 in order to fix unmet dependcy for VIDEO_QCOM_IRIS
>>  - Use IS_REACHABLE instead of IS_ENABLED to avoid the situation we use
>>    some symbols in builtin kernel but their definitions sits in a
>> module.
>>
>> Remark for Dmitry, at this point I think v1 would have been a better
>> option.
>> Link to v1:
>> -     https://lore.kernel.org/imx/1521da8e-18df-4d7b-a255-5ca133bd5ccc@oss.nxp.com/T/#t
>>
>>
>>
>> Daniel Baluta (3):
>>   soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
>>   media: iris: Fix unmet dependency when QCOM_SMEM=n
> 
> I think this patch should come first since you introduce the QCOM_SMEM
> dependency that requires this change in the first patch, which could
> mess with bisects. I would personally add the 'if' condition to the
> 'select QCOM_UBWC_CONFIG' statements in one patch then add the QCOM_SMEM
> dependency to QCOM_UBWC_CONFIG in a separate patch.
> 
>>   soc: qcom: ubwc: Use IS_REACHABLE() instead of IS_ENABLED()
> 
> Even with this series applied, I see
> 
>   $ cat allno.config
>   CONFIG_ARCH_MULTI_V7=y
>   CONFIG_ARCH_QCOM=y
>   CONFIG_DRM=y
>   CONFIG_DRM_MSM=y
>   CONFIG_DRM_MSM_DPU=y
>   CONFIG_IOMMU_SUPPORT=y
>   CONFIG_MAILBOX=y
>   CONFIG_MMU=y
>   CONFIG_PM=y
>   CONFIG_QCOM_AOSS_QMP=y
>   CONFIG_QCOM_LLCC=y
>   CONFIG_QCOM_OCMEM=y
> 
>   $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- KCONFIG_ALLCONFIG=1 allnoconfig drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.o
>   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
>   include/linux/soc/qcom/ubwc.h: In function 'qcom_ubwc_config_get_data':
>   include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of function 'ERR_PTR' [-Wimplicit-function-declaration]
>      45 |         return ERR_PTR(-EOPNOTSUPP);
>         |                ^~~~~~~
>   include/linux/soc/qcom/ubwc.h:45:25: error: 'EOPNOTSUPP' undeclared (first use in this function)

Hi Nathan,

This issue is pre-existing and I've sent a separate fix for it:

https://lore.kernel.org/all/5fy7l6o5nfzclsmhsqys562xwoilbo4xv3af65kcqugtitgltd@3fw2w443pw2g/#r


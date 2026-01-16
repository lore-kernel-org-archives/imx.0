Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370672EB87D
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563419; cv=fail; b=SHCvsVAs3J7mrA208j3XctWq0Oi86ZIs/fb/8VCtvjOOva8NNkHQYWybSszyyk4IeMXQpKp/21Y5xWUa/w0w+GawhcktvMHlXZ4wYB9evduW8f4FT1wpKhXWyNBHqV9ZQUoavAy8usrb4Sm6mHKSPpfDj+mKLnZnawwBxt/sIb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563419; c=relaxed/simple;
	bh=pzQ26MejDkSkmDiD7/9modtSQCZR/T3x8iTVgTSRJZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u7jNvFUCEFAM6snmSZMMgQL2R7jHXXfM1hnmDxpcxWs93kBBJQLugZqEjoZWvqOGpi54wtSVStOVs5lCCSydLNluTYciOPGDqVH2dAB3lo/ti87gLnlaG4Of1iUA5u2nyufb0GWfDuAHoF89/UxPTtBYlWdDx+UvBiqUxDLGhFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eHh65HsC; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eHh65HsC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyOBBL+q3ebGtYl6tKwxvMJqgPk74Dlc4hq9WxhsU8uJLvHlqwJavu+rXc4kPTKybCYgRuj49NxBb7WOL7vvVWfXkrAdKDTi6luPoy5hUTEhqCItgtr+yRY2KCGu6poksmTsMn/YncbBguhmvEaC21sCS8lnUHBOycjEEK/CqeWxnbcrdNWnntlUYkqDdZVyCV27QmC1KgddRQoVN/Rs8pelWMC5QM5hJ26Qeva9odoe+3ArtBvoCElZ68d19xa5LAfot4j8gcmZLUU2CcXz01Yg8TMfrNKUp+4F7Kat+cKlCXcY+Qjyse1OkmsOH9BaLXSIyB28uKxm5gvGbYb5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeZDtK6a7hw98tvlNz3RcYkO0hlYv1hVPRyqVAr73ck=;
 b=fusbn7nMWFJaepXu32A2JNSz1NDQDflA7wS3kCCbDyS5cAI+3wb3VGSTL7rwY/Q76zQSa01fw2jv+r1dVRMzx2ktJfUR05SlCcTqNFUwsLkyLgQh7n2dA/K1ItjvRnVlXnItCPkTtjTYdSgSbGdbd+aRUBdP18KUXEOoE37dDxb9kNchZ/yPEzUAr1elvLiqvS9bpfmez9mQsH7T/ptQciefZiWO+RJprZ5fdPCjFhdmMRbpX2jEzpb2/rYjdf+hRp+ErriARmSguNdJVIcEf8U7Ha7fXGExoYSDxuPa9L6Y8g+Ro5UmqnyxKITgyiq/YFOH5g1DNiOVe96z5gipGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeZDtK6a7hw98tvlNz3RcYkO0hlYv1hVPRyqVAr73ck=;
 b=eHh65HsCAQrUIaLnUYi44XVeFI6C6evT9Cx+XIgpS3C83P9P3aXEDdI6IgyRR7Ec1E4SbWqA3HALlUViyJ+3b+QdKpz3yCjfQ5RoMtbwrY9D5eeQTFKZasC4pagJI6RuL11G2hwsm2TwYIz9BuhejEXg8BWlvmGQxsrkwd+qQXCQNYOhFffttV0lb2B4DcyO8ezhS6ZII+P9PGmyGFVtcErMYv+JXD4+1HdawNBZbWY++mAqPzTUi3bpNX/RWG+xAgSdfIYIJ5VShmn8I04ulEpvieggBgXj7vF/4Oj24TdgFzP4aM1H85tLdHSv/E/tCeNYjqGg71kypdtL2L8usQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AMDPR04MB11678.eurprd04.prod.outlook.com (2603:10a6:20b:71f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:36:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 11:36:54 +0000
Date: Fri, 16 Jan 2026 19:29:39 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AMDPR04MB11678:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3863de-0e63-47b0-24a0-08de54f38c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGdnVVZMV1d2SGxZWGxmSlJUSzVOZ2l2ZWVWNUZ0allhcmoyeGxnbE1WcWUr?=
 =?utf-8?B?SkFZTHIrcVdqWU9qYjcraUZERWN3dUwyS0dVMitlVnFYL244ZzFBdWNlTlRN?=
 =?utf-8?B?Zk9pd21ZbUVGSGgrQ2V1S0ZBYkE5TXlkTFErVkFJNUFqdmJzWE9talU0M0tS?=
 =?utf-8?B?Sko3ckljQzNGNWcvZmFrU2p6a0NoK0pXM1FSK2tFb0s1b2hLbjAwS0pYaFM5?=
 =?utf-8?B?ZmZ1REpNWWpleVRzMmVkWWZvRlAxb1RlNVVyWXVEWGM2eVJteEQ1bGRiQjE4?=
 =?utf-8?B?dDVZMGhmdWpwMFA2cVI5UUMzV01KR1ZBYmJQR2tLQzVObzdUM3pCM0xib243?=
 =?utf-8?B?cmluWllib1RjL05JclBKWHFpdEUzcmtKNzllbVQ5b3JPMWg3RVdRdUQ4d1hk?=
 =?utf-8?B?V3doTEF0bXBlRk41Y3M4RW5PSnRVMllNSGhBQkNxckpROEtnUTlmekJaYk5s?=
 =?utf-8?B?RTdSN2wvM0k4SE9SNHhnWlBlSWNBcUpSNGxIMUFHaWFyZUNSOGFBSW5zMTht?=
 =?utf-8?B?ai9qSmk4eWxrdE1QWlVTNWY0YS90MTNhbjQ3bkFXNzVrS0JNelVNK2lmRjBN?=
 =?utf-8?B?ZTRtU0M1SXp5ZjdneU5reGtuOXduZUZPWGZHMkpJa2NSR0RPL2ZZdkdJYVdU?=
 =?utf-8?B?L2NVN0p5R0FHZExkbUp1bjFMR2tNb09PVkZZWGxWU1IzaSthWTVuZG0zamN6?=
 =?utf-8?B?VTV2MTU1aWFOa1YzRlBRTmVtSUNMZERlMTdkUEpVa3RlWk9GRGtSbTh1VmZS?=
 =?utf-8?B?THNlZHFqS1JxTE9JaERYcHRGckhpZFhHU2ozbjZ4QzlJcndTaGpaalZtWHZW?=
 =?utf-8?B?QU9jcFZObUZycElBQ3EydkdnR1J1b2crZWMvVjFxVkZDNkJWZkhxcG1PTmlY?=
 =?utf-8?B?V1hlRDVSQ29EZW5SOGU2dTc2RHQwcGJyTDlXbUhRVjdHcTQwSFNreHhjeGdV?=
 =?utf-8?B?ZGpBaFlGZ1gramhOY1NVNG51MURuNGdQSEozUlNHeHFKSUIrRU9IV3dnNmV0?=
 =?utf-8?B?TENvQzBqZWxjK3FITU84eVNxc3Z1TC9KTlFvRW5PeExkVEZFZE94MDc2VERq?=
 =?utf-8?B?ckdOazRueHJ4MkE4Rk5vRUZhbmRIcjZTdjZ0Q1J0dklCQjFsQ2ZmaWV6anAw?=
 =?utf-8?B?ZUt1UHNHdnlHNnAxSGtERzFGOHZUTVZTbkpJRGFpR3l1aEhvaUM5Kys2LzRD?=
 =?utf-8?B?Mkc0SUZCMjI4OEFwZ3BiU3QxMUllQ1lKalpwY0x4b0tyL1Eyd0NvM3ZoZXFG?=
 =?utf-8?B?eEMwQWE1MmQ2M1VhNm5xcjhxbGdSSTRXNnA5V05UYWFrZng2aC9Vd3Q0VjNQ?=
 =?utf-8?B?MTlyYzJ6M2JYaHdrK3VaM0tOUjM4Tk4ra09RSEhycW5NVDlwNnpuaVpwbXlU?=
 =?utf-8?B?TUViV2FzbHZoc3pFeXVybkNpYWhsYUhtL1NCVDU0bEU1VTlnNW9Db3d6UmZq?=
 =?utf-8?B?QVAzZFZoVmpTVTRlNEk2Vm9FMm13MVEwR21acjNjZ3Z1VFRwbXJaeXRmRm9a?=
 =?utf-8?B?QTBBeFcrZG1YS1QxK1l5ZERxVnVIY3haZzE1ZG9XMkwvUDg2SmMvcWZ4QUxk?=
 =?utf-8?B?RlhiWEppd1lyL1Y3WUEyemc2UHpDY28zRGpiR3BQVU9waGh6MHYzeXh2Zi9x?=
 =?utf-8?B?anVLSUNGeHhDd2J1anJBdmpKcUdUTHAxVWd5YWd3Y3o5L1dBRGVmQ1dzRFhr?=
 =?utf-8?B?eCtzTkoxMXYyOVdyb2tZUGFlaFdTT0ZrdjI2S3pGUWZUbVR5TlpFeHl3Tzky?=
 =?utf-8?B?dlk0LzVPMmRnVGZ6OFJ3ZkpDNEJCMnYzeG0zcE13cW5qSEI0VG5NZGh1V2pw?=
 =?utf-8?B?cVFjTnRlaVNaLzdBdmx1UFFDU0lmNldaekpUOUU3ZjVTTGxzeVBoWTJWdHVq?=
 =?utf-8?B?RWM5SWc5aTlUV3RNb1JlSDRQSUVtbFM2ZFlNVElXcmVGcVlRdUJ3dGE2QjhC?=
 =?utf-8?B?ZnVXNXBkTHpIR01iWjRXcy8yUmE3ZzcvaDVHMFhmMzlhZGJrODg3Q0k2WkRt?=
 =?utf-8?B?bHE0MkVQV2VydHZsZVVtcDJabUF4alI0a2ZSSHBEQXBDcTdsSE81SEtIYVN4?=
 =?utf-8?B?b3VxSlQzOWQ1SXhVTFdNMkxLekxuZXc2YlQwSWR5cE5xUFRLV0VtME0xNWlD?=
 =?utf-8?B?MHp1MDBZaGlteXgwL3loZGRnTTRBaWwwMkNiNzJTRVVtbnJTWXlCTFdnU20r?=
 =?utf-8?Q?z40aMCiCBAwV54iyjtKQ3RU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJXaUhUN25WcHRWM0xsbzJ0SlJ4WHZ1ajJUaUhsRlIySXJxK0dUOHBHVmRi?=
 =?utf-8?B?Y1ZvZ0p3VmtuakJrdkdneTA0Qm5Lb1huL3l6bWZOWm1CYStpeUs1UGZlaVEv?=
 =?utf-8?B?cXRIbFVBMTB6UGtiaDdtb0FUVE5RZFZRb0V6OXRJWUJBdUJ5UUI2Z3c4aDVi?=
 =?utf-8?B?RjNqZWRGTDRGUUxzM3V4UG9acUswU2NodHp0U1p2RUFKRStSQ3JzZVRxcGdu?=
 =?utf-8?B?V0o3TkZqWXBvUXNFRjBMaE5FbkdnRzJlVUFOVUFWOVBEOEVxS2JtVHR1SDF4?=
 =?utf-8?B?cG5KSWlkZ2JSWk1FbjhFYmlsZHVRSXM4S2hHR1VnSnB5OGlQL29xV0RkR1ht?=
 =?utf-8?B?T25Sc2JTOUZ4cHpHYkw3MWJ5bHRtWFlwSkgrbzZhNUw4S2N4aGtvSkNUZFZs?=
 =?utf-8?B?L0poTWVQWTZVdlNlaTdaRFdVQ29KQlRGeFV4eEFSOUd3VzBCeVpOUE1XUnB4?=
 =?utf-8?B?VEpyN3pVSEZ1SytPelVIMkdvTTRQckFCUHE1anNPQ1RhR09HTFBOWFZ0Q2h4?=
 =?utf-8?B?ZTliTWM5aEplQW9uM2JlZm1RU3R4ZURCVGlxeTcvUFFpMTh5ZnRadE5Ibnh0?=
 =?utf-8?B?YURhS1U5bGt0MTViTGFrV3EwdEtITk56NmRRQUxVY2Z2T25kczhqOEk2MFdY?=
 =?utf-8?B?QVpFZHIvRi9EWFZ6bUxpUlV6WVl0TUtkdDExdzhWcVM0MmdPQXhLbzh1c0J0?=
 =?utf-8?B?YmljYkpFVzA0bU1pQnY2T0gzN1ZCWGhvSnV1YnU3bXI4cDlJZU1sKzl5VEZX?=
 =?utf-8?B?U2Eva2J5MkFFbytnVGlvbURNZkh0bklSekZYNjIvL2VHVjNFb0pRWURYcXV1?=
 =?utf-8?B?SW8vd1FoSEF4YzZmMzJHcW8yK3MzcTEvVUtkN0ZYU3hXcXV0T0ZOOHZ3TTB5?=
 =?utf-8?B?Q2laY1NoT0QrOXhheXlVRmx0ZGhwWW5jY09vL0V1L1U2SHBQU3QwZmZOTFJP?=
 =?utf-8?B?OEQ4ajdOQjZxSWlPQ3lRQUNkOUpTbWFSK3ZGZlZxSTFpeDdYQmRWaGhaK2Ez?=
 =?utf-8?B?WjhpZWMwU2RMY2JDZjFXMFltVDlSUFVDVEI4V3llOEx2b2tXYWIybWVYNzRS?=
 =?utf-8?B?RWt3VElMS3ZpcUR2bkM1OEhQZWhFOWVsQmxuQzRBaG9VbTZSNGxsd3FwVS9a?=
 =?utf-8?B?SVlLM0s0TW0zWTJkSHpkY1FqT0MyRlhZUlh3Wm1GWlRtb0NPMlV3VzVDRExy?=
 =?utf-8?B?Q2xZczVQL2VVcWpjdGVGWThFcitKV3N2NWtpWkViUDl1Smp2QXpRTFNEREgv?=
 =?utf-8?B?eEpobE81ZXhpSmdiNkxOUUVuR3A5S2pzU1FGMS9PSjdtVklBYVpVQ09qSjly?=
 =?utf-8?B?UVZOWjV6ejNSZGNLQ0JxSFpRUWQzT1NETnkwdkFNaDBYY1E5OU9ZMW4zQVJh?=
 =?utf-8?B?NllLZVRIYlpnQVpJSTBBcml4V1JWTjJQRVpMaDBEMTRxa0VlNEpWcEQ4cVdj?=
 =?utf-8?B?K0srdWZhaWE2dzJzMUhybyt5dzd2Nkt6VXZsbzQ5VHJXeVRMVVBRTzFjRmVz?=
 =?utf-8?B?VDRmR0Y5MjYzWUVhQVJ4em5BanVlZndxcThVdGZpT3NNL1dEdzdEdDZEQUlz?=
 =?utf-8?B?NlFkV0c2TWhaQm42dmZ5VVZVdTFQWXRhclZUSURkSmVwWWlvd1hLTUJNclpv?=
 =?utf-8?B?azJkUHhkOWxJQU9WS0VNL1hTTnd1NXkrWFovSXZBRlBTbkJ1YWdxL1VkS3RQ?=
 =?utf-8?B?YkpxazNneWZPQmRESkJqS0phRFBiWXl1bU9TaFE5YzBldUFDZFM2VXFmMlBK?=
 =?utf-8?B?ZkZrSnk3K01tZ3pkNHQvZVM5QWI5QzFiUjU0b1pzZGwzRkxqNnhBTWc2OGl2?=
 =?utf-8?B?VUlFK1ExSFBJUStJbEZkajJseGVDZG5PclZRU1ZCVHlmd2ZVQnhMMzh6T3Ax?=
 =?utf-8?B?dDRDOExNd0c0LzNONWdWdVJvVGFiRzFjd0JDd1Y0OGNnR3l3OXIvcXAwM0k1?=
 =?utf-8?B?OUxsQXlMQ0tsSGF3cWljVElTWWdmWXVMc0FvaGR2QU1pa01vNGUrUTNla0Ft?=
 =?utf-8?B?Qk9XcmltTlJnV2ZjM1h3RC91a0EwZ1IrdjlnR2lpRHQ5UVBFcmRsZ2pTL1F6?=
 =?utf-8?B?NWcxSDFLQzc5aW9YbWpNRDlac05DYzNDbGg4T1pCUW1CNlBmdFZKVWZtOVZG?=
 =?utf-8?B?S3RIMm13MmFRVDZwYzQxUkFidnpkVjdtRUdoMkNNd25kR2dWdHdOL2RWUTFX?=
 =?utf-8?B?MEwyRUw1SSswWWYvaDdISkxCZEwrNjJqN0JJTVpXdVBZZkcrRlp5bnYwQzBa?=
 =?utf-8?B?dmQyTFFzTmowejVNZ052SEdIOG1GMGp0R2hlN29JK205Qzk3eXo2SGdIdUdq?=
 =?utf-8?B?S0M4SElrcUwvaFEvaE9FV2grUm9GNForMWQ5QWFPTmUzbjJVemU3dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3863de-0e63-47b0-24a0-08de54f38c86
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:36:54.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rR7o5TBlNpoDEAbheP1xput7ArWrkies2jqUm+u0gFyzzDm0yDXUGfmoUxC/JtQeL7I+02U3/7Q+uMGyv4+A4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11678

On Thu, Jan 08, 2026 at 10:43:01AM -0500, Frank Li wrote:
> On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY[1].
> 
> 
> > While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> 
> Simple said "Export these registers by debugfs to help PHY’s diagnostic."
> should be enough

OK.

> 
> >
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> 
> how many regs? how about create file regNNN,

From 0x0 to 0x201F.

> 
> cat/echo to regNNN?

Only regNNN seems not convenient to dump non-fixed number of registers.

> 
> or create export file
> 
> echo 100 > export, then create REG100, so can use cat/echo modify it.

If use export, it seems need a place to doc these information. It's not
straightforward to use.

> 
> 
> >
> > Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v3:
> >  - add documentation link of registers
> > Changes in v2:
> >  - correct copyright
> >  - add imx8mq_phy_wait_for_cr_ack() helper and use it
> >  - use DEFINE_SHOW_STORE_ATTRIBUTE()
> >  - directly create debugfs file under imx phy debugfs
> >  - remove debug_remove_files() since the phy core will handle it
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 180 ++++++++++++++++++++-
> >  1 file changed, 178 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 95f9264bd0f7..e11054f6673c 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -1,10 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > -/* Copyright (c) 2017 NXP. */
> > +/* Copyright 2017-2025 NXP. */
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/delay.h>
> > -#include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> > @@ -57,6 +58,20 @@
> >
> >  #define PHY_TUNE_DEFAULT		0xffffffff
> >
> > +/* PHY control register access */
> > +#define PHY_CTRL_REG_OFFSET_MAX		0x201f
> > +
> > +#define PHY_CRCTL			0x30
> > +#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
> > +#define PHY_CRCTL_CAP_ADDR		BIT(16)
> > +#define PHY_CRCTL_CAP_DATA		BIT(17)
> > +#define PHY_CRCTL_CR_WRITE		BIT(18)
> > +#define PHY_CRCTL_CR_READ		BIT(19)
> > +
> > +#define PHY_CRSR			0x34
> > +#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
> > +#define PHY_CRSR_CR_ACK			BIT(16)
> > +
> >  #define TCA_CLK_RST			0x00
> >  #define TCA_CLK_RST_SW			BIT(9)
> >  #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> > @@ -118,6 +133,9 @@ struct imx8mq_usb_phy {
> >  	void __iomem *base;
> >  	struct regulator *vbus;
> >  	struct tca_blk *tca;
> > +	struct dentry *debugfs;
> > +	u16 cr_access_base;
> > +	u16 cr_read_count;
> >  	u32 pcs_tx_swing_full;
> >  	u32 pcs_tx_deemph_3p5db;
> >  	u32 tx_vref_tune;
> > @@ -411,6 +429,163 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
> >  	percent = min(percent, 100U);
> >
> >  	return (percent * 127) / 100;
> > +};
> > +
> > +static int imx8mq_phy_wait_for_cr_ack(struct imx8mq_usb_phy *imx_phy,
> > +				      u32 stage, u32 *data)
> > +{
> > +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> > +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> > +	u32		val;
> > +	int		ret;
> > +
> > +	writel(readl(cr_ctrl) | stage, cr_ctrl);
> > +	/* Wait CRSR[16] == 1 */
> > +	ret = readl_poll_timeout(cr_sr, val,
> > +				 (val & PHY_CRSR_CR_ACK) == PHY_CRSR_CR_ACK,
> > +				 1, 100);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (stage == PHY_CRCTL_CR_READ)
> > +		*data = readl(cr_sr) & 0xffff;
> > +
> > +	writel(readl(cr_ctrl) & (~stage), cr_ctrl);
> > +	/* Wait CRSR[16] == 0 */
> > +	return readl_poll_timeout(cr_sr, val, (val & PHY_CRSR_CR_ACK) == 0, 1, 100);
> > +}
> > +
> > +static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
> > +{
> > +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> > +	struct device	*dev = &imx_phy->phy->dev;
> > +	int		ret;
> > +
> > +	writel(offset, cr_ctrl);
> > +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_ADDR, NULL);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to address reg 0x%04x\n", offset);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy,
> > +				    u16 offset, u32 *val)
> > +{
> > +	struct device *dev = &imx_phy->phy->dev;
> > +	int ret;
> > +
> > +	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
> > +		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Address stage */
> > +	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Read data stage */
> > +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_READ, val);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to read reg 0x%04x\n", offset);
> > +		return -EIO;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
> > +				     u16 offset, u16 val)
> > +{
> > +	struct device	*dev = &imx_phy->phy->dev;
> > +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> > +	int		ret;
> > +
> > +	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
> > +		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Address stage */
> > +	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Capture data stage */
> > +	writel(val, cr_ctrl);
> > +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_DATA, NULL);
> > +	if (ret < 0)
> > +		goto cr_write_err;
> > +
> > +	/* Write data stage */
> > +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_WRITE, NULL);
> > +	if (ret < 0)
> > +		goto cr_write_err;
> > +
> > +	return 0;
> > +
> > +cr_write_err:
> > +	dev_err(dev, "Failed to write reg 0x%04x\n", offset);
> > +	return -EIO;
> > +}
> > +
> > +static int ctrl_reg_value_show(struct seq_file *s, void *unused)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = s->private;
> > +	u16 base = imx_phy->cr_access_base;
> > +	u32 val;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < imx_phy->cr_read_count; i++) {
> > +		ret = imx8mq_phy_ctrl_reg_read(imx_phy, base + i, &val);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		seq_printf(s, "Control Register 0x%04x value is 0x%04x\n",
> > +			   base + i, val);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
> > +				    size_t count, loff_t *ppos)
> > +
> > +{
> > +	struct seq_file		*s = file->private_data;
> > +	struct imx8mq_usb_phy	*imx_phy = s->private;
> > +	u16			cr_value;
> > +	int			ret;
> > +
> > +	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return count;
> > +}
> > +
> > +DEFINE_SHOW_STORE_ATTRIBUTE(ctrl_reg_value);
> > +
> > +static void imx8m_create_debug_files(struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct dentry *debugfs = imx_phy->phy->debugfs;
> > +
> > +	debugfs_create_x16("ctrl_reg_base", 0600, debugfs,
> > +			   &imx_phy->cr_access_base);
> > +	debugfs_create_x16("ctrl_reg_count", 0600, debugfs,
> > +			   &imx_phy->cr_read_count);
> > +	debugfs_create_file("ctrl_reg_value", 0600, debugfs,
> > +			    imx_phy, &ctrl_reg_value_fops);
> > +
> > +	imx_phy->cr_access_base = 0;
> > +	imx_phy->cr_read_count = 1;
> >  }
> >
> >  static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
> > @@ -731,6 +906,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  					"failed to get tca\n");
> >
> >  	imx8m_get_phy_tuning_data(imx_phy);
> > +	imx8m_create_debug_files(imx_phy);
> 
> where remove debug fs?

phy core will remove debug fs when call phy_release(). 

Thanks,
Xu Yang

> 
> Frank
> >
> >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> >
> > --
> > 2.34.1
> >

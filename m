Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942FD2EC0A4
	for <imx@lists.linux.dev>; Thu,  7 May 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169815; cv=fail; b=uHFzNwP//zQ8LcBrRbnDN2PnlBdl9x+LqMhFUF7dhr+BG/1J2vVSLvCcVFB7sI1ntVh/pq07YBYWq09FwjU40dhaRaZaDIDuJFjgv+iyIDTjCLYvnwsOYZLd0iFLn7k2jT1w/tdGAsjoBZVmK6wAgZUx+pNae1M+T3+KEYDsS9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169815; c=relaxed/simple;
	bh=+fjQbtB9pYD7qCG5j2zjwmFxVwu0s3iHNrUIP81/qQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=JgChV5+770FhjTp2uVcDbquIxw9ytp7f+j1nBz6LEp1knXh44aOW4Zy+f38oy5ZhP+df0WxvdDyxafnkj3AKkHw/x5JMKxc64tofQf0mgn/iQnX0H42HWuBiaJmZsywTZUY3FDcQY4eZU20ZJuPt4E4mB/jmlzuEOHbRygShML8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dQuFe2ec; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dQuFe2ec"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIpDuTZi/wz3rh0z1UWWQk4sDvrfjdf1ySL2ejuA7PzKHUBgQpc7Ah1HLvl/gMl7GiIPXCKtVJRYj4SGN7Q776w5uNPbilVOghviYxHZN6yRrmqRWXIEgfiJO94oAq80zUy+jc/8dEs/v1/aPGCzzVbkQXSddue+BITfZgPM3R+oD49Ivc+4AJkbd74ndiHv7mSr7yoMwoAysrY2MpHW4E5Wv2sHVaHy9W75xSVREkKnpWW/1bAOgPWiAdGg3WvMYbKdFnx/VE63bgy26Cvox6/VC6BxJcSkGhFMu17rLuDqwksA1ecliBCW+UVmGUxVRAtXKQyjzt0G/nZBLhj8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNwHnQaONgoLcqdrTrHJ1DTeYxhEylonw73C3p4qkhI=;
 b=n6goQ5Ddx6516jjWDTKD3NioPbWhhEJ2amQNU/v3jLUa9SCxvms3NHvWD6NQq3AqUcqXloFehSiT93oBfalcXFM8GiZJbfkhhhuYtYg28djgkwwU8rrMtimabJhJPoiiuAD8ZyCL/WU3/pAHyO6JxFtEcMNmi0vh6Lx4Z6O5s/UGex/BOKT/qnzHPllNwrw0jMOWl+7K/Wx+w93Q/uhDA5XpRKVMoi30mYUEZemsGIuuSR7r15c7rE2hwweddcQGG6vNCwjGY5yg+IzhY1hb293xJDEX14gQA5rBN4UAxcgBNzu/RXPJgyS54Jk3pcgp5EF6Tcf8wLk1izMRmmSAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNwHnQaONgoLcqdrTrHJ1DTeYxhEylonw73C3p4qkhI=;
 b=dQuFe2ecVHUxNNFn9an85tBL6gJQoGpTLq51yc+WcUJ03jO3kccA6160/Vh41H7zf+rk8gxJ59xLV8CL0wONq9thzm5IVQe8bODISLhK7aGAjfG1GZI9Txdoiq4qhSNgClB5BrUNf+jBbVfFQTPxQjRk6aeH8Sk4DtLjQa8E1InkFHgLseDVrl9N8+wV937dhzcnLGmdI/ps2Ltof9OgQvkqYVfl2bg70ufH78mceoAn/cgjDrIQ6tqz9X6P6/5aQcPffZOLMMraablFQkMRYqwev18cRX8mnfLBOUdEmFsV7+RCY/do6k3HL8iwa1+CuSoNMjUxqw+XZ30K7kmL0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 16:03:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 16:03:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hongxing.zhu@nxp.com, Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260507065330.516142-1-sherry.sun@nxp.com>
References: <20260507065330.516142-1-sherry.sun@nxp.com>
Subject: Re: [PATCH V4 0/3] arm64: dts: imx: Disable PCIe by default and
 add overlay support for M.2 connector
Message-Id: <177816980694.338814.8886539511728175045.b4-ty@nxp.com>
Date: Thu, 07 May 2026 12:03:26 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:806:125::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 0563f53e-8201-4c4d-19fa-08deac522e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wjNo1l0VweYk7I6TmjnToaSBsF83HO9ZG0xZFxGWhMkhMTOQ6MBpdjCCH4mmyvcQQb2zGeXCanl09bDa+3Skpuhde3AXBVHhR/R8X8KnKr7nqGsAdE/3LY3jMHfDsmxNPj5OpTEZ8q2UXpBfgcLUsSADdEdF8shWGYNulFDNAZXy8JSuLNqQ4JPlLR4MZdxZxFz5LnEgUpysX43RsLdMTReHS/JbTch64I8dzsfyQN3kVkx3gQue2Ie8L/u+2vtaKAJ7K/mncGybAU4XmX8LRxlIdzPxaswbt3jLU3W80lTlwTly/pHzNUCk3KUKh596R3ZzGk4g0VRUMRLaupOaa8oPkyySztdJjTUpJ9aTl5nqyx8PXRQ2ilOTSiazcjJtmro/t0ZB3z2yKPRUQMHbAJLdyPjQXGk0JQ771QfeI99bClZds4ZK1djMw8Iii38U6Vs2FRxqZgeGh5/DiM+9s3aorWBGSDq3jcUgwe1s8U+NQr4fxbGPgVdLk1nbd/1+ju4zZgsJ20sJB0vjKIxOW3xLhE0a/aA4LB3zO1r5RPqveCyCmdeIiHi0l1TUoBs6DPBo7WDjai4DNE+8KyDpZb/JDAP2rTIMZUvsrZdSIMGjPBMav7oWilr1Flpm3OW8kSmg5Bmy4bCVxSo8ezXvkm/4SBzScPgUMVB9adJCbhaN6R/gm1cyo8xA9s0OXrhqLFk/h6CBYJ7BgdtEZka1vrc9JuVwJyBjIDy4V6ZNhuZmwAnVWMEKmRbYg21XD4B2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlVidml1V3U4Slp1ME0yNFFKWTdMT2t2WmRablpCY1NrMXRrTFRuWUVLUmVP?=
 =?utf-8?B?MElZbDFJTXllQUhJMmVQZjhodHFFaVdXMFpQNEttdkhKeWRULzkrTnJ4YXJI?=
 =?utf-8?B?ZTFQSk5pYVdwMmxtYitQd25oRW4vYTY2UGJyRWlVLytxYzlKeFp5TVJHMDNv?=
 =?utf-8?B?VDNTblZqNGtlR3dtZ3Q3VXZxWGpKSlFvNU5ycUNwTklJeGhTZXJaMFBiZm5E?=
 =?utf-8?B?UStiWWd3NkpHOXgxK24wWnhLQ1JYRWZrTUhTeTFpYlhZVENKN0NqUUxxTWJu?=
 =?utf-8?B?aTQ0MTk1WHlMNWtwSEZIUVRKNEtSRjEvR1greVdXOXJaZHo0SXlFQVhaQWYx?=
 =?utf-8?B?dXlYekd5bUFpTHlsWCswcWZybXpabEY2YUtFVmxLNktMdmowQk5qZXRnQ3k5?=
 =?utf-8?B?STVTL3FJd3NKQjlHaEZCVU5maHZIdElzdmE4cmt5N09UYTIreFBuay9jSjhm?=
 =?utf-8?B?L0dBWDd5OXJVam1RVWpDVHN2cm82T3o3R1YrSGx2bmkxWnpMeFZDVDQ2akM0?=
 =?utf-8?B?aFQ4U2VURTNMVEd2aDZwb0ZHa3J5MWY3b2YwYkM4a0dubEIrOElncFpCK0lB?=
 =?utf-8?B?NENRS1pQSmd6UXNleHFmSjJobVMwNHNWQjg2NVZyYVFlZkc5eC9HSWM5cXlh?=
 =?utf-8?B?Um5GZDFCeDBGbVZzREJKZFQ5dXcyRTg2WU5Oc2NJSW5VQndGcjdXZ3N2Wkgy?=
 =?utf-8?B?UmVOeDFmRmVVdmRJNnduRDJJRStOUkpwTHp5Sm9BSXJ2OUZnQTFJRDVNQkl5?=
 =?utf-8?B?UUwyOWlhTGZsZWRDci84UnBkZVNMQ016NTJCenQzM08zMVg5SWRLT3JaVXlY?=
 =?utf-8?B?Y1pNeDNlWE1CT2s2N1o5WlZ1Y3JYS2Nxb3dOMGZkZWtmYVdqRGxGNm9Fdmo2?=
 =?utf-8?B?bXo0Q2Z1anNVV2ZKYXc0YklEZVRuRk9zam9TQTd6YVlXTDhmVCtCS3lqcGY4?=
 =?utf-8?B?bUdzYmh1czE4eG03VEJoZmZqYjJVVFNBb3BwY0hZZUtZZUNucURsT2NsajV2?=
 =?utf-8?B?UHZTTDNRNENNa2p2b2oreEh4L21XZGc1WjVlM2ZYVjd5Z1pUb2t3bGNmbThZ?=
 =?utf-8?B?ZTRmL3FlTXlLZXNla3Z4eXEzdjNjR2RqZ1EwZ25jbWovUTZnWldNUCtXNGEx?=
 =?utf-8?B?RDN2UW0xOWoycVhGUy8vdDl2bVNDVjc4d0pCNEpOeW1GdEhEcko2ajFCVzVq?=
 =?utf-8?B?ajZWOGZFL3gwajE1dmgvV09jcDNVQld0WnNDbnVkNW85UUxlNnBIVDgxSU40?=
 =?utf-8?B?d1BvZmx1UEFuTXBPTmZDbUdsVXpmcjJybTVhcVA1bzNBUFRjVkVCcGJtN2xI?=
 =?utf-8?B?UWNRRWQ1YkFJcUNPSEFGTFBocmZnNUNCZ2hJWDc0V3lzWktQTVF1cVdXb2p0?=
 =?utf-8?B?bWxFM3o4TzF1d0JvUlBlRnhjK0RTUGJnQUdBZUUyQXNBSHlsMnBjMWpjNmpp?=
 =?utf-8?B?R3BxUnJVRHVIUC9NaXdjeXRLaFJjUE4rMSttaENjcXNZL2JiUUMyWlowNzJY?=
 =?utf-8?B?c2o2TmFUOCsyMVFrcVJkMEo5Z3c0aDRvUjBHa0NHcklGU3JrbEZUaEdTZU1i?=
 =?utf-8?B?VGRBeFIwNUhpY3ZDd3RYWjNCNzIrY0c4bGd6Tk9hVUVsdk02MitIbUd0UlVk?=
 =?utf-8?B?MTNXS2NOY3VZcFZaRGVKRFVyamh3dCtqZXNEWFZKV29JVkFkOUlid2V0SS9J?=
 =?utf-8?B?bCtUTGF0SlRVMU81YmVrdXZhM2Q4Y0o1L3hFeFlYM2E1UWN2c3RpYUlPUUps?=
 =?utf-8?B?OXFhYjJkS2pyQUloNTlXclJKaUo4Z3BBQ1pQWjV3SHhrUkJGZHYwdUNUbEhx?=
 =?utf-8?B?WmNQZ2Jub3kyMmwyTXVpSk9nTDl6QmFWbWpDTGgrRU1XNm5lRnlVTDFPMENZ?=
 =?utf-8?B?WUVoRU5yL1M1UDc5M1JTTStWV3lwUkFCSkE4cUZkbU1JZHd0T0JlSlZ6S1V2?=
 =?utf-8?B?TWgyMENLcWtJM1pKN0o5RmREMVhwL1p0dVZ4MVJjOUxPSml5czMvbFpKOWJS?=
 =?utf-8?B?MVRnK011TG83QzRuZ3lNMEN3S3d0NjYxdXI0QWdiM3JpZ3ZscWg2bmx2dzBX?=
 =?utf-8?B?amJlS2xtejB6NmhMQzFCWkhLZ2ptQ3ZBbVBqZ3VFYm13dER5WlNaTEtTd1Zn?=
 =?utf-8?B?Z3p6OWxOc2hUS284NnZaenZZNHhLZG1IRk1EcHFrVXR5ZVJOUnMwa0UxaFBK?=
 =?utf-8?B?U2ZCVU1SYVVsN2VINGVZUk5GaENza1o1WGgxM1RNZ3pVd1pYbTFiZkpxMjQz?=
 =?utf-8?B?Q3htRFMrNGFJeTBpcERZUjNzM1BTYlQ0YmJZd2oybjNnMEUyTElpMzl4cmlU?=
 =?utf-8?B?Mmt1SGtSVkdETWFSZXhHdTY1NzUzVkpBY1J1dDYyMkhybHpGU3RwZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0563f53e-8201-4c4d-19fa-08deac522e04
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:03:29.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAHe+1JqZrC9hRLoqYragOhYdmJzs1rwH5HwZmEvmqaG0K1qLYVkwueIbOGBZpiDO9hddoUYKkKPEjLlLOoKoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690


On Thu, 07 May 2026 14:53:27 +0800, Sherry Sun wrote:
> On both i.MX8MP EVK and i.MX95-15x15 EVK boards, the M.2 connector
> shares a common regulator between USDHC (for SDIO WiFi) and PCIe
> controllers. The non-deterministic probe order between these two
> buses can break the PCIe initialization sequence, causing PCIe
> devices to fail detection intermittently.
> 
> The out-of-box module on i.MX8MP EVK and i.MX95-15x15 EVK are SDIO
> WiFi (IW612), this series changes the default configuration to
> match the out-of-box hardware (SDIO WiFi) and provides a device
> tree overlay for users who need PCIe functionality:
> 1. Disable PCIe in the default device tree
> 2. Keep USDHC enabled for SDIO WiFi
> 3. Add 'm2_usdhc' label to support overlay
> 4. Provide a common overlay (imx-m2-pcie.dtso) to enable PCIe and
>    disable USDHC when needed
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
      commit: a4e6b9643aa4c6f539afefc9eb4768603853a6bc
[2/3] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
      commit: fbff6c34d9e8a9f010396d96ae627ca04403033f
[3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2 connector
      commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


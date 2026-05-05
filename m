Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99E3DA7D1
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009407; cv=fail; b=ZqRia+RJTOLs/XMzSRquY3YDjEB5Ro95cdxQP8/U/PynZlBwQX00mKwAf6yprDAPoEigmI7liMQRm3MF2dxbXBcZi29M5oqSr69IOWFqkXDhiGoIISmTt898ei807k1tEfrN+9OEz4giXDLvHHYjSWmYFYpX7h8oOpFo+b8qYb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009407; c=relaxed/simple;
	bh=66ptxZ9fG0ORwmGOK7G+Y1/lkjo6+LokVGP9AqdRQf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=pAQ74sa0s5MQdmPwOpZizV77O8mH3O6VG2ue4JDvO0RAXmOpvxuzpZSt3kfnlBhZ5wlqV9fDWaWeq2XKa6FxNYv4y/7VC9UYzmlbN41wurOHTHohgz2dfBiIlfkgPBXF+sOYaWweMsyUbFdzWjePXX+uoDXlJdzm6abEJd9Vrv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Umkdj4sL; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Umkdj4sL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBca1A0adHq6+oUqebd1uY1Odft/a245uCrimLraJHm5nVWyiPBH3aGCfwYS3Sq33UylyK96osYR/yjIgSUCCiCJJNIUeiIzJxBAzxlrdSo28sxsxIvgONUg3XJOEQkzUMGb/Rd03dSYtQO+ndmn05JvPOdm4eVpomzdtXv2tc/iSNjyTPD35sZcekIv84hk2DygYc6r+XtJn188m70bS5ABmnmSzMTzkESXv6wpF098x0VLAovu2X1MQSAdBbl1SDOwL00exHNP3y3gWoyHoBH/EUas1Qspw2So9XMDZiI0Qixf1hz/Cb9XW+tf4Ar0RhF8g47Qitu7GBur3AyhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCo9JcABP4D6uZT4NqWWYO2e8/ykXP++Cu3TkAbCcDk=;
 b=MHYvkxl71bVXXUS6JqPWjmfW9hfRuHCXdJxOiofy9Ui77f0i6f/B8A9ovisaac8u0/rCgbBO842hC5f9rce6vT0xBO/AXYQl1cFqWaHS+Wrj682Q1/Tc/x3A/r9EY37wVmdgyAWR8nS18TepXgownRCVn8vjyi0Is45K2vJPk6fHlfh/fX8h9iZSgAg9D1ZJ4O3IA0k5AOzw7NEIWOBxVhM00HQWhJYeZBv4YZ2jKkR6A6eih3JdrIGZ0KpdsEPWR1Npvwfl6iBsfsb3XaENJdPMIXk4nsUBCMQv2PURTBR7sacXvOclWf3FtPYy5sjtmaurgj4bOTUywrjdTl314w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCo9JcABP4D6uZT4NqWWYO2e8/ykXP++Cu3TkAbCcDk=;
 b=Umkdj4sLD/b2oWJl5LdSFV6rZ8YQgHJOv2IlRH0UGK/nvxKEtikOOYknwEeBSvewzxFkEr0kw37dqF65rBmj6u0/9dYrCWk9HYystMvDfsIprAA9ReQmUygSdAJFnFmH91MzI426w5agKiQuLo3u0HQBhb+LPewTkMGWxiCaNLWSWgOdzekABRMr73Y1xJjN4UaFaVXPF4pWPqcxCGIK7JaIEYXkg71AKToKOHa7uJmAIrBDryaPaUfL3UqR2/8BTzK1TcQG7y7NbGLIPJ0XIix2EYGCqH18gLPU7w2ZH2dex9xB6s+vUmt7EQoDsA+Hmdjxny4mkrWUWgdsxVX7ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11506.eurprd04.prod.outlook.com (2603:10a6:102:4df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:30:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:30:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Yannic Moog <Y.Moog@phytec.de>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260402183626.3284639-1-paulk@sys-base.io>
References: <20260402183626.3284639-1-paulk@sys-base.io>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux: Add HDMI
 support
Message-Id: <177800939983.1956977.15677157068147989559.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:29:59 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA0PR11CA0180.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11506:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3ea42e-b61a-4a0f-8772-08deaadcb3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xm+yzNUuw82aHSr0uvddFXm35mGEWAHA6i4GKhLOY8FQxva89V7o7PpdzRQVciU4/IWj1pRGnfkGcYu3/2lNtRqASYZGRDbuCb2U7ww6j9uD7sBOkU913SNtJzJdm7xE2rTD8+qv6Ve9jBCYt7NWvTlAHLha4KsQgVd2IGN+dFMxzPtSWbquHdIAO3tl7jqfAWgDL6oEl628+VG8L6eb07ME3ztAnRd6XoL0BC3eKO3D131gj++cIeHRR32HBmfiknUagBkqnaM2gZSmy6WQpDGOc69Y1FcGPFDhBxG6fLFwrJ/rZK0w2buLZwWatQ8bBK2vcBm4haDcy3d0h5sqcEmZQiwAUOZvzYNmCQfcrLV0k22W/ZATBQNrWmv4q+jdUMHTe8ShnwLHok/Xk9VQQWgkuTUs1JalX4nzg4Zk7a7hBpjrEM5q04z/l2djJTxc0ar9qSgLE38djS/Y3JafriIGQJ5B0k4QHZWSSwgz02DBt3ALkDySsDL2cxLzF5qGi69vgEJdgdT9bRXvL55ZmT+WbLS/B4lDbrq8fzvgeQav21YWzWAm8TmJnOOypkCYO5tLGc+SelcfVMqkXf2Bbm8KP477DtwOskmbnyUdCZUEcrdSUkJ+9UI1UqpN9mr5/a7oSVyd4obpxyR15M6xblS8ofUshiDoyoFeDfwlR3Llxop06lCtKnleWveCuG57/ZY+EIyrSWjViFXEkyIbyE2GT/zYpc/tUYIr3DBk1janrD1zTjEHgZ2UMnADTnfn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZ6RlVCQ3ptWTJTeHZ4Q1ZkZGtuUnFWMmdMVFNNNVI2RzkwYnNPT25nY3No?=
 =?utf-8?B?SlVMNXNUZDB3c0JGWkFibmQ1UzhmSWVxR25WMDJhamx1QU9GRUtPU3FDN3Bz?=
 =?utf-8?B?YTJuMFpRUlp5b05FcFhUODBObGNIUXZUZVpMY3dpNjE1OWtJVnJYL3F1d1k0?=
 =?utf-8?B?OEdmVXRhQXdteExNaGcrcU5SdGdZcklWTW5nSVdsS2NVQ1hxbXMvanRZUitP?=
 =?utf-8?B?ckJRVVQrV2Z5SzB3bzg1WTIwWklHeUtwSmVsQWwyZHc1aDBkVUMzUEtDUTlY?=
 =?utf-8?B?QUN5b1MzSUpYeVQxbk9PZlR6N1hMUTRsLzc2THpTYS90QU41dGJhbDB5TUo1?=
 =?utf-8?B?N1MwNU5zNlBzS2ZzS2w4K3Z4Y1JjTzZwUnRiY3kxKzY0Zi81bURtdjB4K2Vt?=
 =?utf-8?B?MTNVWHZwY3hBNHhIUHgxaEsvYThBWDdHWWluTFZydVIyS0ZtNTRCWVc2Q1F2?=
 =?utf-8?B?cGRVb3N3VEwwaVRPYW9mZ0FVSjV0REJiRE0vM0Fqb1RSUlI1S1VVcW9HN0tj?=
 =?utf-8?B?L08rbDV5Q0srb003elk5SS94bDBKSGZqSGhKNFV0UkZHSXo0dWtlSzVWQ3Ft?=
 =?utf-8?B?VHRRLzlkc1Q3N0JZOFdkY0pTSXEvaE9tdThRcG5ZK3JCTFFOTjlUWjJpdHFB?=
 =?utf-8?B?ZHB5ckpGK1NIYWxiL2NDenc2TjRQN2xWTGp6OUwwdnpGWWRtK3F6NDRialNH?=
 =?utf-8?B?ZTlYNEUyN1FFdkNtcmRaeFJpeUFpSHZlVFovRkdMNkkweHNXWlFaZmhycXpy?=
 =?utf-8?B?bVBFU3lpZDZEZ3FlMzMzbWdNNlN6WnRJZTc5QlgvS1ZZY045Z1pudnVaQ01H?=
 =?utf-8?B?TktCbngra0N2cFREeE5IYzFMK1pqUytkZzFuYk51T0hwMUt2d3lJNks4enJI?=
 =?utf-8?B?L1N2VDh1a3liblVuMUV1Q1hYZkRsdFpudXpiMWpSRDVMOFRHTXBaSnBEc1Q2?=
 =?utf-8?B?c2N1WFNhWjhLbTB1KzBQN2h1SHhCTUR0TmdVK1pGYVQ4bHN4bFVmdVdQQTNO?=
 =?utf-8?B?M3NRSzZlaTNUWmUydGxXeHRtaGVvL2o4aUN4bmEvTVlJYnZOSE5nSXQ0UEhr?=
 =?utf-8?B?dXRnWUhKK1R6S2s0YjB6b0ladFBXTlUwUForYTVTVEhiV1JhMzM5VTM5ZmQw?=
 =?utf-8?B?NDdnTFo3YkRtSklTblUwT3hSNGppU01sWGhMcG5wRjE1QVBqMVQrOFNpblRE?=
 =?utf-8?B?bmlHQTZieFJtU3hWdlI4aHE5ZC9tQnFNUi9yV1J2RFFycFRrUi95T1lHcFhz?=
 =?utf-8?B?RzJIamxRN21jb1B1LzdENXhMRTlBbFE2ZFlTem5lRDk1ejdrTi9pUjVVbWtP?=
 =?utf-8?B?Q2JQNk9Pai9FZC80YS9FZkQ3aEZXWVVocGRjU3hkUVF2aTE0cENUV1BqT2NN?=
 =?utf-8?B?SWVYbWYweko0R2FhbnhITUJMRENhdlc2R2cwVVBFTGxNTXdFeHY3RWc2SmxG?=
 =?utf-8?B?cmN5TzVtanlYTWpqNDRCNVJpNC9ucDVZaFJZN3pGRXVrZ0REOFY0MWZxaHkv?=
 =?utf-8?B?TjFsKzVrN0t1ck9NT21NUnFrRjdFMnJWa0JuelNiN0E5ODlLRjVuSVpZanVZ?=
 =?utf-8?B?ZDdJdjBKQzBKRnUyNU5tMkRiZEZ0UjFmQU5XbWdMckF0NTZ1Q0RqSTlOQkM4?=
 =?utf-8?B?OWpLMW5VbDRCWExRay9kOFFkaEN0MUpPSGpsc3JhSEtENmxoOFdCTGpwQmdz?=
 =?utf-8?B?T2k0OXZMcWkydmJ1U3A4Z3IwK3hLdit0TkNMSWhyRDZkVzAzWFJQODkwNGRh?=
 =?utf-8?B?SmdKWUZpbzdkQUpQWWVESnMvbW5WMmFTTTBEWGZINUtXVVIxcElETmVEN2U2?=
 =?utf-8?B?bUZSaENvOW1RL0tUSFVGbmt0Ky83Z0hiTzRwUnlwNnhSbFRjdXNhMENUdmVO?=
 =?utf-8?B?Si9lUzg3NGhqeVNCMGFPZ2o0djJRZFh4aytKZE1ldzAzQWdUMmM4ZEVVazNh?=
 =?utf-8?B?MVEzcko3d0E2SUxKUjZqaFRRWEpSS0lDY1pNZlFaaE12S0hJeDNsY0p6Y1hx?=
 =?utf-8?B?ZTZuZ01GS2JBNU43Ym1PNCtsM282eGxvZGVQbXpFR3hjRFZXVFdENDM1bWY4?=
 =?utf-8?B?Y0EzWHdscmJOV3lieUVCcmN2bkZtck1lcXpteDVwZTI1WDY2WkJwWmdqTExN?=
 =?utf-8?B?RmpFaE5NSk4yRkNuSFBZWDZQRVNPdmxFbkwyZWJhUDFqNjl5YngyYUd5cE9k?=
 =?utf-8?B?OGhMWStoYnZJNVhpblNZSm55REtQRDhmYUJiQkJQamF4WE1pWjliZ2QwNGcy?=
 =?utf-8?B?eE40NVdsOEE2UXNvdGxXMXRLUElvMURXWUxTbEh1YmxnY3hJU1BHc3pjQWJi?=
 =?utf-8?B?dEVXR3B4ekR0N3htamZDWDY3bDRvb1BnVkllV1VYcENzRXFUYkJXdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3ea42e-b61a-4a0f-8772-08deaadcb3b7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:30:01.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoyMIZwflNpBdW8gndlQrlXhOf+IE0wgPu27RVlbOrX+HUytnJLq/cyJLPvNtcD1uhMPO7QpBJligIzI6LX1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11506


On Thu, 02 Apr 2026 20:36:26 +0200, Paul Kocialkowski wrote:
> The PHYTEC phyBOARD Pollux comes with a HDMI port on the base board.
> Add the required device-tree nodes to enable support for it, including
> both the video and the audio paths.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
      commit: e556f564a04fb6dd37887b5d098e2a0145f2bc9d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


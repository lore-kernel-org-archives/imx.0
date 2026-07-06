Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9453911AB
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348455; cv=fail; b=i1D2NvOtkbfZ7Giif/QzUAVMhySs4Fpxi1rrRb5jhI9+lZpQrxRdNu8n5dVr29khRPVvfC4tUoc7xMhufCpn5P3x+kLV+dANOs5qgzmQoTF9KLIJeHOa4Rjl9n/WiGk2QyzOBc+LvJWI2DQ+a+ht35sw9dMK3ohsJTo9vN1cCTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348455; c=relaxed/simple;
	bh=xN49srXfW6NIO5Z4h5x+IJIZqnl2kL6Sg2ZSMh1TORU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yi+Dh0QagHE1QdiHaDaoSf7l0nS4DPIyB+o5ZfpoLCDVXVV29tEj2B5H8bRjmIUCzWVSKCKqQ2c8R+oV5v+5CeBImGQPOORc3l1y6sVQXDNJda7buj5MaibwXvkx/1GunJncEv87klWtB8vzs9wsA3oRTHCo2vJ/cnrgahcwpDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WNIydgTu; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WNIydgTu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPc2ErXJCDANmHVyc8fDAeYFhZy9QTNFO+al9W+SjJC3itHu9fx7m8rkxX+KX5cgcN2litlCdvZs4Ynnj/rYXJ67G31e+JJfU+635fn07rUrlVzMJKuVZD2Ps5d78ZwcKuXBZ7fep+IhjljmN1ilHEDssh/KLd+mXEo2IVWpDgXtGrmB7PUl1zkwQuAoxJyXk05TWC2Z/MZrcEbGbGmefDm1nITjIstLFbifwkklav9KntlJJeCdzizXGj3rDIRcF9K8ARwLm0oBeyFnD6rucN6pT9mL9sEXws8rLLtqnGc23PI1meTZx/J0+zuzkS64IYrNZDuC6WGz6/+hFG30og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSQZGRjg5lLnMOYLCUmQsWzLoM89Q+/ECnt37+s2J5k=;
 b=r9xplxBaI0HDINJk/mu6yLsCj4ifYk7mXIJgIiW8A3PbenAin6tYJW9FyoSC5max0MViACCjrfDzYtRAJW/9aDdye7EjhhuoA2+O3JmdofxzJSNJdw3cC+Keqx5BMzhAIj/v8tDxVKnWzc/BjoFDpuLsTrQXSJr0fbIe+3AeboLRJFdopW9uJEmoqJim8Apmtiyoar4tqUNcAu23c1G8sypj+FEURt7CtlIZ61FABU/zlIQGSYfUfak9uFjVHICIfCbr3hauW8XzjrXm8yNLpQyYoZy/MJ61zZ4tp1SjPC7E2w2JB1SzUPwmxrcwAMUmPfQQ4E4zYV1bbrkB6+8N8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSQZGRjg5lLnMOYLCUmQsWzLoM89Q+/ECnt37+s2J5k=;
 b=WNIydgTulqPxGhDAVN2ZSRLBANe6awUVVfm4qFrwMaXEI8hdaR4Fxogi2w5MR+cUV8YQsG8kPXfFL3d/MuQhcYZfQLgV12oKmZeL1JVIkxvjQ8xySyQIvwkcHrDFQzerLNhZRDqeSmSIMOM1M5zdjDdc0n1qaG1SgY6gdLoL9C191cgUmxTZOKlXCXsu8CjUlk3yXSBu/eELnocwZ7wJrrB7L0cu1FlclzH67SxLT7LdihYDw8Mp05lZNlIxx7kdHH9oqZLxEhHid0cXvtGroSh+eJon9O+xmKL/xfV5NbZ0NJxyyhlBRgLkeg/ei8ScAQ2l08u616GM0Vwbu3dYvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7644.eurprd04.prod.outlook.com (2603:10a6:10:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 14:34:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 14:34:10 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Mon,  6 Jul 2026 10:34:03 -0400
Message-ID: <178334843945.1322704.12903397336861257926.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703150649.234680-1-stefano.r@variscite.com>
References: <20260703150649.234680-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af9043c-17f8-45ec-13d0-08dedb6ba477
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|1800799024|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 oEBvxQiiyvXP+N75YTrCiKqSd2gnwhZLzRf10MESe6IEfCaUNbRxRatm9qevDa4lczI0JFQFb2MhgUzR4EGgxuMvewt/pBQk4bK5K0rM3pd6QBwxhH3wfXcvxIySTqBPQPFdZotJHG4/YjSA7XRw/nja1hieVaWDgw5DR8PzVi8kva6d+kbyhZaoIfRLWo/Ku80UmELwox5DZz9p0nsLSwLlW2o46tXnmw6RkJzW/SIDZASyasKmQVqDh3T8KoHFU/Wrl7DFM1TPxlJq3Raj3qBLGIu5KPu40Xw6Xfz5TaDxZAyixA+vz3ngRpij/GXP4OXDM/RQLKTRbxEOHN3rvt7cpeVydnrQ/VlXTzaWDt72hcyKPjNFfoClx/wqvyHqEo4wrAUTlmch76x3RVKf/Ln3MxdMRFwGyx1VldtZlD6kSgYymwdvZRZXk3I0Pl+/5Z9UN8+6mMxX9xBVvap83PJNSXuDCem+gea3CERlLe2gdeXO0s+sXEXl3EEjk8+nVuRu9+uk5kdSPPg+4arzVZL/Gnz3EoBBrk4x4nIQ4U7mBT5DsaCUTtugP83D0DIkldCPRxfQfB8OQrCnVFRcN8Ve0LTfQdh5GFrSI4GfpVH1N0PSJ1y3mFgepji8JSlxYAHXc7BZfxPt/oVTSFj8zyh4tJxNddmF1hquRDZoCdc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UDRaT3RGOXZZWU5LZG9VRlF4dWkreDE4NmdMTlpUQlRVMjcrd2VhUGtuQU1J?=
 =?utf-8?B?cXAwWWZnSUlXa1dFRCsvbGdiNGZ3VVBGZzNYMG5HNGROSDZwWG1PN0xNaGNj?=
 =?utf-8?B?UTFKaFlXcGJva2hKWU9iN3kxa1A3ZXdiZjhKb3RRdlRlV2t6NFhvMFFVNnB2?=
 =?utf-8?B?UUE0NTFiQk5UcHBqbCtRM01tMUQ0bFRad2trRkJzNE1NT1JpaGR0UTJXU0dB?=
 =?utf-8?B?aWlXNjlSc0VrbitzVHdVMkNTS2RyTWdBdE92UUhDWkRLMGtUZXdYSXhiNGox?=
 =?utf-8?B?TzhPa0tUalRQeXdFczVyYU02TmFid0lESksrQXJFT0l0bVNoeGhFaXFqTjNM?=
 =?utf-8?B?dHUxd0dMNzUxd2Z0RWtTMVVQUDU2M1E5dVdFdkVPWStKSDBha2pZNEtpL0hn?=
 =?utf-8?B?Z1V6RldvTzJmdmZWSGE1dFgzWjBrK0dML0VHSmNVb0J4WUlJTDZJemhoNHFY?=
 =?utf-8?B?RUg5VWVvdGFQaVBVdGthM2IzU1JWaGRjaTVHMVRwdStCOFM1aVZoL0dXY3A3?=
 =?utf-8?B?TWJablhVRU9xMlJnMlRWZlZOYkxEZXVyTGZwM1hVc0FHUmtsMFBRZ2dyMVVs?=
 =?utf-8?B?T0svWW55SnU0MnBzbkx2ZlpMQTZyb0w0RWpQa2doUzNja251UmVBVWJNTVBu?=
 =?utf-8?B?UDRVQytYbS9xR3BydkYreDFqRlBXQUhTd3JrSFNzTWVYS2N0dE1QNW5RTkpI?=
 =?utf-8?B?ZlJVVU5DbDVzNGZGYlJ0blpURjhBU202elNNYlBXOHh5Wm5HM2xtYW9sNzVM?=
 =?utf-8?B?Ti9pOEdTb2tWOE9zcDUzRzRFcUNHOEZwNGxBSGVkMmc4UXJvMkFCTG9OY1hM?=
 =?utf-8?B?cFFuaHdLTU4vOGY3YTVmbmNtY2RqYVdtN3dhWWlORVMxMnRBeC9vYWhoMVcv?=
 =?utf-8?B?R2cyYk5aeXo0TDZTVFl1MzdYcUVuek9LeGdkejNwTTFHRjdFYU5tUmFkL09a?=
 =?utf-8?B?cCtHcnkxL2dram1vaUt6aXJNT3B1OWUyS2d6d2N3Sk5nTVl1b2c1NWRkK2VW?=
 =?utf-8?B?U1dSeFRzMDkyREE5V0ZqZS9iZDI2V2hoV25RVnp3WFdSSzMyb29lRXR4VXB6?=
 =?utf-8?B?dUxsMEdNVXZPaXEvd3RFUDhYUTh5aUczRHNEWUV5SkFXYUpSSk14YjhGSjhK?=
 =?utf-8?B?V3NUMU5rVVBCaTBxWnduK3F0Uzl4ZGdFYVNNSXBSZVpNbXRWTmd0MmlYRUFj?=
 =?utf-8?B?TmV4ZVpaUWUzQ0NjeEwxT3BlOUpUSkhyc3IyUTNDcHR4Q0ZtaGZhODF1V1d3?=
 =?utf-8?B?cVlsNlBLTCszZUFLZWU1RHlMeVluVjB6ZWpCYXR0dzFCdk9Rdm1aZFB2WmRk?=
 =?utf-8?B?ZVRqZmovRks5RE54cjVxZ2QvMWE5em1GbytJV0htTmZOODhxbTYrV3dqeFRX?=
 =?utf-8?B?T3NHUGljMGUweE5VNnFNaU5LRldQek5WM3FjTk8wSTNFVXZvMzZsenBqZW9D?=
 =?utf-8?B?dHRPME4rL1RWRHY5VnFtZ1VUb3NnRWFEUXRqYTI2dURsREFQRHBLZmUwNWFk?=
 =?utf-8?B?bGhVTTVyS0hTelJHRk1SMzVybk1pY1lGREErWmVhMVdOeW5Pdm1NeGFRRjBP?=
 =?utf-8?B?OGJzZzBoZ2djQ0h5aG1tVFNFc0FaemZhZlZpNTlwamVTQWU5N0NHN09XeUF3?=
 =?utf-8?B?TXJqK0RnSFBKVXdsQ1lvRC80aFppSG9GTzNqMlphWm9VRVY3V044WDJEa1Va?=
 =?utf-8?B?bWZYWHVkbjFvcmRoeDBDZDYwYUhyeGRWNHFldkFURVp3L1NMUzdnTnBMWU5I?=
 =?utf-8?B?TXM3SERzM0tJREJpc3pEZVVpNHhyY0hvaTBLcWViYTYva05FY2IwRzV2WkYx?=
 =?utf-8?B?QVI3M3dTdzRIT2lmKyt5VE4wUytNdHF4dmFLQVcxSUlJUFJURkd5enZqL0lz?=
 =?utf-8?B?akZYejhrL2pnRGEyVHNlVUxMSzVLVGZsM0U3dEhYWm9sQ0tIdHk0dll3R1ZP?=
 =?utf-8?B?M2VRQk9jT3ZueHFxY3Y2cmpZc1hEWVVzdmtDV1ExQW5CQmpFZGUvNDFsbWtT?=
 =?utf-8?B?eWc0aDZSVm5SZlJqMzJ4N3Z3bTN2cEFLeEI4anpiZmRvZmdaY0dKdnZVZWEw?=
 =?utf-8?B?YXpCL1lwckVEQzRQVElncllRZ0hmdWIzY2poSW5ZTGR5VlFMcW54dkVBaElq?=
 =?utf-8?B?K240V2t2YVJXWlJzZ2ZjTGNpS0NCL2VsYVkvSzlJVCtLLy92cThDeHYwQkRy?=
 =?utf-8?B?U1VFSEw2R1JJcmo3VC9YandmUExHNDloVDFuUDM4a25YR1BpWGZCQVIvUEFa?=
 =?utf-8?B?WDhtM1J4WFQ1WVVvVlNSV25YNjdickJQOWZvTEl1L1hoWDlvbG84OGdBRDls?=
 =?utf-8?B?ZmUxTFhiKytLdXE2UFNoUmFGNkJRODBuMXVqd3YvUkIwRDNXZFd0cUxlaEla?=
 =?utf-8?Q?VaIyWPae4R34Ltx8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af9043c-17f8-45ec-13d0-08dedb6ba477
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:34:10.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q6hfl0ZIJ03DeB9qVtOtFNeaVg7MCBVGUyQra4k03RrJK8D2yVxGDE+SBYXG3xFTiIfwEIr1Qx828INSTXCT2XuV2vwAs8Bi2AZexkqn8JyGYpV5Z0Hpu2WjMMTZ9PO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7644

From: Frank Li <Frank.Li@nxp.com>


On Fri, 03 Jul 2026 17:06:49 +0200, Stefano Radaelli wrote:
> Enable the NETC and NETCMIX block control nodes on the DART-MX95 SoM.
> 
> These block control nodes are required to enable and use the NETC
> Ethernet ports.

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
      commit: 5206b2eec56ee5d50b02a0aac2c8a66f76556d37

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

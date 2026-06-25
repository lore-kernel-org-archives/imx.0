Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E93CE0A2
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382235; cv=fail; b=ssBbYMX2GWajBY4yESU4jCTRprWNI+2GX74d5povh6MYInuN3UkMKsKo89i4fPHgPAymfaMuXuZQJ4Xe8Ix00wSKqpudYUwdEb3ny3IrXcg43M0s2RfdLwqd3IvApL9tO4007b0hcblVu8NG6Nr67jZBVfpJdhOCH6vmN2niGbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382235; c=relaxed/simple;
	bh=FenElR1qJku4lS4zaVgb7gqhVLKGncthBpWdW4Aa4/M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Be7wegAaNY29UDN5sMF9MIzlHok1PW0ABy6o5Qnbm2drzBC+0qAyGEuZsmXo+03ygYEFGTLX/M7LPsSg8cJ4iX2H8w9u44OuRwG9IJOALrv8bGOqzlBDnFRLFGM+mp1K58nhj7lLMpYkU8NDxSNBsnUyGShwy+6/4yvCYT2MBKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CYvr5D4x; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CYvr5D4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOlFvLSyEL0c+j2Qggj/ERzPZ2wy31yVDhGyvG9PJiwk2Q4v27ATQ+Mpzv+wbQomopgldm2T3U8hVQ9oOzgFiTKixdwuSNv3GIrBgc9oQCHTjwP7afiso5UWuwhS3LrhvjYcxK0qg8hY+fp7D3mIsDfgI2/1sQyQoiq+cOLOXDN/x+CT+V+lrtjDD6OZTqv1P6lElRbMri0WVdeOpYwr3un5ZbhlTZtf9A6J6vp82DtzW4jndCXn/n4apT6WGPQ+q3wzrQluIUNzQqAxWCbHaYfhlSsyxBeIZ4RswBOSmGIRFcugSiG52LHRWIr8j52bl9uVV/KsuEUlJfG/xZ7fJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWGqj4vT8ecMuJ+T1Xz5B7ql1db9rkyBG4Zx7GNh5Ak=;
 b=s9qiD3mMvn3iTsGQqk1TRTfd0t5r8ugHHYntyW570emVPhrTjdblvCqo6X9QCEn7fsYozCBvcbbi8r2uE2yVzW3tLX+0FO/z5mthNCj2KRPVEL9Cgzjnq2wb4TCGNCrWa73GQ/IybSDCGPr7h7Y0i9RyeYCnQaIM3H6k4DfX4RyjPw6koz2Mtauzk3rAsmUUAAom2xFsnwqI78hj0fBxuEIFtiRyA7WzA4Ygx4SiC6S87tlEtyNX7abGFKIEpRLX68zPFlrRNLZ/lgNzPhRdQETCE+IqBNqHrshmgVcvi97LQQB8IVVUPxTHMhcr8YbaPcckFtlRdEB9KvFVo9P+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWGqj4vT8ecMuJ+T1Xz5B7ql1db9rkyBG4Zx7GNh5Ak=;
 b=CYvr5D4xwurL7veXcMZ4arD0RUbU5oFSm3O+AvfXrtrT9h4Cfqw61OxSVmZKyXEd9hV4yiYjtZNL9Dc6Pb9oTeqhAqDG0w03263YzoL/1b3/6LFvDsCeUyz4Ip6Tbs45rQGZd35Fumv+6vw6sqcPMWbKjhkI3PVwoI84LD7OVDe6xpqf7l/NNTklQsa7qFOQWDvwPIbavubR349dM66mSSvTRm9Q3j+4/RJMdOCag7AibTGM+mo2sEFCZIkBymbJxlgP2D+0Vi5BtzLYb6AKQX9AguUzeXxFWMyNJ+hWQW2mFYCi/DE64LTDfbQ3nyuj7jscaCIBlhwQrzH074t3LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAWPR04MB9814.eurprd04.prod.outlook.com (2603:10a6:102:37f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 10:10:30 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 10:10:30 +0000
Message-ID: <e013d998-6294-468b-8383-27f385dc426a@oss.nxp.com>
Date: Thu, 25 Jun 2026 13:13:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260625054709.301209-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260625054709.301209-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAWPR04MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: c8379851-b320-4851-68eb-08ded2a1fc56
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vgbNa/5u2xFAGm2kCmE0nuZGz5bw0qBAJh4iAbz2VO8vIaWHTPSlB9KwgqcJEVEdmo5TN5OdF/MEMzezYn3ER184PGOGc24ZCxOBw+TiS+vUg09P6oGGsmDdDWscnfLFTsKfcemyFW5k28U/NQT+coTa5erdVAPPGtX1OHluhKkuuvAchWI/0CzH4oRWZkQo5+4mJOdII3JX8dxDZTuNqamk4gjH7/iKpGvK+nYcwWcgk9XVVN+HjAPPj6gKpXB7lXKvNmebpGf0HpKiWZOQhCAfppLWGC+o8K/NqLemuiCZpDzqzbp827ibaccRycdEBI8GHCv+DbUaao4Q+Psn51eV5YaZjSHDWYYkMURgFy/Gce4RYrFQxOkb1USO0+bJa3hGxBoYRpyhk7mTBb0cpHO6u9BNdrBuvJlSDE5bLMAkBhu7PVuLrv8kDkPHpSjwrYODYIo0ImUIdDBuBtbXo9MwQwQHPS26aRzzjDxVw+JdwNeZHTfGYvW4j7NwiVK5ctj6Svxm/EFAi308karxT553umzknA04ViljI/V3kQ3FN1YD+uWzuHZWA1RKy/PCZ+idS1L0ZYVoQ+MGqa2OZV3UA3ydPLb8UcGNLPQVFdIdBeHEnLMZjdlxs6xuzuCRUzHzD8ZBeS1T7og1yCZVkEbQ+K/RhYWHZXUIVcCHW4akg7jRDsi1rcAXdZnTXlu08t7eOrywrmZbd97TX2HnRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1QcnQzZUthVWJzZWYxMkNranpFb1YzT3J0WFltZ201YTVNUENXZ0xFd3ZK?=
 =?utf-8?B?ajQzaXF3SU1oaUt1V09kdmlkamFDdk5MREowTThhYy90ZzBsNUp2Mm5tS2dX?=
 =?utf-8?B?SWpuQnpVc0JoZ2NrU0FZSEZHdGtpYW5QMXdpcDAyeWZXUi82SHVpUWJOdzdT?=
 =?utf-8?B?VEwxVmVXU3ZWTWtXYURkcjJUMmY0WUFTblkwYVdjV1RIY2crZVcyb21ibkh3?=
 =?utf-8?B?NVNJUnd2Q2xhby9GSW5PMW1GV3pTdlltNHJxUEFmdE1iSDJuOFB6bHA3dHYx?=
 =?utf-8?B?S2tNM2FzNC80TFZCMXhLdU9QYmtPQUJOS0x6ajRoeWcyUDk4a2w5VGtNOEZI?=
 =?utf-8?B?WVkxQmVwUC9PbFhYYXhNNGN1cEthOUFkYjZKbVNERE53ZmtVOUc0TjVnTmV2?=
 =?utf-8?B?UVFuQTlWQ3FsUS8rQzhZd1JvMlVIRGJ4VTNGVEdYdk1FVWJFbHl0L21NM2pH?=
 =?utf-8?B?WXhlOTBJenVoS3VwRHAwbFdsVUlhVVhTcnM0VXNHZ2hDVzB3b0pudUcrbEVG?=
 =?utf-8?B?cE9LbUEySkE5V2orbUhTdWdWd1p3N2hBSjNxTnlZOTJzSHZLL2JWdUFubEhx?=
 =?utf-8?B?YXBJU001aDh6L2x1bHc2Y3RjUDFHNWd5TVZXM3RxeGNaK3gwV2I2MlV5b2E5?=
 =?utf-8?B?OFNibGw4SnVpSEhxNnZLbXFuK1oycWdPbXJZWXpCczhLc3JYcWl4RTQ2RnND?=
 =?utf-8?B?QUJrQ0F1UFZzSEd5Mm5raGZjY1Bia3YzMjFpRHZBSnkrQVJMMTdHOGpxV3Nq?=
 =?utf-8?B?ckEvUDV3OFA4MCtkejVTTGFGMzRvMTNqNEw0K05MemJ2ZjcyU1pjaFNSTjlC?=
 =?utf-8?B?THBPbmUyK2dSeDU3MEJSblBna0VSelBGT1pQZGRNbjFYTXJjWExhNXlEbHVG?=
 =?utf-8?B?ODAyZGdyUExRUlNHbHF2QzhKeW9vOXI0OHZHNU5oSWlmancvVTl1YnNsYkR2?=
 =?utf-8?B?YXNVQTY2czk4NGwrNTN6TVQ2OUN4MkNoT2pNbmExcEtsZVlMajkxWHlnUXFx?=
 =?utf-8?B?RWd4TXo5M3RGNGhPWUxzR3EzSnl4TithRUJnL1c1TlhHWE5kRkVFWmhpVjVT?=
 =?utf-8?B?bndyemJPcXU5d001MDZveGFiZTBVZ3hSWFVsNUUxRk0zaWV6MGprSkJpaHYr?=
 =?utf-8?B?djAxWFFtT1BidGJ5M05aRG1qdC80ME9qRWRHL0ozeSt4NnV1bVk2dzB3bVoz?=
 =?utf-8?B?enB6UHZMdklCZGN1cjZHYkw3OGZnNmVPZkIvRXBxMTM2dTVoRC8vKzZ5OWh0?=
 =?utf-8?B?bFJURUd1ZksxWkR4N2dLREcyQzMxYks4ek5vdVk5blkwNGxuVytOcTZjKzhJ?=
 =?utf-8?B?WSt2K0F5WkxiMDlhSVRzK21QZTJnSE1BbHAwdkhBVm1qM3lYWHJpb3pqN25S?=
 =?utf-8?B?NTFrWmFXM2ROMUtQMGo2RVVYZmtjQVdpeTcxWFlZQkFoaGh4TkgxeTRtblNS?=
 =?utf-8?B?Q0o4cW05Ujl4aWlSZmVFUkpSWFlGMUFHQjdOaDhaTWRBMEVCRFpmSnY2S2hO?=
 =?utf-8?B?RE1LL2s0R0syak5qcDlPb1BXL2dqMW84V3EvOXk5a0wvNFYvUS94SjhvZmFG?=
 =?utf-8?B?a2U3NEI3WmVJdlNoWW1OWU1FSGx2K3NJaE8vM0I4bXJpRTRKT2FsekZERkk1?=
 =?utf-8?B?TG5EckUrNXZDdFRpeTFVRDQ4cVJWSFVLeGNnb2s0UUo2d2dDM2JWYkl1VE51?=
 =?utf-8?B?NDArRktJQUhpUTFIWGJUT24xU1JVWXFWd1QyZmZ3SytVbjdnQ0lQY2R2aGJW?=
 =?utf-8?B?UjBVVEErc1FxOXROVTNhZDVGTCs4Zlc1a2tHRllWb0JobUxqbkRBMHpvMndy?=
 =?utf-8?B?c0ZhYk53aFU4OFNZamxnTGVyVG9OaStYTUR5bXVUOU5GamNnbzdBNFpuRTAz?=
 =?utf-8?B?dXdHVjJTdlJ0WkRvY24yWkRZTWJkTDFISzUzRmdFNWs5K0t3MENwTzVocUww?=
 =?utf-8?B?bHp1aU1RcWQ4akdOZGs0NHhmdzFodDE0M1h5dDlQVzM0UTdMUUVmaFRkMlpq?=
 =?utf-8?B?MllidGQ3LzE2L2kzakJMNEZ0ajdRemZjSDIrNktmUGRINldxV1FsSmIvbEFn?=
 =?utf-8?B?M3VoZjhzQmJXY2JaLzZJSVQrTENtdzVCWDBhWXZ5cG9Sb2hxTk1qdG5USHg2?=
 =?utf-8?B?MDRLT2lveXBUS2gzWElNSlRESk5aa1gyL084T08zYmo3L1dZV0duQ2JMTjhM?=
 =?utf-8?B?RGNIVHV0VUJnUWhwbllRdUw0dlpvOHR2bEVLSHdOL3Jvc3QzVEFybk1JV2FM?=
 =?utf-8?B?QWFWd21Nbk9yblNOdlJRemFsOG9EcVJPUmI2dzF5cVhOamg4VVFHa0w2dkZM?=
 =?utf-8?B?N0JEd1BsSEpyUmlrdlI3TGZpdURyMDZFTEo0L0JyUkNyNkJYZXh3UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8379851-b320-4851-68eb-08ded2a1fc56
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 10:10:30.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0u0B9ycZC6Kx7ENaIj8Vraa4zvluwiYzjwwldKVh2HVWPWZcVVC/Rd/fdA6fsbrXk/Ad6T8Wan8dRLl5E/uSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9814

On 6/25/26 08:47, shengjiu.wang@oss.nxp.com wrote:
> [You don't often get email from shengjiu.wang@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Enable the MU2 (Message Unit 2) node on the i.MX8MP Audio Board v2.
> MU2 is required for inter-processor communication between the
> application CPU and the HiFi4 DSP, allowing DSP firmware to exchange
> control and status messages with the Linux host.
> 
> Without this change, the DSP driver cannot establish the message
> channel and DSP audio processing is non-functional.
> 
> Fixes: bf68c18150efc ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



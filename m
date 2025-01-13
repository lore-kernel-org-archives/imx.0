Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254C18871F
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791350; cv=fail; b=kCaudxW9GMCdaSNRvGcFxlW4PR54i1EA105nE0oRt5STlE/SvpxR8biIe6vxSKi1pIlhlr0q7Wi3yoB/U6ERrneI86In2DeIxDLIadJCMb2BmprryfgM8QAZHLuuEehIF+bOMsE8gtxySbdErcpzI6Db/z1/kyS4eIQ0zytaGa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791350; c=relaxed/simple;
	bh=L63USjmLzWbjVYZd1/RGYvM3THpnl9SFEtaUwVkj1+Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=b4jWRdBsD7eWhFZkmPd/7KmgVsfYejintbXcpDVOiqK0wetpIdNOoQFl7lNF4jOWc6SVF/wXafHgKXZCJmnWRB2iZaj8BXexeCyL+/rwmTTEFMuiCFIc2Foad6WomKEc4p3H8oRYgAQbMzOkAYMfiE5+KuJ8eoIPckXqeX6RVZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iMmNvvor; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iMmNvvor"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVQiwtNGhE2SZVH1UMNJenV1STltUJniMOdzCoAA69CxbsuFxmHdRuc7NshbJkp+cmjwV30wqR7TX1N/GsNcOXAVd5w894Jkjp+l/dzOUp/hitaMiXgkEkzOq9Bu2PvRYkMxrVcfRix+3tIJyvudK6SVbzJoIaCNSZy57+FoItASkpHFawLYiExXCAZUQBfManPEU41ZKgtByJ9OH90QRidM8ttl2zz9E2FL/e88Rl/xLEQFlmIMjZquj3gU8FwpQOpD0Nleak9eNfGXiR/3W0rBIFsif4LcG80mD53ZcCqfk/S6A12oGlceqPns207KBSLK4jGGDwlcQEWTMWL4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7ClPjpq0gOJZkHVLtZSIcY1Irqy4WDeMyrKMyTaJtA=;
 b=svxcBv0DW8Oy7qz8vMnrLSTf/8IbYMlg7TengiL2CZlKzUcoiHIJPX0zSD3ZU+0gc+SkVet5nf30RrLeY2naSfQx18C4suZDp+FHRe/Vkebbx/7lP3MtIkGxmEmjhI/XF5qeolaHFAFN4oj0C15rF6W+kHFg0oMJ1cC7dWpeaWMWwLh46fRrSD45s6Pgg17qKxFEm2TzN67Px4skie97csPxb3CyJUp12TMeGEMth9WJhW39Pk+KHxEvk3tNokmPBsJLZncMNjmHcMoWScv3E2FKUUKdY2IdqCWZqtahLSxC30yZlGBfJcLJG6/hcA8MaoN50wvu0fx2shZHmmzFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7ClPjpq0gOJZkHVLtZSIcY1Irqy4WDeMyrKMyTaJtA=;
 b=iMmNvvorVYh9MURdtyGNmQUmqBl6UWyuFGFcKP+InEEAhusJ8eL5C3jBg/DMuytz5qdDCscpj1cM3WYeG9eVkOtH7u3Gp62L0EThn8uAY+Z7X1Pmq33L2OQglirlv9mzZkBP31EX45ObrU+bPDPTOZN2p2FJnUHxtBM5EbNWQ8HNr3gttUzcsDy4yGA/nqkoFRinUn2Fa+7frY6mXoAqYFlReHE6+Se+ItPRMUGwCzA5PyzwAGsGi/jeBHyf5l2Sm57jUmEbTbgYhqa4M5L95NphERLI/tq9S6eAviQcaQp+D+8XJDC/W3NB16cHRq9GjiPgteSrGxSh+xrrKQYCzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:02:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:02:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/4] arm64: dts: add imx95_15x15_evk boards support
Date: Mon, 13 Jan 2025 13:01:58 -0500
Message-Id: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZVhWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MD3czcCkvTeEPTCkNTXbNEM5OUJItkA0MLcyWgjoKi1LTMCrBp0bG
 1tQDhO71hXQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736791340; l=862;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=L63USjmLzWbjVYZd1/RGYvM3THpnl9SFEtaUwVkj1+Y=;
 b=8/F4LjJ9LcPsGA+LX1KwSLBS76cRveeHE4nnhwCekXrqXd8hFGm/UKPolW3lYPLHU9XvZfYNo
 c5qvvdYIQ5fA7ixOXgzMyW9HkZ6AWvLRrA2VhQNWDgWvkKHW/jz8xfj
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fc84d9-7221-4950-6a5c-08dd33fc6ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU43dDE4Z3ZhZ3hOQW5YV1VWVzByb1daVFpWc3c4N0ZkTFhRcHJJc1dkM3Br?=
 =?utf-8?B?VnI0VHVDYzBSeXdhZmNIL1Mva2k2MmNYMzIwd3kwM08rY3g5MnkzQTVsRWo1?=
 =?utf-8?B?eWtBUlNUK3g4MWFlemRxMTZIVTVVc0RrNzY4bEkwMEJiTnhHWXdaY2dLMS9y?=
 =?utf-8?B?Z2FRRTQ5RUp4WlJlT2JCOUZRMFNyNUJkZDRjTG13dUFKSjFVeTBYQnh2T3N0?=
 =?utf-8?B?YkFNdzBnWlNzWlNaaDR4Y3JpUEJ3a0M4OStpbnhVZ1pDdUFsMEw5cWdSVWJI?=
 =?utf-8?B?YkZuNEE0VTQrcUQvMHZHRy84L3B4aVRxUHRYb1RHc0dhYUNzMFJ4eUwwZzJa?=
 =?utf-8?B?enJITTI0c1RLZHRCSyt3TjVpYkJlT2xZd1NXdHlCbE1WSU1DVUZ6M01vZlFN?=
 =?utf-8?B?WVpPc3lmUWsxamJnV2pZWndISVJlNURxYzZDd081UDFXamYxMzF3VHFxTEl3?=
 =?utf-8?B?Z3hzM2ZMcmFsYXJiSTZ4eFE0dGVvWkVYMU9xWHBGN011WTdHYWJ4bmI3ZHhn?=
 =?utf-8?B?eG1MeHlPZ0E1bWRCdExwbkZxYzZWeUsxZ05ScURXalNPRjJKNWJHVXBQSmxC?=
 =?utf-8?B?dnhZLysraU96R3J1Um9IZjRNOFJCWFM4MU5FbndjKys5aUhuSGtyRmp0SzdG?=
 =?utf-8?B?eXpubTJNdXhFVzltNFBPT2VOR2Y1QU1WbGdDRUgzYWpuNVFMT3lsTnFycVE1?=
 =?utf-8?B?eHVnQVFkVUMzOWQvVVRHUEdMaEZQbGlvSGVmMkcvNTRGdnBaeTRlN2dRU242?=
 =?utf-8?B?dXpKZExMTTl0cjAvR1NYWWVvWDFmZjRyZ3NpY2tHRmhudEdETXoxWDlaMjNj?=
 =?utf-8?B?NjM4azNnbDE3ajI2cHdVZnJ1N2hGRUZjYjZiMFhiY3VIQVJzVXQyN0lYQy9N?=
 =?utf-8?B?a3d5TG5LN3Q0c0FlL1NkdkFUSExGVS8ybHNoeTdGdXhUTnFVeXVDby84UUkw?=
 =?utf-8?B?bmdYaEpJQ0NRUGpJOW4vOWJuVVhtcEVJTTdCeklxbUNiUUNLb2pHamoxdkpQ?=
 =?utf-8?B?NzBIOUNHZGtKM0U0K3JwQ2gxbEViQUR4OGtFOG1WZkZid252Y2NTSlBMM1ZS?=
 =?utf-8?B?eHJCWTVVcVJOT1Z4M2tweU5tL0VCSFU2b3JzQVRmUW1Tc0Z0UUR4M3NjczhL?=
 =?utf-8?B?amRTQkVJT1FUenZlTExnRFpFbFhRcEFxUzh1bUV6bWVEMkRhTGtJR1JsZ08v?=
 =?utf-8?B?QWc2KzBiZzM2L0hKUzFGTFJha25SdUFLbDFTdW83QnFWc3JuVys0QTBiNS9m?=
 =?utf-8?B?M0lDNXUrc0h1S0JkdGlvclVuTTVKcEphaWl0c09qZWdqLzVTT0ZiMTNwWmxy?=
 =?utf-8?B?d0x2d3U1RTQyVnRzb1BkSWFNSDJicGF5dVZodlBZY3MwMXUvQ1F5M0hpS0dU?=
 =?utf-8?B?bDVEM1JGTlQxeHUwMUZkbG43aVd5SXBuQWhHVTVrL3RsNGxnYmpjbUtHYzJW?=
 =?utf-8?B?cUl2L0xsS2RhZ241ZHRtaDhmZUJKREZpeWczR29XY0ppQTlCYnJKYnZZWEpz?=
 =?utf-8?B?b0V4NEw3TWtzNSs1bEZGa1B5SU9EYmw3NlB4Z1ZiSEVVYmhsdjNNU0prRzJl?=
 =?utf-8?B?MHkwVWJ3Q29BdDE0VmttTWFxRmNoNGxRWTkwRy95Sk1Fa2o0NnNLRUU4YVNp?=
 =?utf-8?B?T0xIWVE1Wk96UUxVc2I1M2kzdHpuWGdPVW1IaDJYQi9tZ3JTblZiQWFtK2VF?=
 =?utf-8?B?YkpJeVdoSVlWYkNBSUhVemtnWENEaEt1RGdGNFovdXBuUWt4Y08zdm5DTTJF?=
 =?utf-8?B?VzgwOHNVWllLN3FLZ21SSFlnSlN2M004S1NvRC9kSUQyN0FPcFNyOENJQUZt?=
 =?utf-8?B?dC9mZXdmVnhVMllhYW1hK1NuSjhVc3B5UjZHUFFud3JYaUEyZGNxbUs0S3Az?=
 =?utf-8?B?cFhrSE91MVJEMit4N1lBYTl4NEtHQVdZaDZ4Rm8wTW15NTU3UnBNRU5xeCsr?=
 =?utf-8?Q?eQifWlOlXVvlWUjftRodvdc/2/RM5Amt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRqaG5GWndldTNIN1pBUEFlMUZiYlcyRVNVK2ExbVF3U0R3aU1jdHJQa2J3?=
 =?utf-8?B?SGR5TGFUNDlpbjI0N281YXJ5MXk5YU8vYmRubGozVEszb0w0WmFLbS9oVzRU?=
 =?utf-8?B?SEFJcXpKQ0FhVWFmRXpXcVB4eXVwTVIrei9sLzJmcjY4L3BNSGZobmhkY2hE?=
 =?utf-8?B?ODVCNHVIREM0SnczTzV4UVowV3V4SUlWKzJSVmpIeCtzU1VZRkVQekpwS0Q2?=
 =?utf-8?B?K3gwWkkwRWFycXYwQ1lWWTI5YUFyc3MxNkZKMGRPdXJVMXZYajVSelI0QlN4?=
 =?utf-8?B?cGRneHlnYmgwS0V3S1pjRHdBc2ZEL2gycENVNlZoMnJaSUNrNUtXNWYwS0J0?=
 =?utf-8?B?MTFxMWhxZHVsZHpZdmdzeXh3bEhWZjRJUFRKTEZCdUlPNEVaaWtwYXdCR2Zl?=
 =?utf-8?B?Rm1aeXdhY1cyaFJZQTAwdEI4VmtFL1FyNVRuTVdHRUdEcFozOWZpNlRxbDhn?=
 =?utf-8?B?OHlsRnFFc1JraVR6SUc2Z01hcyt6RjZGZE01UTdlRk1ZN0p4K1Q5UnMzYndG?=
 =?utf-8?B?N1RrckZFUUVyeGVsdmx4Y0FVeWxEblpmTWZLVEJXblRYRHVuaWo1N0ZUaFM2?=
 =?utf-8?B?QVhLMmlYWm5BL3pIQTd0VkREQWJndnltYmUzM2NuYzB6dGg2M3lvODh6OXI3?=
 =?utf-8?B?ckw1c0doeEg0Rk5wd2tIV041UTN5d0gyOWk3WUlOZklRY21nb1VPd0UwVDdi?=
 =?utf-8?B?UTVnL1JldkpNWlY4TmRGZUtkQjVuRzhmY2RidGFwVmVxazZyaWpKUEl5WDkv?=
 =?utf-8?B?V1RtWjhSOWNMOWdhY2h0RFdOdWZ0U1ZmOTVyK2tCL3FxSXM4cEh3aTB5Ykc3?=
 =?utf-8?B?blhOemNZa25heU5mMnl2K0Zzb1NmTHMxMXkwbEoweXVBU1lSTCtLdXBnZlpk?=
 =?utf-8?B?cTRaSy9IRFRxUzRSU2E5ZUovSzkxa0JjNE9XeGZoZVRienVudE9sR3htS1pz?=
 =?utf-8?B?bC9CeW9QVkxvWEpjT242d3AyQjNibmVIeUpQb2F4RTJVVmdZOGdWbkc4K2t5?=
 =?utf-8?B?cEVDMkltRmN4UTJSZVRiWGEyZEhaSmpudjdiYmRyUjRWbGpsd2JDREFzVTJk?=
 =?utf-8?B?K05ENUl4UVhqYkR2MzFlc3JOODVNeEp0YmdXR0hkM1BOSGplZ2VKNEhiYTlv?=
 =?utf-8?B?TkdQWFBYaGlIZ0ZZdDJBN00vTkhFRmdFaThRekFiUkNxMmVuY2d4eHZXbFVs?=
 =?utf-8?B?YUJia0JxcE1WSmVlSTRRdWRRWU5WRmdHeVF0MFpET25RNDRnQ2VkRVNsMDlj?=
 =?utf-8?B?aTR4S2xTamtBY2VlWHozNklqcE5aTzJqUGhSZUlYTElKclk3UnJDNHJTN0Ny?=
 =?utf-8?B?THl6MW1Cc2EyRlNmZStFQXR1QzVsMzRudUhaS0dGblJlVm9kdzBzRTdpMDM1?=
 =?utf-8?B?V3N3UUNETDhLdEFLdzVyUTBwd2gzbW5UT25TdzZxNk1EU2ROTTFtMmtESUtm?=
 =?utf-8?B?bUFkbVNYMSszWGVIQ3cyL2pqZExJZFVUWkxmMjVQTmxXVHlHb0Q4VTB2QlJN?=
 =?utf-8?B?OU5xK2hGT0gxRzgxckNwQkQ4NTh6Y0dyWXVGMUpKZ1NwK0JDUEVoN2tXVFB1?=
 =?utf-8?B?NEZCWE5wUjlUV2dERWUyZHA4UEZRQXBuNkhLS3NWSVgxYU1lRHJ2ZkdzTFNi?=
 =?utf-8?B?MlU1YkQyRi9vYVd1L2xDTjc4OW5xT2VQTWJtSmVQUG9reUp5ekJzb01nelZl?=
 =?utf-8?B?cG5ZbnRleHpZb2VuejRMZzMwcW80Y1Irai8yNjFVSVoyVEEzZk12R09JS1FE?=
 =?utf-8?B?eFhuNlZRNW5teXpSUDV6VnhCcWVjaGpqanVKSkxTNy92TjdnSE5WWE9vL21D?=
 =?utf-8?B?b0t5OWczd0VlOWdibkJKdEd0Z2pSUkFoKzNheUtoRXBqaVl2aC9sd3ppSmFO?=
 =?utf-8?B?NUxEVWd1Qy9ZeXZBb3lFaVRMSjBlUC9CM21WMXptd3I5N2NPcndBaGdwd016?=
 =?utf-8?B?ZEN3d243S3o3T1R4SlNEYWJLMXpoWC9wWGg0RU1NYzVGMmpUV2tYTUFiajlC?=
 =?utf-8?B?bWlsaDJWOXA5ZmlzV0dhUXhCSStITjlXU21uMDAySS9MekwzN1NFM2JBM25W?=
 =?utf-8?B?c0lBaWJmdzlxOWcyT2JYZ1VmZUNUaW9zM2tpNDRlMXJzRDR2SkNNZCt2NjQ4?=
 =?utf-8?Q?mbDQZrUo44eUe+9Rt8A94Yb6i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fc84d9-7221-4950-6a5c-08dd33fc6ecb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:02:24.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAlj7deEvNt2o7gUTWn4UHIuCQ0gkSCXKgb1TeWnSPmIJbpfHqHjQ7sx5TN5Xmp3QFpE6SZvWTrYJzWkVXcimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774

Add related binding doc.

Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
boards.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
      arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
      arm64: dts: imx95: Add i3c1 and i3c2
      arm64: dts: imx95: Add imx95-15x15-evk support

 Documentation/devicetree/bindings/arm/fsl.yaml    |    1 +
 arch/arm64/boot/dts/freescale/Makefile            |    1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1064 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          |   27 +
 4 files changed, 1093 insertions(+)
---
base-commit: 1300d5fe48f1e09a9a7d2dfe3b2e74be8ccaa322
change-id: 20250110-imx95_15x15-6a64db8c0187

Best regards,
---
Frank Li <Frank.Li@nxp.com>


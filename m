Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296CE3E9F6C
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082691; cv=fail; b=pLxMi7qdUoRZMi3nPO0/eX8KOgFaFSEBAerf1hG8trF1RoGBjbA8+JHR88AZ8f0LhFFjceE6Aanr/jcthyN9Evrysz4eRIhp9TmBXLlw2d3FbnVwMnjUjc8z8SR7X+VURNtQ5Vqgi+aMxPk5fyDXLQBLXF2H091aDzBuQAvGs9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082691; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GgwstfNsNLb2NxHgC0dG1P2uGDGdLYiK/1JWx+S926eJQKHBhd0ZmFemVkDDbqABkT27XzDhWfqeY2KgYKhW20d8eJuexLZ+/AuoENmYEGZAW0xBc2Dn3rpAgub7oCHAn6+P7aoP+x4mRXO/kdy3McNvuItAeZRbxFLPgc51SIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KQV4vWIN; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KQV4vWIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FitDAAoSTEuIMlhOhr3c9Fsolv+SjPJNA6ysA99YbjlC2aTs05TX8K44fxGuz3ckBmQLcG7ekdH9myFo+UI09jrbkB7o894zsKb5G1ERI4o+k0wsbBh3kQUDTB9f78KCJM9b70lY4spAqpRUYVZE6azQ8tIz8HfH3Ra5JEcy+VFQ7qn/KJphEPMDLkPSXIuLmzTRk2QfziJBlA1ZzOMsaYq0aupLIpunzmY+Luyz0OFvFy9TY8xk2fWIeFQvhdat7nn89exbqILRdtOZMsgxY18eb1W8nqspEBn40Bn1pwat8xy0ZwTWRxcLYqBmt/jaSYoCHlrKjLWUccBP0iTRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=PZEsWJxiFMtRblr+YJiXqLM0lktNuejgg0870205HtagvhA6RlXguylxuaDNCE++y/rqO5vLk69TIeCLqryWcwsEBgaoOMYYAyxkGN7JA7DE7yHmbtcJfw+7/kYNamvTR5+4+rpIWT7y45Uo8IkNAi3Pj3U7WoM3edhQ7+wbWM6yVInSJILX6icg/VvtYwBBkKYaTHH+0292klMjU7mMIsEbg+wejb3e2pbowxtE1MfEERnk5bpEm143Gcy6VyRa8eHhveC1fc6ZJpO6q+IL/yvR6CnSgmfNAWdeo8tfVIIENXc8V7Fq8z8qwRpS0dhCFb2HFz/P7xqrTAuTtH5t7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=KQV4vWIN1SyiCVYRk67+5Pvx5ai2SsE1BewbK8WMNZGnxE0ltRefC7bNOelU+dhNlg9ruV/Evdawj0r2/czeWNyivY6u2ubzQYxHq5kz0fP+fuVzkrNPugmMz7gD5DalIFAVFnoucHG7th5fcVUtgwQ8PXJa5q40ZOxBLgivA9QTgS//LonXd7DoC2l1QHKXCTrEX9b48lcKbbuytYtGHK5rZarisPmsRToHQzN2LTzv+eT7jmdX5VgK5JKokfFDACl0FldbOOyJ8isCLGsSc6nCVC87AqEv2qUrJrgYC3QN9LDSvbe6Kk1A6X+L8zPGFcSyTIsJrrgm4N5sJhV/Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB9801.eurprd04.prod.outlook.com (2603:10a6:150:115::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:51:25 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Thu, 22 Jan 2026
 11:51:24 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 22 Jan 2026 17:19:19 +0530
Subject: [PATCH v25 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-imx-se-if-v25-7-5c3e3e3b69a8@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
In-Reply-To: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769082570; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=iEHUFjo2TOEXzZN8HJ17ZodT1zs+5FYYehZHXnbzRjhsy2Iv/4eG0hkCRsC+SVeDxRRCaRlgK
 RrNIjz8RRU6BHHCMY75/kL1mPkTeZKVKIwdQq2CgsTR4akbhcvL6h6m
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|GVXPR04MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: c73f4c46-03ac-47ae-3240-08de59ac9199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S044WUx3YjNuemNsNXRvMlh0cVd4OUpFSW56NDhhT1JMRDhndnJ3UEhyQVZi?=
 =?utf-8?B?S0FrRGtZY1RQbjRnWEV0c0VGK3hBTUdVMUFZY2pmN2xMWGErVTk4ejRzTm9E?=
 =?utf-8?B?Y3Y3cG9uR2tnVm14a2hlRE9nTWRmZmhZeWF0b2RoNnlBTGI3QzExUHFBc2VH?=
 =?utf-8?B?NmxNMnJBSWxCSU5acUNlenVyL25LY05pcnZjWk83b2k4Y21oWUljaFRZK2RP?=
 =?utf-8?B?WWVZNlkvcWdjdjBLZWoxOE5KL2t6b2haMWgvTWVjbkZVT2dXK3I4Y3A0OWpj?=
 =?utf-8?B?Z2h1TDBlUDdWcmVDVllxdmlpMU1IcFo4TWt5T0F0L1R4elRwNG9SMWxoSWZq?=
 =?utf-8?B?MmlMZlo1VjcyYk1lWk1OczBkODl1U0ZVUEtPNnczeWEzMDdPZjZteDZGKzYx?=
 =?utf-8?B?NG1RQzNaMHRPOXNuWitKUUIwK21sd3ZHN0xWYkkxZVM1bjdBR2F1TElhVXBh?=
 =?utf-8?B?Y0NPYmlsdzY0OGlKSEVaZUFXY1haUk9YN2NaSWszdGV6YjdNZWYxOVVhWWkz?=
 =?utf-8?B?OVlIUkl5Nng1RUhHRWFIZ0kyYTZyNDZmSmFidGtYR1c3M2NOaGdSTEl1R2Fy?=
 =?utf-8?B?d05vU3ZOUEkxNGlrNWNTeHorQXh1M3VKNjBZLzBNNHc2WGpFcmJuTTBFdGtF?=
 =?utf-8?B?a1Q3TEZ6WmhiVWlvcVBHNGlyTHlmelFEa21xQjZxRDd1dkJ3d3duT3VtTTVL?=
 =?utf-8?B?d2hPaWFKRlYxUjFRRjdXTEFIV2pYM3ZVOUJrVXZqZWVuSyswa0tPTVZPTTk1?=
 =?utf-8?B?YUJ5UXRTVUx0MkxjZEVyYjM5MmY2cGVYTEx4R3JNNGVIbVlSYUZjaWNKSUVl?=
 =?utf-8?B?WS9QeUZCa05aSVFuM0pydHNEUHZZUkxGN3VqQ3VRR091bmJONDJPeTlyUkg0?=
 =?utf-8?B?Ry85cUxoeXBFZU4rOGVrRHRma0JIcjZabllHLzBqelJBRTczRHFGaHFsbGFE?=
 =?utf-8?B?c0JzeEtpak9uTU5iWHlhTTR4b2lscnNYaSs3UG5LMWlYa0lndEJKeGxoMGZM?=
 =?utf-8?B?cDUzTHhHMXZRc2lTWWlrbUpRaFNFM01IYU9ocUNuWmRxejZSU3JkQklxR0Ir?=
 =?utf-8?B?TWhkbmc2bWY1Nksyckd0VnBwZmlsbFVwNFZqQXFPRitrcjR4SnBJdXd3NkF5?=
 =?utf-8?B?dytmVU5NWTlJOHg4SGhFM1lkZXA4V2xqdnAxY09PYTFOY2lKREc3MUU3Ulk3?=
 =?utf-8?B?YkpEeXdyYll0MFIvVWhOcE5yd2tjbXBzUW9oVzVPVCtzU3B1YTBUeVBtdkJC?=
 =?utf-8?B?L2JZeW93cVQzZUlXUGhBN0VMNWdxeU1zWW90WTlPaVlreTVXbEpxL1E3eVpv?=
 =?utf-8?B?cFNYcldlejJXUDVhS2F2b2FYWWplRTBEREZ1R3ZHZWZqVXJLcTdvTXVWemhx?=
 =?utf-8?B?TGZtRmdHck14aFlvVHIvVW9JdzJXWnJtRzlyYUJFUVNuM2VsLzl5andvRzhD?=
 =?utf-8?B?Y3RreHNCRHUwck9oWllkRko0Y25QL3MzeGg5cGZYUFg5UVNUR1ZkK25rcHgw?=
 =?utf-8?B?b3grS2MvaXMvRWVXY092QnVNb296K0xaMnJHOWRtSy8wRFJHUWRhYU5UczBB?=
 =?utf-8?B?N0FxZU1zenN3YUY2QXJFZVBPSk5SaFd1NVlPSTluelRxWW1RN05WSUFIeHF4?=
 =?utf-8?B?bTVrVW5ha2d2cnZzeVNUaVh1WnJpcW95UmJEZVpSelU0STRDZjd4QXdyVkxM?=
 =?utf-8?B?ZyttK3RYT0twSUZrRnVvcitsR2dqaFJSWXFHbDdIaWJGUnhPUXlaMW5Yb2tL?=
 =?utf-8?B?K2xuUWlvTEtMZDlubk5WYVlodUEzN3Y5RU4waXZ4NC90VGg5RmFJMjErWFhF?=
 =?utf-8?B?WjdFOU1rQjRKeVVxSkJaMTJ4dWFqK3VOdytHNjNRZ3JXd0tXUDg3Y3I1dXRq?=
 =?utf-8?B?aDhNT2tTc1JHTG9XcGpGSi8vYldQbkNaTWl1TDdrRTc5Ky8wY3BoSDRxQm5W?=
 =?utf-8?B?ZTFJSVlwQ0VKaGVLaEZJM0NUenc5b2JSaThEVkM3TG1lWXkrd3Y3djVBK1Z0?=
 =?utf-8?B?NkF2S0xra2kweFhCcUNSTXNjWXVCVWx3b2NLY3d4a2hLajliejYzU0xZbWxl?=
 =?utf-8?B?SlRKeWhFL1VYUy9jVXdWTW82NHV2MFJSd1EyTFI0L3FGaktmaFNtK3hqMm9I?=
 =?utf-8?B?b3d2Z1J0VGY4dUdJUFJvcE1KazB0N1k1akRlc2QxYndDOUtobTJlTllLbjZC?=
 =?utf-8?Q?cokRMt0mgDEFZdxVeeOkIGo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGFTcTI5d1Q5YXJHMGFtQm5wOVZUYzNEK1o1ZHVrcTZ5YVdqZzdLcWF2WHFS?=
 =?utf-8?B?UVpvTnlNNHR1MktSb0d1b056NlJ3SG5yamtqSUdBQWE3UEFVbVNvOW5EZXVs?=
 =?utf-8?B?ems4VGsyVmtQVXdtc1dCUU1rREtsUTlERjcrU2VpNWJQWHBCQVA2cGN0SURo?=
 =?utf-8?B?elBHa2ZVQWYwMG0vb2lYRy95YXNHY0w2OTYrQzV3bkNETktXdXRTbGdsZEN0?=
 =?utf-8?B?VVNsL1pIRUNaMnA4VU9Hc2VFa2k5UForcnhuUVZhQTU3cGZydjluTWE2RVZK?=
 =?utf-8?B?N085U0h6MENueW1sR2NKcGszUDVjY3VSNlBsRXdvNVFBdWJ2ektNMnlyZ2VH?=
 =?utf-8?B?eFhnVlpNb2x0dzNSR0tTY0o3U04zSnBXUncwZUpUWEJKSElTMGp4UXU2NmVN?=
 =?utf-8?B?cmtkbDIzeTZUZERFS1BZdHdHTnkzYWJNYUxNOENQZGVCSkRCWFMyTWhCaVhC?=
 =?utf-8?B?bnpnMlMxOXlNUE9VNzZKa2IzY2xtdXF5d2Mzd3cwWXdyeER2VGJVUlc2R0M5?=
 =?utf-8?B?aTVKRHNoSkZqNVMzL2NFamVVNElEczNMVEQzWG9sZGIzZG9zaXVHQUlTdjNq?=
 =?utf-8?B?YmF2dGhyU0crdjA3MURnaVVkeS8xdHY1alN4VGlaZE0zY0drWVVtc3Rhb1B4?=
 =?utf-8?B?ekNvd1dISDhQV3pRcVVxSGg1TGVZK2IwV25SbC9HVFhmRG9jeC9pWDl6eUI4?=
 =?utf-8?B?TWVGMTdZVVVQOVdsdy9qRjVPWWNtQkhOV0tvWCthdjFxdmpwNXJQVnc5SXFq?=
 =?utf-8?B?TTdQdzdaMU81OWowTWxkaVllODZBR0VNalZTUm95Z1gzSS9UK2RnMmhrcHVS?=
 =?utf-8?B?RFJxd2xjcXJWcXl4K09SMnpGbGdJVmNYYWVOdzNFSHR1cVhtYzdJSTlyeTFY?=
 =?utf-8?B?MnNuaWRJaldJdVh2WWhMZ1AvaCtFQ0NKWXBSbGFSQ1ZEQ2l5VDFIRE43Znpn?=
 =?utf-8?B?WW9NbnNiRzl4NFdqZk1Pck1OZHdabEFyZHEweXNqMGlscEhGQTcwL1Q5UXF3?=
 =?utf-8?B?TFg4VlFYOHdYczJWby9FK1hua04xTnBZbVZXU3hLQytMbitzUjRobE1KT24z?=
 =?utf-8?B?MnVsenN2TUR3L1lGUXFKbk5FaEFzeGRYaHdNNHcxRjdmVS8zL1ZnV05XY2V1?=
 =?utf-8?B?dUNwK25PbGJoQ0RzRXk0ZmtqNUtjSG1EVCtYZkJZMW13cVBoZ2hRa2pENW91?=
 =?utf-8?B?cFlvMTJoeHhqWHgxSGhSVGF0UitXOUh1bTBXdVNIQ3dZOXNZNHRORnlkMHQw?=
 =?utf-8?B?MWJBUUhGajRncHRoNURHNmplSkVwY0FTS29mTFRHeVZqTUlTN2hrcTFnVlQx?=
 =?utf-8?B?WTlibWdwU3ppcVljaXVZcmVrK240RlB0NWNyTXlNOWZUdVcxanZaSlFkTzV5?=
 =?utf-8?B?UDYyRExkcHRDSUFZaWs0bTk0aFhUaGsxdCtSL3c4SXFyMU1zWXhkTE9oVWFz?=
 =?utf-8?B?SlROdmRQTXZYekxzeFM1cllTZHZEUmY4ZWkyTVEvRks5UDQwQ2UxVE1oUVM4?=
 =?utf-8?B?ODh2TEpGMldBYXhkSDJKRG5wS0hnRmh5aG1rWjh4VUpRZ3pVMHRseHVWVUZz?=
 =?utf-8?B?VERtY0tFeTNiWnE5eU9Ud1BWM0phSzIrSlFpWG5WTXUxdGdORXlRaGR5eXRx?=
 =?utf-8?B?NUZtT1Fua0dGR1gwbGdmVFBXbXo1SVM5VGxsbUVVOG9welNsL1hOd25lZkk5?=
 =?utf-8?B?RHEzaHRjNEZEbzJCUkRPN2NPbjBhZS9MZExWWU1iS3lpbCtsOVkvclJzNG82?=
 =?utf-8?B?M0VrdzNxUk5SenNQZTN3bUp0QkhiZXBDK014NnkvekVhWUhGL043c0l5ekV1?=
 =?utf-8?B?em1lMnVVQUNveFhSa0RqUEN6cVpwaE5xbDRrTGJZOUkwb2NvWGEzbm9SVVFI?=
 =?utf-8?B?bjh1bUpTbFJtWmRWRkZVZGJVdWR3dXIwdXlzSTVCMndObVpzdUh3RUlvOXpp?=
 =?utf-8?B?cFlKckJldUZ0bGlOdlBmTStYaDh2MGNJRVpWeVBxcS9rYnNabzBZbldCM2hU?=
 =?utf-8?B?emRBNWFlNEtoOTc3aGt1Vll3VDE0VGZXSmZZdTcvanY4RmFtZEVwTjdKWk9W?=
 =?utf-8?B?NG1iMHorS3k5QWZ5b3o2ellQcXJQU0Q1SXhtVUZJZVFEaDFSU2FYbTU5YmNM?=
 =?utf-8?B?ZSt2Sklrc3hvaG9FSlNqN3R5RHc3T2IrS2ozdHlRR09QbzZYYUQ1ZVpHTG1T?=
 =?utf-8?B?Z01HVXZzWUJkMEFHK0FyVmtNMHJqVitMM2o0Yld4ak1iWGJkMkxDMG8wbFlm?=
 =?utf-8?B?cDY4RmgrYkJzUjBlY3RyTGpPQ2NzVU5QWWsvUHNnMTZTelRLYjljQ2w4SE9z?=
 =?utf-8?B?MWE0QUdxMWtXU3BHckVoampRKzAvc25VSzFwOXd6K3JyVVBkS2F1QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73f4c46-03ac-47ae-3240-08de59ac9199
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:51:24.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7IXI0Jd/ao9oaaH6pKNyZwKvnntWzHaNWFqaFOS3uR3XlgU+HVWxemyWmtq33y9U7ukFWI0Dg1N6jz+H0pu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9801

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0


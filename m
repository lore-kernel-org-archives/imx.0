Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2055.outbound.protection.outlook.com [40.107.247.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD01FA14B
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877412; cv=fail; b=Txkk4fHapnRh7iEdxAF7so8mdVDcLmp8OhuijGjGIfXhM0ofyYHMVK1pYSKVz2xf1yOR+EuGdXUfdOImWk9MtlWqm0HqCFsCpdIUUQ/56hHCY/N0C25ri5AifS8rXP/LT9msBHFM+E/u7pK3ZcOAOQJkJMheJo2xRO55NA087SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877412; c=relaxed/simple;
	bh=dLBNH1hu+vHbmzWEMIyE8u73fv24aN5J94XxaUvpND0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=W/Ut2aWcZoHXBhHEX48rcfOz7F+eE+qLsojHkq8uLb88/3kGQZew0A4+03D/BnnL7LLkpm2TGqccZ9bxvfu/X9ASDOEZflCnlK8IFWFB6cu4l7Ik0OUU5g/e+pQInP6sFMb0C6XvFCKJkVkhB2mmn9B++9/0n8lw1qutqxp+jqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WQep4WEg; arc=fail smtp.client-ip=40.107.247.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WQep4WEg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABpxtNZ4hI0tt+SSY4TVbaDFRGRrlI/3cSGIyI6A7tNWT+WeNF4WMiVHM5kBf8hMOaGL115pRyUWDmsM9YsRlriJroCKaDrFDZMBgLbpnxpatjEeCwLm8lYU8sK+eWnGfeOMRqjJSvzkTtZ1UzqVa8Pc+p22CS1aOEkS7Rl0Bc9Ugogcts5x2GEU3vBfzFzrTmwx2AFKPDqdkkNklzXVaFFKvOJyzrm1oFdPw5iwMAm3SZ0n47yB9X10q7BeS7rgkPK7Vnxt66mlelsggcM/J208ZMGrIq8q195vZANDwK3JXzIpNS9hk5z5t/y4CPEieDeYVO1rMm/ihnaWQCUS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3qpOMPipCzwyqD7KaF6CCaQL+gart15uOWVnj1NnAI=;
 b=iXMR1WTglQjEjSDh0Mn8iTGO3Q8CAEyj8hMorF1mWf3xk+1atS8hHTwwXgJ4nRaFTTh1fpRvyZQkfTbC6ZGXAGvY1vYHMAIjCpNqFC636/e+NRLJyfuZbj8ottE/zobH0NGSDY8PM1LqmlTjWl7kprmUaUjl3FTu5qLcSIbgikIZLYR/SF8frdUTw/YCwBrTDNYO1jZz7dBZoPOK5zVsAFi8uA/+qL9MmpxPRbLla8b4MSJT7qwCt9hrRbR5fzchcCnOIDik3wmPh5CR+cU5A8sAjJFhikYkAz78xIZNuvGMiDcH1dhCBMHsV/wvqs51jxdezuSbkHcJqY9LnKAeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3qpOMPipCzwyqD7KaF6CCaQL+gart15uOWVnj1NnAI=;
 b=WQep4WEgAsl93uA7fRFx13zZN+UmvFomJM6H/zL7MuRY+HUfkzjdZMfZFVucEcLuwfqc/lmXDiEM2iZKSV5YDMkHi8inWIra8E530WnQN9WUYL7vbOD30Ye40fumCMGhewWKM2Nh1cJ+2jnFt/+YI4toDk5/YduI4VnU7GYAl4yCquCT3mX5woyLJUk+Lg6j1i6UibJPs7A+yKyt1rc3IhR5glpD8Fr3T8/oLyiJmfwkOTqOFrdZUN02NghpCp5Fx4j3nuFX5nS+Au8pjUTTCXcU6qjYx+29lavPmb1m/l0/yUg9OLaGf0SwZ8wOyfKpnB5lcnQd9qfqsEq3+QRX4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10396.eurprd04.prod.outlook.com (2603:10a6:150:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:56:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:56:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/4] arm64: dts: add imx95_15x15_evk boards support
Date: Tue, 14 Jan 2025 12:56:23 -0500
Message-Id: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEelhmcC/1XMQQrCMBCF4auUWRuZiaamXXkPKZKm0c6iaUmkR
 Erubiy4cPk/eN8G0QV2Edpqg+BWjjz7EvJQgR2NfzrBQ2mQKBUSoeApNepOKpEStanPQ68tkr5
 AeSzBPTjt2q0rPXJ8zeG94yt9159z+nNWEii0lWh7Y/rGDVeflqOdJ+hyzh/a96GkpAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736877404; l=1003;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dLBNH1hu+vHbmzWEMIyE8u73fv24aN5J94XxaUvpND0=;
 b=EO2PZEemxPMXlO88OYZ/vAGXhinqHMJy0mLXHCIEC38768ZRa5lVZBtCifBFQMXq/JSkJKwXK
 0DoBE8iVMnVA2duA4VATXj16XydaKjEl1zoe3DtdQeKqSg8Movc6mhm
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff86790-68d5-4f31-b60b-08dd34c4d076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K201V0RsYnZTZExWS2d2Mjc5UFhsNnNFWmsxU2d0NEc2bUsyYjNrQTNQU3dD?=
 =?utf-8?B?N3c5dFg0UTgydmNWUlNjakltT0FleEJMaWU4bTRvYVA4V2pjZVlramRraXNH?=
 =?utf-8?B?VUloOWdDUS85VmlXRWxhMW80TFhYUGRXK0ViVmFsb0daV2NhMVhQODBUbGF3?=
 =?utf-8?B?UUdvcFQzRllxdHhvVW1Rc2pZSCs2ZDYxeHJKWkd6S0FDWkRzQVY2MWNuTGdX?=
 =?utf-8?B?eTRxYTNlSm4vd25WbTFPSVF1TDE5VW5ud1pTeHpKRm1lNTlidEt2KzE4cEVy?=
 =?utf-8?B?Qlo1YzZBUTlacy9DUjNoV2ZicnREWVk3Y0hya0U1MmlzWFAzM216MUQ4MXky?=
 =?utf-8?B?NmlJdHhpdWFqVzB4WDVtQjBFY0RKclBsT1NjU2VPK1dkWHV1Ny9HY3hkSE1F?=
 =?utf-8?B?ZXl3TzFsNDVmUHMzTVJyNjk4RXZ4UjRITllzb252aWpBWFR2RXpRY2d0MGdC?=
 =?utf-8?B?NCtMQlZiRHJpeVIvVFlhRVVUclczTEJLU3ZRelpRYkw1QTZmOVV6WGh2dlZ3?=
 =?utf-8?B?NDYrbmY5QzNCb1IxNmRhQUlZNE50N1FUT2dzS3cxT1pCOVgvRXFjcW8xcXpy?=
 =?utf-8?B?TnM2TlZncDhIeEVVUkJINDdwdXhmSDVBc0JSczM1RHZ1R3FMcy9TQjNvMDU4?=
 =?utf-8?B?cUV0ZS9ZTHNqN0Y1ejRuVWpCZnRrN1FEcHhleU9rQ1J4d3lIV1JxWU55VEdQ?=
 =?utf-8?B?VHEzczJNeTNWeXpPNThVT242SkdQQkgrd3FJK3Y2VFFuUEgrQTIxb1VIRGZq?=
 =?utf-8?B?RTdvMjdtVVFnMnFDNC9iVG1Pa3F5cmxxV2c4aVZxbVJxQnliR0p0dG1mY3FM?=
 =?utf-8?B?SWswTzJvMytrQTU0QXNvTjFBWndSUnNEdE1kSnB5UUxiNXlKampsRTFIN2dG?=
 =?utf-8?B?UHdoZ1Z4TURBQjlsSDR6WXdMR09RdTVibnQwTWY2NjIzMnFXWmxKVS9oS082?=
 =?utf-8?B?RjlkYW5Zamh3bk44ano4TUluSHJpQXFwK1Q5U3FtUnA5UGpCaDJDTUtBb3pB?=
 =?utf-8?B?MlVzQVZiTm5jWUpEMG1oMERYejlQVDE0MWRKM205citOYWVkNHI2S3J4bnBx?=
 =?utf-8?B?NmFKQXhoS1BnRHZqQklOZEFKcXRreGZIY1RUMmtXZnQ4d012M09wcEdWWEZj?=
 =?utf-8?B?ZHd6Q21OL240RXFpQ1M1emk2b2J3Z2JpM05CelNXOSs1OXJYcmdEQ1VRUndQ?=
 =?utf-8?B?ZXB1bnFRdTBBUEw1bHNvZzQvUmIrcnc1d0NoY09FcXJOeGowMFdzeFF2VGJa?=
 =?utf-8?B?QVZBeU4wY0dRRnFyMVptc1ZjQ1NMbG1UamxaQXR4aGxZc09CRUIvR2VZSUV3?=
 =?utf-8?B?aDJ6enhBSGFNaWlFNUczeXFxMnlpZjBCd3Jmd1JBcHloY250T2RJRVBYK3lU?=
 =?utf-8?B?K2IrajhZZmZ5WGtKWVZ2K01MVXhHRHVaVFUyN2p3ZmVEdU0rTDhGT09RdVFI?=
 =?utf-8?B?TFZwZUdQSkhWaVBKQ21CMWZDdFZYK3JyM2VOTm5FTGFnanREM0g5bU5JNjVW?=
 =?utf-8?B?bGY5UzRyUmFNWVcxSnMxbXR1R0Rha0RyK2hScGl2bFdYNnR5WkVWTkxFU0xT?=
 =?utf-8?B?SFF3UWpzTlFOU1ExdlUzb0dyeC82RHQwSG5GODZ4cWlHSTJUSlphVStuWnhT?=
 =?utf-8?B?NThibjNDa0xlR2xlTDZkTHhySmRxdDh3RUlNblArbkUydzBUNDdTTFhYanRn?=
 =?utf-8?B?QVJsd25DdGRFRU5MdlpyLysvdEcxeU9yN05xUWhFRTRjVFZkaVhGcWpsUnNE?=
 =?utf-8?B?cWF5NEFUdHdLdUVxbDVBcEpicWhGSnJlazlBWFpNL2Z1dXoyczJsTE1FNTdS?=
 =?utf-8?B?enFSc21VZkRDblJDMGRSRVlHZzJpM1NOVVYwdCsxSDhzVzJtcmJsWHFQTHp3?=
 =?utf-8?B?a0k0a0J2QkhrM2JCN0J1VldMTjgwL3JQV25iY1YzUzBXcnpkVHlWOHBQNkVi?=
 =?utf-8?Q?KRCJFRHMZRpFSrc/JRSpM/ZtiYKORQfv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3hnczZnWmcwV3k0WTZaSTE1VVVCSXJXemNpSHNQWXYvQzlDTzVJd2htdXpG?=
 =?utf-8?B?SGRjQ24zUDVwWGJnUnd0VDVvM3ovU1YxYWVYb05oN2hUbDZ6bzZsLzlVRGFC?=
 =?utf-8?B?d0NTbVU3RHJ2dmlCdFBmcFplMi90U2ZvV2tmVFlUbWpPRGlLZ0I3dUFsbG1y?=
 =?utf-8?B?VjN0OHZ4cVRMaUluN3JSR0ppQVdyTHpLSENmemJMNXRvS2N4NDl1MGIyQXlt?=
 =?utf-8?B?TUZCMlRpU2FYMlE5NXFHK01seGNCb21ZRnlrVjhUTXE0Y0cyS1pkSlJuVHBh?=
 =?utf-8?B?SkZuMjJDYnY2dUFCV2RpR214b0hPYVYzTEc0YmVMMFV6QUd3enlQOXZ0Rzlp?=
 =?utf-8?B?dHRPYXNlT0tPWjdoV0k2WnlxTjl0WXg2UmZydzlXc2RrbEthTFVvdktGNXRj?=
 =?utf-8?B?TkVzcmVORzdZTDN3RmI4OVFNTGd1bS9hMVJvNVNxWVFCWWhtQ2RoemxsZHdE?=
 =?utf-8?B?Ykc3OWhkRWZBKzRrRDNORzkvMmk1S1V5bjk5QnZ3eXhCTklrK1RzckRJSWwr?=
 =?utf-8?B?aTFuN2NzU2Z4bFlvbElmY3kxZFYweHh5UHUvZnRQd3NPb0puRzk2T1pGaVFJ?=
 =?utf-8?B?TUVrTlBEemhLY0RRTEJBREY1aXNJb0dGRTJqZVQ4RzAvd3o5SlRjVGpUZHBN?=
 =?utf-8?B?SS9BcVNLWS9oT3VqNEMybVIwWTBRL0g1N2lVUFdiZDV4ZU5BVnpXaGhaUTE4?=
 =?utf-8?B?cHZ1b3d6ZmNJazl3blMvWmZPdkRMWGdWY1hsOHJUVFp5cHgweFVHbEhSY2VZ?=
 =?utf-8?B?Q3Z0SWxlckFQQVdpS1VWMUh1a3RHYStCNTRFNEQzWmFlSDA4OTczcjVYaWtT?=
 =?utf-8?B?OGJtZ29iVlV3a2ZMM2JFZWREMjlUVzU2L3hueFVxRlRFQ2ZNa2U5bzBnUER1?=
 =?utf-8?B?TlRmcXhiaVF5Ti9TR0djNzg4Vmx2WCtNUnd3MWU3b2V0djlwS3FVcUkrTHJl?=
 =?utf-8?B?VmxzUUxGN2xXNzFxZ0lTQjF5d09tMTZkKzBqbzZCS0hzZ1FVSGtZeFNPbjJJ?=
 =?utf-8?B?emlTUzh1anhKR05VVHVuSFBVeFJwVXFEV3NTSzJJaThNV1BLSEN6eVBmYytk?=
 =?utf-8?B?Q1UxdGJVME5saTBYTTV0YWJrOE9IU0VsOFN0SGsrVEdQMFQzZlFhc3o3Wlo2?=
 =?utf-8?B?b0tFc1BpS0pFOC9FRFB1Nm45MFZmN3p3VWtEVnlTWU54NlVDdVErNkhRU0hQ?=
 =?utf-8?B?OXFnYWlyUnQ5NHAwRHBJWG92NkM5a1dIdDhsM3hlWjkzQ3hzZGhERmRvL3Qz?=
 =?utf-8?B?SldHZk56SGhnV0lqS0QvK1lWRHJZd21JSHVad3Q3OWJrTXU0Z0JXQnNPbGY2?=
 =?utf-8?B?QkhSL0poOW55cjA5RnVOTWJyQnJnVTRmS3l2UUR3QnIyKytmd01LakpNMzZo?=
 =?utf-8?B?eloxdkltNjJ3NHFPRGhCYStGb3lCTm0xVlB3SVUrVDhsaDNDcW5HTjd4NmhT?=
 =?utf-8?B?NmdDcmY5aWpkTWFEV3VEWlpVY0dxWkVNK1p2b1E1S25YOWR0YktUdnh4dG1j?=
 =?utf-8?B?cUxTQmtjdXJyWWtJVENqSVJPdDhOU3pGdWw3bmFOK0Vsb2lTcDNDRDcvODQv?=
 =?utf-8?B?MHlSSVhIQW1lY09rNmE2MFhRNGZTazc1Nk1XbXkrdnNnc0xpRC9OR2hGWi9j?=
 =?utf-8?B?UDhTenN1YTRDZVZtU3BtWFI5SFZ0WnVoamI0M2pEdHdWVUtycDBsajFUQ29Q?=
 =?utf-8?B?ZHgvejZuaGVPN1lrT1ZNRkRhSGVMcXNpbU1wci9aUDhQZTgrU0ZuOFlhN1M0?=
 =?utf-8?B?NUdiOFRMTXErSWFMcWd4ZDV3bGdEWkhOYTRqU0h5ajJuMi9USWZRcGJKUDI5?=
 =?utf-8?B?MThKamR1TlBTZUtFZDBKb3Ntb3BWOFhQNVBhcEc4cWtBNXIxTXdHTUxJYnkx?=
 =?utf-8?B?QUhDdVpSK0c0K2RXWVNUajhFeC9HVHlYRy9VSklWMlRoSE10cmtsblpMUFla?=
 =?utf-8?B?d21qbzZpOWJDZWQ2alFHQTJadHFQdU1BY05zQUhjRlcyY25QSkNVNmlaS21O?=
 =?utf-8?B?MmtIY2dvYWYxck1BMjUwL05NRzhKR0hiZDNZTGFhdDV4U0xBYkcycFI1Y0o1?=
 =?utf-8?B?SXYzaUhUS2dwOEJQRGp0TmZUcXBZRWhDc2UvU3doazVzNnY3M2J3SUcwNGlu?=
 =?utf-8?Q?qb28=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff86790-68d5-4f31-b60b-08dd34c4d076
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:56:47.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGhAZenBt1bfk/a9lsX83KTPm2GCVO/AJcg6akwWs1maqkgRmFuaY7zeXgqTCj7gA/7p36dhonm25BqTuIn2Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10396

Add related binding doc.

Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
boards.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- fixed typo 'inctrl-names'.
- Link to v1: https://lore.kernel.org/r/20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com

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


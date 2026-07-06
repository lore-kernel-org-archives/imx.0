Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB82438C2A7
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351682; cv=fail; b=RmvQkYC0LjhhuaHWgVoQ0y94ai7X/EHlqaIoT/9DfK4YJs0O6toFbmsU97/ZBzxiqKqhT1Lf2WIQgUS7zWix2OoIEjZhgrkwGEs+hjLB8KaI71/bZ49RSYGIw9Bk5AHBrY2J3paAy6PkJ+6LdeSFsGGNgLmcfpJyBp92wiOlm3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351682; c=relaxed/simple;
	bh=UZbsfh+8qOWbKOYDJa9SngKl4j17jRYoeTy53D4z2uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=akrOxIJD43v1sXXw0t45HC3J57MHumAEaBWt4L2PpauV4kV9IVkPHOr+NoF7hubjkU6pDAVkMrm4vuSvaaEyLqn1EHtmD13tYP9PSlroS/SKw8QfQVBRq7aOtQhCz89kMucZkeapnDglFSrdaUCn+Fu5WcR9LZfZrlnxIHmFhPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Oe22bWa2; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Oe22bWa2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtQdL9RVP9mqMikWLTt5Ik4IntzWrJpkm/3IxKeP06okgpOo3zk/uErVslBV4uc0x7MIoTlJMfNbzphvmlZ74Q5bKXb10jVw5SvPOrni4Dsxdwp12r52SJdCj9jj2xrrd1AYIVEKJUV7fDHOav+ZFi+qC5kjcHx8eWlN9Hp1g4ZuqdnCej+aPmkRxokHR2HqMwINA0KxK7yiqIRwxOsW0zY9/KKeUM40SxM+8y0V3Z5wxjTz+d4zE12W+2o0NG8D90purK6ocamTnDg9F9euIznJI/c666LKT2nBIqcQHVlvuH0jC+6nxlibcqdv48o23aCul/ITto1BNZZFnOILIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eomb3JuyWkDvmD5FE1h5a+nV25tHrQe7LrxK41ZEy9U=;
 b=GZQiSlQsYGK4yTnBo6XNJr9lQV8kqIgrKN2N+jr7yApxrZEmkhq6RoBlNH4FFfv2HphxtR4BBKazjJXqhztRnl6TCLlt0PthKVj5D0x4Cjg15r6nCgrMkRtWOXkNDeoA93A13Kcyi0JdfpuSMsoLZ0QIT7ChUjLC8bTsVR8orouvEvpKjnPr8RnD2TZAyxbD1Ki8xpVmJPeQXRZawA5ckNKl2FI3wABBtwq9bOzFkBlVRxPuopx/acvfKPbVnZG30MXjKKO/t+U0Z6RtcCrEt6nFVDN9K7Rh8oKAZxgG5apoqRsGtRvM5Z8QG48XHEZ2AXgbuU6NSGJYLukWvWCQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eomb3JuyWkDvmD5FE1h5a+nV25tHrQe7LrxK41ZEy9U=;
 b=Oe22bWa2ePHahvQskE8LWxIhy3Zb7KsO8ZSpC5FM5ebZ8+Pi/iVp1rFmKWSMNYr9jx2htj2Lt+IhmClsXW6PVjLt8bC9iveF5/gAaYoH+DMvHUrdqotGxYVHaAfpKzLbgmfGD6Ng2BiyQr2Q2PRG7WxsdqCNB2NKNd/T5cYJKkqilC0sHTvuqNAxjsIyg6qFK8rvj9wvExURyja/vrxAMHJSPhr1wBCC8wNnrE9dQV7Q2T53oV3jl0O7vLMp8XylO0w06u3zINS1zeetMX3wkCt2y8ej3mWnzb6sthYSybay46kl7jxXSMiu1zRqNVj7uuY7cRL5l0r58uiYmmZODQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7483.eurprd04.prod.outlook.com (2603:10a6:102:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 15:27:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 15:27:58 +0000
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
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v6 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  6 Jul 2026 11:27:38 -0400
Message-ID: <178335164745.1364211.8204247462803241878.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782898728.git.stefano.r@variscite.com>
References: <cover.1782898728.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:510:e::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 832f3864-1dc5-4798-19ab-08dedb732837
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|7416014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 /v2beoo8zTHnxZd+tbj40vxSYHDRLdSSHUn2bHZgduMCyaVWBc6H6MF3QCXAadJECEaEE6xHzOkvuR40Xe06fho9JMLk22IEuZ4w9UIHva95z1VhiAk8ctU0pNL18IY+DzMy+zc46PdXQrdxhnp6nTtjKqnTGoazQzJlIMDMVqd/LZRg1U3TfhZU/wpKHhJhunJRmDdHci65cg37Xd9jlwgFiWsqKK/ju1GNZMMw9MkqhRtDaCUOlX1B0YO2jBY6jJ7HcmdAMyc3yPXzjIrlkZVKdNYBS6djuoV7vMjxyANQlVpYHWrjOri2ErBG23jBe2IjFibPN74pPtUzc9mNg7TvGAsFgmxstukP4T00vg1bY3uoSX2DxiEImkiDzMkGK196sqj+e/Vemfy08Ov/0burXij4dPyKM00S1OQuldsXP0TY3QYrUp0Ei1clpQKNv/x4KLC8ERUGAtNwgKnt1UTtXLz289Yb87lF4g+9BnpT4Gg/AbcoaqoY1TjGBL1L8aLyuno9XW9X2HwLM6ISDpFK9WOIW3l88ipspEnWbY00yjGNm/hsmPYQch/bgV18Il1G71fbVu2fr/6Qxp1GenAOmmNq87isXlq5A7EO8xhJUigU7V9Urk+EyL18JVRi3cTvmaXZTb4iBByJuve8tZlqa/PmrUHnowJ+XI/njy4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WTNtRmF0LzRVWUFMcHQxbzg1VEtlU3NIc0NIRXN0WkZrNDlzNDU5VE9mS3FL?=
 =?utf-8?B?UFh4VFNHSzZ1dDFCMnZoc2t5TUFMK2FLNkMvd3FjRk1RRWNZS25oLzlvYTh6?=
 =?utf-8?B?SExEZlRCc3NsbzJWek9lR09XN1pGdlAxS0xXL3orSlQ1cG55eFA3MGpDYmZh?=
 =?utf-8?B?b0NsejgzRXp3R0ZpemdiREVBNCt1TXdoT3NFSnhpMGlOVG1zc0NNdzczRjBx?=
 =?utf-8?B?UFYyZmFBWm5DSzBBSTJxNFgxK1pub1VVMDJwNVJzZDE4eERqaThjNThKMkl2?=
 =?utf-8?B?cFNQMzZrRFhyV2J4ZC9FWkFmeVJIZ2d5SEtIM3BjRm1CcmNVeG9QUDRsVjk4?=
 =?utf-8?B?VXBiZmRvbUt5S3ZXN0pKTW50ZTlzamN2dm11OGYrdlRPeTF3VFdML0JqM0RY?=
 =?utf-8?B?Rk5iaVdxR2JiSkFmRWZzSFlYalV0MTB1bXMwcnlrZGlhc0ZHaGNHRDQ1MEtm?=
 =?utf-8?B?TWhWSjViTE1nZlphK0EyWEt6Szh0Y2szbXMvcDNHRytXRVgrcmZLT0wrQTB5?=
 =?utf-8?B?Y1NQY21iQkptRTlLUFEyUVlPQlIwVkplcGN1YWNXVGpuWW5BYVprMk1LWTZz?=
 =?utf-8?B?RXU0SnQybnllOHgrNmswd2UwNzF4WUdyTGozelpjOW9XOXVxQWhlUUMvdjcv?=
 =?utf-8?B?dENhNWxsZm8rYWx3WVRqMUQ5K1MydHIvSWlnWGFPcWlweTRSTit0Q2d3QmNi?=
 =?utf-8?B?eVdiTTBKc2Z3RHZ2WWtweDVQVUZlSGEyYThhZ0NSeVZLYkZWWlY1TUNDMmtV?=
 =?utf-8?B?N1dmNlJzYzlpeTNiVGJjc0hjbHNaaUNsaEV4NDVYeFJWblc3cUNTcS90cjl4?=
 =?utf-8?B?dXVwRjA1VTN1c0pNVjhRQWJRbGVuRDM1cHFYU1BScEJyZHJCQWxtRForZE5y?=
 =?utf-8?B?YzE4RWs2c2pEbUFFMjF1dytZbXB0NHo0b2JqL1p4T2FHYVgzVmpuQWlaSXY2?=
 =?utf-8?B?eWlPeDllLzVjb0NvL3BLWkdOekREMHUxWWRiNU8vTldFNXV1Um8xWXEra3VN?=
 =?utf-8?B?SDRMZENkdmhNUUxxL3VacE5zRzFiOC9xS0oyaUNOVVgxLy96a05NeWF4QndJ?=
 =?utf-8?B?WjJCQjJDZS9HYmpGNkVXZ29kTWp5ZWpYVVJCVEdRMkl6anV5a2J4aEhBeWJo?=
 =?utf-8?B?UGhhU2plQ2ZMdTlhN05BTURtWlMrV2xBZTNITHdJWW5SdDRnQ1d1amJvQXNs?=
 =?utf-8?B?US9xTnc5UWhJWHplcmxWU3dPT3UreS91aGFyZkMxWDB1VjRscnNLY2xyZ2V2?=
 =?utf-8?B?VVBBeWxETXArK0pjaW1tQUllTnVSZ2ZEM2hQdmFYOXpJb0RlR1pzTkdYSWZ2?=
 =?utf-8?B?SGVWQjJaamdzMFhObXdoU09JWktKSlQvUWZBNjNIVFI5aUNPR0RJdmgrZDFB?=
 =?utf-8?B?RWZCUnZESU95K3Qyd1hpMm95RmgzUVhJVlBuMXhwaFBjekNoZFRlWmt5Rk9i?=
 =?utf-8?B?T2tCYmRkaVVNZjdmMDVXSUErM2lIMXdUOTdwTlhqZXRNL3V3anRETEYvamhr?=
 =?utf-8?B?M09Fb2NCNkNEWkNRZ0s3emQ5SU5JWERGWlZGYmFRUEtUVmVFRG5hTWRPVTFn?=
 =?utf-8?B?WFZmSGFqcHFBZDZXdFlaRjJiWGdXdDV3cm5SYmg0UGtBbjMwdnhSZmxHcHpF?=
 =?utf-8?B?VzF6V3FVS3JQRTUxMVVSL09HZkVSVUNRQlRqak9qcW45eHlldGN5V1lEMkNs?=
 =?utf-8?B?NzZFRkZrY2pRT2Z1OU1XRlI0NE82MC9qUVh1Vm45UkNVVXhBUUxNNFZ2eEU2?=
 =?utf-8?B?WThxbXZTUEhvY3Bwc3pSVDFYWDhkcktyOVRMRWtvZWxFNnBkUmRPLzZNRUl2?=
 =?utf-8?B?VW40WTdIb1pjbi9UUm56dlZySjhRQno0c0FiSUpMU29Oc09zK1E3Q3dMVXh5?=
 =?utf-8?B?cUdPek9qSzhxazh6S3BNZ1E1N1FHdDVWazFOenhJQlhKSFBnci9GYklKYkQx?=
 =?utf-8?B?T0c2T1NwL0pjNkdWUE42a3FkUStmQ1R4eTAybjBaWk9vVUdodzVnM1FPZXJ5?=
 =?utf-8?B?YkVXQUh0ajh5VjFWVnJ3anVxRGttOG95Rm85RDEzaGJRb1ZSdnIxN3NwUWNn?=
 =?utf-8?B?SzkvSmJKREFCMDRGUXpCNnl5Vmx0VFAzakdDcWZyY0grNnpwc3k2TEJTWWRv?=
 =?utf-8?B?NjV5QzNpdE9wNU13ZElvY3ZnREQzYnhwUGE3RUd3MGkvRFNCSG9OWTY5b1k3?=
 =?utf-8?B?WXhpOTFyZ280RU5kM0hmVHdLMndRZUxHTTNBeHBQeS9BelFtV1VNVHk1MWdT?=
 =?utf-8?B?TGFaMzFvQWVFZlNrYjBOM2pIcHVSdllRNXdIS0dTUDBRWFFNNVBZaVl4NnVz?=
 =?utf-8?B?cUxQT2F4czV1MnN0aFY0NGUrSDB6Ukg3K2FwK2VKbU1zVEQ1czdmNUNRWGdr?=
 =?utf-8?Q?TjLu+xyqG/RkwYEwAxDVk/np77PoKZba/aOWl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832f3864-1dc5-4798-19ab-08dedb732837
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:27:57.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLCZdVTkmIWSp70c7HATN4KW/9Yu0E6Jpzy0KEWtEf3iElHHE6yl5pD5ihu4+4C/A9nAc/4DkG/FDzwuwAhE3aaGpAECe6TyUF2EziQcTeVHrzmG/9aWRA20Hdw6fSFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7483

From: Frank Li <Frank.Li@nxp.com>


On Wed, 01 Jul 2026 12:05:54 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX8M-PLUS
> system on module and the Sonata carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
      commit: 77c0d4cfd43353e8bdebc4eab8e579518e2dbf5f
[2/3] arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
      commit: d08607aa231e026cd94b4c33077f8b8d28731952
[3/3] arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
      commit: 41cd3d91ca8595f48cae5169ff8e4089c88670f2

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

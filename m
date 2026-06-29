Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC54279F9
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749504; cv=fail; b=LV6uilpuCeq4bp3lX9Jc+y56FaNtBiS1HB9EExUl3UhMuNWCz1jTu4tm783RMVBDlUq3pcASd7fIrsPt/ZTMy54VhodWYcIBaUFwP34CBVicM37/hrs85aqRVsOCWJEin3KJzQISBJEsrxcjgnxUk2P7nu9XBCVmIG3bzozVJNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749504; c=relaxed/simple;
	bh=kMIYlDmE2Bd3b+ztjGnf3hAN5Lrc1IXJSWd5iNvAANI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTqGyXqWzL3C16uESejAaSQvlknLBQQEm1p4ieWALbrryz4BEjyNiyNsE7McEBFii9ahz03A1YPmYiblZyEtBfg/T5CNOz27huOMG2Wen+ab9If/yEDJ+RICUoe/wOY3p23YUNvhR3lU06sJ4TBZH20qfxiZvp6gi3NcJhHqROI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d6OU/0UL; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d6OU/0UL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uThqY8P2RPwrREqxp5Xr6FZclWgUWc2iTdABACLR/Zfd7yXj4ocmLsaEPnRogicMKVDL2msFvGXP0ZOLaz9lS0tDAmMUnasDYcXi3ERIYDrjKt01tsVhk8EqW+kDetunEXZlJbq9RnlWhgfyWXzIEWIAVEnT7jJVbfnUCudCVXvd2egsmnxMJBJeHxODcWDkOCh2ElH2ZM+ATFXbZ1z/Fa6CXwbJ5r1M0IOXxjesImf9BxhwwDQu0Ldr0zTejAVDgaVB0cXuM3KQxETXLSrDZ0eJG3BKkK67r+WKDWKHyUDsW14GHR4T/HiFxCK7gX0N1eRENlGOQE4teeX9nCdqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52sYgVXZMl2pPoypSyZD1aSkfKP4cbv4PDDtd/biNTU=;
 b=GLdh7mxVljeIu8tNtuMxJIO1x3wbziDkBTgx+DVQjuKJM0k6SaUsqe9OhVfDth+N4soPlYDa9gMnyXAQ5gpJ8OK2fpmWoQ2HBEnwFDgMWuL77t4v+nho4GCxN5pdJlnrA0Gzzva7vzh39VC1SB5Elck/CgvO/OhwRyP9HzlKwfzVrZqP4fAupdUWSELtgaSqneVLdCH+1QjosJ+VPVxTjrexAR4jaFKqQWLxTyK0OM7E0VgQwFJPv0xyV4aOPZinfc8EgEwYudalZOwV9uHO/dABRrQsaQd2MIpPEfLIY3YkhlOkuni9WA8d0MKJISkw2oooMtKJcbfjzrFDRG08+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52sYgVXZMl2pPoypSyZD1aSkfKP4cbv4PDDtd/biNTU=;
 b=d6OU/0ULRKSnO1VfYUPm+yPR6dQXQC4bbnyU0pZTrIxmyOSxNlJzNM5R3i1dYYKsONq0pqacMsM1wc/ehEj4c4O4DP4jZB6OrmFYTgK0vwGQQHYaTU2DZ0yNvldLl6Q3jz0gkTfE1n0kmwieoHqVQc0jvztHlWad3aqv04fiBg2SyyVdJEe3mhrc3eOMPMAmAnQW5zlObtDlP/UEW5eTncnqssX9ZdBv0Yh5cpZ3bb9K7RGExlpZLgQAtOxvin4F5cd9m9w3eV3AlZShPyRCETGax3qPLxC/s4GJNwoQnwHYWVzXIEUCpfAox44qMToYVSH6asCKTxDVRz6NywRygQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:11:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:11:33 +0000
From: Frank.Li@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx94: Correct PCIe outbound address space configuration
Date: Mon, 29 Jun 2026 12:11:24 -0400
Message-ID: <178274947494.2269247.5578929502580839250.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604023821.134372-1-hongxing.zhu@oss.nxp.com>
References: <20260604023821.134372-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a029c4-f9cb-4981-1808-08ded5f916a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	u+dLa0U2/StgLact/ndBcA4mJGe9LMHHiM9oXbEDgQhHjKD2pcqOhhlbK4UKIdlhGTu8TaP0DHb53KPXSHVGy76wE4dMlDSuH4VniQ9TmINqZc3z4+R2tjNQAT5KS6nkqq/s5oI+vFX4EmrJO8pxMMFQCXGvLjF+AJ1SKmPWWx0F+D+R8zavpVz4VA3Yn7Qa2EfXtlCNUyjxk3FGmbMhxBGpG4rQvde+8YatPdfuHy7GC/C+VJC+p9xUsxRNF998+3N2qnDxIryqhD9wnCaJH4d4L+pprdMZ0AsA0JvRT+46y8coqBfLSolq6RchtxbEVMngF1joaSXCRMKZmATgQpsmf3Him8uxmRDyCQlk4NXzsC6Fj3z5HUz8ato2ys25DxZrNrK2O5b/rJQ3QJPfMjmV94quOQEvuSjQedrbrOi3aCATropX9Vkw+Xu0RInW3e+jYD2owKgH4Ys/tc/InAaQEPiEO5GPCJjRc8WxaE7yjnp01kYBGeCTM1gZH56HlxQmUWehIw0fB9HJH3653vjilXh5NihYi9MKxsL1iBp3IcesPo1b5yjNopIbIyVBufOE9Sh5R7X9hJH8wSh15z44v1bYYLs0O5q6Mb5+KjIbdBUh6EvvIFb9aROjktcuYyafWIu50j3YgTXcgUek1BwVAgLWreJBteHbUS3QS2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzBQVG9OaG9XUDNqaE9SemhxcVhSWmZTZlQveFM4SW5RL0ZjNjZmWVBIRmZo?=
 =?utf-8?B?T0FFUnFEeW1ET1NyWmRxdW5wOU5sNmhSYmlvV1YwVFUzajRkMTZmSGtzSHNI?=
 =?utf-8?B?anVWZUJ4THdKVnJ2dVczcjNIK05YWGp4Lzl2QXhnVXovOEJqSUQxd2VGb01W?=
 =?utf-8?B?NXJoQjdmQW1KUFh2bnJpMjVjZVhqTUhkUXpnaTlqWXpGM2MrQkdQcnNjUVk5?=
 =?utf-8?B?QjNFWXg5TGlHcnVmeHg2Zk85R0NXVDZML0FlelhmSHZXd1JGTmxMZTlrcW1m?=
 =?utf-8?B?eUFhYlZsZTZock90QXhqRG1iM1RFZnlKZ2I5dExxTmlGakdOOXhEZndTSS9h?=
 =?utf-8?B?M2xTQSs2WmpRRFhtMFVZMTVsQXIxd3F5SWQ0RjlqaVd1NHlGUDFyZHZZZnRz?=
 =?utf-8?B?Z2lseERRMkNHR0JWUTdxK0NNaHNMejVLdWNtN0l3aW5iUHhYT0YyNGNPQUlJ?=
 =?utf-8?B?TkgrdTJmcnhUaEl1cG50OUl6aWRPemVhaXNwWmNsL3hoMzVOT202LzB5V0M3?=
 =?utf-8?B?Y1I0YVdWYmJMT3E0dkhMZ01ISkd3ZWc4TzhxcmxsaTRmc3ZzUlJoZUpqdncz?=
 =?utf-8?B?T0VWbitvR2UwMHpwVHNNblNpMG0xb0xyT2JLWGhIWHFLWHJoQlJPL2pxVk9M?=
 =?utf-8?B?c0JvaUZZak9pY3FzSzBhcW10dG9qVmlPU01Ic1l4NmI1dDFDU2pnWnlDaFFX?=
 =?utf-8?B?R05BdmcxSkxBUFBmVXU0ayt1RUhHYVVlUWJCSHF3ckpkcGxKNkNOTWp2L29J?=
 =?utf-8?B?Z3hrUm1QREtsaUxlSGhkb2kvaTUvYnlrOHl6UTNHQy9XWGpsc0xURmdLWmJr?=
 =?utf-8?B?aGFnRjdRMnllUTBKTHVMRXJ2dkt0ckpOT2E2RW5mdll6aVpXTXlWbzJGWlU0?=
 =?utf-8?B?MFdES3dsYWFNSmpXRVBvMUFjY2FsS0YzRlllY2NQbG5Bc1JwOHhCdUt5dm5Q?=
 =?utf-8?B?UVc1UnJWZDNHdzJsOHRRUFdTdnRVWlFaT3hQNmxROW9YKzYxZWFZQittdGg1?=
 =?utf-8?B?V2pyLzhyUVAvKzFLcWRreGd3V29DY0VjT2FyWjNSVmtFUml3NkJKMkJ5dlFp?=
 =?utf-8?B?eWxKdnNtSmp3dXlSRkNOQnk2eUFaT2dQbXY5TVJDU3pBUEhCanZ6aks0ZzBZ?=
 =?utf-8?B?bXVXRUs2b1ZyRnBvakErNzNDZUtOWWM2Z0h4Mno2SHR3aVIrTnQwaUtDSjVq?=
 =?utf-8?B?eUxwaTM5Rm51b3FJVWo1ODIvemRjVDl2cWV1Mk5TTDdWQndLMndaUkZYUDIz?=
 =?utf-8?B?Qmx1YVNrK0UzOWdKWFFqY0M0emdOVE9qZGNFT0R5WGJacFU4VXR0VTZEZndS?=
 =?utf-8?B?MkJJYTRDM04raVFwcnpsU1BMcitvOXB4S3pITllaanRIQnBOMEtGK1c3Z3Zm?=
 =?utf-8?B?RCt0d09xTUR4YUY1RXdhYUEyb21VU0hqNlI2R091Nkd0NUZFZUdOZnRnTkMx?=
 =?utf-8?B?R2N1eHhCMHNaL04zdlJCTnJwYzJ4SVFWSXlsS0dNZHpkem9WdTdEaThDTTVl?=
 =?utf-8?B?UW5nS1RaRHFyb0IyRVJ1OEJMVWRkUU5mMzYvU09hWVB5UXdYQkF4cnZoNWxl?=
 =?utf-8?B?dmgwREc5UzFHektzTTVjLzBkNjIrMFJCMTZGMU9ETnZtVmlQNmVRUitKQ1Y3?=
 =?utf-8?B?Nlg4YUJFS01Vc1B4ZlF4UnhQQ3Y5UnI3MmFiZEkxTVY5bUhNSTZ5YTljSXIx?=
 =?utf-8?B?bGJXejV5aGc3V084ZUQ1eng2OTNVVUtKUjJkc0lOaG4zTWsvaDZJL0wweWNr?=
 =?utf-8?B?clZ2clg2NFoveTVFZUxRWWNtZVI4dGdiNjNxM1ZBMUhNWVB2ZFlXRkVraHRP?=
 =?utf-8?B?ZWU2MmVNdEFhbDlEbXVvNzAraU9GTURmTy9BbFcxQUNUeWxXNXdTaTI2MnlJ?=
 =?utf-8?B?M1J4dDZPU0F1Mklab3VZQk5VUGxqdmVLc1ZzaGZsQzZMUEpMRDk2U1VFQWFW?=
 =?utf-8?B?azBJWjlKR3BHTmo0cnVDZzNpYXBTWHRMLyt1dHBFcE9ZSVFZQmNyYllhR09w?=
 =?utf-8?B?VzVtVmg1cjJwZEpPUGRFMGtaWXN6cWVEekRKTUdVa2tva2Z5K01IN3oyT1hK?=
 =?utf-8?B?RGIyNTF5ZFVlcUVGRk5iaDVUdjZRVzVuN3puV3ZKNk5HdFVjMjhFeDZpa2dh?=
 =?utf-8?B?eW5rdG82WWxKMFU2MmkycHNCb3NaWUNNS3BKS2hLbUhKS01CdnY0WkZtaWFT?=
 =?utf-8?B?aVJodVQzdGRuUVpWMzZJb1ZWNUlETUZYRXlFTjB1YTNwSU5BK0tyNFg4RDJY?=
 =?utf-8?B?SmI4YWtKMHB0bFc5MzkxSm1TbEJSWHZPNmhGL05obXYyVWFlbGFJNWkzaGxk?=
 =?utf-8?B?cUNGYmZvbFA0MmRoRjhuN25tWDVxTVZUUS9ySFY3R3NHbjFsVTNLbjY2d29y?=
 =?utf-8?Q?AV31KmQPO3Kop0igKbHb+r2z0a4julmUdloy/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a029c4-f9cb-4981-1808-08ded5f916a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:11:33.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAq+8N19k9xr6lBgi9diDzbD5iw2rwMvWsmA7aihH3QtGcIWB+iddKqi2rJeBzjDJL1p61kyFfes/Uz3oil44qWvCHFNudqfWkdQyJxdK14COSGSBbCaVnB/MTtI8Rbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

From: Frank Li <Frank.Li@nxp.com>


On Thu, 04 Jun 2026 10:38:20 +0800, hongxing.zhu@oss.nxp.com wrote:
> Fix the PCIe outbound memory ranges for both pcie0 controllers on i.MX94.
> 
> The memory window size was incorrectly set to 256MB during initial
> bring-up, but the hardware supports up to 4GB of outbound address space
> per controller.
> 
> Additionally, the ECAM region cannot be mapped as I/O space. Use a
> memory-mapped region for I/O space instead, and relocate the 1MB I/O
> region to immediately follow the memory region at offset 0xf0000000
> within each window.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx94: Correct PCIe outbound address space configuration
      commit: ffccbd6804e885f0fc23f0005f6bee7789a7a887
[2/2] arm64: dts: imx943: Correct PCIe outbound address space configuration
      commit: 6de3a7d7a4f653be4901d07425719c4e55805167

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD13876AC
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985850; cv=fail; b=tSVjVsjKe1AoXSTYNNRPrc/6gcCiVyvOHqMZ4+Fj7zca63PSKkQ+6ZdqQhd1+JJmZbL5XXH6oufe9mWPUtxZ/UC6qYs02iB1OutxnloeVWeVNpjLvK5NAZeNvMksydPSVzT/zPxoYNRKXZ4EwAGVVlSWxYavOJhrvskvqj7adl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985850; c=relaxed/simple;
	bh=k1RYCc54SorvY186uGD8JGX/ky/cl5A+0Yi1+X0CjWE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QgtxdOdduCVgAu4yed6qhCAG2GJiH+ACSGEp0m3Kj5qTiYYu1p2u7/edpCJOvhSPFZVeFlLdRl4bOUE8nbPBZ59sdcYAYip8t2pAamoJMWa8rTBpZ1A0nyc0fvqmVm87dteDnppwHuEZ3E8wIpHMYZLDnew+4+P5OqRCPBAkU5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QnGWcF54; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QnGWcF54"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqSPGRXMDpqYeJYyp7qgXW1OQ2LUr9g5kcAmBcO2NMh40j1GMFqNCZJzTzpNbRQ8tvp4X18hDtqaxoM4+pfq7/6iD93AqDgAdcf+mS2/jOE9TEkGNwIpRNuIwx0//UaCoGKQF7n1RnpEqFboxg9zaCQR8CGOt9WjPCTS/x6NCu8ltOSTQhD2p9iC8uyIB4FqqzuRSzoWzooZHKi+9v7cuU+MdDG+n7rPWeWRhKo4FndMlNjM3Hc55g7nroju8g6jqPV4mi/KB+MbSGxQg5hjrvi3aptcUze6cFPQLN4TX081+OMhpLAZluOrkkvAgGPoVPBzwJ8P6OoOv/qjbYs0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJol7VWwnogtnS5zo1AWVMEuZJ7M1smirwG7SjVS+PU=;
 b=py1p0o7BPsXV0HtZV4PYfYbqxg/aa3euF/u0F4igDvajFX80/ugsEQ6tR4OEcaXWtta/fxlOeqpXtC2mAxdXn7pkvSWUMs+J76c+TPbUnC744RGaEzkQpfcvqR0iVSvOTFN7J1CNRrlzjBneZj9IAfUTKZAtWmCqD/NJCNfJ//5UESWIc7JtT3jb76IiKPFMl2TDR0b3HTN6cVZlMIPCTXgxzQKn4KE7Kyshtdq8XKrZ+KKwg5P4/O1kfZpft2lK4ytFsm/fmlGZwnolCmGS4f7M1EAUq2ykJ9zvzUaBdE8T4877k1DDQgX3S3FP/Ml07y1VDwATHRp1/TNjxBdsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJol7VWwnogtnS5zo1AWVMEuZJ7M1smirwG7SjVS+PU=;
 b=QnGWcF54foDMEojIk48wnaaI2KkdOeN6AHo16vZuUD8/z3CRrEy43VC0En7tUjtribBhH6eYVdTLBbmx9inp7nvLVV1LpypaIqafZgjp+iC6imZjZhKfpmFaah7g/95c5U6t4oR+fdV2vDskwSOCb+uUZ4Svh81/d1TJ+un3jzubWC6o6Rj/CmiFyeecF5KCdzVS2rN6Ahi/18UXTycA/+1w8Vc562BMDNt8B2vt34mnS3DLnPgzJTcm+o6UvDHcdmC1ll9qbsk1ide/HS0Y/lyYjL5NpBSyesfxofSnD5igjgwgzobq4EmX/9Zc/hhL7jwtnRoW5D87vSaNzLxxug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 08:57:24 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Wed, 21 Jan 2026
 08:57:24 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 21 Jan 2026 14:25:35 +0530
Subject: [PATCH v24 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx-se-if-v24-4-c5222df51cc2@nxp.com>
References: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
In-Reply-To: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768985744; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=k1RYCc54SorvY186uGD8JGX/ky/cl5A+0Yi1+X0CjWE=;
 b=rsxWxY6f5qGL0BGvp1OUW4p1CJ5bB+9e6t+CfPtyJUAxQPILjgiEWKtwK2Xn65vkMHKQ0Ok0K
 Ox3eYfTzwrKCHPkdDn6z7YIHM1JmVc91ikfwGHE+CuP/dBui+HuPRzu
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 53519100-dd2e-4b14-d000-08de58cb187b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEFvQVd5bDZLUXdnR3dRdzU5bUtBZWY4Rzh4RTYrUnZramhGV29sUmE1ZHRN?=
 =?utf-8?B?SklZRmV5OXZsYVZST2NuT25NS3dhanN1MGltZlQrclVxczJpeHNQOXNCVHJQ?=
 =?utf-8?B?WXRFVGJ2SlFRS2xWeTZGbVpzQUZYVDBDWDZmOU5KWWZkNkJIMklzY29ZOGdW?=
 =?utf-8?B?N2lGQ2FzK295VzFJeE4vZGlKdHNGQXZkdWhFNmh5UjMzcWk1QUR3NzU5RThl?=
 =?utf-8?B?MzRLOGxVRnE1TU91TTNQcmF3NnNZRlJCTm1RZTVtUEFJYWVFSXBEbGhrZmJi?=
 =?utf-8?B?alJ6ekNmamRVVmlGdjZyOG9ZekN2K3lzNlhKUGI0K3RsN0crYlJPK1JJSVJu?=
 =?utf-8?B?UVI4M2hpYUUxeUtCaVFSSHRHNC9salN0T3lsM3ZBazBoNk5xc3ZjQ2cxYkdK?=
 =?utf-8?B?a0NRbEd0Y1NudS9Ca2FRS011VDNlMnBqQWdDSkxmcTNwSWdad1hYWnpFZkdw?=
 =?utf-8?B?VFRvMVlBT3NmSWtYbnNBOTdZR3o5WURQYnp5Q1JCYWp1ME0wMGRmemRTcER0?=
 =?utf-8?B?M0R5dG9UaWR3M3g0TjdtOGszSTdjTWt6WVhZbEU4Ri9tcCtLVnFGc010RVUw?=
 =?utf-8?B?eS9helkxU3QyRmRnbDdSOEJSMit6ZzBtbDJpaHZKbmRrRnVWUXNJaGhaSWJQ?=
 =?utf-8?B?Mjk5ZFBqVmY0R0FxeGhDSUpmRVh5OVpyYTVYNTRNdGtPeUpJSnpCWFdidzJu?=
 =?utf-8?B?QnZETGlmVlFJSnN2RmFhVXNwN1NCWUJZK2dvUzZ0VEFaajd0c2VvclM0SXc3?=
 =?utf-8?B?K1JsK1R5dTVCQ0prR01PamdoSG5YMGIwTDJFdTBaZ1kxTll5aXRYMXFSN0tv?=
 =?utf-8?B?TFBrUEFDWWd2WXBvRUZHa05HdFo0RTEyMXAvdlpkVk9TK1U5NGNvTHJYRHlC?=
 =?utf-8?B?dlNBZUt2NEtTSmR0SjBmZmVlYkNFZGxsdEhyRGJndVJ6aVFvYlNQb3FMMmhu?=
 =?utf-8?B?cCtxSUdqYS8zNnB1NzdRV2pYTnV5RHRYVnNQZ0wwYkV5c0Q4RVp2UWdkMFNy?=
 =?utf-8?B?N3pMbDluVlZmRjdXazM0QUE3VU8waUc2SUo1N3lYQXRvbGVYdDdINTdvNFBG?=
 =?utf-8?B?cVpZdFBRNy85bFlxQlFlWS9QV2ZsNU8vbkJvMXFRQ1dadHBrK1F1bDRIQ3JU?=
 =?utf-8?B?TzBlYlk0cmtST0Fqa1A2VjJpTXYzOVpIWWhhR3VpekEwZjZzVjNhNHlmVWZI?=
 =?utf-8?B?UmdCRzBvK3ZCQURpMVR1eXFXM2FOL0cvL1lJWTBwWEJVTmt6RW1keStIa09i?=
 =?utf-8?B?V0tFWHdDS2xCQ0tsS2RrRm5teGdIRDJUaXZHbER4T0ZJZkdlcm5QRjduRUR1?=
 =?utf-8?B?eVJjdEhzV1NHMS83SEFaa0xGWVBCSmFWcjhDMHRjSUlsUkc5TGxxbmdwMlRL?=
 =?utf-8?B?ODFGWUd3SGN1d2VUWTFBa1FNcjZrblg5a1NwMnVyckJ5UitmSlp4U1J4d2xB?=
 =?utf-8?B?R3RnTGNlY2J1ZEhmTTNOMCtmQm5LVDY3cVIwWjVkY2Fzd2xGRHVIV3JXa242?=
 =?utf-8?B?ZGZDbWpGVlFFSlpoN2RlbklvMHlHTHFCc2gyQUtTdVEyM0hpL1FnUU91Q2s5?=
 =?utf-8?B?ZkxkOHFlSHQ3QzZEMlczUGxvaUZ5Tks3S0NpMDlsU1dydTlmeks5VVdsaUd0?=
 =?utf-8?B?OEtXU2dETXpubHA4eUM0SzRUSi9JT240VVBkS2NPSDBHekpVYW5DSU5GT253?=
 =?utf-8?B?WTZUNFhTNVhXVk5JMGJ3NW5JakpUOEQ1K0dKQ1VZM3lKSVlQd0wxRG1mMTdk?=
 =?utf-8?B?SVUzTm1qVGF0YVpSSlhHKzZJaVJNLzVydWRBRzZTbGJVejVzUXZ0L01BbllM?=
 =?utf-8?B?MG5USk13THl0SVloYTdSQ3QzU0svSkFERkNJYndTbWw5cm1mYlVxVFFvVE9a?=
 =?utf-8?B?NmRoNVNDZ2JtMU9VUVhDWC9tTWdyLzVqcmpieUxUSFZjWUNFZGt4YU0wK0hJ?=
 =?utf-8?B?eUZ6dHljT1dOK2I5SVhUdi9OSWNaTEJDT2tUSVFwbGd3c05NeVJaR05wMysv?=
 =?utf-8?B?SVFhdVNFZkZqVGlXQVl2WjJiYVBaZlJsN01ydWo5eHk4UlRYbkVrZ0NFSHZt?=
 =?utf-8?B?dXlGR1ZVM0tFdnoyeW9GYXdMdTg4UlRBSFAxeWFKaEJqTGZzaThEOWdISWRz?=
 =?utf-8?B?bzRzaWhyYk9OMmpSK1VuUXVGcjA2M3VsVHAwbkExZjg3SFpGUS80TnZPZ2o4?=
 =?utf-8?Q?r//SPzV+Xsi4T57jCKX/WTE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTB3OEVZY01uTUZ0QVdrSjRsUXg1dTVZeWljbEplc0FHOVFaU2ZhUjV1RmhM?=
 =?utf-8?B?T1ZkWnJpTkFiRWdSZDljeGFrVjIyYzlXWUlkMEtZMFhNamd0SWtWa2cwcWQ4?=
 =?utf-8?B?cG5vZ2tBOHpaMmUxRFNVbU4zdVFnei92d2hFazhwMGZseEh6K0VSRGFLOU9L?=
 =?utf-8?B?ZHE1SStzQ2o0eGtmV0JIUGxmRG9oaGc2QXR1L3hYUG1CRnVJbHZydFg2Y0tv?=
 =?utf-8?B?enY0cC9JSG9ZVmhDU3hkSUlNeFFGVGpBRWNSR0dXOHNhWVErb2wzbGw0Q09R?=
 =?utf-8?B?V3YyNkpvb2pOTG1aM2hnR01Nc29Kb0VxQVo0eVZ2MHhXM3B5aXlMdE9KeSs5?=
 =?utf-8?B?UnJKWjE0b2lpSHBMb0hCV2cxRGNqNHJKRHpoWUNHMkpCb2lUWDFDZXBqQnAv?=
 =?utf-8?B?aERjZVlBejJ3emVoN1RucU5wTUptenFzWS9na1EydXhrNWM3QVpncmtMemx2?=
 =?utf-8?B?SjRQRm44UHJVSTRNekN4K3lmN2VHUVJTUEtDcG81aFNRVFpnLzBWVlhVN1hF?=
 =?utf-8?B?UFJ5UHNMdVFEVGpidkZlclVMZmttTDg3TE93UFBtdUF0MzFnWEtsN0xneW83?=
 =?utf-8?B?L3NSSmwxdHhyaHh5bmpqTEpCUXdVVXhJY1dpWUtiYVBOZElZN2MzSGV0cmp4?=
 =?utf-8?B?K3pETWZNejVhdmNrMklreGppRUYyc1dOd2hyRG1vQTNYeFZjYnBWbjh5eXRM?=
 =?utf-8?B?SjI4ODNRRmlmdWZvSkRaVjR1UWtJNnUwNWtYQkR3UHZFYkZlN2NDSGZqck5j?=
 =?utf-8?B?MDFwYlB4MnR0Q1ZZbnNFdHkxSFhRU2w4MzQ3U3VQN0oyTW13SUZ1ZUdGNjhS?=
 =?utf-8?B?a0xvUzFtZnozcm1aNWFvenpkNDhNaFF6cFUwa3V2NktrdDRRRzhrSCtFQVhY?=
 =?utf-8?B?VVlxb0ZoZ2tTM2sxbEtQbXdTdDNUNit5NCswV1ZTbzBUVHhVZjVuUkZxK2dB?=
 =?utf-8?B?clN4N3VDdjN6UUlMN3VyTHhPUVpQdVpsWGlJZFN1VGZqcjhNVEt3OEpJU3dp?=
 =?utf-8?B?WnB3a29mYlV3c2lpRHJKRXRxY0NyUE9WbFIvU1p6dU9LK1VQNXQ0Ky9qWksx?=
 =?utf-8?B?SGRDUFBSTS9wWTNrb0F6amNiVlhLbVg4V3ZBT2Q4b2hwdldwaEN2d2lWbHNl?=
 =?utf-8?B?NDlHYTU4aWJaRDFUS0dIUjRxelQ4RUtYbytIUVEyZGwwMVh0aFQ0NGJnUjEz?=
 =?utf-8?B?RlIxZHZuWjBjOElKL1hueisycjUxRVdCK2QyRUJ1OXNRZzdtc04xQkloNlF3?=
 =?utf-8?B?amc5Y3JodWVEWmNRL2VkMU10ZG9WQ2hzQnIvRENFNmtENWFSWTc0eHhFM0N4?=
 =?utf-8?B?UXNHK0I2c0s4Y3llc1lYR1pQNVBSeS9PUnZpMWcvbmN0bzZ6VloxZ2FGVXB5?=
 =?utf-8?B?SkdqV3dCMURJVm1uY3FQUVF5bHNubjQxQXdYMWQ1MDBBdUtZQlFpQ3JRRmFN?=
 =?utf-8?B?MW8yeWV5Ui9YcHR2NW4vcnJGSWdRSzhjOUM2Rlphcld5WkVPSXYyRmc0dis0?=
 =?utf-8?B?dGd4UitpK2hsaWMrOTAxL2ZCdkVGa1g0T2lObjg2MlFIb2lLTTk0TjNmaGxw?=
 =?utf-8?B?c0dVbXh2TzM2MCtRWHRUTDRWQUZHWmJ5QlViNmpJK0tBbmhVS2ZPTjUvK1B0?=
 =?utf-8?B?ZG16b2hxVjFMVkRFOHJyQkRISkRCQmgvVUlvK2E2bGxQOXl4VS9ZaXZXN2hT?=
 =?utf-8?B?eTg2MTJpNDUrVEVvc1JRMWphSFhwUHhJNmxCdlVodHdBdHpER3BOd0J2RVNZ?=
 =?utf-8?B?MVZ3SDdCc1BIdGtyWDRTNDl6Qk1yM0xidEJ0OC9DdTljalBobkVmZVg5Vzhk?=
 =?utf-8?B?OWtoZmFtQ1I2aWtpZldVYUFDalJPcWN3Ri8rTFhZNDRTUm1kMFFPT1lFQzJQ?=
 =?utf-8?B?S2c4amZsVm1PZnM0c1lkL1h5bFdJbHVIbkZ0dnhQN2wvYW5QNnpmc1hlS3pu?=
 =?utf-8?B?blNVOGxhTlI0Z1ltaXZQUE0xOUJFOW1EbDl0ZHRLOFhUZy9ZYW9SZk5jSGRE?=
 =?utf-8?B?ZjNmcnJPNy82UENvZ0tjOXc4cGpzQWpodzJjR2xYOTZ4RjNiWE9YOU4yRzlW?=
 =?utf-8?B?b3c3b1RUTnhzdko2ZzhiTXdHaVF4Y3NHZFltK2ZtbmVieG9BSWNkY3hlbGEz?=
 =?utf-8?B?ZW02TUg0TUprZXdqNzhKK3owbnhDWGZVa2hoSW9Rb2hpb0R3SFc2N01WcDV6?=
 =?utf-8?B?djJUYjY2ZjEydm1nR0VBaFJYUkZtdDh0U1dTbnl3M09EQS9CclNvVzEzZ2Qr?=
 =?utf-8?B?aGZRZVg0Y0pvcDlHclphOFp3N0VwM1lJMThoWUJURWIwcjd4NTM0cGdaNzUv?=
 =?utf-8?B?VFprcERlU2VXTHNpRWxYL00zTjJIa1o3dy9GbUI1cVorOEI2eFRHdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53519100-dd2e-4b14-d000-08de58cb187b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:57:24.6885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iFPNFGzeDLgbUl6+jh2KI8PSRJTqpzKU+4JTglKKmzMgKFdfjGwwlW3BZ55WwnYnX6DQ0oMJl7pdHJYxFrzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index da50686786f2..475ba98be199 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -60,8 +60,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -109,8 +109,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -154,7 +154,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -199,7 +199,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -239,7 +239,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index a7150ff8e3b9..fcd0f561d72d 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index f49895ab5b9e..f2ff1d77221b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -205,6 +205,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -328,6 +351,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 62ed450d3e21..fdb820458f85 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -37,6 +38,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -81,6 +88,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0


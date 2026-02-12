Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D33286A8
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913214; cv=fail; b=WUP1Q9S8Q8o1v0F3C6dou/qAplaY8m7hB9iLV/U2K8rqF5WrxW2z/E7MFCdIvUX9BgHfXo3AVH2ehR8zrlHUwcp5rNe4EpBAfbbhv9PQZHrvCGnB+GHqyHXpKubK180aSJqL0uHcogmb8EzWEi/I8fSrGXJDh9vykEUCY3yuIJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913214; c=relaxed/simple;
	bh=QE10PWQxKzh0ZLvapaIs5nUpa9011k+ISbjopKy2oyE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lEHB8FvRSV/AJANTgVwhndzsziiQvwitHyYbTgc029wTBTVwlKGESTa6PIxBdgP9bXuZc5p+Kj/WnR6u8upxDyA0NPHF8Y9RM1z/iXnD8aqs94oUoHXlKBE+7aAtEq03bgqM/AAKchGVBtNQx8EtNTkv55WfRi1C9+v1KYNnmF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EWst2jhH; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EWst2jhH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sr80ODQ392UC3qs60mODl01Wo7cddI53YXGNzXPtqBxS341R7EW8HzVvPdRAwbBgNuYK9f28QU2fmI2hELQl2J021B7KAhj4kM3TMIWSXOZKipEcShVYSE+hxZGz7iPogVpPRe9bX6cQw+IBq1Q8+98I3WXmsM5KXMKXuTxDQSXMtTowHmr33T2T/St9jwCCEGOcnXKqNMXwu2gnXE7fivAUlOre4/8qbxkjTtHXt+KDFt//GxNkHpIKVDXlrW7VcaijkWDEacz7gwvzgvOTC9EyyF1MEvzES030QwkPcsIpKx6WnaS0o3rtOUw9LQklUwLq0xNjzHV0mUJIEn6/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dVkyZrjsUF6L0yPnBNmhuijKglz8QWAr+EoY5AYcH0=;
 b=MdhD1p4d2AFrmHCj55v8ayCRXssDtVeIppDCUJLwRNu8TCwURhJmDbd2uyBG40JEKnlaH0MKKu06sHYIA3FuFugFhyX7BYv/0o9aHBll+WUl3c40hciVp6eY6ap8UE2Rny8mxKzqBiGDfM9GRwMjeTmWVlBRkgivA1LL0A+7n39eBSfvH+XOdbRDCm5oW54HlQuWpq5zqsEh0q9UgX772RXSNFqpoz7wd4GOl06LYyg4hBYxEV126zE9TgB5tURobm63ep2W94Xj8kKpR9mFSkuIbE5irpqBEgQT71XCJh3VteWZlt5VO0/u+oO0QsxuSftVKRPxxZHM/phJYTF0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dVkyZrjsUF6L0yPnBNmhuijKglz8QWAr+EoY5AYcH0=;
 b=EWst2jhHIgVDScYzUBcgTytnhEcJnBzuTUyn7F/12zrfuT1dmmiCqbvAANGJwofziB/1K4qbbiFfGH+pb96YonqJPaT3iG/sMy59AvX5KAWNwD1BDIgQUjGyGa1Ad3XopQOl8YmykyXSezW6sw0QkAAdb9z/lrkzDLxr+l9wCAXZs2CIDpjzE8oXIk9nV5ZP73a2Yhr8roZQg5xo6maReSs248RIDj7BCCYPgiYnZywwhdUZqJJMymp/OIvWJwEZZvoGWwOcZeMb8ilkEc58dWTQXY0orrlv/OsZNmiYLqHoX2tqXXJ4ZrcnV4KLVYhb9dggSRTTYVIcOnsnk7OVGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:44 -0500
Subject: [PATCH 2/8] ARM: dts: imx28: add nand@0 node and partitions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-2-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=4646;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=QE10PWQxKzh0ZLvapaIs5nUpa9011k+ISbjopKy2oyE=;
 b=DfP0j6g8VMXRTVqgN7XXShea3oHLzgkBweoMVdSoyk5eP9/4ZRgLeDys/eyt6MDdi5vtVjC/p
 k3SfivTVWm+BLn7ceaWO2EwZSsK3xnxm+jgsCjN6qRFWhOIj892uF4q
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b53d5a8-a598-44f3-4db0-08de6a52981a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnNBTnVSRTRqVUd4UjFXNHZuRTA3MDZhSTZTaEtsOTFiOTFVMUVTTTVuZjRD?=
 =?utf-8?B?dXdHTUcwZVVYWHlyVHJmWGR3NThlUDlUTUZCSUpZMURBaFB5cjdPeHQrZXNG?=
 =?utf-8?B?ZHlweHJ0ck9HVTRDMklZTnoyZGd3Zk5tckN2d2pnK09rSE1HKzBxNE5rVk40?=
 =?utf-8?B?WmdzcWt2c1cwRnpJejNCcWc5ckhhbE5lazBjbnkrWHVlRTl3UjdaSUZNSGlW?=
 =?utf-8?B?OVp3WG11c3NjT2V1dUppUjRwSEcyQ3M4NFV4ME1SVnZidnFITXVjZ0RzTGNZ?=
 =?utf-8?B?RUR0Y2Z0TmhsemxiQU9FMGV1cUlBQ0pSK05Rc2tLcTdMeklpVUhSS0VqYlBF?=
 =?utf-8?B?eCtRK21hS0RMWTloYU5JY3FVN2ZqSHJjWWlDY0ZiNVMwTXpXNTJjM0RoMVdw?=
 =?utf-8?B?OEp4ZWFDOVpEZ0dqdlhOQU5XUjFSb1FDSkVyZnRZTGVYOTA0SzZYdmJYT2Rk?=
 =?utf-8?B?VHNOMVNXTy81aG9BdE9nOTRIelhsWUh4Ym1XcWY0OEY2T3YvcTIwY1h4NFRj?=
 =?utf-8?B?bTZBaWtWR0gyRjN3UWczNXU1L053ejJHeDBxYmVGeGJ1anZVWXAxY0o5TGtB?=
 =?utf-8?B?b25oRHludUxMZ3B0R1I1QXdKd0ZaaThKSnlUVzdqVndqeVpuS3N0OERkZlQr?=
 =?utf-8?B?T0pKR2Y0L3BOL2lib0Y2OTAvZitQWXVaS0VMeDZnOHFYcDBTaDJXdW5DdmZ6?=
 =?utf-8?B?Y2RWYjNiaFFsSDlabzBUdUdkcVY4MjJFU3g5TDl1V1hoTlNxbGppbXhzMFdH?=
 =?utf-8?B?SEF0T0JtRTlIMUpTczlkdGdTSU1iT0VqVkVCcjJ3NE1yMkZTU2d2Zld6SDNm?=
 =?utf-8?B?WHdub3V2Ky94SDFUZjA1T0orNlBzdVExRzJtYTBRMXhjNy9WcUZiK05FQTRZ?=
 =?utf-8?B?SEQ0MEpHRng3bVNBMjZKNmdlb3l4UHY4V2ZPbWVRUGtPVU9rQXdDZWR6ZStx?=
 =?utf-8?B?cE1jSE1jQ1JpWk9Ra3l2UXlyeDMzTEJGNmxpZUhNOG84dVQ4VkxVWXRCZ3JG?=
 =?utf-8?B?dmllTE5LT1dwelgwcnhWd0NzcjNha0ZHSEY5a2dDTThqL2xvSVhxSTZERHAv?=
 =?utf-8?B?STRubEFzNjFHd1REalZnblhFNmFnRmNFRHdXSndxR1IvWWVGMWtxMG5RdVhs?=
 =?utf-8?B?Yk5SK0hJWTRtNEtuK29qLzJkV1gyVXk2bEVhRUpRaThEL3JNZ3lqb1J3L01z?=
 =?utf-8?B?RGF6NTgyclN5L0RQMmlqRGFRMXdnSzRQRklBdm5nYytBeG9YTTNqUEtoV2pm?=
 =?utf-8?B?cWRMUjVMQkE1SzN0N05KMWJlcHlYb0xZMWR0MGtKU1pSR2x3dEIzejFzcXgr?=
 =?utf-8?B?WFJoTzNuMnVyNnQveWV3TW0xczNKcUoyOVJLVm5ZT05aQVRwbno2RG44dHVv?=
 =?utf-8?B?YjNMVXR5VWprTnZoUlppMm83UE0zUGsyc21TVVRrTDNKOGF6VGtrQUY5cGZE?=
 =?utf-8?B?NW5abkp4eGNPWGpiQVQ5UmtFYmpLMHVqZm5RaHRQYTR3dGI5VktDYUJWRjJh?=
 =?utf-8?B?Z0NNVmp3SDhOd2lyUWV3Q0dDWkgwRlJWYzBseUZ5bEw5VzJwdVJ0SzhwcVFX?=
 =?utf-8?B?cEg3U2JVQTc3dkhYaEhhZVV6d3k4WCtGTk5OZm9UQWdMQmlkdjg2WWxwOU5n?=
 =?utf-8?B?R3FyU21pQjNnRFcrK3l6VzlUOHg1L0ZuUVlMcW12c3c2a1BSanJVZVJrYWho?=
 =?utf-8?B?M1JIT2hOMFVnaC9ad2p6ZE9GNnlTRkNlcnBmVStoaDBGWlJDV2FnMXJ0VHJi?=
 =?utf-8?B?bldTdS80M0V0UXNyYVJPRjRzKy8xdkNlZzFsUUF6NEUyeFpUMmRlTmZ5RlNr?=
 =?utf-8?B?Qzk3c25JRU5nQjdPS25OU2lXQVVSdGNBeVRZa2g1YVNkNVFYUVptK1Q0bklM?=
 =?utf-8?B?OXFYSitLbiswaWlLNGtITnB5eXF3ek9Edkd0TElRRlFaTTh4Q3VQMVZBanhu?=
 =?utf-8?B?cU0ydU5kckV6UlNNamNhS0MybVZvNk1qZG8wdnR1QUY1eFdQbExqaHNkRWJN?=
 =?utf-8?B?M0lKUG1rbTRia0ZVMk5Ya24vbnZtTHFkcVFTbTJ3Ny9CcXdHcS9rNi81Y2ov?=
 =?utf-8?B?blp0MENiUkJTeUNyc21hTFNsa0JTNXUzY3hQQllhakg4bmlpSkxjVTdEV09x?=
 =?utf-8?B?T1hUeExheGwvNFR0a0lrOUZCZ1E1dW1RSVpQbUIrdFhuQ3hSeXBCdFJOWlli?=
 =?utf-8?Q?n0Tca6+rCMIO9FYMt7vJB34=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHZYcld0WGZnZnpKTmNTWW1meWwyUHA5SkE5RFUyMlhOcHA0S3ZFOENTck5K?=
 =?utf-8?B?aEI5Z1puT2lyYjg4NWMvWW1DTGxacDFIZkpxRS9WSFB5Tm16TGxKakFoaUpV?=
 =?utf-8?B?OExDclBFZEg5TkhZTWR2clJ6Q2JLNHJndjBuNlc0bXhyVm9sZVV3WE1oUnNp?=
 =?utf-8?B?QXhmbEk1NllNaTVJbGtSMC9nTmlzOFZuejBSUThOOHRWNnk0d2dFcE15KzRR?=
 =?utf-8?B?bTlIMWt3bVNRRXJQTmI4d05jbndMVVRXblBpbUVyMHhTMm11ZXgyTU1Vck5R?=
 =?utf-8?B?ZlE5MzBkV2J1a0tUS1RabGJpTXBlbmFZd0JzSmlvOFNRY2RXTm42dndUMERy?=
 =?utf-8?B?NEJHSzRiV0tPZWxVWEc5UUUycEZxRHo2bjFQTVlvalJUb0g3RDZIenlEaE4r?=
 =?utf-8?B?WmdvNGdUM2NlVVIrNmJob1ppKzlJSlUya3FUNmZnNXRjdHpQL3V6M2sxVkJa?=
 =?utf-8?B?TFV0WE1zVk90ZVRaRTc1LzkwaWV2ZzkxZXNnOFNjL0tGdzgwVTIrWHBPc3Rq?=
 =?utf-8?B?cUZwVVBJTGdKakZPKzVNRDhoRThIQ25DbTlucXIrUG5GOU0zRVZXRTVvSkll?=
 =?utf-8?B?YmsybUV4YWlneGhCaEwra1daMmdVN1NRY0d4WnlLaEQvTXZzTCtlMm1EV3FW?=
 =?utf-8?B?K1ZRZHp5Z3RleG5hM25Iajlzb0YxVXh3R3U1SUQ5NHhaVEdkcXFyclpsMU5j?=
 =?utf-8?B?UWtqY0xpREU4ODZFSzR3cXoxdHEzeHFLY3o1TXU1TFc2SmliQVNkVFRBM1hH?=
 =?utf-8?B?QUUwRTc0Z3lBRERQdllSNWFuNy80S0pjRjB6bytCUUxNSWgvMEpwK1B2a25E?=
 =?utf-8?B?b0UrWTZDWGJJMk5uTy9QVVVZcXRqZWNSK3g3WkNmckFnaTR0UzRsaVBrTVRD?=
 =?utf-8?B?a0tuWjY3TzhaSENnWlZtR3ZvWlQxMUUvYytrdHlHVmw1RmxiN2hxTDA3elRx?=
 =?utf-8?B?endkUUZGdkFrQ2NFZHlLMXBEb3Uvc280TGxFcS80M1hBRllWYmQ0UjRSNUJ6?=
 =?utf-8?B?MTAwbWRTeFJaQmJIR0Ztd2tsMDRmdXpTY1hFTWE0YkVyZGhLS0xvbDZMd1Qv?=
 =?utf-8?B?SVdtcmV3aWVSSFRNR3Z5N3lYZzNFQXVOVDdVTkwyKzFhVXlzeHdkVWRHTzB0?=
 =?utf-8?B?RFRpbXJMMHN0bWZaYVg2YmE4anNWN1F6QmR1RHZVem9vNEpyTlZnT1RhVDFj?=
 =?utf-8?B?ZnB0S0NSVHozSngyT0oxL0lGWHpUYVhDRGE4Z3d0TkpETVUxM213c2hiYWJr?=
 =?utf-8?B?dk1QeWRwOXlXU0t4N3pXV2FqbjFjTnEvOUNtZHc1NVVkb0tOMzhmU3ptcEpk?=
 =?utf-8?B?ZnVDRjN6NDFTK1l3V09lcURJVEZZM2ZORWtmR24yMktWQmZtWjFWMmNlWFZW?=
 =?utf-8?B?Qi9CSGo0UFlKWFBDRWdocWNQa2VMZzg2b21GNTBSSDFqSWM4Nll3Z0pFbUhT?=
 =?utf-8?B?Z2R6dHJVUzFOR3ZPNXdIZzF5eVI4dThrWE1QRVgwUDdEYkNxcWg1RzYzdXJu?=
 =?utf-8?B?S1JYQjFLQk9ZUHV3ZlZmRjIzUk15cFFUMTBjL2RVL1R0MlFTSHI1YnJadGRk?=
 =?utf-8?B?aGV6UWdFSjM4ZEc3NmlxUFB1N1BuZnVNczZmRXNDYWl4Mk1zZWZpSUgvN2xI?=
 =?utf-8?B?Tm9yRUJRYkM0RjdjZUJPZnZTOVBWSUJ6VHVoaHVON09UWms5eGxzT0NSeFUw?=
 =?utf-8?B?NFowR1pqTHM2R0ZUbVRtc3VtWTFkU09uaVR1aWdTNSs3dEhUZXdxdFpXN25r?=
 =?utf-8?B?MC9qclEvbWtBK3VGMjIwNVExTHdIbUd6WXZlR0NmSmF1bGx4Ynl2R096dmFh?=
 =?utf-8?B?YW90MmRYTW5Mc3pudHQySmt2cytMamFJOTR2ZkZTT1JCT0Q3UERheW41QzZI?=
 =?utf-8?B?VFEwOS9ZQXMvTlJrQkRlR3lGK1p5RFRtN0ZwZXhsOWdqUVA4SXBaRGMzYzA2?=
 =?utf-8?B?ZHlQNnhhYmpMc2hUS3lvWDN6K24veW1wT3BuNDltcVo3eWp5Smo2ek5mRkJ4?=
 =?utf-8?B?OENlQVRhVlZreSt3VHF4SzIrS0ZXR0JzaXdGQWFUcENBV21XdlRlSHZvdEcv?=
 =?utf-8?B?Qm1iTjg1NkdhekhxSWFvUEQwZHJHWWVwbld1REUxQWJmWTM1ck1HUGxad1Mv?=
 =?utf-8?B?MzV4MldiWGNiWU9NS1VnZnRIQ3lpQXpIMjNqT1pKc0xJeXFHSFF4Y3N5bXBL?=
 =?utf-8?B?N2pKYzAyL2ErMXN4M2g0WnY1eGNJNkF4U0h3TUNZaWhtYStrcUppaEtwRzJv?=
 =?utf-8?B?SFJJL3dKWjF4bzQyYS94SzgxLy84S3FybzVWaXBvbU8wR3JvbjlZbFZRS3po?=
 =?utf-8?Q?dBrwxww7ODG6B2IbUk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b53d5a8-a598-44f3-4db0-08de6a52981a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:10.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo7vqHKTNvWHTK5Z61bvyOOtthDn1YgRa+CeDIHusrvv1yuC/3kcFG03tSUCpA2xZ9Jug8twrPs3+1aNfHWa0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

Add a nand@0 node and partitions subnode for NAND. Move the raw NAND
properties under nand@0. Remove redundant #address-cells and #size-cells at
board dts files.

Fix the below CHECK_DTBS warnings.

arch/arm/boot/dts/nxp/mxs/imx28-apf28.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): Unevaluated properties are not allowed ('partition@0', 'partition@300000', 'partition@380000', 'partition@400000', 'partition@480000', 'partition@500000', 'partition@d00000' were unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts  | 64 +++++++++++++++++-------------
 arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi   |  2 -
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts | 28 ++++++++-----
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts   |  6 ++-
 4 files changed, 60 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts
index 98672932e41bd8b9ee94efd2a11947fdb3ec7aa3..10bfac31f672cb4d473e16f2ce725c3ba359d9c4 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts
@@ -27,39 +27,49 @@ &gpmi {
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
 	status = "okay";
 
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0 0x300000>;
-	};
+	nand@0 {
+		reg = <0>;
 
-	partition@300000 {
-		label = "env";
-		reg = <0x300000 0x80000>;
-	};
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-	partition@380000 {
-		label = "env2";
-		reg = <0x380000 0x80000>;
-	};
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x300000>;
+			};
 
-	partition@400000 {
-		label = "dtb";
-		reg = <0x400000 0x80000>;
-	};
+			partition@300000 {
+				label = "env";
+				reg = <0x300000 0x80000>;
+			};
 
-	partition@480000 {
-		label = "splash";
-		reg = <0x480000 0x80000>;
-	};
+			partition@380000 {
+				label = "env2";
+				reg = <0x380000 0x80000>;
+			};
 
-	partition@500000 {
-		label = "kernel";
-		reg = <0x500000 0x800000>;
-	};
+			partition@400000 {
+				label = "dtb";
+				reg = <0x400000 0x80000>;
+			};
+
+			partition@480000 {
+				label = "splash";
+				reg = <0x480000 0x80000>;
+			};
+
+			partition@500000 {
+				label = "kernel";
+				reg = <0x500000 0x800000>;
+			};
 
-	partition@d00000 {
-		label = "rootfs";
-		reg = <0xd00000 0xf300000>;
+			partition@d00000 {
+				label = "rootfs";
+				reg = <0xd00000 0xf300000>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
index 66facef10ba97690decb56ff0648d7fbb0a7bd9b..54b0f715f0918a538bff59762110c49afa52459b 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
@@ -24,8 +24,6 @@ reg_3p3v: regulator-0 {
 };
 
 &gpmi {
-	#address-cells = <1>;
-	#size-cells = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
index 34b4d3246db197a0588abc2d03ebabad3b0c4ca4..24bacc9ba10bf42671426d37d35c25055261e27c 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
@@ -93,21 +93,29 @@ &duart {
 };
 
 &gpmi {
-	#address-cells = <1>;
-	#size-cells = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
 	status = "okay";
 
-	partition@0 {
-		label = "gpmi-nfc-0-boot";
-		reg = <0x00000000 0x01400000>;
-		read-only;
-	};
+	nand@0 {
+		reg = <0>;
 
-	partition@1 {
-		label = "gpmi-nfc-general-use";
-		reg = <0x01400000 0x0ec00000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "gpmi-nfc-0-boot";
+				reg = <0x00000000 0x01400000>;
+				read-only;
+			};
+
+			partition@1400000 {
+				label = "gpmi-nfc-general-use";
+				reg = <0x01400000 0x0ec00000>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
index 9290635352f12c963243efc3d2fcbf0f19af8f8b..07c098ea2e154ebc9ef9c792f6b9351e1a74e67f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
@@ -247,8 +247,12 @@ &duart {
 
 &gpmi {
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+	};
 };
 
 &i2c0 {

-- 
2.43.0


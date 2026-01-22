Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8133E9F77
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082665; cv=fail; b=qfpHP+Qpr6MNrocRyLjxIiPppNr3yOp8Uqz0BWjHXkusNe3/FIBWeYQqJL4ZHyQRj3zr6qryN3p6eUNK8lLX0eHcvnUvRjYCH1sIwAAyPJUK5MAL1Wj/tfazKbIzCCrIYXnC2+VfYWiaUmOJyGlAA0Y9VwH9shxYSQmT5QFNStU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082665; c=relaxed/simple;
	bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tXzFOzKyXO8sTV/dTKxKXr6V4oZ2lq4slNsxAImyhm8W8T8Cq0iE+h8F2Ctf3QwXW+xcQPEG6o28u9X21Gyo5y+eKNM3ySHVYS3NTe3WbhtHKfEXwY8Ks7xwoixEJAlGYL5YU/X+MBWU8TC90ZQvfvTBA6bHE4Zjbj5ftFPG8/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hQCGFCHc; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hQCGFCHc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6LmxiU+M4fTMHBHUUe0/F7RtcVMZOxDATZOwtq2K6DmeN62U75ueaGfBudmsJ5wmYQzA2byApGGDYj+qGJtxGB8m5y0Tr2dfQmmmNbG0lV1jHb2gHVqdDb+xHx5HluOpqh4OENPaFkji4Kg3r6xKExRQvDHFlzUXDTFS08cCXqi1/4xhAZa1Unafm39yxvTSyPXk3jZiQvrakBtayU36jTnSYXjIVN+pESvpiuKbkUuhanOptREQ6TlwXf5auD9Oahd2BeoCJEBS76aYf6YLCFazkYSwL2ZX7Mtgp71i/vrI9QbJHLp0VOorA9AVFSeFMA1e6KS6fOKclrj8moqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=isGeX6hDwK7soROOWpak2ekfWlX7L9qilwNRVhTZxPx7HgWxMrSzaNogr5QVhsCe77OawC9T+quEyGK+IoZLFBrr5bRbBZJH65sx4ttJ7KJBE1nGBbIHiYmXTkoMzLon1HcVLfZjvqbZAydt12VaVHEb3b1dgkao3xhVRyyDYYx6m/cyDN6pckh+A86bSrx07HCVUOoXCJSUsGnEmaMtQp8GY4GKi6afNkZO5fzqbtXYFvs+zZ3EpODJPf+ONQpsgzqnV8iHe26kkxVc9An69yyLrFG/LDVKGySPtnRPVW6ICQeocJfnXcJnost6MeNQSwc3BoarndXs/aZuAUvTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=hQCGFCHcIGIo6GmbJdB6lna37Dx3XgfY/x54KY6z1f47CI7mRTrT31KJdcHNjQWhimtUQtjCXyQ2uUzCU9/XGqMkVP3F3zyYWpeVFshsj9ZlTwaGLVKO1l1HAL2FXPd5SkPuLDvALuvSxt8FfbLY1n5/NLDkpU1FJJQUO5zvdeLDbIHEfyX+iB3wp6nbU0EQvRxeoCj7t3cfg6ZqGQPlpHnPgLNYu6CPvdY6Vp8mE0dBQHdDm7mG6Okg5/+Lh1ghpjTTZ2KJB1XQWwtm2IXr3JtA2ex+po5NrVCERldjVK1n2MjfgYVl1xOuFv10QjbqPeM2sqAtQSlyTp53TO5lRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB9801.eurprd04.prod.outlook.com (2603:10a6:150:115::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:50:57 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Thu, 22 Jan 2026
 11:50:57 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 22 Jan 2026 17:19:13 +0530
Subject: [PATCH v25 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-imx-se-if-v25-1-5c3e3e3b69a8@nxp.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769082570; l=7425;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
 b=I9V+658S0+gxjBhl74z/y8ReTmkJ9uUOAUv7rC7pVEmtq5F4LxyXSP5kCQpWYZKanaPLlW2zD
 ApSxKe1qALEAK2I+6k6/47TDpMSAET4wF/qEJNQSDIaFbasX3m/t1Lu
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
X-MS-Office365-Filtering-Correlation-Id: 50304f77-dd49-4f2b-b8ab-08de59ac812e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFA3MXl4WHduU0gwcGZBbU5uMnkxTlZwT0ptZTZDd2JjVmlGY2pGZlFEbDF3?=
 =?utf-8?B?cElhWXVmYm9UelM5L3QwM2Z6amVlQVJka25QcnBTRXBtOFh2UFBaeklnUDFa?=
 =?utf-8?B?SXhaTmRwMUhYNXZpYy9PTFMxbkhRVmVqOFQ5RGl5Yk1CbWkwaVRuc2p6cmwv?=
 =?utf-8?B?VDNqYU9BcXF5WmZGT0RibHFVamNEOUpCemgyWjllcm1xclM2U2Q5SThwYXor?=
 =?utf-8?B?WVNCMlh2S0thcHhQUllCNkxldk01cHIvUGFDSEh2YWFFbExXT25CTVRaSUYy?=
 =?utf-8?B?T1dITEVZTkZOMVZ1T2F5M3FoVzBXV2k2a3RRaXAzbmROVWFGNFpXMFZ3K1ZG?=
 =?utf-8?B?U053M3VZbDJjcHQ0TnlISUxaMDlkWGpiQVBsNWpoNCtqcWluSUtJcTBRTWNG?=
 =?utf-8?B?NlJ4UzFCRXBQMWdFQWVJUXpTanZDbHdoU1hlVlBoM2FrOWNyYjdPbGdrelBM?=
 =?utf-8?B?cFJOZjErZThZOU1odXJSZUQyS09wek1sL0krMllsbWhxbGF1UWFsRGx1WG1H?=
 =?utf-8?B?NDFyZXJGeHorYVQ4cWNxbTJZa2dRS1pPak5JQkx2Y1gvaGI5bS9GdHk0OWlZ?=
 =?utf-8?B?MHdqNHFGcXVPZHgvYk1NcUtmaUZhUDRocDF4WUw0eHRUZXRRWEdGdU51NDIx?=
 =?utf-8?B?NU1KcTVjTXJYNGFycDdUeGY0MnhGaEsxMDdKVWgyMHd2UEtUTE1OekN2SEZr?=
 =?utf-8?B?cklUL2Q3ODVId2N5ZDdIbjR6WFJtc0VXVVUrL21ZNmE0THpBVVJzTkt4Z21R?=
 =?utf-8?B?bUI5WFZkMUpSeitnSlBGTG5IazNxenFRbWFGVXc0VkE4MkpLOU5FUTV3Skxl?=
 =?utf-8?B?bkx0Y1hCM2U1dEFEd2NEcHhSTXErS25GNTFnSEFKMkt5dTkxZFdpSWdjaThy?=
 =?utf-8?B?SS92Um05dlduUWZOQjMrY1pQcy9JeEFySHd3Qk5zUjluUDVrY1d6czBrL2Nj?=
 =?utf-8?B?U3AvcGlGbUdNWjdEaXp3YXpGUXQyVTVHNTNNU3RBRVJ3a0phbGVyTEk3VHVn?=
 =?utf-8?B?M1IwK055TUtKMXZHTi9PU2ZhRUdLS01UOTFSZjIycXY0MmUvRy9QdFNLNkFw?=
 =?utf-8?B?QlMyaER4UUNzNXFqVnZCYkpnMTRySGM2NjdtRmEzRExIaTNTTWpSUUpReVFr?=
 =?utf-8?B?YkNjeWdhTHUyUWR6TUNBaGZrbGdGMmhReGQzUGVVd2dqZS90a2VoVGNPRGE5?=
 =?utf-8?B?ZXVvcHdVRVJoRkdnQkxmcnFjVmRLVExLQmhTUVhZQzc0MnhGTXRBWUgrM0Za?=
 =?utf-8?B?dGhET3crcGRmdVJ5dlNNRmJSOGorOHArcFhLbGJaRWt1QmFmZzBha2RJaW9W?=
 =?utf-8?B?eHRPRWFZQWZFdE80ZTdkdFpCZGF1ajlTaWZaOHFBdHNTc1p1eDc3bFRqR2ox?=
 =?utf-8?B?cmp1dXh3VGhwNVVXcXJ5MEhJeER6bnc4SDNUcHBlZ0RtRTlPbFYrYkxxUVcz?=
 =?utf-8?B?cjB0S0FnT3J1T0ZyTlF6YTJ0RFBDaDU3SGFaTUF4MzZnUTE3WklmWWJCUnQ3?=
 =?utf-8?B?WGczM1N3b0NwdHJSbENXM0UvcHFOdDU4YjdPRk9SYlBzTTloUzlvN0Rod2Yy?=
 =?utf-8?B?alYzQ1RaQi9QRzJqMkZLbzZ4VXFqZk1tTlpBQ0ppOFpXZ0RxVWN2ZDllM3kv?=
 =?utf-8?B?U0Y2TE40TWJxZHdxVUpZTTJXMTRnRDhaWWI3Tzh4bGZ1Skw4MmZwRlE2bERn?=
 =?utf-8?B?NFNPeDRNcTFod3VEWDZ0emZJR1FKNVFHMnpoM25mZnZIUzBvbEJnU3VyQTZR?=
 =?utf-8?B?cmR6bnVyMWMvekZ1UWRQb09HQjdvdlcxSmJJWWN1ME1sQmlEZjJuTFkxRHJI?=
 =?utf-8?B?bzdpWUhRUDF6OXdjOVJEZEtKaUh3ZFhIZTdTS29JU0FVT2YzMU9OTzdhM1ha?=
 =?utf-8?B?aE0yVFpXVEp3OThWUy9xTFlGVkRNb0VqdEJSYW85SXE2aXlOajFMaU01c2Zr?=
 =?utf-8?B?NlAybmo1VXVvVi9nWlV5bUY0bFJ1bC9sSUpPcW5rKzJ4R1dpb0pGdGp2TkY3?=
 =?utf-8?B?eGszekVKOXE0R2xKQTlqekxxMFRXR0lvN0MyMmVMT1h3R2dPVkY4eDBNcUtj?=
 =?utf-8?B?blB1c3lCdUdWWEU1SDdQN2FDdXlteXZ2Y2R5b0I5RDNJcnQxcGF1c3FRbjNw?=
 =?utf-8?B?eERVUms2TFpycjFQL004SVY5ekZqc1BPNmcvUzg2U2p3WUtTa1d1ZzQ5NTNj?=
 =?utf-8?Q?6KupEdctBZFXWGoSkzfOyuc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFNR1duTzIxM1M1OHRzeFBrbWp0cFJXcGh6UEdyQ3hUNGlIRFZLNWdnR3dT?=
 =?utf-8?B?UGpNWDRVVkIxQnh6SXFIUzhJTTFBc2tNYzU4V0VZYTlEbCtLblZ0WFdFMkRt?=
 =?utf-8?B?UUVDMDVNbjFIUWpoMWc0Ty9hdzEwbHhBay9Qc0hxQ2NpZWZqSkt2M0xGSGhM?=
 =?utf-8?B?RlpGcE9YUzhZU2J2UnF0NXdac2pjdldCWExWeFpJdDdDclAweGN2TXp6bUE5?=
 =?utf-8?B?ZmtGMTNlaFRlbjFHa1pLK2hjUnEvaFNaaEhWbzB6ajlhYzNWMU4zMDAvblhu?=
 =?utf-8?B?YnRZSjBCelBFZzFHVGpPcEUvRGdiWDVvZFloaWRENTl0cno2bnlNcHptR0dZ?=
 =?utf-8?B?dkxJbytybE5jbFpROFFud1RkclZTWkZPUXIwTkNqMWJaSURKMURKakU5M1FU?=
 =?utf-8?B?V2RtTzlYWWRMODdjNkZMYUdtbVJNODU1QVZVa1daNmlodU8rYjRJYUFLS1o5?=
 =?utf-8?B?cThCQlZtL1VyOFMwS1VUNkVhS2diVW5JRklyK0FEUFM3bTdDaTQrOGlacnph?=
 =?utf-8?B?ZXB5SkI3TWE5VGFJUXQ0bWhOdkRscGNhVzZmejBEQlMxZCs0aTMyWVlGcmNN?=
 =?utf-8?B?VGplQlQ2KzNrUStWdmJGcFpEMUlYVGYzUXRMTzlFTys3WW5JdjN5bTFkUThM?=
 =?utf-8?B?UTRRZk9OejJOWGRIdXlHdVZEUS9iSGoyRTJUdjJSZUNMd01kcXZsWklrdzVp?=
 =?utf-8?B?RlZhRWVrdHVHRytJa2F4RWYvVXY3OVdTR0dFeTFHN0N1LzA4c09YeVpQaGhP?=
 =?utf-8?B?KzhRWU9hNUhFL1NCTVV5NXZ2amN6TzZydXFMM0xUeEo2Sm5ueUxJZHAzRm1p?=
 =?utf-8?B?Y2llTVFCbXRhOS93NG4zZXdWeHdPTmVnTGZGRDRiKzZ2cjRMOXJ4cng0TXU2?=
 =?utf-8?B?YmZFanJWd0ZFcmI0T0VPL1FUaHhsTWw0NjFPdG1qUWpVSDJGckRKSWdRUzEz?=
 =?utf-8?B?TUxCV0Jnb1dvd0NLWENkVGNqdjRxNklURHpzdUZiSkpoNzhMaTJ0bDl5WFk0?=
 =?utf-8?B?N2Y4c0ZzSXdKalhkY2E5d3V2MDBZVHNuUUNBYnA1alc2M2FxQTJHVExqcVc3?=
 =?utf-8?B?MGYzdnFXTWlYcm5oMGpMVVpxLysxdXBndnBySzJJS2lWa2NJYXBEMUhrNFVK?=
 =?utf-8?B?SGxwanFHa2FKSzZqRXdIMFdQTE0yWWpDdWZLOFI1SWZuNEhjOHl1cFBKZWxC?=
 =?utf-8?B?RVoyRExkdGdLSzNFN2txa0FsTDVjbitWVjF0M1cvS0lEQ2NRWmxvWTE1MGoy?=
 =?utf-8?B?YW1rRXdpUDFsdUNMRzlJQjdGZmZwcGtFcU5QT21uYjVQeDkxZlZ2cDYvaklV?=
 =?utf-8?B?Q2tFYVRheFMrREhlakNjMloyTjVGbzRzaW5tRG0wbzZtRHc4ZDNDeWNEbi9a?=
 =?utf-8?B?eTBmOUVFN0pCZCswVWVPT1g5SE5VQXAwcVpLRWJPSXlDMnIyNTRXSFEzdFNL?=
 =?utf-8?B?ZmNZWndOVmxPd05iOFBSMk1XRll3dmlWbzdRTUpiVzZ2L0Nrbzl6cUhYRldT?=
 =?utf-8?B?SWZLT1lEdmY2My8vRHNxTDBjOGJ6MVNiQ0N6a2RZYWxzMmtvVkxPd3ZESFhW?=
 =?utf-8?B?SWVwMmtOMXcxRmo2bkVSZWpHTmx1b0xCWFVxNXNRcDFBVS84UHlxSmZTbThN?=
 =?utf-8?B?WnpVczVaTUtuZjlNR1BsYjM5V3UrcENnWTFoajkwc1hvNENyQ0ovUVl0MmNs?=
 =?utf-8?B?WWkrUVpTaTl0NEVOaWhPZjBUaTdkSEYrNk9GOUJPYTUzT1pNUlR3L2I3OGhy?=
 =?utf-8?B?YVpuN0FTZE9NM1psdHZtVkVrT2VKUkhxMGlJWUNmZjNSeWtxSnllamlCdUIz?=
 =?utf-8?B?YW53VVEwMHF0SlZoVGhjVDVhNThMVWh1NUl6eUJWWDRhbzV0Y0NlSWxJSWZD?=
 =?utf-8?B?b3ZxdWhCQkpLR3VWalpsdXRTL0I4K2RhYzZVR1B2cjl3c1ExYVJNeDRxakZW?=
 =?utf-8?B?ditTWFh3MEhEZm5oZFZYZ2ViUDVCcDRpeVJUdjdhVExaUHpRNDNpbGUraHY4?=
 =?utf-8?B?dzNsZU9LbjBVU2FRM1dGRTRwOUFFZTk1eWc3WjgwcmNEQytLVzh5eVFQVDJQ?=
 =?utf-8?B?NlR1d0hDaGZ6bGlITTUrWFNiNis5UDFmWW1UWTd5ei9jT3dvNG5QcEdkbXhY?=
 =?utf-8?B?cTk4RVFWdHRVWGdkSnZibURUQXZRK3BHbjd3U0VuWW1qV1k1SVlxOC9oT0VB?=
 =?utf-8?B?bkZVUGFzTE5nNXRTdVB3Ui8ya1pQSHJtMGc0WG1hRUkvaHdOOGlmMnA0OFFW?=
 =?utf-8?B?cUd4ME9nYWUvUkphdXp3NStkRitpRlFJUTM5V1F3amlTblhYME1MTVIzcUht?=
 =?utf-8?B?bDhCcVZvdTA5dVFQTnFrd041L3IzT0p1QlNDVm51N2ZqMm9YbzRIZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50304f77-dd49-4f2b-b8ab-08de59ac812e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:50:57.1055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vigp4yYr5lx8KBmcDZjgpkRC6jgXPioJJp7XkO4C0409cAIDeg/Hkg3vv/e8xX6zp2ua09zRzMaWUoFuT6ZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9801

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changes from v21 to v22
- rename the se_fw.c to se_ctrl.c
---
 .../driver-api/firmware/other_interfaces.rst       | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..cbd425c5a11d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,134 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in form of
+command/response mechanism. Each client could expose specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0


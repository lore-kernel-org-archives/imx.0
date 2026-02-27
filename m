Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B933DEE2
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 06:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173764; cv=fail; b=gJsym1NMfQsVRPJdP8rJJDiZ0vMLfA3Neq+Y4A2Tz6K5af4XLnn6PpcV0/8wmKD3TuRrFdAie4d/Hn5d3wR90LGh6iRuypdHYOX6/aYjhQ6rph7ELciuSdll+ufTLtYwf9kojmrEdw7vIiqxSXaMc6L02uda+tN5VQhiNTsIz+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173764; c=relaxed/simple;
	bh=+oZ0bz8bp5B/lopaJ9EiDDPMWBG+zF866siQUrmaBtU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FpVrAMM9wRl8lhsopGQE0jpp2KO0Z8rzoTYFwR5l7RvTE2jU4Wt7HbB8WauJeDy/eQNB72X1HItG530SciPh0ZQ31gmdjqeIaHlmtoSx3a2zwUUZKbfQqU40gjA1ei1b01LahKs/Rj9xB9CskOxOrj8nt6o8LFvGqB2juWPqgzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sU8SCmek; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sU8SCmek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omepXt9IXyQ98ZCXVG6QwSaWeHxyK5GTuH+t1KUGofu5JswpM4jhrBem+e7JrO3rABPrk2QwkHtrwSQ3p7gOgAzauIh9lF/LyQSO/Y1sgitfwnRYDRiqSRZNXW1eaEAusmelC77dOp92BfHRbMkE78pVwNQjEO7bNFKoqe36BNi3LLQi3bysKvv6gPKkCoo/9h8DuU0IN60mRNN6aBonzRAsf1anlYP4D3ex8+tqbuhMdhgdJpeAwSWGXBFkHQWBsutGcqS+3MjcBALR4GPCsY8Z6rHCZ713HUsKLASgZJFzqHjUwUG0xGCiz83nIcCAQrLLdCBB9/N7WcHiQfJyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO8RyakxbKLbpgg7vdTmYouUwF+qkqIVraCRin5McMI=;
 b=pFMQg81r8JFCZt1mxFZYim5Vr22TCgo1ZyzthcqaAMX5oiBeQ0EE8jVMNr1WfCXrLST1ab+6Hn8S/Uu4rclcPssKEV+tm2/BmS9OlnQKLIeF/w8SR54cNB5CYadqh5WiYX/QSQ8fSMcUV5GkK5p+9Fu+nrP6KAuFSrpJEypk3kDoD66e5WZYe2RoEzMJrK/ls9br8E3aWdBf0idKahbhzGHYlgWMHNBSXF2CxH21RSeQMPmN4YW81xZzJhULKWpCVL11KfytlWOo4SaTL+RKLmL4kPPBMbFUWZqSqaeG4Z292yjxUudNSWsuLlBvhfUU0FojRli18NZvlJJ9SrEvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO8RyakxbKLbpgg7vdTmYouUwF+qkqIVraCRin5McMI=;
 b=sU8SCmekmhVc99l/i7eQikic1ZPym4MiMB8TBdDmLcwa8KVYFb/FaZbZiLxVhud/gUaGm4zRv4+YV+Ul4ivdW3u5S55G9EGfIVwjz966n7bjmMgHv+hENjmSrRU1p/nEGJeuiITaL0dxTVzzQjW23f/71J6alr2mAROHIYdqkqfPcHDSYhAsp5pnJaWstL79yhjsmG4SuUigBEYDikMjo16KmMCHn6lFrrEQOLrv1SO2yxMlS3PYxhkOz1ipQEjBH1+P1IfslA90VCGjD6J8pBvGmh1SXPpu8HQoF/TETCrIObzkBnoPSyBakZxhY9gQ2ZgHCpdGpsg+mcHDK4QQtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 06:29:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 06:29:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/2] ARM: dts: Add CPU clock and OPP table for i.MX7ULP
Date: Fri, 27 Feb 2026 14:30:42 +0800
Message-Id: <20260227-imx7ulp-v2-0-1c7fa8862ebc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABM6oWkC/2XMQQ7CIBCF4as0sxYDU0TjqvcwXVg6tZNYSkAJp
 uHuYrcu/5eXb4NIgSnCtdkgUOLIq6uBhwbsfHcPEjzWBpRoJKIRvOTz++mF1ZeTMkSIg4b69oE
 mzrt062vPHF9r+OxwUr/130hKSNFOo1HK0tBq07nsj3ZdoC+lfAHVPeCZnAAAAA==
X-Change-ID: 20260226-imx7ulp-c48516ee22b4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:4:54::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c385f6-cf23-4c18-bebb-08de75c988c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	xyYYfq/1JK5K9pso6A8ja+c1S7GcFNRQVbmn680BNnLg2AZNVueTd7VsTGlxhTZsLMAKuX46790WZlkA/gQGTuPNO/1VMn+PTgnKlHBfZRBxWfznm4gcrBflnUUCZ0kQRCVdk3A1N+6eY5I8BIpMbkj/JWnciTAL08NYYCYA3h5YbNKdhXgdkYU+bhRR+ouH0aetYyLpNQhzMP8WA8RGm+me2/rHMcmbpDq8OT/Oc8Xqfkyhu3z1TjgddnvKqs2nYHlFe5mqHwi8S5ZfNG6s6xLKt5CuWd8fZMslAXtLnoqLz341SdVC6+7afY1MRiGqR7dTEQrNTEaYmiflFDAAXLLgr9CwFLKvNVQedfRl1qhI5Sm4a60K/rNkwFmbXNaPZCXFyWnp9Y1oY0PvBPhVCXu4+8soW6XRYggnqyq0j3c3+FL5ELqTHbTL1o/mBw+ZL52dxj1t1aqRF67ClLa+uQ8sjiwRAnrRaPneUOXQKrjHcOU2IOhspTMEjZ7yweuZqMHeKdn7YqE1Cr68WvJHniImp8YWaZPOcrSyjkdCJ8/+uQtMp9YySOWTSTJDIId1Y8t0/CewUoJ3U4ynQ7UgSi2DEPtJFUcgqAWNBC26zZRQulgRy86xLr0KEhuan6pbAzGY1xkXKbi2mKO68lBrY/ZFPgS4wSdhdBxUoSdPuEvVij7eUSM0xGe0eKu+GXTn1vwKpDHCfZ0e5GaEtKarZ9VukeWZt79mOD7rXM7z2ortezHGDZHULhrEWbBhvbIy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em12MTFGSlN3b3JXRXZxbjNKZDRHeDBuVlNDcUhuOHlyank5d2t5MVZyREZL?=
 =?utf-8?B?amRNeE8rSDQ1ZmhoaERzSnRyaXhZeUVLUG11eU0yTXBldUYyNkJFK1FKUUtF?=
 =?utf-8?B?SFdHWFBKZ29OcnZ1ZnZ2elVmaWwrOWhsNHc5N3IwYjBxS2RaMkkxREY2Tlh4?=
 =?utf-8?B?RzZyTXE2Q1R6Tll1TmZTKzUxN04yRDhibXF3NVJrcUZ0bzc2aTNrVElnNU00?=
 =?utf-8?B?eU4zRk1vQlREV2JabmRFd0xmaHMwNUJURSs2ckRhTnROK2FFNE90NWF3TTBh?=
 =?utf-8?B?ZGxpMlBmb0NCODU0R0FwNU1rL3VCMTFLTUZUYks2SHJ3UkRyTTZqVW9ETWd1?=
 =?utf-8?B?SkMxNHRsQktjdUZrSXBZUkZuSDlibVZ6bUwyZU5OUC8wRDFVZzQrUDJIM2Va?=
 =?utf-8?B?VllxNmpSZ2xYOExPZjd4aExKRkwxK1dwZEFsejZDZTAwQWZCWVdWQ21XcC9W?=
 =?utf-8?B?UkQ0bW0xVDV2eTNYRFRaeTZtL3pYR2R5MjNHbkQzNUdnTklKdGtIYWtVN09o?=
 =?utf-8?B?cVF5MGwzaTYrSi90dmo1U1Z2elFuMWJGTmQ2Q1FqTEdENGR1ekdyWkhzUjhK?=
 =?utf-8?B?SkJFRm1Eek54TFphTjJJTSt3bnJPTDBKL2lqb1RxUXZDQVhkd2tNcVhTcmtM?=
 =?utf-8?B?enVkYXBLcmFzT0NRVVNNaWhNTW9EWk9SVUI0dGFMY0R5enYrczNrRlhQekxC?=
 =?utf-8?B?ZFp4VGJienlKdzRzNmtBdWVSR0NQbDFOT3d5N1haYS9xdDdLNVR4VEVPN3RY?=
 =?utf-8?B?WkZkSjBUSVFHSnlpREUvWFRZbTV5QWVtSlNaa2IyeGp1U2Q1aGtJUk9hREp1?=
 =?utf-8?B?cWxZVm14UERqaDlkZVV4RnhPekJWNVEvNjhOMVh4ZnBYa2JPeG9lU0pzaHdP?=
 =?utf-8?B?Q3grUE1iaFFwZVI1cHRKQy9aUThNVUhpUllja2FGS1ZJRDRPbHFkbW5UQ0VB?=
 =?utf-8?B?Wmt4NmQza2ZHRm9FY08zbGI0YzkvSGE5UnlEaE1UNmprZ1Y4Wllxc1BYdmtU?=
 =?utf-8?B?MGFpc2I0OU5NTjNySzZBclhlWUdCb2xxZFpOdGxicW5qNFBhdEdnNCtzb2s0?=
 =?utf-8?B?WDhUcFhzdnhOd1RYdjlBVHVHcmNCVXlYV0hNaDFqeGI0Q01uMEF1QmJxeEcw?=
 =?utf-8?B?UlV5eFl0VFB1UXBwQytQbEhWNGt4OFJzT0VpR2IxSmcwdkppV2hmWXBPTzMz?=
 =?utf-8?B?ZjN1dlNUTUVKMllhc0NUZ0VpempydVNpSGZUdDBEekROb3lLbkxocmQvalNP?=
 =?utf-8?B?TTNDaW1GV2Jlb0FkMXBmOTRHVERNSEpRdGJnbEY2YzMwZ2dva0JCTE54VFFT?=
 =?utf-8?B?L2dCQkFYY3ZqUlN4cDVTbHFSOXpQaXgxR0lmZEtWTkE2VXRnVjl3WkRobG10?=
 =?utf-8?B?RE5WRGJaTGx2NTFIVGFRcmdwcHNrc3dNaVhlT1U4aVZhd3phU2JZRko2TjF0?=
 =?utf-8?B?amZSWmM1bWs0bm51MmRWSEFxNit0alZ4NklUMkJGVnd6V3dxOUdWTFFZT0ow?=
 =?utf-8?B?L2QvZDMrRlF5MnBVb3d1KytXRGxSTFpGb2g3WjlGUUFMbHRpK2xnYmJZaWFl?=
 =?utf-8?B?ZDk3OURadE1NR21rMmtJRWtRTFdnRUY0UEhnQnV2SDBzL2FBL3BrTWR4clZS?=
 =?utf-8?B?SDcvZ1Y5TWhOVzJNb2l4MmVmYm9qUlh6WnBEN2F1c0FOZHVXTnYydmxZTDZ5?=
 =?utf-8?B?S3N0OU9WK2NrVlBzc1lYMnZKU1lRYms3S3JyS2p5bnVwdDZBektRaERydkhB?=
 =?utf-8?B?eXhvLzdJcjczU1pNYTNHTFMvVWx4V0huSFArR0hGWkdicGxVbnNWVW1nK1Z5?=
 =?utf-8?B?R0QyYjZqRXhiL0Y4S3MwNk5OLzZPYkhFTkhjSzA4RzN6L3VWQmcvR2JVNkZ2?=
 =?utf-8?B?bkFyOXY4Q2lEVGN4UGE3RDVncjdMRWxkRUpkY3JXK2ZTcStOVThINmlxb1B1?=
 =?utf-8?B?ME9uUlZnNXNhSHEyY2tyZjdBY1ZQYVpJb0tscXNxVC9BQXJWOC9KOE5sMHZ4?=
 =?utf-8?B?TjAwN0l1Uy9ZdFdBWnhyTjRUMXFGS1hNZzR0MDF4MCtUMXEzcnZJTlBSZjJY?=
 =?utf-8?B?RlhSZVh0SlJNeXEzM09QTnJtYytzL3RYeEJITkx0UzRIN1ViVjUrS2N0ckdU?=
 =?utf-8?B?UUVlMDhGZWw1OVJOaHVFM3hvWmgwRWRJZWVmLzAvdGJVMjE2cXQvREh2M0pJ?=
 =?utf-8?B?MEl4Y3VNL3NiQU9uS0IxTDZFenRZUis2K0NsaTIrSFo5V0N3ZllyZW0xcVdF?=
 =?utf-8?B?VC9rcURFS3kzS3lTeVdZUmlKVFJ5QjYrTVJ6cS9WWEhUa0xjVUtNNC9Ucis0?=
 =?utf-8?B?ZlRva090WWl3VTBnc2JrTXZjMmdSREwvdThZTWZBUlZrblUzQW96dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c385f6-cf23-4c18-bebb-08de75c988c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 06:29:17.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO5aDMXa1YkfJxpz+A3D/ncBnLZ3S8MOmida7Xsk2t/WR4b1tWcGwY8bfiqqQD1X3xv9iJwipRXwMjU+SVZ2Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337

Patch 1 is a binding update to add missing #clock-cells, otherwise
there is CHECK_DTBS warning.
clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

And the clock will be used for cpufreq as done in patch 2.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Update commig message in patch 1
- Link to v1: https://lore.kernel.org/r/20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com

---
Peng Fan (2):
      dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells property
      ARM: dts: imx7ulp: Add CPU clock and OPP table support

 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |  5 ++++
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             | 28 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260226-imx7ulp-c48516ee22b4

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


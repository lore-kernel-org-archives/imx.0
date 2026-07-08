Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAE93F075C
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495126; cv=fail; b=UJ7mgoqwvsKkTkxOS8tAevZtFXkmR725B2JnI1JtuDOuHg0LfrEfI3vVd44edR7d//E2v52sRooDuCrAOXYgJ8jnWEIHjnvEWGyKu6PCtTLBy42FqGAPgf5CQZCwkl9xr2GTlTiHAEMcK6al2dTqR1+1CarQneqwXcM/ThkUk4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495126; c=relaxed/simple;
	bh=W234ht3tjcldwWFHIte9bWEuSg49e45b5BjL4wVPNjc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lPLRVJzBq2avFHR1FDV69Q3OphJQfqP/70z0XRrzJTrRqrlLulI15JHGsS5PAldhZQi0UYlhL4QZjCYNlET9eEr/tNLst3DJFyEGurFXM3SrcGFi+Kthz+PNMLM2QXQTMQp3rOzcuFusBG1MG1G96l1/XY56appMpuOBIkxd6fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ADljaeBd; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ADljaeBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV9Kf07HrdLa/2V/v/nasQtjzf0AztFJBxflsQS3DSfQqXbfIZtHYuvHboVxJvTMPGnd2waU/Z4CQSbauSuKpBEjf1hIJk4QvwKUt3iM34XtWBSChV7kRQd6P3FhwJbYrq7J+X0UFey+y5A4m7tn5X31YTix7ruAYxIQ73vXtAREbtBtj0KK+UupIoGPokTRhhcLhzOOBMu+JgkDjFCH203dlzVvAzIE3OC1r20xw+e3lgH96GYmfGEjBxSZ9A8qFY3OK6OboR/ML4L8+lQAYJfP1oQzeYaElCcQEZpdq2jR/WboXdwgNI6eI9TQFrxieOBQla50hchmtb7rARR21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=bLySLX5m/orwcsljuTJk65akzVQE69D8OVftKqIUZlDRsnE7Rw5r4qo+2bTOktKrIbIBozkUZbX9eDFgh6nwsixlmD4vU+zrwWd8G2maa6zhvsiOuuAEzuDmGmd8aK17a+liWCExZyBFzYHC1iUqCn8+P9J/nBVNtXVwxrbg9cDBQIXL2JOBwuEyaM7hkQwhoqOdKOiYMxLodI+wFxwX2ErHsqvP+zGqed2sTyir2O2fRDRoAd/j8Y1O0iln1LQGjkslbA0gomuibUNgdAFj+nLtnl1SRbBmrAXcwvZ5UXzQUhcid2w8omyRC9Z4IwUziNMx2S+H+AaGErWYkozzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=ADljaeBdPqpJldqHrB283HfqY9lhclP1ApgFIySyLF4sZ628udeY44sauSpUaqs5n+869mZNS9Cp4xHQanoMhU+K/bTOHE+Gc1avZBtKzkgxdzweVOtUtQv/D1Wf7PBOsOG9zI1radkXG532jZDZ6JogB3mUXXX5z4VMkQpeLWm79gCVg/HjGhanNTzdHGAGlQCbeJFxZu2UvPnkZkjLFDY9b7W7gdyMcZ+EEyputPPMnJ7Js4W/arC+C74+Bhy9F1vYwmn1b6/PYSpyO9iLwBJ45GS4qXMJtdxFq6zAPPYk4TYWakfE5poRqTlsSQH80dr2/I/QE+m+BBIW7dyx2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:51 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:51 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length and retry Direct GET once
Date: Wed,  8 Jul 2026 00:17:40 -0700
Message-ID: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 6209d39f-1531-421a-3db8-08dedcc1054f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|22082099003|18002099003|3023799007|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gke4swU7bEEo9gacQT84GUC5wxXIuLBD3eQIJti+zw+CfuV1vhdiIS22VEwOlzfPMkT5TEwUEos/qBR0ej004mGyB2juHrnOlII04kPS37J+G8p/dbgwOrpbcJ0NFS4zVuHtJkONa9XqqSDAZRwAe48J8sa2kHT8M+yA4vHhPrCxFPiQVj8vUqB7W4dMcBC2QlAJV5QQhkqW80sFBFZm5Uwjr5FGdNoLtJCjQsHCnPOJDXv34DJwYlzOLvUuBu6N1WUdJfI0GhPtvBsdQgc9Dfe9U1ZERNZ/otopeNyvtWCwzjBdbraLVUXBc3yqIrBTy+MqK/SuFTCW5htXcSp6a2QhvIa3sHisaLWdE1OUm1E9gMFbeOQr96MaBhqpzF4MEngG4AEEuHzjmCRJTHn77I8THYfdVGoso022RGMfY7PtEH3wrSGcIuCwmJZsynCAyeJWNog1QFCWP0dLO4hoOTqrKfh23At5nEz1NjBXEl2NUX7fJMnwAG9Ag28vzzwajHBrV4iGlXdeNI1CTwfpTGuDL96Y/9tfCT9mirn4+xcD6lthzfuRsAGPrXKzp394KQONSTDUyG1h7OLUQ7R/m0gTrPHrZZorX7ZbLb5MJP7yC71WYzX+HR86Llq1zehsyujDD4GYcTYr0Wi0ZmhOTypCWTuKmGK55kOTL6qmfx3OGcTYxcbQ9jrsIX0H0R36t9rfLLDnDvLRiiJmiWUorg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(22082099003)(18002099003)(3023799007)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW9wMm9CV1hJNTFHa0xuWVoyUTllOENQelIxSW5pbXUzQ1A5UnhmWFhNYzhI?=
 =?utf-8?B?aU02bXNVTklCQ3BhS2JvK3JCOW5VNDgrakxYZG5ucVBoOTNkVHk3aFdNazJ0?=
 =?utf-8?B?MFBlVzF4TzdMUG9RNVZwN0x5VUdSMWxyWlBJUkJENXVIWkJTaFJCUnRKOUVL?=
 =?utf-8?B?T3NsS2RaeENWcmZtc0h3TVFhd0UxVVQ2RGtpVXZiVWJXend1QUE5VWRGMWJu?=
 =?utf-8?B?UzJ4UVpsWUFDbWRZNGkrTkkvNzVROG5SWjlsTVFUNXFLMlEvUHJTcno2QU84?=
 =?utf-8?B?QXI0WWh6WDZRZldIUldoWWJDMEx3dUsxUmMzUWVsWmMzckFxRGVuRFNKQndn?=
 =?utf-8?B?Q1JyOWQzK1JncFFiVHhZY2xIUFd0R2VZa2Z4SUl6bnRIUWF1Q3MxcHhoUFZ0?=
 =?utf-8?B?UWlWeEpRVFlRNzA1YlhZSWlZVWJUV0VJTlphWDNIMUZRUmdKbzJzMjFVNkRr?=
 =?utf-8?B?MDIxL2k3eUNxRk1jcHd3WDZoa29RQ0xzVEZVdkphdlhzRldHb1gzN2d4SFRx?=
 =?utf-8?B?VFN5VEh5S2p2cml4MkhEVVlFRGZqKzBJYXNoZXg3Y3h3UU5pQytUL2RkdzE4?=
 =?utf-8?B?V1lENlNVVXhXTHNGWUNCZU1hWWtBZnlJblR6aHkxRSt6TGtkbzljWUZheFNV?=
 =?utf-8?B?d2FiSnZVRHo3RERjbHBSOFA1Y2dtMnFQQW8rNGtLeTd4ZjlNcHowOXIwWHZx?=
 =?utf-8?B?cVp3T2YwYTZwR2N2bkxBVVZ6VFdDSHBlRFFsbzhqbHpoKzZmZ1pSMXhKY0Q3?=
 =?utf-8?B?RmxkZVgwR0FTd1pqcVNpa1pseFB2WkxJcnBRZHM5MEZiZXptSTNWOFc0R2N5?=
 =?utf-8?B?SzVzVWYzZkRKelI3T0RockZnRHFUYVJZSzVpR3o4eGNVVHAycjd1cmZ3clBn?=
 =?utf-8?B?SjdYT1dlYzVvQ1dkMVFEVWxOOUtnZGkrRC85QmJvRDBiaUZSdkprWEROSEhL?=
 =?utf-8?B?NWdQc0VmdjJiTjZrMjNKL1VUQkZOdC94bTBjVkFqL29FZm8rYlVwNFRhQ1Jz?=
 =?utf-8?B?VnVNNFl1a2J0eDRBN2VZWCtMMi9hT3EzSlQvbVVmTGlvZ1lrd2VLV1RrNm1h?=
 =?utf-8?B?KzM3OVFDbXRFdkhTYkEzMGkwTS9FcGg3MUpCeVppam5WV3h5bWxjbndzVmRO?=
 =?utf-8?B?cHhsM2pPMkFGUDFWUWVLa0R2TndyUEpIQ1QvVHdzYkFMZ3phYlFWWGZud2Rx?=
 =?utf-8?B?eHhqR1U0d1lNZmIxMWQ5clgySGF3Z1NYcmVQL0FEcS81b2MxajZFY1hZUVN1?=
 =?utf-8?B?M1hxeEd1SmVxSVBSc3NxbkdsWG1OaGdTaUlZcis0OUY3aG9Danp0bWROc3Z2?=
 =?utf-8?B?Nmp3TDZOVDR0dkR0cVlLc1N4RVhhaytyVjlMODRmWnE3NGJDWlBjM29OUDRP?=
 =?utf-8?B?ME8wR0IxMzlEOEhhMzM5Sy8weTAwRitiR0lkSjgycHNnemIvMHR5Y2ZpYlBp?=
 =?utf-8?B?WnhYQjlWZVJQM0RmN1p4dU1BMUFMRkd4am41NFBCekorQ2RZeTN1bUl0eFV1?=
 =?utf-8?B?TGpWSnhwMFNBcSttREdIdngvVHNXMEIrZCsvd1Z4dGtMdjc1dTlBNUo5bVox?=
 =?utf-8?B?c2I2VTZPb1l5NkVwd2ZOcWk1TnlUd3lMZ0QyWlZvRm1OeGtyRmJHdUtSN2lq?=
 =?utf-8?B?QnB5QTNPWHBlUHJFU0w3Z0NXMVlkQTNHbWN5NHVpM3lORVovczNadmV0Zkpx?=
 =?utf-8?B?QldreTFGRU9rTURQR0hjRFlUUE9WeXdYcGY1MzlXaDI3dmMrZnhkRXlhVW12?=
 =?utf-8?B?MWo5U1RXS1FtN3FFY05KVnVzMmxQWngzREZNMGR2NkYyem5XVXhEKzFjRFNp?=
 =?utf-8?B?bkZObzV1SFNud3F0MXFLaTJIb1RCclIzMnpLTUpiOU00NGRjZ0VIRlRhUitL?=
 =?utf-8?B?cnFaZTlDSkxNZkxRQmpqZk1PMWdKVWFnc1Vla0djaTA2WWZncFhuaEE3OENW?=
 =?utf-8?B?MWN3V3JRdEVWYUdBL1doKzRMSi9LaXpxOXhHc3hjc1p2YkhyN3dUVWMrdGs3?=
 =?utf-8?B?dmV3dVVsS0VYNCtHeEw0OGdLbW9TVkRETmpTdzh1WlJsbEZXQy9UdVZNN3dt?=
 =?utf-8?B?cGNxVmtCMDI3Mk9mT3F2SktmdnN3bTQ0eFduVFA2RkhtNm9VLy8yZUdFWm52?=
 =?utf-8?B?c3Z4dkxIVVQrUEswa0xlcFRQcGVMR29CK3cyQ2ZkR2FMRVliTnc2Mmx2UEJH?=
 =?utf-8?B?QWNNeEhtdUJOSWNxd1hReUxFNnhHbmdjYm9YbkhHbVpMYndIdWZPYmFoSkww?=
 =?utf-8?B?SStYVk1kaU5ndzJsSWMwd0VBaGVjbmw2QWs0MnRmdGhycGlCMjhWb3pXek9i?=
 =?utf-8?B?eUNJYTFmbUZOdk1TaUdRUWFGN2x3Zi84MVFFTXp6QUVtOUM4WlZuQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6209d39f-1531-421a-3db8-08dedcc1054f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:51.2578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHHdQZBmWfdEUnUldW78mgDsEHa3GtCAME8t622ODRQNz6S5uyWhpblVgkOxqd8Ds+e1upou/FuIo5scKF0+AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add retries to struct i3c_ccc_cmd. Validate GET payload length in
i3c_master_send_ccc_cmd_locked() after a successful transfer.

Retry failed Direct GET CCCs up to cmd->retries times when the driver
reports failure or an I3C error; validation failures are not retried.
SET CCCs are not retried by default.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Split from v4 patch 3/3: retry and strict validation only; optional_bytes
  moved to patch 5/5.
- Validate GET payload length after a successful transfer.
- Retry failed Direct GET CCCs when the driver reports failure or an I3C
  error; validation failures are not retried.

Changes in v4:
- Add optional_bytes to struct i3c_ccc_cmd_payload and retries to
  struct i3c_ccc_cmd (default I3C_CCC_RETRIES for GET, 0 for SET).
- Replace CCC-ID-specific payload checks with generic validation using
  actual_len, len, and optional_bytes.
- GETMRL and GETMXDS set optional_bytes at the call site instead of
  hardcoding lengths in the core.
- Retry failed Direct GET CCCs on any error up to cmd->retries times,
  per I3C spec Direct GET single-retry model (§5.1.9.2.3); drop M0/M2-
  gated retry logic.
- Drop req_lens save/restore and the stack/kmalloc bookkeeping for
  payload.len.
- Update I3C master drivers (SVC, Cadence, ADI, Renesas, MIPI HCI) to
  populate actual_len on successful GET transfers.
- Use actual_len in getmrl_locked(), getmwl_locked(), getmxds_locked(),
  and gethdrcap_locked().
---
 drivers/i3c/master.c    | 59 ++++++++++++++++++++++++++++++++++++++---
 include/linux/i3c/ccc.h |  5 ++++
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 037b3b980717..3b6d3ecd9d12 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -915,17 +915,46 @@ static void i3c_ccc_cmd_dest_cleanup(struct i3c_ccc_cmd_dest *dest)
 	kfree(dest->payload.data);
 }
 
-static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
-			     struct i3c_ccc_cmd_dest *dests,
-			     unsigned int ndests)
+static void i3c_ccc_cmd_init_retries(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
+				     struct i3c_ccc_cmd_dest *dests,
+				     unsigned int ndests, unsigned int retries)
 {
 	cmd->rnw = rnw ? 1 : 0;
 	cmd->id = id;
 	cmd->dests = dests;
 	cmd->ndests = ndests;
+	cmd->retries = retries;
 	cmd->err = I3C_ERROR_UNKNOWN;
 }
 
+static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
+			     struct i3c_ccc_cmd_dest *dests,
+			     unsigned int ndests)
+{
+	i3c_ccc_cmd_init_retries(cmd, rnw, id, dests, ndests,
+				 rnw ? I3C_CCC_RETRIES : 0);
+}
+
+static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
+{
+	unsigned int i;
+
+	if (!cmd->rnw)
+		return 0;
+
+	for (i = 0; i < cmd->ndests; i++) {
+		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
+
+		if (p->actual_len > p->len)
+			return -EIO;
+
+		if (p->len && p->actual_len != p->len)
+			return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
  * @master: master used to send frames on the bus
@@ -937,6 +966,9 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
 static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 					  struct i3c_ccc_cmd *cmd)
 {
+	unsigned int attempt, max_attempts;
+	int ret;
+
 	if (!cmd || !master)
 		return -EINVAL;
 
@@ -954,7 +986,25 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	    !master->ops->supports_ccc_cmd(master, cmd))
 		return -EOPNOTSUPP;
 
-	return master->ops->send_ccc_cmd(master, cmd);
+	max_attempts = cmd->retries + 1;
+	ret = -EIO;
+	for (attempt = 0; attempt < max_attempts; attempt++) {
+		unsigned int i;
+
+		if (cmd->rnw)
+			for (i = 0; i < cmd->ndests; i++)
+				cmd->dests[i].payload.actual_len = 0;
+
+		cmd->err = I3C_ERROR_UNKNOWN;
+		ret = master->ops->send_ccc_cmd(master, cmd);
+		if (!ret && cmd->err == I3C_ERROR_UNKNOWN)
+			break;
+	}
+
+	if (!ret)
+		ret = i3c_ccc_validate_payload_len(cmd);
+
+	return ret;
 }
 
 static struct i2c_dev_desc *
@@ -1372,6 +1422,7 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 		 * while expecting shorter length from this CCC command.
 		 */
 		dest.payload.len -= 3;
+		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 		if (ret)
 			goto out;
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index d8052949e57e..2506d83b8255 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -12,6 +12,8 @@
 #include <linux/i3c/device.h>
 
 /* I3C CCC (Common Command Codes) related definitions */
+#define I3C_CCC_RETRIES	1
+
 #define I3C_CCC_DIRECT			BIT(7)
 
 #define I3C_CCC_ID(id, broadcast)	\
@@ -374,12 +376,15 @@ struct i3c_ccc_cmd_dest {
  * @ndests: number of destinations. Should always be one for broadcast commands
  * @dests: array of destinations and associated payload for this CCC. Most of
  *	   the time, only one destination is provided
+ * @retries: number of times to retry a failed Direct GET CCC (see
+ *	     &I3C_CCC_RETRIES)
  * @err: I3C error code
  */
 struct i3c_ccc_cmd {
 	u8 rnw;
 	u8 id;
 	unsigned int ndests;
+	unsigned int retries;
 	struct i3c_ccc_cmd_dest *dests;
 	enum i3c_error_code err;
 };
-- 
2.43.7


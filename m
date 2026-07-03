Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629603C1F22
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075898; cv=fail; b=t9yILMW5/zcJnInKfUsuc01qNh8Feio1RFeoT3wQNZbW1zXSsOih0foBq9MTLr4vn0nPSJ3O4DNbuRz67Qsp3LVutUwFwoFGoY/LtspHUmsmGcEi28rw66gBgO7lJIHZH23lf4KjerPwIjnde93bB5hleciAmCGq+LFst3oo+CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075898; c=relaxed/simple;
	bh=W234ht3tjcldwWFHIte9bWEuSg49e45b5BjL4wVPNjc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hvziipX6MFyjKpia07Uhw5jQ0uNhfeFyOLLpkHHujXBqPGRrKtfRyRPKyTPyTD3jMWvYRdNkAwDC4dZ2RGvtRRYROMlK1mFlcSM9fd/9BRMNVmbuLqj4HMz6N8IjBiIWxZqezxLoU85GVfR9qVqOe1CaVkWiUkul5fbzJs9DM+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=s36Rsamc; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="s36Rsamc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjtmW/EZRutzeiV+0HIUr1/uT7e6IY1V9i+T8XrJvTcQH+FxfaUdFNqIsBErj8j+YZoqdUZMt9cB65FuyM/WkyVwa3ca3HVacV7STzpHHJTT25jVmNp/yzAi276pm8iYFI9jwEsobGtLKx1J0RfJr7mKDFb0XrW6rkWjJlXbzWYsR8eHzUbEzOa37meDFYKT/3Io6R92j5EFvXQR6cXnt6DDjzeCJDj3uZ+2vxUyVq8RI7c0i34FqnjHiPt/XLUY9ETVh7/Ki+J69A4d25ynhkEGfKShJqbYGdiyRXumz2NHMDXl5Gl+p7navzGXw2/pEtoGQ+Ojq2hDxEtaMSCRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=oT474bCfDNe3FkjWRDnLzaSd70XbQq3qFfyf9HKDvAVPyV4ZjOYBtCXkWrH81IkPsrxOcUA8sPrEivT0WRFpAgj5ML5zcl0227u5x2x8kUr7YVh9PFE3Jl8he8hCGyEZx6oAAmUAYIFu9dIHxuQai6nY3hBSE4BqN9lOFuXYuH7GC8nEtJzEm3lSHq+mCtVwkFviAiwKFCAHZdGAywhhn23Wfk5filbUUXTYneD4Tu7scprwSJq7637cyy4iU59V1fUiF44SCq52qBh6i7t+i9PUPhr3kTps9FVWuWB3e1E10wfyOY/AVMnKowb0POSpz2FzZ1cnsz+riOCG4fpUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=s36RsamcvM2piO/S4r0sQt1et86GgtMB7PDJ4m/9u8tc+30Fg34Z7VSs2DR5GEhmnSxH/DUGJTPBQGYidYwZNtHEbWHBoa0KwYFQC10yTnw47F/gkhZCrervKOYn2ibXeNlSW1hceG2DBCMsizot40eRQkZGxiR4CTrEgrkl/mP1bC2fGjKGvRNZaPzy+0iXv/5bxAipjlBIQrwHyH6un5uLxyUtX5hzKr6EsYHa+VzsXvETxt8esQ8URJDCSdT5WGmzaN8ozad9yxySku2GMehz6uGAPHBbauL4G0ogLpG8KP+E9QhhfWl3NAdqzFauqZn4ZicC/kvlZaqylkMTRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:29 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:29 +0000
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
Subject: [PATCH v5 4/5] i3c: master: Validate GET CCC payload length and retry Direct GET once
Date: Fri,  3 Jul 2026 03:51:16 -0700
Message-ID: <9fba8d67af4bb5ed41ef1df853adc05911da17fb.1783074850.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS0PR03MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 427a2c82-aca4-43a4-7bfa-08ded8f106a8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|3023799007|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	9ce/weanfNttu0mk57PgqD+KlEJjIWqf2jfi0gIYdX3z2vi7VLvx7B3PBFBSBkaalJddRulmQYSGofxp2tpD8JOt1VPX0h7SWYxPOzI5X4zgiixbUzOjYk1emc/R/b1HLs2UfwY1qVbkYM7mC4K9ERqXB4soPGMPYHkvlFUbjQHM5GLYQjhVZ/g8vvyezNqAk/dftEFeyIKlvgGyRutgt/dsKHiGOCwiLZroaxRuK8Fj+McV78hCsTK2U2yeL+AHzQSrzpaVhdXVONETe6SeZX+ajr42I2IVe3DRIioCR6kpeQBT+2SXJzaU3sDES9264zraETF7R454YcEBSFbLuRJf7qHrEqMuD8/8llWpcrDq4A5uHu2ZUh0jGTnZ9XGw2oiE4YlFvXPUtvn+Tjy5NREd1xQTj65LKuiXn6H7IvdF8ZOV0HhBW8UnIjTH1lR5IQCUUetTzEbuiEfebze7Ls/K5o0VK/J+w344SrWdUvN6GdRjINgUSLlDs3oubpwj1pW2X30KHm3l6ANJZYcWaSAwNWRxi1Y+HCCKMbzaeUuf/1jlYB9PxFfj6z+tdOBRk69aAnVA87SGgB1FwBdMqlsEp27Y6jz12S+4AdRNJFmPr1HZNxqp+O37MgR/zu9TijBqoquRVkeJySBU/eR7DmwYJpHhxFfQ6ww9ZU8G2H7IxOl1R7iYQhFASeRT/T14oFDrzHQiVVmDOlyGvHxSFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2p0Qmg5eFVVZDMvcFI1QUpvbzJwWm94azlXVzVPVkVEOWcyMG90S0RnMGp3?=
 =?utf-8?B?S3hlZHdvY1BOWFRGbDFIc3JMUTBGVk9LME9Tc2RSQkRSNkNKZHdBRGNqcFFY?=
 =?utf-8?B?Wm1EbUtNZXRLV3kyK1dVV2o0OGFNckkxTkJsc1dFN09SUVZNVWx4TzI5aHlG?=
 =?utf-8?B?Q21ZVVBscEEwVmg0d2R1V2NiSld2bjlqM3VZZDZYajFxcGtEZFFsS3NUOVhM?=
 =?utf-8?B?bkJhYmhIV1RKblVjZUJGbk43NksyR3MweE8wK3VLMFl6ZER4eXdNOWdlc3E4?=
 =?utf-8?B?YjNUWVU4ays4bzRlM05UdzEyd1MwcVhPaWsrSEJlOVdDL3A1aEIySlRoMHNF?=
 =?utf-8?B?Y1Rib2lnUUFYWXJRZk8yNmpPSU5KalVTRjU3TjJIc0tJU2lST0R5OVBCRCth?=
 =?utf-8?B?VVJiUEpoQlU3OHNrQXFWcWNWSWZkTnpKeTF2UUJRY3BiVXUwTTYzYWVydVVS?=
 =?utf-8?B?OWxjUnd3WWw2VFpQWkFPMzN5RGhBYVBneUNpTElxNHZoYmk2WFljeTZIRStN?=
 =?utf-8?B?TFdrcmVxMGMwK0RhUW1vSW9SSEpacVZCTmtNaUJtSU5PMlIwUkoyaFdUTHlP?=
 =?utf-8?B?Rm9LUGR3Smw3NGdscFdDMnBpUDlNR3d3S2UxTHZqY3VEMjEvYkVTd1BCUE1H?=
 =?utf-8?B?L2RsQUROQ2tsL1dyNDhoeHI2RFNjZFFHZi9kbFhVL1pNVG9lbnVqMUZMTkc0?=
 =?utf-8?B?K2NZY0phaldMZGNYTDNmdjZIUWpoM3lkZkV6UU5xVFBITEVsUDE3R2ZNb3pU?=
 =?utf-8?B?QWJwWHdPR1VuNGh6bzhaaktORCtXUG9PU1hWNTNUOUtFM0s3amkxWCs1WGMy?=
 =?utf-8?B?VXRqUE5WK20rK2kyeHN6N2tLNFBaODB4ZmVwUEs3a0FQVHA3RUtOMzBIakxv?=
 =?utf-8?B?OGFIVlNxWTdrYW9rM28rUVdhR0VMRlNEWFJGSmNtM1dId25xdkNCanR5UFVG?=
 =?utf-8?B?am4xelArQ3I2NUN3alRBZmZMRU9yNDN3NWVvMGFib0tPTDhDN0EwZDRNQktR?=
 =?utf-8?B?OVFERWlWTkV4U3ZweHVzQjYxKzZpNERvWUFPZVB4WnlHaFpDelM0RkRIVENL?=
 =?utf-8?B?bm9heVZxWWlpOFFCT0hxM25VZ2JNYkJlakZldlRFem5tbXVOSjNnekJMcisy?=
 =?utf-8?B?YUljWFdFNVR6M3JFZTJBTzZpVW9uQVVlRUo0eTZ5QmcyUVZ6ZUVEUmxrZm5X?=
 =?utf-8?B?YjJIWnlPOVFyN0lWRXpjSzRJZmsvR3c5c3l4V0MxVzQ0VGRHT1BXOGxEOExi?=
 =?utf-8?B?WWJTVE9DMmhqcmM3bnd4eUpTR3VqTFEvMmx3YWRWMEMyRTNKTy9pdmZCWXFL?=
 =?utf-8?B?M3lhbnU0S1NRYjVlcEl4RE81aWcreWw3eE1vV1AyTklHZFFwWWwyR3RMYUkx?=
 =?utf-8?B?akZiWjY1ek9QNUp4Z3FQTzFXU2ljRThJR2N5cHZFeDFKTnVOZDBlQ2s4OHRJ?=
 =?utf-8?B?QXBLeUhmVmxDelJvRnFFWXR4QVBpK1JkQ3pRTjl6MEo3WGx2bUgvenRrcHRy?=
 =?utf-8?B?TUJ4bDdRM0pyQk9DTGkrVElRYTEwZGNLbERIRGlaTHMwS3V6R2MzZEFVR1pE?=
 =?utf-8?B?TXpQZEdSNkNyekJtQS9EMHN0SndwS2VIT0NsR2lDRExucHV4bGs2TE5hRm9Y?=
 =?utf-8?B?QmZuWDR3TnBpRnEvdWx1NzE5aDMra2w5a3RrYzRUY1RMNWpsTS9EcWlkUXFN?=
 =?utf-8?B?dVJTMy9WZTQ2NVFTYWQyL2tWSGdmRDBockFVSGVZRmZOY09iVnhQaENTU0tQ?=
 =?utf-8?B?aDhnaXhuaFlYQ3JMNEhyTDlqK0FJVzV3RnBYSFQ0K1A2dmVLdHovUjRhMlFH?=
 =?utf-8?B?Nm9weHZvRERpb3p6S1ErOUlVblBYN3c1dWZhbGUwMys0SXFoNEhvT3VvVGJE?=
 =?utf-8?B?WGpEdklTb29NOTFGVmpRWkE0OHlSU1BBMUd4aVE0Ky8wZXI3WjFFQTN3QXdO?=
 =?utf-8?B?QUhZSWNQVXZEM3c2TTU3bjZXN3oyQUNRS21KOURDdy95dzRVcEFBbTJiU05E?=
 =?utf-8?B?QlZGLzEzNGdVU1p1VmRHb1htcng5MVN1cjZLOUI2cjlpMzdSUVRVTXdBUHBS?=
 =?utf-8?B?SGhWbGZ0a0tlWW9wRENyRGF5Z1dMcEgzaGswQkM0WElGT00yNDJxL0RUbnNn?=
 =?utf-8?B?V1hqMUx0WXJsM0VVNkxOTHFuMTVmZng5aWJpVUwyUEhBd3VRcXJDbkpSdnhn?=
 =?utf-8?B?Rmp0OVB6Y2xXdXJYWlcwd1VOajJycnNYVkRpak82ZnFaVU5La0Frd2gyZFda?=
 =?utf-8?B?b29pb3lDbE9QMlIwOFo5SjZrdkVVZk15VzRJRWtiMVlkSmVvSzZsYUE3eVlV?=
 =?utf-8?B?OW13cC9LajFXQ0poM25hODNXUnQwbHpoQWNOdTNncTdMbmY5dnpkQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427a2c82-aca4-43a4-7bfa-08ded8f106a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:24.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx7lTWbxozJRJsZHQ1fExF4mW/7wcASVfbmN5YRlDD8kQqOaJA+dghvqdofMc1MHNzwNCWS8mChPQVFHfiWdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631

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


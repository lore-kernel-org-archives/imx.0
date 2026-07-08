Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FDB3E92B5
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495106; cv=fail; b=rqiXUacVYVUPNg9S/o1rxtqwAl1kdd1fus3kcnWqdQipob0jgHDiJZeQAmXtpsbv2p/qDPoNymhAVf7xlr9bXteQdPX0YX3bPmz/TYz7HlhpyWZas3MMBYSa2sUzG6UUtbCWRrRiIpbH1b/W4AkxI8VNuCSXqF8ievz/mvWlE8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495106; c=relaxed/simple;
	bh=FUrNhveUZkqvrrmG6VmSKfIopRU1tBM2pRoStzhCZWg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KP397opvW+RSHsyV67JSxQPuHKXSy9kjcktrDZfVY2HHXctoXgfJsJUSJ0f/KW+oMg6eIf5LnURY/FvRez8IzAuQbNg2Z9z8GgZI7AIQUV1LsnHTiF0m0nR8AHWXLfFnbT6vLUc07wSNm1YyZTq5RK9CM+s/O2jFtVaxX1EHY/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=mna9JSEd; arc=fail smtp.client-ip=52.101.53.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="mna9JSEd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W82C37VVDdeCjGZhlFwqcGe72QJULyJlbXCmMPTNZnZM3KalLiJOkYJxGzJn5IA8tdBJ3t3JPDGGedHzVyJNYiGY0ZxdaG0hlgdNmrmNgtXE6x2aGb3ktTDHNaSlVml0y/mh3zhXe2xi/JcRY3px4bcp32l6Vl12kpT+Vh/U3gwDnY+8WP+gCAkd6zUfQgvpf8yMPHujEdeqNHFSA11ADgGFF/B3MbGAhf7QKve7NNmkPb+omAM+Poh6cA59GMzyvZrcDqIpNYK7ukhjiZhG3oijZoVpts8ncx7UU8PR7n88l/m3NJq6kwEig3Re0+B/PpTXOKg+Hi32zeRWOygj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewoY1e/ozSEOaDoosEVSMGzuJ5w9JO5RwKn+MDkFRg4=;
 b=cAFI8M0hVrON+2CPQk62NGI4Ye2MryuNXPZfciGtDbwWP4TZTPtGMzba4MjybpXWmpemlMT+d82CPWFOCPfkvpUZ9hjqeUaF+IjUUEP28oKnxmVPDhXDgvaZ2blPzkwvxEKyMbBezz1v2EWrsJ8Z5cg9MMDo6mSKqVC0L28lLRNMbYx//924EuMnnL40B5lSncvnP2nw9qn/YqP8XqOPQrT6YqrPL7bPx40kayoprxDHHnyTMai7CfiyH3adSra7k+QedkAfk0bpPve/tW10gDcQsXx3MhrUt/2AhLZ6UEAGLyeBmexFyZk9tdA5O5iZcoW0cIyhL6YY7MKx3WIl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewoY1e/ozSEOaDoosEVSMGzuJ5w9JO5RwKn+MDkFRg4=;
 b=mna9JSEdoI7c7hw/1ol8RH75cb2+pteVFmXfww6YkQSN1eATq6SRZAQyzchnOuAVbydYKHIXgJdTZSmRaJdBJc3RXklqe15pkEXEbktKCbQArH57CyYGf7VcsSh9ef4csQgkgq98bZ7fcQG+iCR4qCAyGpd6lEkD1bTjpv7EHgaFD31x1It+HIAOxbo8zceEKY7+kIrSQ7MHeJdlPC6bZb36yOUEl05SHH9SiFbIlg/3WiAZ19Leede7N5LpGFart8KIgTgNzZz0sorAq8zOVPHVaa7JRamM8Epox+ySRcJxsgs2PADnG8euLEa8zve9AYKgM5hRXzTxcXKIlJysvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:47 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:46 +0000
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
Subject: [PATCH v6 0/5] i3c: Improve CCC reliability with actual_len, validation, and Direct GET retry
Date: Wed,  8 Jul 2026 00:17:36 -0700
Message-ID: <cover.1783493867.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: 25f151b2-2472-43c1-295e-08dedcc10284
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|18002099003|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	77AoX0c4RCn9iJkvy/fntUDHEdNOqdX2AKBkh7nLrpctCyuYrsBZswlCW7237sGqQ98FXNQP/PNgExn3R1ha9QA75rmkc/FtL6reU3329aebfjNrayDTDsJD66gGYNLwybfViffd3IvpQ773ig7Dhda4sKl2opmYNXGMvR6NDfeU4VrdNWlcyZJwXEBK3Xh+lLKkaS4KDATtOiSM7qAvEYDZfmPz+wU/3w5WAq/TIAoIRqXzZX4iFm99Ng5154SynXF2FEDjBQPsAmYLH5tEdGN0s+kZDPFLDck48UjlPwF3puabs1wljOJ1V75pg+hBQETB7CE91I0+Qj2P/M0VQpRzXQXn7T9vIMlyBUHX8/YyuqWykIggx6RTL9gb1mcCN/vmVog1ytrk4aOBmNeXe3c7DCAWnVl42oBfzqj3uJJnOOzgcLoIoMig9lRDKdAbsEtXQr58HH90eFBUSqkbW3zlEZbMFP/51nQHq1DkFqtjZqj58QEXAQ3c83oMWn8npeH23/QxbcepHIxPmcoybg+rXC61ZV5yP5LjKbkKiK0iugrzLAKCg4+6EIJlHUvuemNBYSAh3lVj0gHNp2xD8cYJrgv/MbugvWywh4QnazXTWJ9Trw8aImTFOl52tQ57Jo2Ka550p1Ha2hnzUhWw3H8mF7j+nRq0D69v7tnK8kSlo/gQn7MkgrXhEY/SoHrcps/075XIA7V07jJw4qUBUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(18002099003)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s0w7/fWsi8ntLp/j64jsuaImgedP2hud0MjWHjIS2wg2749qHAaFmC+Rtulm?=
 =?us-ascii?Q?bnRKhHMZFxDMhHsgSHCHIupviXgzK5en0E5k0d3XPPPHgOCNBx5LZrmj5wOh?=
 =?us-ascii?Q?PbP/iELdVVLrcEckGdMEB2E7AxnA1M3KSuunNexby3VGQK1WcfsYweBREaoy?=
 =?us-ascii?Q?F0ZMuhHCRqEtVKS7w/TUC5Yp7CiGVjM+DBs9GOCm5tv6MqetZ7l78l/QaWjV?=
 =?us-ascii?Q?9MyzqrCihbtIDiMfEVK61uBs6FJxRpURJaO5uvet9osZQq7QZbYvHpWLIxNU?=
 =?us-ascii?Q?vcerZQbSG5Oef7SwCnTDWYG92DuhzFfK1RcY2iAtbqR55O2PyBLW0Cxv3K9F?=
 =?us-ascii?Q?6pUps2WZONP9PU0OZU10itnRwYzL+Ka1ic2B7acXfBn27eAhSqec3MtMpuJp?=
 =?us-ascii?Q?QFwUuylZt8DpInUctGOxIyX9ymTv316OAtCJn5jNze9qUVxXAdcEYzShDsuG?=
 =?us-ascii?Q?p1kS9yPZr6vyYd4dJ/rjuFMI0sxPYWqrh6E1dKPdBnr4jAbEEtv+Mv3g6oOF?=
 =?us-ascii?Q?ZpZLW5VEs+UxD68uPKLbfhE1dXrlp/exBA323ZeYziSO//vOeNaaoQSd2gdG?=
 =?us-ascii?Q?/3qW5F2dh76zYzxT08oyPFa4E9bNNJslR6p2MiISCliBhFoIFeFxFwWLbXq6?=
 =?us-ascii?Q?TOC1bgYqgEcgLk2tUNsdVKFy8utyLWqSyKepbUQWRVBsOuWWg6YmtffSpYPy?=
 =?us-ascii?Q?GyK9+ilQoTPzomuG1DhS4DN79BBm+Z9Cq3ml9tr8URg39tNXwmy/p/Rb7R2N?=
 =?us-ascii?Q?T3u5qlvm3Iu4lkTGgQdzc8Reetu1D+7WBwng0I3evkux90q/kuMkYV6u79ya?=
 =?us-ascii?Q?dNZblCY1HOtsh3psew3aLkIQc6fobpE/GgLz5m8QVt4PKEbOKvCyazXTSfGN?=
 =?us-ascii?Q?0JuOKEag/aghy4HKj4IKMzqvRUKckQAsP6bgi92KR9YijsTFr81PGyR05LL6?=
 =?us-ascii?Q?byL9N1dQYEJNcmJNwtktB41AQrqMVL6+vDP1v6poQLbnFC0aROYLymcTk10J?=
 =?us-ascii?Q?vgR92B/XiVATlHZBul9Dga4sBiqpCUtdWE1BUsXRdqnomKczvuFb2HgLQIh0?=
 =?us-ascii?Q?soDJtrCkiyQYXfj1OSTG+ciT6qQQaEVYaWvHZdL5n3z4iq+g1C13ZUPnpxEZ?=
 =?us-ascii?Q?z7zn4L+qQ0IFFcaTVme3RjujSQv00wMUnnkj2mKripFN/oJoLWM0XDVHfROZ?=
 =?us-ascii?Q?STV87Kio8lXgXK3MOPIbc8CCM4Bo62nct2Um6cBlG3aYIumS3/BFSPChScPa?=
 =?us-ascii?Q?sw91JuFNa8j/Xc7Lzk/zqQXsj5T+G+O/XVhOl/k9rca6iSIvbetaNTE8cbfi?=
 =?us-ascii?Q?cxyf3XwnlgHaW69aXjQb/Y71KhitickB3GmSYTCgt67DoWDYHtqE7hLMt7z9?=
 =?us-ascii?Q?9rw0VSg5iRgDGXqUNASxcJtgmv5l3tWl7E1hSzldbCIkmGBGhUneevAVHjQc?=
 =?us-ascii?Q?NPOUVqEmGlgW4qmomcNzcCICMvCfz8/MV7Vq3ddPB3wMkwHIJYQ8xxmtgJA2?=
 =?us-ascii?Q?31rmRTadHojb1SnKlI91GY0xczvVSzLCRWT+KXYGQAlXCr3xpU1M6JEczzs5?=
 =?us-ascii?Q?oVToUAFDvwHxUR09vb77Z8NYqsjcttrMQG7IYWX1Iskf5AR8rDvt/L3djCSO?=
 =?us-ascii?Q?R+vS/R38MMrFPTupEtGJfoqQrfQ17ZmlOEao58zrn8kpyOCG3kfxc1NFClD6?=
 =?us-ascii?Q?OZO2oTjkoxisbb7jwRVKTCJCuBsuXDN1Py9DvrM+PFk54DZKIoMDBUhnwISg?=
 =?us-ascii?Q?gP+Dvu3jIw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f151b2-2472-43c1-295e-08dedcc10284
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:46.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKtt/DrFKnlUyE7oRt0/lSfZoVgCjVxE2flvFHpLiIc+60n2HztGiriyOGuuHTt/73ud1X6xWKpRCMhp+ygjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series improves I3C Common Command Code (CCC) handling in the I3C
core and master drivers. It separates requested and received GET payload
lengths, validates GET responses centrally, and retries failed Direct GET
CCCs once by default.

The DesignWare I3C master driver reports standard I3C M0/M2 error codes so
the core can decide when a retry is appropriate. Variable-length GET CCC
rules (GETMRL, GETMXDS) are described by callers via optional_bytes.

Patch 1/5 adds actual_len to struct i3c_ccc_cmd_payload.

Patch 2/5 has all I3C master drivers set actual_len on successful GET
transfers and updates core GET helpers to interpret results from actual_len
instead of len.

Patch 3/5 maps DesignWare CCC hardware errors to I3C M0/M2. M2 is reported
only for broadcast address-header NACK (7'h7E). Target address NACK
returns -EIO.

Patch 4/5 adds retries to struct i3c_ccc_cmd, validates GET payload length
in i3c_master_send_ccc_cmd_locked() after a successful transfer, and
retries failed Direct GET CCCs when the driver reports failure or an I3C
error. Validation failures are not retried.

Patch 5/5 adds optional_bytes so callers describe variable-length GET CCC
responses. GETMRL and GETMXDS set optional_bytes at the call site.

Changes in v6:
- Fix ADI and Cadence GET actual_len: store hardware-reported xfer bytes
  in cmd->rx_len and set actual_len from that, not from payload.len.
- Fix Renesas GET actual_len: drain the response FIFO at rx_buf + rx_count
  in resp_isr, clamp rx_count to data_len before subtracting (avoids
  unsigned underflow when rx_isr reads round up to 32-bit words), and
  report actual_len from cmd->rx_count.
- Fix dw_i3c_ccc_set() to use dw_i3c_ccc_map_err() so SET CCCs get the
  same M0/M2 mapping as GET.

Changes in v5:
- Split the series into five patches for clearer review:
  actual_len API, driver/core adoption, DW error mapping, core validation/
  retry, and optional_bytes.
- Fix regression in v4 patch 1: keep actual_len assignment in
  dw_i3c_ccc_get(), not dw_i3c_ccc_set().
- Move actual_len adoption in drivers/i3c/master.c into patch 2 so patch 2
  matches its title and works on its own.
- Split optional_bytes into its own patch (5/5); patch 4/5 adds strict
  exact-length validation and retry only.
- Do not retry on validation failure; retry only on driver/I3C errors.
- Reset actual_len before each GET retry only when cmd->rnw is set.
- Add @retries kernel-doc for struct i3c_ccc_cmd.
- Simplify i3c_ccc_validate_payload_len() per review (drop redundant
  exact-length check when optional_bytes == 0).
- Clarify GETMXDS fallback comment: with optional_bytes = 3, a 2-byte
  success on the first attempt no longer needs the shorter retry path.
- Add Reviewed-by: Alexandre Mergnat on patch 3/5.

Changes in v4:
- Add actual_len to keep requested and received lengths separate.
- Map M2 only for broadcast-address NACK; not for target-address NACK.
- Replace CCC-ID-specific validation with generic actual_len /
  optional_bytes checks.
- Retry Direct GET CCCs on any error (default once), not only M0/M2.
- Add optional_bytes and cmd->retries to ccc.h; drop req_len and
  payload.len save/restore in the core.
- Update SVC, Cadence, ADI, Renesas, and MIPI HCI master drivers.

Changes in v3:
- In dw_i3c_master_end_xfer_locked(), move RESPONSE_ERROR_ADDRESS_NACK to
  return -EIO.

Changes in v2:
- Split the monolithic patch into three patches (per review feedback).
- Move GET payload validation and CCC retry from the DW driver to
  drivers/i3c/master.c.
- Validate GET CCCs only; drop SET payload-length checks (DW
  RESPONSE_PORT_DATA_LEN is 0 on SET).
- Retry GET CCCs only; do not repeat side-effecting SET CCCs.
- Tighten GETMRL validation to exactly 2 or 3 bytes; add GETMXDS
  2/5-byte handling.
- Expand M0 mapping to CRC/parity/transfer-abort, not only frame
  errors.
- Restore dests[].payload.len before retry and on error return.
- Avoid kmalloc on the common single-destination GET path.


Adrian Ng Ho Yin (5):
  i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
  i3c: master: Report actual GET CCC payload length on success
  i3c: master: dw: Map CCC hardware errors to I3C M0/M2
  i3c: master: Validate GET CCC payload length and retry Direct GET once
  i3c: master: Add optional_bytes for variable-length GET CCC validation

 drivers/i3c/master.c                   | 97 ++++++++++++++++++++++----
 drivers/i3c/master/adi-i3c-master.c    |  3 +
 drivers/i3c/master/dw-i3c-master.c     | 31 ++++++--
 drivers/i3c/master/i3c-master-cdns.c   |  3 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  5 +-
 drivers/i3c/master/renesas-i3c.c       | 16 +++--
 drivers/i3c/master/svc-i3c-master.c    |  4 +-
 include/linux/i3c/ccc.h                | 11 ++-
 8 files changed, 142 insertions(+), 28 deletions(-)

-- 
2.43.7


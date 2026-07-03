Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320C3A9D84
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075891; cv=fail; b=gFVb39JNu9xqwEpqB0GidS7u0Z/G/76haXL3sZmzr2J68mcpYREPw3ZGfa8RaaIThdwApbAhpSWaJFYvelVCeGcQLjLby1EXBYzWumXc52XA1dmlxOVGT1OKbdd/bH+JYdzYF/5NrHHL5SLOM84ABWTwnN8Myb1xhyzsHkhKp2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075891; c=relaxed/simple;
	bh=Nqoabe4JR2JxH5/JswbWtKP2qOrP4AamonZqwvv8xWA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OJVWHLiq6GHCd0JANEOb76wGcQHrBTUeqmaPo9Edp9XIeLfnGpWVYrQlUBzjtoB955q4LCCs1mSpveqJZuhmvahdy1T3+VxmNvd0cdxJmL9FXoyzIJ5RFWrOL2gpc/PW94o8I9Rl1frKTsL+XEBhuXI9sNo4ug6nXtZ7K0NQlG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tDuPuWLh; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tDuPuWLh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhdSdoYjZy9AO9r44MSimgAxfEUHHjvsTH0dxUpRqY+GflSWpQ0WM52PgC+OkpUQ1MY4JVqC5aHC7uz+XB/plKIqpaEPdr36QiGzVVcRuOGD3nCCzF0r7EkXeAo6so2mh22JOYm7y4YznRGZ8kkFMBq7xPQ9/J3zTrXuJgx7w882RrbAitni7veyLUwsmmox5UNUTFeVBzHz2qbO5t5kEQLy2rC64b35wWADteiplltqz31Y9gyHCTHCvMWT49cQ6EQdIYoUg37+KSsQHxyTS3SrieKL5giPYIA4dgfJG9wiOvi5mMjIl+7WCnB6tNeph60JrjfycYNhUjExzTTUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP7gsTdrMjF8bOE6NodLMF7JabLkzGrLDGtuA6eiKiE=;
 b=kdYswrpUe8xonvxyjKNbttx1xVyiJTF6wIAyWs4Z8yoadyFMCnILp5yhFXIyH3mDrIzuiK5ulguoEu3GtLd7vK8ePN4WdxUW5LxmJsVHBLUIu3b4l66xM3expbibub43IFfGzupCX2cWO/6CMY89N41Xrsa6AqKcblA4NVGM3zCahiBQFRZDltQToXoRKUYEEzDQy3Dw2ZH2AfOT4eo6S/Fu/A+1x7ssjzbmZBcBxvNyaM7U7n2tbJa6kP3zddfdC7OWZIF7yIQZ1A7cNTlX1wHy/IMjRLPh/VY8ikMMazevlOPLKQvLLBHY05jIR81h6LR5SOj8xRwL6/rJzKfSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP7gsTdrMjF8bOE6NodLMF7JabLkzGrLDGtuA6eiKiE=;
 b=tDuPuWLhH20AfjtrkQqcVXcDb9YPvhTu7FKrBZjPQzHOE62/0DWEZwTLBx5N2R0l1wEUATKEEXwgRevHtTwRkdyQ54ymZ2zrnSphVei5uMWe2it90vNw9CTvhbZI4zIQzOGCyNedtT5Chd9iZoGkP41pPraxTM+WwaggHNl5HWETIwMXKTAysgAjySBq20qexR3FCl474cPfihicpCLHqxziPKpYyP9qkpkZg1Mythun1OchIse23k3N1jLlWDDDpNK8yIGIcZjo1RXvpxZxX2P4514lnLGmVZ+RJKTR/edXn820/nlLG/tP7O7pefxZ7yJlIxfQOh8durshsQSnfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:26 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:21 +0000
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
Subject: [PATCH v5 0/5] i3c: Improve CCC reliability with actual_len,  validation, and Direct GET retry
Date: Fri,  3 Jul 2026 03:51:12 -0700
Message-ID: <cover.1783074850.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: 9a037ae9-0cf3-4667-ecad-08ded8f10471
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	yGgxD3uv+dCkM4rbB8RpFGPX9dAKAc9Brp8edgeNe4N8+cNDZ3s+3DOdfkdOehdAszKC/AyaZt9MTVbUOBWUSDwLUP4zKPyn+iLILnzIIuLGo/dOSMWC0kY6MrGknUoTk1Blw/btjtPrTdHPbtOF4vUbmU9NEJtFIzQH9/3pj93R3eh2RyZAhS/nfA2Mjw3/oH7m8ERv31GzJqyRiJvbJsvoH2Z21OFLJb0IvU7Ws0i3Ah11FPs1xyqA/ITeovrgYezxJz/nuIVGWrrMeTT8CI+cmSshCnoiDziPHQfmxf/FGhcLkv88UbLXY6fIo5V1F5KWOzCu3GG5zxRlLGuRG/zQ/Yprc7KEU4gSJrG03+njxSJ9ADQFZJFNiwkiKJQ2LSMNgZcqtNmbaRgYrxOlpWuh+Xn+8U7kZBV0tnJ28XA3AeT9I2SG1B3jla3XPnReR559uqeCGwJxCLVirJAMelLw8y0AgoW5LlQ1lzv5164gle3Eqa/aLqsPA9G0wu1pOAbNyioJeDxmK5FQJgvqyF4qSCTyzOTDu7zBsBtXHkLLi3mv3UX4KZ8kb1RDICsSXXyrCAhxUBLdNGMoSlmexIrtVoNzr/56JkOfcE4A1WWmKINCgC0Bn/EC4JDNo5dj6JQParmP371qK655nGkFX22wxhxY/Te0DHE3DIO9QEG/pugdkfLPNzIoJWXwZvcmxLOjKRzeLJBA6bJ26/e5dQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WvY0wQtMzGx8HRqlWdU7sqFDefBInuqI3O1wXpAO8LpLZdDYw5TjcbVBIj7O?=
 =?us-ascii?Q?PUzrQuOnBDRHO7v1Pd8I3uxWuCl2ycNII+cGxHaV+amQL2PFumEAzAQOBkgE?=
 =?us-ascii?Q?UzE/ijmCiWnCOG9tcfN8YPy+p7PdMfIfrnVPPMIfSNPek00UdN2e7D0iX5xw?=
 =?us-ascii?Q?wFshvZh7AIVr6bJ3vyG+fDnxsgWyRK+ioG8PNIfWDc81S4I0ZGcaIIlMztYo?=
 =?us-ascii?Q?GpXCxLB5UFKCULDJvdEDUggDFYtK2Xp9OGhTnKcUcb6+utyFZCNJrTPYbsOJ?=
 =?us-ascii?Q?er5PVuyxEFP0XlYTnQe+BuAwZHyRlVGikiCXDXX0sm8jdlNI6BGGcvWUAUFU?=
 =?us-ascii?Q?/xmN98nr8Oog5EZTPl10IeoN59R+6ZclPs5ljnTjOfdE57FBOhtIkKvrOOYu?=
 =?us-ascii?Q?upc4sd2VW0mu0pn8Ft558I+HpyIymjOyXEgFrjV0CT7SQAMF/8TO1FtGd/H2?=
 =?us-ascii?Q?YHDyaqFWbV3rIDK1GdrTJqR/trpLHvWl0Itb9/W6agIhnG7sW+ghRrHH5STA?=
 =?us-ascii?Q?PL2kNtRdwrpEvX8B6i4cn/edWbKa0jSBkN9DnEzqSmItO8lYsOo50jyN0qLm?=
 =?us-ascii?Q?qv16syEEdTTdpopkrps1aHp3Q9M7r75YGPycBBs25DkRRW1cspc706XAncIB?=
 =?us-ascii?Q?Pau/t8LaMMo0Fs8ZKdT6CQTOwFav7xUkD5ZVBbQuD9n/+D3M+S7wwD1LxG09?=
 =?us-ascii?Q?FtLxFljze34ypz5L/NL9rlF+SuKJUmZTkmTzlgtgPk2Mpr0pOV98s9lc/Na/?=
 =?us-ascii?Q?tGlxStdrSTExb++bZEM7ydpO+zTm9UhTdPnTZ2lDVhxQ5rnEIl2DDD9TzeFK?=
 =?us-ascii?Q?4qi2UgML4l/bC8hNTazCLvrP0y3Ln7G5gzryqzcE6avHmoFalZnBkO9WGiEe?=
 =?us-ascii?Q?MsZsdXnUEn4JbJeP2VqlldsMUvri+imwu1GzE+ChkTYS0nYCa/InDJlYNOaT?=
 =?us-ascii?Q?L1DIpjgwS6Yik/Dn6goN2VivEIrnCkBBSus91pkdpA16ebybM1TUP7519SdJ?=
 =?us-ascii?Q?jN8GknAG7EB85IKybA9sLut4LNYqw79M4OsLTIp8zdCOJTwPpwolZ4XP1FFW?=
 =?us-ascii?Q?d+7gFTyjVTjxA0RADFwNoiQKF5Qsp//AYfHYYmg3aLlfxlFgk7YLC3Py9Sil?=
 =?us-ascii?Q?+ht6QWpm5Slp3tW8Tp4tlnAcYGUZWc1oLrgkXzajiODr4t7GklUiQN6BUG1g?=
 =?us-ascii?Q?9pnl2ILWvfrnuC4RHGGDXqqkq1kcqvBWXT+YPKvJGa8AJo464vijIYYInixw?=
 =?us-ascii?Q?by7gxbda1lsNcZODnW8PdGMnWqnVAZC1l3HkrOcQvSs5/aNEjYWk7fUDemg2?=
 =?us-ascii?Q?wDsEfkIruf9F0EcXKYwceEpqSvhX0qFcvgaPWW7t4Hxpd4aU4abS8zcoeRuO?=
 =?us-ascii?Q?ia0jkYvkN2n36kOp4SpvG+ebbram3WYiUvvzkrKELJfiBQbFTtXiRI8DV77D?=
 =?us-ascii?Q?L0i2qSC0XHg6kKYxYoTUmIwmIJ9vAqt+hr2PmRE76osDjheHe1V7Ax8j4N6F?=
 =?us-ascii?Q?9Rm8RmRaFAQRLzv6ttTynVuP35ZO8yyd1wYiXlIJ8QgTV2O1j5bKkCIrJ80D?=
 =?us-ascii?Q?RJmTC79Habmo9moKBfOQk/GZ/E8qdyXvCn7DF6Nj6598LvL49jWmI/DYi9P/?=
 =?us-ascii?Q?WbyUgoSBpDfNURG8TPUWD3w8vsGNuxo5TOusZ8Urq6xKtP3hCiTKqsGzTEOO?=
 =?us-ascii?Q?r91wYPWT+DihbqZ6nP5D8EwB+Jf1PYs6X9PAaXpjR65iDZwSj8x2tnTq/LKk?=
 =?us-ascii?Q?RyKq5LoF1A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a037ae9-0cf3-4667-ecad-08ded8f10471
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:21.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBbnVxvJehR+8xm5V3tId9c2JlmxPWi3rxxsKaRjVd98riBTvc5uJQhVdmx5UUbGnxjqi60FtKwj5OkSl60a3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631

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
 drivers/i3c/master/adi-i3c-master.c    |  2 +
 drivers/i3c/master/dw-i3c-master.c     | 27 ++++++-
 drivers/i3c/master/i3c-master-cdns.c   |  2 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  5 +-
 drivers/i3c/master/renesas-i3c.c       |  2 +
 drivers/i3c/master/svc-i3c-master.c    |  4 +-
 include/linux/i3c/ccc.h                | 11 ++-
 8 files changed, 128 insertions(+), 22 deletions(-)

-- 
2.43.7


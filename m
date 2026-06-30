Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C63FC5C1
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825638; cv=fail; b=Yn5npkcr8AmsLaHCC1fD1wq/Xm0alZ6pz7c32D+xlXYJEFR/Fs1C9jWMW7IEc55B9ggms0Kmu8g7QziFf37XtDM4XrO8PBLf3/nLV09FBsmclLDmlFuAMkUKF2qeUgdeFlvMuPTVEMyCRpvsXix9jC/sqtmeS3a0SC04lDpe070=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825638; c=relaxed/simple;
	bh=WK4boK5s0DZDAZHa0gWOPAKYtanpg2BCg9/VKrerNMw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jzsb0oGoC71CmDAsdYhnN3HyznTofY6oR0J8OU+A2NSzoI36fIJrZNzR6bCY0wU24JEeNkcSnIfiWWD0ixW8i0bXsiveUguBK4+ACoSDIMK5xZevlHlRmBdFWF9CTPepDNCdah69QM8mWJ5vRLtB1+Ow4IiClOAySWL5ynb5LLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=qdvcvNMy; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="qdvcvNMy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPlIAuFuzaxWuIe9ubbdeP1mw0hCODnnrbldrBO8d2WAX7xC0RS7Ij+eXYLYrl9i3aCkms5QBZ8PJkwXdpl0bTRc8XbsNxveYyC47Pm4mKwDMzeKAfFy9Tfx6LU+8KzyOE5Ycy/UVRwQIaqQVST2JqYKMcZr+JHziKPXXRLMq8S9Lu8KKhlQ/xSWMcS3UioCZ6t9zeurf/MisqIK/SdwLyFoWaCwdseO/QjdkUIIFStJO/GhTOPqtRVGvI8aCTmMG8Gs5x4AxjBZguz20n1bk2gEAdrsEjlVz+OAjOKpa7MACMnsEKaAzsI1ipJ7WNxzGnTxa2Xa3YSXEZ0NVAZeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+B104nHtC7nVQZf7ssrZnXLrYzAblxWLflVo0brYFwo=;
 b=Mel18FmO/pP0Qw1wC8g6Xa14t416Se13r6PG5AFqa2lPj4zvtvhYcXM2im1M7NycPnQmhR9dH/G0X1B84dQ+GO33KANC/GdalqDlYXuWTGdrWrle+H8zkC4+ID0zx5c8WsP2oJDBypcSGpt25qeOSMHRDzol71YDUCqCg/UeTgFeS0/L46tjakxZI+UYM1X78Bch7xikS79TCa2AkfYmkxQlpOLinu/hoZeg1/V1yCzTbUIwTS2E1WuwBymKJ72kCrzOd2bxBbR+jWjBkeVgwLMpDhIy/1bLn30/+6bnUVSDP5PS13czIeouMPvXsnSb9CRY9Wnq2BD231HlPjFnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B104nHtC7nVQZf7ssrZnXLrYzAblxWLflVo0brYFwo=;
 b=qdvcvNMyWT1ypFVHCqsB5nT5ZIN139vOTzQ9mUXKOWRTw3JZXRUM4xWsA30mTtNzDL1R4sbf2Us2SY9bxCBvF4PIY+XF002xT/Rxrq1muV8YP7svv6qybl7qJoJTHLlALuCtgfc2YoFamK8yam5iAOfW6lOOKennxvlAGsFYnpjcralptr7YjusoQKVbeFS2/n0qdYy51Uz9BYyJV87oqdSTOs1Kw4+Sox6KsNQlPg7yp4KKcGH/0UBGgJeVSu48nlepnDCcOjJeZ8mcaCQB31ey8G0XZy6RB6mwasbZ7XVmAgwyOlUANDJBDeaLBzZI0Tvoxsy8BIfCPwDeq0Y4fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by MW4PR03MB6394.namprd03.prod.outlook.com (2603:10b6:303:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:20:31 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:20:31 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v4 0/3] i3c: Improve CCC reliability for DesignWare master
Date: Tue, 30 Jun 2026 06:20:24 -0700
Message-ID: <cover.1782824628.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|MW4PR03MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 03653eb8-f35b-4285-4f24-08ded6aa5c0e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|11063799006|56012099006|18002099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info:
	pebkfhEWtdvcuFHBkSLOm5BOKqdR3Z/76hXjMzgiGP0akopAPHMxQcp9rp3n2l4c48aJH++2jRzmGXCUXPAySxMiolqQscsJnveSf9feNVfqEcmUhRefriB94If2tl68W2Nl6g7aU18Zxtx4WtWY4hERfNJUpEETEHhLF/KIWhd3lDgIZZJS9ghjWAxTvls0tDQ/HVzeCIw926x0LaolF8sapslVjxRSQw4Lb9di+HFYqAbaUdf6qpWcPje0YLH+to/48QgdnzhGxPdfPGF6PUVGGNPqNBHuggw4yZP3ldmJCbmmkRdcfOBFdLEDD2qKyDs3ubhL/zIG69u9n2R+YnM49jpgf4j0yav5XmdqoFeol0eHw2RViEtdEhI2b+bSCiBw1ntZ07jHsQLPPJ1/0fPSa33HLOWyllJr5Bxgu+52pxVdk3MoljcHcA1GXQ1tuk6EM+6ehzE0ynkeqnKscRTJtrF8n6/SOqSOBATPiWJcQ3bQK+wYhSgsky0JHDu1fSk3ualEEZp2reVHTs+fd9piv5p3QKioOXLEug3HVZJzmy2meN3epI9Jy5AMsTW3oCSsWfl65FOiWz83akA4s6tOA9Pa7D1VQuJTirt7lRh0V5jSVwrTflacpbI4e1YsA3aK0Ck32ATdArrzcjzeSTioH1w7fjng2g7hull6QE6Q/1Zh78X8kiaSPzkB6KwZiHX3ABLSQ0aRqTLmzHRReA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(11063799006)(56012099006)(18002099003)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4qjz52BHlbaaohFBUxvo1FIJaBwDe1/+iLboPG6FqR7L6HE1XA05+AewfgOi?=
 =?us-ascii?Q?nvwqC2GK4Kl487MGRH48Rz9sc2pqVOQSajE6h5t40m1ymArsaIuhNzk7u4co?=
 =?us-ascii?Q?X2vhdUSgl0dpBuwn5H80VSGmp1AKCYZ6jupysI0GUObfNYKpn6Ib7hG76IHP?=
 =?us-ascii?Q?mXO+8+wj5OgYJA92VC8eeKQ/jMd85R2zE56SnJa1R6Q0u7bWBQHN3Xcy3HAy?=
 =?us-ascii?Q?YFUlI5J9V0KwLs1RBrrxGTo+dY9CkvXJKwg4ks67Dnw5nBOKQA1IJIDDG/V6?=
 =?us-ascii?Q?NX9RKtC2PzvcSt2z9D49tkSJZrF37RWjIQ0s/P4gcf1DkMS/twPxNPhOEt3s?=
 =?us-ascii?Q?/l2RcoyzvrL/wNNsxswA5V4NPBQTD/ordcOPanmrsE2A/2hH8UMcoh8gCMpJ?=
 =?us-ascii?Q?P7NXw7MXB6YMgHSZW+MtPbdPV5peqoT+UnHVlk3m7l8+kaGVtWMzCARURToS?=
 =?us-ascii?Q?RqaiPwR+diAoXEdBVizYfB5mC0FXBg+kWVlZN/OdgZY+GT8A/O/JywirGdBD?=
 =?us-ascii?Q?NkgOlXGU4Ss7RO/AjxIoWHyfW+rbhnfWNFi9jS9/cOYRsJpgEmBIi7ZBNM6a?=
 =?us-ascii?Q?VKM/HDw8nukRg52JQv/45/7tNK8MwbBtQFf2+j/6MW8jp6JWn6lwyD1k7jYT?=
 =?us-ascii?Q?yv6xeXrxo4/jfT7yQhKhqZRSw6oPPfv9xHGksrBDa+HVPDMmK7aiu3TzQT9/?=
 =?us-ascii?Q?pstCdS9X0ME+KcSh2uV3ijfxg3CAGTXbkH0jIdz/PAJcLlWlG/E6mWVcO7Zm?=
 =?us-ascii?Q?p77wEJMDG2SSHkTE/G4UMJTtt0AOaZicoD2G5AI4sUSR8ANQoDQcisqixHXN?=
 =?us-ascii?Q?JZ/OvXqpED+t4C+iAyghzvaCnhiCfbbOz3cynMusEj+KkIPu8ITrWIL1Jdt6?=
 =?us-ascii?Q?Y707IvEn6FguxHRHqxrpsz/CbEFgGsyfSu80xE9tOOnSWw6btSpnr+uKqjP1?=
 =?us-ascii?Q?FpFATOAR7UmRTsyWJOUkgN3aPExh1XOBLPULIS8/MLkPE2pg4yk/hQ4A/LaB?=
 =?us-ascii?Q?6DITeirabZRuv+FrVcyY2k88mMQLpzGDlVEXKm48xULdIWXmwi5OdM2LEhO9?=
 =?us-ascii?Q?D6fS3W3ID5whjCNRh31sqsDoV46l5A9crL81TIIEwy82Drgmbm0juyjY3riU?=
 =?us-ascii?Q?I5ncdbjyhlOvg8FFtLxGzhvg0OkSShCucGOuql+nATBNJU3xXkDaBZrxg3fB?=
 =?us-ascii?Q?dH0kmtz7NBhEMddvbEHC63vZBa6p1jUI6VVhGNFpC87RcNRP5tRALb79cTFJ?=
 =?us-ascii?Q?dcniWHI6osGBZP7HdKZ0gFLBi4UgaOjtFFutw1BY6jq61jX174bezTwcKTMi?=
 =?us-ascii?Q?akbAfNoCXIFgPMTgAi9tvvV0AxxlW8M+Xo4Z2Xzdq/pEQiqKcYLHyBnUr7SP?=
 =?us-ascii?Q?as4ixIXYAibBqH6KGLng4gh+KHChPipRE5qsirssCl8ovF5qbV37nKhNdtcB?=
 =?us-ascii?Q?W7jwfZie58Jc8LuX+J6i5qoi0RCsOrhNtxKyfaQvKBFjbWW9OgRLrw2rJvXD?=
 =?us-ascii?Q?uyd9YBiGwIzDgbnwaqT5d9++1prHWD8p9NDEv3TmS2jv9oEAMj+yixIjvN6F?=
 =?us-ascii?Q?XP6NpeBVVajSH7jal921fV+M+gxKIRvGEmVj8EqqJ/nt495aNvpCqnbEE1pK?=
 =?us-ascii?Q?89xKrXDIOWZHT0KCBU8piZj889H6CeXh89xLrFvmDd4PcaMRMyjn6xrk+YcP?=
 =?us-ascii?Q?fBp2BUt8zmzaRdZjnwQkJNphJuDIQyLHkt1rO1GFYXfQcv/MI+iHfFAVqLrn?=
 =?us-ascii?Q?gm2TNRkc8Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03653eb8-f35b-4285-4f24-08ded6aa5c0e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:20:31.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzBQgD+yA2tM3M1IFl+zutD3IbE3nt8KfvlemCBjSfMxrl+KDLenzKHQqfC/taRgVmSepvmMSe1Yk27KSpF4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6394

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series improves I3C Common Command Code (CCC) handling for the
DesignWare I3C master used on SoCFPGA platforms, and adds core
infrastructure so the I3C subsystem can validate GET CCC responses and
retry failed Direct GET transfers.

Patch 1/3 adds actual_len to struct i3c_ccc_cmd_payload and has the
DesignWare driver report the number of bytes actually received on
successful GET CCC transfers, without overwriting the caller's
requested buffer size in len.

Patch 2/3 maps DesignWare response-queue errors to I3C M0/M2 in
ccc->err. M2 is reported only when the broadcast address (7'h7E) is not
ACKed. Target-address NACK returns -EIO and is not reported as M2.

Patch 3/3 adds optional_bytes and a per-command retries field, validates
GET payload length generically in i3c_master_send_ccc_cmd_locked(),
and retries failed Direct GET CCCs once by default. GETMRL and GETMXDS
describe their variable-length responses at the call site via
optional_bytes. Other I3C master drivers are updated to set actual_len
on successful GET transfers.

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

Adrian Ng Ho Yin (3):
  i3c: master: dw: Report actual GET CCC payload length on success
  i3c: master: dw: Map CCC hardware errors to I3C M0/M2
  i3c: master: Validate GET CCC payload length and retry Direct GET once

 drivers/i3c/master.c                   | 92 ++++++++++++++++++++++----
 drivers/i3c/master/adi-i3c-master.c    |  2 +
 drivers/i3c/master/dw-i3c-master.c     | 31 +++++++--
 drivers/i3c/master/i3c-master-cdns.c   |  2 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  5 +-
 drivers/i3c/master/renesas-i3c.c       |  2 +
 drivers/i3c/master/svc-i3c-master.c    |  4 +-
 include/linux/i3c/ccc.h                | 11 ++-
 8 files changed, 127 insertions(+), 22 deletions(-)

-- 
2.43.7


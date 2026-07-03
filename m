Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F613B4EBD
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075892; cv=fail; b=k72/47SyPHjPS5e4HFccSlUlspERPIOykspVNQYVfwzZ68CnGk/a++zd35mUcDcFc1ZyjA0ABnLQFb6bKI/NMfzIUX1eGbn3WMpqJjBVzIPDnadY5OgPTXYHaM+tU5loH6Jt6qmd3pzSuRyiUMP3tv11IznARC0npWGw6SEPYV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075892; c=relaxed/simple;
	bh=ik8mlKqgFZNWegUCt3Q/ATZN3v2qE56qck0cmxBMOZk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hXEnj2nS8InL0LeSd+LQPmGBYE1Rg2vyfZl65/o/gruwTlA/9WroSXL85pCs0Fzypfl3hKaYL6QNwvhXQJX3oRxQBc2ICBVFIZS2vG6pFL96v1mKn7eb5tOCGrewiN1LWAXomMNly0JvUUNMshhmk8DaCHxEIVgCSIvXBpvH10U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=kvjbaRit; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="kvjbaRit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM3o6ABfQxkSSc79hve5NeA2HYPPsRlF0veJLoXMa5zayj2q331OBDunF/roi0+ECbEp7+uu6s3pH3FMcy28dhbb/x7lSUcPoREa/MSqPqas7V3EJxp99wAeCjTR0Gxqc/dBfX0yHUXcyUDeW/l7ZvPPfce2bRN6CAZ+ZsZvW+2np0nocdHhPmSJ0SV6xK6j98HoONnFC4X3dTfs1brprmz2PDu3f0IxMernW1CFmS6+yMfZxiBDR0c0fGv3gAbiBKQ6sDyrbUYMjr7MNqAZLS80IYRMXBhiGdZmTP8XCtrY88ZqMDNaKXy/2Ayxv6bgbEs1vddmzyicKiikakIewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFK1IVui1LeOUM2EFqAUApTUQOVl3zJTOmCgCUK2tik=;
 b=C4LEmJEC1+Fe7VjwtKLVue6oxAz2SYn4oQgjg65b6PRV0x7EOjpvy6l48Ob0uc5/gnyWJ2n4hdGiB8kasWxWaxRpoksTOaLX/plEuMfth0Q4R8RGTqsB+dvasul2cOfuumLVbh8v0jlvCi9rcQ7gwEt1+LudBsPf3UiQkpuDNOrwHI5/EYxrmvD3r2gGq7H+JBoljo3KmZnq4eqjNO/9CceQLdC2qY8BkhRDJp4OZm7BxJSxxCiHUihAz5uAn0l48eZ5u93baRfDEvU2tVm87QAy2SCnp+ueHnApe2QWKDWg5F80guOjE8H4akYsm0HMLR7HweDSwmOJu8mJlIdK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFK1IVui1LeOUM2EFqAUApTUQOVl3zJTOmCgCUK2tik=;
 b=kvjbaRit7tmhL0cYYOg2Hc1jnldbVIf4bH4ZGeqC6oBoUYoMhmvlcpcdgNzg8GsTJ5sg4mBpF5sNFMAO3jl03uOnAKMTdUlIlOIEjdTN78xDem2qXT9UKiNb3d2LoE0V9bCGB+lT2JqDeTJlWFbndFu1QdWAIlGVNBM/TDT4gUjmNtnbuLUhyafYeNitECyu+xzUXDbsiGQ4HXcRYmo/0jRz9tNp1A9FctGlKz8aNR134JVGb7vq10QPfCPsbmRozwKsq0jXX89oAhAE9y5WGQFDqdxMhsr7z29gQD8hSIpGWYBCOeYUT52bWkkBKuNktwKp8osaRLZjyg0oP8PV4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:28 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:28 +0000
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
Subject: [PATCH v5 1/5] i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
Date: Fri,  3 Jul 2026 03:51:13 -0700
Message-ID: <e452777c3a9be734a97e20b9822d8a4264ceadba.1783074850.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 61f49f47-9d50-483b-eb84-08ded8f1051f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	hGUcUJeQvlYg4TW6wz/UF4qcusREum6WPRZhQr0Kz5T5Lwbi71kgEF47SI8Ep/Xy0rVLBeWvHL3msnyXlDwRYUMI5NAW8BxdBeI+U2oOKT+DqaVPdyCwIYmDVz7p9CgZXfxh5pz3H4+7Sv0RKx7mu2CmoK6Yew6sjkRKDvwdB6qBcgVEYwrg5I+svjW+JMU2b7aicpUUVkL5L/LGcVdWBEKNEu+bYAbruKzEG70FwMmppqOeCVeuESsBAmr4ymlvnwkJrqyGZpQlL5Q4U3TaeMMwIf6gVwI8UPBhlfk84ge3n3zE7BNEkEFvo5cmxXRCD3n+jpGi+DhN+Y9zq/37f8dZCSMvqxyvzN+e11vNZ/6Rq5ccV5NKqZDICzsLQn+0rJTvCtEz3UHYLEIX9i9ZfaRtVHgmzw6CQuq14stCbXVxC0wxluvUt/XX02ShptWvMEr7wGkMJeiEfv3jSNWgDiWwahnMmU5MiYE+iXPzDW4xK3QhHuCWNAG0xt5adwA8P/fnbeW/K36L7YB6zXI8fylaj/+zB1M1KAEf4iE3nRG30fBnxWy9P6DUaMmFqplYjBxDd9D0SA5Nt1nix2EbU5ym2xlhya83aZ9P+KBvu8K3ODvrsK9G6XgjAzcbeX++G+JLWskGrQPL2c+HcP1ukmBiQlzVGYqkoNXQYxALIX8vlEZ/FFQCzAbxIgh1wgFaQhH8qrihWkZjLuj/zkNHjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L8jQ55aaJ3MIsGTwhjJ/PBwD9U4V++fhOeDkHdIPSiWYcGErvUynXwSkSrBU?=
 =?us-ascii?Q?yZVHqRfss9STML8kcZSyxHqxq1bW4QmCBfuML48jFJwqCNGonId+dD2r29Vc?=
 =?us-ascii?Q?CFIOa7tY55C1MPSyBfa7q+Sk0lg2i66Bh5nsEW9lVJUF2iNrAUdjwPq3SLNx?=
 =?us-ascii?Q?VpGc2K9pIJJrP/OFPu5R6ay4ZMn7xLe9/B7e8dG3OYipYdjJOqLzmF7V9Uvw?=
 =?us-ascii?Q?OkL31Vsv2A6SOHEl9hQREtnnwps/fG5gXHA108vcsvbxoIiByUQPhtpnkFuT?=
 =?us-ascii?Q?dPxz4FbJoBXGK64yraeH73vaQ9/fHKLeqlh73KfR8g9ixxaMYYiOLcSUCPgv?=
 =?us-ascii?Q?k/TiIVQwihwLEmR3zjxmRYcgG5i1oGBs5xE6fzfddMi6OEx7HElGqD6Uhvuq?=
 =?us-ascii?Q?HhaVEIJ0fwY3ns+e77zF9AhdTDuRjplB5IEoUbb/F1acpdUHgR2NSRubRv+Q?=
 =?us-ascii?Q?Gf3ubaiI0auepUsOsEfZYPpEo0z4zoKhIhW+JjshbxhgXJjpVFVCSWgKhSaL?=
 =?us-ascii?Q?KeT+3SKrfw4Fxgg1/B/ZLfzRRh23cBS/wP0bL8SP0GhfYaN2CfvUmpV9Q76D?=
 =?us-ascii?Q?JaXb3IudIFfqLiFzdsbVNvJtcyQUhqJpIXMS1qVyNwz1cpbZiVMxQKtyPOrp?=
 =?us-ascii?Q?Lu6wT8tnG30VtPedu01+4nwjer4FyQ5rEB1Gl4OMSRp5hg4XjuHhhQCicjL9?=
 =?us-ascii?Q?4vo+Xivck4iYPe/6w3yC6GYNMXS+B5jRs4OpBBDaDPg7+oG9tahljoDSJ5rL?=
 =?us-ascii?Q?3wBncM47mnCDVTuiWcTH5PB3Bl5empTww9z8Kb7KqKtbnvSLmB17VYGzch8R?=
 =?us-ascii?Q?Cmf/EVO7OBCsa+YJDRHc6Ob3037eQMwkK64ikcoiM1T8HQikBsI4eiZXs5RD?=
 =?us-ascii?Q?XO7E0hsG+VcsJNbftb4rPCf5BdX7B7kOYdp8m8oba02ueOMzozQ6iQ8Po1M8?=
 =?us-ascii?Q?lRAVV8pMq7phsWumSIBNpLVwRHIbJMHnnfwuePFSwtahWpHOh/yIxrHkZltN?=
 =?us-ascii?Q?Tr+a3HDHSKpdTw+5wlxpOD8e50Xq/nGx3jHhkjzz7KByi4p0x8ar8UZXwZd0?=
 =?us-ascii?Q?l4smjQcMxW/eHiov3oIM6k6JboGLZIqkEV3npjO9bafAg88H9QKxIwVDMUqI?=
 =?us-ascii?Q?8kUw7NVu+IbKBadHeNtQzIXp17BwzOlBLtxu2yRGIKdJoi03e45zCRmFyhQ2?=
 =?us-ascii?Q?/BMej7g73rTSR/QvzvseL7UCe09j56VjZSCwMuXNpDdZt/tePrYGeeGFGyyd?=
 =?us-ascii?Q?Z5rQOetLCiCxqJxE5BLKgMkD6T2aHJTnZK25xkhxIp68PwCJS5zr7Oco8la9?=
 =?us-ascii?Q?4Z5QYnjJTpgtLzqUnCvNgTIS0Xmga7vzJ1acywD9NfuW5Epzerprc7ofY9YO?=
 =?us-ascii?Q?JD6765t6lBoMN100J8gkH3DbIzEuJEwMh2NEHe9H7q522QiGwwdP4FGJgxmV?=
 =?us-ascii?Q?sb+Rvl4Lw646nTBnU2HobidsvVaoTlTF9/xEjLiVaAyXE+ROsPDs4JZbubir?=
 =?us-ascii?Q?xmoG+sbXp8iKiqR0/uAlBqGJkQ2BeKaZowMMYfjyVi414UNiVw7dmrpyV88q?=
 =?us-ascii?Q?9kdj5T0sA+9RQkqDvYXsuNtd6HPMpMH4u3nDvHMdtgtCSUux4C3cqXzd95fL?=
 =?us-ascii?Q?3F3YslhSOBY4670Rtm3FMYgqFXK1klbzUvmrQedDcuxRSbW5xcbU41udoif+?=
 =?us-ascii?Q?fDQbGLEx05YNuS+3HUfVNFPasKGuF+S84dkiTauvGnKOgzUYkXjlyAR2XryI?=
 =?us-ascii?Q?rOSl/rOi0g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f49f47-9d50-483b-eb84-08ded8f1051f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:22.0584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+JaVns4v7z3+MZQaVCTvFGDC8m1otoDt8ZNKzSrOcFYedu5jk9XoEWs/DozDgbLfn4NbVbjdJEMZ4lO1YdYDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add actual_len to struct i3c_ccc_cmd_payload so drivers can report how
many bytes were received on a GET CCC without overwriting the requested
buffer length in len.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Split from v4 patch 1/3: ccc.h only; no driver changes in this patch.
---
 include/linux/i3c/ccc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..d8052949e57e 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -343,11 +343,13 @@ struct i3c_ccc_getxtime {
 /**
  * struct i3c_ccc_cmd_payload - CCC payload
  *
- * @len: payload length
+ * @len: requested payload length
+ * @actual_len: number of bytes received on a GET CCC (filled by the driver)
  * @data: payload data. This buffer must be DMA-able
  */
 struct i3c_ccc_cmd_payload {
 	u16 len;
+	u16 actual_len;
 	void *data;
 };
 
-- 
2.43.7


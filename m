Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351139CD14
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621120; cv=fail; b=BjPtuZ9GV8DBey1VVNXuS2Wr5hRbTLkrLYeEDi1S4Ss/97FLz9uueG2VuzfJd4P+d5M+5HRnLw626tB63SKwcPDB5ZLW7GfQb/n3lZbKW85rprbUVivl6kj2gml+K3Gm4PW3Us6B1ldHCL+n0RsX1WtGVJLsua0fbIrs82EPpuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621120; c=relaxed/simple;
	bh=N+K+FoK9YaXKOetx6wQJqITnSmQv3Y0NAGJBM/uz4uA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XFz0iGtza7doxmk5rJ8pVU6y0Yn+BgZcfS8E4xGcxunAXDyhz0uZ2xL0brIaMu2WOtwhTpDF5aQN3XgzhzInAVbsbcS0lGYJwyHGVqr7RmzdAF3a93MSX8torQhPvjWV4V8RA/2rJ3oYfztYcYdG+FkIDjPcDfd3cLc0WHRLa8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bLvhv4fS; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bLvhv4fS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6iEBWti6UHRCLLcsVr9KKEPWKZ97p2xd4akaNE9+QxAVUBQZ4BgkE3FJ9/AjkFrjZhujLIhLV8XrSYNAsCsnFW1zeM1UoytuRdRM0Jxgc1p2XbxBGZkhQeOLK0niukmN+XyN0UvwH9Dpn17xYj8ejei0fVf67lT0EypieVWwaNmnTJQVHdMMqTb5Hoh3SK4uWhDLZMSPrj7SZufK/0pGYWXmhDkXhAJOajM4sRhAvpptZkGZ6iSrccYh4yNaRf34ZKf64Z3Nz9pM0j5MXDaaLR0PcDie3YZ2Mgjh68sTOKeuc7MC7t9ZVXyDRAms3+aXxq++9/eYw3Bypr//tu0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV18REjhO871MaIq7eceufX5s4sfZ34OsaE4YBYrmoU=;
 b=HwhB8qxt1agwnnf3xiydwWXxNM7bpUlXYTrwRu0UboOWQOXp93W2Vsfx+zIs0kZf+gU5l6r8ibxoKheB1PEjVyYrHPbglGvizTq4hzNnhu034WGFlVE6qwxoi7cDqDe3iyYfRAYf8hKzVB2sAov93q6GiEOS3tJeb0+hwe7q4068bY7MSdNknF0ZgT7hacGbEm8QeFSt2ZDljGhTxgnGrzXCr0YTnee8wfdFgIMENoKfseKZDGmxuePDFXscC6MPa26Ur3jxR/IWiwi3yfAYV/ZYKlU2c5t9OE2nboogFMDJg0Z2pJXRKdpopcWSwMXdHC6jTKK4vVDfFtftTCLzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV18REjhO871MaIq7eceufX5s4sfZ34OsaE4YBYrmoU=;
 b=bLvhv4fSQJKj+zHHyprFacg7MK4YpQIWFfEIFpxUjFhnkAouqh4diIKH4zp/2G1dc1U8GbyODZMp1aYRnEsWli3rn0g2ps08vvPirj6MJWbJrsCtwgHkFOw9X415xx5nQTbJkEfxsDCh5yVWYOg2NzZlwXX/yXGmZZpYZzFJ0stxSFm5N1P3K5IAizEtPgxqhP8L4MyPSBhAwjMDew6H4tzgig7MHYGCdWVR/1nYker4Fe6kcUdUTGwKOFnZpyvuAr8nvELc0/K4fKtLmxlr5X0PeGW4ZeavfvS7FhkQpt/YWYRoEd9nTu4kloNQJrkfQ5UHn2CHESBCTzzYpeHOAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 18:45:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 18:45:14 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hkallweit1@gmail.com,
	linux@yoavmoshe.com,
	thuth@redhat.com
Subject: [GIT PULL] i.MX SoC Changes for v7.4
Date: Mon, 28 Sep 2026 14:45:05 -0400
Message-ID: <20260928184508.1978455-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:930:cd::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: c1611c22-7c0b-4181-c7fc-08df1d90a221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LEPbeD7StpF6tqTv0/MuPeLRgy3Hp1jpG6SOvYCNUV1nAAsvyV6O3akj9cwxvMNIUzdLaIhmYHcP3D1OWH8Q2cU/3oWTx5ETV69brV6i/+/1BdAaqFFVvqtGrIJv4wlTLljjx3duF6Oo2GlZmswBpHl88kECnfuaYtVy7QzgZjb1fxuQG1P/FUzn+Zk8AWnT/yGo6KEm5hUYCiBFLw1odWsD+VAB0cSSBI+ehuJYstEGRunvyvlQdQ68KeJzi7qvsvY4L+L7cLVgYm3d4kO3zaLu7yveDEYCkOBGVPr7oYAQDqUxQ6tUgNZ5VIzaWhhAWfo/KHzVi3fQNU1no46SncgfFsdlEupeEFqwaWjKc3efH2my/L/0IzO8TLD8KAOvFdR9DgpQ8x+wGlITNIc0/Zai75crYr1U7yMqRswP6TFPl/7OAKz/FT1GzxiP3jEIFtApdGY2lKYX8H4FCevGjiXmcKcWXNUsLJwT3f45Ta1Xzzx/iKW4vpH2RQZ4Ol9YDmCiNxQBYIX3N6/U/6kBAwNhFUXhBwghQjFlXig4XDfFm8ZnVeg4i6tfiyg2JpaQG/1nnx+hayTxOLYpNBCmMxgD3DEIXYktTqrCYNBDliU1jXMS/iQsaRicjsBRiB2VpkL8t/8UYal/tsQq968mZkxc/QTIxk4PK4B8IjjUCks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5SzqP1YI20GPep7oqUzmQrkJxt1XwdhdgzCzwJdSHZ4KkdR68gqFAno02Kt?=
 =?us-ascii?Q?OzSnejibr/xSFm4gY4NYNBXG3FxRbuwjfZ7V0VoNbEXP1autM0eG389DJlDR?=
 =?us-ascii?Q?Jw46lhjIT4ReAobsNyI0O3IBrACuMP/0RvU1umWCgoA6k5uXm/6LAhOwhXDU?=
 =?us-ascii?Q?JhrynGXHCHbKFtW3WctxXS06xR/j1Soau+sLrHGgIKChWqjBNI7gJ7+jBtjs?=
 =?us-ascii?Q?CS0QyYI5Sl73JAE0BPmq0kwxmOUqZbbVkGE/yY7r1PwwChLkuCmQAgkkYz5t?=
 =?us-ascii?Q?xAD0+3n5fyuYOLg/ZL8KI7aNzcQvfZ9pc5Y9h4NEruVUrEfoAiAtbTRyRtf4?=
 =?us-ascii?Q?TObnsxCVUXoAGa7TwtHs24urtg7Ij2JCcXZYj9ZpnoRAwEBpIMNAkWcbHB3w?=
 =?us-ascii?Q?AOL3+BPRQrno+KVQftY/n7lCJEq5Ww+J8xaBjFSUx3RHwCOG/Ht0Rr8I3Zr3?=
 =?us-ascii?Q?1zTH7+zw2WOqwhbsywfhmDGgaj26osEnzR5JI9B4fAlkzr65cX3JaCs1l9z6?=
 =?us-ascii?Q?MthWWHtkLOFPCCuMa3sRTW4AY9ft5BaD8kxwh27NSsSnUJodYUqEUIlPpKMK?=
 =?us-ascii?Q?G5vjHm1p+NOPu1P9RItJCCcW5Q4gkWbB8nCbxN6o3L/vV8atzQdXThB4L2rV?=
 =?us-ascii?Q?5NHiub00LZBihU/l1SD6dRDaIqAFCfjpQflV/i4ClmGILdjCfxHWtYU4nSlF?=
 =?us-ascii?Q?UGDTWf6lND3AnHCRB6H+m/aS4RkVXmpazYV/1Gj8E3x87gyXpUEmNEzHGzor?=
 =?us-ascii?Q?OFb88wBOK3DqG/VYpxCiVOyYAN1rVQvXrDVzpZgPQC45w7rJ8GesxhnHF9Pa?=
 =?us-ascii?Q?P2R5awAXJ1r+2C99SpRMGEsBxIWpmxOpsbA/NkQxyEx2U2mTbsl086nmS6jq?=
 =?us-ascii?Q?v0VcV5sTmztGM4J1lf7jl2y4QqNi89VzhMOmzZt25nxmuxfFfvYNnTirNaih?=
 =?us-ascii?Q?/53eUqereS3j2Y9YG8NoDL1olDxt9hd/ZiN2JK7rmPVL+kaD6ePhn2Eo54br?=
 =?us-ascii?Q?TuEIMdxMYLh+sScoImuhH9rzRsgjMIYcRrF2x+JJ+MiX8VQn9NNZqUJ8RhYz?=
 =?us-ascii?Q?GbRDxEVCh0Ubg5RuR0nuJuYaHbSkuyMpuvb9swo2tg4Uh3dmC70VaAhIYzs1?=
 =?us-ascii?Q?5ajlZgcyjdiXCiVQXiVvpXU7W++nCyciMNvjRcU5KZa2nVkdTLVd/vRL63Uw?=
 =?us-ascii?Q?BYcIOFIzsdwqcig92lIBEjcwsYYkRlAiRmGaDJ7GbVp9RtGR9vJTan9xMecc?=
 =?us-ascii?Q?lB3QVrUJT1LRa7iijvvK3GWuR+aAYMDar5PwO6lK5yKVL6vI2XJ74pRZC+Re?=
 =?us-ascii?Q?GBTpo0XUglBuVIwnaBFryuaqmgYCTlxDnpConjmCILvIkAvQ427uVVO/bmwY?=
 =?us-ascii?Q?9rUAVJfOAN7qE/RC5uCJkScVGXEzMU60Z1QI4EUOe23xvsPZ15nRgG3VstU/?=
 =?us-ascii?Q?j9Q7oEldwAQ2foAescWP3FsBx2dlE6gF0WnjeSt7Kix3OUwgdfElGRq6h45s?=
 =?us-ascii?Q?O+pha9hYA053Ymv7EGdYN/3ypdwiNk2lVKu3hwWyYovWTGCbpCPVTEHxwCJj?=
 =?us-ascii?Q?e6m9joCovjjh9CZew+LqWH7B92aBk5q5b6PkkunXeRWpckYcLhlQJdALqdGu?=
 =?us-ascii?Q?Kgsu4/pvKY5DwyJMsB9bAIqq6Ht2d3iSvqgZhxZ9Hr4usvSHCLK01WBeNjwp?=
 =?us-ascii?Q?RVziXilSGndAMVttc82xZNZckDzAoGJ9ISJ4o5h19CazBfFgmRVtolJcNNzx?=
 =?us-ascii?Q?t4keglc8OtUjWEBdyLbPSzqerAkI4QPH5Vok2LhMQ1pGt9CoDP3x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1611c22-7c0b-4181-c7fc-08df1d90a221
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:45:14.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZ2Tl5BOzfHkObJpzUSygn/JsuVBTsc5jVt2L9fdqAO90LeoPnQ7AoEo9QDJ3oz3PBprPC7NLj4DNVUaVbuJeFpoDKcK6K/6umFt5+4kuUzo23okFpHMACvcchSFKDIX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

From: Frank.Li@nxp.com

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-7.4

for you to fetch changes up to 8392af7be78d0cdc5f1ec6c9a53d424b32642403:

  ARM: imx6q: remove KSZ9021 PHY fixup (2026-09-02 15:48:38 -0400)

----------------------------------------------------------------
i.MX SoC Changes for v7.4

- Fix a suspend/resume crash with Clang CFI on imx.
- Remove the obsolete KSZ9021 PHY fixup for imx6q.
- Replace the deprecated __ASSEMBLY__ macro with the standard __ASSEMBLER__
  in imx headers.

----------------------------------------------------------------
Heiner Kallweit (1):
      ARM: imx6q: remove KSZ9021 PHY fixup

Thomas Huth (2):
      ARM: imx: Replace __ASSEMBLY__ with __ASSEMBLER__
      soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in header file

Yo'av Moshe (1):
      ARM: imx: Fix suspend/resume crash with Clang CFI

 arch/arm/include/asm/linkage.h   | 29 +++++++++++++++++++++++++++++
 arch/arm/mach-imx/hardware.h     |  2 +-
 arch/arm/mach-imx/mach-imx6q.c   | 30 ------------------------------
 arch/arm/mach-imx/mxc.h          |  2 +-
 arch/arm/mach-imx/pm-imx6.c      | 26 +++++++++++++++++++++++---
 arch/arm/mach-imx/suspend-imx6.S |  6 ++++--
 include/linux/micrel_phy.h       |  5 -----
 include/soc/imx/cpu.h            |  2 +-
 8 files changed, 59 insertions(+), 43 deletions(-)

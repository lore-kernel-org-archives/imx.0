Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1CD3C4176
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627795; cv=fail; b=P9+vXFEvRcd+Rc3eI9VlVIF2RHxPZjx0WJTiVi7KDjYvOvp5+qb0IOaLxqNCeNGjUWgQk+kQ5IIpsD0eIzqLSSx/8SKfqMsPtJbadIDuvs1J0B6IUvYl3xmt3JTfCZPgQewOLWxnSxvKjrzvnLOdHgCKDUaO6gHmsqznd1Oma0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627795; c=relaxed/simple;
	bh=1hAhXwXjuQ0W+sZqCdgwho6KXJFdLOr1RZse3QTuFNc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Nw2h5gRVmdYwVVFBoUg/4Wk1uQT9vRGa87i0bX+KRz2Yy0LODPZ8RN0KMrznEd/Cywehk1Mgio+IKocD1kPeHm/zeUuV97e404OSiecUHSumTmyBmF+DwDTUk1pyl8iYKdqzOMFtq8IxH5SCXJXf6Ku1CLUyWqrjupf6C1UnOBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VsMxXTyl; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VsMxXTyl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srFozcMyS6QpCaLZxJi0SHyr6LP7BRZToLg0g4Xn322IufXjq9cbrmmBGRrZ+6uuyQLGaim6j6czycDsN4+2MEtRFYTFr2y/fYAis0A6sQtAFLf42wdaF55GZ1M5npY4F2jp2FIM/UqsDKqa8jlvMQNnzcGi1ixKkz3g0bvnOI1luqAwLEtybykC+/AUZBH2gPUXSKkH75neKs4EswG6W5aOyQYI3UnrGMG+80I2vWU6TvkRfIdIj9JqigZV6kGarUBCqTC3Nwqb3KbEMeNsWUI71jI8j/+U1xFBNhYMsp+npVKB3LKD4noFm+hpXSdaBbcDIR84vQhqL/2QFgTc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcsrPzWiTj9ljHfl+57UgZZKIchi5mYKfwrwHGWv/Lw=;
 b=MwXNo0g2OnatcQ7iQ3htslTDrt0Xp9r+xvngc/tU9xiX3uEION+duQX+4S3gyI9ALS4e61KNGfUYb6Xq660ALp72WTtZ2N5FspSWeCbAj17QfOzYnJRxQshHg+Asx2+A9mkv3yLWaaxRKdKPYnB3aidG6MVAIbVsHLGOCkjBR5UQlndJSKhAl5tYl68E1a06TcXh8Wp6x9zQPId841bcGeI75wxcyI4i38vFW4quuvdF1i4aSFObx3XbSkWucqxBUeO2Pe2SMJdE51gQO1RCozchgWWW4bTxVvC7yNdPE553VR/APTpGTSEXva+ln8VUFnbrLQoSx+3+angQdKoYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcsrPzWiTj9ljHfl+57UgZZKIchi5mYKfwrwHGWv/Lw=;
 b=VsMxXTyl7HxVi/u2w+Ni2RYZ91iDCnziP0sG80GnKdTuGCQpQGrLlmcNKmTEN1Vt8S+ylyjVJt6qF0FTilMzEOqMWEPeaaQeUohceHpoNlYBKzEx3nqmOel+Wq5mRrY/RgSZpiy3akkhzl7kJKyoqseCBnzYwD7xRmPs2eUGltnuS8n4KEM3OWywwE13txFlJaIEOuBSRdqNV/OCQc06UFGhdSJB83NGmlFHNglrlKu20c16AoPB2vQBa5R7RuMEeTP0KQzv9NX0P+ahZ+BktFi1aHKdAZ1rwT5RHzRvJ/aZgA9mayjdocc/6IbY9I6UBf1KVfUE96EiMwgMWL6Brg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by PAWPR04MB11611.eurprd04.prod.outlook.com (2603:10a6:102:50a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 09:56:30 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 09:56:30 +0000
From: robby.cai@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 0/2] regulator: fp9931: fix voltage mapping and runtime PM issues
Date: Tue, 21 Jul 2026 17:59:57 +0800
Message-Id: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|PAWPR04MB11611:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa6a084-498e-4e93-031c-08dee70e56c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jMYK1CE39T19Lz51xFQQZ9emU34eSqB30N3mM9m/809dn8MWYouA9TawSEWQLLWmYapA75qx09C0U0Q4CWU86hFwM6yhuh8UNTJ2oemWD+tKKUOgVPBJSafcHZZsXI+Pnr3m48ljCEmxd6pyXsfQ+JnJIBYt7TbS7hqkKAcfJ/ijKAmopznnQdMj1efXHiM/D6Q3wcbCh9/elFLT5X1ms0Gqlmpdvwe5xaS8AGJ/KNYL0Ymj+Ezgi67wZECe5aObgEIV/DkQF8hATPdGsY71QyPP5yvQtuhCXKKM2GcTgSzhclObhZsQhIVa3sUp42L4uUopfYI3xWp+ZL3z7mYm4r5PeEm4c2Cyr0l0OKU69eexKfaOeElknkz1IniHMxj2xvAAWTA73DVEFXq0VwqqEA8eTBoHgqWfbS3fU2z5NOU4mce/vzL0tS13NhLxPPFipTLt0To+rG3R84NiKqYC6CvWxhlGq9lEZ6dskvxqzYnOfazZCLahjiotnT0OkFRLYaEspY9z/OnZko1TyHKXEX0UOMANWh98SBS1AYlcX+loo92UGGLFT5X/er4gsHvSwKX/lfaYcNQd10nN21cJYyOGyOaN2jHfYK0kBpPb2ocWdJj5vIhVvzYRq/Bg4E/Z3W2x1Xr1IfMEnBHXtyJV9CfZEnULxBdAl9G/gwKbdII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sQv0fR9XFGSc2bRaLJEGAuTnPg+ViSdu2pBHhJ8qQWtcGtJH8igTSUQfWG07?=
 =?us-ascii?Q?QDvgOF6O148vY/Dq2qnzkDwxf655vChuMLSRzWdrrZl0Fk1Itao89p0N6n21?=
 =?us-ascii?Q?vaYZTbQQC8uqywMFjbj78DoFrBnaOZP6eBxU6DDqTVwyfVH509lt4abs1ohY?=
 =?us-ascii?Q?xlJT71GKv38Y3PTFLchC8ceZijwR0Bf3E7Em+qP7VZz5MvrkgaYx1hIudij9?=
 =?us-ascii?Q?mb9DdxyylaDTjWEOWxVJyuaaod8HXYcTFs0K1/1K1mDoxOvGq/BrHzxSaWSr?=
 =?us-ascii?Q?0ovmNoVOX/w7W7pff9MbFf1h2o4/K5hR9cTRxGvZOkycwGRbfLrCJyHblQm3?=
 =?us-ascii?Q?i9g2e2M5wNMw1wwd+8gx+Yh9nePqgnwq8uDQmvOabyDqwrsCaHWrQskmGr2k?=
 =?us-ascii?Q?LRU48Pk5hgGFJVbLlV1W8ATJ/WLlhi6f4kBUPui2dY19VRIjGNrxc7JqxTMb?=
 =?us-ascii?Q?Y/rjzJhPmNGS9pIfif6rnLU4ZjnlyRZJIXibpMsteerFEC/oTvur/+ycWhkM?=
 =?us-ascii?Q?9NxrRP0GjgWMPpC6cv9QKZ/usYxDIgqWv8g1liojuaOM63BFnqCjF+3jbNrl?=
 =?us-ascii?Q?iQavkCb1WmcDCzb11Xcvtmm/CtZJ+6QbYJqGTK/q43bww6xfcg57YLalcxJo?=
 =?us-ascii?Q?jb1YsXJC9RM6Blz9uVDuMoDlxcReEUV0fsjJFa7NvAO1bNbwTHG842TxNRUk?=
 =?us-ascii?Q?7WUusVFFSb4hEOl2uzLewHi0FRINYU1I7hKQeA0kNcojsWjYc4aaR0fxljs8?=
 =?us-ascii?Q?TJv+lA1UDsmmHSWdKs/ePfUqEC+njKXBOMMiiPryIzR1ZhM96Zu6N1wFTbNE?=
 =?us-ascii?Q?Xrlmf2CGK/1cSvEgeW1Ffl/uiurToocz2SGgOwnY4XAZXC4pUTMIF/A+vdC0?=
 =?us-ascii?Q?Pai02rSB+u91fnQU3cRQurFGFTWpy8fG0giLBmUxGWpGuhDWSkBmn9dWhvGj?=
 =?us-ascii?Q?S10ZTpqLHqIj22LOYL4MmsBU7mmjpNjHccNtfh8RVKSJxFBDe53EQOMzpVLo?=
 =?us-ascii?Q?swH4fE+gaBYOp+DR1Iy+xxqc89jvho+iUTvlAV82gLInBuNoIXo5ggpc8WL+?=
 =?us-ascii?Q?PjCl3A5IQAViMq9xDgBc9KbbBRabcLCHwuWzowsCoXE2zF6HY74re+59UGHO?=
 =?us-ascii?Q?PfL/GuRjEHFeghR0UWQOY8FJ5b4mluKI7cNVztkyGd7jLlyYobC4jKxO7F5m?=
 =?us-ascii?Q?ooJqRv2GXoUxXHsWOzHJ8BM5L0AjQMckQlj9bgpyrYLoc4S8Uh4b2gMyjhtG?=
 =?us-ascii?Q?jhpZE98K3kHa2tCPY0QnLedcb3YESFbi1qnzqZN9bLdSPU4AzWEvnTKN5Y0h?=
 =?us-ascii?Q?p5+GXJUR9iE+oluRNJFOzkNFiKqmoYud8fCn0EJnd+93qME+vzVD9A92mdGt?=
 =?us-ascii?Q?Sn9Sy20hkmX42djA5aQVPnP0NqV7w4MZO+awpxU6n4Op37Y8yL15Q5EJaMah?=
 =?us-ascii?Q?xSJVtJe7i7NDoSG5AgcqQsBPU1u1ujLQSBt4fMx0uVHcbEMtRPalKiPdqQ0k?=
 =?us-ascii?Q?CkaHhbeupMUs/xSovg/Ye16mPGLYzQytJDF05IdF/Jvysrr3gDvRKbjujm3j?=
 =?us-ascii?Q?X6azU7aqSt1xR3hEz+7q6xPu/1hTbNZWJnnS2I4VVODb0VzYJjd3D+ydUEPI?=
 =?us-ascii?Q?6G5Yy9hpFTJ/SHle4cx8+y67gcDa904sRp+z6DHWvF7TpWVrCJK8pckSSjZL?=
 =?us-ascii?Q?QRO9GF0fl3ghBk4hLKC4PzU3damelBy4JJg9vYTZGJ8HvpxBw9GrHQUAk0XE?=
 =?us-ascii?Q?HbUoayGLQVR8gbiNPSUCFXJZ0Ramzo55W7IHjOsJiEnHsLiVFNfv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa6a084-498e-4e93-031c-08dee70e56c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:56:30.6216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYhykBTr9T//FAXC3p7mbMLGQt38+RsjhvQH9Y202i6adn/VjlOAn8bvMyUhu83pk4+dyPilaFxI+EjgPtD9GLV3i6ET0wdPZ/FEYE+JlT8t4HcWnS63StVMdDfMGRNv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11611

From: Robby Cai <robby.cai@nxp.com>

Hi,

This series fixes two issues in the FP9931/JD9930 regulator driver.

Patch 1 fixes an off-by-one error in the VPOS/VNEG voltage selector
table and aligns it with the datasheet-defined voltage mapping [1].

Patch 2 fixes a Runtime PM reference counting bug in the V3P3 regulator
callbacks that can lead to "Runtime PM usage count underflow!" warnings.

Thanks,
Robby

[1] https://www.fitipower.com/dl/file/flXa6hIchVeu0W3K (Datasheet, p.13)


Robby Cai (2):
  regulator: fp9931: Fix VPOS/VNEG voltage selector table
  regulator: fp9931: Fix Runtime PM usage count underflow in v3p3 ops

 drivers/regulator/fp9931.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.50.1


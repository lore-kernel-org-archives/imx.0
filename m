Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C84C82
	for <imx@lists.linux.dev>; Fri,  7 Oct 2022 19:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhMtT7bjFCKxe29C3iy0nNjlgvq7gfMXZTas+mP8C1l8LpYV4uVK4KalfVgf+gEFUzRq6RwOnty41HHrxZNRbnYgpc2v/yvXQ613KvD5AGaYf2TzI/h0xsEyZsKXN3qZmJQ0eXTbMtkpVKCpGKrecwt//R+IITi2IefrsjeyICZT+tqtHsBz+nyB41gQqwv+/kTWpKSLzFC37N7nlK0HNiOqLMfBtH3ONXBTPtk6V+EJ18uhfTd08WvzLp03K2KCY/2lPEwLj124VvY8lriPLPsSWk/0lgdyjM8cPgs8RoRLpT3T2asFu1Xia0BWbOOQnKwFTwuK6OfwRYM2lqQRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcEdoYn0/F3mZipHwnA08VCM0AbGpPuQQLusjnnBnPM=;
 b=I3i/Qlow2TUs2sg6McSbEwx5BXu5N3qiVgzKyHAdaS+qy7PwE9/egFboYevT33YoUI+2NI/vJrMrbL91j4RbAm2zsPFKcl9U+uWPyxYsr2SbN30j6P0nWdRaH5RQZRW8H2mw+hBD1up4JIf8TSBQtXddf+9qsLVcBbpVDaPLfJ8U8NKwJ6ogsJVMhmP8pmUWZJy9iRH5TYN2kqyn64dTZcTn2WfWdlzZdZXXs5a1dtx90bUXfO1s+//klOSTTnimaaDZQR+QeBJZszODZv7rCEeH4RanNTjZlcaVVhZHIaoZb2wbOaf20iMy+ruEi9vquAOpGe1JEeb+G63Se3pJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcEdoYn0/F3mZipHwnA08VCM0AbGpPuQQLusjnnBnPM=;
 b=I607nVRtPguRDa3dqMAcNEMj6hxBsZoyuZrrA0GtjZQUd1ndBd8eEN6e4fJ0qFAFTjjJhjANH1B0oX+Xi9RkaIqd3qy6j4AhkIdi5uQQHBBJqm1hwrEpz0tDyj3P5W042dCVG5bW5SftO7BHDNMCErBDLEhDsJLYuOL9wKfdtlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8793.eurprd04.prod.outlook.com (2603:10a6:20b:408::22)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 19:14:02 +0000
Received: from AM9PR04MB8793.eurprd04.prod.outlook.com
 ([fe80::54da:4ebc:2916:de90]) by AM9PR04MB8793.eurprd04.prod.outlook.com
 ([fe80::54da:4ebc:2916:de90%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 19:14:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: imx@lists.linux.dev
Subject: [PATCH v13 0/6] pci-epf-vntb clean up
Date: Fri,  7 Oct 2022 15:13:20 -0400
Message-Id: <20221007191326.193079-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007191326.193079-1-Frank.Li@nxp.com>
References: <20221007191326.193079-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To AM9PR04MB8793.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8793:EE_|PAXPR04MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecb3cbb-d4f4-4fbe-721f-08daa8981838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEScrFJHqXz+uwN8VuWthwb0tq0kPgkyVImNgwAU5pUfIxIJCQepUTY+/osEOFfvWJAzW8QLl9RpPf5ID1u6ImH9jrFtRYBOzJaRdfSa0UJhMC2By7Zfe0e4xxcSre5T5GaXCfD0Hcu7vRgSqrITRHb8XMsr+/PeUSDlJ+BVed0e4MXwuZXn7Az+dZIoUS3Bd9oGFjLZAM0JOnUvm3xQJK3NsQzYhDfd0uD/OQPFXtdGJxZbMBRVcms0k/bgqJQWnEmsDFxYphjK0S1HhGq/ykGxrayoSzMXyx6J+SQdw09gGUtAMlEb0s84jC2Pv7KShXZs5+B8NY14t3yiYiIZMYeE9/zyQnQIwS14MYybLt2AGX8f4P5oo3sSM1hJYPw7GZaT2A8iO9IK11LPxaypx3CIAQaEdU43yaAmmeAwyZhIatfhEoqwK+wrOAASndBfG0ajr92K1nvUJiYAcaSvyeuM7AbgjGURiN2ulQwXaGZ5Pq1aY0z4RWMnLxkqKWpwfxSex3sQwEfmIFwQ9nfKZMSQyh363Zp7z9Y5Qw9K0/YyGg4HCdV2MOsILNkvFqw/f4HmcsTOUOJBw4MdgS8p+wvyGPUF91y7p1/2XL5ktA3ACrTAqEfAGJhisz2IPQ7mr5/D3w+O00vOJOcHxvp3lYZoEScLTGYrMlU0DmDIZb3TTQYtiWnIDDgwFMiGQnd2EFF8NgNTt5FkD+h0nvBA6qDUB2cSltxY2DSU9wgoBbXeKwvRZkp3TCJDeQL2jUr+LmUHq/FhnzFr/5di6TSYYB8mQ18vaKEcc9CB9dIsT3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8793.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(66946007)(36756003)(6666004)(38350700002)(8676002)(38100700002)(2906002)(1076003)(41300700001)(66476007)(186003)(66556008)(83380400001)(6512007)(8936002)(2616005)(52116002)(26005)(4744005)(86362001)(5660300002)(6506007)(6486002)(478600001)(6916009)(966005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?byujdh0IK7dwSuOa9nBhDvPnK6pCJ3vJ7J2OeXBDezQEakOpXaSfI1+MO1an?=
 =?us-ascii?Q?Iv2O7z+I+rnln9MmR40hX4BE4YBSzehQhk9P/pSJL/rSZGhbVoSi9L07XUPI?=
 =?us-ascii?Q?LeP0JIImgnhJ3EFmB8QDYHEla7PRVgsd6jK2KjlqdfMpesnwF58N5jSMXKBx?=
 =?us-ascii?Q?OiG5A+G1n2ZQP7FQHiqVCykAfLa2v1xqht0alH3EaGt8Er3qXmbLE84tbHvn?=
 =?us-ascii?Q?KpapK8QaRLfSGyt/Ime0CxGlIuWmih8Y3Vdefu6Ab6uS+NhgwIIsDaAUgpcd?=
 =?us-ascii?Q?Zv7su1LPmxAA8THkVt0dqTGc8biaIsnrrlxrBJYfUAGICvg6kpzcaYxnNecZ?=
 =?us-ascii?Q?PK9DZ38eWm94NNRvb0wrQuLcicXCYeHpffJLyhEvxwpjDErS3/kVl9YFWsUH?=
 =?us-ascii?Q?mlC+NQ2gXmxB/Ac/NisCtINNz7IJxGRHVM27fG4hnEeX+CoR3HoOc2bn8I/N?=
 =?us-ascii?Q?wg2n3AgOM6hDIBrE0tFyG5PGbwY+AA7pTiiEPLemeIYBxFKSENVH/R9/zdP1?=
 =?us-ascii?Q?lfFRvhbgBw51FOd04M/MnatdZVTmwZgwSphmVSyp4NFIUUdI8xqwIItCCLrg?=
 =?us-ascii?Q?vSyB/cQhtClO/A/U/aEmyxK3DXdt0I7KNyTn+Ydkz7+mfKn3itFEgY1BLvQ2?=
 =?us-ascii?Q?TdqgcjU0BQb5azHEwoIrd6yDzB5+3qPgVulRnjADh9pPqB+f11j25D+iKLo9?=
 =?us-ascii?Q?IhAsnvPYQzZyfy4CAXfo5bqPOLSJCA6YHabm8DGdua5g5NgHKRCumtyl5ZzP?=
 =?us-ascii?Q?1yJ13kErm8soK3dfXTvefw8kiiRzMuIgvV1XXjWY6zzYl4/g8FWPfdpaWEyp?=
 =?us-ascii?Q?XxdTSM21ApNjiGvHt8Du2PJD4Vv4/RGZtRwA5oDcVW/jIPSFOT/H7Uf7FLXO?=
 =?us-ascii?Q?rAMJM/hgSDApnAwhirp3inDlneWXiKmFyMSKdkZlZbcAXrZFXRpmXZhAgIYz?=
 =?us-ascii?Q?Cm5YgxjuS567akDBBtQKiAQVj0z4/HDqKdLgOxHS4HQoHHg38J+HsCU4Ehnm?=
 =?us-ascii?Q?9IRlsUErQY+GEQLu6C3sq4LGdwEIC1bNv4WYahg7DRqWvLA+BpOqj+VmUKGd?=
 =?us-ascii?Q?d+bqgurVvh5PI3lQD3dj+XPtmYvGEjJ+8olgPr+6Io29dsRDeboVpqcbgFcv?=
 =?us-ascii?Q?GNf1BPxycZcTkT/LUn+oywM0nSuJ5x3+uKHWViC/SvpEr21XT1G1NTG0bc0W?=
 =?us-ascii?Q?AUQNgz26bOotWrvH7E7hxp7IzRID5ATi0vb/3Jj955Fhbof+INqhgRNHThg/?=
 =?us-ascii?Q?DQxEf3XVIvyTsGmNQW/R7vtimLhJBS20p+lQUguJBfPH9Oqig+fs2hHrEZuF?=
 =?us-ascii?Q?YO3UOnmgHTIuyjeUsRm8KCy+AToXjdzkc9onvVRLHqhZbPMPu/4d0e0ROOqM?=
 =?us-ascii?Q?ln1jHroOLkhqE1xb5RZaifqupRLzl7V5oINouAkN1D+4NVUP+8n1B0cQn2jc?=
 =?us-ascii?Q?Xwgy/1QPdX6A4scUhKRHhQMU0acwxEqvS/aDcZBdYCmTm7Hg1u/MreNJPk3c?=
 =?us-ascii?Q?q673i0vWTBl75s4OKbut883k0foTmfqmxEKPSzy7hMrDBxSP/9VD/ydM5LAq?=
 =?us-ascii?Q?oVXMd0qhkikNEAMBs8ZHCLlviavE9t3dOm5JhPb3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecb3cbb-d4f4-4fbe-721f-08daa8981838
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 19:14:02.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SmR+Nh1slRztIgeczYUitxmmHUlOeIFtZiAbGwpk/qDxY5f3pNaPM2ZEN+tt7JWxNY5xukaxkf91WcfVS/9vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192

From: Frank Li <frank.li@nxp.com>

continue patch series https://www.spinics.net/lists/linux-pci/msg130372.html
https://www.spinics.net/lists/linux-pci/msg130924.html

Lorenzo suggest create new series. Version number continue from old one


Frank Li (6):
  PCI: endpoint: pci-epf-vntb: Clean up kernel_doc warning
  PCI: endpoint: pci-epf-vntb: Fix indentation of the struct
    epf_ntb_ctrl
  PCI: endpoint: pci-epf-vntb: fix call pci_epc_mem_free_addr at err
    path
  PCI: endpoint: pci-epf-vntb: remove unused field epf_db_phy
  PCI: endpoint: pci-epf-vntb: replace hardcode 4 with sizeof(u32)
  PCI: endpoint: pci-epf-vntb: fix sparse build warning

 drivers/pci/endpoint/functions/pci-epf-vntb.c | 157 ++++++++++--------
 1 file changed, 90 insertions(+), 67 deletions(-)

-- 
2.34.1


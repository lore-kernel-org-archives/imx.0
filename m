Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EFEC8F0
	for <imx@lists.linux.dev>; Sat, 11 Oct 2025 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760183451; cv=fail; b=rdYK/pBrXk9VZq5RR3S4YK6R6LQH42SwgtSwHy6Buni8RGmMiOdh0vX0FBjB6/c1Yb585dF6Sh7WCuweXU+rDG0eeiQ8iYfmLNofQN20crRACKcqAfOczF396us9NOK5JpkhE0r94cwO55JMBL3O3gLN0HkQ5ddWXFSHmHCydkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760183451; c=relaxed/simple;
	bh=TwyfIMXB+/pmfYau7I4a+TrvHG9WFtZbD0rubsRMD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a1fMU3n2gDxRUGb7LQX67z9GuK4Vvv7ydGdum+70p5o5nBnJHEP3brzLzqQuzEV44HOUM8Vl0ix3fG6XAfx4889zUt2M6CdcKCClO0YsXt6fl55RTzSk1aw+hTIUfxU5PUlXbvVYNDmz389b4pae8olcy/EnBZMZo2aYmOoyqkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pp96AnWV; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pp96AnWV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8C5acJ3R321vd3Kgd/0juboFwAWdKEPnpIf+a2KyZ9mVUONmymTxlu/pVpZALFlHDW9dVLoKrT9myvntFg8kwrM3zvNxHz2ba+Rz7qYRmNGHmDvtjwGScqX7niv8Xk5oxCY1k0/wPj6J5gSQgHI/DA/UZQ0YVsktyybLf7RPzbiCQpTLkCFtnXFfHD7blD6/E+KAxAH4IO/1BHuJGsRziQfaE8UQbIXhxHFpzCPqlEyLKbWGPmYTCrLxRsADkwsgNLLk7pb29WLdtFVzNzoWusi4reEmiN4CWWOPnGLiZwOUEMODtdQiWhean55vAqMEMXjo3bfjdIqpVM/dycEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwyfIMXB+/pmfYau7I4a+TrvHG9WFtZbD0rubsRMD0U=;
 b=yNHE9bRl15mLLnCLhkQUiVLxYFkBnv3cc1NBztClYFGJ6PFkanAVk79HwYSlyydUi1lfavQ4Lj4nNlJL87PL7UqiNvlSzKBRDGTFXvGXa/8ksLs5DPr9nZjdRpEx0zUQe8fo2w4RVmyp32s6N89AaPXBlVBxJpHzeKZWwT+jPD5ccwBjk8uL6b/BL8EtEkIoMtt2kUMxWOqIL+M5Bctz87mt/PtH+vMso4lF72xWZva7wtOGS55Fr/5Jq5GghjYA+zQL+taTlEM2ZZAF1ziK1kPyR+NtUkSoSz4uhCLUjv20jW+x/zUtwlvfO1DNSuQtUcxADNpkg/rn9ZIq0y0OPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwyfIMXB+/pmfYau7I4a+TrvHG9WFtZbD0rubsRMD0U=;
 b=Pp96AnWVqywjQAevbFR0mtkeEKgbzp7+phWpVW4BbeXaimHZkQcI3JEzi7EY5CP6vJTzOYS56DmA3bUIWSoyyHgftvqPIqh5PIQPP9oYReQc39R7SomW3FTWZUBKrj/+ql6BuA+cg8fYvkaSAL9cElM1zKla/6dZ8O0K5ZCpGlV+9aSUYGmyg8xmZ/75TJzHFtQCsg5eF/unzwLcyoplFsbUpnk97LUWXG1fe8aQB6EDHhIKRJ7TB1MU39c2T3+aNPpb0OhGTLtFfakwfm0hfiDDcB+G7023MFpL2KNz0Wi/H1c4G7s3phxY7F9paY/UlpiGMjQTD6EDAcengG0TQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AS1PR04MB9629.eurprd04.prod.outlook.com (2603:10a6:20b:474::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 11:50:41 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 11:50:41 +0000
Date: Sat, 11 Oct 2025 21:02:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] dts: arm64: freescale: Update USB oc settings for
 PHYTEC i.MX8MM boards
Message-ID: <20251011130214.GA20642@nxa18884-linux.ap.freescale.net>
References: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AS1PR04MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e6e433-ece5-46ac-3560-08de08bc66aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?NIUGrRfhoUutWZtrIZWl9t5C5lPd+/9JF66jEIavZuSho7Deh7EhFciY/qUW?=
 =?us-ascii?Q?djGKuFX9cRzWiMSab9e7l2C/DnYtUGAcgJ3aIxC61fsOc+SR5M7pMryfTbqb?=
 =?us-ascii?Q?ix6ZilRdXZOoNvC5Nv1HxT1uV/VOo1oSC6yEnYqVRoSxOsWEH3bC6gsBn0wn?=
 =?us-ascii?Q?WvZjL7H9mUqQzEKcQNwHBSoSAP5SDCJmg+BFbMk8mIsfgRtelQ4AbXU6NTBN?=
 =?us-ascii?Q?3xq2GsGIRIzfgUtOw5I8VZcwLKbx7/6tl6fHuXwuBcyFpYDersX3wo/bEVTX?=
 =?us-ascii?Q?qRKJx7hsAjl3Vg6MGsldbirkJTIcgge8hx5brAPz+H9hscZD4cVegwParo8z?=
 =?us-ascii?Q?CI/CK7yiSAPXoXvrnrddqVHZjkFrxSE4m9ZWGoidPavCVf3zNhnD3z0zg99n?=
 =?us-ascii?Q?ktzjDEPK9Fv18KHnsNRyP2/1kKmyz9KMuKaDG1nyLlzQHA+2/kb0ckm/21To?=
 =?us-ascii?Q?DnKlWSVvlI6XpQq2dbRfrEsjPi1+a8yKMZqkD6CrrSzpj2iB5TI68PNq9PWA?=
 =?us-ascii?Q?OfF+oQB/RSd2dU+d0zOywt67VCEyI1vwX4VLLUoJJKJGCbd+TJ/oeS7fZwEm?=
 =?us-ascii?Q?qVCFB9WNO2yFzPKTQPFBs8mhaaEzyG3c9p2I3KR9wcuMC8TtBs5Hry6+V5T+?=
 =?us-ascii?Q?BOXxyhm6jr2mNTdPJWnMVBPr3IXFaxg5A5gVLTXtN0kLxJm6z3OqN4LQ6mP3?=
 =?us-ascii?Q?yuQB9Iayk9Wq2QVHl/ZIUmGTbg7HFUu7B+eXpfndebcUxSZfLHhJ1iOcI0Z5?=
 =?us-ascii?Q?+BvMJoFd8w4T1f9VP/YHk8j0RfsskPjbsUTMRaL88W8a+4VyTmfIZByMmQcS?=
 =?us-ascii?Q?xH8osoBfqZnhT7GXEILt5B+5L+j71Z/+Rvj2teARV1wgPWkRNISxaB6gYZtx?=
 =?us-ascii?Q?Y13SPqywyuE67ls2ubiIO5x9KsoeigGTuhIMCnvW2ezLT3NJlzUxRdc0+49l?=
 =?us-ascii?Q?E0vhGEjzF8nePxXRjpxCGlJydIkjNDTPXlgiyDJALdAGbBXD9jhwEScpPZS0?=
 =?us-ascii?Q?tUiZ8LureJkBNMb5HaBJGIPtMHWKwKP5blHGgIzD5nXQKFnUsypw6N9vGWGJ?=
 =?us-ascii?Q?ssPM82OeuOKC6vNXQ+ZUgANisI0Mk459VoWR5ZDsm9VGmoSUmLS35BPIH+KT?=
 =?us-ascii?Q?gqkHO5Ni00bARFlKgyIOgvZ8RT4oFh1z/DVOm8Y/zxolL8Q3yc9A8CyZdabE?=
 =?us-ascii?Q?BPEtDgRN47gs40xQqa9ugIfKcsl44cp6Iosa+Rx/83bMyMG0l3qtdgZpZ/WI?=
 =?us-ascii?Q?UGYdx/zYNVpGE90z5EKI9F6JkQSbyyibMLc0mVqutx703Y+OxhJoZ8cYRyIP?=
 =?us-ascii?Q?QAZluWyY7qsxRIEwhAKaztFx3CiadrZb1fbVxNQUsJoT2ukuqPX2g/JCnuJf?=
 =?us-ascii?Q?FgYGe9uXWCnb0wGJn/gZQCyXRyJOvs8IreGg8VE/tNtj6WZ0S7qsBb0X5pD9?=
 =?us-ascii?Q?IfXqXmjNds4Tk9Hg3SnEaPE0eiySCXVm9t60DtdUV0/KuP/TIUNtX4YLa4iW?=
 =?us-ascii?Q?1CqQDK4qh4R5ek8vLsMe0ELXnTRWZavFmwjJ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Cjrn5AsLix3JSQLHFx3OB9fGMqRlX/NsqtId/SpHeBjUqo5Ba1C5UnyIe6r/?=
 =?us-ascii?Q?ujFpT0Cbf8gl/4Zsq9H10injOjxNA7FFYZzC7BaoSHYCC96gA6FCuPypiCYS?=
 =?us-ascii?Q?tR6AijXLfm/vkClIk2JG7suYBXVOlIVF5HUv8blcPxP471mu5J/yDNtU+bDg?=
 =?us-ascii?Q?bTmFNNvyvX6Z/VXretRCOrrVIAR1tit/cewNk93XlruvPZw7geXle4J9GM7d?=
 =?us-ascii?Q?VjOLdu3r3KzmQpEpzgEq1N5//5O67ZCxMlM2dPvGeEc51blblc6LmSXRsH4j?=
 =?us-ascii?Q?KmTV1FoiNy+s0X+5EgH6SGqFpaaLoAoP+sD/LT4gYBc2ia67vK8JFXjV7LuH?=
 =?us-ascii?Q?uZuYjAg7HP1VmTumOPWJM/RtOJcz/hanHidXXxoiCHTuRX/f/RYzi9rpbQSJ?=
 =?us-ascii?Q?usP+TbwC1lwR9jOHuhHWFSRSJ6B08i78FKojnZDOblPs/Hre4Vgox4Yy7nLz?=
 =?us-ascii?Q?vHwRZbzfrwx3Xwgn31xBY9KiqaqkOdTJ9iiN5ZzAjp83u779f8RFvrVzCaPn?=
 =?us-ascii?Q?SsbR9anWtHmXJPL8PX4oBTn9T32OGQeWb5Co+XIB+I38TuDVyNY4egErGiou?=
 =?us-ascii?Q?4DQBiD9eSPTwSWf1a6TWp+qjg00WVP/ZNuXiucOWXdDpT8Na4tfrzHt732oS?=
 =?us-ascii?Q?IuP0jJmwotxAoVBRzfG8E3bvzj2b+SshA1GyKB4n/NRhVzgWfitMJH/lmyPz?=
 =?us-ascii?Q?Yz1qx85xLMYfORqzZDxUqX96KGzLER2TASsY2tlcAjw8Wk5PMEhwa2Q/99zq?=
 =?us-ascii?Q?91uC5/+JqpUOp4HXNPPZT1GmB19Dgv9S7zKIcT0NUW30Bg2rhAkWxH65qXel?=
 =?us-ascii?Q?qlFywDTL8XlncyXIlaMf1/3NW7gO9CR5OIwFzhAoDJ1SEkQiv7OMZejt8JGy?=
 =?us-ascii?Q?9uFXa8pp9HJhCj2UPt7d0dDtPYYe1NAJ5RZWjJ5AaNPsyqCPMSE/NWKIgJ6K?=
 =?us-ascii?Q?hOSVS2bpPrEygkIiHrCp8iiA3DPEaF4O5M4aCaSW8/LQjubqioMqFYmM5228?=
 =?us-ascii?Q?gmTfZexOAhjIP8d9S0K7f2rU/8sonr+1sqpgJrAzYxscBKmiw6fXmplXay3w?=
 =?us-ascii?Q?ugYxJiDKkBVver6a4KdU5QqDE/LMSD/buVyeFK9qHpw7E8yXIdqAnUyJxJUt?=
 =?us-ascii?Q?BmoJU2VzTg511i6KdY4oSRN0Kejgc13BH67N1llwWPLzzDxa+QYfkwj2Udlc?=
 =?us-ascii?Q?mliOxAtRoxw/KkFWTjZUhnFIlPyOgrSx1V2C5iW++hy8XWAnbzXBHphSSNjK?=
 =?us-ascii?Q?DqpdqkmNGC6EzbEFWwRc2dtCa7rbAyMf8oyWzy1RZIpvY33ORZCIwpvYfNfa?=
 =?us-ascii?Q?F/D2ut7yOSIq2vbIWkkW4nIEoG3i6HRzCU5qXZNYt7GaDCJ6XtvaXw7Iy4ig?=
 =?us-ascii?Q?itBD5KiF9f7R1cKOI3ei23o9ST99xHnK2NN9If8JVBVk7EWeVrE+Bl+hkHE9?=
 =?us-ascii?Q?3oHHpz+PNkjmbCPf5jJiqNyHQogdTM35bqV06eY/Y1PmZ1ShEAhZZfr4WMXt?=
 =?us-ascii?Q?jgp3x5yyHVBzt4O59xefq3cJdBDFwyXq/GoojnC9jWEkBpG40Ne9rvFu9mVj?=
 =?us-ascii?Q?0u4E3Y1KHbZfWCfuBCwugHnfaOsElDEpfCZKSgF2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e6e433-ece5-46ac-3560-08de08bc66aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 11:50:41.0855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZYxdOEj5B/IbGVVNVaTYRl+pzR4hd1Aei9iqZEpAAghFVGY0G0MP8CVVWXs/U6xgUivhtpV0C+lsey9S1CUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9629

On Wed, Oct 01, 2025 at 02:43:26PM +0200, Teresa Remmet wrote:
>Update USB over-current settings for phyBOARD-Polis and phyGATE-Tauri-L.
>
>Signed-off-by: Teresa Remmet <t.remmet@phytec.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

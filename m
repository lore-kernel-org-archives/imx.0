Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBE31196A
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579663; cv=fail; b=RWpA1SN/HAz67wgneE9k4oKrkp0ATHIVYXQsSS7ZfjLP+gMkIaczxJORZjFCTZwx9ISmfSGLPuI0zxF8EIBqjQbonolTLq/GTUfocsPHpyu+lQyAGCGbqOeg8s8I4qZhkzLhFtX7xn3YYk5pwqNDs57nlJZ2Y/hKu8m9cbqm4CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579663; c=relaxed/simple;
	bh=2Z5d4eKTbWEJeUw+KGFxCIZtdGUysYWFX1v4kOiwPms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uJSf/fxaZIU+/UvvEaMb5/ZkZWt1wCyy6AoZf/ELvilRkmq1RMoVoPcfCoesXCuFyIBt24xWa37xiFU4Bk+eRFxtDNgF19kJIMsu7e6b//DdJqVbgtwE+73EoyHOCFBruYod8PT1k+7pi/s4GztW6R7SP5oaqffLLWbM4ARb2HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CisEsg/N; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CisEsg/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9o+uQtgFcnFG5yU9KpDzyzLE5Kcsfl6uufZIZ8No9jj0dZXdITH7mvu4ayVPCPamnE+h6bngB9a/qKtJ3nNuAEEniH5bu9uwJ74pdZcE3bIcl09vEfxyXhgK4yzfp6g/sKazAHGc2CZQZHefd5vpIYFupsT2UeT9Tdp9yP6RqsxscVav3PFv8Svk23BzIqAfuJ2oM6tngE28idzZ2ZubCtxuGyUOB3OjegzpAmazbchHb3OxnI4OCMUaNzjl87wKfGi4MrXFYzLeBmrmZ0FN4vqIK1kr9zaA3k4IhyjDazT9Y2dEYuXU18s62K+Dm3JkbooxINMVImFEucmqgtd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAimY0oUUyOBfTVPgCpIbkgSm6b/wndiQu22R4nHJGw=;
 b=jdlcApNPWBtQ2eeuba06yhqeEB/3ylb8QaAnnFTJAcaqGFrEfeQ5Jp34YGwyWYy9UetqXtP3fVYFW/Mju0i/lb+zRfuM9q+k4e9+ftX7sQpXz1AU37UXducjuflgfdJ+Xzp+OBevUkq8/GxH0j2hrCqk0+ZKdd+QqI0nx/Z0YuucIG/f2WOdGpqMYdTheGpE+TdBjb0f64UUVE3kIp/gO7LvfIGit7/wnzZgp/nfX220rqjOKITetzLNWqaSeK/C9/0IVzM1e4ZBpV14YNbiDHZbKA3+VN5Y3T3Dm3EKX5s2L16Z74Evk1ztuWe78l2/jgHSqzSE90PP0Z1UyPmSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAimY0oUUyOBfTVPgCpIbkgSm6b/wndiQu22R4nHJGw=;
 b=CisEsg/NEc0aNv48mGtZAiiJiZpLxydj0vnbCgD89AFTY/ikyM4bTa41mhgLHlN/qP5Yzh3ImYJKNYlvSFeW/5+SFaPhuWTSwQ5BkD0P7n7lyLrEnXo4no0+wGoRO8QMfkYzujylgHDLuYNuvIgAOPK3+jdGn2LFfU6XhRIZK5iurUXb9GGCDyXNoHJDCs1J2KeCS/fsZV5ANcbqKyCzwfBwQkk8YmPBU0IL3eJcruIcWqY6waVfF73w+3PBCEERPuRw+QQCFqrBSD2gBWgMLYYbyRS6RbsYTpvkVlpLfm/B4aO+v4sJrnxQ4kaoVvpDEScmdX+zwkjTukyUyc/EBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 02:20:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 02:20:56 +0000
Date: Mon, 5 Jan 2026 10:19:16 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com, marek.vasut@mailbox.org, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
Message-ID: <aVsfpHtID4SdPP1n@oss.nxp.com>
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
 <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
 <aVXByNiEfC66RDG0@oss.nxp.com>
 <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
 <aVegAt002L20oBGf@oss.nxp.com>
 <0de33175-1dc3-417b-8dab-9b57940f0789@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0de33175-1dc3-417b-8dab-9b57940f0789@mailbox.org>
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f0b727-02cf-4ede-8c89-08de4c010ee4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bkQSl1kopo1N1ibv6jhG1LNSrZDgJOBn/lZPZEJ0VcFDaJkSf/CrgHiOO4kw?=
 =?us-ascii?Q?aB6oG7R/r1AwSHaiqgo+yyqf9vmqlvhHaohP+WZ1l4HK/NnMd6M32JAMvDoo?=
 =?us-ascii?Q?gx/L0Dvyx7uJgo3cvxUft08FlyBs602PMmgneMfWsZDKzHxP9fRi6M4ZGwvM?=
 =?us-ascii?Q?dBNUNBhAWx/fUbqIAEVIBbXVdsBlnPLDFThXKke5xtfm/G93B8QzPkHBr7L1?=
 =?us-ascii?Q?Wda1vOvZgEu5SIs7nqOb50esTDSxVt8AeRSzPwAi0OgLHTDS1qn0ep7k16RD?=
 =?us-ascii?Q?yaBLR/PMuugEegsgdhlMOgfiakANAgVieg1F2e8o8f4DYdRs1pPAqmlukb1F?=
 =?us-ascii?Q?YXxfB8v31lkG4NSZ4p9/1dW8oQz0vhncepRiQjvxfhnQy+usexx5TVM4wAzt?=
 =?us-ascii?Q?X53s77swqSuAvzum+roxJ00lwT5KfglUXmdKrvomso1MYfuQC6V0xL7ugO4x?=
 =?us-ascii?Q?4s7njkLiK2mxDl01bwjdWGugB4OI+kZsI1w59FricuMVPyvpEg+oNmJzaGb9?=
 =?us-ascii?Q?PjQzunrLBzhBltEOnZvABjoFRN4317sn8G/l1hksQGK0sI2xphEDbJb2AS6i?=
 =?us-ascii?Q?VEr1nu8A3+FbWyJL4KKbioZEXcQTHDrxGn6xBsOFAEmlP/IEZUvfLe39+6Ce?=
 =?us-ascii?Q?/nJ/97YHAMIv+c+gPLJ31820q5UFWqShxY1f50MadAaXgKSj4bwgVH46ldDe?=
 =?us-ascii?Q?rpMk9g4c7RV6LWudtwrx4B3R2uVXGjZoQkrUfY76IfIojXE9L0ap5viMdcK+?=
 =?us-ascii?Q?wcCgrlGcujFUYzBASzS9hXDdClfIW0BGwjgE9sKy72XpTioXn75Um0cI2y5R?=
 =?us-ascii?Q?LSGKCmYhJH8uFIHcG70YhNib+xbVAnhFfNiW83Ijz+L+jAxM/3Q6SQq2Qudx?=
 =?us-ascii?Q?DiH+GLCVBlpF3+r8SkGp55xmGUA5WOxixF4bvj0JCGQAgw/nE+k2csz3gpdm?=
 =?us-ascii?Q?f9BjTKoVR/rf9AgRgmk/T/vTaTUWZ8GL78KLoH+PeFtm3wIllYAE7bihqd7e?=
 =?us-ascii?Q?J5dVejrqkotpVlJbkZy+hVT15B9ZlCLhFoLh7WuWWL642m35A1dX8UEmh55r?=
 =?us-ascii?Q?2OBHUsz5JM8IHgyZ1WFQXpLzcsKyXIKHOcz95kU4hBTw7brrO7pRK5vIonVA?=
 =?us-ascii?Q?h7QBB9IOHTtDRAZdTmSVgfaX8oYyE85m53PSmTaIKoCeNpGXEBefiFrkiBfj?=
 =?us-ascii?Q?qGx5jfqnCL6kk88/WHkp6CAZnnn1rEUu34CB9ij6hVYxTiCwRH1/ipkpOSpc?=
 =?us-ascii?Q?TSXQI1FWdy2iy7eSqZ0E0mXbIOHaiZwdBidXRDMM00CGVkbAaKYjuGXCxpes?=
 =?us-ascii?Q?BKfgfcK0NnCN2BfKOyywp/uW+LC22hO63AmYYGJcqYJrkbt/Vdrh9NOY6sDp?=
 =?us-ascii?Q?nrKcHAtr6B/oznT8CXBvN2zGVcbPGk2ewWeVXuN8Vd/je8/nIIZY0wymP+mh?=
 =?us-ascii?Q?vzORs7fRa0cwFM+7uzMoDlEJNvZKrcXTFy+VBjRsKqIui7Z3QwNAXLKh20fo?=
 =?us-ascii?Q?74vsgq8e5N08zNUZK0YUYxnU15TqJmQaH8wk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?37DfF56jOqOoI6bbEAIbDwRcnw5Fyq6X2C93Nhvq3yw2mJSg1j+FpeP1Es6M?=
 =?us-ascii?Q?NhizaEg7tIXL8FWQDk5oC3h6EQPRhyRxMDr/YpaXRjy2hSJIwVRndwHbD1j2?=
 =?us-ascii?Q?BC+xpPRbo3KK4QdVZxK8uZjDLzrrGd7AVxWinFXWDq+m0tjMOqSw4OsWO8sF?=
 =?us-ascii?Q?vJAJgfs1obRzOfAMQeoFKF7gkZi/hNsXYD8gSWqEUIOL3ahnXYwbVw3da5+l?=
 =?us-ascii?Q?XFZVfw3ZpWNknlgznL6Ln2Wr2gdJstZ0fNONwxvT//NVvwai/9UECtwgujKA?=
 =?us-ascii?Q?LSvYMRoMe5QgtCHmRsXNWIVtg6N5aAvdXe5UP5g7DDTnQ3x996y/b3wFTmXl?=
 =?us-ascii?Q?RFLISet2wWAO8XsutJP9cb9ePs6IELoWZZiUbkS7Ok79UwhaUzakCAN16iTI?=
 =?us-ascii?Q?g9b1EG2MM0BC9C+H4QfhOZpV1WBlPSjxtmCkAJNQt39LB/5nEV7YzMArdtca?=
 =?us-ascii?Q?LvjoId1g7x5cQYNn69CmYgMcvgNKZtncjSiUMvvgxjkhzsRpIF8fmihgmKgW?=
 =?us-ascii?Q?NSNIebzAYkyLgog3bzKDD9sQe2dac04Qpgt2rQ6YP4QhX8dFQA4y4OQtLsEd?=
 =?us-ascii?Q?jFUi7wYBmOOi+F4FatoiKcFAsbt1U/8jcJM5CPx/m4tiIhx31KI+0DNCYj4x?=
 =?us-ascii?Q?dzm1UcpCG1qGjEe1THfYer/S3EbLuTQf7lEEedTTIYfhRIv3aHvLUzHVt7Wa?=
 =?us-ascii?Q?fh+YKTc3tdzPP+80Y2s+Edf5X7t7SVFJrrtXx4fybgSEwg6NpSnuEIy0yUeZ?=
 =?us-ascii?Q?ziwaaBCe7JVYkA9+rb8d1IskeLct9V2L15d7wAYSDwh6Nuz5JdIhhxtespat?=
 =?us-ascii?Q?KNCIaanEpxYOYyOYC2x/By6ssY6mikhTxFZYbpl5jyrqXeIi0icZ+hb+6LqZ?=
 =?us-ascii?Q?7nrznl7xh4zhVML5dkZgI+hzn3ymuJEr5YBABve/p1YNuJrGRtnHDemDKa9a?=
 =?us-ascii?Q?CA0wzGXYrkp2n0UyhTmjeBPcTsyca0mErwJEQO8dy/MsEHChxzwB/TChu21Z?=
 =?us-ascii?Q?tpe/2X4vzGBRkr+GmAYb7YgSMrV6e61ahHdWPYYW2gXIl/rJgRoZbO2tK5v7?=
 =?us-ascii?Q?IGWiT332RFRJa5GUKmRZq1I1UFeCHgpidor0N1rZJLbekX/M2tHwXmHcDRkL?=
 =?us-ascii?Q?ZTK33gIpU0yC/KOQVfnx+VC17OeTqHeXTXveXyy0InAfN0dobtBIlXLOwo0P?=
 =?us-ascii?Q?DcrDst9BpwRg/G6x0uWaT9Zlxn1gAnh66Q7xh5Ze2JZ9HCOEr7j2c80wYQdA?=
 =?us-ascii?Q?PRPK1lDGcMaLbHkp+2ySGVFY1eZkkk6ri2cyL+fdOIiTTetfJXwGdGEJ1d+A?=
 =?us-ascii?Q?pMta3ARFtrQ2KsV2ywAXEZAjlqniAUiR5XkxOBLlYXCRCE+lBSF5OY+XbVP2?=
 =?us-ascii?Q?PXaIli+8K3gBq+G3so2R1PBtH8OwqI2bxw2JrSqs/z1kCc9SNEuOrs4Ue4yw?=
 =?us-ascii?Q?3z8n0R3w/4rV00BN7pRNzHaA4LWfzzMqEV895T5jxSdV9RDn8vQ2MPk0gxVL?=
 =?us-ascii?Q?ymMfTna9uPS/+oiFx0NrhbvAk3gKkZVyYQZQyGkgapT41OWunxD+jxXxn0OW?=
 =?us-ascii?Q?VowRYHpdreHwDIjp9O6bLKtkICFFNNcQlaKbhQM2itfYPgxxk4mHlpO8AF5w?=
 =?us-ascii?Q?d4o/XE1uC8DsBUM9bhFy1BtzABxX06fBqagf2zmOVzTtTOnAKsoFTsNaEPt1?=
 =?us-ascii?Q?y9cTGoGiVbEGUubVODflFuQFSYYfLRAxzmnbeFObtBaxBlNF3ZaN5bNZfC0L?=
 =?us-ascii?Q?TpMYgZo2+Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f0b727-02cf-4ede-8c89-08de4c010ee4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 02:20:56.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyiWQefsxGcZUKUMVfsNNskm9V64A4mGUNe08oWjshGOOXydNHfsj2KMO2Cnt2vn4sRrePI47eluHTWR/COLbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713

On Fri, Jan 02, 2026 at 02:53:31PM +0100, Marek Vasut wrote:
>On 1/2/26 11:37 AM, Rain Yang wrote:
>> On Thu, Jan 01, 2026 at 05:51:12PM +0100, Marek Vasut wrote:
>> > On 1/1/26 1:37 AM, Rain Yang wrote:
>> > > On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>> > > > On 12/31/25 4:19 AM, Rain Yang wrote:
>> > > > > From: Rain Yang <jiyu.yang@nxp.com>
>> > > > > 
>> > > > > Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>> > > > > complexity.
>> > > > > 
>> > > > > Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>> > > > > Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>> > > > > ---
>> > > > >     arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>> > > > >     1 file changed, 2 insertions(+), 2 deletions(-)
>> > > > > 
>> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > > > > index 88bde59e61b2..ab446aa6f73c 100644
>> > > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > > > > @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>> > > > >     		gpu: gpu@4d900000 {
>> > > > >     			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> > > > >     			reg = <0 0x4d900000 0 0x480000>;
>> > > > > -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> > > > > -			clock-names = "core", "coregroup";
>> > > > > +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>> > > > > +			clock-names = "core";
>> > > > 
>> > > > I don't think this is correct, SM can disable the GPUAPB clock from the SM
>> > > > monitor:
>> > > > 
>> > > > > $ clock.w gpuapb off
>> > > > 
>> > > > Linux has to make sure the GPUAPB clock are enabled to access the GPU
>> > > > register, hence the clock have to be described in DT.
>> > > Hi Marek,
>> > 
>> > Hello Jiyu,
>> > 
>> > > CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
>> > > CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
>> > > and is practically always on.
>> > > Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
>> > > could simplify OPP handling logic and reduce unnecessary complexity.
>> > 
>> > But the SM can turn the GPUAPB clock off, correct ?
>> > 
>> > Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock have
>> > to be described in DT, correct ?
>> 
>> Yes, CLK_GPUAPB can be turned off by the SM, but by default it remains on, just like
>> CLK_GPU. AFAIK, there is no scenario where either of these clocks could or would be
>> disabled in both SM and Linux.
>> 
>> If enabling or disabling CLK_GPUAPB in Linux was wanted, the same shall apply to CLK_GPU
>> to make this approach reasonable.
>> Also, OPP framework shall be adjusted to meet these changes too.
>
>You can not depend on the state in which bootloader or any other prior stage
>left the platform. If the clock can be turned off, you must make sure they
>are turned on for correct hardware operation.
>
>CLK_GPU is enabled as parent clock of CLK_GPUCGC already.
Hi Marek,
I'm afraid it's not what you expected, the CLK_GPUCGC patch already based on the CLK_GPU is
always-on, you can disable the CLK_GPU in SM, then run any gles application, the board will reboot.
>
>I don't understand your concerns about the OPP framework, this keeps coming
>up in the discussion one way or the other, but it is not clear to me what
>this is about. Can you elaborate on the OPP framework concern ?

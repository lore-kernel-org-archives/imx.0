Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AC5182D0
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 01:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775439120; cv=fail; b=u6cE/egdxlcLEYo/driYsPC88mm36gR4Nscc4Z9E1PcU+VPF40wuMofohrGhKijaOxEBbecGEWT1eMlFs8kNRwoJA8wxZRpU8vNArx0WtuhZSSMKRJ2wnluW7hf2R9ZTXVfGDMdiD/Uz55sTnfTO1X3HBRuhAEW1qpt/8YEpLyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775439120; c=relaxed/simple;
	bh=HDoKM/BAfzom37bG7QpJZINrlyNaAAMorgXnU3RFaww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t+yc3iaAFPFzi0NOyDrqqRshMZ9gEZYAViB9ODaX2qcmF34lSBFeO0NLclAbVM3lAbRsd7PH0JGVNATsxY+E7zT0xeuOYsGPfseEyJ8O+kPRove7bq+dFmwuZi36jJIdl1u1gy6mJmRnvvozUTy89Ya4SQkuhWkuPJRvuoofA/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fLaYP1vJ; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fLaYP1vJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZcRt0SUQ3Iu0ikCoYIl7ou/atRI/a0V4Rn6Q7cLKeQReqSseZiCWNUd5TpCtjCw4KlmlROchIoSFbfPEUvth2xbEfhIF/iR4P7v74uCb2Bz0k43ewyAooREspaS5WyB5WPPsjVusKFpYh+8EJTBhGzK3tAwAfsEjAsbLwD7ajxYayPF1YfU4VA4nD3j/KrHN5N4wtkxBd9GBG4KuvRmEYm8RhcWKSFU/j1yqKMdqWOM7YfoZrXJcCQpZh0XVIUJWKv7XsqUYclsRPyvdp/wCmBXHsvTgigTg3V5ZEQXEQq5BtXM8Opq3/TadcaEw/hKLNqKyBYrrrYfxjHB13aLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhq6fSsqzalYiIPy2H0/9yhA+JElzb55JND6OHlxg1I=;
 b=IL68cikTmxZhNyO0E5Q660ERC5b0rxVRGjeHY6jSkOuqYBVSlFIhrk7Yf3L7bcz/eygtqS50w1FqPUhOw52u7O+3JU7BCKGfJie1flbKzAaKjQDudds/S01ljfHUch1NqUebinaPhAXEOoJ7q4Q06u1uOTwijs7h7m0YJbF2DImR83k6zN3EDv9t62JyI/qLL0DRUBbzrmAPSybwzMGK4ZXadtXnU2VO3J4lTaaz7EaK46ack/60Nw34m/PMKdyP/i1BH09l11JSmPAESFOykmsXFf0oPiuzsJef4bzaP2PzP0I8PyLKlcgCp0/5vJsUQhiP1RZ+eTyijqPOVEzw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhq6fSsqzalYiIPy2H0/9yhA+JElzb55JND6OHlxg1I=;
 b=fLaYP1vJqZSTHqEs4oebbgYNekyobKo/AH0sK4u2JHBKNyFZF04K7R35Qe1W8Unq2xTNM0IYBN4W4RN8/86DpBmpfyZgWsZDbs3MU0O+Pvgvv2L3xEZDHFGBHo7NzPSSUpYmsFFBDYYcVudn8U/LaKdXPcmsrB4PQuZJe3Mxq+vi5RDmb+Xu844b5bXxMODEZ3CZxHKYZpXL8I5lAuH9B/GCfySt1Jem//nsSQEiUlqrszdc76rNSXoJ/aQYo892qbU594nrsLmorU41Usrywfg/ysJ12I49y/9IZdaD9/Z47oazxofXxMRyvpaUkGTaPtxkpQp41T0D0PjILiokbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8425.eurprd04.prod.outlook.com (2603:10a6:102:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 01:31:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 01:31:56 +0000
Date: Sun, 5 Apr 2026 21:31:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] i.MX arm64 dts changes for v7.1
Message-ID: <adMNBWvnh3odiLuU@lizhi-Precision-Tower-5810>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-2-Frank.Li@nxp.com>
 <20260404-practical-purple-jackal-8e250d@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-practical-purple-jackal-8e250d@quoll>
X-ClientProxiedBy: SA0PR12CA0008.namprd12.prod.outlook.com
 (2603:10b6:806:6f::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: b8890e1e-9a8e-4071-5a97-08de937c4a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7XDDAdpYaBuSRghfTXyniyw26dKM4OngwIvyP8VlOaGYErHJjqsz4gCoDvIZVDaIkjRgq1aWA6byzYZHNwO2y52yL6Qj/Fw7qwsS6o9yuvSKxEAKMIIWMswI8xA+fkHUBUEQ3OLM8Onlho2/48/OiJO9KMg7D/kfWWVp5W5BE02a/NVshlnMCSXLpczNQ2q2NTDx1bqw2V5p6BBCQ+KruL+1wTo68ZOqYZpK3uEabQEspoaytbHeUtug1rLHmR96DgUcTxMp1Do7wI9ia8dnBA9It5jpHVF7cKGMKZrvmSHtO3SsYlhuX7ER10ePTk+zjRfUUzBCgAM8lrR0dzQ5rZuKrOtpzm7tI+SwNAv5XXhNonga38IE/CnDRRE2Gw2jyBs5L7t7X9AoxgS4FYpRA7iQ4suO4lDIYyT4dNa3Pj3E5rHo82k541EWrglGfjH0a1GX8qnvh95eqBoIBAejFG0ezdAI5f7JTzEyNHENq8DUviHMrb6/Vxj/eKEP9B+qI1FwwwOSzmODXjINPpJ+yi8NatnOd5j5jb/DvYnx2atI4m+Sg2csx4+BaS+nC1TejeXm6czKNvPqQWsJmWaElkNjqM2SMees8M8IDDlFHRlfTWQmG8cBxW95+FpY+K5ViWw9NIAwYMPGKYszlq2wZTkLX5Ze7le+bQhj4+VuZQkHY83dzGcVbg/uS8kaOTrkpCe2dn2QHaS8554KdNEWJdEfWLlNfgtVckOUjpba7MtaMsFjWSckmPtrcc1HM6IT1Js1Zn12TRWiiEqgzszUY1uuxMIvFVd4JSAcz4kr9nQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TmXxIW+O2O5mPW0gF4TETtFqeHGH21nfxSkrf2kNOHlF9YlJmXtuylV45TM0?=
 =?us-ascii?Q?N0xD3GLjr1SQnBq316RyYIubdhPxUuU4K3zxJ1wCysqQ70l+/XtkqlslUHrx?=
 =?us-ascii?Q?i68+hCjTW/LOWqi1xNxveN0abO5MhyZPFD1ApVh5gPsxqu9jy6d1jM5jv2Fw?=
 =?us-ascii?Q?78LdZezWXllqDEK3Bm7rQouJwweI/3o3jVCWBLTM8808hQi6VXrdwafI9c1z?=
 =?us-ascii?Q?AjoxIKHpqhWhyRE14oToyh26kQHcOPCmAGj2Jz64H/9mVEIDw/qHP4BZLYaj?=
 =?us-ascii?Q?177yMosm4oD1s+xBFawXrwtmKD9GxYHFQQMcqpi7i6U/nFv+jPwnlIyqrW8N?=
 =?us-ascii?Q?5RL2ivyL9OTficD08cNFBH9aBfytWoKE0v324zuufWkIFr05cWAb049AOoYu?=
 =?us-ascii?Q?FZjBeQjxjmvqcAVZNW9ilw5AaRsqr7qYVOVuxi2TFOOKBO/O/5wjdEAD1QnB?=
 =?us-ascii?Q?MHiBlB9oLEFMye3KIAxdac/pNrj9yszXGdupWyYtNyzS/VuUhbGNmiD1TCH4?=
 =?us-ascii?Q?ceTfc4iKsfVI7n6L8KKi21R2927hkNLaQz2/VzIKr613OdmMF9HHj3UShe01?=
 =?us-ascii?Q?/zt/FLTXhcEe/6mdmlIF45ckPCbSKTUKxESVs6Jmqd2jNvoBwEZ9dTr82I4e?=
 =?us-ascii?Q?LpBkK+j0rFZOuOWBDAcLi8Q0+XrtHXfPhARGh8auOqHqEdGOWjecGed4PEvv?=
 =?us-ascii?Q?Mc8R+6DsnXzV+GMVBzBYPgDw4UD51N6trJ6tb5SNz8ILWluANsqlSp/Q4PRd?=
 =?us-ascii?Q?u7sq98DQsraXfQMtycpsHPbiizMuEvWalRiStDDA8Gcm5n+UHdddlH26LxEZ?=
 =?us-ascii?Q?IvQcZae5qRWMtz/6sTlwcd7U4MbvNDT9srOVV+puikkpPOVnOYL2VD8ohrrY?=
 =?us-ascii?Q?ke4St8CGuKF6uoQMinKY3hXSoQMINRorHqNduWZaLmAu+IPJYoj7XyFsf9Xp?=
 =?us-ascii?Q?Kmwl5tO+YkNXvuHbW+7/DYig0Lf9tvY7zM0w2P89OOjXcNIfONobkWFZplpg?=
 =?us-ascii?Q?9vRlr07WYl1XiRsFuQXWu5+kFy8wyVPqY/1u/ygjXKkCPnxoAmVcDJzs46J6?=
 =?us-ascii?Q?pqmnVUv6Bmhwo1hvJhlwFC6Z0RUR7EGu3FyvqM5klCKO4YUh4x+33LnaaLr9?=
 =?us-ascii?Q?AvhoOqjenY4i0zSWSdPCca83/sB1+wumLQAveo7HpLiWYezc4XFzSUilAL30?=
 =?us-ascii?Q?YU82o6yzdbkXtcnnzLvAm8mdAR1SXjE/QyBqB77D4oYfMh5rO9AKmO5J3d5e?=
 =?us-ascii?Q?YyMRBTJknMyJ9to8R7QF3kD88P4+bXwv8kKSgdTj2788AYAkyhdJaz8Nv2z8?=
 =?us-ascii?Q?XvO58dP1vd5VC/z0JXu63cxnqBXQV584wSVZJnp8OZoPlhHgJnK4iS8frd+8?=
 =?us-ascii?Q?P26cJw1qmwKAdZn2ALg4p5V8Rv3WeK52AiPB6DfJxhK0Nj+Jt6923fnGPPk2?=
 =?us-ascii?Q?MyzrhkgAn3YhCQeKnmANoEIMV5za+754Tz7hSacLIgPbNEMDVRdpL729djFP?=
 =?us-ascii?Q?+Pv4x1IKm/96cTDnOtrWTQ3r4y7WB8WtVvOtJBKjlj0cbsWeQzLQ6R2rZ+Gp?=
 =?us-ascii?Q?04//ByjvhdCLyYAzHaznrBpG9jCsl9oLpc0tX0inR0dVQo1Y23abk/7e6GjI?=
 =?us-ascii?Q?wss1Ah2NUgy0lQtmTOlL2/qdxgb7/VGYvKf1kOxJPhM6ZhJtvshUotH71B9U?=
 =?us-ascii?Q?b+ahMLx1Ii7OqJ/fa+UiTx9l0E9SDan0SVeee0+KZ6jKIyvL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8890e1e-9a8e-4071-5a97-08de937c4a12
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 01:31:56.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiRJiXO34fGRZK70Mk87kkl7aRC24FbRqNIU7TF3cTEHirG8VZW/fI1ElEIDFXbmXT+vkL4fXiFy1kGzCl4CDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8425

On Sat, Apr 04, 2026 at 04:34:37PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Mar 30, 2026 at 10:14:37AM -0400, Frank Li wrote:
> > From: Frank.Li@nxp.com
> >
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> >
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.1
> >
> > for you to fetch changes up to 825b8c7e1d2918d89eb378b761530d1e51dba82e:
> >
> >   arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual (2026-03-27 09:53:32 -0400)
> >
> > ----------------------------------------------------------------
> > i.MX arm64 device tree changes for 7.1:
> >
> > - New Board Support
> >   S32N79-RDB, Variscite DART-MX95, DART-MX91 with Sonata carrier boards,
> >   Verdin iMX95 with multiple carrier boards (Yavia, Mallow, Ivy, Dahlia)
> >   TQMa93xx/MBa93xxLA-MINI, SolidRun i.MX8MP HummingBoard IIoT,
> >   SolidRun i.MX8MM SOM and EVB, SolidRun SolidSense-N8 board
> >   Ka-Ro Electronics tx8m-1610 COM, GOcontroll Moduline IV and Moduline Mini,
> >   NXP FRDM-IMX91S board, i.MX93 Wireless EVK board with Wireless SiP,
> >   NXP i.MX8MP audio board v2.
>
> You do not have any bindings for these.

It is in imx/bindings branch.
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=soc/drivers&id=e54390aae6887151ff67526af45382beb889f99a

>
> I found them in driver bindings (!!!) pull request so completely
> different branch. This is wrong. Bindings come with the user. Who is the
> user of board bindings? Not a driver, but exactly this pull request.

I followed previous guo shawn's method. Should binding's patch be in this
pull request?

I can do that next time, some binding already in soc tree, how to fix it
this time?

>
> This makes this branch full of warnings which is completely unnecessary.
> Plus this will spawn multiple checkpatch warnings if tested. It must
> have also cause warnings in your case, so probably you do not test your
> tree enough.

Some binding doc is not coming with soc driver tree, I tested this branch
by merge linux-next/master. No warning found. I will enhance my script to
run checkpatch. I focus on check DTB_warnings.

Frank


>
> ...
>
> > Marco Felsch (1):
> >       arm64: dts: imx93: Add parallel display output nodes
> >
> > Martin Schmiedel (2):
> >       arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93xxLA-MINI
> >       arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT overlay
> >
> > Maud Spierings (4):
> >       arm64: dts: imx8mm: Add pinctrl config definitions
> >       arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
> >       arm64: dts: freescale: Add the GOcontroll Moduline IV
> >       arm64: dts: freescale: Add the GOcontroll Moduline Mini
> >
> > Nora Schiffer (1):
> >       arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
> >
> > Peng Fan (4):
> >       arm64: dts: imx94: Add V2X/ELE mailbox nodes
> >       arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
> >       arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
> >       arm64: dts: imx943-evk: Add pf09/53 thermal zone
> >
> > Primoz Fiser (1):
> >       arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery
> >
> > Ranjani Vaidyanathan (1):
> >       arm64: dts: imx94: Update pin headers
> >
> > Rob Herring (Arm) (1):
> >       arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
> >
> > Shengjiu Wang (7):
> >       arm64: dts: imx8mm-evk: correct the spdif compatible string
>
> This breaks users of DTS and explains nothing about impact or why this
> should be changed (corrected). It should not pass review of two people.
> Also I could not find explanation of the impact in the tag message.
>
> Device was apparently working fine, so it should have been made
> compatible. I know that 10 years ago we did not care that much about
> DTS users, but that changes for a few years already.
>
> I am merging this but next time I would postpone the pull till some
> clarifications are provided. Please pay attention to OF_UPSTREAM and
> other users impact next time.
>
> Best regards,
> Krzysztof
>

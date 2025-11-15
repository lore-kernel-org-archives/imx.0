Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910835CBD3
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763174544; cv=fail; b=Bc8sibFt72UiQ4FUSXipgzJqSCkQV0zCcws7Th7NnshO/kjwzx8W7/7tP53hrFB2tZIbAwQcet3CZ4KME4z4QRCyJZ+EGQPyWKdt7lobTVu32/jyPWC6yvck+eGlmFVFHKSOor10PN3m9CmeLn7ByS+3h9brUw3we/Ic/oCohAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763174544; c=relaxed/simple;
	bh=M7moToAcAcb1BU/jYEnfdX4+ikIKM9Ga5LrNM2mJUeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p9q/FNIJZN2NBtNQzgaY0iNJe2Sk5njyg55IM5CDLJAXEL2RGlYcaq08MXyA2f4/n3McqLEpi8iQtjEu2hZyRH1OYKrtC84xY9/Q2mriPEJItmAGV+djrqqk83PMVA3N/gNJ01O2C565Hip0nvcp9bGEc8S4DP0BulhjyeW76y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UjCM2Kgp; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UjCM2Kgp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9t/3+GKUMypOoaqIvp8o7/Q0lvk6TOIrcxzHz82Ah7MW+u/9Dq9ybxiEbNxzMEI3BgucGP2bf8SBZ8KoThq9U+48sHkND6r2jyW3/MsXC5BizIOvp05PnU+Q5ztwx1qhpYEljFwGkgQjSTKqaz5gZMoKeCDoHTwnf+B4TutD49AEBIlzViz0BkNAuExVZ4sO6iPoIzsmqkOjy0LmieXEdS/9qtl1D6d9lDdGVlGMM/1iM2fMS70XU8VY1UUaxmBBvZs+DucUM8ZFhro4f24tI4zM9+f//nb6aa4jRCKeUGAz+l2bMOAUfl4TmRW1HUBEXk/VptA5mNsBsH+VSMsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8smm+YffmTQl/ttJv1iSj9QpV2M6HSkgThYcFbk2eyU=;
 b=qNIRqZWjr9NYhESfg0FUDHXrZ9EftJh+mI7ApiEcpzZq2cifOnT9Q/w6IstMli+pdnA6LqJVAMMBa2Rf6lc1rk5X1r48WBafcGkZFSYl9nWK09FErz11tLQ5emdsFVULK+NuiDovXQnOkf1Vz4IdU06pSoltaPqsVT51FO84DVJv1UtZpXipXGoy50NBObV7tL8v02HGtCtGCseixzQX3tOmJwftLT2cqhOXKrjopITPHqRjKC+2l0D9Qf3WrqMeXtSR2YzCQQ5KxX+LvAXP79rD7L8leNPNsiO7l5uLL/GVlloW9HL4iyOaX++qz9Yw8QeBBmyIetxb6oYpNcksGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8smm+YffmTQl/ttJv1iSj9QpV2M6HSkgThYcFbk2eyU=;
 b=UjCM2KgpabMq/ABJuLuwb3HBSCMzY8fqUbBWX478ZMWyv2tPz2U63NYqq96HiGBJ3aiacFvVhjl2Tk/m6Hyd1BLCLlIy4fOa6BXIDzreySzvL6TW2CEMasjJJBInPBVfYU1zchC32x6ACA/bKXyFEojK3+uI7mKC89dB5L8wMaPjOeSkOhUabJ3RG/hDhzjfmkkcyH9udC9LekqbUpm54Kq+O3quifMXQRcV4Fg4oXUZ70E92p3tPNmz6Iz0SUw3JJCWrLZPVro8ie/NbEl7upRZ6ddy5frTRnnuExWXsz2kKU63dK69at8zfJ15BlgIVno/ADjfpew73cs2z8elIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM8PR04MB7330.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 02:42:19 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:42:19 +0000
Date: Sat, 15 Nov 2025 10:35:39 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH] extcon: ptn5150: handle pending IRQ events during system
 resume
Message-ID: <etxvdq6rex3cbloonveshekt2gpcmjbq2ynbx6peieup7x6uxt@agvcndnybli7>
References: <20251114074212.1214255-1-xu.yang_2@nxp.com>
 <CGME20251114074150epcas1p31037ab8f07810cbb5cc677bfc0cce01d@epcms1p5>
 <20251115010145epcms1p5b7fccdadb889d9b88f447a73c9a8a7b0@epcms1p5>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115010145epcms1p5b7fccdadb889d9b88f447a73c9a8a7b0@epcms1p5>
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM8PR04MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: dc259585-fef6-4cdd-84df-08de23f0983b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S/776vzPZwO9SUwqVQPdhxAodru+3lAarJ+ZrbeQHrrVprg1i+syjsi3VnnQ?=
 =?us-ascii?Q?E1lb8rGe9KysDcxOgt2FVgWG+zaL5CBthBCsiv2RGXh0AHmFYKDsibD7xu6c?=
 =?us-ascii?Q?MUJiYe6f660F45igDX/hmm0efSf8PlaMjwR0HiVtWrmkV8XGz3HWQ+zoPUQa?=
 =?us-ascii?Q?DEST3VTzst6YB9rXNeg4rISQUwhqlaV/tQB8yNR3GYbZp0m1pUeGJFgwruTw?=
 =?us-ascii?Q?Lt/XpnucxOf+WzInQUbUYOftWLtc/I5rirvM+qWz0YehT9YGX/zHNjmXZDwN?=
 =?us-ascii?Q?Mch/H6Fv5xOgK0TpnSNhiczYJR83xGajuxOT27OlfjXAq4WPiYbz0B4CyNrl?=
 =?us-ascii?Q?sYoILzsJrqzVEge8s2hp0HP/EbbZb8fb4ty8dWP9kodNfceb82pkODHYtJ9Z?=
 =?us-ascii?Q?FGHG3fB1RFROM6BicKcYCY+IPf7YFN0h9C1CP/qB8+RTpnULUZDtyp++iars?=
 =?us-ascii?Q?hy5Pu0TQC5Wh5plEbtfHbi7IjZgrSJ4YV9j4qieJxq83jwoSnDOaurgZj5GB?=
 =?us-ascii?Q?DG/fPNhJ9IQbYJfQTU+Vri31nNmsMi36CQRJ64r7KlFnhkpqVpfTJUs6As3o?=
 =?us-ascii?Q?wBM4nSZZ/cUzTAItij+CsewyOjiCQobpK0gIhXJZ0668PB7s4wCIclslhd3L?=
 =?us-ascii?Q?2WOF2C9eZA/21sRIb8BDwd74tfaW07UTA9QPRsdElEg0iv+EWAyIC6ZXmkND?=
 =?us-ascii?Q?PljalbT19g30e7urke577pd656LUBWdNHhd2HPm9klIUatOcXWAz4RK/1qy9?=
 =?us-ascii?Q?IL7fBprk99XabspDtj5oPHOrIDdAJQT4oKXntQmVszmmPNFrxdXO4jaNXEzr?=
 =?us-ascii?Q?XF3LtdXxuncBPJh1VgAKvQHNrt3k4ukjQgeJoIdL8ABbL+37sKzT8sqpDfQ9?=
 =?us-ascii?Q?WzwTgLX3ZHMYMJbps7J9j7CZK8qYb95cC5HOsjTHWOnbp8FSH8N1V/wRnQT8?=
 =?us-ascii?Q?bGaOdxYiBV/bIeCt7mZnqQOqcZkh8jwJRSUuIEqV3p13x3pxpl2TmXpYOhYP?=
 =?us-ascii?Q?87P4jAZ8e0ZjymJfE2W4UZ802nOtzZk5nDXjP8qqauioKZMKVKr6MR7Ck0tu?=
 =?us-ascii?Q?0HIcr0d61CRVltWJ9Hh9JieyWxS4VX777J+hhGLnbWiXgkDNors1136sphV7?=
 =?us-ascii?Q?7aF6dVKuHiiINAarqptUN6H+eYEpEBAo/Qk/ESLmK1YgIqcXlPok24emdErb?=
 =?us-ascii?Q?DE0fE8pdr4nLQ2nTcepA2QCOF5FPK1ZRFdW6ShgqPJReoPxd3IHD61GyT02J?=
 =?us-ascii?Q?YZRSwlO1qrA4SfWtkjREnFRgLTKNUcK201rF7VeszfaQGQUB1UD8fF3jaxWd?=
 =?us-ascii?Q?v9Vlu9i6AhHFtkhslvcXCOTdc2y1HmzbureDQf3LuReci6xRBKEczzcgzMyS?=
 =?us-ascii?Q?U2KXLV5GQtn2iIIrpgN7VrWCGVihFuhbaPLXlvwBLlwu4OJqLXoOJfpslW6v?=
 =?us-ascii?Q?Oa35Ix82BteoEVwGKtQQU1snZEm3k4GybPKPkPAHf0FD2FTTmF57lxFRpyms?=
 =?us-ascii?Q?GZODjZm5w/BhfYCt6zfpeyInzU37yf7qaHZW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wfKETZ1P55LUWHOZyYPgUHS29ustzscCNVdG9lV5ivFrw3jzJTBCpLOcxS9k?=
 =?us-ascii?Q?T3uHTAh7yeik+cKYdCusuvNw0vMI/6G4xvz9Gd3NMdXrQwPmTt7fccZrpERh?=
 =?us-ascii?Q?kHV7Wl3WpKEnvmkLh1W4CBaQZjoPISskriCss1kT/naM19G0eGuI3jV3o8Fe?=
 =?us-ascii?Q?sl8SgPiGrHQh/EcVyd3zQl4vn73MAVLhn+pl2ySRMKxvokOByH8VgO6ldx7H?=
 =?us-ascii?Q?88eUeBSiYL2+0RZAFkgeu8Y9Hek09nwQToLNoWqqmPCJtEAQ+vlo4e/AKHgL?=
 =?us-ascii?Q?enzRzcrmdpojbHgv/GcGmLiiNWZgvRo1B8johY/TWkO5UKW11m4P9Tsc8Yl6?=
 =?us-ascii?Q?jBDobtbJtwlfsBOiNRbKCo2hTtBtkUbc0RK/0qO1lhlBbqbFGH7w3C+T8Gm3?=
 =?us-ascii?Q?a1dowINv9lyvMWqqWxV1rhgjSCfek9pUUvfzNfihPdX8dNQCunZUZYvQOpXv?=
 =?us-ascii?Q?wZ8C6RbRRy10yhHZemDWT62sp6znCNUNgsluDq3EV2IcFVP8op58pwGPcfMC?=
 =?us-ascii?Q?g+jHeLjnR548BOpCBKMEi/7f8XhUROSO94ctUbrCblYwCYZHVc/S04gfJOgc?=
 =?us-ascii?Q?EYEZVuLvN6rXzZiCWy1sLiQzFLLbpR61xmWFf7ADGfL40fZ3tRxfdkrixvFc?=
 =?us-ascii?Q?rPlhlzoKnN5y4U7zOhEIUA4l4ffQ5ienIhadJLOZ9GfSv1BboM5nsaN8FG71?=
 =?us-ascii?Q?5AiJLkZVC6hZHihPB3tu4t8z2EzWjH/apCLiPG6PYJqWSdnvl4fnnqbNi9Ix?=
 =?us-ascii?Q?d1/Gm1oslAVYTEq7uAsC4gOG+mfm0ZpEpytz/tKse28Kpy5DUwsQkRn+MhRT?=
 =?us-ascii?Q?vJskLDi6NsuojLia+yZPaktdnKMy65i72qlw4HgZCIzlzhfwXhYKiunCUe9w?=
 =?us-ascii?Q?Z1z+cHAl2q1Kvc8bERxpi5FfTddTR2gHFvAcBA8gK72F+aFspn+WckeNhKi3?=
 =?us-ascii?Q?tS0CoyXZpF6+dyoM+uaBwQ9UbU1PjPA97Lut1Xc7tVHBaptK5FZTGbdQZzrZ?=
 =?us-ascii?Q?guZZzt1NXw8WA4eNlM0sHctmp8n/gTtvUQkYhB78nCk30dE+PqviHJvHcQqK?=
 =?us-ascii?Q?G3lPgUBUMWzJH9WSp/7dbqsRTxf79rRn3YItzf+m3odD/JkGK9JVYsYkjB84?=
 =?us-ascii?Q?P8EfQN/wGPO93D52a1IxMc7L79TJEQoXjI2nXfyii/bJIC5YEoAehhm3wdKS?=
 =?us-ascii?Q?fIlotAiiw1t1wcOIJJrov5cWHjnj4y9eQKCcSBgkoGT4WDY1lWaRDnzGaqeB?=
 =?us-ascii?Q?39DCp+nPmzx28XlJ60IeuMCIFRKI1EvhsDanzAFtZX1F4W3TE9Th6tadxRSK?=
 =?us-ascii?Q?YALW72gD6eg4SSgafpsq6QUEKi2BEBS7crGrvzm5CTRqEcQGCt5c2QUcQhtX?=
 =?us-ascii?Q?GRFUcbJ72HZJn1uUBj5cvA+I3y7rHZyFa7rX4MbY7x1WFQFuC/jID6SAOoiN?=
 =?us-ascii?Q?Q1S0W4yXhB4hdzR6Yb3U7wU9d3KDfpGus03hUNGZkLU9NFGXrp96+9q2+7Gf?=
 =?us-ascii?Q?RVtxPhoGDyqb5SBtM93EXbHiAm3BFRSqxVLVKbcMAi5+kVfpgBwvgw/toLVM?=
 =?us-ascii?Q?2fZ1Uf58Xdz4beo7ulSvu2dhyZNQ56gv7wmOOm6Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc259585-fef6-4cdd-84df-08de23f0983b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:42:19.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbRLxLF7S0K7veVClKcPskvCNYZ8oXW+dNuK2nc/HlUKEEgCivJJEOlQ5n7zvS7ePz/hzYM8Uq0AJCAABRSn/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7330

Hi MyungJoo,

On Sat, Nov 15, 2025 at 10:01:45AM +0900, MyungJoo Ham wrote:
> >When the system is suspended and ptn5150 wakeup interrupt is disabled,
> >any changes on ptn5150 will only be record in interrupt status
> >registers and won't fire an IRQ since its trigger type is falling
> >edge. So the HW interrupt line will keep at low state and any further
> >changes won't trigger IRQ anymore. To fix it, this will schedule a
> >work to check whether any IRQ are pending and handle it accordingly.
> 
> It is ok call ptn5150_irq_work() anytime during resume even if
> irq-handler is invoked right before ptn5150_resume(), right?

Yes, it's ok because the mutex lock will protect it and if irq-handler
is invoked firstly, ptn5150_resume() will just read the status registers
and return soon since no pending events.

> 
> Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

Thanks,
Xu Yang

> 
> >
> >Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >---
> > drivers/extcon/extcon-ptn5150.c | 14 ++++++++++++++
> > 1 file changed, 14 insertions(+)
> >

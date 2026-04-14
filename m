Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DD3D7D9E
	for <imx@lists.linux.dev>; Tue, 14 Apr 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163467; cv=fail; b=EJy0oan9ZNNWm/GqF91CMgvfX2mj802GQiOkj6meT17jHlH3ylQd/NRMWXPRczsvQDLkT6dlcPuyXJSvrx9IU0JFASEIWtCIRrWrzkdBBIZhy6M6PXS6cO1Zc0Q8O3zxSoxmFokvoVU7+PZsO3SRTT8pAGGE1e6sere+WbR8r0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163467; c=relaxed/simple;
	bh=xHsiGFz1MZfsM5rS+2SqiQ52YSa3fEnxVpQWjWm8mAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OUSvQKyTsA+l3X/l8Er46DrQRXo0IvV3PeWLNgqj1vmQ2riE1T3e7EtVDFBzPuL1pU/XF5FJ8o4Q7IwdGHTbUa1NcFY5nOeen/G+VJeu+zEwVuNUKUkc2ekKB30j8qOLEYEs1Ihq4rbCX35tE2YQLGuIy/Q3rh9/R+a1UV3Rj28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J4aXgkdW; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J4aXgkdW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9RraaHU76RwoMnzr/zKfLg+AVxsOQL2Ncy5a7IkUcu+ePRw/VHU0Ocn6TSlwuYdWPuyOP1EEzOQRl+Hj8Keh7Nj38NPfR+jA77D6u7ifjtXwtCpsOR69DgUzOllboPn0hs+Nc3QTWuH4jbfrgq8Oacyupa9pyl9/xdB7t4dg0WJBXnYtPX6jxPXrqbxnbI8aKrAP/rJrbx+OeQuRPFe4NVxJeL4+VzHjy/AsuhvttwQ6JOy/x6oeZIaU52GmXXoWAGOTze0vPCK5ZbmUQka/zB8oiCYiso1nF9nJtEK3E4idMp1Qx4kLLLAnIdiUf1FJed8Z04DbDQdBhhwNXL0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI2ew5L+M0FXxIh8z/kXeHf3QojJs2LMuk+85YmjY3Q=;
 b=FCK/qcxvNntddPTUAbt0Cgk99TOAKPGeIA393DVaL2ylaFIwaDvhC/mv/XTV733mOUVQoUU3QROCCFVcsNRzOhaFHKuc9kIu2sd1Op7ht0uRMZo0R5ZfBl6yvpsme2L8j4Qqusp/VRCLiJfcav8lz3qLhqlsGlOmVw1jux3T5OD+uy13amoaAhGHC84DsJ7xINFS4rOQv2EQRzPXCu6AyTRHDCg6bN2MiZy1Glp6jCkRkW86p174MMfG1ch1TbyL2wEZAf17ra4uyZxkeoIeJmYYr9mRl9yEhsqPj4q271aByhBJ7hcxYZea6uSXzILHcDh7V0n9dWcBF8rT2iRPNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI2ew5L+M0FXxIh8z/kXeHf3QojJs2LMuk+85YmjY3Q=;
 b=J4aXgkdWx26BLoVGHSHF4EkNUCGSkJej9JvoveKrarqsd4o5MNL7I1ybJYEjvGhlmOerzDzst2rQhrUlM4TffNy4T21HF8qDYwseu2Fv9BEhef1ldndJKROBpbAKKL6rZU9FpPdEjWj4BQ9ufTq7Ke/vc8Kn/JjAN3lPoTbOqfSa5qGBOdtzx1kHBPN/uU2g5wE+mL30c8mmsnEYM3CuMXK/ehazkXfaPyH8yEjhD3n+GMkQRIhlP6ttK9PmPjmstB5FL5NXfXVuiVfuJ/lZUI/sB6q3Y+R4ArLQnWI6rDQ3kYCVyxIoIjxjuANKCyPr3Vi2OrRxp6PEHeiWYgM4xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:44:17 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 10:44:17 +0000
Date: Tue, 14 Apr 2026 18:46:33 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: reset: imx8mq: Add _N suffix to
 IMX8MQ_RESET_MIPI_CSI*_RESET
Message-ID: <20260414104633.GB2624044@shlinux88>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
 <20260331101331.1405588-2-robby.cai@nxp.com>
 <20260401-simple-dragonfly-of-will-fedc8c@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-simple-dragonfly-of-will-fedc8c@quoll>
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|AM0PR04MB12098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee5b48c-09bd-4649-099b-08de9a12c6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GKCwlNAfDlEXVAV1QThxQH6rQebggP1BZ8WFIePwKStV9ORVd70EvLd38ilBHO5eMEfYlxIz5+uzjeaCDiwRQZixecKe1okmUF46F0hR8kaemrKAcPr26gP17jBflcd7YGNMcT7NAUPx3xufwtjvhVR7pTm19AtL9NljSNkAvo7i0u10bJA0gM2QcyEGWFHEw5uajneRnYxWaqaFCBtHRtccPDQ/q1SJ7fQTfVFXcgr7bzU5e+sxiXS8Fb8Mzr4SnFK8kMo+HhgTBYUbHguZRBndM+OzzQ9zEeAmHVKMiQfR6jZ09Xx1MD3+LM+B0e5kKIyzYz0pnMleddOMsTHvgA5yeL+zi8cAq81I+YtgzhlAdtyOILF/G8US8FZMgDGPvZV5uiCfNvF7utcSbS/esh3Hx13BX8PdnXc+FTdov8B/cKEHRGQoN9+fiBWJTrg8ZTwOHycvrIlU5hlPmBf67NSCnCF4RjwithrSV4DzhKGcZ6WoxF8IQ1/oMG+E4J39TyZg0zlfguag6VSpMqhNS45BWG6lmNOdNkZNQrRC857FCfD2a19KAZGWrEDyx27nRDIu77kZWXjpm0Ngys6SRunRypt8SF/HhaNt8Ri299fzRZF/qNmKJcxIFeU99QK2FEkzuBctyFv4BxfN5onmHo526xuhOcrS6uH9X5Bo/zCM751JZIvsaDXv3tfvuoO7lvxs72wUbTkVOIcXGVuBN8uLg0cNqaisKhYNTtJ1SDdVth31wQlgil/7+Ow0fJjhefftYOKfTdPMtzcWPMdCfdHSvslWPg8+lIFUTc/tooY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1AIf0ztpgrQ748YA2s4uT9CogfMMiv2Uj6r1XIkNu4R9MYY14iMX7pbMBIfw?=
 =?us-ascii?Q?QvfhvOcgYkDznxkdLwkVLAnsb/085Bxlx+FhhG/dR4pmcVYFgbMEyyMc0bC2?=
 =?us-ascii?Q?D0KVCng5q7F0BrL2iTPyP0mWWtuxoDxibqjrzrMkKOJV8qp0IZ6n7+oqjAjF?=
 =?us-ascii?Q?W3gfwsXyuWZFWhEInhMKUdNRg5CYTPk5kUemQB1Y87JhFuJLU6sP3OfHPx9D?=
 =?us-ascii?Q?zHIOgP/LFfSqr4MgDBs7Sz/ujaHk33rte0na7kJSHGi4WLDV0MrUJ2SpR0il?=
 =?us-ascii?Q?MjgjvcBdg+zwZ/+nJ+7LUYjcI2pVNoy75pjPaw0WgjJ5droAHar8kCk4P6yc?=
 =?us-ascii?Q?UdzFdB5CLuQZKYF4WnL0F7ut7i2A8bu1ocUavPnoo9Q0jM9j9keoL6CyfBNb?=
 =?us-ascii?Q?ZJdNTI6vRIhSUm73Iy0xvN/r1sCzY9GoagXQusiKYBp7W0lnVzuFTjIRZ1eM?=
 =?us-ascii?Q?e7QiA1Nqe5uRPFRZw4qllXBSuklN+n+P4vKQZ7gcEI8PmMPuDG/Ln2BLMO5d?=
 =?us-ascii?Q?naihueCOBTETmQjWdzBdae4VurS/arVV58ibm5juMhEHLGyoPGokDbYeybQe?=
 =?us-ascii?Q?7TraRspoWkfRmq103PYK/0yfYfotQUU3bsKZJayzj29BaHtDOLgkVxcLqa/3?=
 =?us-ascii?Q?ai/SurUZvEeIFWwkY0ehPVUdtg7jeHM635qbUgktXo1fb7adpyX/+UhugGiE?=
 =?us-ascii?Q?aJIMMcHVJfNQBBeNPhwYHrx0XX6TBPrQgq/vIa01WSqgxBmjkUsuTfE76KoJ?=
 =?us-ascii?Q?X64GOEA/7yxKf0gnkBYu7j14B1YH5A3br6CFiwmU7Tjk8CAWDNhefqPgkEDB?=
 =?us-ascii?Q?9MK2WkFtLiJjM0MIDOY5PiHEGoxo4+79Pc35ZkV/VJs4IfSZtkn2Fl4pM2jA?=
 =?us-ascii?Q?rgkRYcbFxX0bqF7JoUA7ULzlUKJdti5aHJ8QxQFcv49ybTlHqZ1H2QcgiO9k?=
 =?us-ascii?Q?aT9MpZlbNx/os+hkWW5fZTwT8aNybU0Quc+7TpQIwh1O7LdgJId/m1O78LDW?=
 =?us-ascii?Q?2jN5yIP/wNAVNC83OeZuNvZ4kMcn/gYJVag2SR61ajJoe6x/kND7YU8S7ccc?=
 =?us-ascii?Q?RP3vtV6TIu0uR63JLeYzaHauatXc4PwMvoR6f2qMiukhKAWAVHnA/jfTWRS9?=
 =?us-ascii?Q?jlr4avRPHSC1myHN9SWERw5v0c2HrNuPNXGijnMpKoCFr/XtTcCSUPTsj2Ya?=
 =?us-ascii?Q?hGB0AZZSwsJcL3BOspj/KB1mCheiYxBLDQSu8NX53KqwIIkhowKRKhoiyKVW?=
 =?us-ascii?Q?5gjioGfPS1//vROx9SJmSah/h8OwkoezBMuL+MWFlX9Aa3HwVkHRm6nsUFE4?=
 =?us-ascii?Q?vgHXWMgrjWLoYGiND0S7zW6Iz5HecNfPTidjW0MWeBvb2EDlxYdhAtzq+ICq?=
 =?us-ascii?Q?9L1HPJ8sevYkkrk15b1hckjIyCwv600uWFSgLghtmDmxR1nmeZDJvfXzmNu6?=
 =?us-ascii?Q?hSXR2ibNCpGxG7A2oFlQ1htk5015+7V3oIOLh2cIvLFkH8ccExRmAbACSSgE?=
 =?us-ascii?Q?tVse87r3UXWcPDjVnS75ilbmbv0HKciX+UDMJ4HeAWsabLLckvb3JAVPUJOr?=
 =?us-ascii?Q?yWPN7kbQtTu2Nr02EsQaPaZj3ZI1lZ/hYct/+2ntdo2QQFvYU8zscifIUwk9?=
 =?us-ascii?Q?NuGiawfg3ev/qKlU3vz01ItZg1wvDQj/rm5q6N2dVnxeU6InkIh012W/uq40?=
 =?us-ascii?Q?Uu0LM8HN9VCuabDYtUvZwoKs9elcVOs7LOp6lrOkF9UBhvKBALcuqzTd1Jw2?=
 =?us-ascii?Q?vKHwBGRkEQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee5b48c-09bd-4649-099b-08de9a12c6a2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:44:16.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU1cir7dTP5BlR28kqvlcXUKLSaEzRpHeRQaNKz2vOAdSMZVie4Fcw05IazlMNxVNcogE+v+wh+K5cX7kam55g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098

On Wed, Apr 01, 2026 at 09:41:48AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Mar 31, 2026 at 06:13:30PM +0800, Robby Cai wrote:
> > The assert logic of the MIPI CSI reset signals is active-low on i.MX8MQ,
> > but the existing names do not indicate this explicitly. To improve
> > consistency and clarity, append the _N suffix to all
> > IMX8MQ_RESET_MIPI_CSI*_RESET definitions. The deprecated
> > IMX8MQ_RESET_MIPI_CSI*_RESET versions remain temporarily for DT ABI
> > compatibility and will be removed at an appropriate time in the future.
> > 
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  include/dt-bindings/reset/imx8mq-reset.h | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/dt-bindings/reset/imx8mq-reset.h b/include/dt-bindings/reset/imx8mq-reset.h
> > index 705870693ec2..83a155dbbd4a 100644
> > --- a/include/dt-bindings/reset/imx8mq-reset.h
> > +++ b/include/dt-bindings/reset/imx8mq-reset.h
> > @@ -46,12 +46,18 @@
> >  #define IMX8MQ_RESET_PCIEPHY2_PERST		35	/* i.MX8MM/i.MX8MN does NOT support */
> >  #define IMX8MQ_RESET_PCIE2_CTRL_APPS_EN		36	/* i.MX8MM/i.MX8MN does NOT support */
> >  #define IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF	37	/* i.MX8MM/i.MX8MN does NOT support */
> > -#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* i.MX8MM/i.MX8MN does NOT support */
> > -#define IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET	39	/* i.MX8MM/i.MX8MN does NOT support */
> > -#define IMX8MQ_RESET_MIPI_CSI1_ESC_RESET	40	/* i.MX8MM/i.MX8MN does NOT support */
> > -#define IMX8MQ_RESET_MIPI_CSI2_CORE_RESET	41	/* i.MX8MM/i.MX8MN does NOT support */
> > -#define IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET	42	/* i.MX8MM/i.MX8MN does NOT support */
> > -#define IMX8MQ_RESET_MIPI_CSI2_ESC_RESET	43	/* i.MX8MM/i.MX8MN does NOT support */
> > +#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* Deprecated. Use *_RESET_N instead */
> > +#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET_N	38	/* i.MX8MM/i.MX8MN does NOT support */
> 
> That's quite a churn for no need. The entire point of these values being
> the binding is that it describes the ABI for SW and DTS, not your
> hardware registers.
> 
> Whether signal is active low or high is kind of irrelevant. Linux uses
> it exactly the same way.
> 

The original naming was taken from the reference manual at the time.
The upcoming RM revision will clarify that these resets are active-low and
use the _N suffix, consistent with MIPI DSI.

However, I agree that the DT binding and naming need not be changed.
I'll keep the existing binding and naming, and address this in v2 by fixing the
reset logic in the driver only.


Regards,
Robby

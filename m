Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D934DB56
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522705; cv=fail; b=KAb3DKIhi3mvQLchs3plrGJIxq9HNYl1+xrPE+LDO2iERFd+Bwh1M5Yg8W0UsKjVzHtl9G+KPNwh6zRI8VxcEqnKB+Yi/3fesWUgzGqb9hxBjr6MUv/q4WeOLhsfDgTbi5CMkGXjnkXwrMBZPh34RvZp4xrzO6JzQ9SQSIgAya0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522705; c=relaxed/simple;
	bh=JEcJpFZ2ZiW5OBhPcfTlEt30bqI+69JwBb7HKYQ9R8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jDsQdfcHhKoQ1C28zX8i0i79+aKMPtQY7MWaCRDyLkoCMwH4WHH/4syJyEsDWC7SqsOIZIRO43DFIM0qSppzYnGTfLB3+vd7GDpdoBMC6hkrmSWKMr1NxsCnmWB4aamaLvClwx3aesrVzQorveWyeBGDcmqhxTp817KIrFdlP2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VC34XzBZ; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VC34XzBZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2IJUc29drJ/ZGrmdc+ercbrgJtGtXQVeFqvRL1U/lUCg9pYb+aZFDAXyRSyYZ6Km24pCYmqv/yxiMjtnWmnLnoZO2VLwfIU9o2CV4WKx5RYpS0XQdWExyqfsHo5a6/S+YGxYEqWX2fzi9ChGZzR8gO82VDQvccJzQSe0o1iIXMnFmTY0zbkU0VKE4aLiQd09vQJSzIxRZs3Rx88qjcha0QRxVBkr09wS7+oJI03JFXEmnxwHzsKN5bdzFtEX2HStqhcHg7G+UINmvhYTg/ce1F1Z74qgKd57weJw+FFF9/XQ6ob+2nVUm2OIpRKmyiNbFJp28i7hIJ6E41VQCOj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfOIxBEmwuv0+5LzsDKWd5qKfwoB6bub0YQ2CCHAPjE=;
 b=up2LtFkwthSKjYSffRynq+F7sX/Tx9h+f0/YaRkgZ/QZZVFo9wP1tlt5cXzRISn0V3s0acSyQNA6ulh5XU1cQqxJ2+7aCq/s2uMFKTREbGoybdHMIyJNKNr4I259v7BKyWG2+xHO9ajM2VLftzpT7ueyvEjAXfXkKOkr+jz2lBcT4GAL1n4wgGThWQI7i7LB8bKhzzp6xrUClkQalxmZ3mpZFz7JT73nn0IGaV6Flg5iUdUjYXUea8zOUuu/Tx9hWYgejNpei05PTazT81yjfSM9YCYkLaMMgxulrV44Vsst6HsLw7vdGBWoCqG9LvTxiTieKMjAXm2A5bOMTRJd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfOIxBEmwuv0+5LzsDKWd5qKfwoB6bub0YQ2CCHAPjE=;
 b=VC34XzBZ4/b7U0aK+dHUz61chWLHimsPefljLvpfbH1yBtGxXRg9vSS2AiKT7woP2B+qXkBZwKk6WuDGLqIVf5N8BLaO5TVhL6FhiwXfngF7W+0e56WY5VZtnYdKaN+XM1jrDkr0QliWksDq93wSqbt7oVk8A30Fjax0UGdERfziW+vcB3cJlf8L6lWkP45oz2LTz9TI1cxiN5gJ3juK+gLIe0fRnR2WlkdKDU7mAUupszpPIuJjOTg8zjRagj9Ol8/FXM5KLrxwAkekCypdGXDqegSQF8IeyyguXLg/sV8hrPWmglLey3uCxJLuWPiM9bQGNdRg9LgmDqAi6L03FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7898.eurprd04.prod.outlook.com (2603:10a6:10:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 17:38:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 17:38:20 +0000
Date: Thu, 19 Feb 2026 12:38:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp-kontron: Fix SD card supply on
 SMARC eval carrier
Message-ID: <aZdKhAa2u14LD-cW@lizhi-Precision-Tower-5810>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-3-frieder@fris.de>
 <aZXv6QSq-ydOX5Wt@lizhi-Precision-Tower-5810>
 <1c86a997-4781-4816-9e90-35b15e2b0146@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c86a997-4781-4816-9e90-35b15e2b0146@kontron.de>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 494f7839-adf8-4d33-cc5c-08de6fddac58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cuXP0gHnN/f7xYpEyreWKXymTwXiC20+5aq0vcAuK50wgmo1BgirteMDKo9d?=
 =?us-ascii?Q?UCUcwZsI36D/nnzwsTUvpcEeOt6V7vew+PmsMc8yY9EOXwZ3jar2mMgA5KWc?=
 =?us-ascii?Q?3OFtcywORKKgciGnrLnZb8xr809YxlkgeJobVMDlRyo7s944XpwAZVU9ocp0?=
 =?us-ascii?Q?meXU3Bh8JVT0ogL0T1m1uMktXd+10oWQjxE7F7w2b/wbUk2KzFKrH6zdrsoC?=
 =?us-ascii?Q?vTO3qRmQHgQIL4iVRpx7jDHr0DMS+9E21J+aLDLLZwSPJxRKNeDp1CTlDTt8?=
 =?us-ascii?Q?N8zOotrTKVe5jCwBiqbO1T/YcV0Hhz+1sEYWDJF6OICytQqO1cWq6NaQAlhP?=
 =?us-ascii?Q?ehWnKQ8auATrkWdx4nwcTgAEFLbSksYW5PeFED8GjxvGSI2hZndZwr3rUbda?=
 =?us-ascii?Q?ueoQ7rghXmyM2ClTBD4bPp86IyahLHKYCVeR8ei3LuqmaWyvYZz9RE8v5BED?=
 =?us-ascii?Q?76NnLDDJ6Lob4l/hfycBv4LCaJSvSILx6cmDajG88UhHJbiNOGHjhleOhwaE?=
 =?us-ascii?Q?6J4m5rmSC2apNqT06a7rwAagcSf5+fSty98C6L/LQyM/yvVyoU49DfEpAtCO?=
 =?us-ascii?Q?DtWgL5VVA1XU5bkxRi8nDbVhDRGr5bUedhxiedbfjBg5sMii82GTqsql5IJe?=
 =?us-ascii?Q?/5suWQYREi/i2dJRCvFpXokZmPxLqg/Zr9/bMFTVQHyV6rB8Hy/t9RlcjjAv?=
 =?us-ascii?Q?M2HhL64k7+cEvJZc0vgfRrdD8u423OCT92pE60PfYrAYTfJppRkCRmyKvxWU?=
 =?us-ascii?Q?0mqbouMUIOM47SNIXW0RG7xTcT3fHroGE03eftidEsuDQkcdJ8/Sx4gZ4j7w?=
 =?us-ascii?Q?FW2x0ofP/sZY+4oYKJkaO3GMsvctU22y2UpJfIwBgT54ITvwwvdRExvein+A?=
 =?us-ascii?Q?w5a9RUksFCkZeFdahk8QyTHjuTB0RM5LAteX2/ouL39zSLk0q/a/bicgtOwU?=
 =?us-ascii?Q?6QUdy7BcNErCm1ERdrr+eKm9fRD5XBqsB2+AKXYYLbqSAy0ufj2/ML/GVW6N?=
 =?us-ascii?Q?de5HpmhSBB8YR6yakBT2Zro6ie9WE+zuQQEzV0KFHE7gA7rYnOTqiJYPTJ5F?=
 =?us-ascii?Q?J5s1CDCtanyIfExcVGQvVntR2rwWY9QIHxoRZURO6EGZbpkSREHeT/EOjNPU?=
 =?us-ascii?Q?Onf9nnTk7dq77L2c6B9Dup0220GsURFEmLFyhsx9weo1bkH73+HF5179qEnB?=
 =?us-ascii?Q?dUflcIGhqMlBqr2InEwdCNTc4vcE4dqpeiHJAwoPMWdaG10FscFWmIDD3Y1V?=
 =?us-ascii?Q?rktl+tRUJRxcc5z4JvBQbf9deUclKY4n17YrxIhfkBz1x4TmkZNCsvRRcXr8?=
 =?us-ascii?Q?kICyvsxGO5ovInsuAqBJBkDxCj/kbmFC07gAbnl3cNA+NXbUQDiqCT1o17WJ?=
 =?us-ascii?Q?AJxYvyDT4QOKuLic5MavJ6Qe5/NIWvNp9wU9vrnr0P9da+A8Q5KBC7mTjM7Y?=
 =?us-ascii?Q?mg38ObAE+i7d/cs3KU0GymH7DjD5CIhjyOMnz8wPQkTCWXhbuZSc/91XTnMQ?=
 =?us-ascii?Q?+C6UtQy0k1wIuZ9/3PS0mOvQN7NtwQxe4J2fTYfxaO7RGdaFMs7PHyuP63Gb?=
 =?us-ascii?Q?pIRjz1BFBj6qkh0ruKvfPrApErugB/YXS9igD5VsXEbQI4iFgOu6HzsP6Rs0?=
 =?us-ascii?Q?ehMtx6h7Ea6jHeUHUtF2430=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83/6bktq75rummzVvEQCZrK+GpyGQcQTDva9oZxnvp+qQUfdUqxJsj3nl3he?=
 =?us-ascii?Q?OThcQY3npCPiOlIcA0iiS1+zb8CJQ/mmGa1WyDwflujwozcEW1td7S/Srmjj?=
 =?us-ascii?Q?C77uz2mil5nSwriqtbASRv7ulPvD472tRotBJ9ES5UyzaOO4OiMfdDQs+ylh?=
 =?us-ascii?Q?7Xmebe4rU0nlYXOrjydT1iyfr3gs/3PbPo8ESulzM0nSuPkMBvG4wm27o03z?=
 =?us-ascii?Q?w6d4wI7jYbq33afvVbS902C52BqSM4Ywd2YvyyaClGIgzWsMDpG3glyv83LO?=
 =?us-ascii?Q?lP98EkrVf3qv6HS2wIDJu7h4tbaUsJHW9b+SN2cbH74QaRSHKFHubXwNxKx4?=
 =?us-ascii?Q?HfFe2ztlvCZEqWKaCK1BEi3BvQnBHtLfy60KHX+d6bYumvrKsrJmj7gkMtId?=
 =?us-ascii?Q?AE5iwx9+ndwE2oiZ1cnalg4wR6Ij0nejiighEAjl6ZZVFkwA96DS3deRFytl?=
 =?us-ascii?Q?Fi7cZ5exWRUoymI4R5rgx35K+9BuODDDL1QSv1ZPPY7a1ZYPZb5A9ImeSM01?=
 =?us-ascii?Q?Ejo5GjSpeOa/grDkyeirb+Tu0FmVJby+GShUZ71GB7gaQb+upq7/2/f0637a?=
 =?us-ascii?Q?xJPeWn6pfNhsuSGm71iv2H9arD67fhjUE91gA+OW76yeiltqm0O97dAiAdmB?=
 =?us-ascii?Q?DK79TZvdVDjBD96xvj73eoYQ8Vsg3W3UwFzRG8yhhZrmKgRCH3PX05Yqgz/d?=
 =?us-ascii?Q?0jKwsiq6q2IHVP6JBvdrDpgUO5lq8qMFIOlJGP+AB1XH+T8uzQiR52eWtu3e?=
 =?us-ascii?Q?XpancjnRVPNIlE13KW8+cQvJMrQja5rRgVs6t7lRwu5dNfTgSO/oaiZRkQ54?=
 =?us-ascii?Q?epV3mIGHnJCCCl/DmNW3dR/3AV0OBhlOHkwv4dQeOOkeILJItx0NMelUg5en?=
 =?us-ascii?Q?FDOD9hyIjvv0rWbhYBmje6SFlhCeoJ9QRKsOnqKpmrucv5jcrmSNFmjW71CT?=
 =?us-ascii?Q?s5MjpKunzOMiP7VgAM2tXKoIC1wcjt0RgwjKBBOcgMPErUZfuer+kcb+aLZ2?=
 =?us-ascii?Q?HiTEvMQBjbXYuxQ1ijqHt96G+FyNvT4MyPeh8Sm/ao0VJgCGhHhoqhvwMOy5?=
 =?us-ascii?Q?SFyPBvzhWcnrsysPSuLP+oO8JzdBTBGMlg+6MYZwgQY3zhbvJlok8OcgGaEb?=
 =?us-ascii?Q?lmwoxh0Ix1+z7HaDItiS3OIJ+IXpt2XjkUA9Z09p1MZ3n87TTRflC83WKWvn?=
 =?us-ascii?Q?Tk0D1nihklCL2Wyk4phSD3DfjBx0n0hJS481A9e3c7asBktHSZ3mfdMqz9sg?=
 =?us-ascii?Q?xhCXgYgT/62WZegDUqZkZcf8YQwtL7fJAa6xBKHHwLqLU6pw/zbXRHOMCWq6?=
 =?us-ascii?Q?jWd6TCMP63i+eow7V/xE2VDqtWO/a67UiOuU/dKJl86oH1F252lUtsyjqhpr?=
 =?us-ascii?Q?UerK4S9L3GHKgtz/uBZ/a5Iq6bDYufCgRvELL/de1eWfoXDLVn+HNvd0W07O?=
 =?us-ascii?Q?KgXQc4Q5kC+LKmEJUcVEgTKBcuVa6A0MqopCmmdrwdwaE0wSk4PcbJvcI0VK?=
 =?us-ascii?Q?2zOegM3BZdv3dPa3DiBqce55Jh8J5LuK5SUaSbGOJrDiBO7Pr33ZeZDooAbz?=
 =?us-ascii?Q?0b7VQ2p9a4hLRybrA77VsI1B1RJaXgvhTHOuXWjEAflqO5gqgbuOvPCLK7ay?=
 =?us-ascii?Q?DRQjfykLIW3BVY3ilftGW9hd1BF8Z4Cl7yHKm2ldahh//O5JnczasVjgwLgl?=
 =?us-ascii?Q?jTbpltFycEZrRGnPeG+FfM5FnlBXg7K4L2qF3CIlUvYparOG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494f7839-adf8-4d33-cc5c-08de6fddac58
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:38:20.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJpw7iHryxYvvNH+U1OFR9lL40p3p5HIgTJTzWetczHzyI7qyh7Iq+ktgkD2bIpdO0AxLbcWaCDtyImZZr0w4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7898

On Thu, Feb 19, 2026 at 08:51:32AM +0100, Frieder Schrempf wrote:
> Hi Frank,
>
> On 18.02.26 17:59, Frank Li wrote:
> > On Wed, Feb 18, 2026 at 02:25:06PM +0100, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> The SMARC eval carrier has a power switch for the SD card compliant
> >> to the OSM standard definition. To use this as already specified in
> >> the OSM base devicetree, stop overriding it in the board tree.
> >>
> >> This fixes the power-supply for the SC card.
> >
> > Is below commit better?
>
> Do you mean "commit message"?
>
> Did you run my message through a LLM to enhance it and now feed it back
> to me?
>
> If yes, it is a very strange way to waste GPU cycles and developer time.

I used LLM for some unsatisfied commit message with LLM. I need make sure
other reviewers can understand the commit message easily and commit message
align submit-patch requirement before I can pick up it.

It is not waste GPU, which already found many problem although there are
some false alarm.

>
> >
> > ARM: dts: imx8mp-sm2s-imx8mp: Drop SD power-supply override
>
> The subject line is completely wrong.

sorry for typo 'power-supply', it should be 'mmc-supply'

subject should be "do (what) to"

drop vmmc-supply to fix ... or
drop vmmc-supply because it is already in base devicetree

>
> >
> > The SMARC evaluation carrier provides an SD card power switch that complies
> > with the OSM standard definition. The OSM base device tree already
> > describes this correctly.
> >
> > Stop overriding the SD power-supply in the board device tree and rely on
> > the definition from the OSM base DTS instead to fix the power-supply
> > configuration for the SD card.
>
> Ok, maybe this rephrasing is slightly better to read, but again: is this
> really worth the efforts? And it doesn't even correct my mistake of
> using either 'vmmc-supply' to refer to the property or "power supply"
> without a dash.

Sorry for typo,

Frank
>
> Thanks
> Frieder
>
> >
> >>
> >> Fixes: 6fe1ced5ccab7 ("arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier")
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>  .../boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts     | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> >> index 2173a36ff6917..74d620dd06b7b 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> >> @@ -249,6 +249,5 @@ &usb3_phy1 {
> >>  };
> >>
> >>  &usdhc2 {
> >> -	vmmc-supply = <&reg_vdd_3v3>;
> >>  	status = "okay";
> >>  };
> >> --
> >> 2.52.0
> >>
>

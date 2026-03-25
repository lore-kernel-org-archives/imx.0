Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CD3FE66C
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450278; cv=fail; b=mqewV4blnfz/I5tTULRRgEWk8fSGCWieoUE7DJEu7C55wv/HX0RjHu7JvHdYHjv5vvo7jV0OI5ftP3npHh0HZrXKiaJ/RkN/mfieaq0v96gBA9LsXbZ2kj10xQQTOIYlg/1VGM7t23T1IBRO3i0ywKv1hrw5u0ZpAZU78SM+qHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450278; c=relaxed/simple;
	bh=uxoygUHxo/0pE8phl8GWqJSsW/XWtd1VreSAFYEwZXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WMNNmu+qkj1y+VdVdR3N5EFvmtuv76F/8ZXYuIue84TeEVFMOAonq/ie8cGIQx1VRSwwO0P1JApQuXx304zlhIDLHTQbRCRN7IggMqU9Mp5MjilAb3yHQmmgEOwRmP7OOxaEocs1Y/fuiI37v5ph6I18Ug9pZFq1V4/pJFTmXfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AKpM0jRm; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AKpM0jRm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N30r/hLWZiegiOJojiWmO2BgqsXXp3auf6xpsJioylWnUZjZc/UkrBlaC9SBP+Q0p6yVqE+MUjYgYfss5CBtpKGM0NGKmArzIIeewPwirEqVTVuKJYydFDjDRl/BDgBM3d4Pfz9SCEIjwia7wVsocCymI8N/rFc0algtJkP4r63gpL9Z3FB34IBs5MrE6qda/YiHJAYrK7C8fC2KZM80JFB7PIAX18pB5G9mjDG4MZLRzxMj4nniPOxMEwfRiH+7sAwSZ1DoDQLnZeIwrNAMffpvKSAtDksjH5pgC4SpuLeml3q1AmNJSiN0vmshLMBpxE9dVpptJuw88fhJJg3hPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxoygUHxo/0pE8phl8GWqJSsW/XWtd1VreSAFYEwZXM=;
 b=M1LRf+pVPL/8iRL6ieoSDqRnVux6VEbuimZgBTw5D9MSbAJkDm66m6l9so3K9VacPpw5lkRWon+6/GYgIgxJDLFnt/SnvqaAGMcWORQFoPiPERWrX05xO0ZpbYQGEwf9czPlj5ilchYj8xtiQ1yEWW8jNTbCSqCcINF2gvukGWYOHkZl+x3bba2VDE1Rf2AgmtmdyIEPuqDbxUJnX3p7F8zG27KMYe3KFUDELxDEJko6PtIAG5zKgZmc+n4bKtRbVlosNwjKxwjc4zKO92Zng5JGXrfJuxhqfyLo7VJupVkjjDnjjW10KHEgcsBkbC/hZPDbsTG3S31yjgJ50BMhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxoygUHxo/0pE8phl8GWqJSsW/XWtd1VreSAFYEwZXM=;
 b=AKpM0jRmrpZoWhppw6NKCJZfqJ8VV3uZksquEjbMRk7c+V5Zu+S+u5dqhYpWfpe0sZMpQ80Oz2dbx05UJSCNAP/NUFBRbVF64MpahQv8F/W8EpVg9MgwpKIXGUYyQs+XCqGopp77SN6wPVN7ZMob/9AxXYZwuK+Ga8vKpqoyAieBzvuaNR0npq9SQNeBEsMV9iJH2Xa4r9rtCDXfzNAIxHzr1mg97VtcxZbZc9FRC/yPyJ7JCEc4ChsPaFVZSdffqj+dN/+8407BJL0BD7TpGf8PjWHC5khbePwy+PuTFoGof/MSlLTjnPAlIG2gNnPz3n7Hj1gd/4xDcpYognANOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9349.eurprd04.prod.outlook.com (2603:10a6:102:2b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 14:50:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 14:51:06 +0000
Date: Wed, 25 Mar 2026 10:50:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325122104.GA19112@francesco-nb>
X-ClientProxiedBy: SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a64a29-407a-4b53-aea6-08de8a7df149
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 LvuajkrlKCdnjEnFCOsolADp6/FqpA5Q2j57SXFBlARfUjy1B6u2oa8KS3uwo6TyLMsW0+b7ah2cjyiqnGTiFwJygdI8YFPIKJkO+PcaZF5SJgcZDXqrV1KCQvhZkcHDCNa3IOhcG80HiO+FFAcxSeH7FN4/9AtAZmCorVDr6iKjbfK2wKOAmRzW4IoYoN0gQpBeke5qXADAq+JGTdbA/QcV0Qyhpc+84/45HvUfkyF1GkybaCSP/FgmTx4rqwtWrJiWiOnHw2FTTkCB/6Xe3LZeYmDNuCobNEnQuXzIvzJN3bZtdFfQP5ziEt+9qBNwMp+d55tK3bnb3UXrV9sDZcrzMQYc4kyzE9yPZ/kLGtTvsv/ukwwPyFsQx5zXj0d8FPSU62OcNG9hxHGAipUCgPc7Q7lEX6BGbocm+hM0CypFk/PAvNLCORgWWxF8uFBpUiczOXHGkKuJ+BrTKxXItx5UrTvfYJBy1HLShq0aT3dPIjAb6gCzqtGGKz5h5oY2gRkprK6fm6n1WDTPNXRPOQ1y5CUpS5df/eCHIVGR2sgXiva5WiAsR5eg5+WiCnwwdrb0UFKT0argfv70J1xpyn/skzcLVjDgVQEmpofXupCpCLHolZSYqXb87MRijo3BnjDofnRt8OipdFLQm1KJLP1LP1Mi/kq79adF5z0jeytxxBee9j34+YAGmJSCr8ekss6lgtgBbRJ8K/hLxLhCuyVOVXzGVyRrYn2g7/ScYGEd2P/jXSGzdFQk7uHnDhNPH5pz3r4m0ATBTRCwAjyRr6tXQvq1CKOqNFtB3asjqqw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nVp0ydja8lyeIFljj05hLK8TN1U30CffH1D9GWniSiLrFfpxr1+VGcjx/49U?=
 =?us-ascii?Q?tnJQLJ+qlydur1VpdtTSe3lAP1jNB2psbP5/K0CvYXtwq4w+UEYOmKCTKxWT?=
 =?us-ascii?Q?+R3LEUVOSaw4arf6MxDCf7e/+AWkesiGgCOKTDzQY4pldAU6aeUtdgcsDBo7?=
 =?us-ascii?Q?bMA8I+s1ykr2KHKs+CKpmJfPug9bID0SJlPfYyEcKhB0POiYwkDq1BHp/GWl?=
 =?us-ascii?Q?dd0WNgHQAqv3f4K/UevpCddtJ9mkljHiQWsXkpRP30SHnM4kTaYBGDhojLiK?=
 =?us-ascii?Q?BS0ExXGUO6L+RGwD/o6AmnO4VUo/nRMzRZub1pqNw9wBrbISW6ZLw+ySe8z7?=
 =?us-ascii?Q?9AA+exOJHc5F28m4CMGOesGvGxmhAA6ufz6R7Yjihh0y8Nv0aszyiV65lo2r?=
 =?us-ascii?Q?yMDjbMWrxwUgMvOqKXQxoIxlgl464HJH65Pvls9ZCdR7WNvicYdYjcdxW19Q?=
 =?us-ascii?Q?vDP7Jpycc6riXo0irlhclqwKNdkFwwFLhw3g41VhkUdLQtLWHQwiDVgqdIsq?=
 =?us-ascii?Q?VKN6nCtzpb4qv4h9t/MCi+sGgBNTwpwiJgh3N0GPisZ+8EWCaDTHbM4zod93?=
 =?us-ascii?Q?GtKPCHlaxlW4w1la2j2Z+C7WQlGH4teMVIaCTrTn3TQX1CZxtVEvLb44LEL5?=
 =?us-ascii?Q?iyi21rK4as7ZQT/dmD10LQcwiE/pyZmrprlBtbATyoUcUfmGHzuPQQsTU8ow?=
 =?us-ascii?Q?YR30Z5bjpc1BQRpUbcVIs00vqvU+CJ2LmQbgxBgSa2pRUAhsar+n0Kmu6FNB?=
 =?us-ascii?Q?mU/Z3SXOwAyirOqoplMD1UpEIAEQ4hlp8k2lU0IjSksS2zUMeBwKwsxCT0Ik?=
 =?us-ascii?Q?lCbkc/OlsZFAgHJx8dk7zVMBrACw0XfT7cU7Ve90ATyTXsoXvG76Lm6uDv1n?=
 =?us-ascii?Q?BGhQ4p8ARePQJBZGKP0mlTfUDNPYqj6R63viHLPUl7+tyhoqgXMGVpuaGmHq?=
 =?us-ascii?Q?X7qBKgBC7YqZsuqg1H3tSqSA6SHvRc8yO+AqFkMqGPv8lAnIqiMUiFltmwNh?=
 =?us-ascii?Q?2D9cTOoiNt1zsy48w2/Tc33Hx3yRN8OECC+B8qrVAOnVCjSspODzbsUK2m1z?=
 =?us-ascii?Q?qdEfAQK81o+xgyVWYk7i6vngou97N4Pg4gZuoDylYgeJG9Vde/lpuTJrni0b?=
 =?us-ascii?Q?vcitZuXfCeKDBW+vv4NDQ7Th2gahbb0mJlKeg5Uc4nN5lrB38F7PO50HrgMa?=
 =?us-ascii?Q?bczsU92J9X/l+Oysnkmsx3GqBsP1dfEakVAc2nFvz8KQl4QHuA33KGD7gHJL?=
 =?us-ascii?Q?U4EXcFOaVBiSKRlp3W07+N2G0MsE2zeXT6IWM9C7irTBlDyjk3BGRlwJ5/nv?=
 =?us-ascii?Q?PKCXQF60/J2cGDMftBqvRjAGrNIjmi+EDYks5xUis15ypOqWspqFuUfn8Rbs?=
 =?us-ascii?Q?ZhlgLAGRdYpGuK4Gy5MrPENgFLXlQYhLf1/dWpU2l+eyUTZa/3+k82LA3xm/?=
 =?us-ascii?Q?6N4JV2vPNe0BekwU5KZk4zH3rODb3UGE2EGj6PO2v4a3tW9bdXjTQjULd4Ep?=
 =?us-ascii?Q?WQ7xJ0ZoDirgajfFzPtdRr5rT1TOhUzb8lcFR1Gx6V/V6sIC8+T1ZKSv3vtK?=
 =?us-ascii?Q?w8UXwtdj2uwcLUf/j+JBGIWSAV6YlrR037sTllLgr1KpqDyScS+482lgFyQ3?=
 =?us-ascii?Q?fecre5MccVwH6S4vSlRn1vVQfcjPCnD0k5kfqox4xjgfxV8w5ImSO7I0TxwK?=
 =?us-ascii?Q?olTVzlhaF4dGXz8iQ9/WFSlQNqjlDkojX5yXUHmM4AbMhewU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a64a29-407a-4b53-aea6-08de8a7df149
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:51:06.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oWzG7ZWILlgAm+KgwUOzasKOt5YGnMFcwPcpOa0g576yUGaLKptO6pibgDxGslJcLoueR71DYKrFyMPyc6FZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9349

On Wed, Mar 25, 2026 at 01:21:04PM +0100, Francesco Dolcini wrote:
> On Tue, Mar 24, 2026 at 03:48:29PM -0400, Frank Li wrote:
> > On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> > > On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > > > This patch series adds support for the Variscite DART-MX95 system on
> > > > module and the Sonata carrier board.
> > > >
> > > > The series includes:
> > > > - Device tree bindings documentation for both SOM and carrier board
> > > > - SOM device tree with on-module peripherals
> > > > - Sonata carrier board device tree with board-specific features
> > > >
> > > > The implementation follows the standard SOM + carrier board pattern
> > > > where the SOM dtsi contains only peripherals mounted on the module,
> > > > while carrier-specific interfaces are enabled in the board dts.
> > > >
> > > > v7:
> > > > - Order nodes in symphony dts
> > >
> > > Can you run https://github.com/lznuaa/dt-format for new file to easy
> > > track and check by script later.
> >
> > I applied with below change
> > - update copywrite to 2026
>
> How do you know that the correct copyright year is 2026?
> The copyright years does not change to today just because it is the year
> it was submitted.

At least it should include 2026 because it is new files in kernel tree.

>
> I think that you should refrain yourself for doing these kind of changes
> to the code when you apply patches.

If original owner have concern, I can update it in my tree.

Frank
>
> Thanks
> Francesco
>
>

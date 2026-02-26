Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABCF44D025
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137768; cv=fail; b=bkVjCJFOzJgC0i0N2eVKnaez5UWY+0wRJWB/BRJocGjeohJEyAFrn+xs9LyLWaeO9hry9q08thIz5aekzHqDAQAiB00j2VBKiHQpq1bmhf8czH1SAR7N73Kd5nOkafpFyk9YDt5OWggxJEB949kt4+k7Dw3ktWaxmka5E0Nqfx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137768; c=relaxed/simple;
	bh=oCvzHSoIrGpDeZ86/qPz6f0XeqzCJiD3/LLPOzelg+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BWE4k8RYBmQjc69tSsb732ROanq2KE60jQlPGoo30Ir4P1TUz9P+fhrZMRPYyVBKHbc8qZnhR45pAQplMfQ8PL1Mt8ZWKo2RtQfeSjjR5JciOR72+njcHY6Kdx3QRYnFzjhpKjLdxjIBLBajt6/dux25PYKAg4+U/c+LdtXnsu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KnCcb9bE; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KnCcb9bE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuzI4CdE6C7aEQAvkM8X49ioqw+BWPBbzw/Fnlr0KjjOdBE+0FdtCsNErsyfaBPk6dEsLviOXWUt8DCpPUhqU3qdTitJ2MtVr7Ydfji1goNs6cp3wqrISbnCsr4BUI/eJn9FMbZS7Lwxc7rAbFtbcK0hkxL/qBcwX7/yA6Me+5Zsq5qUN9dLI3PE/7ddGaFPNw288HH4IY5AfXAi3i0dfPiRUtY75tCXubRrI9ov7Qpg6Neow3LGcGswKdW9JFBHOS2gKZPNmCIsNAvYMbhwujof97dJHTqOcw7g5b9YwbdWntwPsH05snVwkjsgXtYAefp4VGkquMz7IoNbhXyLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Poxp2JWc69/vHor6nBnNZIqaTgtk/6XkLYrAWR5duw=;
 b=M/FKl8OQA5uKKWCvBD5BAWazNZY/qmRBDXhyHX3iLlnm+k4ROU2aoEPvBW+0i4s9nhjHpmBcYpKPX1185rRf4b+wC1GY6maZsX6FRK40NzglMsWlasJLosbWlUiSMAYo3Gz8+6sRN6FGmwGyOk95fV+8ZQ3Zb8Sc6BClVL0qnQ+9yN63nq+AjQqLWAwJ7Dt6qrKRf2qxp1/V+T7ZSgU4tHR4VOua3RKmkTyt2+l5rBuhGlZWV5Oi1RooZE7YmDWLUGWD3gNvORpK/5S1ez6hSlAEfuXAOgjqfy1KnUm0nYPz6/kabdUxcufsu7GjiJXDpdsJDDvKgKUdRNecQTs84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Poxp2JWc69/vHor6nBnNZIqaTgtk/6XkLYrAWR5duw=;
 b=KnCcb9bEhXj7k4bRL9NBoA7TFBcTuh4/t75+LKzb6s4u//pi9MnquDlQFEG7V2cHL/bq17LqqsBRDwc8tpqnfB2jYFnEbyIw1iKlDOVKdv9uBoo2G3IhEZWS7JIarc9jgjOLLMEp16Uhl131XqzSS4Pak0GFTKELHdtLtEZDejGmyJQmsVaL6/aF9M2Gx2RtqxBlJVZr2PFdrqNNzeNmolRf9UQDCrj330Ayb8SCvNeFsayQqiq1P/siYhyR4aplPyK4TMMkl9RT21lJzfS6vdDNpXuYyQU5+8iy8nzbv4MmdObtiHLt2kpcuFdEmMyqJHhsG8BZXxPEjgMdA7WsJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11307.eurprd04.prod.outlook.com (2603:10a6:150:297::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 20:29:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 20:29:20 +0000
Date: Thu, 26 Feb 2026 15:29:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aaCtGQHQiQOdUIAq@lizhi-Precision-Tower-5810>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
 <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
 <aZ28RtuAWcatyVAf@Lord-Beerus.station>
 <aZ4YdCIG2JIT6BQS@lizhi-Precision-Tower-5810>
 <aaCGmyqONKj7GoOy@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaCGmyqONKj7GoOy@Lord-Beerus.station>
X-ClientProxiedBy: SA1P222CA0086.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11307:EE_
X-MS-Office365-Filtering-Correlation-Id: 2183d1e6-0966-468d-18d6-08de7575b8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	wWI82kK5PwPrd88L+vBmoLRaaW1b6ybHMwaOhMlF7EdRlKNCsg/FBCUkbYP2JjvS55QPKr240Gas3V0zbOPsFYb08ud32Hg9sMMNl0O2NynMrD2k9DSTI+jKqQirb52/PG6nbJy3l8AByt2U1zAVfPi3JZX/ttWvcK73odpTHtb5ruc75GkulX1tvIs/bBBZXw8fctQ9hbMZp2tUMEgfjWIa/3SDpm59/jtXBeDmnqbOuS8Wo5s1unxiqJI/DSs7v+4ETcD+P3Vh1qhcpCcYwUF9NFPN4SHQAMxQo1rtqzA9fxlt5wJ2a9mWAARh3QlmXitcSSPgVPSNyX99Ja9J/IIvQeKHZEjbHYcg9MeaeRljAN1WFCrUuI2CsW2c639mLieJ/mW3jBDlGMw1fQ4Y/lRDtkJYBTe5lnLwA0f2tHq/lI9roXsrWJ+LuCJ5++P0ANwfGYNItK+BTPvWk1rz0Ffp3hBcjqfjMjLDzz4GtC7w8SnQG9opFFL/TgrbZzt6yEbvthnpdL17rD/mimTxkCkXnSr1CoSiJSkNdvlzBuBAMIN1mPcVFVW1k8fRzFxTrs1iMgnvKI6M91IK4Ddp4I4vEXaDHlRjszDcEOhW+qDfiGGS4zB5A/ijAG9uyHA0nklVBe7bv8HHbpLI1SRhoSGxZ1edp5S3rWl/yJuHNcanvsxAi1WD9MmjQmjOTWG871uUf1crUkV5bzs5N4DfpyXURDeFgSxB7QH/8YXjtA2L67gUsybqMt0yPq6a8TOhTLTT1tiXP3LaiPCCbzxzK7woKPRsT0EB3YDOQoqjAd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tOIMViNLQbxVf8GcvyWDHbtwW+kNr5INbLi4x3NQI13cwN4YspEZwFgZi22j?=
 =?us-ascii?Q?PcQeW9IaHNsUiMrKmcKa1nEfWtvJvT1YteBWEZiLFVwRGfWHVDxsHpX2fP0J?=
 =?us-ascii?Q?JfOQIAiN3wdqnrFChPDTKPwzqcS9A8tgQM385d0ReFu1sQ+kpnFjNsOl83ox?=
 =?us-ascii?Q?NwCvP9jhFpeXpfDBbNA95aNSRvwGduqpkO5/scobEK2d0IjcJskU/2SW3Oqs?=
 =?us-ascii?Q?b3tf+vKsnb1q0zDqhxBBCyvd0rA1B+yorTBO7DgpwmskNtjf+c/GoaC5HFkm?=
 =?us-ascii?Q?nAsE8lmn8XJ7HmT5Y41pTR3SogXxEuBuD4+KSJDIgcQ0ZmJ02NOKHX7eF/JU?=
 =?us-ascii?Q?K2gXuBEbVPP5cWNHQvYvXeIcI+mEpveonZocjnef5XYVPW+MatfZ9UhBtwzw?=
 =?us-ascii?Q?QT71k5etA4xDj1ynzgEqL0Lutn207s7EqLPQBiOoiyj2suQ0dvYYCs7HS+ST?=
 =?us-ascii?Q?A0HrqvSazkq29qDZl4AeacSywioZ/CzEX2vDVkTm7qkGkaGAXCkw8MWJw9kP?=
 =?us-ascii?Q?EITGy/99zCGlGj3eoCK8reKQGzwHPk20hG4jb/IaewES3DfV/JAXtYkw3s3A?=
 =?us-ascii?Q?DAviSX+GF5/pHlkfMl4XQxqiGtS5eB8FUkEPBjL9aTsa/xU35hPhyGeBnHJx?=
 =?us-ascii?Q?hRNeqMaRtjwhcJtrySvlhnSS7T4CdtaZJ4AK+LoPHK3OSGEwj2usRYRSF49r?=
 =?us-ascii?Q?A0wlze8oYRSMs5egwhUbnhd7mFw/e5ebiFaLx0HJv01NuCjccCjR7QzCXvlC?=
 =?us-ascii?Q?GoEWZL+U0AqugSK3PlFlepPDHC9Hxs+ESm05apARDxDKUmX3B06HhrOKiE7t?=
 =?us-ascii?Q?lIPa/nFwvJ+Tl8d3blvewOKWm1kus8JT2sYed7bekG2hssimvP2a6DK5Fln1?=
 =?us-ascii?Q?DpYJYxE3NUGgkotnXu5EmCYteGhRy4/HtjXpCyWUuCNltR2gFNa0xAX9MyQq?=
 =?us-ascii?Q?injuBZSIwbq8ZNb8y6JL64N96uAeYMSBvusMX364/UuwkyDcICQwvq9LF2IF?=
 =?us-ascii?Q?7yEH+0jg9kPAY9F1ll3bJsAsKp80Ql6paOUR4qvRY+XLF/6XNhQBoHssVy+d?=
 =?us-ascii?Q?x9OV/WqxQu3dUS+a1ERl5yuT2EmXREwHkzMILo2RWHhjaPMQZyh8fGsPFFkC?=
 =?us-ascii?Q?a0TYWaO4dWgkcC9mYX8CY3uTQhpvPcKYdN05YRz7WmYQpC1Po5HQ1VsygrMY?=
 =?us-ascii?Q?MUHH03ONyjJHMuYOhDPtc52b9EAG8SLCL9Wg/6sEy927PVYCBY1VGZc/4FoE?=
 =?us-ascii?Q?5yQgfZA0aLmpzzOoGRKPaEhoUEQqnEqjTN31sUAbfVnIpeE82UDfdPP3jR0H?=
 =?us-ascii?Q?PFWOVahgHCmwstSjssnrmELbHz3fs0KCZEOaiKrflVBqeD/WZoKfn75/jfoX?=
 =?us-ascii?Q?eMCY5t2ZZfocRdRIR935GfZHp4i7DUJYhBNWCmTNDEbwrHM4ulqgco5k7k3U?=
 =?us-ascii?Q?QhYKlYBixSNdOO9BLkTLrU+TcVYpMUbS5MlNbGXTlftG2RfKwsv4C1Y2dnYJ?=
 =?us-ascii?Q?ZpH3om+F8vigDHxYjHA/f67AN7R00E3OTADDFeWTa0IOfjKj5yVEoimUcMsG?=
 =?us-ascii?Q?7P8I2b3rrowBuG2aTflxGmJIlynTc9RNhLvS2R9e7vNgIn9UuMYSx5QfPQVk?=
 =?us-ascii?Q?FebqgmeNfWBTkwV92mTt22ITrTEDX3FfYPeUsm1PjkQDWwTEFQNqPuZXBlo1?=
 =?us-ascii?Q?Bc+MfULWDz/CJyqAFfV541Uu35kDWdzH4+t7u1O3bN+gKKGd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2183d1e6-0966-468d-18d6-08de7575b8ab
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 20:29:20.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVmSuE1hNTrMMkv0W4QvXdc6eCioO09HOEcjuuvy5YqBxx+thx1XF+4qjGVHd4JIXe507yfQjIvLXic5zZEuxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11307

On Thu, Feb 26, 2026 at 06:44:59PM +0100, Stefano Radaelli wrote:
> Hi Frank,
>
> On Tue, Feb 24, 2026 at 04:30:28PM -0500, Frank Li wrote:
> >
> > If can't auto detected, I think keep old dts, use overlay change to new
> > one.
> >
> > For example, board.dtb
> >
> > you can rename board.dtb to board-revA.dtb
> > new board.dtb, by apply verb.dtso to board-revA.dtb.  Or you direct use
> > board-revb.dtb.
> >
> > If change is big, you can create new one.
> >
> > Frank
>
> Thanks for the clarification, I understand that the preferred approach
> would be to keep the existing Broadcom-based DTS unchanged and add a
> separate description for the IW612-based revision.
>
> My only concern is avoiding confusion in mainline.
>
> The Broadcom-based SOM revision is obsolete and no longer manufactured.
> All currently produced VAR-SOM-MX8MM modules use the IW612 module, and
> this will remain the only production hardware going forward.
>
> I would like to avoid giving the impression that we are actively
> supporting two parallel SOM revisions in mainline, while in reality
> only the IW612-based hardware exists in production.
>
> For this reason, would it be acceptable to:
>
>   - move the Broadcom-based description into an explicitly legacy
>     revision-specific DTS (kept unchanged for existing users), and
>   - update the main imx8mm-var-som DTS to reflect the current
>     IW612-based hardware?

The direction is correct. Just try to reduce duplicate the same code.

Frank


>
> This would preserve compatibility for older boards, but ensure that
> the primary DTS in mainline represents the hardware that is actually
> produced and aligns with the rest of the VAR-SOM family.
>
> Thank you again for your support and your patience!
>
> Best regards,
> Stefano

Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED785311971
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434237; cv=fail; b=AaB9FjKAiHlBG+J7iFZdy82jcprJwji64uCEqY9/PngDR2tZFytVYf1Z+WQTl+rDd9T8XLgsedmEvM2NRftO3Y0jjwHkTQkhg5ubIRNT5sTHDJep8uwLFS4gqizvZg5rB26Bb14ivZov3tYZXK3IyPfFIKDOq/9WANLqXwhUKv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434237; c=relaxed/simple;
	bh=AVFnDzUblkAPyjNwn2wGUfPwtEZxxfNnEcSDG52ugbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IMEDgYu6x3tqE6nVNp8S5AjsmqPsJBJ0FRIdY94fNkhMzQJaPHc+OuH3sfGb4rTUzw1hEudBhGJFHFzSuv0+Zm22Na3c1MlKIhQXkkMtS9nrMiRRisKruYLDiDY0yy+9p4GwDPHsFspju6p/cz3gToCpMI6k5A8rHNJ6eF+8org=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PAA1EdYI; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PAA1EdYI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4STYCGVxN8lYhF0CGujezlkXqQXFQN2BzOoqm5jeSumJRGTLr4CSDyAQKnuk1FgKxS9d0t0QZEx+SjpT4SgfD/qXDzrb3a0BvM5pgcoDh7jPq87+ce2iQ60jNomSXrNpBbjmzKJu8TQqhiiTYNbIY07ZY7nGfd9dSvv5NHbe980RV5Q9kegClN1atZAoxBACzK8aWciu0QY3pAKSe720rpFDQ3io0/ZFTIZx/ArFL+5nbs3oSDInyFDsc8v9qG/MTvx/xA0ck2t5ok5nAUe8zeVQbA300KX384WLvpcnVrWIEJahBOi7Uu4QaBo22n2XAZXYFee98za+eI3zlpE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Poa/i7oN/2RKd8FU4Dxh8U9AqbPQT5FGutjA8u89UDo=;
 b=ccYrYOn+6KOD4mK2wK0RTZjsAEBgM06nPo8a92n0isESAIWVbPQvxu31i2bPHJm+fxUAdZQwWFumFsC38Wyur9R30lkGoz1zPJDUVG93vikvsNrO8BUQJK60txAg0hxpQqpBFggWXhFnbwNZqvQKUTP58dRbhdPIcp1HFPoZcWVAqrXvEOI4FAtgN6ggNJH2t8y0v1ufMbj+rgQpnvQs70CnAKwyzbwJDpRmSSrj/dBefmTXxgfwX2cTUyCwMbRUrMTtxET6wmXUBtnkRh1/wa5hblz266r3rTyjCSnwC1nIzpODYGyQwvwOo/FyMKW0T0qVRiUn1aQ7bNC0ykUnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Poa/i7oN/2RKd8FU4Dxh8U9AqbPQT5FGutjA8u89UDo=;
 b=PAA1EdYIqyY+oGN8V6NdPlyPKf87xPhe5Q7BA6954TD0mMYgV1jq9ajigG/tWHFV5aKkKGM0EEPS6KBozTr8xUoEMI3db3htwr4pLuNxYALvkxpfI9lpmnjeVw4zKAwxgP9ymwDjfkljkeBlqpyS2JddYsZrYk2dM9wlTjztcte90dwPK37dq8G9SJiHyPVxv8x8oC6kul+4gc4LVlaNV6jjPznMCUwVE+eqt/o0INldjpOHhn9rpvzDEyogsQwpaE/SOWbVlA1YTNvkail9xQtZSYXgAkvC+BN8wtsvJ/xP0Hli7qxHtgIv3wmRBR7elnVdqO7mlJQ5vEViZE63Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:03:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:03:51 +0000
Date: Wed, 18 Feb 2026 12:03:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
Message-ID: <aZXw76CuH9u8csFk@lizhi-Precision-Tower-5810>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 93adb8a3-5bd4-4e0d-f6cb-08de6f0fb0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ly/oHY+kTOP0R5kBCQmynPY3TnIBz/bbf885LZs2VNke3yXKK0Snlrhv2s/m?=
 =?us-ascii?Q?YCebU2P3cOEmjQoDn+QvzxhnI+NyUuboLHLkUhJBjvw+k8JWNPZbKtQ5LOsn?=
 =?us-ascii?Q?l7UJxH7TKoEw7LAjz68r0J7COT7EqJa6Pe/aJWN9E1sUQlXyWGFmWUrVvoPS?=
 =?us-ascii?Q?HMlSU7v8JiGL4BbEpX/ZKIOjzc2e7zjFH1pmTLYWYMZXSB0iy+Fj3mKhI8e/?=
 =?us-ascii?Q?bFg8IIRfP7XMD6BYF2K+Bfz4s9r5qjDatSmcqBZ0tgNRpJodfosvgQ41gNHI?=
 =?us-ascii?Q?jTgjFn7JDlBfDlxQh/0ggUEwB24hQiCoyovZstVZevGoI+qX4WSot0fSqGvS?=
 =?us-ascii?Q?Sab3iE5CA/oiK/Xj8hq2clz9uweP3rfGVJTxOchvyJBx+c/GuhB3XmqQvxDI?=
 =?us-ascii?Q?pL7+0QXMGVle6GnM8Ce5KjEm1Y07jSRSqgpOugGNmzLs32/BM+M0jnBzg/Be?=
 =?us-ascii?Q?NFIldNOnz1cRs5rEzIpcVYyDoQVfvUUs88TjFSaBXbdrtGqGy1i4aDhEADHs?=
 =?us-ascii?Q?vBJ50t1sxlRg6mgVzkMZD7cEfznTUMrJkLWVZs8jFnD1ZlGJTwd3ReC5Gq7y?=
 =?us-ascii?Q?E0FvtI6VzahwM11xzRrBxpWkTXPwiqWQgqC4uwurM5KVl9RijUC9Ny3TNy+Q?=
 =?us-ascii?Q?u/zJrr7d27cwB+ff0UdKL2VR3ABam9qTtKA51uG+Exc/B+tvq4gUxVbwfncS?=
 =?us-ascii?Q?e64sm0NV23P+5+nB9n3jMf4PDjPlGxhs2d6Hi4FfAT2XgPj6Uon8wze1Ebl/?=
 =?us-ascii?Q?lPIVtRWHi0yhFxsijdL2mBDCBdNrO86f9VhTYqv0AygZ8T1/u6q/o45wAYHL?=
 =?us-ascii?Q?TJsDBXuAbeJ8wntpVDqIrsWFIgXjiz7KELkyp+lOK+gc6pap6o/4+vQwUgf8?=
 =?us-ascii?Q?lg0QOPJE5D8GomKF+pIhi6ar4jBVdjmZ+a/GWwRc1l7u2gfYzuRCISfzyxeS?=
 =?us-ascii?Q?TJ8noPJddVZAmUI5NB7i6tCKot+sOUwinDndVFmAbNXNmerK0hOAjPtNPayw?=
 =?us-ascii?Q?g7VwvxXaBB7yDHCjDTNf1FxSfarQlreKD3a3ZPCqR7XnrP+0yV1GciYsX+8a?=
 =?us-ascii?Q?jmZgm9zBR5lZoRVU8xh3SxpNh4hHsU3os5sg0RNrC+M8yVc0+10bd/iYD3at?=
 =?us-ascii?Q?SxnvO0fiJJZChZNakcLGIH8lsOZUmFDnFkfob30FZcbxXyoqJPAF9BZOM9gV?=
 =?us-ascii?Q?PeQVN7GHEyBP8idH5krKNKrJ+HaO3x1XELfkPvC16q6VP3SI47Gs0HssxvVs?=
 =?us-ascii?Q?riPEKvnXEjq3IHwnyfaVVlEkAL4APGOO44FgZ10qCX3w7aoPkpDYwzcQqu/j?=
 =?us-ascii?Q?9dy4sHrm8G7iyqBldfVy8ZDrH3iA2vO/OuPjzCHxrEz9lZK5d39kyAPyq9lm?=
 =?us-ascii?Q?b6lnTnxgaHd819AWlbgF8QkumXkusPwlEtTtWsx48Z+/lEee+LQM3Kb0laow?=
 =?us-ascii?Q?9qEqZhRXeJWTGN+0QTiAhqvmxbunyHM0S5sRaU8f29hkIq+3jyJi2Pyg1gME?=
 =?us-ascii?Q?J06aJs26bFNAGyH8KWgA4nI5byPPQzjvILEU3mYCmUSHCYkaySwmw+NkHi6f?=
 =?us-ascii?Q?gizxu/w9s02wc4Y6nGnC0HTsYuvUyTky0WZpecc3+U0vD4oPtORidYOHt5re?=
 =?us-ascii?Q?JQwdQqyCV2CFB2keqUNo0Ug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fAu8rO57pxAG+lAYuJl+A6f/ez948HAaeWPmrZKQaBXaPmWhbe6j02qTqBgE?=
 =?us-ascii?Q?vTP+0exqBoDsU3xGBSoDz5xDwblv0NI5aBSUTKMhzm8PTH3bBEUOxCZ4XKWl?=
 =?us-ascii?Q?A0KFdHdhCJ9W1mqG1/07KNEVEUygKjErXtIHDT+BgftehFTviNl9FFge4dWG?=
 =?us-ascii?Q?sY6VxnKRyvrEqulxBKAagcsekD98LkxfpoURMmGz0VSiI8tl4H3EM4mop8ZM?=
 =?us-ascii?Q?GKDYSAdWE1MfozPvorFDVA16HkKAkThjdWXNjaXR0Z3Qdw3Q4wHoXyEXYvd0?=
 =?us-ascii?Q?UV/6FBe8cIPnfkPkWfBk0BPhDyIBf1ujRFnJgg9z48JnbJmL5tE+Qke8cBDe?=
 =?us-ascii?Q?FO9kARSq7KWTqrAHyVAsIGE3f+8JzlFBlaDrYdHKhfrMDDPvbB2whqy4rnhP?=
 =?us-ascii?Q?AH0Ddn+S8y30gA7OC45kzscgRzh4Tn8tAirem9h+ara8AOk9NeHHD9Zpg4M3?=
 =?us-ascii?Q?m28awJsVzLtywSm98dclDIGtO8nWLN98idVYv6LxutyRdkA+nQrP9OTiRVMw?=
 =?us-ascii?Q?pO/9MqZQsBddvmbp780Rx24kyj6q2D497Nivn0bX9xB629wIAAE9huS5KJFT?=
 =?us-ascii?Q?uhy9P1Ouc4ju7MRM+rT99vhGqLwG+WbCP64uJy7O+WNdktaqMO8MbABm8M8b?=
 =?us-ascii?Q?aXBxXL4QZjGrzHENnTZGTAK9gnj8u8HChF/xfyjdL4BTP0QCHMjoyXUlcpzQ?=
 =?us-ascii?Q?IdBghrdIL6jc/JZe5mDS84b/WqQJsI3gCa2gpYmAX8qgnKtH8oRfjh/p+jz/?=
 =?us-ascii?Q?aLqZ2/ajl8XzkYnIv4vSZzgltDh8iPkcMcOiz0wQ/34Lq1QvKhidovyZMPWW?=
 =?us-ascii?Q?DfJrZjAv7pRO4kOaNCxm6gaUuqqSeA9SunsA5yDdH2LWC1WdHsbJCnff4Ee6?=
 =?us-ascii?Q?TFvnRoHIt4M6tZMB8TlUTZEufBatouOK6nd57xhpbzSBNeoTxou5YACwgdWJ?=
 =?us-ascii?Q?GUi3U7nNbJqLA6LuAsxrJAwSBtn9i5qMkBbbFiAAU+Hiz5BIapGbvSRGjljk?=
 =?us-ascii?Q?lbn2SBkIPvUYoCviQcUA9HTz/NeqKR9WY5EY0XtrIXpZiTlj1zIiohU8GADR?=
 =?us-ascii?Q?zpu3npOZrodWe4ZF9itbo5kNuMyxMx6hg9FTnvdZYpZy0TMSAKLGCwkl8bRD?=
 =?us-ascii?Q?QABSfwRF+Cwr1iKuMGb0SO/0h3Az5bNXtz2IJQ7tQdsUfPQWMHyogVbmeVOP?=
 =?us-ascii?Q?V1V8MyGHlkgGTEHZ7szI2aCIoMZk+k4k2nbm+htZvRBJJU7O0teoNuNcSU1X?=
 =?us-ascii?Q?6guauMxRmjNH/cIqu351NXbnBvn+78MBH4c4euYNLmjwiDLZHVgqgzCRALhH?=
 =?us-ascii?Q?lUIUcx0IDQMZt2Sj9w9V9Wt9BRRmI6IPvF+7KaXF1iVHS3R7W0DnyDdZrSC1?=
 =?us-ascii?Q?XqQGiv0jPTX+rTedEKAyeL5mutXc+R+DJouihQvDOVAX+efXCfQxbQvt8v5s?=
 =?us-ascii?Q?FEfHigSkC5eZwrWsYKzqH/S9TdQ8nxMLzsxJP9vwAwEOQNvAuzf6zZlM2LA6?=
 =?us-ascii?Q?MQBbo7FAUyMEaTMSfveaFF2TuPU1KNBJ3eed9jhBcuUy+5Vaif2ya4IdoDBC?=
 =?us-ascii?Q?5eqcwHqRBRT0E8L0sDUk5mxqEajsvtO3u7piKY4ehBPzInb/XIaL9rx2cn7M?=
 =?us-ascii?Q?3Z7d8hx4YN0+sAc/BERWlzDlgCH3utA3XMZXX8jpQUFnRoTACfmbmuZbYQgj?=
 =?us-ascii?Q?txXMC90VQILzIHFsuArXqftRdVs9ZzWV/nOT8kNV+E9ovQgA9L+hXN0XhDJ3?=
 =?us-ascii?Q?J/98j6aCJg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93adb8a3-5bd4-4e0d-f6cb-08de6f0fb0cd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:03:51.6535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuCe7UsZIvT0Luq5ubxWwRtrb1CKCdhjHjxQFhwz72XBE+ltTSMAIUYK7f8+TEMOMIPmu57zLT5AHmM1X7PS4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On Wed, Feb 18, 2026 at 02:23:33PM +0100, Max Merchel wrote:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Max Merchel (4):
>   ARM: dts: imx6ul/imx6ull: add boot phase properties
>   ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
>   ARM: dts: mba6ulx: add boot phase properties
>   ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems
>
>  arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
>  arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
>  arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
>  arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
>  arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  6 ++++++
>  arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
>  .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
>  arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
>  arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
>  12 files changed, 33 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>

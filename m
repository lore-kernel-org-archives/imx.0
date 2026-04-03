Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0922FFDDE
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203265; cv=fail; b=TYjSmLfN4WhmpfkfpX5wqbCeMutV1vaX4MyLyFaiUGoe+HlAbhCX7HPIz6pwxIpsb2nrxZpoaJXvYFwmjeBFE3XDn9wUKppHdG0cSCjDuIxIJgJA7v6AwBfsSI6N/9A+BQ5YA9C0/yXaArNWNfkhNTUHH+dA7nFqMhuZkFGftD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203265; c=relaxed/simple;
	bh=phHHjhhW/EZU+6uSoWt0rWfhHV48sWHWqR0h4Z380wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q9lGf/23YJ3of3a3wyyJlYgeAmUpoa7UyAUEr9RiPoE/z78yMVjjn2mdsHmWE+S/tjwv0KvjydNngkgPE9R8z9RxuYEyrh/a9GQyePpCQQMDb47j/qXzlbwARbgeocTpCmgEFFgkyFe+dk8rNSIbziXYT1EKecQINRZzi+bwGww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OZ+VLQ99; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OZ+VLQ99"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5lHNpzlIoJhqZQ+0CV4DgQ/9unla1q1rniPJjxAwe2fwKIL6Rrgey8Gc32G32Ndi0WHL0SFo1dJmiWZUD5YpEaG571g66HQSiDvHKi+J/fLD+n2XCy9ty942HpjiWRs33uY/MEyyPZYiZeZ5VP7sRmMvZlurR3B6vKeUUB5l7X67P7W+832XGifWDNt+SEl3Wa4WI7Usqg9cQ+zmZOlBclqMitLZYDaTiqyG7W4bDXZzngPMpaAPYvpul1gVJwJfY8KM2STV6hkFJchPMSDner+r84sy8jB1dJx+JrvW5238ibUGw9Ek8NGnwnbWHKN8oedeaCNgxNDa0eLfHJrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phHHjhhW/EZU+6uSoWt0rWfhHV48sWHWqR0h4Z380wc=;
 b=esKzcc/U9YrKXO4CCtMMLDDYzJN83T5nsocD/xdiR7L+T5PPjNmXECsc2bTbSErBUBai6OCKs5HtvXAam97sTQlF57vx4zLPRegV+BIcs41j96qiw7nmX2CHuQ2FruhbRYFzST1g3zGDN0ww0VISZWF0GlW6OsFylYKMF7h5rsWn6J/TWL8OCSg43XTriK3WadKMSahaZqS/J++t+drXe5bX9LdomoF45z/B6eQATItldVyQp2XFBAWzWI5us9sak+nh0pEAI//PygVD4NueceioBVnysPjBgorhm50Vk/Z0sJNj/B+q+iLDyR+f71MAA9RYYqiW4knzEOxVlhjlMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phHHjhhW/EZU+6uSoWt0rWfhHV48sWHWqR0h4Z380wc=;
 b=OZ+VLQ995qIie/vILVrjFjia63nVQslcN6js9jejDVM80+cQUPV7XAVXuY+7IChHz8fLIwtuPfv64dckS0DtRhaswawP5NZMIF9qeJ0UGwBtxBZiNLIQ4nvox0gpbUQIEoX2crGq7aAjxW9bgI9d3VIkwQHt+nvX2Ds9OFUMS9zjelvDo1fMPhQm1O78XPMY9KSIbcDPiAXAdzLTEer5v1aIncfWbfOzViGMlJ2StLjM2FVnGQriZRpYUDspLprXUYicr96BQGbO7+uEpHm1uc4Pw2IoOYvWw1dAvLzUofaQr1h8e25uKVBr/yLBKROjgnSNQv89wa4sI6pfK8mUYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9296.eurprd04.prod.outlook.com (2603:10a6:102:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 08:01:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 08:01:00 +0000
Date: Fri, 3 Apr 2026 04:00:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaiIdS0zRPBY81aE@mai.linaro.org>
X-ClientProxiedBy: SA0PR11CA0144.namprd11.prod.outlook.com
 (2603:10b6:806:131::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9296:EE_
X-MS-Office365-Filtering-Correlation-Id: b2687308-601d-4062-0c43-08de91572504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2jKzByFcRyObKoo/naQi7HL89pkIFNaW5LJm39SmVQMkZ14YnPnIQY4ycyRofuPdDhhZqrfj8ccFKZfEvu0Ik7u/1aXfTAo7uOQwNZvfonLLQ37xW6Yxs8DePU12sOipbZ5UV1oqYDtZ0A0nkXDMI9sZiR3JepnuglvX+Qw2t5PtXi73/JX4nuUsqzv76/Vx9WmaAmBYNCQYqkDz3v11s7kDw+7t4fKMbm7GGAJ1AEMEdkFpWl5tm9jlnOS01ml50Vj3qd+PteVv8QoT8HdXT/TOt0nj/jGLtT7QIBv4jYPDElF6jIzASIWd2wPePCmLaXaE4ahOJVz74VNh82XhJngE2ooyRCo9IIk9+JaCMyK6VWtohmDyTK887Pc3mXrhM6Cx/Yn7KIuJ0F2QdV2JRw34X9Z0YuU0HlYX6hWfEOZslLx6aU3H1ABaKE/+1Slj/pg0R7SC4atvIV53CRhozr7TNcXdXFP+iInFkO8fAnWNd2DyDtFvMK0jnuKpWmQGP9jIwy53hOJYTKt20+zqgA9WhIOrloh6bzELcm0Rg+VpLSBWg2YAYHudOqlTwBBwHaY8SNKhwnjNXDdZtuyOxSwGt4k7+eP5E/iRo+qsHFV/yHUFrEYZO1eAdOBNUsyDOWuEJND5bgVXD+DG9QJUQfBT1vFfN7tAc1xHAlaAHIEISBJJDtYuikVOA4VJuq15FUtMq3r2yovBZNi/AYDXxQu55L5czWDuBDa+pLk//yC3fvMwW08HaPdDo4gEHPERzu3seaT3yYs6+3Koj443ojAOoA1eCHMdMScrT0rHMFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/56+ZQkjlQbydIo619Cs9C0lHPw0RMg/OG/HyIQnvphi0JR/O7Rr96ff4ePA?=
 =?us-ascii?Q?wzUQPwA5zYxp3Bpi8rz5zu6ukVylPHfI2X0+DFWqN0eYZIwk3iEfR6xz4hsG?=
 =?us-ascii?Q?gT2ft+by2IEZUcH8LD31vjSWq0wJJzxrqgDNkmAtxyDuTvoLzcqoAhWGN++o?=
 =?us-ascii?Q?Np2Wsheguavynj4Q48gS9QtERSxCMUz+dRKBgJJVgYhg5sO9SZImD39eZefl?=
 =?us-ascii?Q?wA0/HVaqhDjof1y9xNFxC/fHj5F7qkG7vklx1djKVamAsFpoZDTUpXNsn3/E?=
 =?us-ascii?Q?UQE/Vbh38RZl7Y72NxGuE+Xq+cFyCQXFv00u6cJvvV3WJOKo2QPQBivhqsDo?=
 =?us-ascii?Q?vBD+kWCJ5cugsl/GrYRH0VD4Nd6sU1rxquwrR8NdivhWggwRXP5+qbmk6PvT?=
 =?us-ascii?Q?1/IcSd5xhgbtdjmZd8OYegwMMy4C/75BDgPmF5EjEA6MHI45rR2In7JI/DTa?=
 =?us-ascii?Q?vA+ViudZgIkiVoUB7WjBidBtzoQ1nQ4dkU3hWd/sHgv3EKD2PgfBcHQxPU3u?=
 =?us-ascii?Q?GjDCyG/69wFpxQw5/Qr9M5pGch3tS+jbGpRdbqv+jQsXWE2iYKHpT9jSmNu4?=
 =?us-ascii?Q?7tAQuuTdRoF4yy1kWczjWY/Lxs5P7uOvGGwjrSGAQ6vX7XoM6w7fvgQJ/IhG?=
 =?us-ascii?Q?SBxDg0gyRRqgvdaFPKwjkK9mZJ8VKbcyYoaMH8VLRVegmNonWPS+Ed/2hHqb?=
 =?us-ascii?Q?bt0APtgWnF5VTe0PMRXOEezVp0xAtUFwH7K/KyehT4yC6cAayaQEpWhNLNXN?=
 =?us-ascii?Q?uxykhlg2dbofFxf/FAgg4pyNYONoCAEE+RmqFB/l+PhAw/Lo/BVml2jUhzO/?=
 =?us-ascii?Q?eSnuFkW0EkvIp/7xZDvdXeyIPO+qrMs9ZDwfRd2jeQNF8EodAf9Ke1+sNF9I?=
 =?us-ascii?Q?mxl8fA8uwpmsUqYdyog41BwRVP9cpK0knhe7MCNmhA4Z1eGNYo7bnayAChMR?=
 =?us-ascii?Q?/XVA2wcrkF6cSnQ8WK3B09BNGrwxSP1qyo+zvLZXdMoDUf844lCxRwp9j+nr?=
 =?us-ascii?Q?fo+2eKR0Uut8KFt1Vy5QW6UHr324RgtGc1uFt5i7MTbO89W8p1KcmnM0b0Ck?=
 =?us-ascii?Q?ts/6ySr/dvSAjKMwEoU6RPjHklkIkwWyzJVT3hZlkuW4A0ZtkndYKnKhI8fv?=
 =?us-ascii?Q?dZk6zDPFvv/gpg/72aGzDmgXda7DWA9Yr59sG8PDDEq5GamU3JQ84cGPpPHk?=
 =?us-ascii?Q?lJRV16yo3MLau6vBen94ZK3hhtWqmDF7uhCaDG4bOB9Cva4elhIqb1WD/MDB?=
 =?us-ascii?Q?z+HZHzFqlJ1NkFW0SkDFR++pgn9qZ4dAPnyzYl2sQPoPe5tuUsbjdjSR6Bfv?=
 =?us-ascii?Q?78zf5QxgKFIf0DHl6NY8r5bRZwpLQ4ULJ3Rh24sYdGptLTq2gH5CIFdHnklf?=
 =?us-ascii?Q?C8jpPpePmieosWUIJlPQNRSXeRsuVct1XTRXAndejJKaJZ5QJ3jKENn1irEz?=
 =?us-ascii?Q?+1EQFoGr9M9W9sHJ4EmlJ/flF0RmGK6RoTAvMA3FZu2ORPmsN407Betium85?=
 =?us-ascii?Q?a51YTLObKA8L/0l7lePVa0aADKdswK9OsOpFbkzU5CMwK/lsfUjPvsxmYuSy?=
 =?us-ascii?Q?Dpf7m7NK5yDOoCw3Wua4s39Cdmrb55qjrL9BZLJqJza3gKWDfyO8Yn5C5kxS?=
 =?us-ascii?Q?xdeLl+H3CWwAwgs5x0j1xoZFY32qRMiHWyX5jGideUHPyB9inj9ZIoo9OrMC?=
 =?us-ascii?Q?RP4HbUGysULYS+pkj8g2x4sK79wOLLSUV1GkSpM10n/rb+ugA6ovS6FiVIKG?=
 =?us-ascii?Q?/QQLS2REEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2687308-601d-4062-0c43-08de91572504
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:01:00.4305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaXcg2IIMt2ALfUTNjwtqaJXvTwUehI2Ude8ZfPhykINPfV5PWTqIwnWQIiRIICz1sawIELVYXDNYp/vyjKsZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9296

On Wed, Mar 04, 2026 at 08:31:01PM +0100, Daniel Lezcano wrote:
> On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
> > Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
> > arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Applied, thanks
Daniel Lezcano:

Can't find it at linux-next master branch, anything wrong!

Frank

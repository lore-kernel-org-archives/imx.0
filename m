Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD53F8235
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341063; cv=fail; b=DGbZZA3dEeTdxQb508yaR9LoPteLrw8TFeCxzFBL11E0YEgb5rV1Ft0lnXNpkqOlZnlKD4XweMWoVo0v8lgODe/wiDiZQWrk2Y2NFB9goF6mZkTZFCVsmYBY3WdAliEiA4TUrSNPuWu6uKEuz2u/9+88aCo3are4a57vge63U+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341063; c=relaxed/simple;
	bh=e9HINSJUYfHZC84sX/GFPqh02OUEmnX0WE7ZtLfM4/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qp7bILUqLfKivqHjoJCq5wIJUchM/z0Yo6bLf0htW8bhbk68Y/WyCf9aVALXLqG4slRKvpYLGAkPhaCYr+s+Yp7d/3om/MDuwDsPfIITUHyB7P4H3H70xPMn1lMLUB5IxjjEHPjMhkTW7iyeTIawfs4LKItZbcgMmaUxd7oSbw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lqA2pu7e; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lqA2pu7e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+X8WqPCEAsAMqdxrrypevB3UJESvYeu0KUqsmi15oeMfU8avrlo1oY/dxjgK7RxcEgZbYOAGtEKgIsVgS8U82psnXV3N68kF/x6d1aiEE+vAsvtaMs/kWQh718BfFHjsrJDwa1FZTXLIZsX2KGuTk38TR+KeQKndTkhyr9ZzYCd2zujiT6GdoTrcenRoovkjAuW0Av3bAorDr3WNsSnelsgQMV0Suqtz4Yd9fV1IawOK/KqaYn/B4Y2bY+5h2t3Q76QDRlNx2S32nEO8upfgOqeSGA3Q/nHMBTrLbFqwbhdWRpi9Gna6uBKpxSVypBivUoQpEpdF4lxYXwhLTuKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9HINSJUYfHZC84sX/GFPqh02OUEmnX0WE7ZtLfM4/g=;
 b=jyfuIzkQKbnfDQafhi7KLhINLqs90ZJJdjlDmIy+hEB7gg6fijHTmRIGqlHRPj5tw5IXCEfg1FIDViyf70wiJXVeWu4NMggvAv/V8+X0oB1jfZ7XECFszjz8B83i3MMLus+3jHw2Qni5sdODeEYV7FO9lFUASHAWktCR4TQV4h7Tq3zUWmZh0zr1ekYm4ad7HObLG6g93WU7QpoL6DHuxOlNgB2bLqWiMjjl4G5r3J0kr3SG+TnZkD3DAWIDNLjD0IoXBvCMAvhv4KbTTRVHWapH30Lft9dGXiirmOVaXxZ0zxQg9Qbgk5flzrxdN9Rbawvdv/mkltkd+1kka07DJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9HINSJUYfHZC84sX/GFPqh02OUEmnX0WE7ZtLfM4/g=;
 b=lqA2pu7eGY/kvgH4YVxZqy1gUcrPgnxw1+pMn4C/RWpYc1nh8HBxM0Dr2bP7N9QHOszx7yzXmQqyGD7DXrPD2iXzQqapinMoYQUL/VOZ478oXrG1t+2oBiYA9S8S0faKs8omLj/8pVnG/UCVjOOeZ76nBpqFDd/KoB2jXXol7yJcgpbxHq+rqZEhrbap8cr44y++XZp5ydFTlXI1l+DhVdGUZ+Lh4J7T08xVh2huOIYwclhB2Upja4MTvmjGT+nxTpjT+Pdae/ZI5jhEyIqXX8wZn7s0DXs3rEelxw8EPVZTvd4rHA1HVZtMxEIy2cfbsbwOQCmsAoRv/WeizmKdyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB7698.eurprd04.prod.outlook.com (2603:10a6:20b:282::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 12:30:56 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:30:56 +0000
Date: Mon, 6 Jul 2026 20:34:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 06/15] arm64: dts: freescale: imx8mn-var-som: Add
 MCP251xFD CAN controller
Message-ID: <akug0WK4r/Ig5WLm@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <ad528d193a9b2eaba700efc7374dd9ea90dd2dbc.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad528d193a9b2eaba700efc7374dd9ea90dd2dbc.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2bae6a-1891-41ef-87e4-08dedb5a6d86
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|7416014|56012099006|6133799003|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
 B9MTHBbPpDC8EllvSf2w7E+O2w0xzpYba1aE+glO1DK6pcaAOxQNgr9ZYEP+LPPG3bdxtBMrIaPrhutYP6F6cjjnGEhjGC1ZYRa9eAdBzgZLrGGzAXb/mKKadO/mwaM7uzJlF9YoGS1zZH5a32ZjmQT8FHP8AuNnpO+8uyzfk5rX0/mwUG4WQvWopiKmPWQLBx1Fipc7bKEN2xkWOwHnU1ztf2AouWf//cVQcUhG3z6YPSV2tU/q8hxvbojZFm0kED6DjyInd562ms8zQjt3vYeugHArudKXRjJ3z5fiVVGWJgmrGxH5fjgHxJ7eMIhfDM+cPvQQ0d76feRsPc0orjLPbIelF/2YhE/Eou12VsTeAtkxkDNlGFMgn+kcEUUIQ/engBmNY0iD3K4Os0QinyamzNOCR4jXaAcC7g46Z33Pqimf/e4uf3SBL/6EuXYdlYSSWyNfVyV2C7bo2nYPfjWz/XDwk0hqr7xDXQf8sKhVUa3pOOwkTJfj5vVDwBXXnqDaWJFAlUiUBH6K+PlYg9ASmHCx1Qz34oURDt/kve3FoQBsHXZsrjt+osqDYIGwNookcogeOL9LN+RhUwJxSj/YeuVB+r9W9XAFygswcds2kPJ6gWa8e06fB3ka1Y2EqHbMCH1O6N4l8XWYOojDt9B1rAPix7scPhfjK9YrwUc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(7416014)(56012099006)(6133799003)(18002099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?wIkgvvZYVq7JPrXvRMp9LwW4r6EgVk/twVXU16UM0qCTRffeXz1CsRYQc25l?=
 =?us-ascii?Q?B4e86GarzAtrahiNDWY8je58iPsf8ToobyOwkfcX/xJt6WNNwESSTCH/dJKd?=
 =?us-ascii?Q?i19sXFHNifsBfU647byDyhKd5al/ediFGksbE+27ImV5iyLKNwJt61ow3khx?=
 =?us-ascii?Q?Ok9zLhtrNEL3MQY+eb7Olsuqlm7Zp++S3TbKoF2ZIHoEQwPkMPyvowmtGhvG?=
 =?us-ascii?Q?eOX4X3jxyHJ7zTiW8NraNFdx3unAFQ0GjqbqLUxXckS7LFTF1M9kqFpYSo22?=
 =?us-ascii?Q?8dWbcLvTcOHpPrW5Bu1DtT+CEmGjMesZtQnHwLkHFdlXnqi2fYhLWHrqpNLN?=
 =?us-ascii?Q?dtDLQncwM8MlvfhjH6RDkAdy/YiNEigYwHHgR7P4vyh+M/jWREytM5izsli6?=
 =?us-ascii?Q?9UZ3yaYbyv15pW7+BoHrYhvsYoX+bXnPUlTmmvZmLDiihQZk9By0voldWhIx?=
 =?us-ascii?Q?IJtRcFLEzrRndkFUCIVxQdfEus1mA8Rab5Pg91zzW7GpOywqHbrEiwSxEwwa?=
 =?us-ascii?Q?mYdS56qQdoE+38X+3qNEZMVPmn+oVDx+qNbpEs4r76s93g0/fXjyMBfnojuf?=
 =?us-ascii?Q?1kHyxMcQNbCbX4s5BXu3PSp5XhF0NE+Bh8XNisZm+idJcah/J6gJoZNdV9q4?=
 =?us-ascii?Q?RvhQtQbXoVdiHGKEdxjFB9ZigbGsR/F+lKKq0bmew1CGlaqWp6i0YAtO1L7w?=
 =?us-ascii?Q?kTQTRWv64LFY7dNjzFYHS5QnOjqqBZYYk+M+MO/w3w5DFvHNah/nZO06QzkX?=
 =?us-ascii?Q?A4YhsYeFGwPj4q5Sy6NUXPylUaiJ3WGqLZ71Etiu5J1ZkIBM5PmA71CLyhA0?=
 =?us-ascii?Q?AO7gTXtdp91BLnQgEiOpQsFIBVh9XoankUKu9/OaPHuzoLlLeEXHSGPwdkl6?=
 =?us-ascii?Q?7x1qXlyJ+lIpVIHTRRk6a3MYsollChIYIyTAnSc6j7dQfW8usaIw6av0d8mH?=
 =?us-ascii?Q?vf1ZM4DpejFBaivNrzkgdXc6kXElyThIuygosufGzq/eckM4/UPQaVJv+f7A?=
 =?us-ascii?Q?5jLvrdhMaWazBmt3TZ1MrMMVofp04hTj2PBvaQsZ+YEyrvc18CeeVan13glz?=
 =?us-ascii?Q?NtBHUUfl+JZpkAgLgTrge+Yi2Okcrvt8Srxhby3Y9OLGfj8OKQPJirjich9A?=
 =?us-ascii?Q?OCTpwOeat/poC2LADMmdUdPLJi1nl9SPDpWngk1R7nFN+AFg9gumoSlel9o8?=
 =?us-ascii?Q?c0Bi1Qbpnqq+h4JfGZ8xYwySSApo+EZzlQgO6Rh7b2tNg0XvwjND1buPi24G?=
 =?us-ascii?Q?e1tGdC0NzJjv0hzIOgO3H9736KKStWUjp77y4hDdo0P1t8WfS1F132ZQB1TG?=
 =?us-ascii?Q?AjzU/RXHfk9Jh/URC5l+oephBrlIAlUe9kT9ngIPxFiQmTo6ogrWlnhQos2f?=
 =?us-ascii?Q?KZ3zRBRA14RkHrC7WGGjCoe+TPnqC9Q01FON109X3NdQxAxA+yTi4CCBp81v?=
 =?us-ascii?Q?yJFat0YgVohkyiJCbb5ND4QeTkWpzAR7uDvHGHKKgMfuCNnTUrnzT+jN3R0z?=
 =?us-ascii?Q?97kvAPmIF9RyFf7/oHswMsmeMzAGLcrZXWAU2D41ufOTP10w8SjOq6NP1n3r?=
 =?us-ascii?Q?aBOoz5CUJ6AAENCx+J6xr3k2kAs5hsJyhostBY9L0IKpZK9c1E0dXWUbieOB?=
 =?us-ascii?Q?vMrCKYOO+dyo/m/L2bU151TPtzPXRN3KNZ4UTLZsm3E1V0TAmAvk9lSdQ2ZE?=
 =?us-ascii?Q?IDEx4AocyD6bYOvVAiLJy3YPDnHf3Pw3cfz/3+Fp8dGwcUzZo+XCHCcGcwrq?=
 =?us-ascii?Q?fvZ1xylMQ5UHJARMzjcMtqqX6/C0YlpC29yDhHiGMA/HfMaNBY2V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2bae6a-1891-41ef-87e4-08dedb5a6d86
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:30:56.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdJjFSnHzVja3rq5OYr7i9+DUGm6R/NOoXoxdLMi3bNOiTgrPOLikRuyjjkj2ZmwPnT2BYnc/Wu/oyDXrVOzzbkw+cfW2PMg2sKe6qkcOyWLCKkpQZPyNsu339Fm8McQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7698

On Mon, Jul 06, 2026 at 11:34:36AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Add support for the Microchip MCP251xFD CAN-FD controller connected
>to the SPI bus on the i.MX8MN VAR-SOM.
>
>The controller uses a 40 MHz external oscillator and requires an
>interrupt line and a dedicated RX interrupt GPIO.
>
>Add the fixed clock, the MCP251xFD device node with the required
>properties, and the corresponding pinctrl configuration.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>---

Reviewed-by: Peng Fan <peng.fan@nxp.com>

Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876651B87C9
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 01:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767749270; cv=fail; b=j1k5sngw5O41q9TnHDKkH2Aoj4qlmUODlwmjWDgHL5TzpO61hp9Z9BRxi2mKspfPp5W9G6Irtiw73fPR+zOpIrwtpq+0QN25HKuPz/Db/Ujfo6fc81jKC2hNpkcqCGsC8sHbMEwoJ5vt7iLe5ZDtxMK3S+kZ9JugZnkNYU2Ck50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767749270; c=relaxed/simple;
	bh=gj/oH5QJ5MA8H6zXF71b5FZwVag5Oq2AsmQ1RKIGIYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=piWdnUeDG/k+UgUzOxpxP32jTXeaHqHMhutBG8w7QFk56zgxerDmn1+osf/4hhRAull9cz8iM0785RCPaRnqEZk8hRMldO8LFP0EYJFpW3QXU6AyEnD9agHkI/pAyskeMQV80VxwVHK0zs+aPAQZzDAemxFJQz4LZkdsuNeLySU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u4LIVRpe; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u4LIVRpe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdSOVZPW6iR8tAjEGu/zCvLcDm6kvQVjIUtG6vSs1cYnN3Gu6v+kaE6mVcryYTv4N4eCH79U7aya6tV/4cIMik1UM1MgzM2aAnEcPaivl2yC8r+Pn+XS6fczAQCo/AqnzQJfthk4S44bK+X3NZfPMDlEP35P9H4l/9HivepJuYHSFCep/olGbh7FC51AKMVtJUJiX0z0adsSw4l5RSEoRrBkGZ3MflgpOTjV0FpV/uIUIrkz6FZ1cDOzSjCcv8GFzqEeDIXUwuDe1CNYoWoHG80AiqwLZNYHICO8jwJ1DnNnk3C5H2XuDXv4FII4si1i44a2UHbXockrpCOW24KI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj/oH5QJ5MA8H6zXF71b5FZwVag5Oq2AsmQ1RKIGIYU=;
 b=GRGYhmAYycHtsjVVhOuPWjfG613KFvl3DwU8Sh1tYn15rVhdkg2+wJOYnFsqWXEr2tonZk0UC1dogwHD7sk4uuMWZYjl1/RykJAFSnxApQ2T1W55Gi9AXfokiyPYQkV2LohYXbTMLpsAkbr151ZdICdz+zRcvA6Y5juhEwqJaR1QOmsjjUPxb5euW8d8yXigL836vBZ7pRiKqfyAgZpWvkuml/i7IjcU9rBV4LFXD5Nky02Ibdx6qEMK8Gu5XAq+qRUAoz9tI+/SpnhLnPnioTqpdjKifl6pLHyCPVdqv6pENBBR/jfgNxGs0x5g3ezZW07/ffbh2Ha0fwlH1aNpzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj/oH5QJ5MA8H6zXF71b5FZwVag5Oq2AsmQ1RKIGIYU=;
 b=u4LIVRpeTeUcU7RZ7oJMmQgOExFyjsod6Z79ljsj+xdFQEboVHSXqd5Jy/jebPJiov5y2bjIwiBqztw3juF+FUpmblu3kSIhfUv/t0U7oGlBRPcl5xCKiIZYKDpGIhGMlCd6wDRhdClKV4XWTw/Bz9DidRMcOBJb/gAWYF+gXXV4pcWHVT+NXvwaR2E+BXlsaUmOOt7uGb+J8VlXBYuUmkS0/DPbotpgKLapkkn6Z3XaMYmyI4jjNgLdnl6U74jduf1VOcdu76Db/SQsV0WWRcQuEInri2dVtCiSM4M9CDZV63EIJwd0c774US4D/zX9wEreS2K9xFjarbJKQHiVlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by MRWPR04MB11491.eurprd04.prod.outlook.com (2603:10a6:501:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 01:27:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 01:27:42 +0000
Date: Wed, 7 Jan 2026 09:29:06 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1
 and v2
Message-ID: <aV224uyLvqX8J+x3@shlinux89>
References: <20260106190147.31924-1-marex@nabladev.com>
 <20260106190147.31924-4-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106190147.31924-4-marex@nabladev.com>
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|MRWPR04MB11491:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d49d66e-c24c-41bf-b295-08de4d8bf41a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|19092799006|7416014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dXo0hAXbaHhg3NozYJ3USsVMBOev6CpKpp500rMkdcbCFfZTLZtdmfxaDG4g?=
 =?us-ascii?Q?E2zaoBzt5l3+JcLwvfo5jestiCRJelvYdOsFgthHglp/f2OarKWewJMWxAK/?=
 =?us-ascii?Q?MPl1ZKy0eFbNnXX8/5h5jpoTXWIZuh500YRRqQPoi43ZpRehiWLmYtkR2UED?=
 =?us-ascii?Q?/Sn5dTsumeqXwDo9LYBycd+nr+XZRKvLjkL9O87caTTLv5ggHd2hx02QC76I?=
 =?us-ascii?Q?YtjbHeBrw7O44aQyieUP0YbYMQtXHXP5OrcUfMq6d1lGH1UYh7sOBqtYuMAM?=
 =?us-ascii?Q?pFEVuYvVhyH2m12aYgTLw7VtbcEvSPYvpVr12ggj3Wej0MPhxPid99oq8Iun?=
 =?us-ascii?Q?BoXb9/EFlw0lt1SlPHmP0qTp78QpBzOBmQvqw7mAg+VgCxOnljiRTC4iAhj+?=
 =?us-ascii?Q?v3UOG6xwn/wi6oR/oJxYTAPTZWw2hR7saiEvcK9lKiWR1ZTvfXaMHAc0cX/s?=
 =?us-ascii?Q?pS8OT275wS62rPLVVoHQaKPrwClwpFOktyT5IjPtzT9ErtsQnquqhErTzpCL?=
 =?us-ascii?Q?V6yXWIwNh0OHf+GBp6U7nGVFX/DMo7NcHyVpa3muIVsGq+PnFitP2G41bOeP?=
 =?us-ascii?Q?tpX19k+qaqkSFJ+4AV+MM9HOxRKZtvtE3TAm+/lxxdV7JbHQS8SrClIdqRSx?=
 =?us-ascii?Q?xHVm3UVJcuzELmX3m5rQJIGFY/a3PPmGuG+nNX6hmcM8fWAX79OWS3Ll32D4?=
 =?us-ascii?Q?dEo0Qd1+8nkJMb/QA32D2gkDnzPJEcWD+OExLXm8Acq+zh7motTy3dNNkAnA?=
 =?us-ascii?Q?MttZrfJji8+6fMs3b1WfMAw4eZ4lKL9LUpGz8SUv2jJVUUt8cNSGbz1qhk59?=
 =?us-ascii?Q?dFlw3mDVyIkI0FAjtGv7eLiCOchsJJbwnpCuPmhYku6GRNGFFxp3LGzvLK25?=
 =?us-ascii?Q?ltpe3vw7a9VNQwA/EPPdvlw+WLXJThE3p35ddUxhXFNbVquJuHT1GD69VXD1?=
 =?us-ascii?Q?HofWIeuQ3RJT5x0hm9D08fAs/RZZZOYpZ5deKzezyf8odsyFEMC78FLWBKuc?=
 =?us-ascii?Q?5rRP4EoSC19CuAWy1mrZcZd2JEr5LEmg18zs1htlyi+prhglAND2Ag9aeDi8?=
 =?us-ascii?Q?iRqJQtv28LZ97ZbPwCqEHB2Xc7NCBWt3NNUQv7dPQ1Fh3xFDbDdbM+/YylrJ?=
 =?us-ascii?Q?VCrUuBNSc6z89Ma+oYzHrTq+JTm18iAfMyshb8sCVzIk4SfQYFnv38zaURXB?=
 =?us-ascii?Q?ADbFLSlfZxMvPy4ljgxK0Znuax6lEtmGFeoDoN6J3yiLVBoU3111/okCe57M?=
 =?us-ascii?Q?TCqqRz7eBUb8rQlkRZ4mPnW1zFD9aKOdpG6tCUpF0gZDyHst/ttmnBrM/tpf?=
 =?us-ascii?Q?COPeXjC1xAEiflCoF2osrOfbTrR84+Z1C728X7CAbvA2mryuPIiGjOYlFVEq?=
 =?us-ascii?Q?Pi804ayYtQbhkfE2xuUoAr1eVhVdbjU5aTRBNrLlF9u1U7LEhrrRyJ4DNMyo?=
 =?us-ascii?Q?D8GLUQZHwpNBDnB/eZdOQRDId9cacrcXoqLAl6pL96t3ZNLrAADMyYvcZqEK?=
 =?us-ascii?Q?hml9rCHNN0k23trcNOLyp11x8yEA8jtoUfTm?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(7416014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?f1MTstGc4MNbhtGXHszHE6Ah8pAfXKNPRoZmJ9hxePVjYG23eftHqzdIhBeE?=
 =?us-ascii?Q?ymeNp/y5FtrfUqW3O6DqWW8YALMZBSDZn7HlOlzSl+vLgRGPItbtRbD6D3Nz?=
 =?us-ascii?Q?/igeHaLLqKDQMXeCKCBHjICxxgMnJVS3wK9v13QCW17X37wCfRv+1y/0Gjug?=
 =?us-ascii?Q?SIwTYgpZFK3pScMzHWJfeF5bKgn4Y7YC7eoxkis4Ca76tz2yH3jZZ5WhY2Uy?=
 =?us-ascii?Q?+8xN6ybp9ManIpZc6XqC/1rLc/0l1H7rn8zERu8olMm2IeAt8CJ2YjNiSNwB?=
 =?us-ascii?Q?8Ul2UaG32bp2Ht9zk/UzQf7MCvbs3OQAn9LiZFJWidY3HXqbsGEfuVZYbzj4?=
 =?us-ascii?Q?CO0vqsTRxHm/idDv1ny2c6IiHwLB+Ve+YK7iBfrO5Ay3e61fAcn69jrS0G8L?=
 =?us-ascii?Q?t4cUuGMQnQPFHBhbPPvCdH6Bf5wuNZVht1Ibu5JoMFA8+t+cEB1MnI3pwA7k?=
 =?us-ascii?Q?Ofn3u0WLyLjI3CYcM56qwnJV5EnVzU6DpJ9HtLAdc2OCaNbkKPzgmOQfqcVb?=
 =?us-ascii?Q?xsjeCaYoLzoag8VpW1392lUeEfFBfEcEr6brlbXb+z8Gcqekb+M8z68VZj8L?=
 =?us-ascii?Q?ESrweAZY58jViKMUhJHcriRD+PkIiFFQilQOQH0lpVeQlbU43aMas3n7h+0h?=
 =?us-ascii?Q?orG6njZPRT+Ly0rqfrlV+GhguyprPBBr+MPIft5mJVXqxaIGaceWgQHM+8rn?=
 =?us-ascii?Q?fYN/g3LNqCEmWbIQoLa95OqcXn4ZKDAs6F2x9MpySuay61O11u7m5UuWiIqX?=
 =?us-ascii?Q?4n387VjYDVj3Qql4NGAmhMkQPxFRhtfskpiibwj2sjdA8cWJRLbXTm8cwhgd?=
 =?us-ascii?Q?bj4CLoGmII50wnpb3WqvF2MeMEsbdPADh9yTJZ9rE3a6pvk9lOpjm1RjRg3P?=
 =?us-ascii?Q?B1S+0XxdVPvV9HK7O91MU9JMtVR/IkySNuaUdWVsua2YGkC0PD9HQ7+vnWar?=
 =?us-ascii?Q?akFA7M43GzAi2OxNrelfHgUKqrq3/HHqQQ1K0iI9PHw8FEzffe37CJ+nMCQe?=
 =?us-ascii?Q?x+KApf1jadoFe92I8HWKVE0jyxpW6rORfkq8uRhM1YN6KoBpvnUgXw+Q3g9w?=
 =?us-ascii?Q?u2Z2SLDin6/u74CPG/nPjz34XqiFcsbYttIe3JWr1QsP3TOAU3zeS4B78lsW?=
 =?us-ascii?Q?bhFF6vr3YvshQy9I68L7zp5rthEWPqsRLSngUpGwRCyiaibHKFC+Z17yiczJ?=
 =?us-ascii?Q?+YpKBacXAOlto6tBe+CQsskBsE6Xkqj2O78XvAP6rzTZDu5IilVcwYj35ogU?=
 =?us-ascii?Q?J6Y/9sx90uDzz3d/3msBPYddcGLTHKps0Ov8yCwMgeMo7HJYTV3AvXNRFATx?=
 =?us-ascii?Q?1onif8ePdoe28TRgGr6eFwop14PcvZY73aCHvgzTRb2cXDJVtCq4PLUDbZKo?=
 =?us-ascii?Q?PISNtdQbkZZzYfKxWHHGkugBCK8rTsb7PGuoKqgKZDyy4SzFh2Fl8PxbUJ7w?=
 =?us-ascii?Q?ziualWO2Pdir76UZpqChiEbRuUS5/xlQvA2Za+VdoeHNVOSHXzLaa2KLKK0z?=
 =?us-ascii?Q?b/MlmixzFpxXbu6yiJUc00Gu6DYU58wB7wqp4+oTIfo0fal1+eX+fS6wH7Da?=
 =?us-ascii?Q?V7y7p1spVICuUZ3YJjWOnQqEyKzLJuTqrS/dSbMo8KOEhrzNaXi0ehCsda8k?=
 =?us-ascii?Q?me9JnF3egIqQYlkBSllP4zmy3/fgZkelvff/4f0+0cPRcCsZjNyAbtywINVP?=
 =?us-ascii?Q?kmck5Z1VZBxVNKQy+Omn4fObPXmsb351/nyu4G1AkOTKaGC9hFW5BaML3dHw?=
 =?us-ascii?Q?1hA14tH1Aw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d49d66e-c24c-41bf-b295-08de4d8bf41a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:27:42.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lE3vOEdpga2gi+MQuDSNraSZxLqWR+e3pLQFMdZaqehmQCk9EcQ+l9l3wkQjY6E+MmmWl9n3x2acOjMu6TC7sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11491

On Tue, Jan 06, 2026 at 08:00:40PM +0100, Marek Vasut wrote:
>From: Fedor Ross <fedor.ross@ifm.com>
>
>Add support for ifm i.MX8MN VHIP4 EvalBoard v1 and v2 reference design.
>This system exists in two generations, v1 and v2, which share a lot of
>commonality. The boards come with either single gigabit ethernet or an
>KSZ8794 fast-ethernet switch, boot from eMMC, and offer CAN interfaces
>via Microchip MCP25xx SPI CAN controllers, UART, and USB host. The GPU
>is not available in the SoC populated on these devices.
>
>Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
>Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

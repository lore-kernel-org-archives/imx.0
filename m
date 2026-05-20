Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EA1B4156
	for <imx@lists.linux.dev>; Wed, 20 May 2026 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259961; cv=fail; b=NIGOsEmn68jacMhsnv1k5rDyUPXjCpbm47FgdqCn1lqqYvzHr9XwgB9MC3dhnY7m922bTHskZv6+0whrfAyhPANKLDuDcybkbOtKa2+CaHdDn93ykLWav8pF1EC2f/LJZriJVpcFWNUZufyi8BvAg5jNAIFZDV/+vfL+WnHS4tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259961; c=relaxed/simple;
	bh=6eCENWa55Vt4JztLWyZcHrJCew5ctxsmWuk+Hr38UbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RBAXUM0DUEPnjbj90PpljuKYSfzHB5CHrUalxMVoK6JreYPBXvxZhNbwo0J3bAhPpqbO3MAlhOT3KdIfkm25msMVFRfQ3oNrXQKv1Tfs7ewlHawvAIcXREI0GX2HE0tlUQfDqgO/QZZZ4zDc2Kk1Bhf+Kmt2+b8mEQl4Ozc0AFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AHZ7SjvR; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AHZ7SjvR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM624lBpWqoMRO8+s2AZXOa1Vnsg0oGMvmyeIEgu8vvkyAr2nEjTlAYAMmg4sWMi6gmwazgK+yH7B5CmdgfSiGZgVgXdUVimUmLHzlISkCZB5P471ij23TLzkmF3gjU8iPYNott7tonBOEQwfqe4q4+7TnnTzfjbiTTZbOO2TEIkIqKoFPgsiGb3tmawJHgTVYzQCvL8T+fcl+fPWBX6tDQkcTg0BarEo+robaUXjKFesuO6ayhjWRsYYItniVOvl0Nd9oha228j9cEsZthsdYAkKlUcrp76vZ9BglPpkVbxTKd0dOUZ5Mr+neKWbMYCLbjcUaFuqtmOERUJk1kLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hi6/i6ofHnFIjMAr8gTizdcIlvcw+QHpw02/ywCME0=;
 b=uRSnhxlEefAcyHQ+Ev3XBfL7MAVkfQxFY5apIrnB0rt/8eBsojQSmv3cNEwrU5VdtcOe4jWiERyDn+Bf3AdJwTsCzWuWxmAG3qkAuSCTzsfDnqVGYUQUzZ0FMetPiBK6iJ3SDAGQdCGUg84INlPp+TPOXzTUSIPj9BtCuj37S/kBYTcv06TQvtsr0Jdqx3PY4xzGPlSA07a0red8cLORoOsL3Jps35/Y0ZgseojdmgUkpZRsz1KgB0GeIY89f+bSGpBh7UoE+JJb3OdI0CXtUin5nbLcdri8eBJDscFLkwLysMOlbN133+3GphOfGG/99VcsK1gbc1rNeZ7XUDp+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hi6/i6ofHnFIjMAr8gTizdcIlvcw+QHpw02/ywCME0=;
 b=AHZ7SjvR6uw4Fp8VSE4DeIARC1OKTxIm5FiN8ZGxW5jhnl2jO1zGPOmJKi0kmpfc0Buj14UxZjgWnLLR9GkrHuxo3c0E7YqZCDct0U40Q8QuywFdKh//ofBynZrqfBkOqKG4ytYGXyMzp97NpDhJsU+JHetZxtaqhnAkl+swImPeR/p00OQLCKBWXrHPiHhCS7qzASj000A/sucC7JlCAJOuzdcLstFRhbOUvVHXGCxDJsJd1VCo3A/PBRlA+AoyjnBMUzAG8PHxclFab7SwXvtzO1vSgvX6yQngOrYmvOqBrl8Td96CmAiiHLHdf7ODU8gtId1i3vFL+X0QdX67UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by DU7PR04MB11162.eurprd04.prod.outlook.com (2603:10a6:10:5b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 06:52:36 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 06:52:36 +0000
Date: Wed, 20 May 2026 14:54:52 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <20260520065452.GA2269979@shlinux88>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::26) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|DU7PR04MB11162:EE_
X-MS-Office365-Filtering-Correlation-Id: 0008ade5-4382-44c7-3c45-08deb63c6001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|22082099003|56012099003|18002099003|38350700014|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	nb3z5h5/yRsJmCeHlTSazz0U3h6tH1SbymUFyj/Xcz9L4b6i4r3wzj24RgVRNkbkI0NuakfbDhJDlBvlaVKEeiByVRDlWpia+jzmchE4uk3LL66apMPX/vIWORLeJey8bLLDlK9iIvEv/qtAKxf4QjcJED5FMzwW02UK7mAlW063Wv++pAokwlVKKUAtzkBY4Uboc44oteL5jPiF02M2F1uHurI3PLpXhZgGrsbERHlTkkP6wPCNr5ncxUz0A/a0oNHzWSj8FonqKuh/bXmhSeWiFend+CXyUFrSXHcSmGWyCp5X6PzRNAygEHDgSdPqaF/DTuhPikDGOHc1QwidvSYhBB0+XVfwIj6Bh+NObklYpo4Xw+2q6W+38CZyRzscSz+BjeBpgO98lSBSfx02Rvk5HSq81yAli3mnM8WRf+c9yy1xLC6dXXb+I+H2YOwo6RjuD+SFsisn4IojgpBY3am6tgYzt63eWScWJeZR6D3rknttioAVzFpuABgCFaHnFWRlgev0q4KshwGIOznLAimKbEnUfC7Oz046BS8zXMhgOrNUubyrH4l0+SUkG2ojP2DdrvWTu+vNnNQ5ZBbGZMh200i722ETA2yxNw4DQ1rO5abwf8XYRT9Vm26GjmaXN11E3Sn+lXUFYM0uyZJt9eB/IVI81CQY7d8MaP69WAvB/H3kMl/6GSwCMSEI1fiiVIxo2nhD7v3ks+KFip/2YFR6R0ln6YEmx2KNODhuHWtusDTsbPP8+3aOhMUumvol
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o6mbktf62h3xVeldkUWBfyx4XgARv7zgAHwdNoFsNadi8iOv/6mZCUUQvmNv?=
 =?us-ascii?Q?Vh3nrWCJC7njQvmrCf0ZOTu30O6W9z6JI4M9VphkjKZxmq47zVoqDTKizsZd?=
 =?us-ascii?Q?8nlHZLqaGI0lVkOEWdmQonuDIV9x5Uah5QEBj69kvMZ9sp+fYlPtKYxOuYlD?=
 =?us-ascii?Q?HjviV8JeEbY2gGwIsrIcCyBNBtmY79UARSEphSjKxwk3F2f7rDx/IWOl0l9a?=
 =?us-ascii?Q?Fwv6TD7MUtBQryEHnCr3k2FA1BoqghMy7ohJISryC+rDpkwP3zVzTT2VgKTH?=
 =?us-ascii?Q?4sBZnwqsGQXuIyedOh0QQsHI0dJwGj5FREAw3vA8cv1CidlmWt/dWqmpdA4F?=
 =?us-ascii?Q?9U0PMBxAV6M40mldegB8z5aKewsvx9rn6eENxIsvMx2ApzY+Xkwidu+gb9pM?=
 =?us-ascii?Q?Jp3jZ+C1L68hGTJIXWYoCIxMu+2Zq1KsYK1DHreKdIq0mLnWoYy/3VlZYW6X?=
 =?us-ascii?Q?/EeizW2Z8ix2DBiOJeQLvsDfhRkF3DZvKaXKs6KBbfucNnkIyKQraf21AhWb?=
 =?us-ascii?Q?oXqnYz7WZfvV4EZ2lbwkcIQRFOJZHfnAqdjtPzBvbfOX5yrRkwD5wi6V1bRZ?=
 =?us-ascii?Q?3SST1zBmbjlQ/KNbsdWtme3Si7WYHmNBGivUWw8DmhwljfLdbiRt0pAIaLWw?=
 =?us-ascii?Q?ZRGE9K5g3Ua+6wL1yB4O7dNk/OAy6wUgAt3jbdSc2uiCoYf56hlyfy7T3gQg?=
 =?us-ascii?Q?URm9uoAmS6Do6ej2hbUoeTHnBjl+VCmO8m0vXtSVaOB2wEzH83iz33FmPefZ?=
 =?us-ascii?Q?79kQ3oiwMvGmDXGpuNZZ3foxI80hbQbcpMIM02VSrPIjkZ7L09Gx0/ZXE+C8?=
 =?us-ascii?Q?ustbYvvdoiXfp74Q+sOiDxk1I3w9KdD2fa1KwKqD6I+sIw4fIhkGQ4Pdn2IH?=
 =?us-ascii?Q?mJdE4aVGtPWMNFCVEseAjP29K4qW7pz6HILhAGnnC2MXB4kwfiofs4iJDRuV?=
 =?us-ascii?Q?fwT/zK1VcrXAObkrsbzHA/pPniBE21NU0uYgrpUzG4k3bJQlXuhNQQCKxOXW?=
 =?us-ascii?Q?bC47DR2GwRfvio9TIt/GLF7exfgAgoNAI/4CNLZ6MjsY1mDzC0WaCd/M7+gO?=
 =?us-ascii?Q?cugVmyffRChoSnkX07/Ddl5OUM7liqxVEBwZm9CZs5ec58gcasAosUEw9Ov2?=
 =?us-ascii?Q?xhcHOhjOMVPDxa6bP5nx59czLy9AKN5L8EL3Sjf3/QOOjhkTyBpTzIVpcl2n?=
 =?us-ascii?Q?k6IKZakSomq9Vtir76gWCZ7rGC+iwfRihl7/h5YmmSxPrEMQXu32kOj/ZXPz?=
 =?us-ascii?Q?MdAZyIPny9qCENfOlghoQwzr7aPWkKPWloRrgcxe4eI9zYLBV10NapDVJBZz?=
 =?us-ascii?Q?k9GXLK7lDV6+jTJ8BdsQ9X9qIlqZHbPSyGVBYVy0jH5kXlQkR251S29+SAZh?=
 =?us-ascii?Q?iAlGLW3nK0LVXTVnpLdEfOtniqiZRCJSBKJ9zAV+Lt+N1JZsUx5NnvQkUbXn?=
 =?us-ascii?Q?SVJFGCC0mGvWOZtwKKHLtTZWVnZstdmOrB3GjkkklXwj7ruxuTBDI9ltcX5K?=
 =?us-ascii?Q?fVJgWFulxag7+KOhrPri5moLP0+6XT0XDnAo1Q2Vzc5vijbygylKzg5JJOEf?=
 =?us-ascii?Q?HMLM4DHT3vKr7RSaWueNHZkEJnkSOUStZ+Wuc+Ma+LL/kUSo6LaDn29RYZ1a?=
 =?us-ascii?Q?rad5TR9kT7qYW29bQyIfE5G3zJhhAssuVPMmenL8SqJF8ODfy9wAU0nacNk+?=
 =?us-ascii?Q?KjBKJqfBkxXIdwm7O/7ifdRqBnDTqXyVPlp5G3Vkx8S4NzSwNY90tyGd9js+?=
 =?us-ascii?Q?uP1wg5QxWA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0008ade5-4382-44c7-3c45-08deb63c6001
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:52:36.3198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfQhseGpMXydRG54tFni9Eqc9DdukreEPCqoXstscyn8xJza/7K5H/xJJFo++wYOGyCKhWURoh0xoTOQr9YCjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11162

On Fri, May 15, 2026 at 10:01:47AM -0400, Frank Li wrote:
> On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> > Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> > on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> >
> > The sensors are connected via I2C1 and I2C2, each with proper
> > endpoint descriptions to form complete media pipelines.
> >
> > The resulting pipelines are:
> >
> >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> >
> > Both pipelines have been validated on the i.MX8MQ EVK using the
> > upstream OV5640 driver.
> >
> > Both OV5640 sensors share a single reset GPIO on this board,
> > which prevents independent hardware reset when both cameras
> > are enabled. As a result, the reset line is kept deasserted
> > via a GPIO hog, and sensor reset is performed via software.
> 
> Does reset_control_get_shared() resolve this problem?
> 

No, reset_control_get_shared() does not really solve this issue.

The problem here is not about software coordination, but about the
hardware topology: both sensors are physically tied to the same reset
line. This means any reset operation will always affect both devices
simultaneously, regardless of how the reset framework is used.

While reset_control_get_shared() introduces reference counting to avoid
unintended assertions, it does not allow independent reset control.
In particular:

  - A reset operation (assert) will still impact both sensors.
  - It does not solve the requirement for per-device hardware reset.

Therefore, using a shared reset control does not provide true isolation
between the two OV5640 instances.

Keeping the reset line permanently deasserted (e.g. via GPIO hog) and
handling initialization through software/power sequencing is a valid
and practical solution for this hardware design.

This matches the intention of the upstream changes as well, where GPIO-
based resets are treated as simple control signals rather than fully
isolated reset domains.

In practice, using a shared reset here can even introduce subtle
interference between the two cameras during probe or power cycling,
so it is safer to avoid using reset for runtime control entirely.

Regards,
Robby


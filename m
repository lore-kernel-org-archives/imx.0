Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0263B83E8
	for <imx@lists.linux.dev>; Thu, 21 May 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364065; cv=fail; b=Tf1UuRCtkyYTADOvqnblrtk99xM7C+ME+ZPLDP0BgllzdBvziPEvVwqQJ+RQpDUU3FYVrJGJTaex1HbFvak1Ox2Ya5TaeRkKxQ0WtBFtLXxMMzHSk2RwTTrhuMIxDczoHeSzQbcfLZJel8RkWhrvzRREUhx35KXVOVIdQH2Mtxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364065; c=relaxed/simple;
	bh=LDnUCqqK6ZR5DNnURMBiZScfQgw4QOq1wcf9Dpq4aqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PNAEEnWWYAVPAxH+h4MNZJ9PNif9rj+nRl+yXqKTN3/n08dwUzks8Jcv7koJOpHFk0x48IDGIISPl6EX7JqNTuToiBPF9CXcB3kLvUIMrPBwk0/+SjFw3EQAJzPjbxnOxTdc3HDZk50moSLmpw13SoQEQngyeqhm7EyGVAzRhw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FVjEbcXg; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FVjEbcXg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwHyxiC/MGCaZFoeTs7ER8b0m1CMe2rbKmBbFNk+wDMSA8j+SXgYKrcpynr1+vdUxUO9wHmXRLfplF919AHvX7Z19rG6EWQHcWP1hh1l73HA3IoL5+PCrTVtOSjgqeQ5wHscJNchEkboqzo/hBDAO8meN+YHN1koCrSfsKXx/2rxETv9oP7yWMZyuSr+CTPafGLfxbpKmn7AByG7xNVrHcd4np+RcnVtDIvK6Yn+nV6rfQ7QmB8omxDyWxuBqMXfzek+1+AO/yQqiGyN7ycWf38R9D1HL+2Zh4zlRBXoCr0hI3L+lFn8oXEYXv+zpGIp9x2K2qpzH1OBJIt7YFrPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/0PS67B/62iA5OE6mRGDNX5q2uSO8eL7LpqZ6F6uAM=;
 b=eT3xtZwkH3zAmmHOVF0KBAnKH0umAFvXMnju2Ci3NkHnNfO6fHJMMAwYEy7tJrT/R86JSyZ0vAnf+VYj+l8w+xvSw5Ev/8ufJPYYxqd9q1myxDZTntpwwqOdzrYliQqNu/MwlWpixc8YVSqigoN3CZQp2SMzcptDweMVhMFMjJgg0vK3e86yDLnfJGp6pw/rhmvi2feXwy5VvxjCXdGzALBiNLWLen6PHs6qcj2RAnYpjqCFxXF2qedB2lkxrUKjq4K8+5P5MaZvfJar4gnGrJLzbCDz2XpHgKv02eyYVDzsDa8MriMLBdcljzCHJvItCoEDSuDzDq3+dDK9hGmrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/0PS67B/62iA5OE6mRGDNX5q2uSO8eL7LpqZ6F6uAM=;
 b=FVjEbcXghObGugi6kdbJ0I0YclD45cHWMrSMNS4GB2F1dt+7EG05uwfBe2ne5epLy81l2OMEfNlmAGXImFVYiQiSaKZEIeilRxk6CThM1XvOdsOEdsxpZ/a7mPgnX8EI3HiZt6QscIU0u4tuyoHcVzTgpEGYokfdtPse0n7uei67qchPWKGZHM4W3yM95/aLSN6Cw4OBqdD8uVWn5Sr9ut6PCOaXbawYZaSmn+skmK6Dn/eel3NZzWVINZv0e+4zGAAs/xuObl4lTmb1OHsvkvgEMnJ+Scnyf4C5hkyP7Zq7E+9dZo3H3SH0zRowtKNExqMQHtWJoQEmGfIK3uuo3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by GV4PR04MB11290.eurprd04.prod.outlook.com (2603:10a6:150:28f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 11:47:38 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 11:47:38 +0000
Date: Thu, 21 May 2026 19:49:52 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <20260521114952.GA215762@shlinux88>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
 <20260520065452.GA2269979@shlinux88>
 <ag4C6MjnOJGjEpKN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag4C6MjnOJGjEpKN@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|GV4PR04MB11290:EE_
X-MS-Office365-Filtering-Correlation-Id: 013cf535-69f0-488f-39de-08deb72ec149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014|5023799004|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	sobfIdYJIb2GoLZLqVZpM2UIDqJOgOvOJxklvqDl4/l/XW/uPMO8aUSt4o6aUAmt0t+u75tirqQwW9gPi54eqvjPM8rmZvcz1VeOW8kojGOEzrwLADFjbLzNzsz3sqvi0T40jrgjm4JwSrCnz1eDpMiVdQWbVtVO/KntnYzcByPer+5/hgKQKxnJl3ktopoFGjnbRxXJJeJLDOgfjKy0ul1NKrG6cBWWot9R8gid3TUWE4rzBhwbd4a2kml43OUVaVSBVPPpDln8rtHO4sWFDUst1GaTicHV0agcQWFRgsu4tWlNr0Xrx3bBm30N1uIqY+4PSpScrewhifdpM52HBtOik+V7R1DxtYmQ1KOxYiSWtYxjZarrB/QZJ3+gbThe1ECjoI9eOdDxMZwKaAJqZAwu3+dbzrHtOYoxLeZPZEtkJsoxrES43s0rEQvtc+kqQXaDihpxRjSZoialy09ntIpQ1VBN8wEgEppBoxVNBBhyyqlCkxTMQV5xWdtdQxDLW7U9MOo7RAvUftBhfuVd+r1F24hXQdtgbc1LlYYKfV25+8+jhc8EZ6jq5XM1vGin/HS/P6TBKJdyvd2c6ob81BZ91/L9oJ6eGoMf42piKaZtNGWYX5HS+8RFmZOelJ7tQZWgrJwat5b5jyalhVOl3u83uroCsszppEHGBYD5o8dQ1gNweERlT3R6rzEa1XpX9mpdovJgdo/j6p0AaSNbe4eP1cAyepoCaD+zv+7KIO6aTJVpUqu/GticiQwRtjUV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014)(5023799004)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZCUyhhWOyrE2SblYDDbxV/0Dvao1Kp7yI2hlmUIlY+uG2T4Kk1XS5B/EB2g?=
 =?us-ascii?Q?tbss7GYvUPTkZwVAx8sjZoHBP0QKqJVDlANbSLn8BHUXfSgzaB7xu4pjdT5l?=
 =?us-ascii?Q?PcEaWtD20i9qD+oEvXBVwMOcDVaXWZo7BLrv75M16Szv8cXSHU2ZFuuygrJG?=
 =?us-ascii?Q?KSie8C6j2FE6eddTOzCmrpQmteA6qWpeBZDoz5MtB4NluuJFklkA132W7SPT?=
 =?us-ascii?Q?BQNtEHZD+vSSL718RpZziAAj4DWA0hf1AsSYcTvr/Bto9O4QD7szCTHdfpXN?=
 =?us-ascii?Q?278hytZAoJSpSqrBbAdOpyMqkM0kRaw8O7i0vBrCk+vZyoLeAiqXqG5NXQB4?=
 =?us-ascii?Q?GT0qAHrHw2W0zq2JkBMNAJB9lk1RsEvhYhuzoNXbRxPG1ueAVThj7v/gHSnc?=
 =?us-ascii?Q?nV0Et7vlUUC43TPQ4d73MPJj36Iq0FWM2Vm4wO4+UEunbw4n0TM6F3gw9N0c?=
 =?us-ascii?Q?Ao0YfWYOUmKCoxuW65MzAT09B3GvvywDNdV7Iutpg5dkSUWrJqYr/zyLB5TV?=
 =?us-ascii?Q?8EoaygtRKnckRJhPJlW4CvdHj4azXGJ71lLvukcn0dnRy/NNIYtPTTq7tVX0?=
 =?us-ascii?Q?U0i9PEKwVaaG3WsALIkzqQsC044BXDLufBpwFgK+lOD4Tl+hGn68UvTKbg2R?=
 =?us-ascii?Q?TH3K3caqdrB68Y5ZPGFFOZUfxpskrQPRkP/yna19NzSVUu0Wj75yqKXoSrBa?=
 =?us-ascii?Q?GoKjQVNF1uIhsRumUvcc7cxf9hWzbNt9HG27rXm/rSLsiRsiqtVi/S9QH4ss?=
 =?us-ascii?Q?/f/BFKhbb2JWSYEtZVLcOXkJiVWczRlEH8Vo/wWoxbRXkydnkdpjHWfkRWhq?=
 =?us-ascii?Q?vXC1dpeNk1AqQvfL1AJbw48xbQ0QMd/5gkLXGEX8Z4yquYsJ9tjLI41Hmaf9?=
 =?us-ascii?Q?vAFZzM5LbF4YGCFbz3/HJCMdJVowjvhfRlCUZ26qcWtFhCiC50s6VWvObYaE?=
 =?us-ascii?Q?JpFWF+jH/UZFW748I4pMDGoSQakG9alUR+vN4taoanynj5fFtwU3TMdRx+IW?=
 =?us-ascii?Q?TKColMNrbzil6gYw2J2je0ng6kCdbDYdxzHk6LFM4WE8dQdrYbqIOz3FKJF2?=
 =?us-ascii?Q?eg9YohcTDxqsL7CtjK1E9DdLxGjaMR/JBlsorOv5hEvqXVcWZAEsTXNTJuzT?=
 =?us-ascii?Q?werPXknOWKRY7n0vSkYs+6cOhUGDoq+dJGm6Sg46T19sH+axztpqL/lV2r8B?=
 =?us-ascii?Q?oN4YynI/Uy2rpW7e16AT5OsQVCpQQoSm0Kbl8jeS2zbjD9fZxU9e6MCbtRW5?=
 =?us-ascii?Q?3/1W0YZDudvpr0zZ3OcQ7YTu8E3DHjo2jGMIVy8Rqv4hKiMpGzSPGAj/dZwU?=
 =?us-ascii?Q?3P65xptkB3mKmDoAhr6FVWF0GYC0hYIuGyUvqv2K/j2RXfFX+YRoV+K3MGaj?=
 =?us-ascii?Q?ZmN03IRN4HQhuFdS8E25Wv3sDD88D6UQdgQGDyUDCubwmiJdUk80Iih+z3iR?=
 =?us-ascii?Q?1Z5pLey02s11tHcDalaPcqzJpHw/71KGsoJs6oxTTSzxrnd7Wj5fu7TD7R5X?=
 =?us-ascii?Q?Qgjse9xB6ALb/slOUfSjdNTGuJ1zqIhJntoRHvdhbAFapMXdA54dXYB/EpHO?=
 =?us-ascii?Q?1l4aLYOzEGrbg7fVvzczkoDgipvrfj6Wof6qe+BzucVcb3SofUGzXGYdiS+8?=
 =?us-ascii?Q?jfhYcU0VaxpdktkiF8VhdfOCAuEnYKnmWOrV7kg1Df0SNtmyR3gaFuY7l9cC?=
 =?us-ascii?Q?IdD9WoLOamJNXAyHCZHtH0UGu6crjvP6PsGwdJp7E80rKDRr+D/RXIG8iA5y?=
 =?us-ascii?Q?4I/WlxWLWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013cf535-69f0-488f-39de-08deb72ec149
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:47:37.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjjDtGwc8iCj4hBVNpPa72LZWUSUiyWLV/GShjfj6uYK0ylNRvSJHIdOGftEIA3QWupjdmV5G+Y1AjQQss7Dug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11290

On Wed, May 20, 2026 at 02:52:24PM -0400, Frank Li wrote:
> On Wed, May 20, 2026 at 02:54:52PM +0800, Robby Cai wrote:
> > On Fri, May 15, 2026 at 10:01:47AM -0400, Frank Li wrote:
> > > On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> > > > Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> > > > on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> > > >
> > > > The sensors are connected via I2C1 and I2C2, each with proper
> > > > endpoint descriptions to form complete media pipelines.
> > > >
> > > > The resulting pipelines are:
> > > >
> > > >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> > > >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> > > >
> > > > Both pipelines have been validated on the i.MX8MQ EVK using the
> > > > upstream OV5640 driver.
> > > >
> > > > Both OV5640 sensors share a single reset GPIO on this board,
> > > > which prevents independent hardware reset when both cameras
> > > > are enabled. As a result, the reset line is kept deasserted
> > > > via a GPIO hog, and sensor reset is performed via software.
> > >
> > > Does reset_control_get_shared() resolve this problem?
> > >
> >
> > No, reset_control_get_shared() does not really solve this issue.
> >
> > The problem here is not about software coordination, but about the
> > hardware topology: both sensors are physically tied to the same reset
> > line. This means any reset operation will always affect both devices
> > simultaneously, regardless of how the reset framework is used.
> 
> Reset framework is resolve this problem. It is quite common that many devices
> shared one reset pin.

okay, I'll try to switch to use this approach in next revision.

Some devices require coordinated RESET and PWDN sequencing, but in this
case the device can be properly initialized with RESET held inactive and
controlled solely via the PWDN signal, which makes this approach viable.

> 
> >
> > While reset_control_get_shared() introduces reference counting to avoid
> > unintended assertions, it does not allow independent reset control.
> > In particular:
> >
> >   - A reset operation (assert) will still impact both sensors.
> 
> yes, only when first devices toggle reset signal. Second device do nothing.
> 
> >   - It does not solve the requirement for per-device hardware reset.
> 
> It is hardware limitation.
> 
> >
> > Therefore, using a shared reset control does not provide true isolation
> > between the two OV5640 instances.
> 
> It is not isolation. Just don't allow second device to toggle reset pin.
> 
> >
> > Keeping the reset line permanently deasserted (e.g. via GPIO hog) and
> > handling initialization through software/power sequencing is a valid
> > and practical solution for this hardware design.
> 
> If use i2c gpio, expandor driver may probe after sensor driver probe. So
> reset may happen after sensor driver probe.


Just to clarify, the reset GPIO in this design is provided by the SoC GPIO
controller (gpio1), not an external I2C GPIO expander.

Therefore, the "late reset" issue you mentioned does not apply here.

Regards,
Robby
> 
> Frank
> >
> > This matches the intention of the upstream changes as well, where GPIO-
> > based resets are treated as simple control signals rather than fully
> > isolated reset domains.
> >
> > In practice, using a shared reset here can even introduce subtle
> > interference between the two cameras during probe or power cycling,
> > so it is safer to avoid using reset for runtime control entirely.
> >
> > Regards,
> > Robby
> >

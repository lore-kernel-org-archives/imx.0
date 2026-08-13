Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011065.outbound.protection.outlook.com [52.101.70.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990B494818
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637720; cv=fail; b=uGgmo93JMvU2EhDIfzkyKH7bF2dMff2sc00lxecej1sSTnO/SHLA1eCdYJ9yDBppZDJHQEj+bGyELsgClDTibe2pzulccEtd2ZmDULS0B0XoYjjSiWwmK9kVaGYNCGUiwHanoK75/c5XwZHpRyCBeiUd2OGsm4Jd3WMBlN1vZOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637720; c=relaxed/simple;
	bh=fGPnLAQmqj7Whsa4yy9m6HVCGSQ0x2mZZlgM8eulIDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FG8QoeSHmr4hkc4RIbEIJ0V0Up+Yjt4JR24vH4sdhZklvm8MuzOIuWKFmxiWAzXqHAjGmrUkA0z+19FGbIh3XRD0OHYc/3Jn//3+kB/9R0tSigcw4ht6w9mWi3X/VdTIjaGiCLC77rL9oL4W+tjNrG53Lj+yROcSVaKg28MC328=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j1hsXMuD; arc=fail smtp.client-ip=52.101.70.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j1hsXMuD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHHB8y69KlVvbog/sHSYXxQXu7XPmfkWYEvwKcZq9ev+FaUpYLIunh+Ca2fvkQCHQmRvWoM/FGtWFGoDr4HXrNn7l5L2tuvHbLR2go2NeAkleI9ANc9aNfarRXN4q++ZxH//XGCZLEPRqCie75DnSz3rljDQf7Xbend9Eqkp1VPaX18u8rB1ZDd1gGVzs/KBmr6QDgdCEEeaXVOyAXvboSDyfjFecCKuBUKAvRFZRcR3OjbZcr7YaKMESAnw7TAJ7uZfEXoPHdlRrqXSxX+XUTALxxu7HqtPl7TaOfzq6GYRPLPqYY7BLGAwei1rwVXi2It5rX+3G0TtjvpDx2k0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGPnLAQmqj7Whsa4yy9m6HVCGSQ0x2mZZlgM8eulIDE=;
 b=GmOhIv0j5nfQye+qTcM9BN9/OkS7HmDbSJ1o9Q+qzozVrWiNFJJ4EcJsVEYYLRNap+Z8k9OG92122fB1+8xObfhO+IMUvqyr19S6Lk7QQSr2T8QS6WW5SxZ0flGbGrQ8cjPAUwD+ukhtLRB5a3gAbRNCTzIkKQwHfAomgQZ4GD9yDIpMIEyr6+1qeyG/hb7q6IKQ1K/gPLL7qXCnkZhUStOXY+9GHNY00g6eFJMswPHnhmw+jSsm4fWKzdz5kwUhpzsNFn2rh9jonO6V+xBYWT5mofDI1zbqNFp8WeRXkRIoXZ1l9fX+GJdUeOqCL4A1t1XsSPH5guA5AFIkKjM/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGPnLAQmqj7Whsa4yy9m6HVCGSQ0x2mZZlgM8eulIDE=;
 b=j1hsXMuDD1Jyd35RoLEYpseM2y/mUF5s0fFsREZ2IV+MFQQUQ/lzXbns8OfY4kCq6roiSgwCx8oVYYgCqnmVvDazugQN07ygIL4drwbsOfGhWfZb6+uS46o3NadRHVxy+V5wk77igWm0oddCBnzihKwYwP9u90cdefyssS+4VdducsBY8UcQHsmxF0jlBGB5oUmSm2CvMWbD7LcRdOp17JLm4hGsBtHXRz7lmEKS5RuMMIFyPyeGONhgsm3uCE98wsSuMveHeRO3YoXLA/TlfCG8FjmgjPmIpyvYWRg6NQkRcrwn3i4iJsyURrAAYQ33CwQbIjMDD52xC3rLsW51bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:15:12 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:15:12 +0000
Date: Thu, 13 Aug 2026 11:15:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <an3tiDOUUYLb8PAq@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 9534e902-cd83-41d7-cb38-08def9560db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	M/7qtPRHQv01bkGdC8G2DOoqwr+ylKzHy5Y3lqWtoRirHTOmi+nRjSnXc5mNVayt+MLlfKTjmPv5tFPuFHdy9vE4WjWAxoM9rufOtwdkzRpzNKDdcNJUn0XoFKY9h+JNtg0Rmm5W53EYk4UFAASEl4+fiIcFdLqpUlScwiBsJy36hDDtX46WP/t+T/pn1riFz8YI566Hd1yVr6/bs68qbTsSeeQfFeTFEmN74uWkiSUGROt9UAJIEO0/m6iwfntgrVgRP2YqDXll2MlSRUCl10ukRgVRsYwA+JFOLb/jkOBXRcLvGq52A5Fq1dSGkovT7SiF/vIYVJ0goRA5t21KNyo3GGF4aGPOYsv9ut2r3bdLTJ9HtBYguCmeAE+Ml+rPbnzoAAEWdNIe7sJDPtHGApZ4Fry1iVXVWk9DKtr50UDNKWWEEG0eomS/nEc1N51auJrANDIiKeTM2gWgBTQNTXoDaBILmYhpQgnS5H59vHjAZ4IVw31R8CPGHrHYP4aBcF6uYcmW/SjMiYbP1Xfsw47ompKQy44KTMF6boPbBvjESCUAoqlxkvBW5E4hTnNlI6NYaUhxBkCbn2BnwnTI2O4UZYtHUHU34gYbxSBU8MsMoou+vvomNrXD9ENYmNwtZJ0WJkqQO8GBf7rMk4d1mYAP+TcFLtcmIDZTq883Tdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8cQcaacK3f+W8elmiWbiqGBDg2GPeqk/qMZkGW71xSD1vYAncWCQQ9cRKDb?=
 =?us-ascii?Q?146eW8xmEwl8pBT7WBEwdkQQ05vJFSppVLmtXa3GjJSxmMnG5j1ujvGuxAxE?=
 =?us-ascii?Q?295s3qj/EQyjDe46OH2DPNhlh3Ij0t60Lzruyd/Fe2VytConPcE5n5T3CTE2?=
 =?us-ascii?Q?Ai7DbzEh6gM7t9dsb+FixGlrwjT5LhlU2+pOIyxEaZRdqL/uxhtX+CWzWUQB?=
 =?us-ascii?Q?YOtN6NU3IiY1eUXBR1DSdNx5dx6EUbcgFnGAu2qylJyAMZ/ck400vQnvLWM7?=
 =?us-ascii?Q?16AQ2uDjVTTFSh4X51JFvHyRctO9tbwQmrIwdUEX0CEV3VzcZ7XZ7XE/eOkk?=
 =?us-ascii?Q?7da9ciAgfE5E3BysjoKBgDXwuIBEFwf6cnVNNCHYN/LIRqbeRGlIvWaaR7fX?=
 =?us-ascii?Q?rk6OManaH1v9oZnFK0t4RM7eA/pMpt1pxjgB0uhIgNYKrLsfSeQ814jb6gon?=
 =?us-ascii?Q?rKsBeXV8FIrVg/fiG/kYqhmNiwWr1R/KbT+TP3cXSh7XP2+OTqNbqueZ4Msc?=
 =?us-ascii?Q?cT6kck3YOQBHzv75wpvJmvXV2MVl4AyhUPr3x7/Gl4phNsf6PI1Yg53aSaRJ?=
 =?us-ascii?Q?zU8utkrNbywnheoO99lL7g6AdUsVTrj2+Ch5GFRZ+8rNCTGJ5Ad8Au0zEZ7d?=
 =?us-ascii?Q?7MolqAXH/BC6DkOs/6lPtN50CHPjnNhlHqU2k6aJlwPiKOHu8GosgZoLx82k?=
 =?us-ascii?Q?hzw0Eeu7pjIW6BO7El9HhmDXhhnkgPP8cOVv89sNcWWHB/AXioHbUA5hKpit?=
 =?us-ascii?Q?CiqC+lYb3A1906wLFbOokTd2BlnAOhMXNFRYwg+GKNxXOBU4mFHg2MNJAGlr?=
 =?us-ascii?Q?3c/OVDeiFqTNZF7f0KsgpwVXyCImUxroKGGZTDExBX5olr+YRKU6M9fsiaDF?=
 =?us-ascii?Q?XDIkUNyTVC49rNsjjzKhSSGMJTazNY3yqFyf/oQH7zgpCz0VrrJJY1PVKRw7?=
 =?us-ascii?Q?uM2JWmnPE9X7Mov0dp1dIvCIlYsk59FmCBAOV+OWeamJ1LaynpmPQhxewIxb?=
 =?us-ascii?Q?2Cr/Y6dhY7ftCsBYIrwAAbvlNlRi6Xy7ZK8/3Z82MhvrQ/3GcJ9i8BFMzV+q?=
 =?us-ascii?Q?j4gUSapKLitXEvOHcZqhgfU/JlR9N7p7Z/qifyhOHReUm8pHb0hwsKA6vXXG?=
 =?us-ascii?Q?uEvJl27rGuvpZ38ObbaPANE0PMGeHX8S/XlTl/4b+IXnDdxyWjn+2dmdplhY?=
 =?us-ascii?Q?aLKI4R2qyhXSlavw2FWAtYc/VoCApEdf/+XVNur+SnReYs0ahdEhOJ/1UIgr?=
 =?us-ascii?Q?wqufxqK79fJaxdRbXdvbkEpoE6lykYtpJkcbTD37Ti7jLap9lLAn+9e2Efhx?=
 =?us-ascii?Q?JsODq47mlMSAge6BaojOePBp/fMcvn6qSQN332QG1L9qGK9u9r+69TYhh8oK?=
 =?us-ascii?Q?kYf60VvmClyawftK3xfJM3XChYXZbyHi273RywM3BIuOl2uVWgdOz8i1nyH7?=
 =?us-ascii?Q?NXZAcIZuUKeQc1DC4oaxtWOXRynoXV9BE0JuGiwzm01/WC6LZMsi0DACqMev?=
 =?us-ascii?Q?CKyqGMDnNV7DuKbkYxOlJ+1SYUho49D4y0EmR/bG1rHPXhdC4zwO7uNuA5ih?=
 =?us-ascii?Q?VUff4K5s3OWzO+3NZx0ykSYBwgM0E/GfzTt48xBZ8xeiRCCXfgHyyYNI3u7x?=
 =?us-ascii?Q?tMKyYV/qNXoXcgohGEEW/KcTNOX3NGuH1ab97qZ4luhmU+Gz3QfPKOHzZ9kd?=
 =?us-ascii?Q?hLf3AXiKwmJxozo5/1+GBYjMV2Dflwv9FnJs6I21ZfFH0+JxUQlMaLFsgy4+?=
 =?us-ascii?Q?gwV5aqvmeRSKgGULZ+YsSaxbUeEH1IByHP57oHTP8ILeiaeZ/6Y1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9534e902-cd83-41d7-cb38-08def9560db8
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:15:12.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqIbV8FijPWcjPrH+pa6w7PexRLhHvf4+yNjXNpyyK3hmgokOvmzBmBUuzXo7sKQMxg11+e8QoCT/qVE6Cn77hIBpiofoclpDNEJpJ3OUxG1rEZBAenPTTLNc5OXmyVx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885

On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > >
> > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > by an ILITEK ILI251x capacitive touch controller.
> > >
> > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > ---
> >
> > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> >
> > why not share one dtso?
> >
> > Frank
>
> Hi Frank,
>
> There are two main differences:
>
> 1. The mezzanine one uses different backlight controll pins, so here we
> use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> in the one without the mezzanine.
>
> 2. The touchscreen GPIO and interrupt pins are also different with the
> mezzanine board.


And there are for imx8mm
https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/

https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/

Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
work on optimization solution.

If use nexus connectors, we can share one dtso now if there are not
clock settings.

clock patches is close to pick up
https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/

Frank

>
> Leonardo

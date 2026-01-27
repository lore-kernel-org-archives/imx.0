Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4189E3009C8
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536719; cv=fail; b=YEWEhICgegiFK+h8fDnZ8Mt+o7lR7OOLiChLQYNklXu880gx8Bj6nZaaMWhCoAGTGpPrXoHPCb5tNuV+iMHViQYbdbrN0mbiabYgMse9yUf+lvnM6oaxHu2pgUtj48CC+UHjrHr85QQVNBjNyoW+tHOELKPJvSG/zOvaTxUJ9U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536719; c=relaxed/simple;
	bh=hyVBQrYMSZGnn8ak+zlGl12Km4LTC1m7UABgCJgpWTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YrPFHf2CCNC/wfXCRejjHjNGn26PmRkT8pktzIFcqSXo9bEofZZAiXkD7oPfbomwl4Po0BDCHVNBDZunw0JUHAUa/g926JkikA7tlXCMFwE+hytKF2kyDQ2fDhZdVt/cLhqNSGfwCn6jwmRp3dxnMlQaojB97PPkfDcPRSxMWuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m6CTC5ta; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m6CTC5ta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unZyD2HbVjAPFRt8iZDpIVrdbyBfoD6EVy5s7SN+QskFd3JOTXaROyABt7I3o2jufXP3ZvsdlYnccxxhcimBWgNX7ZD2fHk3qadhXA36NrNKE4xn16AwLlG6NJpS9H8Q7bQQ3oc8Kbnegb70chmsXrqcc4dJ/wuIOscq9UdM/d0kHr7bQ1hCwAaZjW/orn+g7lDStLc5nssEXCOi3pzHXxb5TpW2jWAgbnOmfdNOiyzZnVBxL44XqsPLcdqgKJ1vT4Dv4hAIAm93O8Dpj51qWQelnwIVG2OImmbiS8ziuIj/Vy1Z+U/e2VMZEFKXAg4Ilei9j2ncs4ui3VQZl64TYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2zADYzSE/VGMjaniGjtk94Kt/NL45Fm18UUYyh3kFg=;
 b=rcMhwkMjqwjI5SOq+zgWaaJhfb40lZ5apuxixpuBO8rl8b71/QBJ4TOVQQEjilOcekOscmRkApBAeRNdE/L2j2ZXVQJCHtb4aRt0oQqw/Om+JcyyRz7xJddv7DL/ZvUoq5zfOf1H7CSigvgMqOeiTRxoxsRZp9Pk6mE7qTep4HDClPcCZozdvKwNfbaHT7hhQGSMqqDbTdyUYgzo/4s/j7kHU56VXN2x4XK8BfXBHziSHoxNy+4jM/Ripm7mkJWC6IBOP95EH8Bf5NM95O1oQoenA1ZaADhX9KqLSgqi5yTvs1nvvsS0JQqnVOLHUJ7suoNUObkBgLOFBXoOOvjeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2zADYzSE/VGMjaniGjtk94Kt/NL45Fm18UUYyh3kFg=;
 b=m6CTC5tarkAfYAc+VFKx9Thc43I4nzgyGZADkJ6NHbhzz5tfzh8siPshM2i4bVRu1heKYYb01IOw0cM6apOxTCM5pTl437yGAvBO658wSvuhTHkVampESXeI7zO48rmAWiX2miyybgGcDFkMqbPVj07Bm0s9hT9Nn7Hrgvnmlw6YVduIJVqYdDC88HYaUMB1B5Mc7I2LgNNjyJeDb0I2KKTEJS+VkN40yEVmOh8nHiENrynQShSwMH3TKlZB7vrpE7YcWEpvRh50H6lo3W3DHKFeD7wgJBBfeR/wQm6lcPOLk3Z4VA/f1Egzzjf/2iCcpImZ97yncIXw+sF2tw6VJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10381.eurprd04.prod.outlook.com (2603:10a6:150:1e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 17:58:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 17:58:31 +0000
Date: Tue, 27 Jan 2026 12:58:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Message-ID: <aXj8vuEnrr2ul6rg@lizhi-Precision-Tower-5810>
References: <20260127083727.1839605-1-sherry.sun@nxp.com>
 <20260127083727.1839605-4-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127083727.1839605-4-sherry.sun@nxp.com>
X-ClientProxiedBy: PH8P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10381:EE_
X-MS-Office365-Filtering-Correlation-Id: 19017ea8-25c5-4f79-cb8a-08de5dcdae52
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?HOe1PX/Mnw4jlH7fIxz5ETFVutl7tsFXGXuQ4pAI/HG1Um7nducYMTHUnjzh?=
 =?us-ascii?Q?NNbhsF2IEZ7HD5IB7gL9iGEC4+68pWgBlBB3m7Wi83LINWOcrVlDgqzyFTvm?=
 =?us-ascii?Q?qet97DXmbwaFvssvjnwsETnDQMC4ERc76/gqOk++pomV1C3eUSL7Xug2Yc5k?=
 =?us-ascii?Q?iQXjVhIHgH76/+QCEPu5+7YYkBqENRzyoeymZiQVcceWKbFsQnQlTpOIQ6pY?=
 =?us-ascii?Q?NfZy7Z5Gkkx2b4HA2KDLwIMEkQZTJbu3etmaBgpAw64VjU4THJe14oDHjBMz?=
 =?us-ascii?Q?r++TQ9tyQ76hP10HdQqo+xXFzlMwEliu3UC7OCf0MTZhbcZfW3oiHx+oAlt5?=
 =?us-ascii?Q?o9B4w9/mnM4pOOZJjG4Ty2apXnC3AwZoiOTRomqjsd6nu+kExX1cSNN6ooYv?=
 =?us-ascii?Q?VSdKreqWfrA6itx/AQ5BCvE9wgS1HxrjgC4cfUwaar0pkWnKkCM1PsnjEfGk?=
 =?us-ascii?Q?Scz+FiaFv4ZWKtE3ECWFL2+B3+S9qIn6i8na6Y05xCOnTjynINM/9flX+WY0?=
 =?us-ascii?Q?ma+wDTFkZswn0347hWwRtDNkGcS8qllc+HbuyCjNzpjksXGGO/5zdsXtRkbO?=
 =?us-ascii?Q?3bs944UNSLRvoswcdKj+3++q1M04etcNeoS0Hfgi6zAX9i+HT9WgNzTCQYzy?=
 =?us-ascii?Q?mpXvljNp9h4ErVcsSaWoHyYCNoR81PZmi6v0Bthagv5QR/EAVzVeudjidDzu?=
 =?us-ascii?Q?3klnnmXg8p0VVYM/4/9TfUX0P1YMisENXGHdxxobd66vO/ij+PyTbjEyyzyE?=
 =?us-ascii?Q?EbENHQnFTqdNOUSPzyO15nAJ5TaRDGQs6UzubV55e5gDZmFXGNOVO1oQiN2t?=
 =?us-ascii?Q?z1Q8wXlB4xeqnirJmRKRMLLZC8BTRKGeTutvfjbt8z5tbwDKyGL31uauGumI?=
 =?us-ascii?Q?U4ipVrjrHEdw1lh+jyet54t0nqZ+Ocp0cQdTrGkPlzoNvyL5LvX8gjzHIf3o?=
 =?us-ascii?Q?8wNbINCZnLozbsUfxtc+SfRL9QYp9i92Vp88vboJ+Za4JLaEtdOBm6JK0Z5D?=
 =?us-ascii?Q?a+4CT/cWftfL+6eJcTKbhA3vdaxUD4XLYrQmhpfKWBOVETFeaeWlHH8wLPSt?=
 =?us-ascii?Q?zagCs0R3GHG+tL7wTVwld0RS2QfubnIkWo4ACeWUT4Rih3Oc6ubrEpevnEET?=
 =?us-ascii?Q?OojkiFy1RzjSTK9E3hJk2pvFdWw/SBnijcDdEY3dcMMP9PtTn8Zu3GBrLSpu?=
 =?us-ascii?Q?ztyYcLk2xYK9HLPgl3K7vsECayBvYzEWyBk+LlNvXJNSbHSJYP50+sTWMA71?=
 =?us-ascii?Q?lHVHseCXkYNazradCsGiLbgjpLgLnOr8/6vyu2Ki5XNZto3JfFfYNweer/Sk?=
 =?us-ascii?Q?zqdacx0mT4w6+mu6RGKdOD6/U0x3iDrHJDA17Mat13ChvDzX062tsxMffF1M?=
 =?us-ascii?Q?5pnWLKG4tQofacsZ2PnofaCxo1Fw8b7ARa/oFhEd/GBwb7vZHc/+gmSqqc0Q?=
 =?us-ascii?Q?nrTfN/w6X0GkX1SP9SJYtHjsdVA3pK7SJXqm+viHgVen0v8E3+pKOCxNCMyG?=
 =?us-ascii?Q?obM79l5MD1i056TR9oqPhYi3InP7bJZiSYjYSGFBZVwc6ezE+23rIF8OBuL+?=
 =?us-ascii?Q?aJ83SZZU+MwBY6L7OTD8RbVsez5/Zm+VwdDvLJb8v1qyfb0V+UKDA65IywNN?=
 =?us-ascii?Q?+bqngBoNTVj8o+w0zIghsTQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nQUnPjFR+/A+YT7YpVUvNUZkHyTMq0qHGPe0bpAwpX1I3lrCXB9fnWMEuyBS?=
 =?us-ascii?Q?CmUiBCz1yA1Ob8kXoGWTNxrgUn8MQ5s4SuOV3lDQlKuCkNp6HjjosC2OWqMO?=
 =?us-ascii?Q?NqwSGLuUMzhj5J9lhq00IwkSRvAkTLQDPAeog1XDEiKW6hnSvKbrdTUZIcfh?=
 =?us-ascii?Q?QmGInSCQEUtMifFDAeu7zL/GL0rdIineDNkl0JDlYrA1P6FQso+WE8xpAtXX?=
 =?us-ascii?Q?Pchx07SLWqe8U4K8ZFICTmgQpyg7GIy9gc+OgrtkMZeyV5Wl+BQdTGznS8TI?=
 =?us-ascii?Q?qfwviivGZd76hRaMZJrtM1RWcRpiIkCGgzP4NLnPqJRrff3PHuN+TY05jLbq?=
 =?us-ascii?Q?Fth8hIswuHxNLYcergqjujKtWgu3K4Xn6n+F8WAwpwuEcibKYib0htUXjxqQ?=
 =?us-ascii?Q?abA6qhu4G4K6i0/Jqbgk5J/Xv5UpiWnOTcq0jl4jxvNqNo9Axhs+go4Fkw1Y?=
 =?us-ascii?Q?f7bZc4QfRZwxZPs2QGlfl+kHJ4vrtr1Vj0kNI+IT7UG0vcw0zHP1n2mDyhRJ?=
 =?us-ascii?Q?o7ItCcPHFEdL8/js//jLJ2CwYuW956G6QSZQYGwfVxvaCSBgGcog7S3hNqAU?=
 =?us-ascii?Q?Ogcaiz7FvKr6HF6/r7K1wtSud5BISWGBsc4tsdINZ2tEp27JIQ7Cigd3uf7G?=
 =?us-ascii?Q?3WZS8LYQiqon/0ATzcGbiRK8wy6KxZdGEhMmyKhHBT8EbMWoYGFIcfpbGytS?=
 =?us-ascii?Q?97T4iAFii0qI5yz8GtkRtF4LGooSwXeGHum/0tPVflDsCzG95bj+hoLr9y6V?=
 =?us-ascii?Q?yLghINKsM6IntmhYm1kt1b0Cw7UgnGdaxpPPFXLCvNW5NL/Jp+WK2drceYET?=
 =?us-ascii?Q?VHXaikfHwGxs9sCLEJSkv2q6TykUXkpdkvpTh3dxN45lC/ey/f2Sbds4Em1T?=
 =?us-ascii?Q?QjsMQYpD4TMNYLbQTQwwkUu8tpvVmTcjSoJXycTsEwe3zw2DOPMxzod8+Y4r?=
 =?us-ascii?Q?Fq2GqH6TaX1ircq3B6SHyPzGlYpZ8eHSaY2pEP1j820+0Rq+EHBs12VETHbE?=
 =?us-ascii?Q?Gf807MzI5UowDa1jGO85pbqR4acVJZfoAXBn7BXGcQlO5a1I0Pl+W8rwTG9r?=
 =?us-ascii?Q?KFpsNwi8M0ZNjpt9uFKFRn6eQqREuhoEgwri4O3ziGqop1BEXK1uqquIyo6e?=
 =?us-ascii?Q?a+5iirJhJzgQvr0tb0V3C4UfxoQam0Qh4jJBCZFZgOCtdneQEFJ1xUoNmH8u?=
 =?us-ascii?Q?tnQP/kdXNDm/kN0Izi9+F2hw5EWeeBt4usSeG/xMIJCvEUT8a/+bl1ee+c8G?=
 =?us-ascii?Q?VmWxybym8ekW7jBDvTKJTjo1KVJngs8jDMeH0io22rsbA5MTMyVa54XdG2Bw?=
 =?us-ascii?Q?rrerc1WB+AvL5M4tcFTRhmGRjajzO5aQmBUzUrsRx/+yNxPqNx8OChhJQEk9?=
 =?us-ascii?Q?ykYJwS+wQe80Sbje3EY/cwusydTG/2CNCUK5Xr6YKdu7ZxHUepgORb+YQGrJ?=
 =?us-ascii?Q?NWvmc+DgP1aQnBlUThV3DFLBxXBQe0jSkiccMwdgrimggwSwahQhoSDBbu9A?=
 =?us-ascii?Q?cHp1YLoyS1jWvU4+41eTKLXJWS9wG/zeRymZx26CjliMh+bDnCU6I7k70Fyn?=
 =?us-ascii?Q?DeaQ2tpcymfZKkJN0KSj3c+2qWndOYC1hfSSVNoHml58FeV6DWckIkrELw76?=
 =?us-ascii?Q?r4YmyCYLmbW7iKBftzJXvjth2tE56n0hYQm2SXYXAO+W0WAS3u+PLAcULrIn?=
 =?us-ascii?Q?u0qmTOxjvDvJHvUAloy/n2uaxIrZPzAG++oI6ofPPb2HMGIx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19017ea8-25c5-4f79-cb8a-08de5dcdae52
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:58:31.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsQ7FqdZx2ahZBx4PU0T2z1YZKpVUfHgQAOGpbFg+cnJDeDV6HbL3falJmU0Px1JaxlfUSYSdi2AI3zrQAo0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10381

On Tue, Jan 27, 2026 at 04:37:27PM +0800, Sherry Sun wrote:
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93

I think most important is that need common part for SIP.

Create one imx93w-sip.dtsi for wireless part. So other vendor can reuse it
if they use this sip part.

Frank

> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences. Reuse the new
> imx93-evk-common.dtsi and add the board-specific changes here.
>
> Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
> 11x11 EVK board.
>
> Function differences:
> Function	i.MX93W EVK			i.MX93 EVK
> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> MQS		N				Y
> PDM MIC		N				Y
> M.2		N				Y
> RPi 40-pin HDR	Limited support(pin conflict) 	Y
>
> Pin connection differences:
> Function  Signal name	i.MX93W EVK		i.MX93 EVK
> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> 	  SPI_INT	CCM_CLKO1		on-board IO expander
> 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> 	  PDn		GPIO_IO29		on-module IO expander
> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 52 ++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..d0ea746c59b8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> new file mode 100644
> index 000000000000..ea76d5df84a1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx93-evk-common.dtsi"
> +
> +/ {
> +	model = "NXP i.MX93W EVK board";
> +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
> +};
> +
> +&reg_usdhc3_vmmc {
> +	pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
> +	pinctrl-names = "default";
> +	gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&usdhc3_pwrseq {
> +	pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
> +	pinctrl-names = "default";
> +	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +};
> +
> +&iomuxc {
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO29__GPIO2_IO29			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO15__GPIO2_IO15			0x31e
> +		>;
> +	};
> +};
> --
> 2.37.1
>

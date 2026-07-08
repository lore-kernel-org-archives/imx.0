Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57F430781
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523132; cv=fail; b=NNjbxz5wC75M6FpjmqrEeZigvF4CvO9GYtu9MvEhxq6pwPxE7nf6lKjkHrd4vCaNKngR3yS3hOi+6T1KtuEawhqIpm2XoxykoZmPO9YKZlaSaWL8zXRXTq/WrlcRD5E2OAM0CNnVNyyut4+anLoUKZ1xHHAsBlS1KjgtNokViF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523132; c=relaxed/simple;
	bh=k4jNa+sPbrm+muH/KQSEBO6e4WuNx90pp7gxdfgr234=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZCqMDZ6CamtR7tyAGK+dVrBklMdrf2i/2uVszq0tjX1bxGcT1G4NbOmEwBxPKPgWbvXetPlizzBBEK5EkgPyHWrPSVunBor9H8P0VhKlBwzpnPM4eLy3qwGwZvKxkSfa4jhDFaY0Xdm4XUfCJBL8jsKeV+iY3u7SIILoq8n5pKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VMyXfMwA; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VMyXfMwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbY5m8XgU5MQcfUj2vTLJGzCMScUqeXpIxldmwDjCOkksGM2AfihKUkRwnosQxm38FBtl7ZiRXbaAqypyikcX89RREdKewT7abjQdSo1l7aOPrCOzunAkveLEZ3DS86q2Kj0G6LUxQVki4nJ2Sjrgxzinc0dajmoFgvisRIJI4a2tWGDeMNZjHCcMjtunWkLF/V2y2IXnz6yIZFeI1m3m5vhnzW0VJj7jf22arSXLiwNfJNtwsSQUQZtfSqj7XokKJwWTsU7ROUcLWA6dkh2QOfGo9iFuHZXbidLLBLeNtCWtUD03MCU3d2MT2z9W/1uwgmuRUIYs6dL80VscXAM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5BM8hFMOpOEi6oJ60bZNA95Aeiqe5CgLvgjuL5GOco=;
 b=BQZvqlgIEFHmwoVlDDqo5AszSMyyh8ljETCFUohrTJZi8aztIH7ZGj8xfc6IaIxpCUqXLCvB3jGQ7e0BhNztZbA3dohcpfTVODu9vKq9ATcIILRm1X/GW0UgybAFP/UxV8KQ97nbFZGRiWvMSefgnX1WB0tSL3XMlLALsgtix3CAu4DDqNp2QaHiulPiRWj3i3V9HUGZewImx7wmFPqBAlA6SfFn3tb0cnzREw7MXuYYAHunpmOdwqia4tbBGwEsQBsHhzUAA4lo8oCpMXCUTmWtTMxT4OrLjf2aBItWe5uoJGW8Z9riUjCr5gsyaaFcy6gTqzhzGcRWsI0ObSDa6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5BM8hFMOpOEi6oJ60bZNA95Aeiqe5CgLvgjuL5GOco=;
 b=VMyXfMwA96WdAGwCMdWFUyu9tF38T0MqV4FInRDtJSkGFQjpGXLqCmfaxKXpdAqdSKUCmu2AhD+YzpQkck7HmYXHl6PvS60moRceSpt7yjJj21ibSeEheUKX16UveD8ks1BWHStJgitpAu6krxnJHyOn5Do5iqErtY93z+YLasUSY8Ey+ODtRsQv/5duz0aQ1KTZn3lFynpsbbScxKGGEbjrl3gjeDK7xKhjlqRVOK18WF0oLW3h8ZQPdWBW06utM8yazqKvgVPCoSMHQCg4HBEGsa/C9UawJ82wBPlxLtBhi1e/NXcNILCw1fCD3PVLherxIBdXNU/cgo5qz/zPxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11034.eurprd04.prod.outlook.com (2603:10a6:102:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 15:05:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 15:05:25 +0000
Date: Wed, 8 Jul 2026 10:05:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Message-ID: <ak5nKnRUmOxDxgZd@SMW015318>
References: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de>
 <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-3-dfc0c8827c02@pengutronix.de>
 <akupDXc1QA4uKfR6@shlinux89>
 <87se5ukpa2.fsf@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se5ukpa2.fsf@pengutronix.de>
X-ClientProxiedBy: SN7PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:806:125::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cc5e9d-a67d-4598-cba8-08dedd0256bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Bd0iHHWtDlrKYh/VyGQGTOnLGW9jTczLwJv/jxQ+SA8TiWz4aF0K3IkYkJEy2FpB3w32feYbKMYBzs7fTkewjb66UZOkwoP+tA/PvFFbZ5Th0eXG/6QOk+/gZj/gB6mE0Y1fqjZUWfR8QjzCngIHpRYeqr4xBQ7mWTe16bD1mefeCUQpF+5e+/Ipksr5yVmKn5vx66Jwyq1SODkXQQIs+zrgFOvjp0VYh/M3XiB/kMJSf8zjwHZcbi3LBc/BEe81I3LjFIl/9YDcNDfIxaqJcbzFevRPIu75oWuuk3roHdPSoZ7GGgjlfufsKbXj+79Ja356+YqoYNl2el5RXahhmmhQ8AyiURXZHg4CqanynSenoAROGO+6dJ11TwFsvPDtRo71oniIDKOUAay4RhTHQOnjZmOqdSVxzYQQR+MbasQqeHFds06H4ZuX1SAv9q4vMHq6WriCPzxQjNZmvYDMlrhW+V82fIXS52xHlfKOZfNHMGG2ruT6Ssw13oz8APamaUpZgTJ62ouaNIjcGH5VUF9T/4Ui7aCffNMimgRN9HW2BxgFMhCIS1HA5NmGmb5DwS3OYL+y1YjSWmmPCf9tLp/3c/0+hsPymCFeQGdZIkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9lCF2v/9B6eOa/bjHNRfQ55kYdORfAatttX/Jr9NDHFt1MtE5Z0I1GQnbzON?=
 =?us-ascii?Q?B/XbwRux3BshA0xaZRM5UzMJFA1ENVhVyJSLl68S1SekqExjeWodps7S1OOu?=
 =?us-ascii?Q?MRN+ZJGqoRj6ugD1eb8ppKPfGrson0DDMbIdyZtvuzw/6hvxhvTevs9X1KtI?=
 =?us-ascii?Q?az9Ufc5b9toig0HrTzFU9sHFkadkPb0G7Ux0YEAmNHue4q3HMvRWqW0+0Z80?=
 =?us-ascii?Q?Uq0hAuQXogAiP0pVK4slzfH88Pq6K8T+Y9hQ8nkVBbeBZHcBD1jYaHNE1Wyz?=
 =?us-ascii?Q?TWowBNxF2F+zZu/kt/PM+4sVfilPK/ly7m5vdi5TI3UQTpTHwiHy1UPoq19z?=
 =?us-ascii?Q?EdxJOD2hJ04e4Vm3cRXEU3wUVlRvTJGWIMhjPa8IgOsziobZl1f8ztMOXKSw?=
 =?us-ascii?Q?AqwGIaHcMeTevJQeAdNoUy1OX9l2AVhNC70ecKPMyhsyKYvChU8zkaIfi4Zq?=
 =?us-ascii?Q?3z9VNAsHl+ueNjjbtAnYFF4XTezQcWs639AvwV1fMRyLdEevIlwa54i7CKkq?=
 =?us-ascii?Q?LfP3XOI1hEsPnvAutgTlhpIKEhRG52JMXkvHqP+e5ijC58rILKNl6GHC4oD9?=
 =?us-ascii?Q?8Cz4YfKHygypk8FSSaPAjcQJja2GnwTODfc2tNvoBHyubnz62tjzizwnboIv?=
 =?us-ascii?Q?/hIuZ05GPoAIA1xiR3LhCEPH2yENo1Cfqvv/fhL872a0UhSqEtbxekNUl6d2?=
 =?us-ascii?Q?vb8j82oDj+DJCnyLkFbMEGrvzEKuNuyDn78M3u27aY++XQsDltRdWI+HRmfz?=
 =?us-ascii?Q?avWiMJzhL+N77TCotlNr4f5g6S8IeXFU8stU/6QV8zVvp9t8Uj6kfTyksha7?=
 =?us-ascii?Q?jNUX/Np3O/gXkCLXg/GRhmaFsvGHbsviPOcthM+CLE7k2RbGJrm8RI9s0mv+?=
 =?us-ascii?Q?tYcnIQWVig9jVDifhDmDYhgZtH6/RPUgQSILvZPURz8FJBcUBF0ZKp6O/sdF?=
 =?us-ascii?Q?qinCwTfaM9v5srPVAGarybhn45q678zkhdcKoFiGeSb8iYUeIwMLI0n8yJoH?=
 =?us-ascii?Q?fPX9DMSzNoDL3SUdpMjXQlIaFYzrqGahep1V+LsgO/qKbn240JNCqIHeQqKw?=
 =?us-ascii?Q?loJc/fkj8u+TQHSpickYUdmUiqTXE14x6C3SCzkkfvMvWeBhtHYfWal+s0uW?=
 =?us-ascii?Q?SK/3cYamQ2pF6Db9/kN/XmBjIit0DQz7oHMKE4/w5cjpFEJgpCfhhhUYMLIU?=
 =?us-ascii?Q?YHinwzKm5KPt41ItMepn/7IBsEknAtitSVReedQiDvag2BzimM1yIcUZZsfq?=
 =?us-ascii?Q?r0Zrm8yKxJqGJclGTdhsrBFKAa25hXZyTLpgHZ1hB+0JOlxixMxCIKTzGkt2?=
 =?us-ascii?Q?9WqU+tE/IXOOmIET85WwXV6h2DNj9Q7u0a1RvaIzqwZMwOt+HIl2eYC4YKgv?=
 =?us-ascii?Q?f38Z5c/U35uMMi4TEJ+wvO/NKzCZC1EW1376xWH31OLne9iV6F9C2LLN1jUC?=
 =?us-ascii?Q?4su3eTysN6Tmol0ynYMzBaOlA1LvnYbQwS/kYmi6y0NeaZyPLsVLIA+bWcOl?=
 =?us-ascii?Q?vIITBjZTBpASh3wy7+K+FZlDSGD8XOy3Xd4OaYQpnsIW8Uk8fmhnr5taaBJ1?=
 =?us-ascii?Q?whyTCyPB5henKV2fZXuD629cBJNPOjVEtF2hG9waE4pksTUPtZ04FUT9m+vY?=
 =?us-ascii?Q?P0r2YyvK/5vFNXI315Cg27Dhnbp1mfTrTREqdF775u8LtC2+C1CmUvZ2jhyI?=
 =?us-ascii?Q?50j+KLz0Jv1c1gFwrviPfP29cqsgjAEn4V9dRp+MBRswssuKr4hFosyDU3oa?=
 =?us-ascii?Q?1cSBqARU8uIItJEhlEiN5SscDEMnwg43LZrP3GeB+M6MERnylvHq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cc5e9d-a67d-4598-cba8-08dedd0256bd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:05:25.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm37xNIKGEIzqyyvPYutBIDFeDV+UV3q6Vq3sK6RNvvT7WYzVXDjw7D6jriaRKWJz0UeS/PKxMYj1jxe0rUVqRk1rPghZnYN6i2FmPtdl8m2JNm0uukZGQvp19XULYDD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11034

On Wed, Jul 08, 2026 at 07:45:41AM +0200, Steffen Trumtrar wrote:
>
> Hi,
>
> On 2026-07-06 at 21:09 +08, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> > On Mon, Jul 06, 2026 at 09:17:57AM +0200, Steffen Trumtrar wrote:
> > >This board is similar to the already upstream
> > >imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
> > >different touch controller.
> > >
> > >Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > >---
> > > arch/arm64/boot/dts/freescale/Makefile             |  1 +
> > > .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
> >
> > Sorry to jump in at v4.
> >
> > Compared with imx8mp-skov-revc-tian-g07017.dts, the differences are mainly
> > in panel and touch.
> >
> > Have ever considered using overlay?
> >
>
> no, I actually didn't. This way it is easier to decide in the bootloader
> which board I'm on. I could definitely do it, if this is the way to go, but
> would add some overhead on my side. I don't see that many overlays in
> arm/dts/nxp/imx.

There are much under arm64/dts/freecale, arm/dts/nxp/imx is old ARM7 platform.
Generally attached devices use overlay to descript it, especially have
differece devices, likes display panel, camera module.

Frank

>
>
> Best regards,
> Steffen
>
> --
> Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
> Steuerwalder Str. 21            | https://www.pengutronix.de/    |
> 31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
> Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
>

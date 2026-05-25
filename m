Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7723914F8
	for <imx@lists.linux.dev>; Mon, 25 May 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701045; cv=fail; b=k9Vq6Nd7OdXXL0il4DzkZ0xIjAHZzh2QjMiQJKUxuPb9dh70tO44eVYMXFWCmoCobzM7ShR4WgeUdLQ53WpHbDMChSHrZA6I7AZY+yqOjfTyE1ASx5BsktU7Ww+IAfXDrd7S1bkwZOZtTBwNfQdJq23Ob1RcxtZQpOstuVwEsiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701045; c=relaxed/simple;
	bh=jbUMTvryz8OKkHYhH5FTyKWFKhrQHCkZuxoaSyZa3Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MvwVzYdINcAPhq9U1M1EufOV3A30DIem91bGS+0BFRI5R9SGizPcAJbvsZKrYdZlagPztuGWn1DsG3Kbxa6xtfXnsPtnsbvAJceFw+1VAhSqBdXo4cBhkJf+t09DgPmutBJWLzNSVc+TLnzsMagyZV4S0Vqsiz5KqClFa4MX+H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c+gHXmRy; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c+gHXmRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfAXMTPHapPFZ7x+qaZiTOEDoycxrUWKQjv/CJstSdYPJrwrgjUqOBHuaNj/ZNAVJSbjSzH3XVpszrOHy0DxXwpkJ66ooDyImDheyAc0/drROQqjl09g0A2uPL74V9ri3cqADTu7gnFEkQjKY4ukAGWymDXQCbN6Wyeb1mEt6Ryayt+xuh8WxZ13Gc0sTeBMfafdss8TuPs+ptvdVZr0XOw82vnUVNzi4JP/Jjub6tjG2WyhCe+8DYgcAAWYjqW5Oj8Bn5ot3K6XVSFG7R3N5swPqbHK13GFleFe1laig1/uyWqAmHqm26I2rZKEd6F3g6rN/7q5L7hj7AgkpOHtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01J3qiexOjdO3U2vGPz6oDk4u0lA71pdSq0cfvenwD0=;
 b=UOjFJq8V8C0lDd3tkW6PHLIybD/gsSDS1qIS/Wugua7MHuYAuNnMjF2yESTzh30PASU4lTvsOScSXpihg3cnaG8V9rQqo6QNQmW6PBx9uhpnWrbfC7TMeP5OLLRsesT/RsQ+LaeMsy+Uw7sYJ8ECiiqL9KqQhMFp0f8wGmsbG77DVqF3d7MJZ7ptKpifJ/e0UJ0MsXbys6xAx2vqP+aByGeTdZ7nGKEf7nZE2jNiPUVkU2YO7zGP5Eo9HqPjq0wJ6whjI0JHlufHGxCuw1/pfj8WOOww8olPVUqTBykOumjVgu7mqPErtoyp2GfmtsKGRboJvn9M+qbCV8vEAbjpGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01J3qiexOjdO3U2vGPz6oDk4u0lA71pdSq0cfvenwD0=;
 b=c+gHXmRy7cI66HldtuItz5/ay/ps4r24IlLABGwGsP6lo+uciMwjK1QqXC2oKHsDzfKDqQk2ljcEJhCRKv3eTscLuPdUeXkM45PfSPnICLj1zpMQ0Ykv55x2UuQNVtOQCrzZN6dv/0wVNTYM8NdwUh3F/GLrxZLdZAa2OMFzDWyBsqi915jO4tFNoVvewaRdjxERA9RVZ0U82P1c5XU4oNKhdIqSsAGPzqShrNmM1V38VQhIseIC07yvlqtP5IQ3kPMsk0xnuE3W3BU4CSoB6jYUSi4JJlNE8D9zd14HDH1knoGbDAyqLkTvoFxR9OlT5HTrb/BfMkgrXRzmaG2CLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:24:00 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 09:24:00 +0000
Date: Mon, 25 May 2026 17:26:17 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <20260525092544.GA2716225@shlinux88>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
 <20260520065452.GA2269979@shlinux88>
 <ag4C6MjnOJGjEpKN@lizhi-Precision-Tower-5810>
 <20260521114952.GA215762@shlinux88>
 <ag8byj8ZavKyxWRR@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag8byj8ZavKyxWRR@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|AS4PR04MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 467c6fd9-ed11-44e4-2f02-08deba3f5ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014|5023799004|6133799003|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	q+KUwsVJ090Vo1QaJxg1XrGDu+5tmS7hE6kAJ5CyeelXwb9UvnMc6pY0VpiA3f19aMUH3RCd9sVpBx4X5jLfNe/wYKUSTEqo6kOxOsmKOi42eK8hE5HQU7S9Esqd8saoMN5d3YTxoHa6oU7A+x0IdiCL7QpZJ/eDo4DuTuv115ptf0Rq9ISCwfao8jIMKuvyoAOdiK5YVCS+cwlfQzsRmaJS2WYSeIFfGbWSLY0zN+DUAK8mr/YFmvupwTlaSvUEOpueClbquPq2tSrBmYD2tKjEHkg5pb6+D8qw1XK3Re73So24ovESoPK/jsHqSM7HFTZFOq2+bmwEdmYkrhFdPNyoAkc/NQu+F9G1hE1tRzDfoukggiuXBIycgcDBdj4gtG0TCI2Fwig/BwncchavDoKL2S5A0tcZl0dTpa8CZr/eGBXJkv+3y2O1UWjDU+odKvb2ccJ6hgdUfSWdti0K0OPXvnU55aNFHvlV7ejMwfK17F41CeGQ+9fGKKpARRnTnf3TsyytWkR8VfTRkNQEEMlGeL/yNOvnIZREkCCwwguldZrtaji3FWgWmvUSffSg3GyW7e5Yar6hpNzMSPxZWnmHIKwlSdpqi/eB3NNQtOhVe0zPdG2ZnGWA3u7bkmX0ivTzbuIWwT6gu0N5koLJJ0c3/jZucetSNXV5S2FrY827XZMb31ynFzrweJYftT0YPLxVPtUqi2vkxWrgXEuIfLhNYCozAcK1QADxMt3RgEEh2+6bwUV9UitkaoqHe6/5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014)(5023799004)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b8FC6eukAlOPc/faefJ6BjypVm9Q98UDFiYf2krAeuqJ7IHjQKaMsAXnn0tE?=
 =?us-ascii?Q?rgU0ZxQi6sNQAzrhZmxQQWnjUX5TcC+uozNk+u2tPWiTmgbhJLmppv0ts7DF?=
 =?us-ascii?Q?tMUGHoa/InL2ZYOM1u+g0howu9uOGEr316UFlaRlBzOVgmGyzYL5ZziID6rj?=
 =?us-ascii?Q?iC803FLSow7uEroiwRvHPAJodyPTtxNSaSwBGSxE8iuhojSeHhLOXCBRYmuQ?=
 =?us-ascii?Q?tA++e52E3uucyqCbyg8xtmVaL6kSXkaC3YDh7R6mGisbidJEGzXXwQSZmcUm?=
 =?us-ascii?Q?g0tpMO/wCMFKL5mcf+oSLe8qCzFkdwy7nLl1uld2TRYtMtrBJjRWVuQLTQDK?=
 =?us-ascii?Q?PR95f6PMVHt4jBuONTURGLZWppOOTRgVA7E9H1In1JrWQJYVAti1jQmVxGVX?=
 =?us-ascii?Q?sZ9kOR24L0O1MqXhvA1JgRnrau8DrPZkfxxv4r+PZ1nerMv9rsIQb4hKJEAD?=
 =?us-ascii?Q?/cEiJmqBcuKH8fjPoJAuHwy5sOe460f3/gF0zNZ9d9PtlUyTp8duiH0d09Nc?=
 =?us-ascii?Q?KiL7TERmWKhx7it9eQX704DJgj9LMCaH869Q8Wcd1OwKL34KxeXU7FUIRNAt?=
 =?us-ascii?Q?XpJWtt/UF/6QiR7vWT/NWoNIi8y5RDyrZxiiIRZrzcRKyyEmWIahxhiSmxbH?=
 =?us-ascii?Q?pAH7BchJboitrsSWwsLep+QU347gt+sBmG0DBvJBovp7V6W1DILB5TODNRjB?=
 =?us-ascii?Q?US4uKIpsx5KD0cXFfyO4JDrGc7RLRVJTpp++UYRrew4YabFzPWafS5lkKCXX?=
 =?us-ascii?Q?kmdXoXxy1S+118jHj+e8PmMHnR/6ebPcFAS88T3+XT5wDLrUA4rJvN8buJkC?=
 =?us-ascii?Q?x7ZyUZNgUDP8aygdxa/q1lDCD/G6DBczi3mACqy+Mew7oFWvKAl+6w/XTnN8?=
 =?us-ascii?Q?ysR0uQlTkVKlF+tIAsoQkDsvvld7MQDX33AJcp3VrPp221F5XdvvM/THw4B8?=
 =?us-ascii?Q?K4lL4A1ZSGx9mWSYLdQPbcoliA+3pQJmvm0M6nIKKllAEqn2BgJPQnZUG48z?=
 =?us-ascii?Q?cQRDGKcwNGbF4t+DIzmZsDcnlVPQo1CI2YroPojCpb7f+X9IJKQjBzVqfuhf?=
 =?us-ascii?Q?HXK6RJH/n5AN9k6fs9aUgZ8DuOmbe+mG/pvpRa1+q1CzGged60hfoW5lXdZi?=
 =?us-ascii?Q?eLCjaYLHouU6yCJm+S6Pj9QNvVD8d/KN6f8EuQHmPZ5FfiDY4fi6//7ZZpPQ?=
 =?us-ascii?Q?G3fFwvfIfNeB6IM3qViyntVcULY87SuEHsEPSU9cU2DHErz8FHvCA6T8/O4Z?=
 =?us-ascii?Q?cCR0BsJ8cvy6GxMuOsuFEcpJNdJvUMUNOqx/fkJzF4ZaNRX1m49etLwzUsAf?=
 =?us-ascii?Q?UavrrTlGhIi7tqvTK6uad4c9mzmwELWuuF4MUchNj4LyZWUHxm/HQjO6rjCJ?=
 =?us-ascii?Q?UY/bysrt0YKV0GYAUOYQvA38qRu5jus5H68Ub1hFBij8hloLTDpOci8XnKQq?=
 =?us-ascii?Q?a2lGv8mfPgh2tW/B1b3C2cIJM71qXlsLKU3ddCkVJRSzfxuv1bwzyD9Nz6sA?=
 =?us-ascii?Q?AgpNZ4YqQ02FdB8SkeGD84GD93H+cacw/4Sx8yhQ2IApv/JigOPAsayymczB?=
 =?us-ascii?Q?i+TEFw10zC8ITSzzGgrIBrp8GRm+J68fmokcoDEiQuBq8IIspT3Hyis2GOU2?=
 =?us-ascii?Q?FM8IWnE/Vz9BJFtDxGJqac86IUTfi4M+p47hWapWQ4tvN7ItuelBsBMhpJC0?=
 =?us-ascii?Q?uOFQBI2LU8D3abB1vp900rqFxZi7cq0N1BZ3ckHhA2oMAQPLHtDECHhZ0eb1?=
 =?us-ascii?Q?zaxOZi9tEQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467c6fd9-ed11-44e4-2f02-08deba3f5ab1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:24:00.5759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFxPDkCrTWgCq/I23ohj/SbDfrK6nKBivEQ9qdfcv9pLn2vtu6kHz/lH6WxLaj/tELdJsW5ttR9DaTirOK1thw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

On Thu, May 21, 2026 at 10:50:50AM -0400, Frank Li wrote:
> On Thu, May 21, 2026 at 07:49:52PM +0800, Robby Cai wrote:
> > On Wed, May 20, 2026 at 02:52:24PM -0400, Frank Li wrote:
> > > On Wed, May 20, 2026 at 02:54:52PM +0800, Robby Cai wrote:
> > > > On Fri, May 15, 2026 at 10:01:47AM -0400, Frank Li wrote:
> > > > > On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> > > > > > Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> > > > > > on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> > > > > >
> > > > > > The sensors are connected via I2C1 and I2C2, each with proper
> > > > > > endpoint descriptions to form complete media pipelines.
> > > > > >
> > > > > > The resulting pipelines are:
> > > > > >
> > > > > >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> > > > > >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> > > > > >
> > > > > > Both pipelines have been validated on the i.MX8MQ EVK using the
> > > > > > upstream OV5640 driver.
> > > > > >
> > > > > > Both OV5640 sensors share a single reset GPIO on this board,
> > > > > > which prevents independent hardware reset when both cameras
> > > > > > are enabled. As a result, the reset line is kept deasserted
> > > > > > via a GPIO hog, and sensor reset is performed via software.
> > > > >
> > > > > Does reset_control_get_shared() resolve this problem?
> > > > >
> > > >
> > > > No, reset_control_get_shared() does not really solve this issue.
> > > >
> > > > The problem here is not about software coordination, but about the
> > > > hardware topology: both sensors are physically tied to the same reset
> > > > line. This means any reset operation will always affect both devices
> > > > simultaneously, regardless of how the reset framework is used.
> > >
> > > Reset framework is resolve this problem. It is quite common that many devices
> > > shared one reset pin.
> >
> > okay, I'll try to switch to use this approach in next revision.
> >
> > Some devices require coordinated RESET and PWDN sequencing, but in this
> > case the device can be properly initialized with RESET held inactive and
> > controlled solely via the PWDN signal, which makes this approach viable.
> 
> PWDN should go through regulator interface.

Thanks for the suggestion.

Modeling PWDN via the regulator framework makes sense, but it would require
changes across multiple platforms beyond NXP. To keep this series focused
and easier to review, I would prefer to address this in a follow-up patch set.

> 
> >
> > >
> > > >
> > > > While reset_control_get_shared() introduces reference counting to avoid
> > > > unintended assertions, it does not allow independent reset control.
> > > > In particular:
> > > >
> > > >   - A reset operation (assert) will still impact both sensors.
> > >
> > > yes, only when first devices toggle reset signal. Second device do nothing.
> > >
> > > >   - It does not solve the requirement for per-device hardware reset.
> > >
> > > It is hardware limitation.
> > >
> > > >
> > > > Therefore, using a shared reset control does not provide true isolation
> > > > between the two OV5640 instances.
> > >
> > > It is not isolation. Just don't allow second device to toggle reset pin.
> > >
> > > >
> > > > Keeping the reset line permanently deasserted (e.g. via GPIO hog) and
> > > > handling initialization through software/power sequencing is a valid
> > > > and practical solution for this hardware design.
> > >
> > > If use i2c gpio, expandor driver may probe after sensor driver probe. So
> > > reset may happen after sensor driver probe.
> >
> >
> > Just to clarify, the reset GPIO in this design is provided by the SoC GPIO
> > controller (gpio1), not an external I2C GPIO expander.
> 
> It is just special case. you touch ov5640 driver code, so need consider
> more general case.

Yes, agreed. I will take the more general use cases into account.

Regards,
Robby
> 
> Frank
> >
> > Therefore, the "late reset" issue you mentioned does not apply here.
> >
> > Regards,
> > Robby
> > >
> > > Frank
> > > >
> > > > This matches the intention of the upstream changes as well, where GPIO-
> > > > based resets are treated as simple control signals rather than fully
> > > > isolated reset domains.
> > > >
> > > > In practice, using a shared reset here can even introduce subtle
> > > > interference between the two cameras during probe or power cycling,
> > > > so it is safer to avoid using reset for runtime control entirely.
> > > >
> > > > Regards,
> > > > Robby
> > > >

Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA436165F
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081936; cv=fail; b=NWJaALbs4XK431abH57mnD2i4G9Dkavbt3OdLoi0vaQZmC22wGwV/ayaevt+3iGPvj/rGcfbD+3jpvx7ArBaHqo94B4i1C6+4JOfz56A8dnomRH2zOcDjdOfg6DD1GqinfCsRt5DPSwy0YdNa9yiPSmPLcacQX8J/Sz3yFTdLus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081936; c=relaxed/simple;
	bh=yA+3JmxdAdhQQtC9P6HFQzJeEOxarl+M6NMxDSsnsdU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=kbeRwn94ML6KzT5WW7ryl1qL+84KBjg35tcnaDD92cqyij8HVPbEuManG7Oz/kO33rMRJ3tWn7zrzVvMIXatLFB60PhqYE0DhmnQf3TIeJrPr4mTToOeqSPoU+j/rAmamDmnnTQtTo691LR8g+vlS5Rpk0uHENZ7W5TftGG4x+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nZyOEpUv; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nZyOEpUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcJhay66+O5KuNQmCEwZNQBPinsA/DJTwt5j+iP3Z5D5Fz4nrIe4RprPvPHOMbLWH1C3C9kcR7jr4RDyS88vzhKJxxafRDHW5pjZSCsayICPZTEK5ding2pmouQ7dt0Hp1IoOHqd4jmZ/Rj8elgVd6Vg0KCxz4yppwpMXuEfgYBq46AFo8wCVwoRz+icIwzPoYSz7OzBnhNfAlIITxyx5AJNIJYYyKTz2Xbdy+wyox3g4uU+GsmugRE4ZMzWfPh0DG8oduWApApaCNp9oDIoysStxXs/sfHM/mfEwHeyErKdlQxf0nluRoma2DNqLvT9DE9864dqUyiKoxuvb123Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8GW4aDxAlbd4AN3n4gETE8XKCNgUG5W3LY4XnlasB4=;
 b=WZv3IoUULwfDWluO48iATib6jkHa9Ztkzs3BtaR1IfSP1LvraVIrOTaVO6M1N5Gzs/wI5jGYQOwVjrbs6T/FGbR0mwEEGwuRARbp0xEIQ9yqyCKixOL38gm6C7Zr3ofk/+UNs4AKi0EoRfHvRXP+288U+T9eJVZVRhiNShJLcelMvYbvEDTK7GhpvYT6pQj7b/RLl4yWu7v6HBLcRkkDHyaEnMijK6ajfQmI8jWvXkJG8XOIisH/nDxHhBxKaN9lpEMCfn4eQyksakfQeA9zb2Vvgvys+MSaPkBIQSVnRMdO7ZpRyx8wqIZ1ofZGgiwllcVrF5Sme0MUOHYXzcgG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8GW4aDxAlbd4AN3n4gETE8XKCNgUG5W3LY4XnlasB4=;
 b=nZyOEpUvJNqlLfSO7Zc1jMKDsQrqZ3hR+/8QD6U8gsmuThO/Zfq5IydOIbIfInypFSMONdqUdeNuXLuLXQ13qXORwdWgvxkllI07SDVRAN7BxJIdFxB4vDvrYhT5N2w/EGguCjW+E00emlettTl8E0NiPknWvPWOxYUeQ98SVWMoYPnfVXz5KoWwUiIOSAa5I8UftJE/sEQRSHHltbxT3GpkOaD4KBkdJ954A2N91yeRkXQiAO9d2euAISTGSB6bW8ehTo5jVaJUpiU774EHBzr741msPMFs/HEKP2oAVnTQOCoCVukC+IAJALwKYGey47tTj0yDSAyHV6hkn9ckWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 18:45:31 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 18:45:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, daniel.baluta@nxp.com, 
 dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
 Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, 
 y.moog@phytec.de, josua@solid-run.com, francesco.dolcini@toradex.com, 
 primoz.fiser@norik.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
References: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
Subject: Re: (subset) [PATCH V2 0/2] arm64: dts: Add NXP i.MX8MP audio
 board support
Message-Id: <177308191246.1759820.4400575545330108201.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 14:45:12 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0122.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e655764-058d-4693-957a-08de7e0c011f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 PWminkwyWAGanvdM92X+y2R9LtLK4kggv3sUqBLU8aWAi/U5vaP6a8vnnnv2btRqarxWC4Hb8b+lwoLmhnhYw7FGAkYHv+Ba6m01hWCEIkN4wGWkKIJPzxf13wbzLsFt8rk81oH393yAOf7/Uagp2whDxTrEOFW7+ewqr77f+zZ4R1mCNmqRdlUv0aM98yU9EU71JhBKv61wyaNnBhkjoQwWcSPcMd0PnJKloaCKfa9wWZRLBKj68hNZACKM9iSZ2Uu6bApBRurfQDGF5X4VPiCBls1Fk5yxdEPhx1zSCLQ5nEERRYpSxy+Jn8028jT/7gBqVTtKD74jcin3qmQaMPVhoOCYDfATmiUp5PQZSjit9edmXaNiwiwVeSbZseC2SrSPhlDDPpa71+BKCkQ2BJhB7j+3oEUKy5xhML+LS3eh8wh965jomnuSP8AW+xq/7MQqGaBHtq+TyG5NLopp9fbAI4y7TE8dtQWJQq5+q+pGwI1wk3Deb5wgKvAIHrY4ELK19XpqM/9SYpkMumNFDXGGa/opFF6o2+gILCV/boOSbJg57rtDj2PGb1IbjL3J2998rQOHO2dyKKhqzRPvkxwT32QMLVtk7koFENr/Emqs7eWQF+O1R3r/KX1BSp1b5RE6vUtmBaxD+DDp9jlgDNW7Huf1joKiLl+kX8A+2BOEAKtYa4Vmh7ERJ0ICOK8SVg09dOhP8J2fjgu9ciTeQQA/GK4zLAPsQRQAwAEd0KVcSpwxOuhbQntpDHwNPHz2uyT9zf8uhs8sTiL7WI4SQkl1Bn2ZGRh1uVehomMHfRqmcVtb1GvEpQ4lF/wMSPrM
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L2NzVWt6azRxM1N3NkhGTzVXVzNSc3VFRkVMTWdPTWYxTDZncFBTbzYrak4r?=
 =?utf-8?B?UnVySy9OV0tHaU56RTlIVk40LzNOYStKeTEwZWVpNTh0Mm11LzhGb0UxS2Yw?=
 =?utf-8?B?ZEdzQ0t5QlN3a0FtQ3JudGxIc3dvdHFDOXVOZjRJM2V4ckV1YUNqYzNZQmZ0?=
 =?utf-8?B?TW1LOXBvdDA5ZnI5aWFnQmkyNVZpYXczU0NDMXg3K0RYSUtaSFVpQzgySDdS?=
 =?utf-8?B?Wk1vMk5VVVYydEZMZjJBQnI4Y0FTM1dIWWdBa2xqMC8zVUlBTTZlenV0UDg2?=
 =?utf-8?B?N25kOXdSVTRuUkRqWkR6eENkaHVNcFZuVm1LL2VoeEZianErRUdCTmtscjNU?=
 =?utf-8?B?SlF3SkJVc1pGVXc0M2VLcytoek5VUzFYL2ZPbTFOZG13Qm1RQldQNXg1c1FQ?=
 =?utf-8?B?UUhoa1J3L1RzYVBPWWRnUWRrcEJJSWFnZjZPWit6VTBzeklNUnppd3Q1NlFw?=
 =?utf-8?B?U1lBb0gwVDFUNGNrSE44ejZqWVJuYTNLcnNSM0J4c2puRm5lanFIeEtzUzds?=
 =?utf-8?B?UVA4dkNBcmhqWXppMWdVa1ZRNTVWa0ZEMGlBNFYwK3drWFVlRVY3VjBGT1Ey?=
 =?utf-8?B?dnk2MUxUd3NxQ3d2VlFpY09wdFk0K2g0dnZRNVJvR3J4YXJwbExWN3dwMExv?=
 =?utf-8?B?aGZ6ekdadmJGUmRRTE1VMlZOL2p4Q3IzU3d1M2RGRHpVOFpxNENMT3VoL2k2?=
 =?utf-8?B?N3dLMVd1MHNmeVVSQUJFaS9RY25FT0dmMHRqdEZSM3BVa0NWWG5TVStkcE9u?=
 =?utf-8?B?L3NidEFPVDViWHE4MXA4bHlTVUNkS0RPNjlKdFAxb1A1bzlYaEx6SVBvUW9j?=
 =?utf-8?B?dkNteTgzOXBVMFlPd1laM3hyeEw0WENVeXBKcDB2cEZyRjdSbzI4eFJGc0ZT?=
 =?utf-8?B?MjRwN3o1QmtxREw4TC83NnN2YjRPc1ZzWDNXSkt2Z2tKbWhHUDdrcWUxYkVV?=
 =?utf-8?B?YXJrTzlrL244YXk4c2dzOFdYcVBJdTVCVUsrYTBYcUJ3cU1rbFpwTWpVVFQv?=
 =?utf-8?B?ckN2cnAwci9tbjg4NXZMVU1xT0hpTnQ4WlF6NThZdkVXUFRDWHltbFM5aFpG?=
 =?utf-8?B?dnp5amNCWEovTGpIL3E0TjlxUVN1N1FqSyt3bHZkTTEwS1lINkptUjlmNzIv?=
 =?utf-8?B?NjZvbFNCUk5ML29CQjIzRnQ0Znk1WlJQeTExS2FUK3N2Sk1wcDA5K0FzS1l3?=
 =?utf-8?B?QU0yUTdIZzJJcVZwTmd6RVQ2WFJacGd6ckVuUlZKdU1qVzRpaitZL0d1Q1Bx?=
 =?utf-8?B?THV4YmdKa0I4Q3JNRkxPTFpCaXFOOVB5Qm93OWNqcjhRS0F6OTgranMyTUQ1?=
 =?utf-8?B?Sm15YlhHdUQvdkpGS2JSQ2Z6ZStCT2hMR2Y1THhQNU9MK21obDBTOGdPOGhR?=
 =?utf-8?B?TFR1M0xxb1VaRUM0dW0xZm9NcjFrclVxSmxtaDJkbzl5TEpaUjhwVFpXa1Bu?=
 =?utf-8?B?aTdDcnlSWUNBcGFnSUxyZ1BPb2lPdlVlRUJoUjFMMVZHNE94a2JvWThUNjZ6?=
 =?utf-8?B?RUVLUElDbTAyZjVjd01KZlJDZk1jWG5yTUxZWHNJYURFWjJYUzVJSFNtSDgz?=
 =?utf-8?B?SWVBdmliNXBzS0poaEFGMjJ2WjFWcGZZSXRRTzYyMjd1OXJuS01qOVRKSjdm?=
 =?utf-8?B?aXNSQmhkUTg1WktKU2Rici9aTWFnV3JObitvSFlNeXk0MFNMakhtdi83UTI5?=
 =?utf-8?B?YWRzallTYWNQT09aKzR3N3NvOEVXalhSMlFTWm1vSjI0NWVFNVR0bUVobm5p?=
 =?utf-8?B?TWJ5TGE1cGdWZWFTNTFKYUhpRmFpenlMMCtzQk1EQVJ5UW1nZmFyK3hOYy9p?=
 =?utf-8?B?NHFIbGJuYW9PemdFT2lxRi96MGNLNlErdjVPUEZHc082TnFILzlHRlF4aUk5?=
 =?utf-8?B?WEZTU1YwS2ZteHd5VmZMVUFNb0tZZms3d1p3YW5Nd1pES25CYTYxVU94eWdE?=
 =?utf-8?B?d3paTUloNXRmVkNqdE95TGZYNVNuY3VFSllXQnV5VE4zSGdYaGc0anJtQWhM?=
 =?utf-8?B?QW5LSUFja05HNXlCUS9ObG1obTd1UUMySnU2c2ZaQjA5WW5hNVpja1VjeU8v?=
 =?utf-8?B?YnBrcFdXY2FCc2ZpQ0I1NVZaVnFmWEs2SjFaL05CSG9qNkFYeVNVR2N1VDkr?=
 =?utf-8?B?SVpOVjc2cmdoSDlldVBnUVh5aXNoSmUrYXdURUpVbmxuRlpOT3Rib2l2Vk9x?=
 =?utf-8?B?YnFXYURnb0pmVjByanB5N2RlbnNHNkpqOEdnblFZbkcwRWdKbWJZZStUdTBt?=
 =?utf-8?B?KzBuN3FvZk1RYnUzTlc5OXh4M1ZocEpzV1hyT0x3RVQySDduS0lEWWdHOE9S?=
 =?utf-8?B?Yit5RHM2bTlyNlppZ051SzFWb2dyYXZoUkgxb1Z6MEc0Um0rQzhDZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e655764-058d-4693-957a-08de7e0c011f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:45:27.5015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: As9Y+dYr6W3LK8bp9THC9GIK3MQ0niDx4JzhPvpn8h1825hMfKOBeipU4kZM2LqwrrZkZMBiZKlIzete7ts6QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173


On Fri, 27 Feb 2026 09:58:35 +0800, Shengjiu Wang wrote:
> Add NXP i.MX8MP audio board (version 2) compatible string and device
> tree file.
> 
> Changes in v2:
> - Add acked-by Conor Dooley in patch 1/2
> - remove ecspi2 node in patch 2/2 for it is fake device
> - modify codec node name to 'audio-codec' in patch 2/2
> - modify pmic node name to 'pmic' in patch 2/2
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: add support for NXP i.MX8MP audio board (version 2)
      commit: 2eb3cc5d39eb7b2f0ab95ba3b25063e3e2eb487d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


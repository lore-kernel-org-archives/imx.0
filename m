Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45432570E
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323815; cv=fail; b=RDV7dolilBv+a5VNUaXrf9JDo0U6BPqwopZf8jiMjaVX8OZ1p7cpOr4YJhy2k05kkFs5RfB3ERWpUHC8wCSHAz5WIl8cM+8oW63zdPdxo9rs1Vn2mWSFfr9z/OfWtvZqoDqzB/eDKBCUmFIEX1kFW7p3w7ncA/ASyCvdb7w8CNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323815; c=relaxed/simple;
	bh=ruNIvyHPBIftD7Li2dh217EkH/9CAC3EUtMmJ3U5Zao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfMl2cQV2powQK9goCQ1TUYNaK2/iwHJObl0crQUyyidk1bezw6jFJ4qOXHbUH3zfodpQVUspMxLfZK1HV3ofE5sxSMM1/TW0uJ8/4sfFPMuDCfMT4vbuQeIaW/iyRMxCifWxL5jxQWs7v1NfLV/ZxTPVQkKOI0KSaTuxnwH6Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=IyY6NGIR; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="IyY6NGIR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKnXGbMyXentg/UDlu2YdPW+/QLU1nOfSthnsPJGD3CQybQ7IkaDROrmOphdd9REsXm5fpcY20B5KoJi9m6/uer/n9kqv+7PkoaEe0TcHXxPPWPn5pY2AaCOxJyQkIZcUxbkJ3qbT8OTx8p1mrKfeG8ie4r2la4UaVB2dZEX8XNp/5HbZx7qs2QcXQZ+4YJeK1URw/f1yaqfF7FdGiAqWIcyJdVQTw4by75YFuUEfKHtbdQyWA1xTStbqAlnDH97b+r+w6Bo5ACtTF+ZjpN9WSNlBX6gkP9J90tIdB5vDU2xo3MZWxXKCLdqQM2dlZYSQDuLnpDL8xbAnX7gFQ7grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=;
 b=ICY7eBba/bm1SGPybBprJpXR1SyJ16Zx08aatwS1FG50IZraUc3DUa5LUfmpS8IadJcbrUn9+4jV5skQzUqTf4tYg3LAkNioK0K6PpT95aq51n32yTK99MJG++Jx2kHsZTsNHh69JRnIBphTCXgdmPbfBhwpn3ammjp0EV3xVYUteczrMEiQVIMetcyhQrWI54lvFUq4jA4TwuyDlGgAkRWYIu+mxHiFwCzSsw+s5569oKUXJJJX+9oddYZYqJ+VQ2G9B5NCU9wJau7ES8fqagmubUvpIDlyX7ALgK38NXaSAB9gD84Shveeur2GqtbSbCBhMempkPMq3khyOmwW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=;
 b=IyY6NGIRy6pUPJPKi21lyozsMmR4j2eBq8+WqOlUNZbQ/j1fWLquJYQmflTm3XW4rQHBZajSj4gXpr6bh0VwYA79yJUY/6JqfkPUCJTUMPDXXxwj300Ahe0z2k7hM01HGUHzc9oQ3LbuSyxNvUMoLhfCpz1+pSml8yRph9VxyuZbkHJUnVBAWbQYxkzSS7rTpRhDIksx0tgKtdLDsGP6HKs4HJpBFWLX15oDmtl4854CfDvDYDQE0HbhLqEafwr06L0qR785/GwbbZmCyGrW8REXLkD9w9H9zYbvPAYbH/4SVJRO9Z0UvSygE5UafmGD8guP80CRcdTqyLmM8EKyng==
Received: from CH2PR02CA0007.namprd02.prod.outlook.com (2603:10b6:610:4e::17)
 by SJ4PPF6F0503ADD.namprd22.prod.outlook.com (2603:10b6:a0f:fc02::faa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 10:23:29 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::8f) by CH2PR02CA0007.outlook.office365.com
 (2603:10b6:610:4e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 10:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 10:23:28 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 5FF92E8F41;
	Tue, 17 Feb 2026 12:23:25 +0200 (EET)
Date: Tue, 17 Feb 2026 12:23:24 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Message-ID: <aZRBnD2KOP4PYP16@zeus>
References: <20260217094152.19958-1-ian.ray@gehealthcare.com>
 <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SJ4PPF6F0503ADD:EE_
X-MS-Office365-Filtering-Correlation-Id: 788905c6-fcbb-46fb-5302-08de6e0e9798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3NJZThzZDIvNFU4NTRaWDM5SDVhMUJyMHpxazVFU3ZxWHlLWS9HR3BMd1FB?=
 =?utf-8?B?amlSWXZyVDdnWS9sRnMxd3IrU3JUZW9qY21CQmovRUE0Ym9uem1VWEoyNEZN?=
 =?utf-8?B?cCtFMzl5T3BSUDE3RUVETkhpQStTVWF4WEFDdFdqQ2MwZUVvNno1U0VrOURJ?=
 =?utf-8?B?U3htOFkrZ3VFRUNpOXZocWdZalBoMk91SmJsWlVUVWJXVmxIWjAvd3NGQmpE?=
 =?utf-8?B?VW45SktVTkZJemtMd2U1ZEx4OEp1Z25jZ2xqREg0ei9aZ0VESHhKUTFEa3dr?=
 =?utf-8?B?bGlReU1FcnlNSjAvdU5WUDlCOW9PaVVydHc3UjBXeUVpVWdqT3FKUTBMeTJK?=
 =?utf-8?B?ejEzaFpCRjRSTmhJREpGazI1b1c4dFQ2M0IwWjB2UjdaS0dmKzlNOHAzUVVY?=
 =?utf-8?B?NkZCN21HdjZJWkp0RnNnVFdnM0ZLTGRsWm1CdStlNkNSNEloR1pFRzY0KzFT?=
 =?utf-8?B?c3p3cEtqaE4xQkhlczdWWmg0NHhMUVFDZlNWTkNNK1BYYXhIVWl4eGd5cnZG?=
 =?utf-8?B?Nm5aK3ZITEJkRm1IRnBXajZqVWM3MGhiemlXd0tqdU93VHVZamtpM21oL2hK?=
 =?utf-8?B?b2s1bGtIdDYxdFhmRmJNT2I4ZlZFdkdlM0JxbEUzdDV1NUtSbGVXdGE4ZU01?=
 =?utf-8?B?anViU2NOd2EvK2J1Z2J1NnluTTRLekRrcy9WWjFUOU5CTUNTZUhVYlptRjRh?=
 =?utf-8?B?dW5haW1KZWkvOVNrbDNiSVQrU2RKenBhcHpDZGJLZE5oajJDNUZJSGlFT1pH?=
 =?utf-8?B?MHJkbHoyeit1TVR0MFAxbzVBQllkUW5uR2c4ampqd0V6ZkJITDE3aTVYWXhn?=
 =?utf-8?B?cUNPMTJBdVZieUw1TnREVXRGMWUxN3FQTnRmTTlIK0Z0OGN1Sm5lQ2pXZVpy?=
 =?utf-8?B?ZnB2TW9wQWFiUUIxdTBkaEFrY2xYQ0FEdXNmUlFOVGtyTFFFSDFaalIyNjFO?=
 =?utf-8?B?MXcxaUlRZmpGU3pjN2Qzb2l2QnlXSkY1M2tPdHJBemlrby84KzhZT05YeDlx?=
 =?utf-8?B?Wlc0d3pncDcyOFNpd3Y5c2NPVVNDcUV0WFpHSFZNdDJWd1ZMQzRQWXR5MklC?=
 =?utf-8?B?N1lTZGNlYWcyK1BJNFVMN1VXZE9BUWg0RFNVK3hXSldvL2l5YWU2aDB4Y1pY?=
 =?utf-8?B?MFlad1NsVE8vSDlrZ3I4U1RNZEpVb1dUSko3bS94cVVueGVEZDU4SCtCMWZK?=
 =?utf-8?B?RlZOa1pGaFh0QXlCc3FSTWZESS90c25QKzI1dityVVpXOElabjJHS2FoOEp3?=
 =?utf-8?B?TXRKYzcwbTlDTndwOENBZDh6czZmanBxRm9wR0s1Q2J5S0Q0RU5TUGh6ckRB?=
 =?utf-8?B?b21ub3hJM05FcU94bHZIMjY1V3g3YVZPay9qdkUrb085ZkNBRzNXK3oxckRl?=
 =?utf-8?B?eEtVK0VJZW1Kelg3bTFFNzNDdWxmbnZSSTgzVXJRcTNLbDUzc1FxTEMvdy9S?=
 =?utf-8?B?NGZtcHYxWlFOYXlpTFhhbEUwdEVDenFYbkNPc2xXQmtRb25LRmMzbVFHWTRO?=
 =?utf-8?B?M2JhektIekJtbE5ISk5jLy9MU3VWSmQzLzJUZG9sUjlQbGQzVEg5bTVwRVdM?=
 =?utf-8?B?QkJnQ2NPUW5wcjdhZ3lxcFhtUlVJcEdVYTA0SHJmaHBVTlMvaVppV1E2bEdO?=
 =?utf-8?B?dTNqenZPc3gyam5renpBYnp6czhvY3NWeXB2bHh0NVhzT2xLRjZ4VjRPVEdH?=
 =?utf-8?B?Q2dQclRTVjZQWFUzYjJTUTZObFk4eVNLR1lSZUZSc0kxZjZPMTVEdVZ4Q2pH?=
 =?utf-8?B?ME5GK3R0Q1loR3k5NkdVQlZEOXRocFBSQkEyaHU3aUMrdkoxNFRObEZlOUtp?=
 =?utf-8?B?elBVYWV5Q1N0dzlWZ2NoV2FYa0hhWmZPdlFTQzE1c0lDOHlQRU9JYXV6VVlO?=
 =?utf-8?B?OGFQQWw1VngrV3djblBuMW80N295N3RDRXFxb2JjSXdscExNWm8wSWZKdE9X?=
 =?utf-8?B?elRVTzhWOGVWcHB3RnNOTVNuUUVoSC9qU0ZuNkFXd1VVQ204aFZpK29BTFVG?=
 =?utf-8?B?NHgvenY4NHd4ZlFDZE5zS3ZROHNybmRoaU9OWkNtTXRISzhONngrUEhkMHV3?=
 =?utf-8?B?MWJZRjJ1NUxZcHIyL1kyQVR5R1dJQXJ4alRBa3lhWUd3TTRNblJkQjhGb0ZT?=
 =?utf-8?B?VUpTRUdvMFpJcWROV1prOXdpdTJyUWlzTnZhN0JadVNLNEQrck9TK290NktC?=
 =?utf-8?B?ZHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	87kectQ4jxsk8LoLcw2kADMreGDZ3o2yzyTRIeZinFq6s4CF2u2PLb3yuPHsNEFXGa0IyCc+asHfNePqLF+ke3GD1BDUjT5c1Qjnf+EfsUuBkkGDGZr8CJTC4ummbfGXLBlqEVfoOErSPhwL6O+gqffQZ97Kw7G6uMHjVz4wF9g+ncRVqLh7PLS4ur3hZ3fMBqeLos2jmpYRMRrzIkKjVRSlB0N7mSuL+Bsi++j8cNo9X6oE06qeB+H4YrV9v4SFX6LFL7bB06g5G1sRgra2hNoDzLoHidoaArmMw87mtY4gIRSH2jHiBdx0pHqLCymVKqBdrtJdaRvjSkGN7MiV7HhDErfr50qlcTrz3fdZinm/6OlSKnL5lr+JGHLQeNOL0xpbPBWORrl1HSsgDS74JXkuwtIfb4hVhGK7mHqt0mYF0zjS4MplU1hbSX++XExX
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:23:28.3986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 788905c6-fcbb-46fb-5302-08de6e0e9798
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF6F0503ADD

On Tue, Feb 17, 2026 at 10:54:49AM +0100, Marco Felsch wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> Hi Ian,
> 
> On 26-02-17, Ian Ray wrote:
> > The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
> > for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
> > 7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.
> 
> the on-demand rate calculation doe for the PLL1443X PLLs is not
> sufficient for you?

Apologies! The on-demand rate calculation does indeed work. So please
ignore this patch.

(The patch was needed on kernel 6.12 IIRC, and I automatically re-based
it on 6.18 without re-testing. Once again, apologies for the noise.)

> 
> Regards,
>   Marco
> 
> 
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  drivers/clk/imx/clk-pll14xx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > index 36d0e80b55b8..84279cf9f12b 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
> >
> >  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
> >       PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
> > +     PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
> >       PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
> >       PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
> >       PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> > --
> > 2.49.0
> >
> >
> >
> 
> --
> #gernperDu
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

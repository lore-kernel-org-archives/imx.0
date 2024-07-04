Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B911E494
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720096664; cv=none; b=RY/3zqZivHvkOxuX5GiaSx55lohcuu820uozJQVhi2W/ePQ3tGk40Gc5upy3lAN5kBJlPHOcTxffYYHb2SoYKOP7bzeHCjshBoo1/o9SBYb/mjHvlozJFtGMyVCCLRdN4/FgZBgoe9fQVklMsIqZSwzBEibtQlc+h/83KcPv0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720096664; c=relaxed/simple;
	bh=xaDklDCnhTYn7DzUM660yyVRR9oVog/xxd1CxVhwR4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOqC4wM2jAh18dcVall8g+EDQ/rMKljvdJqeGIu1eUf5y+/RmkA4iePvoh+ZEflJ12LE8V2xGcmFcxyxo8XOC9+CTx5JaNr9DEUAbNUieDnHUjjY2iqoNMYRKr0HZu27vvADHErBTYzqSvm+Z+2QbgLHrOM+JqoMIwXC2Th+rO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sPLiS-0005Zk-HZ; Thu, 04 Jul 2024 14:37:36 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sPLiS-0075hT-0K; Thu, 04 Jul 2024 14:37:36 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sPLiR-00EUeU-2x;
	Thu, 04 Jul 2024 14:37:35 +0200
Date: Thu, 4 Jul 2024 14:37:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: i.MX8M SNVS ONOFF key handling (secure system)
Message-ID: <20240704123735.arh7em2lxcc42y6w@pengutronix.de>
References: <20240703105137.fpjollqvtpysktqa@pengutronix.de>
 <AM6PR04MB5941D70C5EE91BC83E2DF4FA88DE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB5941D70C5EE91BC83E2DF4FA88DE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Peng,

On 24-07-04, Peng Fan wrote:
> Hi Marco
> 
> > Subject: i.MX8M SNVS ONOFF key handling (secure system)
> > 
> > Dear NXP team,
> > 
> > we do have the following situation:
> >  - A verified boot (locked-down) system based on i.MX8MM and
> > i.MX8MP
> >  - The ONOFF pin is connected to an ext. MCU to initiate a shutdown
> >  - The NPSWA_EN bit in HPCOMR is _not_ set
> > 
> > According the datasheet NXP introduced a new interrupt called
> > "ipi_snvs_btn_int_b (button) interrupt" which can be enabled via HPCR
> > register BTN_MASK bit. The interrupt level/edge trigger can be
> > configured via the HPCR register BTN_CONFIG bit field. This interrupt
> > can be cleared by _non_ privileged software e.g. Linux by writting an
> > '1' to the BI bit (HPSR register).
> > 
> > Unfortunately I don't see how this interrupt is connected to the GIC. I
> > can only see the snvs_lp_wrapper and snvs_hp_wrapper which do
> > share the same IRQ number 4. According "Table 7-1. ARM Domain
> > Interrupt Summary"
> > IRQ 4 is triggered if: "ON-OFF button press shorter than 5 secs (pulse
> > event)". It seems like this IRQ is controlled by the set_pwr_off_irq
> > (SPOF) but to clear this IRQ from Linux we need to set the NPSWA_EN
> > bit.
> > 
> > Now my question is how the ipi_snvs_btn_int_b irq is supposed to
> > work?
> 
> My understanding is (set_pwr_off_irq | ipi_snvs_btn_int_b) connects
> to IRQ 4.

That was my assumption too.

> For more details, I need check with our Design team. Will update if
> I have more information.

Thank you!

Regards,
  Marco

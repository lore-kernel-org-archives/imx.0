Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7041142E8E
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003903; cv=none; b=e+E54arh7NhxdO/uHJq9hS4IkS8GEAVwIAnynqAWMY2dt/N32bIJaDmrDBROaKwWWEoc8G/Ga7grCNEhkN1pFtOnkd02M/mWLIVP8iC5VFRpKNbUztvfermC90kbCxUYKY/+qCIIT8/DVjGdu6gvyhlWO6KNNs2lsMjDAqdmFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003903; c=relaxed/simple;
	bh=8Of0fWUpqxcjFG1r798jEY9vNbR3FroQHbpxrrxvjv0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REuM1CJSpcuuQXXeEs0yCVSwIp1cM8Zf/xL+AsOyq3h8YAVB98Ar9XWZaea/hFUHq962jFBBP7EnGEFIg6hTFKNmv0c1ExfVs7izGNeeRUZX8HClAjXLBDNsFMTDZmZIXjdSqvug3ZoJtYamt0mTOACBc4QpOVJQtnRQrCwWLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sOxaM-0003AP-9a; Wed, 03 Jul 2024 12:51:38 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sOxaL-006pbw-Na; Wed, 03 Jul 2024 12:51:37 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sOxaL-00CTtM-21;
	Wed, 03 Jul 2024 12:51:37 +0200
Date: Wed, 3 Jul 2024 12:51:37 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: peng.fan@oss.nxp.com, peng.fan@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de
Subject: i.MX8M SNVS ONOFF key handling (secure system)
Message-ID: <20240703105137.fpjollqvtpysktqa@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Dear NXP team,

we do have the following situation:
 - A verified boot (locked-down) system based on i.MX8MM and i.MX8MP
 - The ONOFF pin is connected to an ext. MCU to initiate a shutdown
 - The NPSWA_EN bit in HPCOMR is _not_ set

According the datasheet NXP introduced a new interrupt called
"ipi_snvs_btn_int_b (button) interrupt" which can be enabled via HPCR
register BTN_MASK bit. The interrupt level/edge trigger can be
configured via the HPCR register BTN_CONFIG bit field. This interrupt
can be cleared by _non_ privileged software e.g. Linux by writting an
'1' to the BI bit (HPSR register).

Unfortunately I don't see how this interrupt is connected to the GIC. I
can only see the snvs_lp_wrapper and snvs_hp_wrapper which do share the
same IRQ number 4. According "Table 7-1. ARM Domain Interrupt Summary"
IRQ 4 is triggered if: "ON-OFF button press shorter than 5 secs (pulse
event)". It seems like this IRQ is controlled by the set_pwr_off_irq
(SPOF) but to clear this IRQ from Linux we need to set the NPSWA_EN
bit.

Now my question is how the ipi_snvs_btn_int_b irq is supposed to work?

Regards,
  Marco

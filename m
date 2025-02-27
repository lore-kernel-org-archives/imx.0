Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FAB226183
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655751; cv=none; b=bq/xb4lBRcZi2eVn03xg0l02sAN+C96oFGZebwOAozuMg5FzRlJzDzib4FFg2Q5sonfdj2nf5Rk20juSSH5yl/e5Qpm2Fmrp/VqmBdGev0DFWKTsUQAWRJpT5EgKniMFT7O1KWxYXGOuvZ1mGAteX2KOdlqtOzcyE0PTUD3bvF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655751; c=relaxed/simple;
	bh=ZywMm4CjYa5hw1+87SFh/PxwPwctZfrw6ORjAyszIUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UC0iaAm/vmLHNvrkpWYyO2/fmZv2ouhaIhk7vDguRl6acYn4sj7p9VkBvl3uz+ULZxmK4jpYlGdkTYq1tEcrUotsHmfswKSHaaQSFzj7h4sMUJeNEGc9aRgIbkM/TG7pV6fB2z8ywSHiTjk50CLg0OJ4kXVON4zjhpaplIpT6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnc4X-00058G-Bq; Thu, 27 Feb 2025 12:28:57 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnc4W-0037HX-2y;
	Thu, 27 Feb 2025 12:28:56 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnc4W-003Omf-2c;
	Thu, 27 Feb 2025 12:28:56 +0100
Date: Thu, 27 Feb 2025 12:28:56 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Message-ID: <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
 <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Laurentiu,

On 25-02-26, Marco Felsch wrote:
> Hi,
> 
> On 25-02-26, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > 
> > The AIPSTZ bridge offers some security-related configurations which can
> > be used to restrict master access to certain peripherals on the bridge.
> > 
> > Normally, this could be done from a secure environment such as ATF before
> > Linux boots but the configuration of AIPSTZ5 is lost each time the power
> > domain is powered off and then powered on. Because of this, it has to be
> > configured each time the power domain is turned on and before any master
> > tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
> 
> My question still stands:
> 
> Setting these bits requires very often that the core is running at EL3
> (e.g. secure-monitor) which is not the case for Linux. Can you please
> provide more information how Linux can set these bits?

Sorry I didn't noticed your response:

https://lore.kernel.org/all/a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com/

If EL1 is allowed to set the security access configuration of the IP
cores doesn't this mean that a backdoor can be opened? E.g. your
secure-boot system configures one I2C IP core to be accessible only from
secure-world S-EL1 (OP-TEE) and after the power-domain was power-cycled
it's accessible from EL1 again. This doesn't seem right. Why should a
user be able to limit the access permissions to an IP core to only be
accessible from secure-world if the IP core is accessible from
normal-world after the power-domain was power-cycled.

Regards,
  Marco

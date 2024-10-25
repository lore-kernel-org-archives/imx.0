Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229281B0F03
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729840487; cv=none; b=gNKeI+zE7gXamA/A6Qw/eADjpOj4kYKO+THcXefazagkAs6RJWN7ksb02PIgN2yieCWlzebIcuel+nG2lKmbbM1H6EV1os3uTSGQk6r/6bSK0lut2BhriPWgRb8P7dFaoEIhZ6ZqIA0LepUv2yJdODnS1z1f9564yXSk44qWSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729840487; c=relaxed/simple;
	bh=7xeouv90RLyjkxhH0VLz2AL8nPxSakjDhzPqw4ONPTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9tRJdnhZIeE7cr3XNttBMlrf32XxQAsb/EOORfbUBK7AaAAFX9IHxh7DqgIKHyd+k+PnDJFHsPhww1ZY3qDbdRvlraNf5V3FL8wpqhmDMnqjGp2QEjlCh2k9O66UptjRZdHbEdsKA1rW2ZPVTRBGrr4cEwJo2zgY4XmDSvQlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t4EWv-0005YF-D5; Fri, 25 Oct 2024 09:14:41 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t4EWu-000KEa-35;
	Fri, 25 Oct 2024 09:14:40 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t4EWu-00Ctrc-2k;
	Fri, 25 Oct 2024 09:14:40 +0200
Date: Fri, 25 Oct 2024 09:14:40 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-pm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-amarula@amarulasolutions.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
Message-ID: <20241025071440.6tivzdzkkqacm27v@pengutronix.de>
References: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
 <20241024110123.wix35njjbh3nx7kn@pengutronix.de>
 <4vws5lnu4efupunha74pdlgtd754w6n2loymgywrxhwm2rqic2@gz4efozdrpqm>
 <20241024180838.xxhrgmmop75pc7ov@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024180838.xxhrgmmop75pc7ov@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Dario,

On 24-10-24, Marco Felsch wrote:
> Hi Uwe,
> 
> On 24-10-24, Uwe Kleine-König wrote:
> > Hallo Marco,
> > 
> > On Thu, Oct 24, 2024 at 01:01:23PM +0200, Marco Felsch wrote:
> > > On 24-10-24, Dario Binacchi wrote:
> > > > The patch standardizes the probe() code by replacing the two occurrences
> > > > of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
> > > > other error paths of the probe() function.
> > > 
> > > I assume that this paths aren't using dev_err_probe because these paths
> > > can't return EPROBE_DEFER and therefore dev_err_probe() would use
> > > dev_err() anyway.
> > 
> > Note that dev_err_probe() has advantages even if the error code isn't
> > EPROBE_DEFER. In this case it's mentioning the error code.
> > 
> > See also commits
> > 	7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even w/out -EPROBE_DEFER")
> > 	532888a59505 ("driver core: Better advertise dev_err_probe()")
> 
> thanks for the pointers. With that in mind it make sense to me to
> convert it. Feel free to add my:

that being said, I would like to ask you if you could addapt the commit
message, to point out the advantage of using dev_err_probe().

> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Regards,
>   Marco
> 
> 

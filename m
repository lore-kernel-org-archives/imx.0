Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3322E3715
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686766; cv=none; b=OCjS34BiJbsKNlcHSUP9m1JHrwC4+Z//GZZAVSDyR5I5pSl2ZKUTueleQGcD7mv0lO9tVJkChkz6bRpAdrt+ahzYaeL7FU0+k71mGj+559j1YDk3dSsmmOs6GALjXUJbrZnyKWIKy+sQdMP0AdLRWjGMjCYIeeEgWrMdk/Gxqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686766; c=relaxed/simple;
	bh=GUfyf2plKo8rHN85YZhesmhtOC7FETZyXicnE7/kB64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKoTqcVFfaqHjsYjH+RFbF1cEjd1YnlfA+IO+MnGd8zos8D7QLApSOnP8/6DFh0TB9+DIniWxk9klK73eRr24/8cbTkPZeYCpYlEfBe0Bb/nbQ/DmTOXlFu+AaM9GDuQSeF8uhKt0K8t8mTwvLOfennHepEV1rbUq5QZKzYNF24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G/vDAYa1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G/vDAYa1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31c38e75dafso158186a91.2
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752686760; x=1753291560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kHHeE2kJpSMXJOVTToRq3RMoJpv6Fr2i3DdKBabil8=;
        b=G/vDAYa1cb8BEw1teFRW6B74dl0sorUG1EVujWl41eNpW+yxzZvuAaIUuHuE5G5yxn
         qHIeef2xUIT8bbROXn2QGGJxg4VoOKjUmal+FqAPNi0PNTQuOmnOf/5Iu3ML2fUWxTvf
         9dseRohoahCw1eOZ3Us5IC3jKHR1PBYltw7mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686760; x=1753291560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kHHeE2kJpSMXJOVTToRq3RMoJpv6Fr2i3DdKBabil8=;
        b=jH3JJ3ph8ZiWLSg3VPSiqVe5CxGMToPcItutdNfw0Ne7gUBoP8KY5+OaQqUMF3RT1i
         L5y42qSNRmi7y89PBut0tIoY0x42Q1ps9YSmd7c3A2MZbR3SEnUuq0Dg+LyU8LK8LBzG
         tWpC22rYm3tyHz13XlGNqXzRRtcI+6IPBX1dWJBZu4gD309meMrR0eJiUy0BEiqxQZnu
         6sEx60dHKgptLs8cmaURW2M3BddYPN+pYJeiO6kGpfTCudC+7IT7hxkr6QpCr7lSrqQX
         sTPui+bBPhhUK3Ix8rmx5uWHCV7bb8FIu6cP/s4XSwg1Zu7/sjIh5Pj6pIyaTgUqK5Db
         BVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyjryMgNYdbkFj9cHGigTuwsJ9J1DGXkIk2hFiu/zPR6qAoDRqcRzBcN7ultuRgo9H794=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6gMdJQ1Zcrmz/lJkvyVNsD7hvlNFeuUOubNeNcaVYkdEAJZWM
	RY2p1HkM4T/ku4/yQO9N8b+0J559xinr9dpjTnoEjw65XXuhd8mJxH+PJ2MMGmGvSg==
X-Gm-Gg: ASbGnctLa28dJKpUq+OK4I8cRwVkcu2thChuRCK/NvEIKMTtdHB4S4nJv0/ZwHBXnAp
	rd3+dpzjlwmnKg2+Sqx3cEA0SMSPTsIyk3G7eOug02SnubOjPRdXAwtAFdWz6qbHrVX5XQF1e37
	M50GqRpl5HiE0Uxv29/CCNM3e53txgT3UHgNQRzUJDEnTYluMjEYt81JIDrSpubD9BB0H8Kjr6f
	ZKmPeAr96BX+F/WCeYa0tmPhwLopI+P7QLC+u91DysRnRGOzegrlErqby7H28oHcnF1cSeSEb9i
	iiA6j6irZuAwkVerhOYmxRiZRDR2kDHacLiIkPwIOwtdVJCk5qfyAYP3PZbXN8yt+TTyp4GgvYA
	r9T9jUy8/NpgSl1sLskeEaZ0VeRrJoqPkRB5d8Oljvsw6JnznND/BYv+hbk7E
X-Google-Smtp-Source: AGHT+IEgRxwzuEwrC/bSIJHQuOCIp213H3FKeMYHG1zJUSxzvhkFVK3NOkI8LhIaYo9Dg+UiGLCMDQ==
X-Received: by 2002:a17:90b:3c06:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-31c9f459f8bmr4342453a91.30.1752686760162;
        Wed, 16 Jul 2025 10:26:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:17f8:90f2:a7bc:b439])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c9f287be2sm1788951a91.23.2025.07.16.10.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 10:25:59 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:25:57 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Bjorn Helgaas <helgaas@kernel.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Rob Herring <robh+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: Re: Does dwc/pci-layerscape.c support AER?
Message-ID: <aHfgpWsC1GlQUIEm@google.com>
References: <20250702223841.GA1905230@bhelgaas>
 <aGW8NnHUlfv1NO3g@lizhi-Precision-Tower-5810>
 <aGXEcHTfT2k2ayAj@google.com>
 <tikcdb63ti6hbpypusxdiaoattpuez5rgpsglzllagnqfm5voa@5eornv77pl4i>
 <aHfDRm2S8N8Qus_m@google.com>
 <vatnozecxmzh5bwrapkjcucnfusjz7ugpx2upbwihoioxbf2ko@ydwd65l4peju>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vatnozecxmzh5bwrapkjcucnfusjz7ugpx2upbwihoioxbf2ko@ydwd65l4peju>

On Wed, Jul 16, 2025 at 09:35:38PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jul 16, 2025 at 08:20:38AM GMT, Brian Norris wrote:
> > On Wed, Jul 16, 2025 at 12:47:10PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Jul 02, 2025 at 04:44:48PM GMT, Brian Norris wrote:
> > > > On Wed, Jul 02, 2025 at 07:09:42PM -0400, Frank Li wrote:
> > > > OTOH, I do also believe there are SoCs where DWC PCIe is available, but
> > > > there is no external MSI controller, and so that same problem still may
> > > > exist. I may even have such SoCs available...
> > > > 
> > > 
> > > Yes, pretty much all Qcom SoCs without GIC-v3 ITS suffer from this limitation.
> > > And the same should be true for other vendors also.
> > > 
> > > Interestingly, the Qcom SoCs route the AER/PME via 'global' SPI interrupt, which
> > > is only handled by the controller driver. This is similar to the 'aer' SPI
> > > interrupt in layerscape platforms.
> > 
> > Yeah, I have some SoCs like this as well. But I also believe that I have
> > INTx available, and that even when MSI doesn't work for AER/PME, INTx
> > might.
> > 
> > Do Qcom SoCs route INTx?
> > 
> 
> Yes, they do. But currently, we can only use it by booting with pcie_pme=nomsi
> cmdline parameter.

Cool, so it sounds like you might be in a better spot than layerscape,
based on the explanations I've seen from them. They seem to require
multiplexing multiple platform-specific interrupts, which isn't as easy
to pretend is a proper INTx line.

> > > So I think there is an incentive in allowing the AER driver to work with vendor
> > > specific IRQs.
> > 
> > Yeah, I suppose even if my SoC (and Qcom, depending on the above answer)
> > might work with INTx, it really does seem like an arbitrary decision
> > about what SoC makers connected which DWC signals, so I suspect this is
> > true.
> > 
> 
> Maybe we should be able to extend the dmi quirk in portdrv.c to allow Root Ports
> or host bridge to use INT-X instead of forcing them to use cmdline params.

Yeah, it sounds like that would be sufficient for non-ITS Qualcomm PCIe,
and also for my SoCs. It's also necessary (but maybe not sufficient) for
Layerscape too.

One complexity: this is not exclusively a "host bridge" quirk. It's also
a quirk of the MSI provider. So for example, looking at
arch/arm64/boot/dts/qcom/x1e80100.dtsi, you have 2 controllers without
GIC ITS, and 2 with GIC ITS, all using the "same" type of bridge.
IIUC, only the former 2 would need to fall back to INTx.

Brian

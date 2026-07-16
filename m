Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8A2441B8
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183179; cv=none; b=IEk7yHl+NyIjw9MGltuYYvDHW0CmChOzW6zZIO3O5BcjrxkJ3Hy5AqGNhi0aOEeo3FL/hqD50ISmbCs74JVlfLB8Rdcyuhj1n2r8sUpUQTak5QTQNcycYLR15U5w3wP++BK04wj8DlcAHInverREINL8v/XMwxRdjO7Ghq5ER6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183179; c=relaxed/simple;
	bh=6wJJGWpqnts062MSGJuv9bzWeGSd3fZ0wj23dUUQ/3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjtKnBssrVZ1nMj8OXSkobQhfFPwMU6cUrzl5oVPjnf4CeU2mq1jrEF3Ja63IhdDEnp6JOaPBQCqQQlXIzmDe3Majs0PZbll5dqMmaH03oe7PaY6kB7T0kTf58K7V7uLNn9eksKA8HsU36bp2o/HNPLS2YBu/dW07E48vQFAXco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=bZOBe5Xo; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="bZOBe5Xo"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 2FFDD22924;
	Thu, 16 Jul 2026 08:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784183175;
	bh=9HXub2A/v9RqkMGdUZjtbYvqdoMeY8h65+2Qb929duA=; h=From:To:Subject;
	b=bZOBe5XorgczVLTaof+93M63kt1XlmU6uiFSMKAQUgg621TOnz+SJG/NQw5T45d33
	 GI6nEOo8+pDX386o30SG2efdoiTBf4lm7hBti/iYxN76A10we1SmKNKX4YjT4xsH0y
	 cl/41EFgXjuXG9MG5P0vziDFjuuK+HQzYKQuc3k6x9Njd5jiNNpgsFh5af2cgjslGP
	 /q7G6Go4nQAWhdzcrTmdEnAz3KJrVIqJFGyf48JfeXI+4VfCFcYzv5OXWQHc9M3mj1
	 8G8gMzSIMaYQoya/zjQjnvlXpav11aQO6GfZd4oVJkC1PPOqb1xyVnIwYpnAlg5s6N
	 zyZN/MwGRLyWQ==
Date: Thu, 16 Jul 2026 08:26:12 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de,
	vkoul@kernel.org, kishon@kernel.org, Frank.Li@nxp.com,
	lumag@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <20260716062612.GC9973@francesco-nb>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
 <20260714193627.GA9616@francesco-nb>
 <alh4a66fEro05ShA@raspi>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alh4a66fEro05ShA@raspi>

On Thu, Jul 16, 2026 at 02:21:31PM +0800, Liu Ying wrote:
> On Tue, Jul 14, 2026 at 09:36:27PM +0200, Francesco Dolcini wrote:
> > On Mon, Apr 14, 2025 at 11:50:09AM +0800, Liu Ying wrote:
> > > Hi,
> > > 
> > > This patch series aims to add Freescale i.MX8qxp Display Controller support.
> > > 
> > > The controller is comprised of three main components that include a blit
> > > engine for 2D graphics accelerations, display controller for display output
> > > processing, as well as a command sequencer.
> > 
> > ...
> > 
> > > 
> > > To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
> > > instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
> > > diagram and represents the whole display subsystem which includes the display
> > > controller and prefech engines, etc.
> > > 
> > > With an additional patch[1] for simple-pm-bus.c, this series facilitates
> > > testing a LVDS panel on i.MX8qxp MEK.
> > > 
> > > Please do NOT merge patch 14-19.  They are only used to facilitate testing
> > > the LVDS panel.
> > 
> > What's the plan to conclude this work? What's the latest status?
> > I am looking forward to have a way to use the i.MX8QXP display with
> > mainline, but to my understanding some required changes on the SOC dtsi
> > are not merged.
> > 
> > Can you help?
> 
> I planned to add display controller DT node after prefetch engine support [1]
> is picked up so that the prefetch engine could be enabled together with the
> display controller.  Just want to avoid a DT that only enables the display
> controller or bypasses the prefetch engine.  It makes the display controller
> driver simpler.
> 
> [1] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com/

That series is from October 2025, is there anything blocking to move it
forward?

Francesco


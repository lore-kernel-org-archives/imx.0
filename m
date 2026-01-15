Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BC30E0FB
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768464690; cv=none; b=DQTC6dOSQHKPYtgvLak9U/xGrRIW1zkwAE5MCl98xvXGcanhf6Y1ZsemPvglz7Y4vazpGwmypOLe+LSmClaf38LlBeUrGmKYO8P98FTf3J080wpE4g2f0QY4gcxYu5kTz+7APhruTQ6OrslmaD05PuKev3TCz29/GDIaWIaXV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768464690; c=relaxed/simple;
	bh=LRko8ZPK6lmm1lPdcjFvpKsGtawD0N6Ya1fudz7vCgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvxr/WvG7KRhmq44MKKbC8sjOIdTYlkSEr/PzBsUOdJPMcrbx5U1Bez6KzhrTscXk1G12UsK37BfDo7KU/ABR9p8u8Uz3mPwkkgZkRKshefvrCa3506/1trOQV/riO2Ki6mlmigZia551EIIT9X1jO04mfNna514SwmCYYxPwgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=N6GVMSqJ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="N6GVMSqJ"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 134B01FC54;
	Thu, 15 Jan 2026 09:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768464687;
	bh=QYGV+NwzF1dz9CuqQx4SAArBW6pXJn6utmAZk/0qyDY=;
	h=Received:From:To:Subject;
	b=N6GVMSqJjiwxk8xlrQZ0ahE2y+mzFxDaBDxtgJpIf55s9HxD/in1cOwyjN1OvyDvm
	 D0OiunZnhegfh8giYoPUiUwqEFHATwZFPfhKPrttGERSVSLcdk39KHNauKdjTUlcKf
	 FAYrFX1v6lbbPGPHWDga3VeRHT3k3wYw7SiGqRrchBk6tLNa7jDnZwFpsAm+bmGLtR
	 /WKlrrJCdm6plhRk3r7RQH671fbuNM9ckyBzzMzcISFZLy1hZq9NtR4faF3AbJYKrx
	 BUY1A/bhbWsbrxLbvCUPI/ybUHG5j0Aoq2XlRIBVtM0FiOONVSs+SnHJNIGP1Bbuag
	 Qoi4pfmA0zTCw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id BA5E37F9C8; Thu, 15 Jan 2026 09:11:26 +0100 (CET)
Date: Thu, 15 Jan 2026 09:11:26 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Sherry Sun <sherry.sun@nxp.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, kwilczynski@kernel.org,
	mani@kernel.org, bhelgaas@google.com, hongxing.zhu@nxp.com,
	frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Message-ID: <aWihLru9aT75LCPm@gaggiata.pivistrello.it>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
 <20260115073418.GA4366@francesco-nb>
 <aWigj011i0pGgTRi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWigj011i0pGgTRi@smile.fi.intel.com>

On Thu, Jan 15, 2026 at 10:08:47AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 15, 2026 at 08:34:18AM +0100, Francesco Dolcini wrote:
> > On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:
> 
> ...
> 
> > And , the property is still handled, see commit b8b80348c57b
> > ("gpiolib: of: add polarity quirk for Freescale PCIe controller"), the
> > DT compatibility was not broken as you seem to imply in this series.
> 
> This is a quirk and not a 1st class support. There must be no such property
> in new DTs, it's only present for the backward compatibility.
> 
> For the old ones, indeed the property is needed.

Ack, we just agree here.

Francesco


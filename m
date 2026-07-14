Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3E39CCF6
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057798; cv=none; b=Xngyxlif+Ezz9SVO61PnwtfYNRdQkWemaduoL6MBL0yIW+0gJDK0Y/hqFlGyy8iBo5p9rjrHH7yZ19T8WNysSuVxBi6FH5ernhaaqWkMeKGcHD8RW2IzUGcFWfZW+P9am5Y4oj5lNb96C/C3wDn/a4iAavYwiNuUpoUE0uM1Cb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057798; c=relaxed/simple;
	bh=skbhAi8pTUy8oSaNNYI6jEo0KjVaw8Twt6vyvVAhe9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp5C+GDA0RV6HtmkeVL8EA+l2SAFhxPsE1UMrkuU1wR/dIM4pD8olJUJ12y6IRrD+dkuyoRjqxgjTT8pXLYgxLZ+dn+dAqu1yYwoEKIJk1vNwG5eRHiLsB0CcNmXNLgjJM4LxUoBS0s1+Mzh0ZtFJPegkwfpqgha5LD05UpZ6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KLkmofSR; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KLkmofSR"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id D7B871F8C1;
	Tue, 14 Jul 2026 21:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784057792;
	bh=ouG4gU2sMxcP7NnkE/ZCp7siG/EcEqz4Sk7+xu/lKZg=; h=From:To:Subject;
	b=KLkmofSRNvGp46eG5l7vx8V8L3VWhoxxkU0Qzios6IVZWT3JpLVXNXwOivqOqVmPd
	 sKtwfZ5GN719FY3GWAyiu7jqsgou3YE6aQYbNGOifKGrtsbBN3aXT4aq+XC/EPSmiX
	 cDUQTAuRXJJSjuOz6wiqeNQlRcbNzl4dWC68kqDFfJDPZGOIrR+2hnGuLWYv8JDp4S
	 rPiH7+i3nNht+tpnPz5rNIAUofST5jjdtDCwWaoBcj6JEzzNvp/w/FMMnBqLKeRFIi
	 KKT7/5yyufWUTZiT/+binA7KtPbKrRxfeKw5RqnO8tx9eJYfYmqQlvIzT05Sv+GpOL
	 bVakEGMeY31zw==
Date: Tue, 14 Jul 2026 21:36:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de,
	vkoul@kernel.org, kishon@kernel.org, Frank.Li@nxp.com,
	lumag@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com, francesco@dolcini.it,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <20260714193627.GA9616@francesco-nb>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>

Hello Liu,

On Mon, Apr 14, 2025 at 11:50:09AM +0800, Liu Ying wrote:
> Hi,
> 
> This patch series aims to add Freescale i.MX8qxp Display Controller support.
> 
> The controller is comprised of three main components that include a blit
> engine for 2D graphics accelerations, display controller for display output
> processing, as well as a command sequencer.

...

> 
> To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
> instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
> diagram and represents the whole display subsystem which includes the display
> controller and prefech engines, etc.
> 
> With an additional patch[1] for simple-pm-bus.c, this series facilitates
> testing a LVDS panel on i.MX8qxp MEK.
> 
> Please do NOT merge patch 14-19.  They are only used to facilitate testing
> the LVDS panel.

What's the plan to conclude this work? What's the latest status?
I am looking forward to have a way to use the i.MX8QXP display with
mainline, but to my understanding some required changes on the SOC dtsi
are not merged.

Can you help?

Thanks,
Francesco


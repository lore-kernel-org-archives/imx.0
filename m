Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AD335948
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005332; cv=none; b=dPSUx4HIuAa6JWrWqOkRntiYrYmML10CP/Sgb9vdu0tWEkTanADt7gfR/3EJpw/BFFH88VacY25E1Ub7aMd8SGzqmpTMJA0ZFCn+eT9OdhkmLU+g5rjiUa2h5lstl/5Gbw9sHBQjMeM81twL0W5PC18G+uzpxGMQ8f1BgamtsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005332; c=relaxed/simple;
	bh=glM8HnRBpbjggci7dgcesL2SapPah0cTwpevxpY1ovM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVdTRRsu4E79EocBHsOH/cAUTwiKV5K0HAAZvB06aN+q8UhEgrLsPyM4imLUAfKL7Y2R2fNepu+qMECZG8AUM+B3sSUf5dTpMG1IvOKusgEa2JN26lzaJqgqJUsZ02AgF0cefJ7OMVdKdVJdIHkr8UPUR4+4gYc0HHgRIXvc5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lJfhqijB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lJfhqijB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741005328;
	bh=glM8HnRBpbjggci7dgcesL2SapPah0cTwpevxpY1ovM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lJfhqijB/q7asCs/XRPjiLjWBv5C3nKVtgn0+R4DqUELIAidEQ9WmCiK9X+KkjW6y
	 HcYoEcQu7soIq/iYJUcBK+08wfkVZM7B6+Nc+lOUA4+Fx24KPbDtJ3YDtYRzj20j8r
	 SBXsTldqCl2kqYRB7Zfrs6M04B7FvaPfCzzsymq6b8P8ni8KY+1+/3Q/SdaFd6TFdJ
	 RTxJY4MuqUqV3xb4KUj+O++f7nyiqfQUa1oSpXFcOxz9dMOTwb+Z7KayOQtjTgsAez
	 GXHbsQrq9YujNCoON8Wdy2mzvqj9KY6Y4s3Sz5+YYjeEq3vnBLAZXHOZmG/j09ei5o
	 xxeh+9XCUrwYA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1A4617E0881;
	Mon,  3 Mar 2025 13:35:27 +0100 (CET)
Date: Mon, 3 Mar 2025 13:35:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, Conor
 Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven
 Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
Message-ID: <20250303133523.2c5153ed@collabora.com>
In-Reply-To: <Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
References: <20250227170012.124768-1-marex@denx.de>
	<20250227170012.124768-7-marex@denx.de>
	<Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
	<fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
	<Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Mar 2025 12:08:51 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Fri, Feb 28, 2025 at 06:05:36PM +0100, Marek Vasut wrote:
> > On 2/28/25 12:06 PM, Liviu Dudau wrote:  
> > > Hi Marek,  
> > 
> > Hi,
> >   
> > > On Thu, Feb 27, 2025 at 05:58:06PM +0100, Marek Vasut wrote:  
> > > > This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
> > > > from runtime PM suspend. Without this, if only the L2 is powered down
> > > > on RPM entry, the GPU gets stuck and does not indicate the firmware is
> > > > booted after RPM resume.  
> > > 
> > > That doesn't sound right. Can you tell me what GPU firmware are you running
> > > (we are now printing the git sha of the image at boot time).  
> > Please see below. It could be some sort of NXP firmware fork ?
> > 
> > It comes from the NXP firmware repo , mali-imx-r50.2-710cfb6 .
> > 
> > panthor 4d900000.gpu: [drm] clock rate = 1000000000
> > panthor 4d900000.gpu: EM: created perf domain
> > panthor 4d900000.gpu: [drm] mali-unknown id 0xac74 major 0x0 minor 0x0
> > status 0x1
> > panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1
> > MMU:0x2830 AS:0xff
> > panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1
> > tiler_present=0x1
> > panthor 4d900000.gpu: [drm] Firmware protected mode entry not be supported,
> > ignoring
> > panthor 4d900000.gpu: [drm] Firmware git sha:
> > 8e5cfcfec20cc8aff8509d37e72babc935d34a3b  
> 
> This looks like it has been part of a R50 release of the DDK, which is recent
> enough to consider it up-to-date. The issues you're seeing with fast resume are
> probably due to some integration issues or other quirks.
> 
> Boris has the most recent experience with playing with fast resume, maybe
> he can share some tips on where to add messages in Panthor to try to debug
> your problem.

If you end up with fast_reset=true, that means the FW claims it entered
a suspend state from which is can resume quickly (fast-reset), and in
that case, we're only supposed to power on the L2 block at resume time
AFAIK. If there's a component that can tell us more, it's probably the
FW, unfortunately, it doesn't tell us much through the FW interface,
especially if it's not booting properly. Do you hit this error [1]
without this patch, and if you do, what's the status reported there?

[1]https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1051

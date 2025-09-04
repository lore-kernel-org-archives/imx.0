Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C89B2D8771
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994694; cv=none; b=S4qlQwEZwNNlEv+wq0qT5p32QCxucB2SYalU38HSuooOQCmzmTlEKbgKANogEjpQRKt0vIFU3IUxSSd/lIdGBaye1p0MEerbHtO1Ns+IxootOC2SwlKZBcZy1N4IpZhFb3r8fEKBz8B54PPMWjnqsG7n2w79vOfAVdnHEPk/Quk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994694; c=relaxed/simple;
	bh=6QoSyBbdtINchh/KfpXAbLxJBZNAu4kUO37s+5VC3OE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsshcQ5YdS+Pk36O2C6Kb7MlSf4uIgjWyJQUHudUmmEO477KSx1bPK7wbTVJYfb/roCWiMqwEEhUhIkIOOG+rkxk/PbfLF+Kq720KgViqKw5rvxlb/7pNIvTjUXDn764pyrqs3pFw7GusaPvUdpTCmvOpgevU1Pk5IdneryA/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RflE5jop; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RflE5jop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756994691;
	bh=6QoSyBbdtINchh/KfpXAbLxJBZNAu4kUO37s+5VC3OE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RflE5jopt5njlxGhDC3AQjyRyIPKw9BYjyVeuh8p3sZ4CxUB4DnPdESkuwkbUnwEk
	 r+f7FY7ipdHcA6nC1BMelz2e5gJVvDPGOWSXh2MUzsU7IRS4yoX9eQRFX2aRkVW9Eo
	 Zwz/C+PWPmLRiHE/jc9a4VqOElzxRM/FLuT/8hEYYd1iDtMfrMHLF51RfElfCbnfNF
	 +bgFxnfkWCFFqFWYI+Jileitn5LjWNWYHXSKp0kiFfqE+6qLwXYdVyRUhnpGmjbumr
	 kFK4IO9FVT4zOfEC0RfrLOl1Yt3inf1x8FWvzfj+QQppSoZlpsnvO4jfDQTb+D2l+m
	 Cta+AbMlTIrsw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8088E17E03B8;
	Thu,  4 Sep 2025 16:04:50 +0200 (CEST)
Date: Thu, 4 Sep 2025 16:04:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250904160445.1671f140@fedora>
In-Reply-To: <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
	<20250325084349.344a0f11@collabora.com>
	<7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
	<20250325153507.61d82e39@collabora.com>
	<4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
	<20250325155231.0d1b1000@collabora.com>
	<838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
	<20250904082224.113d0cd1@fedora>
	<7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Sep 2025 15:49:31 +0200
Marek Vasut <marek.vasut@mailbox.org> wrote:

> >> I suspect the extra soft reset I did before "un-halted" the GPU and
> >> allowed it to proceed.  
> > 
> > Hm, not quite. I mean, you still need to explicitly boot the MCU after
> > a reset, which is what the write to MCU_CONTROL [1] does. What the
> > soft-reset does though, is reset all GPU blocks, including the MCU.
> > This means the MCU starts from a fresh state when you reach [1].  
> 
> I have a feeling the write to MCU_CONTROL does nothing in my case.

I believe it does, otherwise you wouldn't be able to kick the MCU
and get things working until the first runtime suspend happens. I gut
feeling is that there's something fishy in the FW or SoC integration
that causes the FW HALT request to put the MCU/GPU in a bad state
preventing further MCU_CONTROL(AUTO_START) from functioning correctly
after that point.

> 
> Is there some way to probe the MCU state before/after setting GLB_HALT, 
> and also before/after the MCU_CONTROL write, using 
> gpu_read()/gpu_write() register operations, to find out what is going on 
> with the MCU at each point ?

Yes, there's an MCU_STATUS register [1].

[1]https://elixir.bootlin.com/linux/v6.16.4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1045



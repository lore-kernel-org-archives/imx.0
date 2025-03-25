Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24525A34B
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742914361; cv=none; b=H0bWHbp65FY5//21zBmOv01rJgFWljumNi5eK7SAf6PsRprdq3pwjvd7849P+fuL+UfYz8hnYM6uEKrWqukgjGvDadEDMyqn+Gp1rirxNucuJWtNmKltKooEn4+Oz6GXNxFEagKoc14vzZ94IWGOLqz8Y7S3px19iN7jlJztTEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742914361; c=relaxed/simple;
	bh=ySLulsbTbBlrZdXsS2hTqluDneFtFypME/m8PNZsRFs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKhVVdD8fj+YKPc0eK7FaI4sNQcWm/dnHyWNDKhsy8SG5Vd+8yzgmwRjScuHLYIJO6iG5bgyoo305oXPn0HaQ3mcdO9BdfVgDQnr67GX3D5s9UOwA52Zr/2JoJUmRXhPcV+fkFheE55gfspRHbwyC7CLYSFIeUJTxphXFKD1Y9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pn99e2En; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pn99e2En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742914357;
	bh=ySLulsbTbBlrZdXsS2hTqluDneFtFypME/m8PNZsRFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pn99e2En0lKlFt3i+/VG8+v3A5HD/Cgd196KF5qo6W7Bjc3Ab3rYVSxmMSrVTad3t
	 /Yh3gMsDGhjY+Oq2WIbKZRvqCKsEgHW8y4FD0FRYUUbSJ1mZhJoROemNDx3nOm3MW/
	 Vsxvu7JKKAjikCLN/pj3rbKc+1piGj06x1spsmqOEaMs964gmjWVAJTgjLR1Ybv1AT
	 KdR1ZxM71NYJZ2aVy11nJOShHJdHMZziEzhmV45CBAeuI+vudinBifhO1N4uCVE9M5
	 NrpcH37/MrU46pYz5xjAYvfhtLdgHLZvIb30w6E4UVGPxcW+AW6jaFSe3KUK5Pc+4V
	 Ejf4t29puneoA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5F6617E09BE;
	Tue, 25 Mar 2025 15:52:36 +0100 (CET)
Date: Tue, 25 Mar 2025 15:52:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marex@denx.de>
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
Message-ID: <20250325155231.0d1b1000@collabora.com>
In-Reply-To: <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
	<20250325084349.344a0f11@collabora.com>
	<7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
	<20250325153507.61d82e39@collabora.com>
	<4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
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

On Tue, 25 Mar 2025 15:37:01 +0100
Marek Vasut <marex@denx.de> wrote:

> On 3/25/25 3:35 PM, Boris Brezillon wrote:
> > On Tue, 25 Mar 2025 14:50:32 +0100
> > Marek Vasut <marex@denx.de> wrote:
> >   
> >> On 3/25/25 8:43 AM, Boris Brezillon wrote:  
> >>> On Tue, 25 Mar 2025 00:37:59 +0100
> >>> Marek Vasut <marex@denx.de> wrote:
> >>>      
> >>>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
> >>>>
> >>>> [...]
> >>>>     
> >>>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> >>>>>>     
> >>>>>>     	panthor_devfreq_suspend(ptdev);
> >>>>>>     
> >>>>>> +	reset_control_assert(ptdev->resets);  
> >>>>>
> >>>>> Hm, that might be the cause of the fast reset issue (which is a fast
> >>>>> resume more than a fast reset BTW): if you re-assert the reset line on
> >>>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> >>>>> up in a state where it needs a slow reset (all data sections reset to
> >>>>> their initial state). Can you try to move the reset_control_[de]assert
> >>>>> to the unplug/init functions?  
> >>>> Is it correct to assume , that if I remove all reset_control_assert()
> >>>> calls (and keep only the _deassert() calls), the slow resume problem
> >>>> should go away too ?  
> >>>
> >>> Yeah, dropping the _assert()s should do the trick.  
> >> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and
> >> suggest something too ?  
> > 
> > Can you try keep all the clks/regulators/power-domains/... on after
> > init, and see if the fast resume works with that. If it does,
> > re-introduce one resource at a time to find out which one causes the
> > MCU to lose its state.  
> 
> I already tried that too . I spent quite a while until I reached that L2 
> workaround in fact.

So, with your RPM suspend/resume being NOPs, it still doesn't work?
Unless the FW is doing something behind our back, I don't really see
why this would fail on your platform, but not on the rk3588. Are you
sure the power domains are kept on at all times. I'm asking, because if
you linked all the PDs, the on/off sequence is automatically handled by
the RPM core at suspend/resume time.

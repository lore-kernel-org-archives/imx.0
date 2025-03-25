Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D138385
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888640; cv=none; b=SbBUdfXIyKniqGb+HZIupQOZBmrfh2kee7M5i0OhiCGRgSpbM8rtMrwzU0yIGtgM3KOfzmEYFxeiD4Huu45J1H2F+7LG3cqdyHJGkpNG4UBPnmGkHlVxfqh53pa7lsu+rp1gIuoG9gDMftr8Ha+a+D2aleScVPjv7BilcsFtgAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888640; c=relaxed/simple;
	bh=rowfx31ag+FaIVlyMn1GbT430uSDmMWtfpOE8qhrvfk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKg1YBR/g/TbHmIYtKlhcBh2MpyjAm1anBV2AUtOs8a+OK8Ev2F8VfGxV7XbiLAW/4sdgalj9r0MwVbi/cDom3k4jVwLsS3fB2XU5g7qCjA7v2ObzSbhj128r4dZuRDfrSo0Lb65H4plSdn+syvXmFaCF1uPcCbvyxaEX073uac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HoIP+bg+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HoIP+bg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742888636;
	bh=rowfx31ag+FaIVlyMn1GbT430uSDmMWtfpOE8qhrvfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HoIP+bg+keOvp01Bky9kTZx9UKTUDt4bl0iYEs7svMOQ0E/g7SyDZRQ1q4CyWvQVb
	 win4N7WVucOV4qgu11ypeOV8vJlwLlupKp91w8Kxww0ChBrItaLdX42OL/ca3lU3nc
	 bYuNVjgvPbQIk30ZeLOQHb4HRP6Yzr+ZRD9d83V/o3fMvduKNvKdzvLObOZu8VPQmU
	 4EawrT94E2AL64mpmVfUsR+AM/QFL8/3boRXQlzHow2XzAMjnOWGyYeILutxoD0jRX
	 RmCGNiRmaGrJos1XmuMDvbmYl9zs5jQeLSwzXQvYbgIcTLRkI60aQM4QmPDm4olHgX
	 rmk6hBT63kCcA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB06417E0CAB;
	Tue, 25 Mar 2025 08:43:55 +0100 (CET)
Date: Tue, 25 Mar 2025 08:43:49 +0100
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
Message-ID: <20250325084349.344a0f11@collabora.com>
In-Reply-To: <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
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

On Tue, 25 Mar 2025 00:37:59 +0100
Marek Vasut <marex@denx.de> wrote:

> On 3/24/25 9:43 AM, Boris Brezillon wrote:
> 
> [...]
> 
> >> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> >>   
> >>   	panthor_devfreq_suspend(ptdev);
> >>   
> >> +	reset_control_assert(ptdev->resets);  
> > 
> > Hm, that might be the cause of the fast reset issue (which is a fast
> > resume more than a fast reset BTW): if you re-assert the reset line on
> > runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> > up in a state where it needs a slow reset (all data sections reset to
> > their initial state). Can you try to move the reset_control_[de]assert
> > to the unplug/init functions?  
> Is it correct to assume , that if I remove all reset_control_assert() 
> calls (and keep only the _deassert() calls), the slow resume problem 
> should go away too ?

Yeah, dropping the _assert()s should do the trick.


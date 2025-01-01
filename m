Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB7BE4A
	for <imx@lists.linux.dev>; Wed,  1 Jan 2025 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735770989; cv=none; b=rHnvNfDcduBq4wA02loDLg7Db0oUKjuicamYAW3BsAURnZOhaLL6yEhWCCBuzyDu6pLfCtW3kI6ObvEMv5QNLFhgHUv/98ZAfoqox0rW4MZI2gpfPkjt8KBqEjCHAMwRS/lB+w0LTNo4GuyCQNBjfWDkDHfKVoyuXg1xGGpcZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735770989; c=relaxed/simple;
	bh=iNsUYUiEGnb6iomJgG7ri6tQFUsvekg+LieM8mXv0LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxkJ3duWJ9PZd9fYuJY3rDLRDNWYqhfKcvs/lq35VRCZwuk3h/zhg/wUYYvkaiVxG3Sqj9e0GfPEr80i0kMUqHVunB6tE9aMxICi6qFr/kfPo87IK8XPhwflAXqgjVHwShl6dLJMfsVN9JuZozJPh9S1vXoCsINWcFBPup3G5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HN25fJ9U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HN25fJ9U"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC886778;
	Wed,  1 Jan 2025 23:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735770931;
	bh=iNsUYUiEGnb6iomJgG7ri6tQFUsvekg+LieM8mXv0LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HN25fJ9Uo0EujdCHA2A8+alerR+ls8x0zaHaJVziAbh8RG+Rt/T84/+weZt7P/Jch
	 ci58r2q2MApprmFn93DRlQVXV9bmfhe5Kri4mklEOTuvRBPB5XX+ULQHbbST48fZAG
	 wZUN+NucQCH+YLdg4jz/+Y5SMxmOTFDmHV0z+ff8=
Date: Thu, 2 Jan 2025 00:36:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250101223620.GA7206@pendragon.ideasonboard.com>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>

On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thank you for the patch.
> > 
> > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >> HDMI but do not contain the HDMI connector node. This flag allows such
> >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >> use this flag, do not proliferate this flag, please fix your DTs.
> > 
> > What's the rationale for this, what prevents fixing DT instead of using
> > this flag ? Adding such a flag will most likely open the door to
> > proliferation.
> 
> See the V2 series discussion, there are a few in-tree DTs which do not 
> have the HDMI connector node. The rationale is there might be more and 
> they might come from vendors, so this flag is necessary to work around 
> those DTs.
>
> > If you can't fix the DT on particular boards, patching it could be an
> > option. We had a similar problem on Renesas boards, which we fixed with
> > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > to create LVDS encoder nodes"). This made the workaround self-contained,
> > and allowed dropping it several kernel versions later (in commit
> > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > compatibility").
>
> Frankly, I would much rather fix the few in-tree DTs and mandate the 
> HDMI connector node in DT, which would keep the code simple, rather than 
> maintain a backward compatibility workaround for problem which might not 
> even exist.

The in-tree device tree sources should be converted as part of the
series, I don't see a point trying to maintain backward compatibility
for in-tree DT sources.

For out-of-tree sources it depends on how likely the problem is. There's
no regression if nobody is affected. I personally like restricting
backward compatibility to the strict minimum, to ensure that all new DTs
will use proper bindings. Making the backward compatibility code
self-contained helps there, and we could also print a loud warning
(WARN_ON() seems appropriate) and set a date for the removal of the
workaround.

-- 
Regards,

Laurent Pinchart

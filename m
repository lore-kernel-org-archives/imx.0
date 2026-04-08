Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521A35B64E;
	Wed,  8 Apr 2026 06:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775630322; cv=none; b=cY7XCMUZ9JgL/iZTkDeOq+AnTihjKIeRURcibXn9GkVN7uaU23DoKlQNKtBLtAqRiTVpQ8Fxb1ALrjjgQsCYceYVyDPGln4zohAztX8ZmDTaItNc4bm8awOL3tnBYKdPOf93Bxv/oIyVuwiV16GvsvCDUuoyG3UoGinjFVg77MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775630322; c=relaxed/simple;
	bh=F5C8Khj7DpMvOKVUF26GhkolmJLJIPfPjUu2n/qWpsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/OBADXtQ14vPFh/ZAVvtXihDGUX/yiQpuMEmOTIuD/yJQ4QkZFEV0GkLxQm5si4va9aAXXoE0sz0Hv4i9z5XMLSGE/JvRM6I7WLt6tUHtUEQhiyFEZ5XySuLTf0jJIU7bLsAA8asV9zL1m/H2LzVzWe7mw1fpvrXtn/wkoBcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQSdJzm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQSdJzm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7327C19424;
	Wed,  8 Apr 2026 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775630322;
	bh=F5C8Khj7DpMvOKVUF26GhkolmJLJIPfPjUu2n/qWpsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQSdJzm4eO6CsxuDaJG33sr7UfkT9iUvvWpf5Pbvg9CGfy8vVw3x9tlrJDlrgK0Dl
	 HKlVeiCR5xhpBmJUR/Eg3j0SBFGSZlSKV2opkYwt0++zEdFCTAN+AvnSrp5IwW0tzH
	 zTHkhyYSGzPsSwVY+YnL9jKU5hm/dlBHmjrVCXWHRaQO6RdZ93h6emeRC96jfzMRgp
	 40r9gqQJWeiV5BMe6G1BP2200rSg6syrYybZjCbc1p2mC0XGOAq0rYxrKHkpBxwi7R
	 x4h8zopuXVJO85aASLARrjit/bkzoOy5q8lmTK+BC7ZfhBAjNXYIOLRtH98v5e7WV3
	 g3GOxgk0B24og==
Date: Wed, 8 Apr 2026 08:38:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Ying Liu <victor.liu@nxp.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v21 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Message-ID: <20260408-accelerated-sturdy-skink-caaa3b@quoll>
References: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>

On Tue, Apr 07, 2026 at 02:31:24PM +0000, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Hi,
> 
> Since Sandor left NXP some time back, I'll be taking over this patchset
> and continue the upstreaming process from where he left off.
> 
> The patchset adds initial support for Cadence MHDP8501(HDMI/DP) DRM bridge
> and Cadence HDP-TX PHY(HDMI/DP) for Freescale i.MX8MQ.
> 
> I addressed all remaining reviewers' comments from v20 but I'm not sure
> whether Alexander's issue is still present. Alexander, let me know if
> you're still experiencing a black screen with this patch-set and I'll
> try to address it in the next revision.
> 
> --
> Changes in v21:
>  - Dropped "phy: Add HDMI configuration options" patch because it was
>    already merged separately;
>  - Rebased to latest linux-next (7.0-rc6) and fixed all issues
>    introduced by API changes in DRM;
>  - Addressed Maxime's comment on patch #5 and used debugfs file instead
>    of sysfs for printing firmware version;
>  - Addressed all Dmitry's comments: handled the
>    cdns_mhdp_mailbox_send_recv_multi() error, removed the RGB 10bit
>    unused code, added a dts property in order to get the bridge type (I
>    couldn't find another way to do it...);
>  - Dropped Krzysztof's r-b tag for patch #4 (which is now patch #3)
>    since I added a new property;

Whych property? You really are not supposed to add new properties at
v21. This means your binding was incomplete while being discussed for
~20 revisions.

Best regards,
Krzysztof


Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F500199FCE
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728581547; cv=none; b=EUuCuIehyXre5OVtBXjD5r5QP5x2JpWR1k3nt2eiGWmUctgbUoHaPWEUV3y0DqQru6+YFhV58kBkBB1D2862b5toktgSGkTfoHLWdU3yIJeXeNqbc7KMl+xc7BN7dpwGwRm11adFpeC0K7NkoPj3BkwBsOZd26oweCZq+yR8Bxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728581547; c=relaxed/simple;
	bh=DBGSFyeGpg3Lyq7bMgiHR11eMUKFCjLYtGzbTeJX2WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4p/q3lLiF4paPf5cfN7mZ/1u2/+LMWLr1jJitsBz7arJ5bFzNeQMipFziTRHMFRpUAkeRKEKIkSyNy1VwkBhVYTt3jxZXb67dFjP15Uq1nNcI/eEDG1jI/xnbOaOBZPQolsxaG44zxxlSV09dPYamCy81OJZa32KTEnAMeVX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=T10ECyw9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="T10ECyw9"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A078888C4D;
	Thu, 10 Oct 2024 19:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1728581538;
	bh=whVPNiD48iq4xnM5NE3XZjeKQAj/SaELDNhmlyjaFuc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T10ECyw9dzjf6mzqhX1FM6UD8931MbNFhBm+OsnIN4kcO0UWcDmcKIfJqrzH4SGcC
	 rYL90t81XbzK5NxR0LrR1BoISqtL5N//4RhKEzXLqtalwrVmmKVFOCrVdTlF2eifdQ
	 SPXJwnfnOzwHCsa0y/CUvYVnt0OBi+HAW1rVMyjcNSrObN0S1hL29lTy4ZXBYqV/Go
	 gJwJ4TZVBI//jqjx3t1MYybjNhRM655GivIj9HfnG6WNB4+ZU9EFLe48HuXm494ME7
	 GXQhXnzzjlZ9M7drcOclEGlrpcURpA7mbhljWbYAt7reIfEDt9q5mKy9VuskptjLA4
	 QUCBAg3LMnSvg==
Message-ID: <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
Date: Thu, 10 Oct 2024 19:29:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
To: Liu Ying <victor.liu@nxp.com>, Isaac Scott
 <isaac.scott@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, kieran.bingham@ideasonboard.com
References: <20240531202813.277109-1-marex@denx.de>
 <1897634.CQOukoFCf9@steina-w> <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/10/24 7:31 AM, Liu Ying wrote:

Hi,

>> This Video PLL1 configuration since moved to &media_blk_ctrl {} , but it is still in the imx8mp.dtsi . Therefore, to make your panel work at the correct desired pixel clock frequency instead of some random one inherited from imx8mp.dtsi, add the following to the pollux DT, I believe that will fix the problem and is the correct fix:
>>
>> &media_blk_ctrl {
>>     // 506800000 = 72400000 * 7 (for single-link LVDS, this is enough)
>>     // there is no need to multiply the clock by * 2
>>     assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <500000000>, <506800000>;
> 
> This assigns "video_pll1" clock rate to 506.8MHz which is currently not
> listed in imx_pll1443x_tbl[].

Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") 
the 1443x PLLs can be configured to arbitrary rates which for video PLL 
is desirable as those should produce accurate clock.

> Does the below patch[1] fix the regression issue? It explicitly sets
> the clock frequency of the panel timing to 74.25MHz.
> 
> [1] https://patchwork.freedesktop.org/patch/616905/?series=139266&rev=1
That patch is wrong, there is an existing entry for this panel in 
panel-simple.c which is correct and precise, please do not add that kind 
of imprecise duplicate timings into DT.

[...]

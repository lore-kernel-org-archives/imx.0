Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51327272904
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767235; cv=none; b=JoI3xU0Buti855MMfnYThcW3vqk1iTO1lGhah2CTviTzwOl5cPbt7fmqCBZkjPiWWd/D1rrh5aElAguxspc1nr+JiWYT4C9OKi3n/aKXsj24IvMoRYTXJ7h6U7eksJzNucOB3sA++cX13OQ1iOhCZEHNeQN8lGPANFXdM4VtYbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767235; c=relaxed/simple;
	bh=auPiGja2fOWKcpDpa+VzDPrqPoySJ6m8kUALjLG24QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBNOJ6H5e9s12B0C4GjyhAa9he05a5pfyVu1jZhG4W53Djt3kHgXVBXbPgI4DL17AyI9vV+0DkCcVvMONEBgn4kjaTj0qyloXFOX/GB9/zUiPwfy/+OOPj+LecFngqE3R6joblEpT8Vq4TFsMEwrX/axayt+pfqtapfoaZsLeMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=UqAzTE1p; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="UqAzTE1p"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5774102901CF;
	Fri, 28 Feb 2025 19:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzwK/2ndWQXM//wMkO3/Qdh0k5btOjmnwFacXzTF3kk=;
	b=UqAzTE1pv0PeVxUpgwyNifM7y00xjUNJN4kveqUsZWhjsvv9BBZ/tGHxzkOoxlIagi7zng
	Sx4XYnp+RdTovBJqeY9uBOfrB6cvIojqmjjf/En0Mb4VGAbwK3WsQTzGtuB5z/Hsrk1H9s
	W+CK1HF9pIltglnooTASo/kHxjrTcNLW9ohEW4eWvXiwKcm95QcGUm6sXD9p2vzyv2w/Rh
	fYEWNEKW4MSKNGiqwkH6T8W6P8p+JNgNmn3mGaW/sPLGGioHH3EASHuLB/2Lqhed/mGqE0
	XzIVf6/L1g6loiGJaZ0HRNe+GEwu/XGwqEfHlhEUkAoGpxM/uQGx0QJ1ZeB3WQ==
Message-ID: <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
Date: Fri, 28 Feb 2025 18:05:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 12:06 PM, Liviu Dudau wrote:
> Hi Marek,

Hi,

> On Thu, Feb 27, 2025 at 05:58:06PM +0100, Marek Vasut wrote:
>> This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
>> from runtime PM suspend. Without this, if only the L2 is powered down
>> on RPM entry, the GPU gets stuck and does not indicate the firmware is
>> booted after RPM resume.
> 
> That doesn't sound right. Can you tell me what GPU firmware are you running
> (we are now printing the git sha of the image at boot time).
Please see below. It could be some sort of NXP firmware fork ?

It comes from the NXP firmware repo , mali-imx-r50.2-710cfb6 .

panthor 4d900000.gpu: [drm] clock rate = 1000000000
panthor 4d900000.gpu: EM: created perf domain
panthor 4d900000.gpu: [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 
status 0x1
panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1 
MMU:0x2830 AS:0xff
panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1 
tiler_present=0x1
panthor 4d900000.gpu: [drm] Firmware protected mode entry not be 
supported, ignoring
panthor 4d900000.gpu: [drm] Firmware git sha: 
8e5cfcfec20cc8aff8509d37e72babc935d34a3b
panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 
Instrumentation features 0x71
[drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0

$ sha256sum mali_csffw.bin
befd23b9279b26010ebf35c835cc3aa7d0f50758930c7306ff4f5abbe5218624 
mali_csffw.bin

[...]

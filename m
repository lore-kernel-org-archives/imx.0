Received: from mail-m49231.qiye.163.com (mail-m49231.qiye.163.com [45.254.49.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6791DA0E1
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 08:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777537413; cv=none; b=TVNv1FhRJmn+IpgrXHvwJ0KhuMlD8Iiwn9tU6z2kt5Vnzoi1+jt47TlubUrUkqDM/eQ8LBPPcbaw98WgCuTeBD+jVx3sgALe9LOwqNY3ojt/ZV4K4RAjgfas4I/aY8sy9Wl10c/s6tMZSd1rc7h6fFcX+7hM1yPqvKe1LFSxdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777537413; c=relaxed/simple;
	bh=Nhg6v9wkj9NOWYJlrFmyFnFqD9XUqPScL78w+bWfD+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cs0djMtRDHdf73ytWJtIQubq8mQAl7dy1xEBRyT/NWhGdgLgTCuiMbewdPHGuId9Th6RwF11sYlBJNpZGCiwr6DyBotdBiQj1QXi1vQVj+e6TNXJrtqMHT5/pUjR1Odae1hASuID9QDEzLbs2eIUofa1cT6UMlFwUs37Ie09eyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=JriyospK; arc=none smtp.client-ip=45.254.49.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JriyospK"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3cbf68ef4;
	Thu, 30 Apr 2026 16:07:59 +0800 (GMT+08:00)
Message-ID: <3756b3a7-7bcf-4881-9a88-874a935cf316@rock-chips.com>
Date: Thu, 30 Apr 2026 16:07:59 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ipv3: add CONFIG_OF dependency for
 DRM_OF_DISPLAY_MODE_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Arnd Bergmann
 <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260429140024.192432-1-arnd@kernel.org>
 <DI6B0UNV68LI.3PYKFFB0F1DH6@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DI6B0UNV68LI.3PYKFFB0F1DH6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ddd6e30d503a3kunm33c4ba8e2f2b99
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0xITVZNGEwZSR4eHx
	gdGEpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JriyospKZowPAbJu0L56T91/MgoUxUQsXr3KWbPS0Z7HV5jEUX6Ut3Rp/SpmkWYxcRukdw7sMCBowRHQKe+FfsxdTQCAvp687YIPMOGryt+9WK0Cl21tT2GYPXAL8iiuqf146ZHM8XKUddJNlQLllEa0XhkYNeQB1A53Rad0mHY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CJHRPqWKTWyTfPBOd40VwdpOX9kewYtb/ZNyefthoiA=;
	h=date:mime-version:subject:message-id:from;

On 4/30/2026 3:17 PM, Luca Ceresoli wrote:
> On Wed Apr 29, 2026 at 4:00 PM CEST, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Without this, not all dependencies are met here.
>>
>>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=n]
>>    Selected by [y]:
>>    - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
>>    - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]
>>
>> Fixes: ba2db93cf3d5 ("drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


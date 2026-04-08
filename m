Received: from mail-m32103.qiye.163.com (mail-m32103.qiye.163.com [220.197.32.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366F7325483
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 01:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612299; cv=none; b=mP42J3ixQVHF8Hj2Oo7lCWJcav8ndM9q+JDsx71GL6O3cAqtMFFPm7zgPlmblpECTtoTfs/svpqQxXFTEbfQF3EOuJoUesukfAdL1ddOHfF634tgUQoeSovGRu/hPoZZ0nyuP5r+cx9bBFvkVmpqIGKJe1mtv+RAd3Sbu0DdlxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612299; c=relaxed/simple;
	bh=vGqOoNs/Whlta2hPSIuN6VPUgzk0T1NZRB6ISwxydow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxBa0I/ZaF5TPhEbo57Xl5jgmso8M3NFMPnqLNvahYNq0yEz8f8TOpt4jHM7nN89DomTjLw+Yx07XIeZ0/ekfs518BCLsYBnynaG9SwE2DFEdgfQ9J/BFj/btsQW9F5f8E9izeV7VZo6qb/nNXC+dHds+T3DwXt0H550Vf7EqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Hd1vd4jp; arc=none smtp.client-ip=220.197.32.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Hd1vd4jp"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 39de7d730;
	Wed, 8 Apr 2026 09:38:04 +0800 (GMT+08:00)
Message-ID: <ee5ba5ac-3d33-4542-9abe-6d3e0d1e1d76@rock-chips.com>
Date: Wed, 8 Apr 2026 09:38:03 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/17] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
 p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 alim.akhtar@samsung.com, dmitry.baryshkov@oss.qualcomm.com,
 nicolas.frattaroli@collabora.com, dianders@chromium.org,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260401091454.25730-1-damon.ding@rock-chips.com>
 <20260401091454.25730-3-damon.ding@rock-chips.com>
 <DHMXIJKO62F2.3JVF0Y6L7DI0I@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DHMXIJKO62F2.3JVF0Y6L7DI0I@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d6abd4cba03a3kunm02c5d4f5311355
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpPHlYYHRlKTUpCHhgfQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Hd1vd4jplB+V/AGhFIiROBjwtKrMDwt728WjZzN6yYhQVzxRFstEyjBi+BZCN7a3A9WPY14JeUCdNIV1oAUbaRqlm8laee1Ct43HI8Qk8JgjcXcj8lEZANU5MrrEtuUzkx6Q/u83DBAb598knymj5BynVPjfQ7ffVnmecTsaW6E=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=500nTzOsPEHbmmnZSC4nbTuUuD8MTS9l045tiv5dYA4=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 4/7/2026 8:41 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Wed Apr 1, 2026 at 11:14 AM CEST, Damon Ding wrote:
>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>> out of imx/ subdir for multi-platform use. The driver is also renamed
>> to make it more generic and suitable for platforms other than i.MX.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
> 
> I tried applying patchs 1-9 to drm-misc-next but patch 2 does not apply due
> to conflicts in the Kconfig file. Can you please rebase and send a new
> iteration?
> 
> 

Sure, will rebase and send a new version soon.

Best regards,
Damon


Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784114EC5B
	for <imx@lists.linux.dev>; Thu, 28 Nov 2024 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783630; cv=none; b=BvlbPH0KkrtjPzWdLVT+oMiccp8qGFW2h8G8S6HA6r0SAtzRQU7QsnXtkuunHNxLiUUAhiYJQI23v83JxiewRtnxyQ1h/zJYlM+1YMQvFreL66ywW+qLalSLIm3N7qNApPnGg2qkAVW7W0DhVe6S0bYE6pAwMtTcMz5lPZQNlKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783630; c=relaxed/simple;
	bh=xdqtgM27YWmrgOqei4mkolxnceoYVrdTWJ6Dz51igbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bk88f/BJd6v0GjP/YkgsDLQPn8XEMjlKMGLyNFnkc3UtBTTgyb87praI7LZTjaE9WVf7Lr4pmA+F1ByXBShqfwxCL8wUCKHESYJk3VVJ+XfPImALOVC5jm9zzNWohtvVwM8LrkwbWwqF7aZIg8M71MKQLIkMjJRjHmb78gly0z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V2IFpiDw; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V2IFpiDw"
Message-ID: <c4334c9b-833b-4923-8188-64d662231512@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732783624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOSMhqdqSNHzc6Y2732B2LXEY8wXpjTk/vIt0M1oHnU=;
	b=V2IFpiDweMUXNBus/VrD5t1I//7Gz9UTqTJlX3cSyUym9EIZ+69HJGd1qZQ2sIj+W2Nm9+
	Dx/E2Y/Kd3xnFxV2OpirmhaF2gxkxE+s0nqeEsYREZ8vAdmeRBwj3VllN79322U4BrvE+M
	UVJnEE4qznqqhAaiXBC3PXP2q0oDDK4=
Date: Thu, 28 Nov 2024 16:46:53 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [v4,09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
References: <20241125093316.2357162-10-victor.liu@nxp.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20241125093316.2357162-10-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2024/11/25 17:33, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The display engine driver as a master binds FrameGen and
> TCon drivers as components.  While at it, the display engine driver
> is a component to be bound with the upcoming DRM driver.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)


Why?

Its seems that the switch to regmap APIs is not very necessary,
as ioremap/writel/readl are simple enough and easier to use.

Isn't that this just introduce an intermediate layer? It's okay
for display bridges/panels that behind I2C bus or SPI bus. But
then, why drm/msm still haven't be converted to use the regmap
APIs ?

Just a few questions, has no opinions to your patch.

-- 
Best regards,
Sui


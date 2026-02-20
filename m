Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE4128934F
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578065; cv=none; b=rpw/Kr/2zW5+8uhiueMpIAgZDSR4Ex055cNJDzJmAm8ZzM6POEwQn6WLtRsTmZGNtyCxBEr2umTh4BAf2i1X/SOAQM161CyOGVy06wpkzNfvLXM10hCiagMsZpLvqDgKEoL++lxGwSxyhjZGD3uPlI0c6Zwd8g4BNeeJcNWbo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578065; c=relaxed/simple;
	bh=Qyfx7vIQJpUOhbXGextIhoP6RuhpY8zjMDDMUTtK9W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWE9ATUdDXglqMnM4h0+nG1H634IGwNywnO2KnUAiFldBElqZYLrVXg5Vak2a9w+18qgs4gtmbBEztqB/YlAsFafEvr2v9XG52siEeCAHFd7nYPGFqMfDu1d0f+lYtaS0rFn7MidaW9XR7v+LZEz495775ydcDQGwJ9NzK6Th0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L5C+M2jQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L5C+M2jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771578062;
	bh=Qyfx7vIQJpUOhbXGextIhoP6RuhpY8zjMDDMUTtK9W8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L5C+M2jQY/y68bEcwrLqFQCRTsgP8GcfINwZfAXsc3s8Q2Lvfo4P7UICsBkVjoB0h
	 u1E7i0/Kai7k3vgDlMIqomjv8DGgZK3ki0ZRgu/z3e9X3quDvfDkIUQA5e5w9w1vlG
	 aYMYL5Wr58oevdPnV0DqGBomtE6DEWo8OhY+1jTbIk69h7VsO7ov8gj4PNbbZZleA8
	 vW9ym9WPHT/MfDUpY48iu+fofnSBHbDUdJG0xoQVmOKrbo4PCbBp7Rw2+vspkRJjwp
	 01LImxQyC/rJA9d1EMbnW0JcAcqArx0n3HJ2LBFtn9TttU8Ai3oWMjd6D79bTrQE8b
	 JM85V/waKA/Kg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9E6717E0097;
	Fri, 20 Feb 2026 10:01:01 +0100 (CET)
Message-ID: <fb697f64-1f2f-4a9b-b430-23867f205f12@collabora.com>
Date: Fri, 20 Feb 2026 10:01:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
To: Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for your patches.

On 2/10/26 22:42, Frank Li wrote:
> Add the helper API v4l2_async_pad_init_and_register_subdev(), which
> combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
> v4l2_async_register_subdev() into a single call.

I think this is a good idea, but can you extend that to offer variants
for v4l2_async_register_subdev_sensor and v4l2_device_register_subdev too?

The function names are awfully long, though. Can we call this
    media_register_subdev{_async,_sensor,}
maybe?

Best regards,
Michael

> 
> Reduce code duplication and simplify error handling in drivers.
> 
> Only change dwc and cdns. If agree add API, more driver can be simplified.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (3):
>       media: v4l: async: add helper API v4l2_async_pad_init_and_register_subdev()
>       media: synopsys: Use v4l2_async_pad_init_and_register_subdev() to simplify code
>       media: cadence: cdns-csi2rx: Use v4l2_async_pad_init_and_register_subdev() to simplify code
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c     | 18 ++++----------
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++---------
>  drivers/media/v4l2-core/v4l2-async.c             | 30 ++++++++++++++++++++++++
>  include/media/v4l2-async.h                       | 18 ++++++++++++++
>  4 files changed, 55 insertions(+), 26 deletions(-)
> ---
> base-commit: bc0bfce7d0f8204e0bbadcee72e87ad9ec105c73
> change-id: 20260210-v4l2_init_register-0e6d0adcfa21
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 


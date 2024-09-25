Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F74644E
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280579; cv=none; b=SAbqdbZAcq8/V0COLPfxAxw23AU24Cx55lRl3TComEb12lwW3xzWZKknrCaqbvVhxwt24hOytHFW+eqifL/l85dKjophdaIj/Eo6PUNLwXhbdTjucamBVWLudvTRAlGGIA9A496Xt2oCdALHxej2mfKaJO3DNr6jfgk/TvTiHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280579; c=relaxed/simple;
	bh=lg/iI4hZoajx+b0U7SWbWtXnilv08PsMqWYodIQ0g+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOzz2a/VCuUuepaobKJ4r8f5zsgjkEOLEnWh3uZvPNGBJM/WUl8l9fxqNWUMPVTINQT8uzE8xkKAeN7N67PfZIWyxu7BpnypljNdXZEZ3a8/BQxdMsO9gahbV8++BnQIRAh07Qz2XAp+hHFqXk0aJf1saq82Mm1GRO493/k57rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=yPQaOqKU; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="yPQaOqKU"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AABD388B63;
	Wed, 25 Sep 2024 18:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727280571;
	bh=pKIb0NlqaLV0X/VCYBMhdIFO7pr+Y97u8itZR02Ft1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yPQaOqKUpBQuUI3bePihQUw4fMcSd4+Smdpl+ViHhl9gcqgIU77Ag8lYNZs/uKbsG
	 2XB5+SyIuh8yXoAwnkvb5uHvD0iFh3FW72mdC257TGXlUxf3ChcC7JQOJ/n9YCR7xx
	 TEsSqVRUY1pl5iLjCGC3eTExYAvs0MP68sB3drM67HVYx0JTpBWgwlpu/z0c+ZBVWE
	 AhgoK9QvUEtTxB958qliqKhztdzWjSiBVkt/Mc+kiEJ6lboNrY+NLWO0QGWMdBVrBI
	 9GD1RT+I47eRNQhLoveRGAy6I1hHKWU+XGquazj32GD8Cb9b81TUQ6UO+FzQedM5HW
	 ydvnB0UGFibOg==
Message-ID: <03b05be4-2276-4e70-9480-2b1467df4ef6@denx.de>
Date: Wed, 25 Sep 2024 18:09:29 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: imx8m: Probe the SoC driver late
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Jeff Johnson
 <quic_jjohnson@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Saravana Kannan <saravanak@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240925160026.84091-1-marex@denx.de>
 <486054ad-20c2-45f4-a457-c9334afb53ed@app.fastmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <486054ad-20c2-45f4-a457-c9334afb53ed@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/25/24 6:04 PM, Arnd Bergmann wrote:
> On Wed, Sep 25, 2024, at 16:00, Marek Vasut wrote:
>> With driver_async_probe=* on kernel command line, the following trace is
>> produced because on i.MX8M Plus hardware because the soc-imx8m.c driver
>> calls of_clk_get_by_name() which returns -EPROBE_DEFER because the clock
>> driver is not yet probed. This was not detected during regular testing
>> without driver_async_probe.
>>
>> Attempt to fix it by probing the SoC driver late, but I don't think that
>> is the correct approach here.
> 
> I think the correct fix would be to propagate the -EPROBE_DEFER
> and return that from imx8_soc_init(), so it gets retried again
> after the clock driver.
I already tried that, but if I return -EPROBE_DEFER from 
device_initcall, it doesn't get retriggered . I suspect EPROBE_DEFER 
works only for proper drivers ?

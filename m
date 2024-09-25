Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4429042067
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284063; cv=none; b=U+NIvvXqVDyVb6YjSpPdymNx20sEb+Dkrl1tKHGGcknynIX1RTSYWMp9Tid15LB8EEbFyHNI3NZaAK3Oy+5CeplOoCEj75WVU8znI4mRfOM/TCpYUky1uHLBAFDl+JcBCP6FPscdx5cnwzU1+CKoG3aLGIQPR0vSO3PPNtBUWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284063; c=relaxed/simple;
	bh=yzyZj0d/GhSL/W0kJ9v5Y+JZ4nBmCZ+SW74YrNACG3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gztm5c7ZUF/pDPNRAkr7peJCr3r7lqbe45j9nNHyY7B+JMqIXvDbGatRjXLcWZUYXvAJWiMCISijSKNPZptiX/Sv/aG6nC1on4UiIuugkZnbGC+bO4IiN/hEm71ThHhpAOUbfdTrfHLbr1/T+T1tXnBJgiRTEq6e7Utz9TIkCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ooyZ+xFT; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ooyZ+xFT"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9A1AD88B11;
	Wed, 25 Sep 2024 19:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727284060;
	bh=8+HgJKxrwAY63JScyz5udf8wj0Dom3hJq9xnxn7aWAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ooyZ+xFTy3f5P/kv62Len9dkssXpHBN01k1EqBTRjDSkXz+FE0gWgghva5lsrbD36
	 OZ25MH/0QSOr9adm9kJxjYhVHeyd1beOpiHqUhjErud/Dry5w8TuoNQyywQlh/2nlg
	 FfWpNV9AjfMMVCkf2+atZBDYsCv+wRai2K6EVYzpbdS2VtzKJ3cy+eYZqW1XKDoxnT
	 oKE1CoidefAA4oCJfW0oPe5CZ8+p17mLzVqxbSS87Ck2YKEoMaSIaOUJK2f3FC+Hz8
	 Hhz1pPGpq/Y1oJfEea4XuXp/wktcSJST6zXuqtl1pdPZ5yrvkOkJC/b1Pdl6WY/FIW
	 P5a4WW2kSAOKg==
Message-ID: <51c340c5-b104-4872-bfdc-8c6d52f6a35a@denx.de>
Date: Wed, 25 Sep 2024 19:07:19 +0200
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
 <03b05be4-2276-4e70-9480-2b1467df4ef6@denx.de>
 <4897ec78-b82c-415d-88dd-5092fa009f77@app.fastmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4897ec78-b82c-415d-88dd-5092fa009f77@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/25/24 6:31 PM, Arnd Bergmann wrote:
> On Wed, Sep 25, 2024, at 16:09, Marek Vasut wrote:
>> On 9/25/24 6:04 PM, Arnd Bergmann wrote:
>>> On Wed, Sep 25, 2024, at 16:00, Marek Vasut wrote:
>>>> With driver_async_probe=* on kernel command line, the following trace is
>>>> produced because on i.MX8M Plus hardware because the soc-imx8m.c driver
>>>> calls of_clk_get_by_name() which returns -EPROBE_DEFER because the clock
>>>> driver is not yet probed. This was not detected during regular testing
>>>> without driver_async_probe.
>>>>
>>>> Attempt to fix it by probing the SoC driver late, but I don't think that
>>>> is the correct approach here.
>>>
>>> I think the correct fix would be to propagate the -EPROBE_DEFER
>>> and return that from imx8_soc_init(), so it gets retried again
>>> after the clock driver.
>> I already tried that, but if I return -EPROBE_DEFER from
>> device_initcall, it doesn't get retriggered . I suspect EPROBE_DEFER
>> works only for proper drivers ?
> 
> Right, of course. And unfortunately it can't just register to
> the fsl,imx8mm-anatop/fsl,imx8mm-ocotp/... nodes because they
> all have a driver already.
> 
> On the other hand, making it a late_initcall() defeats the
> purpose of the driver because then it can't be used by other
> drivers with soc_device_match(), resulting in incorrect
> behavior when another driver relies on this to enable
> a chip revision specific workaround.
I know, I am unsure how to proceed with this. Convert this to 
platform_driver or some such and probe it early maybe ?

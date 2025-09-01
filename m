Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D70F3043B0
	for <imx@lists.linux.dev>; Mon,  1 Sep 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717755; cv=none; b=OZpO9N4iar5692uQeaYMgvgsADKDpnEFuFEwkeQcz35Zoske/A3s7NURjP9tBbmlYnK3yQM4C5U8z4KxYzwH6TPklo8CzHW4KJJB1YBAyiGUyZF6u27Me/QzxCFkX9s0lWNpk9C3h4HlMpVdDlxkwOxMlx144+4w5ADJ+BCwuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717755; c=relaxed/simple;
	bh=PHiUvICP0aYOlnmmgLUBKOKa0p96Stm0kjepB/azcGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8iDLeYPYBVMsr3TTvhwhTiSlbXgUpyMF6AkVXdsF2bMQMF6Q/Uj4vR2Re6pdbbyUY2ZT15yEzeqgbykILpDflgemYaiGO4ZrZdqhoGNjdMTQ/5pWWXxaZjprGlgAM5mnPNzu10mBEi+GsRM1X6ukVyE87hqHNSujTkahAqUiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+jQPxX8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+jQPxX8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so7932845e9.2
        for <imx@lists.linux.dev>; Mon, 01 Sep 2025 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717752; x=1757322552; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+Xo4tkbFhwj2dkE+zxlT5qS+Qcu77hpuQM/6Wfp1/E=;
        b=q+jQPxX8SngSbZzVKc4SgoenWYJk2MbAgQLEo1J4SrXf9oBDj3lBj1EDS7rLlMMxBN
         O6RJSF+6Wd+eNswP7VUQ4wuB//CwZDWPkUM9HXF8o0uFkuqpMIkVS9TDLGnoouyKvNXD
         KsGxm51vrE5+hZCTyXMKXqTD7ohmd+TrIbh5nxFc7cy1hzW6CV766f+SxgDFFI7jRmZs
         lFHj+6rbPxapwcQhTaNGarDoO8s4amxlI0juwoM05NRIDLN5gl2Cdiro/zHLjiibgPJ/
         FM+uonv/rPJy7hr9tGAhdmgXSZopjtYgaXNNVeJdgrM0wdOP4OJZtY58pIxoKVylzXmo
         WwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717752; x=1757322552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+Xo4tkbFhwj2dkE+zxlT5qS+Qcu77hpuQM/6Wfp1/E=;
        b=ECpCZcVohiUkiec911JxWnB9bPMSugQyEAub3rjimPegvota/a0M9N0sXuMmWffwEV
         Y0xsPtV+ssq9swykFoGuyP9LHGDr0u6UYZE2hyYL7oqE7ccPelM6chLvhstfblRPqeyL
         ehlf0rk8k9l2v/jc5cyHUM+NyKvkYorG7EtQRrEy0mP90cFcyFCR57HD9/9JsHYHrawr
         A+DDFNbkjXYD9gFTvQRVqRRE14MYIoOOP0+/I9+pnTfNaNt89CYcyvnmZvFb7VpjefaZ
         67mS55x5wSPeiVQ1iXT/g4KakHR29rmwiOaHs7u7D/CUtRvf7C065X+it14wVMiFc5ob
         Vaqg==
X-Forwarded-Encrypted: i=1; AJvYcCUPqcpfignySG5dFftR0W4dJp01pc/0Y094jFBZihxphhFe5V7QCl0AXrjIlWfEV+KvTiE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLIHqU/h5a9mZXfzP/N7+nOJEIWB2/vR1povGHDD8BMjLddGl+
	d9CW2ECmchWWv8Gyrw0CjoSGIodLyWukLhoOGjZXqAW78JsC//q2+C3zjFFK7SLiFRY=
X-Gm-Gg: ASbGnctaAfbMaIVplEHgyDE6XIMtO5zpYe0a9Gr1/FFILz3jmbwkpj2l+h0XReCLQ5U
	6xJ4/aisuFTkiGGwrlkzPFBo/uG2BwCvY5fWAYv25XWR0aF24cv3BSC5k3Y7ZIZoBZPVWvfdNjV
	g/MPXoZNCxjRt1PqGpz07nj2VqR/P6zgJ/ea3UjCAsyh7eg8y3S0z06/ClpvIcGFW9V1vNmxmV6
	YiBDnZoZosg7FdHq1B/cs7FlmVye4/auET8z/W/y/XK8nTk1GOP08c46PbtyfJJt/H+ZoNfCOjr
	+j2ckvOr8wBcdqptd5sLiiSY0/rs2cCj7hBkaLCU753J45iLePwDh5R1tXmio3+wBwJmeTjPNTa
	ayNWr4jSPyMATUNYEp6+Ae5iNVCzR7FMgptO0Lw==
X-Google-Smtp-Source: AGHT+IGQBSkz2khdRsQAv7vacSGMiUv3G+dZ9L9wmpydMb3GXDxwfB16QPW8+IRZec1HkLE7lP8j4g==
X-Received: by 2002:a05:600c:1e8f:b0:45b:8067:d8ac with SMTP id 5b1f17b1804b1-45b8553362bmr52083795e9.13.1756717751775;
        Mon, 01 Sep 2025 02:09:11 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8f6cd502sm6940335e9.1.2025.09.01.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:09:11 -0700 (PDT)
Message-ID: <ce55ed06-7326-473b-a2f9-40b0bc61c396@linaro.org>
Date: Mon, 1 Sep 2025 10:09:10 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] spi: spi-fsl-dspi: Stub out DMA functions
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
 <20250829-james-nxp-spi-dma-v5-3-3246957a6ea9@linaro.org>
 <20250829142636.7nv3ylyck5yda3fd@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250829142636.7nv3ylyck5yda3fd@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/08/2025 3:26 pm, Vladimir Oltean wrote:
> Hi James,
> 
> On Fri, Aug 29, 2025 at 12:46:45PM +0100, James Clark wrote:
>> This will allow the build to succeed with !CONFIG_DMA_ENGINE, either due
>> to a randconfig build test or when the target only uses one of the
>> non-DMA transfer modes which this driver supports.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> Sorry for not paying attention to this previously. I didn't pick up from
> previous conversations what problem this is addressing. I built an arm64
> kernel with CONFIG_DMA_ENGINE disabled (by unsetting CONFIG_DMADEVICES)
> and it got built successfully. The .config is attached.

Did you test with or without these patches applied? It's only needed to 
make the commit "spi: spi-fsl-dspi: Use non-coherent memory for DMA" 
build because that's a newer function that isn't stubbed out like the 
old ones.

I originally tried to fix it in the DMA code so it got spun out into a 
new thread, which is probably why you missed it. And the commit message 
is missing the reported-by and closes tags which I'll add.

> 
> Please post the specific build error if you haven't done so already, and
> give a reasonable hint at the technical motivation in the commit message.

The reason we saw the issue was a randconfig build. But it's possible 
that someone is building the driver without DMA as well, hence: "or when 
the target only uses one of the non-DMA transfer modes which this driver 
supports".

The new commit message can be:

   spi: spi-fsl-dspi: Stub out DMA functions

   In a later commit we'll use dma_alloc_noncoherent() which isn't
   stubbed out for builds without CONFIG_DMA_ENGINE and results in the
   following build error:

     spi-fsl-dspi.c:(.text+0x644): undefined reference to
        `dma_free_pages'
     m68k-linux-ld: spi-fsl-dspi.c:(.text+0x67a): undefined reference to
        `dma_free_pages'

   To continue to support devices that only need XSPI mode and so that
   randconfig builds work, stub out DMA functionality in the DSPI driver.

   Reported-by: kernel test robot <lkp@intel.com>
   Closes: 
https://lore.kernel.org/oe-kbuild-all/202506160036.t9VDxF6p-lkp@intel.com/
   Signed-off-by: James Clark <james.clark@linaro.org>




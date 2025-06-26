Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4AD16A94A
	for <imx@lists.linux.dev>; Thu, 26 Jun 2025 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932295; cv=none; b=Wga7xaTWlCXZp2GLnHN27sWaCFQwj/4bsoD/DfrK6ao6j/GH5fSIeR0wvF5sM3yUOxgWjS1sa8nF5uaev6YPT7R2kiaTLeiEnDIJjba7FvmImH7ZLRSSfDRGE78KLgAAteJUh/jKW+SuBWoI29Vtbd9LGlurS9QumurQ+f6U83E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932295; c=relaxed/simple;
	bh=WQ/9cxE5gGmXPpCJKlnLFbBEfplrIztKZyWOvmdN1kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QOhaZeRy4RzY7woAoTPGS3dX7DixdLk8TiX/eubikFA9VOAEg3fRtJ2SAOKlhluxX0RRGxJ01c4I7Cd30MbDDR6ocvjx3/M0zKK8mHP+MxuUqQ0mzdbWOeW7+7cLhW1LM/Pcem0iyM/f3aLJn+576aZGxpnmjkmTywH9hCrmmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DfnndKa8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DfnndKa8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d3f72391so7612085e9.3
        for <imx@lists.linux.dev>; Thu, 26 Jun 2025 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750932292; x=1751537092; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxAnOS8rNH0+1NZmQ65jb9c6BDRmhT9+YPsn9/ebwI=;
        b=DfnndKa8+6BXMgJI4cITafzHZU1J6I8MqD3+dxHeSdqfM5NK/i/q33wS0vMwqVZEzg
         wu3IcS4CCizHeiXF70BuYfDJ+Nu9y5EnwRLvvzIFdtVmMgOO1Xk9y0HFF9eu5c9YeZ8n
         nJRCyo1cMhC+8yCa3rc1YzVfK/03fjtZTaFSOk0UkTZr7l1sDsoulQ6zU2+17/6Svkqw
         UTw/ffjiQZIPhR7yfRFs1J3gBtDM0EbxpWX4b8Mc++Q6HfzTm7z7sCG4i/LjJwKTIGYQ
         5h4r90dORHe+a4LqCRhxQF85hZTV48ZnxdDaQ8ZLzrxqzlITdfKnySlA/CA07Sh/YGRI
         vpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932292; x=1751537092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxAnOS8rNH0+1NZmQ65jb9c6BDRmhT9+YPsn9/ebwI=;
        b=HG3NMLtrQtFndsExYc3MCzlmbBOjBkNQhL8pco5Cnq72MFJrulh5cK0WXh901CIcUu
         t3pS/dxuFGIlVWn2KbB6ND+sUKIut8iPbB/l0h/jaWhEtTObf88JY9SvF3QEBf8HDhjK
         IWxxVxpicm70olA/gLcdaVnKJitmHQl4L8RMHkgPuQE6jNTpnPAFb/tJLx/UflFjEWL1
         4qhCN1FwucS8q2u2B4aAncG0P/O1c4VtFsGNg26gHnjZz3tSDdK+NTVKdaVGakVWKvX2
         A4/cWVBSCDHCgHDFI6gFTkE7hV55Upu6oO1/nJ0OFcXuXfaQvQRz0M679q9oHAchy5+z
         BQEw==
X-Forwarded-Encrypted: i=1; AJvYcCWkS6PWBJJloke78uWTcG8lAABOAsqQCO2gv/tC5AVr3SFg2YFOt84oqtH3aFnx73Mc+Ik=@lists.linux.dev
X-Gm-Message-State: AOJu0YykWlWLLuYJ8ew3b1JNlG7sVLA4c0P+/2FdvWLzp7JXuTzqn2zQ
	fJWISyAV9N4HvmtlWpWWGv+VRZd566XPOdTlul9bRSivDuR7UeUqBHi8Pk7l6mwR8VM=
X-Gm-Gg: ASbGncueNfWeLMXNldK1Uo+O9LLwQC5BzjW8BYqRx2fCYBCJGN1h4GVQcWOx1i32vMt
	Qw0tGzJ/45tWKTVbLmFxkBRDDjXh3EBJpih7S6qOo7/yPuTTA1c5GOVHIiisrL83hHL4X1sMbFb
	D0QLTjBdmtNqfFTxmlSwgUK+mpY3dQ7zz3iXe+Lz3uwafdak1ARkjMVP3rVq9NxdUt6jj8svJa6
	I/wLfEJBw9vAXlkx7xb53JkcmgkNC2wcUHLKhdpJDGu0rzpAyv89DenCkt0chEj+BpceMvzMdVk
	655C0WVhCxa8FyyTg30ypt0n29jJdCHEIFEFdbKm+zdUc2DORWE3low7JLaRD04rI2A=
X-Google-Smtp-Source: AGHT+IFCIAdj1Md0jSwbK4WcI3GRDjT0JPNkwOFSc+l7/qC5ZuHylf2IYZ0En0415K5jiUPMuSKnLQ==
X-Received: by 2002:a05:600c:1c25:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45383371376mr51561945e9.11.1750932291936;
        Thu, 26 Jun 2025 03:04:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814a6275sm33518135e9.1.2025.06.26.03.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:04:51 -0700 (PDT)
Message-ID: <faf23c39-af14-40ae-ad22-849aea87a4bd@linaro.org>
Date: Thu, 26 Jun 2025 11:04:50 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] spi: spi-fsl-dspi: Stub out DMA functions
To: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>,
 Christoph Hellwig <hch@lst.de>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-3-e7d574f5f62c@linaro.org>
 <aFrSgJ5xZfccEX9x@lizhi-Precision-Tower-5810>
 <290fc244-e88f-47a3-8dd3-0ec27eb5c60b@app.fastmail.com>
 <0c6c78da-575a-4d29-a79a-3903aa801b42@linaro.org>
 <0f904f12-295c-48fe-96c7-c64c461cdbbd@app.fastmail.com>
 <884e86be-112b-44dd-a827-30355a5fdba6@linaro.org>
 <82824032-26d4-42a6-8a92-3e4a410741c5@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <82824032-26d4-42a6-8a92-3e4a410741c5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 11:54 am, Arnd Bergmann wrote:
> On Wed, Jun 25, 2025, at 12:19, James Clark wrote:
>> On 25/06/2025 11:00 am, Arnd Bergmann wrote:
>>> On Wed, Jun 25, 2025, at 11:19, James Clark wrote:
>>>> On 24/06/2025 6:16 pm, Arnd Bergmann wrote:
>>
>> Wouldn't that allow someone to break it by disabling (or not enabling)
>> that option? The driver won't fall back to the other modes if DMA isn't
>> configured, it just won't work. In this case it seems like it's better
>> to depend directly on DMA_ENGINE because that fixes the randconfig
>> issues, which is the whole reason for the discussion.
> 
> It would be the same as disabling DMA_ENGINE today when running on an
> SoC that supports DMA mode in DSPI. Ideally that should fall back
> to non-accelerated mode. I see a lot of checks for
> trans_mode == DSPI_DMA_MODE, and I it's probably best to change
> them to a function call like
> 
> static inline bool dsp_dma_mode(struct fsl_dspi *dspi)
> {
>       if (!IS_ENABLED(CONFIG_DMA_ENGINE)) // or CONFIG_FSL_DSPI_USE_DMA
>            return false;
> 
>       return dspi->devtype_data->trans_mode == DSPI_DMA_MODE;
> }
> 

I think we'd have to check with Vladimir on that. He said that he didn't 
change some devices that use DMA to use XSPI because he couldn't verify 
that they would still work [1]. So by adding this fallback we would be 
making that decision now, which I'm not sure we can do. It would 
probably be better to add the stubs that make the probe fail rather than 
register a driver with a fallback that we don't know works.

>> Would someone really want an option to disable compilation of two
>> functions if their DSPI device is one that doesn't use DMA? Seems like
>> this option would always be on anyway.
> 
> It's probably mainly relevant if they want to completely turn off
> CONFIG_DMA_ENGINE, which is substantially bigger. Using a check
> for that symbol in the driver is certainly simpler for the user,
> as they can't accidentally turn it off the custom symbol.

That was my thinking.

> 
> In theory you may also want to turn off DMA mode for testing,
> which is supported by at least the DW_DMA driver.
> 
> I see that SPI_TEGRA114 has a dependency on TEGRA20_APB_DMA,
> which is yet another variation. This is clearly done for
> usability purposes since that SPI driver only ever works with
> the specific DMA driver in practice, but it seems worse
> conceptually.
> 
>       Arnd

I can add it, I'm just questioning the usefulness of adding a new 
config option that's unlikely to be used in reality. It only achieves 
the same thing as doing #if CONFIG_DMA_ENGINE in one place in the code.

Ultimately we're just trying to fix some randconfig error, if we start 
adding new knobs for people to turn just do that, there's a risk they 
won't get used and we'll make configuring more complicated for people.

Testing might be a partial justification, but that config wouldn't allow 
you to force DMA mode where XSPI is used. You would almost certainly be 
doing that too if you are doing that kind of testing, and you'd have to 
hack the driver anyway to do that.

[1]: https://lkml.org/lkml/2025/6/12/1385


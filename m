Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7118C008
	for <imx@lists.linux.dev>; Thu, 27 Mar 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089413; cv=none; b=uwe8cLLF7Y1o3axn0S8RmusrgquMDaLImfLuBC2CFwbMva8lMEWw2i4Z1v08lREnDrlPIL8p8dPXg+TuBTIInD5uZmmbxkyWyMm0tr009IuWvqhC7PlHbh4+/SqiHqZfV5nZ6vUbHeCwyxb2BwJk1SAEy5Mqr87YwvTT7pXgGAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089413; c=relaxed/simple;
	bh=l/sLG8PC4gXLKCxWoq5MWAup6XbGuswoRl/UrGZ8sVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5so90J9UBN3avvNwQRNGqDNSFkt8+yeMqVw3dmxv2+nR/JIH6Y7pTq05hottpzTykk1zua8XPoZug97wl4ZGrxmnnC+Dx3eOda6R8jnLq1Nqfc8g8V0pgriaG4z+jlAGAEX1NTjuJ5AUdZj97A935kfBLfkMUTeMbXEfN4OJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8pAeEuT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8pAeEuT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so1435245e9.0
        for <imx@lists.linux.dev>; Thu, 27 Mar 2025 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089411; x=1743694211; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDTM7gCM2Kwwvfyexd3QaIiedFBu6zY904IFEm1Fsg4=;
        b=m8pAeEuTq3R/yw0UkxeaaVhMbM+QD88/Gc2jPjJbbMyyaqLYI/1Md7m2KdjQeiAHh9
         uJ+MYFu6oYLcVsXhv8TXgaMU2ucFRgowdpFGUWN9geA8HDuIcQk9mqk34ev3D8SgxcAn
         YT900fBGEMZWQNWwNj/3qYypKek6UoHn49BCvXYURfah46EbWJUc8upxiwi8PaDDcvHq
         MjqZYaTwfIDC9y08p9ax/W+h9IU65wPUkTDVpi5GfpG3XLbRJLowFZX2Urj80lGg1x8B
         BmkgavzncksDyWJyMWeGfwTgBF8w6IAxfVQnos98TCik00iXkmDrINzOc4/LQ1+Z0klY
         bVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089411; x=1743694211;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDTM7gCM2Kwwvfyexd3QaIiedFBu6zY904IFEm1Fsg4=;
        b=Gv+LKNy/q4eYqthW/JBOtzmOACWdZHYkkf32E0aaE51wfNBPzfQHYVvnarn3zdcq4O
         LXgsBmR7rWUz8N/t7Jyc5vpXlSoWuiLyujEG8Bk3zxltu2HmlaMuBp429OfR+nKp16sN
         KtEEEgVGQobAwJwV0gyKm4CXHpjlx5DamM3nIzlb/GfwUgBZgMrVSZEyBqZKfILlWCIy
         RUYliNKn1Qha1vLIafLieTVHm4kIHFnFdZGHT01q881sFMwlF6FWnMXR8/ujuGm6xSOI
         0c1HGfK77ovnxSnpl0D6VukHkkEoFjOX4sT6BZ8CJDYABkOETSUvnr1asWBBBhd4KVn1
         rsdQ==
X-Gm-Message-State: AOJu0YwPwk5Nkj9RYiPE1OJwt3xnMygLjTmr6QMq3IqE/Uc3mK5N4/0H
	x1BTwhrQ7IgFcRgXdEYM9INh2qLPUvuKXNPcyUk+/m6j9M6M6ZP1tt1cTY822Cw=
X-Gm-Gg: ASbGncv/P08RX3qtAsdlNoZ8JcX+ESTsF7VaQqmw5IHOYhe3rWsmi/zco9+w+XDJoel
	dD98sBsNjkguEcxQEwhEK6b6CECoVKxPpJaeF78LcSdBVsbFLYGIptSOAS9KEnK+NJySbFryJ5E
	7igeeCLDPCDeAZnqNPC8ESn9MtMqJO++OGFPIN3+ETEQGh+GSYgoxXwlHIJfbU4iY51/hhkAkKK
	PdcHz1OvlsUFkd2vCZc4kZbgKW/1jPH0WDk46x7m/07KW2yLsfdlIP5RtJjJos83kYsKptDDBSI
	ZSxDjnalsUzTy1zELGNxnB3VNhJ0F6hNF/Qt1upE7K79w9068OK+SwsX6Jts1C0=
X-Google-Smtp-Source: AGHT+IF2gN6pmNyXrSbguw4xZiJb1RMuPqlNif0uKWYwjztvDXAo7S1+b0DX3m907oWsIX+97Ua/bw==
X-Received: by 2002:a05:600c:1c0b:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-43d85f11800mr15495595e9.7.1743089410828;
        Thu, 27 Mar 2025 08:30:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995a05sm20018946f8f.8.2025.03.27.08.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:30:10 -0700 (PDT)
Message-ID: <a772a388-87b8-41e7-a142-2ba48eef2941@linaro.org>
Date: Thu, 27 Mar 2025 16:30:08 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: layerscape: fix index passed to
 syscon_regmap_lookup_by_phandle_args
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Frank Li <Frank.Li@nxp.com>, linux-pci@vger.kernel.org
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250327151949.2765193-1-ioana.ciornei@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250327151949.2765193-1-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 16:19, Ioana Ciornei wrote:
> The arg_count variable passed to the
> syscon_regmap_lookup_by_phandle_args() function represents the number of
> argument cells following the phandle. In this case, the number of
> arguments should be 1 instead of 2 since the dt property looks like
> below.
> 	fsl,pcie-scfg = <&scfg 0>;
> 
> Without this fix, layerscape-pcie fails with the following message on
> LS1043A:
> 
> [    0.157041] OF: /soc/pcie@3500000: phandle scfg@1570000 needs 2, found 1
> [    0.157050] layerscape-pcie 3500000.pcie: No syscfg phandle specified
> [    0.157053] layerscape-pcie 3500000.pcie: probe with driver layerscape-pcie failed with error -22
> 
> Fixes: 149fc35734e5 ("PCI: layerscape: Use syscon_regmap_lookup_by_phandle_args")

Uh, obviously, probably I thought the code is using
of_property_read_u32_index(), but that's of_property_read_u32_array().

Thanks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

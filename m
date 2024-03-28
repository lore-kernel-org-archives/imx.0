Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556FD1E533
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663224; cv=none; b=oosaNUzxBMw2j3NvhON2VbeY3NGreGg4mSEhAY8h1jOXIljJG7Z3ej37M/MnTCiXw9Yv+WD6ReifH73YNVw1JqWCckgA1BjW8/t0UH69fsl9yqfeUYoPuam0J993qYWsrhyGIeRHEGtOBtTl6gQWn4c5xkcNX7EuvX9t7ptYfDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663224; c=relaxed/simple;
	bh=7MqrmimirpAMc8bI17wSVbDTaNTRMixXbxuO4WyuWv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIe9hktpeuMraf7jkK4nU/FC4WydUXjHR2fBpM1gaxn3OE7SNuhrGBNhxmOb+HwpJAlqCBvHPOs0/Ia5wXclvnbPLH1v4GvGpinEXJplnpOC9r18AnuBnOJsCZsfomPMcGF/ApTdFGIYFLKbV2wvLc+fbvAyimJBExQjuTZNFG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CW8z67Jk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CW8z67Jk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4149532da36so10061205e9.0
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711663221; x=1712268021; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+nzz842T8uvPgGA37gRhi/RyRugh8WFT8T5DDSxKVI=;
        b=CW8z67Jk3MGBsojHkvD7bwO8yVG04Bl35JdPrV91zFDoN+Rh5Pmqvh5QjHSQKPDOEi
         U4kqUxTVXihKkjZqdtwqLiwBSooO9ktW/uRmBqaYS2FWVRT7S+aIoyU5RjtS76LpAYQg
         1klvppyZ24kO0b+KKZ7cy4pRBFkK9zxIv7qXe7nURPaXGSUGGFQoTaT+8GsfK09oazei
         8S54wctwylx9Mny52L4G+zkUUR9IQ7aXHOoQ1VVWYqu+7FEGvfyxfcK6E57NXvt4369R
         LoEhL9U5rLSXH2VdL1s9h4eu+xYkH1kiad/vv/hO4dEHDjsZwlcj9+i2ZaacG3pluqhj
         NzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663221; x=1712268021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+nzz842T8uvPgGA37gRhi/RyRugh8WFT8T5DDSxKVI=;
        b=R9K2iLysSNxTRGUvUXxdUAmSHnbm22Pg+U/kq21oLlz4PSX+LRo+3hiGo6HUnDJCwW
         TMsmZpQJ39w0WMyKqg7qgIK61HTppCLdmD+QougR6nWivuzOgqckKHNNInQi+DzVpLz/
         AmuoLg7/WUTV/t5y8nMhd7m9jPks7BwW6YCpQvo80MxsTQIcZ6JjqRPJj96HUc9qB+KN
         Nmt/9M+zqVGEvTP+LZnGAfHOve/I0RipKeFtgW60+0S7yRhUGwJGYmcOdaIn6DOwcMlY
         bTGNXn886UQKH2QXr0GHruPiHxZxR7SPNfrEQNn7KeBEt5AqELojwjuXy3q9kUlKd54I
         X8PA==
X-Forwarded-Encrypted: i=1; AJvYcCUJBZm5mjvfl1MzIacgBxvXghZ4c8mIyL0PrPwGtko4teHEUOEZC1Ijf0ocg+vNnuOd29w27nAUX72KRgPgcfkNdBeu
X-Gm-Message-State: AOJu0YzOlVsm1b4W8BCq7QYIVXv/TpvmsP3VM56Cc/GNbYYWqla0eaAH
	p1mQ9erNk2GfaeK3qQOdLsaEWaw0+wkcyaNoRwrj+ZGpMbJ8Y40aISiJgP2dbuo=
X-Google-Smtp-Source: AGHT+IFg7XOKE3EJsJnj8dVwV9Ot9zLykBjJowmIs90t1vuvC0KZGpRWRGZa7XwOahPI3juFH7h94w==
X-Received: by 2002:a05:600c:4f4b:b0:414:8e02:e435 with SMTP id m11-20020a05600c4f4b00b004148e02e435mr397745wmq.3.1711663220643;
        Thu, 28 Mar 2024 15:00:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c4fcf00b0041488895a37sm6601485wmq.33.2024.03.28.15.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 15:00:20 -0700 (PDT)
Message-ID: <7241501f-27aa-4c0b-8930-c8fcb0e2926b@linaro.org>
Date: Thu, 28 Mar 2024 23:00:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Emcraft Systems
To: Gilles Talis <gilles.talis@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 shawnguo@kernel.org, festevam@gmail.com, alex@voxelbotics.com
References: <20240328202320.187596-1-gilles.talis@gmail.com>
 <20240328202320.187596-2-gilles.talis@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328202320.187596-2-gilles.talis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 21:23, Gilles Talis wrote:
> Add an entry for Emcraft Systems (https://www.emcraft.com/)
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof


Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571D19CD13
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227652; cv=none; b=RNtYxozSPTSeiRjL5IF4YTA0v+ASuNYGfRuFAOUYqk82XM8VxNhCMepPLeoaSXaDsN+h9Ph2SQxORPaW2CaY0IgsbACTN7xWOBfu2Qt1M/neJpRV6QQn3gGV0WIkUNpC1dhB3p167MZ2W6RsBBBLGaUHzAwCYGvrqVysDLEffmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227652; c=relaxed/simple;
	bh=9XuRFGO9jLnurGDGxXbu9n9FnOFT9RbV+4eCVyZvpAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPSAuq9T+p4K4j9iAD1idWa5Cg/YHmuRDvIkG1glzO6E/Ki7DHV8Bi2kh9QNGRFw3PHoabL2Iqp13PY3XxNKsHG4sohjEJsJOZ3vdDRNz1S9lSF85FpUKjuM2XbbrVDh5hxYkDH3v3TnX8m3GhIf6P431NEV67gzNDSake5qmq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWWU9UeP; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWWU9UeP"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac24ec112fcso75729866b.0
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742227648; x=1742832448; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UuHbh4MYV3gTJ0X4cZQ8+nBi40Q4Lk1nrGFJC9SvTOQ=;
        b=yWWU9UePQbOgqTegTbOyVm276wBCYT1mmtqtc8f5BhHNucEbn68DCtz1xcApvfGBy1
         pR4mz+UpcsJZ9LK/4ZqemQqyVdlYnmW6usCXgqwoXIGSgAr+Dpj2+ja/SP1KFZRm5chW
         GfA92uRCiVA+ZFxuFgzrnlCe3Lpcs9OkRorZjl2LWe6JjXxYbredCCXFor5SSXYzIPCG
         CduDOkwoxmWBCQkXFDdxtodEmZzLsRk/xqNdOEPfMLWuyNJfk+7q+zotPYTLspmNdLJR
         nbsCRHo6krZIgufxvYUTMXKAFE+6gayriq3VkfPuzuC41+UyLP8rcnajymkzn7iIE20H
         PlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227648; x=1742832448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuHbh4MYV3gTJ0X4cZQ8+nBi40Q4Lk1nrGFJC9SvTOQ=;
        b=fb/PToRu+wYQflkVzUx3wfPPCWCg6JRJlaYZlT7X6gkcy1FozOpgX7Ar5j+cC4QEtM
         +/lXUgbKMz2Ez5u8DN9C5n+VR6Erbhqbm1dWuGw7X+BPMquKExzGIueHLfWxN0KIeoIE
         FvvOh3rzpxRwxBh9yvZ0VtbsLAeXkkonl1/ODz0nEv+UF7QNkIA4TCoCrgYQo4HNDrsP
         vudnwtC9uRzpVK8EQZB9hcYQuTPVKOFiYjGlmutIt+pBLFkXrbq50BxLhsOIgKNqGTNo
         AHF7e3bt8t62DiW0ezcOdKmN77oL+uNfqxgqO9OeFdUbbQqEBia9SU01zsDMcH0rr/qO
         YgTA==
X-Forwarded-Encrypted: i=1; AJvYcCXSoYIx5sr1vwUHNM6sH2mfFPfrtJhjzPEecs6qQJZmhatRZZIT7E2dABw/n93k9qyrhA4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs7y9ieJQbpAmFW5YjXI6a+Oo7BTlzLZIlxyfNzWTtBdNa2n77
	/J1JFDmX++uxcXr7Xy0h7dRMgQhG/xxwKpLYbHorjCXGifBXQ+GmOjQwyRhEp38=
X-Gm-Gg: ASbGncuLCFbLtN4O2M4Hd/alXk9izdpLyVrc51rKiLO3nOCR51DGczOKm3C+A9G9g79
	Z30DtHMT0L0qzvfploDsQ9joX6+50LF+viyVwNzSmMC6TRT9RsRY8ppEi7Rf3WKb4zHYjgnRSB6
	zMFUX0WMvAAMeZoC4I3OuF/1gTX6Pwln+TKvzpt5GC6bQ4d9coqrIzMkGWmngB3kq7qoNCPBbPm
	NLBrYRIAl+UVlwz0czDns2FR1Ptt32aJb0nDBbnWd6b7g6c76kfLrUCPcF/j3x0im9oozXOmvkQ
	LCQ0FcuiCk6wmOBrOG87cLgFKvnbGxaiU2HfW/SCfh90t4tYAcCzW/7W9ZT6BQk=
X-Google-Smtp-Source: AGHT+IEUcabQmU7N1TkMij7G556EuNjnPQ9Y37gUtsBadxWZgY7a5v7ADjlBJypctwLLzxgaf83Hgw==
X-Received: by 2002:a17:907:ec8c:b0:ac3:79ed:7bf0 with SMTP id a640c23a62f3a-ac379ed7c5amr119005866b.0.1742227648257;
        Mon, 17 Mar 2025 09:07:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31484b234sm684404066b.77.2025.03.17.09.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:07:27 -0700 (PDT)
Message-ID: <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
Date: Mon, 17 Mar 2025 17:07:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>, shawnguo@kernel.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2025 09:47, Alberto Merciai wrote:
> While playing with linux-next and imx93-11x11-evk via NFS and TFTP
> I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
> not builtin then the I was not able to reach userland. 
> 
> The following configs were needed to reach my goal:
> CONFIG_DWMAC_IMX8=y
> CONFIG_STMMAC_ETH=y
> CONFIG_NVMEM_IMX_OCOTP_ELE=y
> 
> is that something expected?

You mean they are disabled or you just did not put them inside your
initramfs?

Best regards,
Krzysztof

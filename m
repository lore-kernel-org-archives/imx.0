Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E341581E6
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712692959; cv=none; b=EKUVYKO1dsWd+edFGyBVmhB200Lu6VW3B0q8kAGhYoKOMDDUfmvcrdrD+YBv6VDnFSiWa9gmCzUiaSSlEYHwBChAUo+4+9TRtp7Pv38FkGfWwM47pLZ6oxmwyl8gAy+eQOXBiuZvnUqIHPFtnBI7lp8tdTz5j/N1zlWxfS6X54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712692959; c=relaxed/simple;
	bh=xZE6fAknrFtFcMcsRpUiH6/5dTPD5Xd4Yzw15t+58rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iT6HEExjaoZIjDsCtAqmBt2EEaOlpd4HJdKKL6gN9oXaMcbMOn/fmKlf+sW1XQxMXVwlKWiQy48EVaDt+F53eF5GKlrmMcKdvbt88zkUSXEtDppVbDWJPPx/aI2R+fMb7I5nRBQrImgcRdHyyH+wyGjqmqtXe1EFEM/dciBzL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSUk/Avq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSUk/Avq"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so6663658e87.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 13:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712692955; x=1713297755; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qP/zHelEcajJKZmH8PzSTPov6puOsFvz7yjWMI0/YAE=;
        b=WSUk/AvqlgyJz28vtuD8KoyYKn26XZfgLwFdpFzMg1EF3C03QWyN9C8y4L3IleB/4d
         8YXT8Z84JmQahkTCR5P4iEaYWCuGQp8fdgsbI+5YOBMNNT4+vOF8DcfyG1snZ3VMDyew
         /WEV00nDMnDtxLp5MH4N0OiI8KIHPVihuBEqBzoVdRPWK4UOidAApSVZaSlT18sqfaCt
         smge5ixC4tWLl6Ekp18KAurlJiultoeIN7IDZfEJ3VlDGBBTrCdLF1AsXy79gf57DWOw
         wwqNloR9bQ4S7dQZLQdHVpFCYINnTi3f57RPh0M3AOu7JLt2dtdpedvXPvzuW9LRJQT1
         ZAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712692955; x=1713297755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP/zHelEcajJKZmH8PzSTPov6puOsFvz7yjWMI0/YAE=;
        b=ZqUCnQPnBGzMj9CA6YT6ZeKiunERBAM7qTIuFWDXefQS1R17szEGBBeBB49d4/i+js
         cmpbp1F5MFuIfYdCi/c4uolviVl7j3uSIlgC2R0ubW2YVO33DHrxbULoyjRuyqtxmS9C
         6Eh6AaA+b8X3W80SPj8GIpAQmfNsVDSOS3W3apW56FmUFSKj2DFWWJ9Blpb3/gZxmji9
         k6mlRHbrTHvVVYRvD4TT6vpih8Rug9mNQvTWtBrPDgXP5eDkIkjb6TNQnx28CGdvlXUM
         9V7ljjnuEE8HUKbQroip6gocTigsOTFgVhd2pk60lUooNfcZAta7smTsi9OF5CdkVwCG
         F4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXkZz/LDpm0Itj7djjzls12ebm6p0wQGtzBidgleGsEm/WdXSK9SFp2IWCdlJzc7RQQwWgL+vaqnsrHtNJJpOePzOU
X-Gm-Message-State: AOJu0Yy+GDP6bd1Y+v8rjcrtHFFjE2wyi8QOrXMisffiLSfoLWI3nCmQ
	0nkndLTA/WdNaZ/4p+mZhxyepnvlZzSafuGIj6DLFAGffgS6WMPKb9Evh04pAIo=
X-Google-Smtp-Source: AGHT+IGO4bDo1swVDoKYG/oOq1ZmyH19BSz7jL29XNClKqaLa2NX9QEe9WHaasa5TPB2FZKHEIqe+A==
X-Received: by 2002:ac2:4a9d:0:b0:517:65b5:e721 with SMTP id l29-20020ac24a9d000000b0051765b5e721mr256193lfp.33.1712692955473;
        Tue, 09 Apr 2024 13:02:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id w14-20020a170907270e00b00a4e29b7eb60sm6053146ejk.3.2024.04.09.13.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 13:02:34 -0700 (PDT)
Message-ID: <b15ad271-037e-4ee3-ad88-e8068d31c8c8@linaro.org>
Date: Tue, 9 Apr 2024 22:02:32 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: dma: fsl-edma: remove 'clocks' from
 required
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, robh@kernel.org, vkoul@kernel.org
References: <20240409185416.2224609-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409185416.2224609-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 20:54, Frank Li wrote:
> fsl,imx8qm-adma and fsl,imx8qm-edma don't require 'clocks'. Remove it from
> required and add 'if' block for other compatible string to keep the same
> restrictions.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>       - rebase to dmaengine/next

This fails...

> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index 825f4715499e5..657a7d3ebf857 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -82,7 +82,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
>    - dma-channels
>  
>  allOf:
> @@ -187,6 +186,22 @@ allOf:
>          "#dma-cells":
>            const: 3
>  
> +  - if:
> +      properties:
> +        compatible:
> +	  contains:

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041314B96E
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766280; cv=none; b=QEneXNBkbw2YbfxHoNyD2COCF6W4AVURxD/GDq41sJmEMGBwhfd+yE46VCBnVuyw/9ahCrZPCDbJUTVa1KOCa4pG5jVPZPr5LLsRleToKcZKZ1XTfiYp+D6FOGsqFBdtxumoK64Nea69Bz5wfD06tHZqb+x+S++n57eEk89cutY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766280; c=relaxed/simple;
	bh=x0D/i+KhhuCkNWXFOseN6c+kFaGTNCz3JhPXI85QHIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2BggF8OQ6EnxtV1xHAJOj1ZSPMDZCTXhOCsAHgKBZ/4YIrGnkBJhpIl19f8or/1Asy3stsWelxy+5/n1/A4x7g2+5+wtFf4tmxg3hdyYdMR60XZpEqNGO90D3PDdfDQCs+M7wDJY3pA4oRLVvLgjbjV9iLHnvU4llWcS8jp3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ujq8ZH9R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ujq8ZH9R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4363298fff2so3761845e9.3
        for <imx@lists.linux.dev>; Mon, 13 Jan 2025 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736766277; x=1737371077; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gEmfuSom1K4g2Z3xa5ZnSesfn3qFrMdTPJjB5HBZZu8=;
        b=ujq8ZH9RvGaEzAmVP1JL+/izOkpzLQPutn0qKId63amywUiqskUAWw0SvAWOtPbepf
         D6WUHe2iKaPU0jn8DFZYWCyo0g+tlGYvgq7CTEjejE7qwZBj7yxsV8OqzOGVXS1yQQMG
         SwLtmAV4VRk00pOYI1pSKKjzJoH6jiBOV38gbjb+iCUryWZZxmoUx0XQh3Di3EHiOzRK
         hon3iYat74ZUq6qERyF/bW2QTrI5vtoPOPNyr6usQNcytp1dlBmraqYZbYnFEnFixCwT
         5VlEcLALj6mUNpDnSB295AvF0m9XV8dxhzRc6D8mDksgEunKxQhpXv3eAHpYck8qn6Km
         Jnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736766277; x=1737371077;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEmfuSom1K4g2Z3xa5ZnSesfn3qFrMdTPJjB5HBZZu8=;
        b=bwZioHrjy81rXavU8+1R+qwGGwiQytvepASf29CRBFS3DgxqucmiFwW05Zh4Vzx8gJ
         b/y/Dxy61HHFhtHmQi9/9UKykE+BLhVbI61sLGwMREJWmpTYKtD8FAkdxpIt+wl81s0y
         02Z28SHZCCtRrA/uSBwrggYDy1Mf2oryQ/VYKsvLR1Bmrxyq9elDdKANrYXV706wV5bL
         ZBdbBPwiYmuVGKeRo1BPr+sMGQtZJL5+8LIaC4Obq6X3KP0N5oC+h5V//XvzfufxTqHT
         fAyAE1WCmL/5PWtBLTgpc6CKnyLG0ew2VWyvzs35nxQdNk79YNr72FdMjU91riGd4CgF
         FZ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXseCYnPqgSaK7vuyPyeEBg1kTJr6HH1AOvRM4MxgC8TZPWBhZn1ldRzUA0ckWb8KmY35M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD5VUya6I8wQJjIfLoa10pXwy61CGF16go32kDA+iOErEhMTT3
	RZQBCqFLJ5NEe1WeFEMvN0rDSY89YXZCyhcfESsWXuiAXSaVJvC0yaKrEJveHpU=
X-Gm-Gg: ASbGnctfrvg8cVlPK0RP7C2rFDHkdNxSq479xU1FWLGTZUT75qhRzcJik0GU0CvBody
	jQ6vwoKIVSyhQao5OZoph7axLE40r9Fs9vZAqAdkyXutbw4HavGVZp1eu35sETbdlUxUBK+MU5C
	jVRdaCEWcH+Kz9Hh8OBiVPO8IP2QeLV2HQMqXVRJlPl4ajSVndumvjyTOx4XCwcbCjQ2MGcz21g
	w17cFCemr8x+FVnwVnYTY+r2XND3JQdlRQgDCbmEdZuXPYA2K84A85YGSMA8zSCK2NHATbpxKXH
X-Google-Smtp-Source: AGHT+IFBhgHEBA9yuB0/M8KWfTrBEJrfmm5y1LllORvx6tSaZm1AW8LC5fWL6ENzzzSz3Irm4PbRow==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-436e272c89cmr71879115e9.8.1736766277438;
        Mon, 13 Jan 2025 03:04:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d74sm139859755e9.29.2025.01.13.03.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:04:36 -0800 (PST)
Message-ID: <1376b2b3-90c4-4f06-b05c-10b9e5d1535e@linaro.org>
Date: Mon, 13 Jan 2025 12:04:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/5] net: ti: icssg-prueth: Use
 syscon_regmap_lookup_by_phandle_args
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 imx@lists.linux.dev
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
 <0eaff868-f67f-4e8a-ade8-4bdf98d9d094@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0eaff868-f67f-4e8a-ade8-4bdf98d9d094@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2025 09:07, MD Danish Anwar wrote:
> 
> 
> On 12/01/25 7:02 pm, Krzysztof Kozlowski wrote:
>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>> argument.  Except simpler code this annotates within one line that given
>> phandle has arguments, so grepping for code would be easier.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>
> 
> The patch only touches `drivers/net/ethernet/ti/am65-cpsw-nuss.c`
> however the subject suggests the patch is related to "icssg-prueth".
> 
> I suppose the subject should be changed to "am65-cpsw-nuss" instead of
> "icssg-prueth"

Indeed, copy paste.

Best regards,
Krzysztof

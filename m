Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09E202969
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921970; cv=none; b=PZBZWKNNFll4VriADFBYFv7I8rnu9dWS/MNOHqelUYBY+NkSp+ZlQVXaTC9BM6swM+XHCFnHbJezw3zVJKiIXXkSpMnZtwHDwTRtfSjT3nnjGoC5p+KLqwC34fHbbWISpU3x/ivTbfc+NRRYnMCdjLaCFI42lGrDfUhmBj4Siyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921970; c=relaxed/simple;
	bh=lr3DvzdjN7LkZtdXRREkDCrl05S5abNZMI7c1dAD37M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCuciR5iziEebeX81Bc+ba22K/T6GM+PP21vf1fTlsW5qaASacV5xdtr9rsNKsROKwDwkCL9i2lD++rd9y25PD1BWcBeET3izQyFxvzEGxd+mRObqrFecCuzQk53UdgKTXn79xNtK+jjhPt3u5y3hxIxWftRSHVxUBqQaz6aj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cZoxXcg4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cZoxXcg4"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso49456266b.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754921967; x=1755526767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b7EmAb0UwLypvaNyKn31+KtkbKYbjrEsTvCuMSjsWSk=;
        b=cZoxXcg4yD7oIT5WscSBkFMCriI3PDgIlxkLkE/6rBeol7ObBgvvATawgfxsC8BL03
         1PmMFrX4S5PJ+QIpuTrUXXTNMnSNdg9+UChzQy9je3Kpv+ASA7OL1reqjfZHhug+j5d6
         bkhxIQ68FJQSXhaVFqFQTRyhmNXD6K4Y8K49Ld7yYfQ5uRxWe0w3eYB2uru52gni4pQU
         KK3RTrZ8qg+Wflvg/r79R+FDldUbskA3UWEYQ9L1fbhfYMCW83KXNS0LYuYwJ4qlDXfG
         9jbeGWv8N0fe2+KdEHYqSU1vP/Q85vbm55RIJGlIWzlLB2lwYgkGSvyog6xcbJMI6gUI
         +XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921967; x=1755526767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7EmAb0UwLypvaNyKn31+KtkbKYbjrEsTvCuMSjsWSk=;
        b=JYzorOgs2GO0Y+c157rwP+w45VYiFS9yYUF42fMkED5m1MoUbtDR+IIMtyae6auvXP
         Mad5C0DBeKYnvUWWCwpX9kzJ+T/YbLU16pwLAa+x2NhhcnP8pPubiUY5BH+ELcw+ZIbX
         Szh4EkFTV/9mgeSC8NZXQYwsqvOQjMoiMzQwh9At11tH7CDNyLVyHDELtApyvvl5OOLg
         2WjMIF+7ZP8xKEgVnHId2kNP8h1Kusa8R0ugX7nHZd4YI+5BzeV2NilHavEkaD2+nglB
         RwBJW0XYPG/vjTdTLwOBBSyTtQ3qXaIN9l52I3dVuBPC796HAwKiDpNX2M9lyjdiTPUQ
         jX3g==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZNVu4LGHeR87X9t37widD0LPixFlMrmwHqSuggICXvwXC2bD5PtBktmWpezsbqDjav8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzF9lUi/dYmZzlNUOnaMsjHP0x5JnpG4GYUaX6Yg16U/n75CzHd
	+ZmC5l2X4RT6ivErYexVU3HO86bc/b6YbslXTLYY3mt7NudAAAG51PN8s8ByfXDOOJo=
X-Gm-Gg: ASbGncsTQiqKxVukf5gCn3DE6cQnVqv/Zuo2M8lxZW41o0FtvNVX/RVFmvcOMXA7Nm6
	zBfZmXhRjjA2u1fZW5iRi8QSw83VhxSe/+VoRIinK9hGOJQ37jLSn74N2wt+YFX2SXu/WUc+51w
	CmZ+zlbkijF73H0iHylNsXkksvIEG2FN0s7vHNQ5AJl8pQ9lA1ojRjygeG0OhDy3F0WRenk24v/
	PdLSU909YtWKSF/Iy6T6KEFNV+ElRJBHxbTx8PHCgl+q/IYxBIdGHBLOgHuWBhhe3tDF9SlNxJk
	jaPdKWLiCKVP54Jimo6NLvEmRY+AIbAOEYuxm9VAE8dTNTAL2Ty0by8otJiG2gSxGjIjbbdKqT0
	uSIi9SKYtrx067fsKCCbUJ4CxPWGbcRFHhGYLhlsUCMQdl9gDyYvB/w==
X-Google-Smtp-Source: AGHT+IG+xsCh2QVwytiFvQzuSZRz6Y4edmgDh+btFCvKCUACSti+UZJeOTU+gkn1fB0y0p92sMOgAg==
X-Received: by 2002:a17:907:3f15:b0:af9:566c:4cd2 with SMTP id a640c23a62f3a-af9dec3c054mr388659266b.10.1754921966654;
        Mon, 11 Aug 2025 07:19:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3e80sm2042966466b.47.2025.08.11.07.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:19:26 -0700 (PDT)
Message-ID: <deb5f02e-e26c-4e33-9e8b-2b3c04ddd4c9@linaro.org>
Date: Mon, 11 Aug 2025 16:19:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
 <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2025 15:54, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166


This note is outdated - you can apply the patch.



Best regards,
Krzysztof

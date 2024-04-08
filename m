Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205AA13F43D
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712588788; cv=none; b=lOXRcHxqsW2wYgKIJelCpC70tYTS91E0ycAuWoBHyqMPcgvA27rAvS04q1DL4/sRZxz38MQv5BN5nKN0HgsXXfFlwGf9pcxaJDbRXWsYztVBPpFlIcgc5dmb5VDLsK7GJ5+1XqU6+amYy2Cyk+Muf2z4Rx7cznXjrFEy/RFTJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712588788; c=relaxed/simple;
	bh=MsNpVO9pB/7MMcibh2I88NHwGOLe1uSWzf4L7HJ0tE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7on60fzrxgTqvC6zTc+u86/9y5M8N1nZh5OsqNJJGoQ5fBSSONrS7z2HJ6pwK/pdA1ST/JKhCdGZOQ4uFPZC1jETevS+BYQ+R82pWF/RCvYb3epQBIkvsMGuS8F1tgW0404qmyukMOYIDUJtb+IsIv7wDtOiaQSwr38dRaG4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBXt7XdX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBXt7XdX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343d2b20c4bso2885809f8f.2
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712588784; x=1713193584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxs6cIQGM15UBhBDso3tA3kUyIdNuLINVbFD4GzTI/Q=;
        b=gBXt7XdXJkAWpmHmZaYr0oTVLpVO/Iv+IpEleqbzNqM/TmO9chZ74xhg+1Rt8lAhjK
         sRCbvdG7yIL8cHG8D8cHs0A+dEvpk9APmr4agn5HcUR1qfP4E0m6zUyuaZycZbEgL16d
         TK9ak4QJXjytgCaCTTQL4ICCLgQMtfKBP/jNOhWx8vkEeKnSze2TYJDrVaWbFu0d65nj
         YgwuXRU3rJWkuVK4UORUbR4RnPya/QH7UkCyMYEjhp8cnWsVTOWbISk+kKea4MY05UwC
         uAKodAi4TZ8ZgBMClxojHSH0c2jl9EtRja4m8ziOAIenW1ABwduXs9EaNJPo0XQiMKI3
         oiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712588784; x=1713193584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxs6cIQGM15UBhBDso3tA3kUyIdNuLINVbFD4GzTI/Q=;
        b=PgQHGMrUgeivW5wgeaH86CyvMu+MNOwk5+VCo5oMKNm59DEfWvuxq5JXY9Jqr7bJfZ
         JwGlKb/6E7GH8yQ35eALnKLnrBzvIuvxdVHvvrxUioHUMdz9yQBHUQBavd3shF0cwIKq
         CU3KlOw4TAIrMzX0oRnCHkrYZpgohk6/Y82VDX9DD77jWcHqDG2yYyDaMMgBl90FKbqC
         tWP5McjowLxxp+DcVoRECdANSmJKLWshurmxvVHLdkl3OiJMSl15qTL9ahT78X8PV8BW
         47ZJCX3ztA4cz/pH6ZnZddomVMwMH8Zfmn9DJwP1nZG7QzcEFzgEZaMzu9WQadJLQNOE
         foIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjP56xCliMDVQTYsw4Tp8G0e4t+2SUgTg+25heIvjK09o/tKDzn+qTA11VKmU6oyhpJNyFIflID/K8OzKvQSkjgymj
X-Gm-Message-State: AOJu0YzWf1LAMBNL2w5DzUlmnYvBcnsOc3Bypc+/c3ZT9qGciqVH225q
	fLrz/f1JKnwtYq7Qbtz7g/uK614GoCCD1RoJWe7BwtqytWr2kJSwy8XPYX2W0c4=
X-Google-Smtp-Source: AGHT+IFnASuk0b7wQuK6k5VWyqkLb542+HkDjKIZIid0oTGMKzSJn6440x/462PKUtK4PX7NzyAtfA==
X-Received: by 2002:a5d:6086:0:b0:343:d06e:51fe with SMTP id w6-20020a5d6086000000b00343d06e51femr6955094wrt.20.1712588784285;
        Mon, 08 Apr 2024 08:06:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d6606000000b0033e745b8bcfsm9165815wru.88.2024.04.08.08.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:06:23 -0700 (PDT)
Message-ID: <69ab2bd9-401a-42ff-90fa-6600dd071722@linaro.org>
Date: Mon, 8 Apr 2024 17:06:21 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audio-spdif: convert to YAML
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
 <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org>
 <CAA+D8ANiKH7Oc+KAjD_BMp9P2EVeM8Q6dLGFCC8a83bJXUpPEA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA+D8ANiKH7Oc+KAjD_BMp9P2EVeM8Q6dLGFCC8a83bJXUpPEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2024 10:01, Shengjiu Wang wrote:
>>> +
>>> +anyOf:
>>> +  - required:
>>> +      - spdif-in
>>> +  - required:
>>> +      - spdif-out
>>> +  - required:
>>> +      - spdif-out
>>> +      - spdif-in
>>
>> Do you need the last required block?
> 
> Yes,  one of them or both are required.

And? It's already there: that's the meaning of any. It is not oneOf...
Before answering please test your changes and ideas. I pointed issue
here and you responded just to close my comment. That does not make me
happy, just wastes my time.

> 
>>
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    sound {
>>
>> That's a random change...
>>
>> Instead of sending two patches per day, please carefully address the
>> feedback.
> 
> In v1 you suggest to change it to spdif?  but spdif may conflict
> with the fsl,spdif.yaml.   so which name I should use?

I don't understand where is the conflict. That's a different binding.

Best regards,
Krzysztof


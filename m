Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E46B660
	for <imx@lists.linux.dev>; Wed, 17 Jan 2024 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705473918; cv=none; b=bQxjD9nhHGAQsWTJE3hcd6ZS1H/gt2PmzqImRKa4uApuQ2SHHvzEw6SmhbdBCTDJVmsjeWppYi+/43wlRCmIoi11vuinWoN24x1gqNFP2T/JfrmZS6zc7LCphykdax/yyU0SnfYW0AqEeDzr4M3VrUDw4jN1XofICtJ8Spkkm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705473918; c=relaxed/simple;
	bh=LEVlpZAehx9AVIY3GQQSCXJVewkDdJ3Sax0skDIPpzc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=QXdqG3Y4Xkn4N/3wgU92ln9+06eLJo7OUMWgkHWsyWBjXWgBpy+PXy9DXjjBw/8/kwr/Eyg2mT8iUYdOtLTcq+TaQmwlKZa8gPZWvPbhw3EietWPZJTrLZLQRgHABADecFgm3lDr90ljZ+EEMG/l0w31UmjM4CQDzRRpRtqreC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6UiL3rO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6UiL3rO"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so8606797a12.2
        for <imx@lists.linux.dev>; Tue, 16 Jan 2024 22:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705473915; x=1706078715; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=flD+HaYgV+WsSknIKs30Mb1xQe5qEH5n3G9pA4l1YAw=;
        b=X6UiL3rObJkMaVnyoMjfVHvmAIZACEWnhltgdJzGS8pLkOeZEHEKA9tq10dMM7Olxs
         g7ivyiZ9BRcbzTmXeKZAeJoFK2nqS0eqEbyf0+lcGTLqmu1Gqcc3I6NPCABIKBGJ40Jg
         esLAQ6swhVDuvgHo3J1UL+T+bladkcXYY/VfQONDzifELg5db1KOCXsFd986fWA/aLE3
         AMcLL7lav8LhpPWc2xZcc58i7ue9gOXYRmVzNKvLx2Z49lwMudounSD3V/5M1nd8SHq0
         COV4lvIT+5SB0WJgN+rxF9HrinznOd4kIBz7jKPcWUSd3ahtkmSe9N8XuOdFIwp6qeek
         FkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705473915; x=1706078715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flD+HaYgV+WsSknIKs30Mb1xQe5qEH5n3G9pA4l1YAw=;
        b=Bxe/uwurqDo/o124/PZYz+E1A+ZRUtEp4aXtSuyS2s862IHDyVHyZVTIZb8p2QdieQ
         7KhP2xq0v0TVigAcWwdW2duVFnwxjbfY0qTft2H2fvs5unS1JGXN6/qMjNliPqxwiJJK
         AfgJi/9CI9QPA+st9Fz6Tsnfd8tXto374xkfcJTJPZGR8fxQD1uuwiRJ+RbO1gNtepAx
         EqIgZuY+dfrDPWZ3i/S278oRkzmCQOov4fAfaFpuYIffHnyeYc7nQSh/7w+HyOY7839b
         pak8zP+hbFewamYuVWlHotiY46xwoA+j8KfGg8IHC76woE0mPyIHXfZ5tYS5ARtR026C
         /UHQ==
X-Gm-Message-State: AOJu0YwkS+7vDxjGleAVvPF5FtcWSD5KPYLSeOlgED7EC36PQVoDehRW
	YRwBS5PSoQX8aO1dHxdKhVYbnknnuaqGoQ==
X-Google-Smtp-Source: AGHT+IH1sciWxmhkEX+vjrpcymhUCva4461MQC+o6KjWOMEZiWCu5+yIYyJyYQ4LaH/0es6jm8KwXA==
X-Received: by 2002:a05:6402:b24:b0:553:f0b2:1110 with SMTP id bo4-20020a0564020b2400b00553f0b21110mr4276401edb.61.1705473915558;
        Tue, 16 Jan 2024 22:45:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id dj17-20020a05640231b100b00559bb146ecbsm1294926edb.6.2024.01.16.22.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 22:45:15 -0800 (PST)
Message-ID: <afc98dd0-b83f-44e4-bcb0-961155c73113@linaro.org>
Date: Wed, 17 Jan 2024 07:45:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, robh@kernel.org,
 alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 gregkh@linuxfoundation.org, imx@lists.linux.dev, jirislaby@kernel.org,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 miquel.raynal@bootlin.com, zbigniew.lukwinski@linux.intel.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <d45e31c4-914e-4cea-a145-9775b6f516ab@linaro.org>
 <20240116-bleach-herbicide-48d636967134@wendy>
 <3199c245-3d2d-49e8-951e-2b059de4d683@linaro.org>
 <20240116-achiness-thievish-10a12b3c08cd@wendy>
 <Zaa+cLGVVDSB5MYr@lizhi-Precision-Tower-5810>
 <20240116-retract-conclude-c47a7fc8cb21@spud>
 <ZabVSYgq1Mz3LPpC@lizhi-Precision-Tower-5810>
 <4a9ed1ca-cd13-4b61-af06-a3d7935aeeee@linaro.org>
 <ZabqxHD4wtiPn6ep@lizhi-Precision-Tower-5810>
 <c760b89c-efec-489e-8333-c60b38fb5a47@linaro.org>
 <Zab1qj3+6daX8QH0@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zab1qj3+6daX8QH0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2024 22:31, Frank Li wrote:

>>>>>>>
>>>>>>> Is it okay for 'silvaco,i3c-target-imx93'?
>>>>
>>>> No, because imx93 is product of NXP, not Silvaco.
>>>>
>>>> You need regular SoC-block compatibles, just like we have for all other
>>>> snps, dwc and cdns.
>>>
>>> "nxp,imx93-svc-i3c-target" ? 
>>
>> Could be, now please point me to patch adding such code to DTS. I would
>> like to see the real use case for it.
> 
> This part have not sent to review yet. basically in imx93evk.dts add
> 
> &i3c1 { 
> 	compatible = "silvaco,i3c-target-v1";
>         pinctrl-names = "default", "sleep";                                
>         pinctrl-0 = <&pinctrl_i3c1>;                                       
>         pinctrl-1 = <&pinctrl_i3c1>;                                       
>         status = "okay"
> }

Overriding compatible is not desired. It also supports here the
statement that this is the same hardware.

Best regards,
Krzysztof


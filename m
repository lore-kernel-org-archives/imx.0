Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C2E201113
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226275; cv=none; b=im+uZiZfwTHTu39+75Up/oAcwN0OUL2PI2MVDylMZYcxBSvJ8N9QMTx9WA8flHjUa82/w0ACTFc3AtdKVe5jWl0//UWYcYA06UqpT+CyR73JVYzUWdmkDTgIQ/3bJr2VgZkJrTxBjPgZ6QjciIqG/pQ7yufUe0XOZYZzM9uOXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226275; c=relaxed/simple;
	bh=uie/hR/yYmCGm6Hbyfa9bpHA0MgFnZGcXXjE8+OvhUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlTuzutgn5I1KFcGm5Tt8CZt+k+Ssgk6iVHwHRrXjVqtkOStZdWT4eKeKMVMEWfWQOk5tJnfooG5Kbapza7bVXBhPZz8J7TgKh/T0lkkvp/wC6kmE3NHV0QHknzroFY6rcVmrN4MtG7XrztzSCmImtEkEY57UrStmbsdPUuSB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSOypBeF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSOypBeF"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59578e38613so592005e87.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 22:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764226271; x=1764831071; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=;
        b=dSOypBeF96T2wV4/ZacrZUBXW63Vz/6K2lBwNiGvMdzI4FaWHgZEHhQs0FLSHfUQWR
         9TS1Qv3KGOpfAZFzlg5dAG7uCsh67lxhh+6kZf2UI80B3znoCVfKDogj5lKPnsCWtlZi
         tbjGZ3+UIgaWKsyoLaGumtTOTLWU5PZtCohEmm6AlNou2+iX6hAT/b5S4CQ4TUf8Sj/h
         fn1laJ2CmJLmjDeLdsWS+iPM3zybfo8RVQQWlKJmbW5A5wh+XWj4FpgkU+CwdGAuwqI/
         EUitdQyggyaIEsqUGMFhsQKjW4qZeF/lELXT+RtBevZuOuWWhJlk396upGf+ZYPzYukT
         32Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226271; x=1764831071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=;
        b=ST15ayShPofIn3MiN3A8Z7lFzMtr6y2hR4AXcjPsajNo/caYd5R4zvKBV4AJikx+Cr
         8cXOEftg/HgYOY/Ra4P8rS5UIhL+XDmL55eCWhdmx04cxhJgM0fYEYyK9GGpIweH+JcH
         pOl5HV84WJHsHe4I613x/D+aO7E12NynUNuspaYKtYE57vyGpqxSYEk2+9d8wQj+/Bxg
         tbCzGHt7MlWLrvSyTEf4eiitW9vyzYWquk/phYr1WJewD3XlAf+XwQd+ANVSAbRbAA0D
         d/7dlzYX3sN0pargvbQkH3PCOV7tNcnHTMykm9IQtlOm4Ln6n20L0nezAWwdv/Emi2YO
         94Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXYxL/0u2xIGriFSWy7zaFasjkNr4kwa+XWqIUz4mIG1fGU3XKJn21bV63v8t1xWJJ6FAU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+2Uam/q6t9usCAlWoN6RaBnQp5FMYylYFyW8dHo5fvqkGxxm1
	YKTHohYTV2entUVF84/b2vIF98Vh2+bF0sie5RFbYukxv4JPEZdhRC4H
X-Gm-Gg: ASbGncvOIxJa6iOpsXe3jEDMZPfbvoCHvz8KI5/dxvA128THtEmRKe4SyEhw/BubbXk
	NAylbfSaDF51O5Pk1dHwptst+lgonRee1rYOQXa2UdlWIpW0nFC0hK2L78D1pjywxdwH5hnPiSC
	WInD7Dq+Y39CWUbAoy/MV+WhJPNq3dbik7/nvC2xRCaGvgTkI+WL8yQSta/JUluP48/Ou37OKnG
	sFwBfgEySBaWJtqDQDNo+czZKq3K+s9JAu2123LX01qNX31+MJcQxFllnuMC5pdIawDB9sKQiOu
	w8q7iH96V6SGA3xyK+dPvHPdIRC5aPIFcWYM1v9UCe9o06A7whtj+N80uA0mZHomYWttwB8Nnel
	sw2hLqDo3TSXOoPY5ZuC8QbhggFgq5YyJFTwpP+oBq5YkAzyvtClMV/snEQyR1cH8DTrDxk+tRp
	2LULZrdv/dRstQ3TtOteJ+zp+DY5BxUqVnwKenIbajArxn8dlTItOfW7NF/1hiIc7w1kAa
X-Google-Smtp-Source: AGHT+IFTmDfrXh0KvI1Xxo4ZUUZvVPNdz6X1okMoprwygPwEBEGqBxEtkR2sAlEnAGDtHntZer72Qw==
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id 2adb3069b0e04-596b526c87bmr3380986e87.47.1764226271085;
        Wed, 26 Nov 2025 22:51:11 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa440d8sm152329e87.46.2025.11.26.22.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:51:09 -0800 (PST)
Message-ID: <f4d4169d-796b-49fd-b4d3-b74186e59b82@gmail.com>
Date: Thu, 27 Nov 2025 08:51:08 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] regulator: Use container_of_const() when all types
 are const
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Samuel Kayode <samkay014@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks again Krzysztof! :)

On 26/11/2025 19:40, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Rebase on regulator/for-next, which does not have pf1550-regulator.c
>    so drop this part.
> - Link to v1: https://patch.msgid.link/20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com
> 
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.
> 
> Some drivers already have const everywhere, so container_of_const can be
> directly used. In few other drivers, the final pointer can be constified
> that way.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):

>        regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct

For the above:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

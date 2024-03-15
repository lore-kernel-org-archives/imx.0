Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D5763DF
	for <imx@lists.linux.dev>; Fri, 15 Mar 2024 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710491675; cv=none; b=AYrlUOv9t0hCDr1J+DiUAA0yQzNH/o9MLdpXg9GgcDINraZENagmqtQPLykMwr7qAkaXj7O7eZqHgULpEGC5RvEpBUnAFIgxCiXCzkkrpBNQveGxF+409rEqwRVZ6jrxKdcxJTsxXUt8mjiPaMAJwVI5XHzBnnnm33y9fxLRSN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710491675; c=relaxed/simple;
	bh=5Odt0KiT3FUlNCPp892I2IO650niK3J6glRlrhVH+nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFyjA4Ok7yMBco7zfweKnu5kUQ4dVqWZI70q8Qfrk5EVyKUmuaR2vOmHt80S9vgpKdzNY1z7nXG2/laaMpKxP6Z7AYMTknEok5+wbeG2E4xJqwDiMNK5SqDcyPH4nm+yTjbkSfRHJE1DZ18DcMlxZAftv7JLpjGuUdTUi2L1LTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gE37DmwL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gE37DmwL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-413feaf0625so4635235e9.0
        for <imx@lists.linux.dev>; Fri, 15 Mar 2024 01:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710491672; x=1711096472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQAozk6yadiwaHTVlNcv003Bj3NBs5rtSLexr24gXOg=;
        b=gE37DmwLzPM7KpWtq9Ue0f4EWy7M/t+Cl/w8TXlsJM9g8GRDoeNqaztYN5+g0wui71
         2jntizlpyXBROw74UArZcBVnxNHXo734LR2IZj78py1qjpJYiWecWYDhBJn7I0KCGBwY
         k3ekTRHffNPYT+Bxi7wnx7KNuLwLt5Ng+e9dLNprBZ+ay8988zwZomqY0NKhtVSECSJ/
         Ol5iX4m8762Cxpru9reW/aS11dOqWjSmTJtnUqoHRAJsn1tIUQUm4eR7pVD+cCMbrBor
         zWFnyre2s9Td0zyZ9KQ0Curu3Tt+BcB8U9YhLu8u8ckFYttfPCT4C2mqNkxeuRwGR5RZ
         abgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710491672; x=1711096472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQAozk6yadiwaHTVlNcv003Bj3NBs5rtSLexr24gXOg=;
        b=Zt3SgQUIVs4k2sXUzBT9Oj0pQwbQcke/qTufJ8Kd/AceWtT+iofJYFi2IIgKCNzZpe
         +94U4UTuCba5soK1I7nQRC5Zg7iCfLtPvBrOfwiRJLbsnkDAlW3hfg/nMVwBPNiYaMhb
         r8PhWIrWFBZsfamKkbdht09Xwh6FRweESWsCz333aJJNQFwWhszDjB/+ceIWpa+mxisk
         ts+eJQRp1AunF4fbAL68QQ41/GMYAeidE2zXGxRcYjOlbdDUimtSXdcazyilghzqgHP2
         jF4l0mIJqrh8N7ZdJa1gVMrPrvJ9JBoicgYR6PCk9kpiQzAv6OSurQQagsUM4xXgvH8n
         2o/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2MRGHW2XSahaBliYzmu5okmvRZgCwcOYvYvjzd2yNJ+kqMTFyn8poYtA8hOZjaIbXBnoLh7e2CtM4wxjDZH59p7Zd
X-Gm-Message-State: AOJu0YzvGu9sg29m0/uaK+3kVaMsPJAZ33JzU3aUpPX/pJbF3xvCe8A1
	i0XkW8ZphkBr1npBfSuWE4GUi9529/ANkBEBah9TyjQlJG1dIaLCNi3WIpQrLes=
X-Google-Smtp-Source: AGHT+IE42kFVdQn3+v7cQu6wfUu+DHE8nTxMjghzMBSYh523XPO/zBm6M1OAaNDykWJRYYEDickcNg==
X-Received: by 2002:a05:600c:3b14:b0:413:f80f:9f9 with SMTP id m20-20020a05600c3b1400b00413f80f09f9mr1817396wms.25.1710491671787;
        Fri, 15 Mar 2024 01:34:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b00413ea26f942sm7699529wmq.14.2024.03.15.01.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 01:34:31 -0700 (PDT)
Message-ID: <7caabc0a-c240-4464-8a76-70c16baef7e2@linaro.org>
Date: Fri, 15 Mar 2024 09:34:29 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: soc: imx: fsl,imx-anatop: add imx6q
 regulators
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240314145953.2957313-1-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240314145953.2957313-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2024 15:59, Alexander Stein wrote:
> imx6q has additional regulators compared to imx6ul. Add them to the list
> of allowed patterns.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Commit 465c7756d1ff ("dt-bindings: soc: imx: fsl,imx-anatop: add binding")
> only added regulators for imx6ul. I'm not sure if this warrants a Fixes
> tag.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


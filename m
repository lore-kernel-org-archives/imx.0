Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC821519B
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 17:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567689; cv=none; b=S6lgYSOGt6PrMd2aHp60yezW7y7d/3tx6FYJhI+WnHI4tjflzm7LwKLUxBetEm5NZ9GysJ/lD2SaEfXCspafF8N0TRsfe/jCvZVVNfNAAWGOIOWByVyQgKCXgETPWIZHLrVFLcdUyvjNWf9u7375FuVPs4iBX1fEDK/IiBUK+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567689; c=relaxed/simple;
	bh=N2CZWraLu3rKKT314RvxJgkSvmsJbpLZz+Zmygz4zkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLbxOlEBITRhS/5Se4/M0nYTS6Pd9gIbJ96XXqeoREgjlzEuQrFz8XFk2aDqATZnvvuGPRGLRGy7DkS30cscDtdfRH74/Qc4iQrns/ZNWIo7tLbyqvNufwP3qF1sU7l3Fr4sNZbJA/krhyNVYmr6jzylRmRCX1+Sxqv7GK4SYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JN2fYJ6q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JN2fYJ6q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283d48so19815e9.1
        for <imx@lists.linux.dev>; Wed, 22 Jan 2025 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737567685; x=1738172485; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3xfQ6HsRwZfSocl+h/g5AkAwP96buHXsNBwC1dywZs=;
        b=JN2fYJ6q7xynXJ8wdopPnYtU+9TFbEYrJYSo9Bfy5JZu2UZltUFxW2fGqzlpAaHlGq
         Ue8NU9AOdEuigO2cxMcVB+s4QQbAf71x/mbOdu3lJz6JrkYcif4x+gZbYuapB37PWCHx
         Nhq6LHepFTakxlWFS5SY2yvhMES+HQAHMvCupv7v16Z68pwYCgJWBA5awOhTMtzgy94i
         T1HEUQBSm6twKyG+5navJukFA7iNC8kAnClEd+PlMhcqYa2PLvV1guGVtC9nlksyW8JC
         LWd04JksK2csWjIjYL44yjRg6esXEmFVpcL/+ajZ5+wqA0rb7tJS0kTe+NdK3QfDuWOf
         R8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567685; x=1738172485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3xfQ6HsRwZfSocl+h/g5AkAwP96buHXsNBwC1dywZs=;
        b=XPPurOXa9r7Exu9v69EkRfYxq7anYY+7lxgn7G2TH04ilyNso/JoaEkGCNeQqje2wf
         a6e7RLbWMddC0V4x8f8IMCFcnHB+1h4jFiR472E/CNqBRNm5BN2BOtX+mXm5zc4TEAQj
         1Pt59YnAa4T31RJJOaU6MQmi7cEQ2IJJpbau7n97TzcKvaQG29Ea9x/vahCnYxpDhNk+
         sOJ2+5zNo3O88ylnZB0xqVxQyAhVKnRnrebqCKw3s1qjxbzD9n30U/nsm4TLbS0E2wfB
         Y1TPMFOaC7YBrzwb4mAkT8+QBlf9vi1l8tiR9YmJKlPdSqA4Gl55mIEe6UhdroL7OgLa
         ZVqA==
X-Gm-Message-State: AOJu0YyGBwUVtwZ91ewgHbzHf4w2iCiJ1wP31YEbHJsZ5aPpREp5z1OU
	HSxD6NNUWlHAldcGB2a6GWUNbFxHgU7rIcYjVSuAdyQw4S9bA/MYg9fLSD9cp5E=
X-Gm-Gg: ASbGncuqSnSrSK82Mw4yBp2mSLFd7vfFbtKVQl9MqC3mzwpLXTTyIyf8aRNtTWRmW74
	v6j4tY8CvZD/lUrXJlaC1kEMYIIDetVWB3bh240ZVULngFKGDTiYrkEeyM4QZvrxN+3Ys5UKcxn
	SVpIkaEWgEdWT/tTPeS182YM2M1euQaUo3PrAVopddTUWRhUQOM4HagyH7VVqAZAVICMxrLITSC
	C0iymDCI3gxk0DIYCPivTfN2BAzzafdFgMEMx8wjdcp7coqRzQ0sQFzXGnbFz+Oc2J+3Mv4gO+L
	tTl2DSaiiBqVMI8oN5wLqk6fvhSgdgZndg==
X-Google-Smtp-Source: AGHT+IESAU8rkg/qlaPKVu84CybcOG1aDw4TcSQv1t/w3ZJI/axU8cqUp0BHHY9Y43ilPZTapRvMJw==
X-Received: by 2002:a05:600c:4c24:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-4389da1e6c7mr189187235e9.28.1737567683952;
        Wed, 22 Jan 2025 09:41:23 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438b31aefcbsm32095365e9.17.2025.01.22.09.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 09:41:23 -0800 (PST)
Message-ID: <8693bf83-9878-404e-b609-dcaf758d485c@linaro.org>
Date: Wed, 22 Jan 2025 18:41:22 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] thermal/drivers/qoriq: Use dev_err_probe()
 simplify the code
To: Frank Li <Frank.li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20241209164859.3758906-1-Frank.Li@nxp.com>
 <Z5EULLr7hsk1RIZy@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Z5EULLr7hsk1RIZy@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Frank,

On 22/01/2025 16:52, Frank Li wrote:
> On Mon, Dec 09, 2024 at 11:48:58AM -0500, Frank Li wrote:
>> Use dev_err_probe() and devm_clk_get_optional_enabled() to simplify the
>> code.
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I applied the patches, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

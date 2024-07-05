Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A3C16C840
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720194013; cv=none; b=i7xck1jhWlI0gaVcJLGvPENS1Yok8vso7OyU/FM50x2VtLVHAU93BNCcp1w8BQUZiIQG59EXdty/8b+rFVQK9DzHt4vkE+B025DX1UaJRIQINJvYwjm5H6gkIxU1HuwLL0HOAz4Hf97cAYpgriRudTyWM0uyWzPIRkqZdr7+IcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720194013; c=relaxed/simple;
	bh=lvk3fb6EH5rw6dp1DOnJCL3dq9tQI3MOZD7gcFF+qDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGq2HMzud9SU7/Gk5BWJVXt8GhO6KxGgpgODsPw9Ua8qdBiR4wfW/z5rk1TT7hplgaPPsXlUL2r+jUDrzB6gAzyuEV8+B6N2xjitEmGyx3PE3aZF7Q8Ydp/y5DodmqDb2lSntxFpGw6/aAMQeU4p1JhrQ5VjUJ3/4Jy8I44gUTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idXbd8dN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idXbd8dN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367ac08f80fso389307f8f.1
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720194010; x=1720798810; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=idXbd8dNaCzozZ2/CktK5qM87NIRIcYuvLeUU9jB6+lF8Cu/iOdEJ1JEHOlVQG/i/F
         2v98jNyWn/yFdNxTKZlOai8yQNNaemfuMV+gV2bKjJ9EMEAt62CIeRWGD4IpGdlbK4xy
         cwNY7vdULzsCNtulxWklxPWtudgGZ8UfXvbmr6kGS7IGiO12afzEJ5lC/FxapywX9m69
         L7YwCUdBplxf9AG0QLSkhp5eI0Imm7a+dfPzHb1ngVIGigtJuJ1ZdNiaGq1FIMqNDCja
         RmTaS+7Jf10eov9zZfG/Tcn2eDkIuZkaCMfCKc8vXm8XK2plKmfS+PKaiSq81Q7eneg/
         B4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720194010; x=1720798810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=X00aT553QKmr8XTY9a6mjfYcvEt9vY+Fx9hDxtL0G2PsW9QaQPhaFRJ/fshXPZzp+U
         cF/46B0W8/njTK0VrRo0Kmv/NtO9HewzQebBar9Lwzabs9AEwl1B9qCjg/4EnLsZg/rw
         IqEj+zn1hON+XTJ5AEaWjK8DeUIRpMlw/Fy5JrUYRHsTtzwEWytGkVhVji0IzLXkps2h
         uccSPyTkD9tXc/p0YlSZ3UQhSG3be8YnkYLEvXogZAb0XsVDs0b/O3nXWuVk1nVQ6lYz
         hlJYYBC2l+YNgyGs+IUIO1T3BAzqzidAtkcepLZqNTtn29LnFpWXd7rrXyTilXvfrt/8
         82nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6kqx0sKPdkXQdoruvqYCxjzWpf7oViKB84PHQl4RbCM7OuK+Srj0oeMKsTd8q/+iFEvn0XzzChMwjAcsA4aSqnqGI
X-Gm-Message-State: AOJu0YzzvPHdBBtZak/pkdki4l81fiZyzAm3givGDtZZpF3FMjp+PX3h
	l+y9ROTMDI/Zh2+Fds0YuR1xDVhe6Ai9dMJSXZ98Wodg0PiSJLuN6KpuPqEsUuE=
X-Google-Smtp-Source: AGHT+IFZ5tZcHjh9afQQV6N+UDpsdiCgwUbQuOPcHUbDQTq2FuqnU3hsZXAXDh/UpS3fDJuMgQV8qw==
X-Received: by 2002:adf:a18f:0:b0:366:f469:a8d with SMTP id ffacd0b85a97d-3679dd35e71mr3543623f8f.35.1720194009828;
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36795d1fc9csm6559538f8f.83.2024.07.05.08.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Message-ID: <c7c78d7d-c920-415f-b97b-c3b7c61eb9fe@linaro.org>
Date: Fri, 5 Jul 2024 17:40:08 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 11:51, Krzysztof Kozlowski wrote:
> Hi,
> 
> Resending (with added tags) because patchset was still not applied.
> Daniel, can you pick it up?

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


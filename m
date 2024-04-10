Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08C17F378
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771516; cv=none; b=fQUECXg0QVMNYstcTEAxG37nTRxfJ+0qfbccxNkwtgVK+kwQeaNrbVLQU4Pb3+wYhfEiuP65j0KN7Ti1kLZaOBcmUMTwEDsPVlk3ZHXvI5Boj9QMekrC7fomRMQn5Y2oEd8+yB7jjSgIKtThmBBkliNGVScdaX85u0+LGyL7zKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771516; c=relaxed/simple;
	bh=GNGxTomVe9SYi6ouodd8VfUTWpqqNdcbzrmwqYTTm0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c+qGJEfnOBIARVsAoG3ICpe+vmFVyrYXoSBOw+aHw9gkWjUlPu6WhCssHfIc4syAOviE4WlB7G+vvPLj1dj9Pegd4uzSCLJFPGZFy5Y7FD9Fx4Qme4bpbQTMIC3bW/e5YbsJ+XkDOcik1d8y712+LlN5e3kuFW9GNblstdSi9lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIOQi4a+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIOQi4a+"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d3a470d5so6838274e87.3
        for <imx@lists.linux.dev>; Wed, 10 Apr 2024 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771512; x=1713376312; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=;
        b=OIOQi4a+tvUuEpoxk4n+GafrDBvpYK4mhWn+1I229pKhusKbjLmncE5h86nGvnKQPA
         PJr/MvPPzJvvPQRcMvIiKfxbHCwUAVWNGq0RlW42NmsMBXwu8wGeDOowGB4qfgvDP27o
         s1MfpWCa2PAAA0vT8Z9FycweDYaiOZTJ8UtJB9pC56IG0ZwXxO/JT9lRH/Q2cDRjSgaU
         IE2zoSCtEQgGz3BQI+MgfCsQa4Vq1R+FnPZY63OfGNXpTY1//d3tOj7KQsGngSSz71Gb
         15shbdRWzIqrIAOC8mNoMB9hRyz3aEAKF9W4b5xcdbBTwexYfIr9DK6ypkKcfkMWK/KL
         zcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771512; x=1713376312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=;
        b=Dg0vXRL/QafnexJzUGKe7W3R1frdDtqWsO4a1Q2jl7zdqMNISvxk6yKhiId+viOomH
         d7wuMVsY0DMziA9LkwGdCWv9GPlum08pclBEpk6IPCaZAYviCxcqY+PIrqQwZmnX45QD
         yyyHYOmKeSONNzCV3DDy0DSuqJZiRnqVMbr0B1ickCbnI59HO25WaZacSV+Fkpa+/DFO
         94xef3WueiTB6atkhoVsR1SzcdnbLC2unf08jILZ3c8VShId4QK6mTKln2JgUY9HbsnQ
         pDpLgS3PZBHgEn+zKe3P/qmVRnOSLdN7wDmv8dtusyJvsOfL9a6Dv52q/sUThW26cbCw
         o7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKAXBMzdD4zUdtilWXFKAZ+Xc1hYPrjl0HPm7l/rZBgi+rsx0G6K8HGBsqIMQZovnQn9LnojZuFe17sXMS9BlxetCq
X-Gm-Message-State: AOJu0YwTOhbrszZ70ugxx/SbfDuq4YY5AZiGDaHIRK0PnE1x39ZMy5R4
	JgOBEged3584OKnY8vNzCjEqMTzqOxpfa/Aexx8+7JAl8UbB0zIGuv5IuGQraPs=
X-Google-Smtp-Source: AGHT+IFEmuU/yIHrAY8NuucyCaQFKu+VnZxGulNdN7KpD4j1m+7zPUv7hS0ZitZBToM3exxMIntetw==
X-Received: by 2002:a05:6512:2c95:b0:516:c600:64e8 with SMTP id dw21-20020a0565122c9500b00516c60064e8mr2674529lfb.1.1712771512162;
        Wed, 10 Apr 2024 10:51:52 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x26-20020a19e01a000000b00515a87668a1sm1905343lfg.77.2024.04.10.10.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:51:51 -0700 (PDT)
Message-ID: <3ae3891c-32cf-450c-a68d-0f80f9192bea@linaro.org>
Date: Wed, 10 Apr 2024 19:51:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: qcom: sm7150: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240410170150.248428-1-krzk@kernel.org>
 <20240410170150.248428-4-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410170150.248428-4-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 19:01, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7DB352C4F
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037169; cv=none; b=U/OVkphaPDAh9d6GeaVxBAvc+pgt/sHFVPxMknqd33IV7WwmZoK/OccqS8Swo34iqwzUMqGG2KnZCykV9n1qpUbBb45oSEGeAe6HfR7ZjyoMChwoUWnNJQtbkFk9MV2iL1SrfqrL+V93yqf0WwayyC/E0ConsKcM6fcZCEVjglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037169; c=relaxed/simple;
	bh=1qmaFxDccZRzs0QTOM1bUCGgFCittjZZSZ136PK2yWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EthSllT1Gdl8hRB+o5Maol/Uq+tqaj9s30qMsuMzVMaJZs8Ai0ko430YM42Z5xaCqH6IGuAMxdEepqPeZ+SIQyuJF4RQQJu7V/W85j8x5VRMBs9ccj8CGnAuzvT8leZidhzNwCFP59lgdm9Y2GJlKOmt6pUHGERqzmRfwiM4KuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6tZq2fR; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6tZq2fR"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c107ef474fso823715eec.0
        for <imx@lists.linux.dev>; Fri, 20 Mar 2026 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774037168; x=1774641968; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=;
        b=T6tZq2fRqQ1cnCAOVK/y1UESGVam7FHO9+w46iYHFt5/FJVwKsazRk1EIhT6ChfxSa
         dtaDuyIXhv+KGKjdjRFFDYzKWXKK1+nPKRnmwxtfcg8f9unUpZoyiOA4tWMMbzwYKIl5
         iOCI7q+P7UpOHfdnwe0o2oRExXMtuO+MOtCIfUWYwdRHMHV+5eJ2W78+Ux6f6b7FNKWD
         45eglg02Y5hwr0vN+srfgnpbfC1YDy9QZG4Xg5K5NLcVoepVAW5JDIMKhb1es2tPGbLW
         zHgTGzxfyxNhcCavYiEbGwvg36KhN9ANS8VXunD/HqDojSjld40pBJpGdAsn4fYyGdEG
         yD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774037168; x=1774641968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=;
        b=bBA1OBrpkBqb/w7+yHgVVkAcxpmehMeVrU/MkIhfPiEz+KjWUn52qC1ycBgCkvhSyi
         J7DAtxREyWZBxfuDgWwdczCZMDKDUgM5LabhyyUIuujHW+/wJfS1ehq1dLJTBeU8ZKLs
         h5TR3iqCEBE5+o82D8Ue2WeXNyYUA2WBgo93kkj4WbfS6VpMwDMe+5jlkRQXJIgLrpje
         dgLIEhAFW0WlKxmP3zdw4DIh9e/o5IUX/YdLjfpN7xaFjP0+qSvL/z5M/JEi2lzwRm7k
         xEE4eUhEC25iHH1rmTzxCvdRkpyvaIsZH5mjtZASc0JuXCkdbKxrZJQJ5bGvfpaBvrd2
         +oNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU2MsDC/OCUKskhv3mA0Fu8MvmSH5SL/+mxXaDCeaTxIjHqKMTQwZ+QTwGGVnXvUHbDEs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/SUHMafKHCE6zBLOaTfXbJRL1vNTWA7rvxD04+IKFtP0Hg0Op
	EDNSWQ+DziaZ+7QRXoFUDL/lNHSk4q6AGjMLvQ/N6xWHc+PPwiuo9Pmu
X-Gm-Gg: ATEYQzxit7Lrbdujrcd8du/lZZfCXYM2pQz1mIq9yjc3Qfuq61zI+eqlgq8VnIsVTBZ
	4k6QlowIV2nPxsMyNBBcn3njfExG6Yje+vMaZ1KPHSoOY13D9YBbv/6ZiTRx4tVB+0FHWhI3WLd
	hITfVzdjmlL9urFoGkVlk5mgYWN9cODYgrDocXb1zBmnA84rwSW50YDG+jA0ngjEm+wqcwaGjFJ
	T4PLUqE6jf/wu+cs2K3o8U0yslUOkr58GEMuiMV4E2D8jCO53lEhFcwU84ZkMCCOBlTuCNxpjux
	VH1e9nhaOuwjuYKakMJKiRu+tTwuhAdROZHzt6QCYVYRcm3953UTTufYXs2dtpWSpDN82m88dkw
	0FvWCWp0++dw3mZi3697Ng4MskgER70Bwfz/G5CtWAkFtoebx7BAwTRi56QeiCYoruWmYaWXAS3
	RSEyxsndbcUwFhPIk5v7ssE50/S76rp3xki44si8+J2gQv0CgGL26lFm6qptuiP8pu+B0wESaB/
	5CKUNtC1xs=
X-Received: by 2002:a05:693c:300b:b0:2c0:d92c:2c68 with SMTP id 5a478bee46e88-2c1098092b8mr2171432eec.31.1774037167545;
        Fri, 20 Mar 2026 13:06:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm5869488eec.4.2026.03.20.13.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 13:06:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52642e6e-cd86-46e2-ad73-3775ff9531b0@roeck-us.net>
Date: Fri, 20 Mar 2026 13:06:04 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] hwmon: emc2305: Support configurable fan PWM at
 shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/26 08:29, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This series adds support for configuring the fan PWM duty cycle applied
> during system shutdown for the EMC2305 fan controller.
> 
> Some platforms require fans to transition to a predefined safe state
> during shutdown or reboot handoff until firmware or the next boot stage
> reconfigures the controller.
> 
> The new optional Device Tree property "fan-shutdown-percent" allows the
> shutdown PWM duty cycle to be configured per fan output.
> 

Sashiko stil finds some problems. Please check.

https://sashiko.dev/#/patchset/20260320152959.1575978-1-florin.leotescu%40oss.nxp.com

Thanks,
Guenter

> Changes in v4:
> - Initialize pwm_shudown array to EMC2305_PWM_SHUTDOWN_UNSET in probe,
>    to avoid treating unconfigured channels as valid and written 0
>    during shutdown
> Changes in v3:
> - Rebased on current upstream
> - Dropped already upstreamed of_node_put(child) fix
> Changes in v2:
> - Address feedback from Guenter Roeck
> - Make shutdown behavior configurable via Device Tree
> - Add optional fan-shutdown-percent property
> - Apply shutdown PWM only for channels defining the property
> 
> Florin Leotescu (2):
>    dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
>    hwmon: emc2305: Support configurable fan PWM at shutdown
> 
>   .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
>   drivers/hwmon/emc2305.c                       | 35 +++++++++++++++++++
>   2 files changed, 43 insertions(+)
> 


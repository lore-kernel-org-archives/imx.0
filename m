Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19731A08A8
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720101748; cv=none; b=a9hRXz2AeCRAV9ZE/1csJBdPHeG7da420XqbZ3xs9GNgmJnv1R0ZwMCaW5hFxIGWqhVlBNjkHHMIkRvbh71noo4My8I9KLlYI9n6NrtH8keNtEAJVvtQop9paozRpZ0onjRDRlcE0IxJe3lf8MkPtjlwptZobfFYF0kUAs8Tu0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720101748; c=relaxed/simple;
	bh=misJld9OXt2HQGXdcMz5/jySo9Fl3DNg/LRqr42yRAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V05xlvPdZIiSn1yM3QIYLv8x39okTicOWIdEbon/wgI3vUcdXa4rzyZwgABbEElHt//dP0Lx61fiLCnd/HMTzgLx8QLq91ayqrXt1AfdWTGrV0OCC4iKiqCaMjkznTxQadicgL/TgfhKujZA4iD+xTAoYwLVu3Mn4+ICDoM5Qwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gc9esNfd; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gc9esNfd"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso7815561fa.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720101744; x=1720706544; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wqbXAqL9wlAuHc0SJ4u0nAeJp5BlfcD9g+Q8MysRj3Q=;
        b=Gc9esNfdcYzKzcu2DSITVHqHf4WZCZjY7DNVIuga9VlWoExKDtBGVr8CXvGz2AH+2u
         xKQbH52GkIhzOvOuo3FU61KzpAHLFvJ1vEhOFhphuPY4JE08j+9MysO0nJ+L/np63ERW
         Qg38reaoStvpubJBJtkarjrSHVtHKWMr923Qagy5TvhV5FqMkHzajUpvDIlqlH9VnO0M
         2e4cZohrO8CJuKWgTcesZmA6RsMrC+G0KCMxXc04nRqVijsDLk1UcIe2X9ZwwS+/FiIV
         CX4xxIaw3Gw9TSOXqYGc2fYRlFXl+qAB1zCDAGmpcAdOg73k1GmP0scCFmX2uVX7WgAk
         XmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720101744; x=1720706544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqbXAqL9wlAuHc0SJ4u0nAeJp5BlfcD9g+Q8MysRj3Q=;
        b=wnbptQ8xIBBOvWnCo/v5zXAmoKZpjgSEhTe+Sq+p2UMcort4PDswRAmcO3hx4HtvHR
         XOScsM6CfBHTLDIPMa8N4qc8lxIw1D/rLPth5bzT9qH8Hk8bDxS1FNmccG3CJM4XDqec
         36AjViPnRBnkS3BsycDyaKDgeSLh9QA6CzH9YPryaPIdOPe8Xu4utawbreMTXOtVRKSF
         Yl85Gq+DVuBURQTtylB2yBE/PPugpKy5FGJ+6PHPZ/8Er/QvEGQPzExrsBVH6nrt5YWa
         wgn9GzUmKbyhjbSmUXYxEU9SM7Q0It8dcQsKTPFl6uXZDJQrS4ifSh1JTYfPuT6V3gyY
         05Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWeLPakSR81NLgT7K/i+QufC/wVFBslFgeiIm5Cm0CX8AOUOhTq045MOeFb3+Pabzoec+94egJzxxWjk+NGv4iSqwIQ
X-Gm-Message-State: AOJu0YzMiKlUylVDSnzEf6s7Gwtl3gMjGRbA2pgjY/qizgKvzOGVe3o2
	TWHrmz8uL0/OwEr/ApvDWTAczErbvU3OPB01V3WkfMClpae1impRC0HiABafpws=
X-Google-Smtp-Source: AGHT+IEH0ii/5bDGf3/oJxkx+BSCOwuT1536wkXWHPyM0FRssA3mk6XZ1GyCc9wc5qhQdqz90Kl+Xw==
X-Received: by 2002:a2e:b043:0:b0:2ec:5685:f06b with SMTP id 38308e7fff4ca-2ee8eda389amr11224661fa.27.1720101744044;
        Thu, 04 Jul 2024 07:02:24 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.161.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e3311sm122464035ad.79.2024.07.04.07.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 07:02:23 -0700 (PDT)
Message-ID: <c1c387ad-6586-4108-88c8-1d04a65fdc49@suse.com>
Date: Thu, 4 Jul 2024 16:02:14 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: s32g: Disable usdhc write-protect
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, s32@nxp.com
References: <20240704135653.2969532-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240704135653.2969532-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2024 15:56, Ciprian Costea wrote:
> NXP S32G2/S32G3 SoC based platforms do not
> use a pin for SD-Card write protection used by
> the uSDHC controller.
> 
> Hence, adding 'disable-wp' usdhc device-tree property in order to fix
> observed warnings on SD boot as the following:
> "host does not support reading read-only switch, assuming write-enable"
> 
> Signed-off-by: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 1 +
>   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 1 +
>   arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 3 ++-
>   3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> index 00070c949e2a..dbe498798bd9 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> @@ -34,5 +34,6 @@ &uart0 {
>   };
>   
>   &usdhc0 {
> +	disable-wp;
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> index b3fc12899cae..ab1e5caaeae7 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> @@ -40,5 +40,6 @@ &uart1 {
>   };
>   
>   &usdhc0 {
> +	disable-wp;
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 9d674819876e..176e5af191c8 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>   /*
> - * Copyright 2021-2023 NXP
> + * Copyright 2021-2024 NXP
>    *
>    * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
>    */
> @@ -41,5 +41,6 @@ &uart1 {
>   
>   &usdhc0 {
>   	bus-width = <8>;
> +	disable-wp;
>   	status = "okay";
>   };

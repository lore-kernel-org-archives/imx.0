Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2031E3F6C4F
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480076; cv=none; b=cwNAzJacwuDQwuSU2Aeb9sMKbMAHNEBwL0FvyiArKTzyxPuHe8/SEFL+yWMfkU76s8AYUANA1KLpkFFb75lYlfZso2cGTnGvD/n13I1/SmFySa7ymiFLJiE1UpwUUbamJ8R5rmzIHocEB1hgc5/p3yqE869pAz/zYJTjPvMvCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480076; c=relaxed/simple;
	bh=BmHJUIMl03bo3cur4LADSXTy4zaBjOxIh5/Huf4taX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGctXwuNmKQacXc2qBac4l4T7KcbJRHVfAwCzlwGPeIDO1OjrVVHTt3bRpCtXDwTUSDjGNUmHHi7BKt6/odiQtIh6n1wIfeWfOUtS0EM9Fw9iFgR2bxEYRuAl6UYy+PwNpXGr6qyOZSst/aeGKgq1I4MzbR3XhT75cuV6qfK4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZkqzMI/; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZkqzMI/"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39ad8dbe947so388051fa.3
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480071; x=1783084871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=gZkqzMI/1OHiM6GtLSGWd83eBec+LAknbXifkA6S1oSFQnIxB7C3ym3mdQWKrydxGt
         8FwCrdPKhWV2kJNY4FuTSg3y5rMtTxAx+hTQHkPd0UDgU4ZMCWRMavkXm3OXG2CFTRqs
         A2Oyn/Qd/KGxo33FcpztFy4l2G37t7w/5uOt7UtGS9l7ZpmoblhpRgs/PWo6QihYPUC8
         IOm4bLksFZRihaOHMkeuRLzBSuBt8QLVKuZFhnJ/hdmatlAAx4R8375Uq2tG4/AlALwN
         pu6X7WWJdhirX1M5qA6rMtIeLUUrQZSuSKZml08o0zutev3AKFJkCZ01cWJewdB0fw8T
         ajVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480071; x=1783084871;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=mUX3yqwj03VGnZG2dRsHSFidyll/SCX+fsii3VJQGQDcXG9KWlZlrzAsSDMoBuhyo1
         yYvfpfIt3R47Ngs0842cghokmJ4TYOPZ7VhAHEFdZXgYOxM/zn8XnoSCCtnsAiKGGC9X
         J+weRgjoTWkcyu5WfLaC6N32snjeH5rt4/BOhy9U9cK94SkjCO7r1rJ1rdm+v4/hjmsA
         SlqZ+B6yQM1PreB1D9GiZZRued3zz9I9UPa8lL+TFymlFgGBDn5FltlGu/k9cGGv46GV
         MRc2fA2rws3lSgx/QdHUDOMY4fVe9sNGWgoOSt2a6CCjNjZ9GYpBBRXvgmvY53B8+58Q
         ENhg==
X-Forwarded-Encrypted: i=1; AHgh+RrFGlPLrBUQRidGcAGhCz8UbrKlrustw28+TNEIklHmUi8M1pQQVIF2S0BMZDampZ8syoc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7tulLsbazcG8Na40rDpg445dw+mff15nk98Rb5zZTVN0Do1HY
	UJ7d4lnhmjY+vfp6fIldmpPT3R19iJJHIO9pNXhF87cMn8ZpmWgxF+P4WhvLTxvLTlk=
X-Gm-Gg: AfdE7clst+jUMzmnSbbQ6rBXTDTTNqp/eK3+KmITHjw+TCzbrqrOs+Pd91AdSF/TFZF
	TxSeCKuMXLMtJDzKVpW1dDbUaK0P5MrbknmiXQwf/ypBz6WcJJ9wemSwAL0zDzeb5t9I0KjTOZE
	gIk0UKeO95586tWbAaxXV2p1q7GKm87wkpl4XDtYblo3mhuQTiCcTe/mi9OWdC/stFIcYadwx8h
	vqwQfNplNvMxmqlRv/RjN3d9Hn+JjUUbg0DHZhNzQ+tJJYHgj96TgpRFy4Pd7LsPT8fOlxRUZQU
	I4GwosHsxE/Hb9q2zodAGIqLvgF6mR4+zaoiuIfamcyihTNH5SMzwAQlvcICMPLh8j4l9s2Fzdf
	cYavYCBQn4vPcqHyTstugs6sjCmvM06NaKZSlFrpv3OS1NpPtlh8AFk6BiJ4yntdXobfdkRK8NU
	HBxzu4IZRIh7h7IqPubKCGtXTdcrWNxIz2hrpFmvIBp7twmYc/tKM+88fw+HQy/eeOBogb2DINo
	3JXPA==
X-Received: by 2002:a05:6512:1252:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5aea1f3c156mr1200847e87.2.1782480071016;
        Fri, 26 Jun 2026 06:21:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad695859b4sm3327909e87.72.2026.06.26.06.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:10 -0700 (PDT)
Message-ID: <d14af4aa-f791-4aac-9d49-ace834952257@linaro.org>
Date: Fri, 26 Jun 2026 16:21:08 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add macros for video interface
 devices
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
> 
> This allows avoiding hardcoded constants in device tree sources.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> new file mode 100644
> index 000000000000..d2340b457292
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interface-devices.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +
> +#define MEDIA_ORIENTATION_FRONT		0
> +#define MEDIA_ORIENTATION_BACK		1
> +#define MEDIA_ORIENTATION_EXTERNAL	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

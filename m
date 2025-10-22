Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4143322DD4
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130589; cv=none; b=ehAoAw3t2rnSKu71iGYBePZfGT/IlIqXPxJedO3pJ6Ld/XNLYCwBT7hL9I2LS9sVJ6aKd8GdRY32glPH0sB9OvMha1xPbFpE4Xp2RvfDd7HtOWq0Ss68IxdgaS3lUUbs7cf/3CdzFC/yOADKY3NGfSIBzNO0SXU6jCX8Hjwzuzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130589; c=relaxed/simple;
	bh=dUV0ayqZiPaf4NOTXVPmQKKkCug+aByTSr9dcbRPtuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duV/DX0ZUv1uXbAJs5YGDv6NWop8rgrgUJYyaiAkamGGVoiuHsZ47ogLVyB5r5n1pFTHDBCGc3Idom98Jx9iRUFNFZAwtuGwOmK+T+5Bk6Wfg3d8+dIHpz7/C8qtGp607I0tVtD7SsE+OoMEpzZsI5iUe0i1rYaukloeLqcF1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA1+ezzr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA1+ezzr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b54f55a290cso1023624866b.2
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761130586; x=1761735386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0A20oHPdwlwvYfXUnWJzAAzNbt9Wdmj/9G6WPspGzo=;
        b=nA1+ezzrvCQx2BajwzjQaPiQeWnHvkXt4tTGmHVUzZ6Xo6igiv/UsRQ8uZHaU4Fq6d
         B6RA2o+97zVPFJg6JlEmvbQZ/FRuwCOTCJ5PhtqEwqlvm2TANpGoamBDby4m9y85eHz2
         +lwbNDr0TT6f++Jxf3w3sFH9fUJsjCi9m2kX3BC/GP0JTgTUcpotg0pYCijOV2dPdYYL
         UbJ8DUrrzksp7ImG8GWtu3xjSt7eFfP8lLnWDn4NN/9vDei2x7EGWRJxNwNNa3T6TNt6
         zUcBpjSh4anqGmSovnqKeWAySo30xSDDmMKHxN5M9Je26cHs2KfRSCqWxHuXvIz/BqyT
         ufQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130586; x=1761735386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0A20oHPdwlwvYfXUnWJzAAzNbt9Wdmj/9G6WPspGzo=;
        b=K7eRHdbpOsv8maOTTcYf1HP4ryGAGRZarzXiRp74dSykUUK9qwmep0FLCBo0eYmZDY
         vP/q5rpkfeOrlU5voDzJCH1CkB+2i307cxIs6pZjQVpr1dStqdVrrOl6tQOEq22RasNM
         u1+XP3xNdYLy344tFyKaASkjGl0anAgw2DZ3n4sLyEdfNBBGfBXkyNkWmAMG02+G7GUV
         1+IU5qqQV4MrJC0JYE/jfN+k4oXbfjH3talHNpH9FMhGsrnWEeqF9Cx/d3Xhd7YtWILo
         tUOCck7GUbz3BmY98ikoAn+YyFqQugI0maDIP3ziG/6YdEUbbkuxKf8BM8OKzoY9JlR+
         jbLA==
X-Forwarded-Encrypted: i=1; AJvYcCU1blaN8NsxpEkqjxpvwlhPnWBoAS2o3nPORAv5qtZzQb1oq0ef7HPzOpQGrgoAbo7W1+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYDGcbJHeT1XP9jHZaZAXsYY69fuWsC8Ze/YdqjSPhbOa2Chir
	gEA0NAE/2sJw8Z79uKmJ3/2YvbWScX+rjhNHH4cjjFT+0kuYrgknFQyG
X-Gm-Gg: ASbGncsCOk64AiopdmCLO8he4SGVpcfsJr5U4f1vOpPGZ522zJuarUila1s5EN05BZv
	eUXD4h0l0K5z7WOIx+ft/FoSopZ7+9oUhljtN+95j8cLWpYOTkzjleEmRGUe9tj0zzNVXCxXsJO
	X/csgbMFfk+mHuo/h7TBcgd0Mtc6EVR2DNybBnfKvaG9jrnqH5b/duwJ4GQZj0/N4KnB1RjMd7G
	sQR2bR0ksvG4u8bd8bpCmfUbni19rC22YBz2XxTzXEoDB1g9HEWGY5doos3WlVpUsJhtYy42dBM
	pEwnlhQYFQ8tAO4T5x4VeTcLJIpTrRFRNGOcujUf2nme8EhiIzuzYlGo7hvEpaDshkzXUX6Rn2O
	Actd4DltK2tV6Rh7TMyPoK9w5Vfu0d1ccTFhoKQ3R46/3sQK3vX1aGPq+kbtqZSKo+oC/bu1uzF
	l0cAyHjcPqGKTMPmzGam6XOzjSx6kLcyCFeatBLQTPqWcus63ynVzin6uAR/Cwuqa408IQbZg=
X-Google-Smtp-Source: AGHT+IEdGRi/hFagoGGgzKcGR3Q9DoSBThXuzMQp+xb2RQm2aipBLwQ9bktG/U+2WDFiA7eALZVStg==
X-Received: by 2002:a17:906:da09:b0:b6b:a82a:bbbc with SMTP id a640c23a62f3a-b6ba82acfb4mr887771466b.33.1761130585840;
        Wed, 22 Oct 2025 03:56:25 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-79-17-196-24.retail.telecomitalia.it. [79.17.196.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526175sm1337364466b.56.2025.10.22.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:56:25 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:56:22 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com
Subject: Re: [PATCH v7 3/3] arm64: dts: imx91: Add thermal-sensor and
 thermal-zone support
Message-ID: <aPi4VqxIF/hltDC5@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251020-imx91tmu-v7-0-48d7d9f25055@nxp.com>
 <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>

On Mon, Oct 20, 2025 at 03:00:42PM -0400, Frank Li wrote:
> Add thermal-sensor and thermal-zone support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v7
> - new patch
> ---
>  arch/arm64/boot/dts/freescale/imx91.dtsi | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> index 4d8300b2a7bca33bd0613db9e79d2fba6b40c052..f075592bfc01f1eb94d2a2bd8eea907cc2aed090 100644
> --- a/arch/arm64/boot/dts/freescale/imx91.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -6,6 +6,54 @@
>  #include "imx91-pinfunc.h"
>  #include "imx91_93_common.dtsi"
>  
> +/{
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&tmu 0>;
> +
> +			trips {
> +				cpu_alert: cpu-alert {
> +					temperature = <80000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu_crit: cpu-crit {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert>;
> +					cooling-device =
> +						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +};

Here you define cooling-maps with passive and critical trip points. 

I was trying test that by enabling CONFIG_THERMAL_EMULATION and setting
the emulated temp via 

echo 85000 > /sys/class/thermal/thermal_zone0/emul_temp

By checking with mhz (from lmbench Yocto recipe) command I was expecting that the 91 start
throttling but is not the case, Am I missing something?

Thanks,
Alberto

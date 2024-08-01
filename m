Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9962C18453A
	for <imx@lists.linux.dev>; Thu,  1 Aug 2024 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513216; cv=none; b=V8YvJOtmoU/xyXxl0l8MwlN8ixdpGVKGmUmzuK2ZSYiCtuS2bAj+UqIFs3Am44HLuetgUGpRHXAgCq2ozB1V9O3UdL9KDYi161fnnJuDwMvByra9FHaajnUVe2yT6HaS+FRs+uhbZdKkn+XTpQNDhFOjYUCU+VzKHq4/GaUezhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513216; c=relaxed/simple;
	bh=4T2J2s9duqZxb+9v8Ghu8wRhFvtAYX9kXersZCxQf28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHpxTySxQJQd0VxYsxKRjRdpaAdItc963FQ74oF0+T6ySsQtSSXP/nNVp7bXnxx8x1uk6BTrlH2/+xD3pg9zbOZDyqiem1v5uRtbQcbfCSpMbMPBWU0G8e8tO08Fs5uxVC9RV19TFEjn2U5Udq5Y1alPe62Ao0YkECgac+xSwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oE0cxc2N; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oE0cxc2N"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f0277daa5so10744702e87.0
        for <imx@lists.linux.dev>; Thu, 01 Aug 2024 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722513213; x=1723118013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bbd6Xp4n6Vbg1uGGwVqlSUaRWaDu6ao7nozZz+TGJs=;
        b=oE0cxc2NbH5hKoDeNlZ5Wckg3nGhTvzS2c9d1X11hfMWpGniwndSeXuwLFV1x2Znzf
         JShiC6W3d61cdbuoMyuOc3//NtUQhFhKWC8EKc5EUYVmpTnmuCU39iWgSEboV7D66qWL
         rqeTdc5sxnnXYnBRuGxUgZPDi5WmBwP0EX4/1f2B66s928f+2kuBLYD3UrUfONGb5jdi
         9acNDil7wZuhCL1D5Nayy6wn9/luqHJBbTLdhHSSFNWidECXKPSA+Y6aIzaqAuBBoAqL
         sBskqw/FDo0DQ1IetjWqsdwotFLN5OsdtqsJODABslCmB7r1xHcQJhnqQDlOBjUOPo36
         PRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722513213; x=1723118013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bbd6Xp4n6Vbg1uGGwVqlSUaRWaDu6ao7nozZz+TGJs=;
        b=JYz3wJs3a45eASDcdWz3j6jMABpMCxPDsJQTJd88h5D38eweq76Ro/LZp//JY4ULei
         s/aKUpUNe1KnqdytOkAiNZZ2jD3n5qslRZ5UEehwHmbjfL/ohw/1RF+0ncVmWvNoI97t
         n+Gsi/pW5WrssqxDSIu4GCmYtXehKif/6x7+IfoQYfM+nCsLwcEaTw+pvrmFbJKdQK5d
         HuSNUOMSAPwLvGg7XlBMG/v+G7SWjY6kBIsgZ6pd5g3QSkjwh8XCBl2+AUGQArBgfDlG
         Dmwf9Bdfg94RdarHLDaLhBwdrT6Eaq4kCcvK8RAPKOaace5r4enX1uhVKvyJFeqt6TOj
         d+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUF18yS0jNkwL2tpWVoTBXLFrxRJZGhZNUe9EbiUv1g0k1lhbAieRPLxG6/RwpdS8AkuE+mqJxnCTzsTVBDmERLU7d1
X-Gm-Message-State: AOJu0Yzv9e/qOVMVTamUHLFuDzHTGQ+FnMGRoxi1/l01WFI9o9aUtRqH
	2PELaqK3OkuS9kNolSvjD/BfHeYgx+xAkd/l74C1wS+/cjqDHdfwoi84VbtNmn4=
X-Google-Smtp-Source: AGHT+IEWBghCHBmUnquOCBeh7BgDWoFFzqvzlEGNdmNNkRqQNvPx7USWTdpENhwDy1e+zzUB1WQiWQ==
X-Received: by 2002:a05:6512:32ad:b0:52b:9c8a:734f with SMTP id 2adb3069b0e04-530b61f3346mr1259074e87.50.1722513212500;
        Thu, 01 Aug 2024 04:53:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd0f6fsm2592680e87.97.2024.08.01.04.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:53:32 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:53:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mq-evk: add typec node
Message-ID: <hxqisqspywda7qqsxrkfpyuqjbbyvcexsue66hppku4souxmsa@p2nlelq7czco>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801064907.3818939-3-xu.yang_2@nxp.com>

On Thu, Aug 01, 2024 at 02:49:07PM GMT, Xu Yang wrote:
> The first port of USB with type-C connector, which has dual data
> role and dual power role.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - modify endpoint label
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 93 ++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 7507548cdb16..8169ed7c7968 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -6,6 +6,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/usb/pd.h>
>  #include "imx8mq.dtsi"
>  
>  / {
> @@ -27,6 +28,20 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency = <100000000>;
>  	};
>  
> +	ptn36043: typec-mux {
> +		compatible = "nxp,ptn36043", "gpio-sbu-mux";

PTN36043 isn't an SBU mux.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec_mux>;
> +		select-gpios =<&gpio3 15 GPIO_ACTIVE_LOW>;

space after the equal sign.

> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;

Where do SS lines go after the mux? Please describe them in DT.

> +			};
> +		};
> +	};
> +
>  	reg_pcie1: regulator-pcie {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";

-- 
With best wishes
Dmitry

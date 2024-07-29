Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42C188CB6
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283059; cv=none; b=qswuOZii0i0DwFeSD99tE2S20ElhRi/rPb5dQ+BSDdSLg69AUDaAfhkMeTlvmyBwjJyZlpaWsLQ1A6tO+EDMvZZRVgBVFC4yK8b62tixfn8rLeOhSj1PMF081unn171GSAjd0Xj2KXfqbFfSg/R8PqqxPP9WLimmu+MrHR7jajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283059; c=relaxed/simple;
	bh=trM2O+rr9bV4LesywylqLRqG+0npdiIzz5q9qSoKCH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1o2jxLXkaUPcEQsiHp7YuPa+1ArC2B2tLaX8rauC5aC4mGvYeUfMwFJHV6+jjZNByzsT920KdyE6JBLbgcl8DVGj/VOEG18iVCCjEfWsGNqTr9venf30H4KnO06Ccdgr9o0AyHpcTR6P8aD3jQ4ogF5eLiSCc9Z0cM5g7F+/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zl4JD1PV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zl4JD1PV"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efc89dbedso4727750e87.3
        for <imx@lists.linux.dev>; Mon, 29 Jul 2024 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722283056; x=1722887856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SqnnDYE6kct0XV14lMyb3SDYD0Ty7GXWU1n/Q+fOCw=;
        b=zl4JD1PVnYENkAZiZcftkpu8nrDr7VG9e7tsHdkHwc+iTUbG4y7VRo2kL/mMoY8dYB
         GHw3Yc2BvqIkSdw7dnRNt2x4jt7wCAQaDfPsfhXEJBJ8pxXtjKctzwe6yIP8Qb2fmb+z
         wwlpOVRpyAc7WbMtFkJHlD83Est7lmIz9mwAjo+6PNJrDS14lJfr+l6NUOLHdNj9Yy8e
         1QLf4fxqt6YiLobHqtUspavcHYw95cJxxWSBOjG4gP5K1cPTu3ZfVwqi5ZQkhwIo0LzX
         SkiKGJ46VNZHYoFmxXhbREf+lOdpmnYAPh6w5/4nK3YYUtgAF6F0fy7D/vgGImgoIxcn
         +XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722283056; x=1722887856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SqnnDYE6kct0XV14lMyb3SDYD0Ty7GXWU1n/Q+fOCw=;
        b=jBvEBUC/X3PBAZ6D0aLTk3Skptem6W8CQ53FBSTlXhL0Uhygo9EQqr+12l4+GIY89Z
         xdJZmVhN+wbSn2co90erU53Fc6vgwVhdfVhHniAJ2la7Q/guxDnxfM+zKZrmekvJTa5I
         E7R1TkwOMMlUfD3QomEljm3QVIM1oN26SBr3sS58OeKNHaiev/q9AWt3+lO1gABcWISA
         NZIISsNhaMH/f7DlCOoZ2Ht2ep4yNpqvU+l5k1e7iuaEzQU/dc8GTCyCkUJciaicdGnD
         4UB1k5+pE0mBp0JOkd3GWzfdEKA2U0PvBZAEBf1e93+KW4chUDGrRS2StW28UWr4rNCb
         SQBg==
X-Forwarded-Encrypted: i=1; AJvYcCWu35nYaQIxOp9bReIXat8GifHGco3yOjXy/4KrCbZ9sahl9qXo8/AWLaP3mT0SrCaJTE6CtUXB5Za/IRMpsnCJrZFa
X-Gm-Message-State: AOJu0Yz6MKawH96qHg75WqVmSzZrYct79wuEJEndPhp7/IqEUHC9Tkkj
	AOJpC7nPeACjCQELgYEx/OUjv8XjbuWErTbXClfKdsXOqvS1SoDvWfnxmOjiVjc=
X-Google-Smtp-Source: AGHT+IGU7pQmqUmGKaSIWVKnKEMXKhEM3oxtggFcHC4HPPRwfwBdgdynlaWbk6c3WNLSirf/4oEFiw==
X-Received: by 2002:ac2:4c8e:0:b0:52e:f950:31f7 with SMTP id 2adb3069b0e04-5309b280422mr5231024e87.28.1722283055719;
        Mon, 29 Jul 2024 12:57:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c318d0sm1607452e87.287.2024.07.29.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:57:35 -0700 (PDT)
Date: Mon, 29 Jul 2024 22:57:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <a3trxkx2fue2oahscjkc4silnfhesrws5xn7brjefjmke5emci@dn3cbb7yzmux>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729081039.3904797-1-xu.yang_2@nxp.com>

On Mon, Jul 29, 2024 at 04:10:37PM GMT, Xu Yang wrote:
> Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> used for connecting, disconnecting and switching orientation of
> the SBU lines in USB Type-C applications.

NAK, this is not correct. PTN36043 switchies SuperSpeed lines and not
SBU.

> 
> PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index 8a5f837eff94..152849f744c1 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -20,6 +20,7 @@ properties:
>      items:
>        - enum:
>            - nxp,cbdtu02043
> +          - nxp,ptn36043
>            - onnn,fsusb43l10x
>            - pericom,pi3usb102
>            - ti,tmuxhs4212
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

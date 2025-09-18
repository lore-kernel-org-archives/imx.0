Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8522538F
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208506; cv=none; b=l6vsd6g97FULOZG4OMGL4/5AeGfzbpqdV8OjWZkF4MhQXUJgbDMdXcX8Xo+KG7Jld9SJCVhfdP3QxNQBgCgkdGSqOrnnzf8bCGRG4eSwjgepFl/Cl+4CDNaAKPU80rVqGu4UNF+IDHPZKvZz09Uzp4zQp2YK7e9I3XI/UEYPaiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208506; c=relaxed/simple;
	bh=W5nTjMEiqZnba5g8e3Gi7lUj7gQH38jU4DdLi32iJEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3CIONUwlfRcjNnCxGTR8FyUHysYSCJUYEyESi1CyVK7NN+7Z8e0PLQ6U+2r4+N+RRnxmUh92R0fpSEIAsI6n0X+8fULBGndeuVRkJU8kHoEhSy47wuPab4xyYN00qFw+xNLWOxa9s69qEblizvj8bTKr14OilLVk7ZtxiucsrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWwUn3EP; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWwUn3EP"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-72ce9790acdso11683617b3.0
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208504; x=1758813304; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=UWwUn3EPGs+8pAqVr1yNjnNdR6b+B4+razfM64VpQV6EhGUW3W0gQP+J+L3Fq9wBzt
         GQizBoTFvmJfHDzQ3ESecVY7qW4GorI7z4y7vFlrwrqiePNMdSpyknudcommjsRZIklO
         w6YjvZcImP3+LA7kUGtiGQGNCyZQ9ADwENE7qQ0ypvVPSHC9Bp8i6Sp9/Kc8xYdGx/On
         LGbWCcDcATQWIdKljmVglsYnR9cDYu8bUs6LikA5kNfdeQ+FxJ11OS80rsXZLAVoyjan
         SFQ9PhUVRRgJieQlyFVPrJC18cIM9UduH8RBO1y98F4y71ujbxngqoRfGginwmhcUhwg
         n75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208504; x=1758813304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=J/SbPKvqV5nkAA7sJcyMAshR6aDfUbzHRdLR53p0JQJvOqExT/XeFQPwsHmsZPqGXa
         qP9rVMNjUHaPPHLt+YTIrhSMu2PyXAEyA7QkI4vCEOZEOR4fqBG5DAPa/Q3f7/ObL4yt
         4aLa4HNSvdZ+JDHUopgb0CAcTfluAhtNop/owFKk22Eu3AhHJgHtMVmEEvlnmMwNZYIa
         EEjfUG4CAhVdo/Ne9NNjh3Gd4yPZN90p3wH9xfr9LSMlF1/hQf/kg6qTNpjN/IGCOu6P
         5UQQH3QGsIC6DQ+wHLtAJVE+q8hPORu5Kls6jAxJbYsM/HxjL2/Kso3qGmhICnC7zIx0
         YfiA==
X-Forwarded-Encrypted: i=1; AJvYcCXLzQ11T4yn1b2xdcMlT5xRndWKbkMHO22OZ4+ImyNuqXXaxASu3z50QbF7YQzWEubBnr4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIrBiCS8eK05q3oY+iqkuX3Xnb3JDawTlTJp8QxRnRwz+DAQcp
	10DKG8ybuHbS/n2cHjZpNs3XUgy1YtbAEywMcqVafjFCd6zmVLB0DbrpeMFjEKXos8d7D76cHct
	goPlyhVt8Qz9+ayw852zjuEsDf+iO0BoBBCW36NaEEQ==
X-Gm-Gg: ASbGncuD9AM6hCSmrnyU3VtmKKEQ2LjXn1cvox0c/d2a+47tHABcCnCWOp1A8w9Q3kA
	WqucXMN2+6hFl6/RaWPSjwK9W8I9doikeLcH1s7LzUzX7V6LGqdKIDcEQyHwW/iD+hEVU5HUJz3
	l/yiOgIfual42N2+FEP97XQL4Vv0ClSsNENTMTG7uIgC0WoVoA3dQKIsgo0xXxcaSflsSfWNfYS
	uMzzL6WURXZGLSca3w0YuVq9Ag=
X-Google-Smtp-Source: AGHT+IFWx6n1PzkYYp5utqUHYs3cajDfg2GyxSlUHuEjN16hnOdbRT6rrrmIdLRynF4h/+ErT5T1ASVcKks2d63Qrt8=
X-Received: by 2002:a05:690c:7281:b0:731:6570:132 with SMTP id
 00721157ae682-73891b87069mr62837047b3.35.1758208503588; Thu, 18 Sep 2025
 08:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:14:27 +0200
X-Gm-Features: AS18NWCdTZsclOkAHpdSQCQjKeMfCrt_EDcLieD3X8xYbm6A6ARROAgFxf2mSRY
Message-ID: <CAPDyKFq1Coz4rbdam01s3pOCDa=Et2ePmf7niLSgOdjCbnEANg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] usb: chipidea: ci_hdrc_imx: Set out of band wakeup
 for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 USB2 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure usb2 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 8 ++++++++
>  include/linux/usb/chipidea.h       | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d7c2a1a3c2715967203b98c819fa864e06a00a32..a2b3f673dfc1183a02783bf6ef92f8570c6042cf 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -79,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>                 CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>
> +static const struct ci_hdrc_imx_platform_flag imx95_usb_data = {
> +       .flags = CI_HDRC_SUPPORTS_RUNTIME_PM | CI_HDRC_OUT_BAND_WAKEUP,
> +};
> +
>  static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
>         .flags = CI_HDRC_DISABLE_HOST_STREAMING,
>  };
> @@ -94,6 +98,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>         { .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>         { .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>         { .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +       { .compatible = "fsl,imx95-usb", .data = &imx95_usb_data},
>         { .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>         { /* sentinel */ }
>  };
> @@ -570,6 +575,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>
>         device_set_wakeup_capable(dev, true);
>
> +       if (pdata.flags & CI_HDRC_OUT_BAND_WAKEUP)
> +               device_set_out_band_wakeup(dev, true);
> +

Based on my comment in patch1, I think we should set this flag from
within a system suspend callback for the device in question.

[...]

Kind regards
Uffe

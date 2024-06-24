Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB312E1D3
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219916; cv=none; b=ArnYM1U1VOR7wq0mWlwb8xa4Yovxe3zbo3VPsXhRTVotPeHCl2Cx1qEJtQt9lTOgdsmpSEQqUdQemH4Ni9ys2AeByZIVUoapKOBGtZQnW2626HBvA+zNXCugVj/gW7qn07pR+zCPfKA/QsoMXN8WKs2tUQeaNOXP4/eYAa8x6B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219916; c=relaxed/simple;
	bh=hG12t8OX9r2zsfi6mBRztzi3GNBLfq5sysaB6M3sQR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYI3b4tsvcq+V2kj1Km7Y5lTqzxHoT3pKAwhZHgClrFS2s/s9dHjBDJaw5M1LIk36m52E6DNpDaCZdkL6pRikfosG5btJGPBHObCTYmEejgP8/aLzHcAG4HyZkxLHKN8lxKQKt3xw/AXC7F3kAlTVZc0edY/cW0aKeUyFhRhHjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGFZQhsS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGFZQhsS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4217990f8baso35803775e9.2
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719219913; x=1719824713; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=di0dNpRixSPGeZUOijvt7RrcSBHiIOF2BknJfQ4DEvM=;
        b=jGFZQhsS790EVNnKRNou7o+YtTcrn5sWwqFUu1qNcTqb0PWr4J3BbS5ywVK7SXdjV8
         W6ru1T3yx3KVgtjT6JhpLzErSeSCKm/GpjVGTIdHHDUVwOwoCUUnwZ/Vp+AUPGWw6JVi
         0TYi2eAJFMb4aPNututjfqIxLjhwMsSBOziBtq1UbyT1Hz07xJ25HcAUE3YiyVnFOm+P
         J3PdLSMRZrOdzpdzD7QJoZiIE0uT62KusnlIu6+Lm4ZQtfflNtGLxqb0/fd6WU3dWive
         J22Y8mcNvBAB3Fufc6lDTcBnefISsML5sas0qiypzq5fNns+i+VBCWEIPw6KiOY4wSN1
         GUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219913; x=1719824713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di0dNpRixSPGeZUOijvt7RrcSBHiIOF2BknJfQ4DEvM=;
        b=Icu5AlhqLbOaNnLUmMQIMux9c2BRpjgcL5bgq6cKCvXBDtsEQ/80ZPt2ud2tsfq50W
         g0NkGTmxaC1NLAWfMSqh93BIEU9YG1fMCV0Hiz7nEMJZexHRdWgeVqYHgzFF8Aw8MMky
         zlLLFOzL+E8NjGnsvVcRWbY7OJImiJ/p5eAT/FYcLj+DisabGhcBrBU0Q2lOVVUPQnvw
         KGzB5Y5O/he94uJ6utoaC3QOWlrRBgShKmac3t0QJ1VcEMZ8qSk2Iig1J3at1HXkGOk4
         oReVns31TB7eUR3DYOBZCTdn94QHij+eOFVtPWGwCUEabNQ4UtRoUujeoomd7UByydg+
         jyPA==
X-Forwarded-Encrypted: i=1; AJvYcCUfulXfH1llIF7rKeszRX+v5Yj9l6jATRSiS1vLbsyLssdH+v0LUaFlJSNaTtk69qoU62GT7F6y1xSW2/wcqf7nrk2e
X-Gm-Message-State: AOJu0YysmJlqJ5wuOjZHqfRioSiq6jcJnimCajnI4iSxTFKCKHxADZtv
	wvp4pX8dtfxJpy9seyH0DOKqSQNsiw+qhcWPMBgHp90iLVBrqjslOpl+OmjFU88=
X-Google-Smtp-Source: AGHT+IFkSDPiD+yWXQfNgR70eBw92raGLyWVYw9jofSEZ+B5IYJBbmKB8z16gdgkMotEoz1Cs0mBxg==
X-Received: by 2002:a05:6000:2c5:b0:366:e89c:342b with SMTP id ffacd0b85a97d-366e89c34bcmr3948138f8f.52.1719219913015;
        Mon, 24 Jun 2024 02:05:13 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f8268sm9404031f8f.79.2024.06.24.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:05:12 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:05:11 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: imx: add missing MODULE_DESCRIPTION() macros
Message-ID: <Znk2x1ON5orqjziA@linaro.org>
References: <20240602-md-clk-imx-v1-1-5c6d240f6fab@quicinc.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602-md-clk-imx-v1-1-5c6d240f6fab@quicinc.com>

On 24-06-02 08:59:17, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imxrt1050.c | 1 +
>  drivers/clk/imx/clk.c           | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
> index 08d155feb035..efd1ac9d8eeb 100644
> --- a/drivers/clk/imx/clk-imxrt1050.c
> +++ b/drivers/clk/imx/clk-imxrt1050.c
> @@ -176,6 +176,7 @@ static struct platform_driver imxrt1050_clk_driver = {
>  };
>  module_platform_driver(imxrt1050_clk_driver);
>  
> +MODULE_DESCRIPTION("NXP i.MX RT1050 clock driver");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_AUTHOR("Jesse Taube <Mr.Bossman075@gmail.com>");
>  MODULE_AUTHOR("Giulio Benetti <giulio.benetti@benettiengineering.com>");
> diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> index e35496af5ceb..df83bd939492 100644
> --- a/drivers/clk/imx/clk.c
> +++ b/drivers/clk/imx/clk.c
> @@ -226,4 +226,5 @@ static int __init imx_clk_disable_uart(void)
>  late_initcall_sync(imx_clk_disable_uart);
>  #endif
>  
> +MODULE_DESCRIPTION("Common clock support for NXP i.MX SoC family");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83814698cf48ce3aadc5d88a3f577f04482ff92a
> change-id: 20240602-md-clk-imx-370fc1d85ab5
> 

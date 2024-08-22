Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC741C93C2
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327421; cv=none; b=okrbs4vPVFX2eXJVqU0vvm8GfVmZpTyoig+neJlIo+iZeQShLkOAnK8/7gs2608HDjSGVGGOuBBnZwBQ4o3gisxTc/kGnKhuwNfUQhi3rUtl38uBBccx/bA9C/WKxluAgHqcJu/xjlFLjcl5GSsRoZv7BNQDhrzekqFEP5sxAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327421; c=relaxed/simple;
	bh=N6dRmALgAXeOUmo8+n+weP8KObEBZgC/wKGwfLlLAPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvg13tHMp5g8MyMjIvCYrLYvrZLfdHktFSPCKSYqESd2MAP9etmmPsIu2q7WRw9fvC5XE8/rY41XL88zUZBAChodYu7g8r1/7tYo1DuG65VzNgbfQWCbtIFKQL/WrqLDmXjKEfDJpQzL16OTbAEL6q2hDps3v1SCO0ZqKXPN9Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kepJODBL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kepJODBL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a868b8bb0feso96677966b.0
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724327418; x=1724932218; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K08JVc0Hn+S+yk8ZDM9GspDTZHjWKjn6EOcLVOcvC/A=;
        b=kepJODBLpqE8FbF38nantddfEbJVvMYSJPUm+Hbyz7lHzFqQgdCjT04rKgyA+fjbVw
         uIA15AaQQcKXpGtpXEfLnUs+xOQ+gVmxOMxM6X0TKkOcXSVLqM0X5HF0rn59yJrJsBQe
         8Io4/OQFuqbsaTNmU0hs3L3SpSvZyyhZ8TUPqUYMM9+LkaBoA87sIiUMpKMSdVW1mvvp
         Pu8E3bBYTwOD/f4jKPlSF3y3Wp5+5JGvte3cD5+HjSj8qgcfJLTv5a9E+H1Da/sUT+d0
         Ww6SBoxFspWcEyKvGgVg5Av5AjdndgOB4zdT+U4Vg69G1kKa1lnLqdb6jurCH+lRqBd3
         HGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724327418; x=1724932218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K08JVc0Hn+S+yk8ZDM9GspDTZHjWKjn6EOcLVOcvC/A=;
        b=qj3JK6Xbn13E2xg1JacqkG4DioRMQhVm3YaPECNAGSwLvW/+zek+VMytPMXsdAbr21
         UKuxVylBDLHv3yk7cB2H92t490M2KGb6nmwTRvMnDwdll2ENjVIkUa+RUuj9W+Td2nPF
         sikER494mfunNSASDXpIt277kg/YdosvhLSqAf5fuYEAFFsj4+ucoOFTlVMmS6UWyBT8
         GR+MEd/bM3854LPVxtL1378mRXM/+2bIRyZ3HLjo/E8/v9LCcKuw1LG+fMtziQNelJ55
         KWaWfG/g7aPnlUFe73cQy67p3gkIw1tx634CCi7zkS7EJBisndAIEhMHRj2vdiRVFywR
         JZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR82Bq+OdzcB/RdRE3bF/0RLu+1ePnU9T5YISbHpVM/+jRH00ya++igaBIyC5IdtF4n1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+3e5WsalzBRjeBGDEYyByHArEx2GmhxdTJIxK+wMV9pji0Wg9
	NwfND52CJSSW5VYE81VhOB/Bxdu0em9gihOcfxKyUP9+XqRyLQ5SHuYhR+Rq
X-Google-Smtp-Source: AGHT+IGwqD+8gzMCJdo8LLwoHsX3EVXJqes6Nv6AKEZPfuRZLAr97yDLTDQ4c6GPXBlh2PjBTNid6Q==
X-Received: by 2002:a17:907:97ce:b0:a86:7924:11c0 with SMTP id a640c23a62f3a-a867924134amr432391866b.55.1724327417556;
        Thu, 22 Aug 2024 04:50:17 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:daa9:644d:3c2:44bb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47d31fsm109533566b.151.2024.08.22.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 04:50:17 -0700 (PDT)
Date: Thu, 22 Aug 2024 13:50:15 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zscl99sSlbhOTrnQ@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <CAOMZO5CeT+LvQ__3GUf6teL3=8pZe5qxmFffYJX-h3E27UXwtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5CeT+LvQ__3GUf6teL3=8pZe5qxmFffYJX-h3E27UXwtQ@mail.gmail.com>

Hi Fabio,

On Thu, Aug 22, 2024 at 08:07:44AM -0300, Fabio Estevam wrote:
> Hi Stefan and Oleksij,
> 
> On Wed, Aug 21, 2024 at 8:01 AM Fabio Estevam <festevam@gmail.com> wrote:
> 
> > This fixes a pca953x probe error on an imx8mp board running linux-stable 6.6:
> >
> > [    1.893260] pca953x 2-0020: failed writing register
> > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
> >
> > Could you please add a Fixes tag and Cc stable so that this can reach
> > the stable kernels?
> >
> > Tested-by: Fabio Estevam <festevam@denx.de>
> 
> I am sorry, but I have to withdraw my Tested-by tag.
> 
> For debugging purposes, I kept 'fw_devlink=off' in the kernel command
> line and that's what made it work.
> 
> Removing 'fw_devlink=off' I still get the probe failure, even with all
> the series from Stefan applied:
> 
> [    1.849097] pca953x 2-0020: supply vcc not found, using dummy regulator
> [    1.855857] pca953x 2-0020: using no AI
> [    1.859965] i2c i2c-2: <i2c_imx_write> write failed with -6
> [    1.865578] pca953x 2-0020: failed writing register: -6
> 
> In my case, I can get the pca953x driver to probe successfully in one
> of the following cases:
> 
> 1. Select pca953x as a module instead of built-in
> 
> or
> 
> 2. Pass 'fw_devlink=off' in the kernel command line
> 
> or
> 
> 3.  Register the i2c-imx driver as module_platform_driver():
> 
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1586,17 +1586,7 @@ static struct platform_driver i2c_imx_driver = {
>         .id_table = imx_i2c_devtype,
>  };
> 
> -static int __init i2c_adap_imx_init(void)
> -{
> -       return platform_driver_register(&i2c_imx_driver);
> -}
> -subsys_initcall(i2c_adap_imx_init);
> -
> -static void __exit i2c_adap_imx_exit(void)
> -{
> -       platform_driver_unregister(&i2c_imx_driver);
> -}
> -module_exit(i2c_adap_imx_exit);
> +module_platform_driver(i2c_imx_driver);
> 
> or
> 
> 4. Use the NXP vendor kernel imx_6.1.22_2.0.0 kernel
> 
> Stefan, do you get the arbitration errors if you try methods 2 or 3 above?

I will try to test this on my end tomorrow. In our test case however one
problem was that when the schedule was called the ADC (TI ADS1015) may
timeout if it is not processed within 25ms which sometimes happened.
However, it also requires the other change because even if we have not
set multi-master, the wakeup of the sender/receiver thread can take too
much time, so we still end up in this 25ms timeout. This only happens
when the system is under heavy load.

In your setup, do you know what mode (atomic, interrupt, dma) the driver
uses when it works and when it fails?

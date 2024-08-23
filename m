Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C821885A7
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420627; cv=none; b=CbN6defCyVEvnKMfyM/PHK4BJVac9wct2hpe/nj7wUJED2EW59pcofQevxQUN0ch1P68SrQ5l69QH/+eHpCi8KGAJGfuaUHJyTnjXrqVa/p3kPIFzytIjFthAeS9flNympW3Z+MCo5ACv4A8hxVLY9xSryWxeOq7KSEGthxOk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420627; c=relaxed/simple;
	bh=ba1vCLOtZm/skZMHl+kh9JAeamdeHMIUzI4d2QX8+kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qelw+MJ3M3OLvL0gaJ/B/9ho0GvtViR1rrwD3KMllEHnPcyq15EDC4FEkarhGG5vb2P0xGWD1DehHWt+qJ7IMPHGahg9TRnhXxjqLCX9rRvsoy8jG4nzGZMmfyyNOF4Eh2NTgcLOLkMHoX4P1UCAY0tJ7UVweaa8w7QIO7hqgfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezXh6bzl; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezXh6bzl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso3243532a12.1
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724420624; x=1725025424; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ume1kDbmwm/gc9DUAKqcuXKYCh92rtcN1bT0exEyFMM=;
        b=ezXh6bzlbx6nY+OWk4awmEnxQnndKvJZsv2r53SeNEp86XtqrOOsRoE9VBil6Sp2tn
         P1t/RbpBDLiMfeNz+AC7T40zRmYbEE1xFsSWJeoWAhR+pvGluWpKJ8QgJcqB69Kf0JUO
         PwGnLgODbnGZ7VQct8neThvUJFDZw8lPSGY9ondUquTEw/Lyu1Pe8UnkD9D8yoLDLDK7
         qp1tHT4YDv7Wv/elhYk9zdH9rJJbXSIiynhcuKiyXMdOfglb0SUPEiNdhv0WtxI9eN6D
         RfLo6n3Ji6sFhxy5QsT4X1T2GZTh3e0bMwp3lNMnqMPHssayIvndNjgY6mKZJJkEDlPp
         vu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420624; x=1725025424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ume1kDbmwm/gc9DUAKqcuXKYCh92rtcN1bT0exEyFMM=;
        b=HiVNb1bxAqiEowAih6WWSq2xvx2Y4U3ECKPCiQor+UecSfCEV6HdgylWflL7/7w5DI
         b2lwNTwKpO4ruJ7LnmspNCyumemrdiHsLEoAHyjrub5zAqseDR8HnvLv9iXSexQCJlri
         BRT+YhwYHnI8CgVQCcv0U7N5MHnL399kvyMgUnwW6sgMqGkYQFNDAcNrhFx5S82k5Tsr
         4xAPnyMz2jaPWf3KEbcxQEJaJ7AKHwVWjIrK2hYWGUusvZdUGO0BOGYV/8qbQG5t8/VP
         rvSVuWo2luCrMEpjM6dg8WC9iTVCXzQt3gWe93rVZwUWtqLDDD+RgW5599S1dzzuY4eK
         Cusw==
X-Forwarded-Encrypted: i=1; AJvYcCVnoEOZx4rxVMdnVsnYLyH6R0Whjks5/fP1ciRZqHJLwZc+FCyA44XmtOlH4HDqgkINUSo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXJhyV8+tFtj+G7YKQ8U3OQMZHoR0IQjChmRniMgnHQP2UCDMC
	AcoCICOUk3MX/OHjgmV2RdVnMPOGHg0kU5Tw9bv6MAwYLTzqjojqvU7eKcGd
X-Google-Smtp-Source: AGHT+IHkv19M7e8G9uSEo4T7jKRhNlTTjiPTlWEKNa6PzU2aS6HcQNrZT7CqJ7oV33O7LbaaAkrHSg==
X-Received: by 2002:a05:6402:3489:b0:5be:facd:aa51 with SMTP id 4fb4d7f45d1cf-5c0891ab86emr1553255a12.31.1724420623614;
        Fri, 23 Aug 2024 06:43:43 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:48ba:80d8:cf77:1f49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3cb0bdsm2103844a12.37.2024.08.23.06.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:43:42 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:43:41 +0200
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
Message-ID: <ZsiSDUYmxPKnNdHD@eichest-laptop>
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

I have tried method 3 an it did not work for me. I still have the same
issue as before that sometimes the timeout occurs and the ads1015 will
not ack anymore. So the patch series is still the only way I found so
far to get rid of the problem. I also checked the datasheet of a pca953x
device (PCAL6416A) and it doesn't seem to have a timeout mechanism.
Therefore, I don't think we are affected by the same issue.

Regards,
Stefan

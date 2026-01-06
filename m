Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CA242D95
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 02:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668377; cv=none; b=SDsQzATNMRL8jM5yEYo+iwnROIWFbOP+BxH8OXuGqumCIQXo/+SrM1/Gzis81CsUZxyDjeX2mMHD5LuSexH59/kbZ8Grsyqgf1Fls+fQNr54uDYd8whcerB7VhQTtKWXIjj4PYQuuZ9CN9pSC1bEy5XnAIYQAjkqHhXqh3DvEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668377; c=relaxed/simple;
	bh=KRw2b4R9PFIlO/drnHXKLMuOyIF5ZUeIW9noWvMfoPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trpuPg6WJ9r1qXW9XDK7qLIolJab9+choISPMnBKRODpku/Dxqkb4RnXD6zZfxO+R9vUoKf4vBH0Q3LqMYEEtUWakMnrEdaYZk/BlAFtTZaO1g565CwriD0MjFE46N6VIUJyR+dUQwPolgbJktUZrYSVyYU8zINiBZw1uygMmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XukQ+XHV; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XukQ+XHV"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b1bfd4b3deso44676785a.2
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 18:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767668373; x=1768273173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vx/qAej5N4kP3ROX4pofW6IJjT74Jh+ftw/LnFdFGx0=;
        b=XukQ+XHV40Hpj42glS1SLJOGtqTOO9uHdy0xJ6lRozO5+r5VQ0DthWLktAFg7GtzmS
         yVQh4uu49DVTOAZUO2p4ngRtCcBObtNzZMwnu9aG7Li+MCdrLsf93SdlHn+R9N5MvUQD
         y51CLrNWJzgdX1XZGV3d1Dnwv/N0ck35VdiT3kalybt6oSW9TPPeiQJD1icUZ0i5n0R4
         8NuDeIXJCtkIo9lrPWdOA0xEDGBoi93QO2ddYjoim0HSWP8oFokH1rvwZSeudvKM4TLa
         dz1ouE5ngu83EZpjEsDvCHu/lOl2GVdpoefXeWWK3HzbXuCUgZLnGrB04qul08Oy8ciI
         ed+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668373; x=1768273173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx/qAej5N4kP3ROX4pofW6IJjT74Jh+ftw/LnFdFGx0=;
        b=d8oy+0MsG1IlpzGbTA5iS4Ly48epIZ0mPk0S8g/ApGgws48Fwxfn6vEy05ZxXGNo3I
         qOOYBZjb5w3Hryc/spNNXEyAAYToh4VUKHa5PVYKWGkjjwltzGXxYMjJ6I2vrXvr8yRi
         r58SN+U4KkE+UseD6P1cCWcyBXoogvTE0weGVAw7QBgprNjvEx4iyKJQvZvTp4/ScgeU
         izT14Qh91PbbMYhHf6fYFveaTnjkGgiuyl6r0KDkDUNvCqDls2ZFjFit/WUthosGixFf
         e+eqd2sKzObArYOP1YyzZG+dXzVeS0lf0wye4f4xBZ6hJ4pWUha0YVx2kW9AfUbXoF23
         rObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPqgTn4N4NTVzSOo8oqUGUtGwYnCYHinsQC/edxEN3pni5VTr6S7o0NZmHxq+6QVnEECU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzP4kHWr6z7nkqv/9DLZRKPsn+iU+LJ9AFROV0nzqRRTQvRjoTR
	WB0qfORa/g5XfJoPxSQ8WRUWo0Ap5PZnQPtt5ck+lst6zSf5gY39JWIQ
X-Gm-Gg: AY/fxX6GIqUlHc2JdpjpFsPPyRx+UkcjdgJn+KpwjfbjRbH44lm45u9xqe/4clrY2Qm
	arabhmUVCSs0eC/VERFH3V05Blce6otZtQ+dDz/lTwqnuUYvf/Dem9c6Xu2cXZ4iHvp9Mofxx4y
	tqQV5U4W4eyLoOtntXKYAdXlzF/sWDDj8BftTkWOzfZOClxArA6MU0o0aafIFRfi4cLRsCbJWgN
	+QIBhXyxlIFd3vumFVwdcuGgc5PHAUjadABELiTiINABvsV00NIw0j1tJlaiS1Ckg1q8ghS772t
	2YqflF4mR9eSKsSySCD+fm8G1be11llzPt/Ng8bIC9nM11VfV+R8RfU3CnSmRUMlxNWYH4YivN6
	IVBGlr+WB2011boDrrfkLMcvYd0ADrx3KcTH1gJITkpZ1JH2ZOwxYq4PV/eYuezGU+xgfY4lNNh
	+1GK/wGGF6mg==
X-Google-Smtp-Source: AGHT+IGfzpRNHPBFd6mQg2Ynna6tB59sqYBTdeaJw7TnW20z6C7vEd+2oXqE4VOqORArcYacVQCHxQ==
X-Received: by 2002:a05:622a:1e1a:b0:4ed:b978:91db with SMTP id d75a77b69052e-4ffa781bd49mr22824561cf.77.1767668372780;
        Mon, 05 Jan 2026 18:59:32 -0800 (PST)
Received: from sam-fedora ([2605:b100:549:78f5:d4cd:470:c405:d573])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e363b7sm4984501cf.20.2026.01.05.18.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:59:32 -0800 (PST)
Date: Mon, 5 Jan 2026 21:59:29 -0500
From: Samuel Kayode <samkay014@gmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Sebastian Reichel <sre@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>, kernel@axis.com, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] power: supply: pf1550: Fix use-after-free in
 power_supply_changed()
Message-ID: <aVx6kVc34fpBPJ0J@sam-fedora>
References: <cover.1766268280.git.waqar.hameed@axis.com>
 <ae5a71b7e4dd2967d8fdcc531065cc71b17c86f5.1766268280.git.waqar.hameed@axis.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae5a71b7e4dd2967d8fdcc531065cc71b17c86f5.1766268280.git.waqar.hameed@axis.com>

On Sat, Dec 20, 2025 at 11:36:01PM +0100, Waqar Hameed wrote:
> Using the `devm_` variant for requesting IRQ _before_ the `devm_`
> variant for allocating/registering the `power_supply` handle, means that
> the `power_supply` handle will be deallocated/unregistered _before_ the
> interrupt handler (since `devm_` naturally deallocates in reverse
> allocation order). This means that during removal, there is a race
> condition where an interrupt can fire just _after_ the `power_supply`
> handle has been freed, *but* just _before_ the corresponding
> unregistration of the IRQ handler has run.
> 
> This will lead to the IRQ handler calling `power_supply_changed()` with
> a freed `power_supply` handle. Which usually crashes the system or
> otherwise silently corrupts the memory...
> 
> Note that there is a similar situation which can also happen during
> `probe()`; the possibility of an interrupt firing _before_ registering
> the `power_supply` handle. This would then lead to the nasty situation
> of using the `power_supply` handle *uninitialized* in
> `power_supply_changed()`.
> 
> Fix this racy use-after-free by making sure the IRQ is requested _after_
> the registration of the `power_supply` handle.
> 
> Fixes: 4b6b6433a97d ("power: supply: pf1550: add battery charger support")
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>

Reviewed-by: Samuel Kayode <samkay014@gmail.com>

Thank you!
Sam

> ---
>  drivers/power/supply/pf1550-charger.c | 32 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply/pf1550-charger.c
> index 98f1ee8eca3bc..a457862ef4610 100644
> --- a/drivers/power/supply/pf1550-charger.c
> +++ b/drivers/power/supply/pf1550-charger.c
> @@ -584,22 +584,6 @@ static int pf1550_charger_probe(struct platform_device *pdev)
>  		return dev_err_probe(chg->dev, ret,
>  				     "failed to add battery sense work\n");
>  
> -	for (i = 0; i < PF1550_CHARGER_IRQ_NR; i++) {
> -		irq = platform_get_irq(pdev, i);
> -		if (irq < 0)
> -			return irq;
> -
> -		chg->virqs[i] = irq;
> -
> -		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> -						pf1550_charger_irq_handler,
> -						IRQF_NO_SUSPEND,
> -						"pf1550-charger", chg);
> -		if (ret)
> -			return dev_err_probe(&pdev->dev, ret,
> -					     "failed irq request\n");
> -	}
> -
>  	psy_cfg.drv_data = chg;
>  
>  	chg->charger = devm_power_supply_register(&pdev->dev,
> @@ -616,6 +600,22 @@ static int pf1550_charger_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(chg->battery),
>  				     "failed: power supply register\n");
>  
> +	for (i = 0; i < PF1550_CHARGER_IRQ_NR; i++) {
> +		irq = platform_get_irq(pdev, i);
> +		if (irq < 0)
> +			return irq;
> +
> +		chg->virqs[i] = irq;
> +
> +		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +						pf1550_charger_irq_handler,
> +						IRQF_NO_SUSPEND,
> +						"pf1550-charger", chg);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "failed irq request\n");
> +	}
> +
>  	pf1550_dt_parse_dev_info(chg);
>  
>  	return pf1550_reg_init(chg);

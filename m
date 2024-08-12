Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A7184540
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723484153; cv=none; b=NVhuB80j44ryiKrQfPBrsjmywopMwMoIBvldCBLuf8132mo3bfAWWOZzx89v2376QlLz8Sp+YQ1xuSjhAcJ9IQLZUMon1HA3MJywFXX4djZU+8080upnZTfPaOVoyZ4mFT9gGGsHt3qgsYlHshCijY5YkuLdywlkCFD0WhQErKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723484153; c=relaxed/simple;
	bh=k0/vi7W0H2st2xtbJyB0alr4uujbiwXUAJjo8e91gEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6VQZynfRNbdRpLnT6MAnVc+s1RRCFRcjjs5qXmq6PGpH5vuH81fGvbFmfSRsgSElm5oeBarz18KWbkhtxwejS8iwbTNSvtN108VO69HknAqcSIlkMiHGD5ox99pgGHNs5Diy6736bdc0Gz/wH/4EyJR18Mzi+RMOjCXJv654ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/RNC/5+; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/RNC/5+"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2642cfb2f6aso3418435fac.2
        for <imx@lists.linux.dev>; Mon, 12 Aug 2024 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723484149; x=1724088949; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGe9WVDpLw3EPv8WDjp8LJHxaG4nRuWgDJWrzJ3DiyM=;
        b=Z/RNC/5+H27FTCHFTMLZp0hDf5KwCkfSCMoCkQ0X+IpJ6azhhRmTPds/CDNVzl03C3
         MMy3XTNC1NNhdZrXnyW0P2dgrt1cgFHyEsjWo7fJcgOQLKdptH/Dw3n3jx3BkNpYBAin
         +aV8YDDt5dZir72Ua3qg4pa82d1Z9bWdrEYRm5ruMdwzbDV23ybPOhV5f8NyiXtfZ4Ws
         /RyFJLCQvFeSbiKhHLf/n+QNkGqxUZ7DMVGW9zCAq7sCwHngVeGztLV9nQJNNAHqCQiy
         bG5VAce249h5v4gn3++Eqam7jIk7CB244dNSyXLpVUsie3CCI9I6L7WgsYuK7O9yRifC
         qigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723484149; x=1724088949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGe9WVDpLw3EPv8WDjp8LJHxaG4nRuWgDJWrzJ3DiyM=;
        b=SUNy9kPqZ6yEUpNT+WD6NaZuJMEfVGFiBmcRTBGBQ7mZdLdbpzW0sck823AHOdB6Ux
         id10xKs4sji1pL/tf93nEjjjG44GVMaqyLtra0asmX3ZjziwpdMk4PEUGosZIgI/ekGU
         blrKwxgVLxPkjBrdzjnT7hmVZI+acx04MJdCEg1E86fcWiDlHIDvfChExCUU4MXEEf9T
         y7azLmW4/Bn+6vx9AFytL0vMVdKrsokyu1GcYg8E7QbSUpAKCef7OwuHesxTKg47wl74
         +/KxdDOwkDxVZ/R60+hEFOiblID5KNq+gi9/Gw28YTGjcAjl3QMDzTRa9p+f4U+HuGm8
         Isbg==
X-Forwarded-Encrypted: i=1; AJvYcCX91pnSUrMbUgU3geE7q9ntjaK7BIytZ96yXfedziLpCceyuW9y9M8ywPknXT5eJOHNGFfnG5cOk8640SNtiGbHO9SZ
X-Gm-Message-State: AOJu0Yw8Lcb0j24K28bPCNuVlD9NjacM+XEgOMLf/sUSsooFTGgqfSfK
	Ob/iqmeo+sP/1JFw4fqys2ny1YXYMzGV/vg16bjg5IzP91wAe4V7
X-Google-Smtp-Source: AGHT+IGB+3J1W1v44bGEpVHOvf7ojdD7DKrucadL2qbcKM6lsELEjpgMQU86LpLfBQxsoGt6LxIipQ==
X-Received: by 2002:a05:6870:f685:b0:25d:f8fa:b53e with SMTP id 586e51a60fabf-26fcb826e8dmr862394fac.34.1723484149618;
        Mon, 12 Aug 2024 10:35:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a89f52sm4260689b3a.162.2024.08.12.10.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 10:35:49 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:35:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Joy Zou <joy.zou@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] input: keyboard: snvs_pwrkey: Enable clock when
 accessing HP* registers
Message-ID: <ZrpH8lXG4wkORlyA@google.com>
References: <20240716205612.1502608-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716205612.1502608-1-Frank.Li@nxp.com>

Hi Frank,

On Tue, Jul 16, 2024 at 04:56:09PM -0400, Frank Li wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> SNVS requires two clock sources:
> - LP (32k always on): All LP* registers need this clock. No management is
> needed as it is always on.
> - HP: All HP* registers require this clock to be enabled before accessing
> these registers. Some platforms (e.g., i.MX6SX/i.MX6UL) do not have a
> separate HP root clock and it is always on.
> 
> Add an optional "snvs-pwrkey" clock for the HP clock and enable it only
> when accessing HP* registers.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> - clock name snvs-pwrkey already documented at
> Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> ---
>  drivers/input/keyboard/snvs_pwrkey.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> index ad8660be0127c..b352148a0cfb2 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -37,6 +37,7 @@ struct pwrkey_drv_data {
>  	int keycode;
>  	int keystate;  /* 1:pressed */
>  	int wakeup;
> +	struct clk *clk;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
>  	u8 minor_rev;
> @@ -48,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
>  	struct input_dev *input = pdata->input;
>  	u32 state;
>  
> +	clk_prepare_enable(pdata->clk);

We are in timer context here, "prepare" is not allowed here. Can we
prepare the clock once and enable it as needed. Does it even need to be
disabled? Can it be also always on?

If you want enable/disable then error handling is needed.

>  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
> +	clk_disable_unprepare(pdata->clk);
> +
>  	state = state & SNVS_HPSR_BTN ? 1 : 0;
>  
>  	/* only report new event if status changed */
> @@ -169,7 +173,15 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	if (pdata->irq < 0)
>  		return -EINVAL;
>  
> +	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
> +	if (IS_ERR(pdata->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->clk),
> +				     "Could not get the snvs-pwrkey clock");
> +
> +	clk_prepare_enable(pdata->clk);
>  	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
> +	clk_disable_unprepare(pdata->clk);
> +
>  	pdata->minor_rev = vid & 0xff;
>  
>  	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
> -- 
> 2.34.1
> 

Thanks.

-- 
Dmitry

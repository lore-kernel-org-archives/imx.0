Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D104615381F
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591452; cv=none; b=evahTeKV4SjKfbhWQlfAeMaHx7e5sJeJiz4jc+Zpt8bYoiQ8gx+fM6svNimvpV4SDPFeGrsOKr1BVfAx5YbM+cWZ+Q3CeigETNzzW18FITpT80s5+NAeurvy0ihuXO45cjmW8/ftg3L3VAmX2CGf2UeLRJ2AbXqbmH17DMRBwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591452; c=relaxed/simple;
	bh=iKMY1BsfXW5DCDOM1rJutDkN7zW/92A/o9tWLFXitOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q78qtb32WAa2BbIFAg254kUP/h7/dcZE/sd/rzAD196lxK2/DX4TBqH1Ua+UPPutGgN6AFax/6yImNInDzMAZAhhCEiwmMyH/w8BbbpU2dY63rnBStG2vrKjSQT4KnATJACoDCJKMaafctExWGk51xYKNkj7qOn46pt2pTZDgb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXfAK3Z1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXfAK3Z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724591449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5HPuabIgkyx2GqHJrYxVWzQ9JtdHpCasYdEjisxJKo=;
	b=bXfAK3Z1IGO96Su1wtgEnXNF7B+sewORfvHNFy/himSmHecu2PuTxawxMBv/YjcfGnPz41
	OCIXPB73XmUzNqLWyjCPT2/VW2F5ImtOSvEeimRbEzFWSuVsD1NkzaqUiuxfKfSKr/C5rz
	FdwJTaBysJTl+Scyk9qL9/vEv9oesfg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-OHJxpbWLPjexx8mklew05A-1; Sun, 25 Aug 2024 09:10:46 -0400
X-MC-Unique: OHJxpbWLPjexx8mklew05A-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2f4f8aa3856so18968351fa.0
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 06:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724591445; x=1725196245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5HPuabIgkyx2GqHJrYxVWzQ9JtdHpCasYdEjisxJKo=;
        b=Za1ZDVmAEN4bbUNhn5KInX99vmuDJ4rgqyOAmlp2pHY4tGXsY3yJG+v1MGqnzUSThr
         IXSham4/h3m8X4mfvCj1UFO1K0agS+LzXcAoL/JPuN2D+2Bt9bfVVkGGgUFqxyUyuGFg
         ajE5HtRJA8fkY7WA2fFM2kLs8jAQhQpI/YIxy5bmT0kDxgJKxxhLHaK7bDuqdbTEoSNU
         FgEF/N7evT8YWH7o9/rDip9P/JisOgm0ieY2vJtg0VuPKFqFw5APWQnHYuwK9gH3egck
         r+zCnOAlrz3kJ0MldgBA2z3g7Qkd+CPV/A8OMXdxUunpDOXXKhNEsIZmk92lsVPiHDG2
         SVlg==
X-Forwarded-Encrypted: i=1; AJvYcCXFFCsWYEKaCJCDFQcnEZd0EZN2Q9fq5m9LaK+YTVH1DxYjr+0RZERI5eVZvOTnwXgGYHI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2sVhipjpPfoZmMNwQ9ncBInCBvmiT6nMYqauKWJOhXA7ZBMu/
	zIoKZ38z+29LGGin9TvsOX+NEnYLCsnECXVlT2ZCaMcOW+zCfVH8YUPPVuQ2zxYEnwhhlr5Tv8i
	/hKGBaY6y8aIzF86YgfCxYa9BOCQ6r9uFeq69hjw04rZO9Cvq7Q==
X-Received: by 2002:a05:6512:2814:b0:52e:9ac6:a20f with SMTP id 2adb3069b0e04-534388610f5mr4667333e87.37.1724591444704;
        Sun, 25 Aug 2024 06:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyq3crzju8WROi3/9aXixWRhW7fyntueq+5N6z4YHdvwe29s5TLxrye+t2/cfTKoEIxN6TcA==
X-Received: by 2002:a05:6512:2814:b0:52e:9ac6:a20f with SMTP id 2adb3069b0e04-534388610f5mr4667316e87.37.1724591444076;
        Sun, 25 Aug 2024 06:10:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f29a4c7sm536588766b.65.2024.08.25.06.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 06:10:43 -0700 (PDT)
Message-ID: <0e8ae323-d6c7-4460-a342-85e52ce0c1ef@redhat.com>
Date: Sun, 25 Aug 2024 15:10:42 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] Input: gpio-keys - switch to using cleanup
 functions
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-6-dmitry.torokhov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240825051627.2848495-6-dmitry.torokhov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/25/24 7:16 AM, Dmitry Torokhov wrote:
> Start using __free() and guard() primitives to simplify the code
> and error handling. This makes the code more compact and error
> handling more robust by ensuring that locks are released in all
> code paths when control leaves critical section and all allocated
> memory is freed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/keyboard/gpio_keys.c | 44 ++++++++++++------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 9fb0bdcfbf9e..380fe8dab3b0 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -245,23 +245,20 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
>  {
>  	int n_events = get_n_events_by_type(type);
>  	const unsigned long *bitmap = get_bm_events_by_type(ddata->input, type);
> -	unsigned long *bits;
>  	ssize_t error;
>  	int i;
>  
> -	bits = bitmap_alloc(n_events, GFP_KERNEL);
> +	unsigned long *bits __free(bitmap) = bitmap_alloc(n_events, GFP_KERNEL);
>  	if (!bits)
>  		return -ENOMEM;
>  
>  	error = bitmap_parselist(buf, bits, n_events);
>  	if (error)
> -		goto out;
> +		return error;
>  
>  	/* First validate */
> -	if (!bitmap_subset(bits, bitmap, n_events)) {
> -		error = -EINVAL;
> -		goto out;
> -	}
> +	if (!bitmap_subset(bits, bitmap, n_events))
> +		return -EINVAL;
>  
>  	for (i = 0; i < ddata->pdata->nbuttons; i++) {
>  		struct gpio_button_data *bdata = &ddata->data[i];
> @@ -271,12 +268,11 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
>  
>  		if (test_bit(*bdata->code, bits) &&
>  		    !bdata->button->can_disable) {
> -			error = -EINVAL;
> -			goto out;
> +			return -EINVAL;
>  		}
>  	}
>  
> -	mutex_lock(&ddata->disable_lock);
> +	guard(mutex)(&ddata->disable_lock);
>  
>  	for (i = 0; i < ddata->pdata->nbuttons; i++) {
>  		struct gpio_button_data *bdata = &ddata->data[i];
> @@ -290,11 +286,7 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
>  			gpio_keys_enable_button(bdata);
>  	}
>  
> -	mutex_unlock(&ddata->disable_lock);
> -
> -out:
> -	bitmap_free(bits);
> -	return error;
> +	return 0;
>  }
>  
>  #define ATTR_SHOW_FN(name, type, only_disabled)				\
> @@ -470,11 +462,10 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
>  {
>  	struct gpio_button_data *bdata = dev_id;
>  	struct input_dev *input = bdata->input;
> -	unsigned long flags;
>  
>  	BUG_ON(irq != bdata->irq);
>  
> -	spin_lock_irqsave(&bdata->lock, flags);
> +	guard(spinlock_irqsave)(&bdata->lock);
>  
>  	if (!bdata->key_pressed) {
>  		if (bdata->button->wakeup)
> @@ -497,7 +488,6 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
>  			      ms_to_ktime(bdata->release_delay),
>  			      HRTIMER_MODE_REL_HARD);
>  out:
> -	spin_unlock_irqrestore(&bdata->lock, flags);
>  	return IRQ_HANDLED;
>  }
>  
> @@ -1062,10 +1052,10 @@ static int gpio_keys_suspend(struct device *dev)
>  		if (error)
>  			return error;
>  	} else {
> -		mutex_lock(&input->mutex);
> +		guard(mutex)(&input->mutex);
> +
>  		if (input_device_enabled(input))
>  			gpio_keys_close(input);
> -		mutex_unlock(&input->mutex);
>  	}
>  
>  	return 0;
> @@ -1075,20 +1065,20 @@ static int gpio_keys_resume(struct device *dev)
>  {
>  	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
>  	struct input_dev *input = ddata->input;
> -	int error = 0;
> +	int error;
>  
>  	if (device_may_wakeup(dev)) {
>  		gpio_keys_disable_wakeup(ddata);
>  	} else {
> -		mutex_lock(&input->mutex);
> -		if (input_device_enabled(input))
> +		guard(mutex)(&input->mutex);
> +
> +		if (input_device_enabled(input)) {
>  			error = gpio_keys_open(input);
> -		mutex_unlock(&input->mutex);
> +			if (error)
> +				return error;
> +		}
>  	}
>  
> -	if (error)
> -		return error;
> -
>  	gpio_keys_report_state(ddata);
>  	return 0;
>  }


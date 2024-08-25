Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3971F29408
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591584; cv=none; b=MMvpp9B9tRcwBRq0ilonBYuh9fNo3ot79jlSl0TyGEsZ1Y+LhZx8NpXNyA5OrDUkrPCUY4WaVMv80UvYm14KGTSnHWcFbjXoVQRgb+rYKEA4iWs+GzCs8TIT5WRh6ETgUK2UWfdTwJXsug1KqBK3v6+cpPtlxDl/sx+RNs99hsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591584; c=relaxed/simple;
	bh=TgKYnPZPyDTOZ3L65cfrHkuK/skuYvE26k2QLr8XRJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTihIZofVxWB12aqDSw+mgZebg3dNewKIst3ktaSR6KRahVWnPhFyZ+hsEEmPYpJ+DuLMIatl+Ojf9ysQ59ucbfldgeIC04oolJ0Als98VCsEpQ4qu6K9/HQtEhzgJbAJOiFtqgSiJsd7yfIDUqE78+I+LpZyyr0Q2KoGzfSvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h00MT5Oz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h00MT5Oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724591582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjT76MGllL0Qcry+tUV4L4dLGaCMJhJzvO4cnqx+Y6g=;
	b=h00MT5OzNb4u65ogvNRayx2QATnT6PEUgQpQCbTM6r8iBhjwqnGuPSwcQ4RdcbVtkm56Ut
	AfnrHCHUVjM3pAMptOqkMEaPK6F6H9ng1TawJMszmsEOswFoIzeVoJeZXDbI3avfwEMPnU
	cwRuoYhutfvzcC8WmRm3xx+MqBD6jbA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-xB1qS5FpP5O55rvZdbmG1g-1; Sun, 25 Aug 2024 09:13:00 -0400
X-MC-Unique: xB1qS5FpP5O55rvZdbmG1g-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f5086e692cso6693521fa.2
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 06:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724591579; x=1725196379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjT76MGllL0Qcry+tUV4L4dLGaCMJhJzvO4cnqx+Y6g=;
        b=ckyc+ZRWvxTp+lpxB/7d4Qm0lDpKN1iQg3GOT0FhwhCQ1HrPT0puVy8qVnQWuYnhlK
         LY+YCwVhuyrGZiLRRZUVL9VZFSNKOD2aiAt5Cs5lEt4N3KqW0EwqX2lNgpl9XJf1qhDW
         tRaFS2BYnyoZv9uHzQD51IEG1pN9ZIsH+cd7wug3M89jNDXAfuzqXTcQAeS8ierG/QhM
         MEnvXUTr/1n7y3Fc53AuSyFjCCpGWoq6bGkZvYHQhmBkD6LRyF6r1YRyPaFjBaRS2qqd
         Dm5SpiDnoZVDygH8e2wlYLa6Z4+AjzEoiuP9SthZU/ZmG972r5xmbApxTIIFfUajASHZ
         f8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNY/qTxVYT99FZcbPJSKb/M5uFp15tO1sQfHfJ7Fd7owH+NGmqsSJ4WOlhETgQnOOawH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyckE4glwb1UAgmgb++5hYZOkK5qJO7fTwmZinWneGlZoDXWO3s
	3TTrOnaeAZkeO+c4SQ37tC9FgacM9Ney00AC2uLmIVEIQjG9OzFqJUSvyIZvXnTC3j14SjvCLIh
	gwNmYkA79KDZYSKoKTR833rmGfhBhrWugUG9p1OxWF6I6/J//og==
X-Received: by 2002:a2e:5119:0:b0:2f1:922f:874a with SMTP id 38308e7fff4ca-2f4f48eeda8mr42665961fa.14.1724591579164;
        Sun, 25 Aug 2024 06:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGedG8Qc1ocP0F7rBDO7Du9zOdeBSFMEWGKGSF2JNS3V7HesaJGbrGKKVPU6aQQc17mUbUsw==
X-Received: by 2002:a2e:5119:0:b0:2f1:922f:874a with SMTP id 38308e7fff4ca-2f4f48eeda8mr42665631fa.14.1724591578503;
        Sun, 25 Aug 2024 06:12:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3cc25bsm4404438a12.38.2024.08.25.06.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 06:12:58 -0700 (PDT)
Message-ID: <c32467c6-fe3d-4ac9-85cb-15f37d4728a2@redhat.com>
Date: Sun, 25 Aug 2024 15:12:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] Input: atkbd - use guard notation when acquiring
 mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-4-dmitry.torokhov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240825051627.2848495-4-dmitry.torokhov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/25/24 7:16 AM, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that mutexes are released in all code paths when control
> leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/input/keyboard/atkbd.c | 37 ++++++++++++++--------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index f4f2078cf501..5855d4fc6e6a 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -639,7 +639,7 @@ static void atkbd_event_work(struct work_struct *work)
>  {
>  	struct atkbd *atkbd = container_of(work, struct atkbd, event_work.work);
>  
> -	mutex_lock(&atkbd->mutex);
> +	guard(mutex)(&atkbd->mutex);
>  
>  	if (!atkbd->enabled) {
>  		/*
> @@ -657,8 +657,6 @@ static void atkbd_event_work(struct work_struct *work)
>  		if (test_and_clear_bit(ATKBD_REP_EVENT_BIT, &atkbd->event_mask))
>  			atkbd_set_repeat_rate(atkbd);
>  	}
> -
> -	mutex_unlock(&atkbd->mutex);
>  }
>  
>  /*
> @@ -1361,7 +1359,7 @@ static int atkbd_reconnect(struct serio *serio)
>  {
>  	struct atkbd *atkbd = atkbd_from_serio(serio);
>  	struct serio_driver *drv = serio->drv;
> -	int retval = -1;
> +	int error;
>  
>  	if (!atkbd || !drv) {
>  		dev_dbg(&serio->dev,
> @@ -1369,16 +1367,17 @@ static int atkbd_reconnect(struct serio *serio)
>  		return -1;
>  	}
>  
> -	mutex_lock(&atkbd->mutex);
> +	guard(mutex)(&atkbd->mutex);
>  
>  	atkbd_disable(atkbd);
>  
>  	if (atkbd->write) {
> -		if (atkbd_probe(atkbd))
> -			goto out;
> +		error = atkbd_probe(atkbd);
> +		if (error)
> +			return error;
>  
>  		if (atkbd->set != atkbd_select_set(atkbd, atkbd->set, atkbd->extra))
> -			goto out;
> +			return -EIO;
>  
>  		/*
>  		 * Restore LED state and repeat rate. While input core
> @@ -1404,11 +1403,7 @@ static int atkbd_reconnect(struct serio *serio)
>  	if (atkbd->write)
>  		atkbd_activate(atkbd);
>  
> -	retval = 0;
> -
> - out:
> -	mutex_unlock(&atkbd->mutex);
> -	return retval;
> +	return 0;
>  }
>  
>  static const struct serio_device_id atkbd_serio_ids[] = {
> @@ -1465,17 +1460,15 @@ static ssize_t atkbd_attr_set_helper(struct device *dev, const char *buf, size_t
>  	struct atkbd *atkbd = atkbd_from_serio(serio);
>  	int retval;
>  
> -	retval = mutex_lock_interruptible(&atkbd->mutex);
> -	if (retval)
> -		return retval;
> +	scoped_guard(mutex_intr, &atkbd->mutex) {
> +		atkbd_disable(atkbd);
> +		retval = handler(atkbd, buf, count);
> +		atkbd_enable(atkbd);
>  
> -	atkbd_disable(atkbd);
> -	retval = handler(atkbd, buf, count);
> -	atkbd_enable(atkbd);
> -
> -	mutex_unlock(&atkbd->mutex);
> +		return retval;
> +	}
>  
> -	return retval;
> +	return -EINTR;
>  }
>  
>  static ssize_t atkbd_show_extra(struct atkbd *atkbd, char *buf)


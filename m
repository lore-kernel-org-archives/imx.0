Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6415D3234
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759509; cv=none; b=BtywfaQaFzXt45CsL3JL9gyGmxXGs33H49PMlaLew3U/M5eyiq8v3KObbx+JFkQPVa0wg9GypN//Oiuy2HaFKHJFFIFRNluGQtVLNCE3YbhY5ujCw3T744Y7k0GFfMhS00eq8Zqc4oT7rehPBdlzJIVTcnhe89rrjXLsZ61EudI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759509; c=relaxed/simple;
	bh=hdLNvV4ZDefdMJiuno9fjpOjHFosu7nQkZ7UaWvn1cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zs5gC1RRkVghP5Wt6J4/Wfo99EneYBEbfmYeCFai5MEO0aRxjbCR9Y3z/vBELn6wkCJhd1BaATlskWNBnJhjmGudMCzwDVKm5rt9G31Rtx5om6+Qac1p0XbEW4raBCW1h2ZuCHUEbolUvuANYLlQ+CczyEyd3ZUHorpq2N2+mKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6KAXnEF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6KAXnEF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so76996435e9.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738759504; x=1739364304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=b6KAXnEFtTD66FZ20SRirxsPiUJV4OjUhI+sd5IZ+e/VnSQTErnAgbZABHLL1mSJlF
         6R5gpnXEjCABma1r7Y0tq1UXb9mMiFiaX3RQtoxrdkaEYgTtbp0PYzBSv0siY96mk8mI
         OB9mO3kWWiQMTpoVkG+4ck0pqKAVPCXJJa1Qt/92h0BItW7GuN+1/WJoQb54fO17fMIY
         HuYJVsV7CIYdeyL+PUg38CS1Os5UIwkkhRTmTfM+oKhNwCowG4R/GdO1cqKfoOMscmlk
         hT63vid9UUpET1s6YIBk7iU6ZG4htJRh61oPOPwrtbh3QyWfKqbOTsw4dJa3Q1x94QVg
         sIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759504; x=1739364304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=qKsDX9qCeea3N6UxfXRk8W713SJyVYE/m7C5Nl0QL7ygUnlGcDKAP9OdlL8UyN1BY3
         wFzxEwGf/OUijrtK251GC/mI7QoKyGelmSpAHWx1k8n+MsSaa5oUiVc1yUFe3ModgEFJ
         zUSfTCdfyrZLL7uFYiVPsL5tCeLQjAQ+zhiJUHjxru0hOAmpMrWENUK/jGdhRHbYepcb
         4kAmPGHKJ2qIV6X546qiCchzTjD07vvng5nGJLHJJUcDDCiVxPqnr5oWnz55baKRxSlx
         LES/iQS9sz49ehlMkreyi3SPZSpE7SjZDlfRmEWpQbkO5sWUuPIC0TnxP8lvxrOs+4HO
         oOaA==
X-Forwarded-Encrypted: i=1; AJvYcCVTyOpYfrXVb9kA1fFCDhejo1W5dsD88GTW0hT6PE0RRu5ARgkPSBJWcdJWUhOkSxYSb3g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPKxFxkqJt0zcNVa6st1BOl0G+E0mBGSuY6KwVnW1DsiTaK/s3
	PNPGPfl2aCFhOH9KnGNjbQFjM5YoIa5VLK7fYR5EQCnnJ+LZIRxIPOpPGy/BuYU=
X-Gm-Gg: ASbGncv8OecjjyPL+Vjxm6Ai8DzrMjwsjdujq3pPPqtx6z0S8xCaLOtjSoWqVSH6AqN
	T+ePo47zJosBtku1S6oDLPcCkIkwLpKfm1hwf7VdZ7F4HPixxEQKLZgiY5sLAzMbimxxBvVudwe
	x1/NJ3H1TnUtBr460c6jXz25HEuFa1rHWwU0Sw+FIGAbdJRtblfvceI4B9uTrZPPYcJYAh3l0r8
	w8jkvV6BpzfLs7eguvNwcIgSk9Mv4V/tw5yJ22xyJ3npo9VYYAPU3sObnZ94uBii6zZ+RQdOXX/
	4ww1d8GET9ZVyYa+F02E
X-Google-Smtp-Source: AGHT+IFCvzDOHTxQpe1wyNcbveuClBOWo7xzohLO9c/UKcth1SBw5nvlvVBDYrxutdBTH8HCumBZ9g==
X-Received: by 2002:a05:600c:3511:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-4390d569890mr18220445e9.22.1738759504528;
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db0e2f479sm3524769f8f.57.2025.02.05.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Date: Wed, 5 Feb 2025 15:45:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>

On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> +static int
> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> +		       int protocol, const char *name)
> +{
> +	/* cpufreq device does not need to be supplier from devlink perspective */
> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {

I don't love this...  It seems like an hack.  Could we put a flag
somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
because that's what we're passing to this function).

regards,
dan carpenter


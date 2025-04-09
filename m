Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC331A239F
	for <imx@lists.linux.dev>; Wed,  9 Apr 2025 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209175; cv=none; b=LtQNHdGhZc0ZxpmeTjGXy7lu6Io1n66rs18FAn/wzCcMUgAIW5OQJiF2YKluzNFd7D/vFWSlD8hlUSH4KQAqWA6O7b2sMK6oZXjL1292/R3ysnuWSFh/5Uaj1Ohter6Qow/TnYhMn0qGm/ffhvWUJElzZl3M3yCsFiA51s7gIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209175; c=relaxed/simple;
	bh=dgs4VNIUccb3VKlgy5RETMbn/dH56y2TOWu0Ep1tE0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9d8waGSBvyyMo6R+9ZKfIZoke6CWBHMEo/b8Fia93hjh7qEerqMW1YUybphALnOCPUxX4eLVPniZdQoHCkZgU6/Cm9ROFUZuYvOg7+QBw+ajDx8QWxS8k0PZXYS/nyXGrxcqmnL8xlXEjxKhy2rYO64MkfLYN/yVryOO7wdU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gufYSq+M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gufYSq+M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso67006685ad.1
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744209173; x=1744813973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hACfhNRwlqXovej2hysiEcuy4h8cF45gwT3gzZ3u9kk=;
        b=gufYSq+M4Ht2mNlcPVc/OqBbBRndXpopbuVMC3P0Twr65XWeribQkSnyyCOWep8uUE
         tiwF/8ZUm+8/iYXNZkA8zFAeEFQay/WidIQxp2OwMpCwU+hK0uID7kM7BRtPWMAeVRAK
         Nosfx/8+RUkJiKq1vxMw+juLAeVgWgTJD+PWiG2tK2EA/R4MgBaUaTEAiVn6NeWJJ7LW
         Zoc6Ot7R/dwTL2g8luwa5N3Zt1qXrNZ+bbs5fYw0vNizQa6EwSXAYumcsLaSkPzrQtIv
         SGAgHcII2hbDQZEJUg1CtvYrZt5asBwcqnnDxH1E6Uk0rPkP6C6pXCUrNB6uxYJCu3+G
         YWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209173; x=1744813973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hACfhNRwlqXovej2hysiEcuy4h8cF45gwT3gzZ3u9kk=;
        b=wgEkmHunIQr1TQ1YJs1X8okc1PCRcHv2ICQ9woL2tbKXK7HMzvyKpyLbjcfEykdTlN
         tBaDpaUzMS/PHnQfI6S8Wl8BbV5cQj6QyN43fndeWdRtjqLf/vah+z66c6UEONtd0jim
         hPW/vfmkZ1yftDJ+DHQ6DlKWRnklbmMM600nM6ZeMDyezNfnDogroxSCjdQ0cxMFOL4u
         n5ouOFdz+7M4Zl+bsHQYFuUHJSfEFpIJRkrSYanRve/U3YT3l4/Unlqg7bNgUuEAX5yZ
         Eu75tQ177edzHPnXRMhZqdUuqn2TkrClWM4Pr7dR79zMfC4cO6689pOCdptHFFvmLdrp
         Md8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPmPrwUWBkSvDYGwrKeBQBgl5Zq390AVg4ntJvmGORUVXjH9MuT1l8AoebbNwIIIQwiRU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT95dHQKy21UuveO274Njec8jcoAzP10MTTlfWMwOlOVqfVGy8
	eVVf9FDg1D/eZ0maJ6GivG8H5ORr8EDxLDqYDA3TWMUHlFC05Aue
X-Gm-Gg: ASbGncv/kzxq5D5tN2qG3Hbvae4mcPOdbejDtDJ2SMu1Js1sonyeaiFVIueSmXm5Ws/
	vfAUN54LOMrZuHCYXx0KoSU+84LapBleqbDvt+G/FXTW9ec/tP8bkIk0Pe7GKXxoIcMxqYtMQyW
	13B40PawKP9uCVmRUVycxuCFAHJfk3CkOvsQdhqD8W+JElBfFN7W4fIy6XXyCZozLJUp3EhqoJx
	7okr1Q82yyDqc4EELbmfPfUKOAf8FJeF6W//ncNRx+FC7hfxYxw+Lnwcm5AmzSIRcw44eucrReC
	OQQbzkxMwxddMPDv54CR3vDx/yWwsggsai9Wlx/DnsFLFTcYTRDk8EWBwNKqga9Z
X-Google-Smtp-Source: AGHT+IHU1lXmIHmOtQjdOWvnkxGXNioa+/z6LgGjPgjk6iEbR/WK2GRs0RMBTbVw9FVcTLiUXbEByQ==
X-Received: by 2002:a17:903:1b03:b0:223:67ac:8929 with SMTP id d9443c01a7336-22ac3e100eamr43781285ad.0.1744209172512;
        Wed, 09 Apr 2025 07:32:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aff9sm12583075ad.79.2025.04.09.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:32:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Apr 2025 07:32:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: Re: [PATCH v2] hwmon: (ina2xx) make regulator 'vs' support optional
Message-ID: <badbf2eb-1968-4549-98eb-5ee916860090@roeck-us.net>
References: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>

On Wed, Apr 09, 2025 at 10:45:29AM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> According to the 'ti,ina2xx' binding, the 'vs-supply' property is
> optional. Use devm_regulator_get_enable_optional() to avoid a kernel
> warning message if the property is not provided.
> 
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, after converting multi-line comment to standard form.

Guenter

> ---
>  drivers/hwmon/ina2xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..b79e9c2072b3 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,11 @@ static int ina2xx_probe(struct i2c_client *client)
>  		return PTR_ERR(data->regmap);
>  	}
>  
> -	ret = devm_regulator_get_enable(dev, "vs");
> -	if (ret)
> +	/* Regulator core returns -ENODEV if the 'vs' is not available.
> +	 * Hence the check for -ENODEV return code is necessary.
> +	 */
> +	ret = devm_regulator_get_enable_optional(dev, "vs");
> +	if (ret < 0 && ret != -ENODEV)
>  		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
>  
>  	ret = ina2xx_init(dev, data);

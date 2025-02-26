Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB643218AB4
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580923; cv=none; b=kvvAnVP/EFgjKcS0lz615KVKu0MxGZ88CXwY7MzCyz27iV0pH4R5+iaq6+bSDwsyAwEyCdGob1etak+KwsaOB2hw8CnGBvkTYjT9/Ck7liU+3kdFpOiIM5bgeNxpsBuZ/krsdGGZIXd3918krAaBNhDoKA98O98P5Y8LOMQXlDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580923; c=relaxed/simple;
	bh=4FWXayBvVhNTS0E6OWpQiCVezWoKUfgMUUoPmP8gePk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl3SMZiWx05KDwgmvtlSHLnb0k6m5Z1+/3oQoE7QqzQ9E+mfbBtJkdjXmrQxyI+Rr6HghCH/KFyY/51Tv38E+L0Tjyxh2LAHwDUnyaNhPM0Vt7ZRkRovW5C1Omf1wlpWpgmRxP18MRC4ts478C0ELN9jBq8Corx8AC7UgTo2YZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIGUBXoG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIGUBXoG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1069334866b.3
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740580919; x=1741185719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=;
        b=bIGUBXoGplPZcFfjOVZxsURnME0WTfGjbIqBXivpdxrIoH5d0Knwh8kW+uLOqYSOS0
         sp3dWJNWbO1XpmSUlXHoPk4Fc2Za4iKfrSJmkJvLq83VChSIi8fai2yTkUID+HE2lc8l
         3HNvGHFPEO2ezN7IUdJbp/XhqTE41scTo4izOynT5rG3H6T48B6lu0ptAF0lLLAZh6Mo
         l8H1SBvuWBYinHYaLcmYcYR/1/tUuECueuw3bsmZc8c0Xf3Hid89bugLJwceCOLmI/s4
         rwWex0vDE7DLMKPK+kEmIzGuekoSZgus1TqjFIRx5e9yQtnqxyaM5NMqyqyQebPUnMYo
         Bc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580919; x=1741185719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=;
        b=RZ0H3pO8K5oq6ysZPgpmDk+0+Bf/e5ZlSkSVX6iPNMw5X1m3+x2yq+JmwLPYktSndx
         l/tSeCCB4cNVeezPeSWfQwfz1x80tPckxMMztWU01QivweG/gFAbQEN/YsDZhV0KKEQa
         fzEzo7un+hsqynl662YqbWCJ+Kst84fmVuonNFj7H0g6CZzTNfXv6+NP2p16vZk+FmtJ
         DfGuFy8uaPWO0wisJ6Ns3AVC44zLmTfbDd9SKTsS/FvPOf7yUP+N5+n75XiJpR3NgdLL
         bHKZVvX97TYrktuOZBQEQmQP8W/W036XfqrM3ngKz+UVlMjwmGd9eUraKia48GxVBdCt
         yf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvyfhDlBI6VLelkiAb2JLbz2ExzaRBo9vrmvcnKp9niSRXH1dUe3bvFMfHDEh3C+QtYBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSd4jUTVUkk2a1YveyBio2ALqezxSTNppFh79xXqwwjMQF2ERW
	HtgSp6g5Q+X/5N7XG7GM8dFUDRnlB6lsyTH63hHr5RZtVz1wiZ+X/fSslQFki9U=
X-Gm-Gg: ASbGncumi1SE5uue2Yo1UblSAIvpBxE6Ik/+VzcebLMt/cutqiwprDPpKhz5DlEpWwd
	E/I5LsLARqiIqcdVPJINSmN7T8/IAWrTUQMIAJPKhhUXDg6cMxRRhklz62Sa0zYrH8Dlu3jAKwy
	H/+WFX1spTvrR/IYJHSBkkswxS8e3coeK6N4C5Y0rMR5OO/A7GCSLKduMm39QajTliKpk1jlTAM
	0lSsEplChB72SAwIW0yKngqEqfiLqPP8ehVx/LpaMRAJf/+OSIM9CVM4mA6x45z5ZwEf3YlrH89
	X8XxAlbQGY/+rIgRaztpz4qVFPGx9Nw=
X-Google-Smtp-Source: AGHT+IEqq+wCIO+7KpV9xqIa2Ubw1hCVyP4Ga6WxVj5wemOObN4UBSusPlhMuI5n8yBIpYErWlyqpg==
X-Received: by 2002:a17:906:314d:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-abc0de55dbcmr1974440866b.48.1740580919225;
        Wed, 26 Feb 2025 06:41:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed2012142sm333883966b.117.2025.02.26.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:41:58 -0800 (PST)
Date: Wed, 26 Feb 2025 17:41:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: imx: fix a potential memory leak in
 imx_media_csc_scaler_device_init()
Message-ID: <450cdcc9-ccb8-4ebd-847c-b106fae2d709@stanley.mountain>
References: <20250226142126.3620482-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226142126.3620482-1-haoxiang_li2024@163.com>

On Wed, Feb 26, 2025 at 10:21:26PM +0800, Haoxiang Li wrote:
> Add video_device_release() in label 'err_m2m' to release the memory
> allocated by video_device_alloc() and prevent potential memory leaks.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index e5e08c6f79f2..f99c88e87a94 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -913,6 +913,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
>  
>  err_m2m:
>  	video_set_drvdata(vfd, NULL);
> +	video_device_release(vfd);

The video_set_drvdata() call is pointless.  It just does:

	vfd.dev->driver_data = NULL;

but that's not necessary if we're just going to free "vfd" on the next
line.

regards,
dan carpenter

>  err_vfd:
>  	kfree(priv);
>  	return ERR_PTR(ret);


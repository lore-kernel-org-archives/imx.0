Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54985644
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233419; cv=none; b=NOw++9RpzTf5nS++ZYNIdSp6aBN/li5DeNdKoa4wQqIF1kcgUWkglcMIhMabyxVdRC5p/bM+WOUkJlNE8pqh+p7MGTxj4mE3LiwboA24Yhsk2uuXF9vL0jvOOgMVGNskMpNMOPSs6MfsXf/K8W+6epJN2YmFb33xClIWLp4JGF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233419; c=relaxed/simple;
	bh=DkBQRag8K/nVFSLzRC1O2X49AG8u22IqmzLoEi+THXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsuc9f8l/9Uj8jfWAGT7dAhxDV6lZCU+2VhH658d94zCLVAUL3DDWYVjy/WLtY4OEOkIZGYrSgD0wjWfnCl08raSAx+UAF9bp9kYFCZn7VZvTLNpx+5q8rjGViRsT9uvci0Nwyy6TMRGVm4APGIdsD94Fdj4N2XG2bsqiBxHVZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uUQCVEri; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUQCVEri"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-515c50dc2afso1051074e87.1
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233415; x=1712838215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eujsqnNsTdlCsaVOb8FrGI1iNYwUxOE+TZxCC6aPEM8=;
        b=uUQCVErinIMohXjMp5IiDE8TF56dfPEQOulJjkI0leI8dmM7l02UUwCIzW52jg6Q/i
         mm0LZa+Tacqc6C1+GOxr1DlHfjOoH5xIJXqcV54G6nlENrRJS7gOvM0fFnCQQGXpamio
         MnpaSLQBQew87VbPlNN9HfzQNERHEeT1nPeTYEzoIyV8lzmuFLf5gPSb+rPrm0otgKtZ
         YccRMosk70XvucuNI70C8CBfr8CRbZITWCZLMwuKifDZFjlOtc/iI1zhotyjiy83iN6b
         8Y6KHc6nJKUSqsGHV6H49XbPhUJgenylXATZDjsWI22U1pBrlZtNqq9V8ZfLqnWm6a/8
         qnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233415; x=1712838215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eujsqnNsTdlCsaVOb8FrGI1iNYwUxOE+TZxCC6aPEM8=;
        b=GzrPBUeK1tMmTXjHRxXR+GOUILIptyIE19o44p3AGCpUuzYEP7gcd62YS3c9eGHpc/
         j9xFNxkbRu4tH3cJbqip0j0f6uSMf6TJzqa/ReepDy9ClBmZud8d/FxXmpIpK/VPMxQi
         Y6DmCnFA+JcHm4H2U+q8+LuHU+bhtRrHy+GYinZO8S2t79MMNFZeQsqi/a6iLjKn9Bg7
         LNqWcHbgElg3u9s2kSnx9+HMdx0kb6XrQ3sVNtigspAZVM/1nbWnuTrnfUqDOCvzaHSu
         iHHtle/KoXlc1vJlkagyLtjTqUj5GZhcnKl3x55UhYvF05JfFJqvZUr6LTOMTcM5vvzT
         iwAA==
X-Forwarded-Encrypted: i=1; AJvYcCUS16PPXtQuYbhmL4E/EyaZUibpWeqUJyd87cs8qLnd8a4FSF8YmATrCKNETFIetSUOFf+FS5p1C9ZvNn881nMKDLAw
X-Gm-Message-State: AOJu0YzWVKaBjPRaVke/7VbRDDaAxdikY4ekghKwLyVS93VK4d8UXoZq
	NgLB1IkG3lgQmVZLN1KSvXlGIBw7p+42YrHS/xLLblBK0jArfLVXvyb55Bu1D88=
X-Google-Smtp-Source: AGHT+IEiC6EifV89yJAb4FjYrCRe0v7lrBhjNcstTawf24NoAdVUVeIn0D+h1SFdO92LrKIFue+53Q==
X-Received: by 2002:a05:6512:3711:b0:516:a148:2f5 with SMTP id z17-20020a056512371100b00516a14802f5mr1453656lfr.40.1712233415518;
        Thu, 04 Apr 2024 05:23:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id q20-20020a194314000000b00516c5204f13sm229240lfa.208.2024.04.04.05.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:23:35 -0700 (PDT)
Date: Thu, 4 Apr 2024 15:23:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
	laurent.pinchart@ideasonboard.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
Message-ID: <s463qfxdzpc5udfb6mmlvosc6d42uo752ue7cnpf4rhg3psdaf@kkrjbncbbezl>
References: <20240305004859.201085-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>

On Mon, Mar 04, 2024 at 06:48:57PM -0600, Adam Ford wrote:
> The IRQ registration currently assumes that the GPIO is dedicated
> to it, but that may not necessarily be the case. If the board has
> another device sharing the GPIO, it won't be registered and the
> hot-plug detect fails to function.
> 
> Currently, the handler reads two registers and blindly
> assumes one of them caused the interrupt and returns IRQ_HANDLED
> unless there is an error. In order to properly do this, the IRQ
> handler needs to check if it needs to handle the IRQ and return
> IRQ_NONE if there is nothing to handle.  With the check added
> and the return code properly indicating whether or not it there
> was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Add check to see if there is IRQ data to handle
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

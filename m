Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB891CA6AF
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616598; cv=none; b=EIyKPHQQJMGxz6/iaZl0G/pupjvtGzcULLY9lClC0JUhnFiNTkeo8oC28Z9RZfJ+bzeawYfpJCN0dvShug7eNfyCCCNEXcIV7/CUPmsnxdZoZqECtWOkpUvyJ6VLRurjM1xMIGGh2hb/ieinTNZuEumWAZ6SVRl4XmYr/fAXxp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616598; c=relaxed/simple;
	bh=CWG5M//CcpbxjWAbYqhipng8zW0m8WVrV/G90iI9XIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vrn2gqDL6K8NdbmjwyUiIZ1rCKO2/rEL8MNdo4OsrETf1naixlMj5Y8CkDssvkurDo6+W04M92ZPkzso+2QYxbpz7dyKS50An53/GqsVaM3e538dKUQhJSD8RmvaBrDwjbD5IQO+arUFUUbnTAG7AEIp74d85/yA0384bzi1FkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3StWxZA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3StWxZA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365aa568ceso307652e87.0
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616594; x=1726221394; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
        b=s3StWxZA8yWzgrFQIehZ5QM8raABC8Ujeq1P8gDyLrkL+//Ua5jqGA8nBYI+o06IwN
         F1SSmnEVsR/+rru6vkEg6385H1VJo/0n3tgKBshgqBptkwKX/fXD8qsLUWPboYHpdZhi
         KMDRYxaOoMKG+kQeiQVm79s583R7w5F6NJ9EBrang4Wgp4/8/8bbkPmyiJDIOK85VD49
         rAPmwhyIrb3Gkn0NjG2s+3gTfiRsuAyD9hQLZAO/mScguoPfOIRxxNZNeEnDscWE8PF8
         K7NPFG7tiim1l3Rd+/GZrMn/xR9OIQiAtPehUinozFum0xZnkmg3hUAja4hDXtPE9RqB
         prlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616594; x=1726221394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
        b=qI17+t5wc/UwhN9966qxbwj3eVZ0xzVP0cAZ0iJI7EBd0Mmg6inOgeTjUVyNrFaUDw
         clOhsH0giH1qCB6VV5qFHA6l3XmhltdLpV5Lp8+5hBU2jYMXmVelWNrn8+GKUmxEgFfu
         qZ7hZacezro1V2mIEu/YkOOXTe7hJincqeVIrYZvSeigmGT4rk/aoKk9r1G+MaZlel1I
         hNkwAljYehTldk1n5liki8KyIzq760UDWFGKrOn1E4mHv0Y/cGLXgFgRlr9a1VnxbqqL
         BJ0RUAM1mGN49M5UsvEIDgIrnwXEnebO1XLywpVe9KnOcbu/RL3f92SWKqKsJ06W8K0h
         6CAg==
X-Forwarded-Encrypted: i=1; AJvYcCWLv5HMPw2aKJMilx8APYTo/U/8fVpmYsjAgeAWqHBwSS905qIMGF9cmsuJziNpb6zM1KI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjRZq3H/aNa8zqEOOdcU1cDDlpWhVBBh0nRFn1JneLyqJT3kuD
	Gw2+NB8/qBt1wU199dD+GQLHIEVOyKKus5tajc1j2wUFDr8nSlPrFQpWqJjYY9A=
X-Google-Smtp-Source: AGHT+IG4NjSKk9CJsxL7X661oGVWb4dJGK9kAqeeKA2OE5R1RdOgN5Xic7eEYM/SdgbXf1sQD+KCfA==
X-Received: by 2002:a05:6512:3ca2:b0:533:45c9:67fe with SMTP id 2adb3069b0e04-5365880bbbemr1607806e87.48.1725616593689;
        Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084edc5sm2826881e87.279.2024.09.06.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
	jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <dgrmcsmqjqukta226byebvbdopcxqapq6kaf62nmttbbgcb4vk@ptkkp3672v5k>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-3-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:22PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

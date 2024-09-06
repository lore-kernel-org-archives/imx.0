Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23A188A31
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616607; cv=none; b=aL/PAi7c+ULSjgtmz4kIpNRJBO34l/kdU1i0ezmPzenYaDHbShDMZGHzVNG8dcmEQC9lkvyETt2Ng3cbzUkSTWZss4ZX+D2aX05/ANCa39LzoYMXwTKk3tTkrd+E3EPZlahZLlhL1vHxljY6EvW3dNyEC7T417/MoZC71wUnkLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616607; c=relaxed/simple;
	bh=CJC21CQtg+wIdlGhEd7QkrA20tFbCYIpg9WWk1ftlVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf5ZAVTs0myMU3kOa9jI28YY6d1xsnw/RRE9BM07+bh1cfd5mVCXUpkkSKA9Bz/hkTXBxdimBl7IeSLMEK4WOL2t+ptAGF49Fb/N6v98BtwG9q+Drbcoqsrs7lViK0g79DAC0fTINZNMk6nHBTHzLsMJkXXMdA1Ja/KCx/f6mdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzHlJK+L; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzHlJK+L"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53438aa64a4so1907111e87.3
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 02:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616604; x=1726221404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7X2Xh0ujGrsD7XLdOVkG1Q9uI5zUCl9XCuUp0S4dSk=;
        b=xzHlJK+LiNYGAeFSyJoBi+3VYAHhzzgEaMk2bgF3Ov/oWgX/EkXp1u+qZCMsRBpl2l
         T8OoIa1ug5AyUWjB3lZthTOlWYUmfUd5p8R6+1nTwJlbMtvkqZ10eJAJ9hZsMjRkHj71
         48ELJActFXFQgr+awmKhWQA4Y/hb2faq11luhj5yCCddakSliWPO5JdNKswMRKWnD+6h
         RC8eHajFsaRnldzroIg/nFOguU24RDDc8gd+hSyfjt6ayBLmLkSWddclpPNV076hreJh
         6Nb7m2CUG13LlKSWS9hhORp2yCG2I93qyTOQoVG5EI16IcPvds4YFr7Bwk6eFcZotywl
         iBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616604; x=1726221404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7X2Xh0ujGrsD7XLdOVkG1Q9uI5zUCl9XCuUp0S4dSk=;
        b=Q2tAWXNyhEvsuJq0TtABBxVSPK3MJ1rkn9cs+uIYDRh+VzK+B5SNOisPztrh1b0Rpd
         5nMp5dm6/5K0Cr4MXhISkpUwF07YZ9HCWR7UlCDz5k2kwyKlpBaTLZ+Y+4P/diuNZYAO
         KKFj91qR+C8CYzsKRqjq/MIx7j6x7SBQB6OrHpwhIkmhHzfkjMncxZfm+LuVsC7rn6XF
         nWsXhQemvUaANUq9BcbNPQjM0w9iOQ1InzVGS7XvItEJscsDJneSJNMa/kh06FSlMu0V
         BoV3ZqTO5Cs0NN+9MVAt6N5oYkBllh1RgZQa4HGyzclAtDRSN3ZEOTPjEv2QF6FYCnLx
         D2uA==
X-Forwarded-Encrypted: i=1; AJvYcCUqSoudSskCN+JMxWkrYKMAxcNLH8SFq2lILYABRFS5hOVUI0/ye2f4KRW1mMFuXpavfrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBzWwTFtWOqAxfsWfeBai8Bu5z3Q7HmKPNFGeZG04ZscvN0bwa
	2OZZaDHX5GBSyxgrDA/igO3kzwgMLpo5/TVKaSuo5FSb4APczXAGLSUV3GcQYDg=
X-Google-Smtp-Source: AGHT+IEs+f3/lMz05DgMGhdz1I0Dt2XeUWPF2srVsMsxiPAav4qFxYVkM40Qk/zvavp7We66+tgSQg==
X-Received: by 2002:a05:6512:3b8c:b0:52d:6663:5cbe with SMTP id 2adb3069b0e04-536587a67cdmr1158176e87.12.1725616603764;
        Fri, 06 Sep 2024 02:56:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53657a4e071sm177209e87.13.2024.09.06.02.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:56:43 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:41 +0300
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
Subject: Re: [PATCH 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <lzpvz4snaamzieuurwztw4s74glg7dhu6mpqpcw2apck3dbuap@76sqzcu7hmye>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-4-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-4-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:23PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the crtc")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

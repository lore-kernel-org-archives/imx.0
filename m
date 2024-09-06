Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81E1C9DE7
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616625; cv=none; b=bjzFIYwyzrIlQZFfSsxpDhu3yidvV+SDscrASSLDq4FbJYmK1GODPgEhyNDBqiCbwJDgqQRnHW5y8pLPwcXT+B+ouVBW0E5aRDoQ/ZYzlFwToORbapsdEnbKgjnKSU1qYBGRmBGK2gulNpEDF44Nu9X3zHvwEn1uOZVYVv+iA7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616625; c=relaxed/simple;
	bh=xGL9BcAcyOyuyKpXc+gqYMQQ6t4wlZm65AqsKYyQfUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHA8RxDa7imbOrgI5zAlaVxvRMuK8wU3zWXAvZ1ekZgPMS8eGGxpmH+L9J0dh5bRx5NS+FdBF7jMHGfQSIfswep03t8TQMW04/YHi+A77FFdXkbha3fwhvbkbs6BX0Ke4kevYQ89WE9sMYO/lV5ZkBSOXNHrKRKlwQK2liZYJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wx0d6c02; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wx0d6c02"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f2868621so20465951fa.0
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616622; x=1726221422; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
        b=wx0d6c02F6jor5pnwxN5xMJNyvEcM3zdROd26Xz2RYRk9lH/a1kiZCaZ4Noi1RC3AG
         pBhpdSx4tbRjqlyp6SuLDlrqo8NKlU0/xHXrZj+W02WNzGw4YO00MqTKnOXnUemMPFTl
         93/+0iRIWAu/m+H8Z0lIeHqMcWUOpMDHY9Aui28qqAcIc2zrjlw7MnC+dA2RmuUKmiA5
         +d7PVDPefBWB3NcatPusXYbfD9HgAsy0mkB5ByoajiwedkgdkpjzLAqXX4G+CHGezjs8
         QlLt/ZWDn6W0gFEnZ5Kyi70y3zsbSVRZULnSiJOQm9I4L/wjppDobcjP4kLUUQr5QkJ/
         XGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616622; x=1726221422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
        b=IY4E5ECyeGb4G9F2ycm4hAUXH/HdObb69vsWmWF9tI+xkX7ZvcDRWXCCW/cvLJNSU5
         4zsCZzWzbGzFkxdPTRKX3TSH90LHJz/skuwN6qDrPwF/MfHjbiiamyHuL/QOLNf053o4
         xrb5uWtxFhXDy0eM/tredQcKhnvoKZscbdYbFHYSTxBjpb5X0dsNLv6vmK0EIEiJxNz6
         f9gyWBsKnQbSr7PIcp5ILbFShq68uzP7ur71MZaQaIehi4qJlmQIlRPBUijOGd89IcIi
         lATVcv/SVgi1sG696HSd8nTeSZyd3kqgdGUXh+UCDMhLnFqxRy0zY+nBkeLfLAYGMTCR
         ZHIA==
X-Forwarded-Encrypted: i=1; AJvYcCVcsdzBgAvm90SonaxKvoRLxgclCOmIZe271+juhheCEAshKCemYJJDI1aVG/o10mYxJY8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6GmLA/Vpeh4CBnMU8Ux2hL2qX1MSX4mGHqz15BRDcMvlCV1Xm
	D9KdpMPKGDPX2o/9Bwut/SS3uIT9eNMNAcb/jWM8y0cxyt4+edviyeC8L1L8/Tg=
X-Google-Smtp-Source: AGHT+IEGmDYtTqVwK0km1mxn812DoATvPxABZpDO9jHB/O4WvGUlolGz2aw3FT50+jxS8Yg8MuE9iA==
X-Received: by 2002:a05:6512:220f:b0:52c:daa4:2f5c with SMTP id 2adb3069b0e04-536587fc818mr1075858e87.42.1725616622176;
        Fri, 06 Sep 2024 02:57:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356988b077sm616302e87.47.2024.09.06.02.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:57:01 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:57:00 +0300
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
Subject: Re: [PATCH 1/5] drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <mwzh6et6ipet323243mga4ip5eo6jp2bxvtlzjyc2gji5kjqef@57dri4dbwser>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-2-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:21PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Commit subject is incorrect, otherwise LGTM

-- 
With best wishes
Dmitry

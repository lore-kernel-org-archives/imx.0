Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA235957
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413960; cv=none; b=HBwArzdcBiD4PwAJvHLwvS1rCs0rrVLS53XDDwyYQSW4WWBoNnue7oa6v1YK1L1rSfD+m0VNLgVu4QG34l84oDFL/1eJIQ78pdX8Yjv8HCyT7drRiQRv3m01H6g8U/vE3s/YfgPiA+N9Rx9d8yCG5oLX2PvogKIpOWX0G9BzhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413960; c=relaxed/simple;
	bh=fIUyCjQtOjmd1WAoagxHXNlbCDt6PUnMgQToMDKJOYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6ULwaX1g3iWYw347pX9He8NZbQtnLc+X5vdsB4LINXOgkyLLbCiFcJb4iCfdVxHLPfOzsltI35TN5elWWC01YovQwqFulw33w2pEbEeFNYH6ni8mW4CXd7CZ9ku5CQ5JnGYTvQwCxP6hKp/qHXDDfZ/zpv0xakn678Nz1pe81Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+benQsa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+benQsa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso68682335e9.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745413957; x=1746018757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=l+benQsaatl35QPWUVkHgU0Y3JjHWrb1XnEegf4xFtUba8Z2qKsUMHFP7uGp5q1cPw
         DynfzTXvGxPadhzRG2aeBL4CcpbA9eTAWxeD6gvhfjIyNIM79u3Kwc1ACQ2vORiHbzrV
         GalkWrzEG/5g/kgDeX7PVB8FD0qt8LM1qXvyKZ7ATA9DM0FIYXNwP0DfWOseavEdZBTv
         4kdEIyfrt6kq/ONxOMivrAAC7YPsdFL20JytoG9sb0p/Cjhia9slvbqJ25H0hdJy0Jsc
         CdrMi42VDqlvN/jxgba6g9ylN55UpYbtA4SSJbLGqFPZb5QQNDDnRJrpVugXXJa3kxhA
         Vngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413957; x=1746018757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=K5Y/H74k6h0dq3I/wnlkXgUshNN9aAPTFwUfL8l+LvQmZdCy3xMJsgSedUjgHlAnks
         O71XxSl2+lQ08OjZjUs/+hlgkEdtCgR2f63YFD1kYpQ194xIq0lfkuzKy5B1QbSUZ0HC
         YRvPo+45mpLBggUu1B/0KZAcYeSv6Wot0uIYbD8yat4CvvjW4LVsCYCQhG6B9788Sjvn
         9teYBK+WX1FG/3+gjq0Wj54oDwf+qlDQp6lPgaoSZ9Brdp4gvcD81Mk+SZdWmzZcWsqp
         jkIZqQcnxQ0Gzu4Dv1ZxDzriwiuVUKcNMKRh/O7vYLVVp7mWIYlqKJILkzK0b06Wgc5T
         jC6w==
X-Forwarded-Encrypted: i=1; AJvYcCUh4sNbCkm2eRQNHUwIhYWGbi6jZjDeLIpZpH0r7sK8rTuYiZPyTixFR2swCXwh6KevG04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykth4QaPyGaVF8gHFMX5C5LNnMSVGWhfLF9nnUx21kBDxzJkcV
	YUGqvX4wjTKZuvbCU+S8tiqLbkxmFf6VbXx+1VCGtjDxJxoQlzlSi4qRg22yjSI=
X-Gm-Gg: ASbGncvhqIGwOVzcUWhRAc+t4cJXjTcVemWpEClHP0xu8fehjh/dSUGE35toaTAYsb4
	2fjPuUZ/04TFHCEm9+uVnOdCV5+XknQuMThiSt3BIuZLWihSYqvQXmA6C+0nyyFGvz8KS7s4Xu7
	kmTG+2GgE6+8iCpzAHSai2sxsIZu+t12lbOpDAvpZOuN5daAH3Ucui15y2xOGTmQAjVuYiZuEBo
	uKlWq7nshzN39Wu4sWgOOChsPscJr6crEylSNhM8ZHBVmcWlaLyDj4Y7U6rgggkSVd6fEc843jo
	27XM0XgqzRQo4dhRdXiiI+OyfQxjmVuqj/c2dr5KWfTd7Q==
X-Google-Smtp-Source: AGHT+IFLiGEPtIUG41rtNhf8o9bC64yoKVgiB+tlF8MOvnBbCSYDUU6BGbHcm/6Whcb9nIfm+cjAgw==
X-Received: by 2002:a5d:588c:0:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39efbadef97mr14579817f8f.42.1745413956864;
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207fcsm19078159f8f.19.2025.04.23.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:12:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 12/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <09721eab-1adb-4001-880c-10ffa1961918@stanley.mountain>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
 <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>

On Wed, Apr 23, 2025 at 08:02:29AM +0200, Dario Binacchi wrote:
> -	hws[IMX8MN_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MN_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> -	hws[IMX8MN_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MN_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_DUMMY);
> +	hws[IMX8MN_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_24M);
> +	hws[IMX8MN_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_32K);

I'm just CC'd on the v11 of this one patch and I really hate to nit-pick
a v11 patch...  But I don't love that there are so many unrelated little
cleanups mixed in with the functional changes.

I also don't care strongly about something which is self contained in a
vendor driver and I recognize that re-writing patches is a pain in the
neck.

regards,
dan carpenter

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1082E6D37
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585994; cv=none; b=SaPH6FtlzFWTwqqZ0BpRQRtKqyJbNeQhezCXLq4wRAxkGxiobbxEnq7foIfaFyW74XmcbAHQWhBUSpP7It8YZQvyq1MV+jwK1SkI8JQdKddIdrRn2HoiP/o4NNdbLmwEpdLt5o04SxnY94ry0KdlsYi0gvdGhCQT1x5v9ytLl0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585994; c=relaxed/simple;
	bh=WsPqDkkR0w0NChv6i3skLUOm50mr+MhFYwPfQ2zF7hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV4fIqU6VV1dLJnF10z/u/LDeoazjqPXVP7RKgyfXuDxRO6/D64FySTnan9twAxVOv06SmAp8JHwKfr+58PbFSgca4lhg+MAJLtvJCKoFlX00xxfCHHCjvVmDixzz8kokcHEYZoN0B2LO9HLfrodunZVQ3WBbTchhgNdFW/4Zi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dko+xkiX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dko+xkiX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2532753f8f.0
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585990; x=1753190790; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=Dko+xkiXZnW8w2+iRxHaK341n6dqtOoUNqxPMeypKnmQTeRQ02pGPV4XMXOhiKEw3x
         ujmlzHowT2uS1l4owaofSvTNLVvnVZwPAAgrdjhVozRW/XSw5DnELJUBUkQ4103YV8SC
         NfRxe8oB0itxz9U/4JQtoGn4UmsL9tWScncVf4+6B9pltsKLxHwYpHj6RMedeI7QaOEP
         ohlKu7ne8VJMXZHiX0/VH4eWEYOX20ERk95/ModRaPOb8gnZdILx7QM35xnMbBNDIX3r
         U0J2mIOfVIXUseIcEcrqnbgekKc8z16LsjKAO7V73KEnvN1dCRBJ6l3jlYQe0bz1izbt
         iCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585990; x=1753190790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=bjQkzzDw2JS9BOOWNBVn68k0Bm8aWvbyYE67XqWEVEVo7pbS9ENonvZ7OMx6Jc2Y+9
         2vIIo78hRU30ckpZ1ZPn04FkNfcvLUHihsONTwDfRiWZ7CGNVW6yaaieiMrxB3iHjmzn
         WfihbszhwjCipnvNOYY5bFkcNMCKyOkfvdcEbhk3n4MpJqhF++bJZWuAqIp8RCLgI933
         HFb7kwMWaR62q099pSPHAeJTjR+kMvujOmqWFeRMs33Pq43Adj8U/ZR30eDADMJ3AE5V
         EbSIIpWBGJ1mlJi8SppHMU4a8I8Xkqfm9rNMttqLM1ftSeVJKSSpzNjjeozU6kfy9LZa
         gcJA==
X-Forwarded-Encrypted: i=1; AJvYcCUNa3x+ccSEbxxxCF5WnyvmGVmjWz+Aufc0i8u2attFnjZypWd3CCgvbZPuZGhLM5oiBgs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcCbF7pGKZgsLSLqGoEcezCRrvU/1W0RaEmIF1u4xbLGZO+5PH
	WeYQSvq+YpTvgHZz0wjuNFqasc9Zb5jRdejJiN6/ksOkgl2gdOJmFrnNwyUt5ML/sKk=
X-Gm-Gg: ASbGncvBgjUeQqVAX3inNOMFtXSPqhxtkcYVRAeltr7Xao/ztr0R63XQfU41VGrWvQQ
	Eh7aQtvKZ1480h89s6qLhxgiCFbVp4lt6UTgqND3WePd67YitvNYrROz9YQfixMtC98jr0okWuh
	h5zBUMuc6SZq5cddedPmsbyLaiJT1CXF9lEYbdI3YJGh6VjMI8FF3nLy2nNArmcRGzuRL/iaNmL
	kHipWYn8FDH0fPKdn3v9yTA3cHsVGZwwvi1dDPz7lhyZyfRRSiHhywKeV518V+OybanSHrede+D
	0jZSSWO9j5QuKq0dRhCxknNMvjfC7sdgtHh/POMEE69sHITsHz87578u/2ansxgEvqKWnOf3RGO
	/RLygu7mX7h5cUFMFmgDZvQdD8enGsl4EO4bsq0Y4YUROpDUaSkIHMs19JY0n
X-Google-Smtp-Source: AGHT+IE407KS8uKPTJWroRm8IILV/e+TMXBeoa0EGQKc6WbP+vL8QbjAW05nEN1glpgEAbE4/IV9fQ==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60463d8eemr6451671f8f.11.1752585989943;
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm15337925f8f.60.2025.07.15.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:26:27 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: Constify struct thermal_zone_device_ops
Message-ID: <aHZXAw08359qCBz2@mai.linaro.org>
References: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>

On Sun, May 25, 2025 at 11:40:04AM +0200, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   28116	   5168	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   28244	   5040	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

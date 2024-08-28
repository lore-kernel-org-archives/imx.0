Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119441AB533
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857907; cv=none; b=nDjp6CRWsoi3Kj522A/8Vi46GOQ4wh4Qd5jCAPAZqp01qdxT1jgLBrIZvu2kyX37Gs5JP9dXBrwry0LU/H7wk+rJq2sWz1abq3KQiOwBfYSO3o2dxDknEqg1P4qlCJ4P0VHACe0QmgQ6g/y9Qkh4K+QYp8YbSkgQeBmdLHFytlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857907; c=relaxed/simple;
	bh=QpYhBzV+yaoDBMQ/fcOQAAYHC+gX2LXKD1fp6vi2ZHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kh6UaMu5PzngoCDbLgjFnTcXcYVbMfk1ANb1EwT2Y/zc0OIIwvHsVXTzr9NRe6IoiX7kP8+q7sWZpX8UX4P9UPfTm5Ytou8Oedj3OUNW6L/72tDsSsJzHBc/TANo6icNCNvhRVrbtSboCPpvgypyppAw+ZcPcvFVjT2gShpAVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0kUT+fp; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0kUT+fp"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e116ec43a4aso7704509276.0
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724857905; x=1725462705; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dpwE48l/IMh8SOpKCeyLL7/+QtmITVgAbzW4ivc7bD4=;
        b=a0kUT+fp5QnefJgzousBJN8bK/TGNylim0vHemkgo1YKglT3MWr2eBaOos3e+IGAg9
         YuBlCHhIPFbl3zU6BjGVmxlDihEUKWOWati48v/grFVW8sWigDdiUVf3yGyTFzfiEFCO
         yjcX4Sl3QNqwPH90c3gPVrX/op64quswX9dwFcwS4pN2WlB1YUr4Yv8jkX4f3G38qG5u
         JUy0uV3UfU5Oco5kprN6vfd7Q7ZsZvUQHPRwyyOUrgMKORde8dMuf2J5qo9M0udMxtze
         v+wcG2aJyWr70CAwX0x8+5csADTpZ3AqVEDwK53vmbKhrcO6sIFm1Drb4f+vGDHBSYTO
         L5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857905; x=1725462705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpwE48l/IMh8SOpKCeyLL7/+QtmITVgAbzW4ivc7bD4=;
        b=gidTfJrYwnVilzQyHJZcy9FR8UE4o0Z3GK/tUJc7XR+xxcAOxDOFjyDlHQRIMd6TsO
         iD8Y5Q8tb0VDp3HCrf3hrF9vkz5jyypPmLAxZGKE7ZH0MUU8EdEO07dEyn8TI+PXfkTg
         0fQRfhuyZ9d5f/5ZQR9B6uE3YEPH+AZOIKoqsyN7wPBtvAbGKFFj6qZGa2Tg8gYy9Xto
         WFM+UnZSbKiMGQ60Iwwk1wpWN66AWodj+hqpC/Gs4vj1Ze3sG79Yok0VyPWzcvGRqTTC
         gcAWRbflc7lI2dXev/S/tejS1bpXrOeZhIJDWcuklM8p6AFPH/K3vitwuQozRXcOWwAl
         puLw==
X-Forwarded-Encrypted: i=1; AJvYcCWpMhe/GkJxrxiJv5zzZoHFKOrhmuYtXvng5eXMs/I/Z0XrE5w46sy58JIWb1SukT2r4EQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlOmhxCqcz4p8xHP+S+8z4Dunc35rMC9oxS6u8s+8iGsgU48IS
	Dx0vYGUEFAJiHb+CAxMnqoquIYn6CaswL6LePgpeVGgaquiHI0+MoqnveJNZ7c49Ril8T9Q2sFu
	bWeiaJRw9hlJDAwpXeGIRJgDgqvLl/Gvqd3z4Mg==
X-Google-Smtp-Source: AGHT+IE7CB9ls1GFKOjrUzbw5hOqUHyf+hifGdDexmkraaeqpfoek/di3j2sJAd4cp3CeBhWE+mU/vMmQSms6tlNdzU=
X-Received: by 2002:a05:6902:1683:b0:e0b:3c9d:12bb with SMTP id
 3f1490d57ef6-e17a83bcb51mr19054563276.12.1724857905103; Wed, 28 Aug 2024
 08:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240827074857.2671808-1-xirui.zhang@vivo.com>
In-Reply-To: <20240827074857.2671808-1-xirui.zhang@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Aug 2024 17:11:08 +0200
Message-ID: <CAPDyKFrN9L+u_X7Ur+j--i-tewd31EXzwCojOP+Sxuyxpk4Phg@mail.gmail.com>
Subject: Re: [PATCH 0/9] mmc: convert to devm_clk_get_enabled() API
To: zhangxirui <xirui.zhang@vivo.com>
Cc: Robert Richter <rric@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Michal Simek <michal.simek@amd.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2024 at 09:34, zhangxirui <xirui.zhang@vivo.com> wrote:
>
> This series use devm_clk_get_enabled() to simplify code
> and avoids the calls to clk_disable_unprepare()

I agree that it simplifies code - but it also changes the behaviour,
in which order clocks are getting unprepared/disabled during the
->remove() phase. In other words, this needs to be thoroughly tested
and not just considered as a trivial cleanup series.

For example, if there is a PM domain attached to the mmc host device,
is it really okay to allow powering-off the PM domain before the
clocks are being gated? This could potentially happen if we apply the
$subject series.

Kind regards
Uffe

>
> zhangxirui (9):
>   mmc: cavium-thunderx: Use devm_clk_get_enabled() helpers
>   mmc: davinci_mmc: Use devm_clk_get_enabled() helpers
>   mmc: dw_mmc-hi3798cv200: Use devm_clk_get_enabled() helpers
>   mmc: mvsdio: Use devm_clk_get_enabled() helpers
>   mmc: mxcmmc: Use devm_clk_get_enabled() helpers
>   mmc: mxs-mmc: Use devm_clk_get_enabled() helpers
>   mmc: sdhci: milbeaut: Use devm_clk_get_enabled() helpers
>   mmc: sdhci-of-arasan: Use devm_clk_get_enabled() helpers
>   mmc: sdhci_f_sdh30: Use devm_clk_get_enabled() helpers
>
>  drivers/mmc/host/cavium-thunderx.c    |  7 +-----
>  drivers/mmc/host/davinci_mmc.c        |  8 +-----
>  drivers/mmc/host/dw_mmc-hi3798cv200.c | 28 +++------------------
>  drivers/mmc/host/mvsdio.c             | 13 +++-------
>  drivers/mmc/host/mxcmmc.c             | 25 +++----------------
>  drivers/mmc/host/mxs-mmc.c            | 13 +++-------
>  drivers/mmc/host/sdhci-milbeaut.c     | 25 +++----------------
>  drivers/mmc/host/sdhci-of-arasan.c    | 31 ++++-------------------
>  drivers/mmc/host/sdhci_f_sdh30.c      | 36 ++++++++-------------------
>  9 files changed, 35 insertions(+), 151 deletions(-)
>
> --
> 2.25.1
>

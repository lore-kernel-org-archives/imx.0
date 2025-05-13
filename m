Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC628E57B
	for <imx@lists.linux.dev>; Tue, 13 May 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143774; cv=none; b=lZ/ybBBFEZxibe7A5dXcLTPgRSqMAXXKOTUKWd6nRyBv4B9W3AKkK4w3O0oAad3AHwkMbZ2db5UDx8XsSSgxiSzMlEj20dSavEHQRRqZcw5aSdpveLkt9nCwdNP8sJPqT770R/3pf6rOH/D5769aOwAabcNTqORNdFcuP15X0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143774; c=relaxed/simple;
	bh=cXtCqNVBtfHAR3Wz41FoENDIF0sXd1+ZLkqfbG9Hmy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEoRiO04Y02epqOwmgl9NBisCEIBZCp98/VfJYqqbATfkZOnQfD26I9ZnqwzYE5BHuZueIpK49uCkTdD8DL94BDtkZoC1aY+xUnFlj0C74b7CPk/fjZFGE4QYy7l08Jb2Z101jwtckFgvGkByFU6kzdsmYnzOiQmTX1Hh3XEIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDvEOTG2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDvEOTG2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so11818581a12.1
        for <imx@lists.linux.dev>; Tue, 13 May 2025 06:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143770; x=1747748570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9aJRU5NnMYxotDGMJbw8Txya51AKLb246t5s3qUk+k=;
        b=ZDvEOTG2CO7LfPiuDQF7K6tPyGjHOKaQzVOwIl4AKmwxl+gowE50Q5pVyja5pWMt+Q
         HIMY8Zgo7XxiOe/Fehe+2q/k1Gd0QYm9wK9PGIZTmlCl5UrmgWjdBzAzTs6x203cZ+EH
         E5qB96dyae2psGwnQet+SyKS/kfq6G+2h4pXyfomYE4NYN4BU2Kmhg+RUGdRmjREsX28
         G3UlcWb8cCnxxYNRkVp8YUWjKvXGziTjitjqs7ASOaBQ2wENwJW2Hf6rRb4NnSiikZZJ
         8IntfLgPjFDgZNF9KFVMcVzr3KvBP4cIAPOzFHLAWmF5MyyUDTUIUZz0TEZzLTX7g5V4
         qjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143770; x=1747748570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9aJRU5NnMYxotDGMJbw8Txya51AKLb246t5s3qUk+k=;
        b=S+wuOfPgR8EiubLfsAWm+EzdLhJEQEnBVj4sX+rasOjVfEG+evwC/LzJXUlVK2OPzk
         lsBZbLXLtF1hkvkfa38/KklRsQJY+vt4QEHW3WoZ9RilNwRrI3LGLUZOPcecy9dQVvDt
         ltu0Bumz2gVeoAWGczjzjrGGGw7ag9O/M0GsEU6tyUpRXV7fIwG337nhvnzG+2Sjpjbq
         uYA12fCVqbyJEZA0Kw/1nZmHOxZQOVYWqpIXwg3euOfujI5y4Pl5/kAhNeUSCND6oG7f
         dTvejpNU43MicsmtuxawWNyf9t200dYDYMFDngx+NEkW2rC3fnVRulAOvn5JsWypDv2x
         R1ew==
X-Gm-Message-State: AOJu0YxmyQvvL9+8LV3Azmcq+qELssYFOS5n+EKRMIJOyIjDynqsMC+A
	hpiIOptfTRzRtGeiLGZAFgyeoGnNZOjlsui9GW8dsfPPFhu60+0Ht77s64XE5OY=
X-Gm-Gg: ASbGnctDLjHBbwcn/fm+sCgRQPHJ3qZolVTDvqWBhIwpkNhaeSwj1CW9ZtpMPiJ2kEJ
	3DdJMZl87S7bdzHFtE0sG6Wvpr4e+MMlnEam/VOVrbR4sYAj1e/BrjvtyH/imGa+v/SxDq08OJv
	qXYNcIXvNdUgxMLd1JB0i8hJU/FpCuM0s1qMOmWSzh4cLaz2ICiBgCywS9jIcPF6sEcjC66uWJu
	ts0rACyc15t7mIXEIVPUxzo9NmR7e6Frij59+s3Rf2/uM+fzIJHauG4IAktXW0BRG7U6nhCMALu
	EJWqoy6fgEiKohRC0uCqKA39JOFIxdSapG3t8dAQ+mZjXO0N
X-Google-Smtp-Source: AGHT+IGfQ6YvcHSNfv2dnuJBtshq2DA0StbbcUkMKGymnYuscXLUWxhwrxXFZ9g4zAoXPV49pVkndw==
X-Received: by 2002:a05:6402:354a:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5fca0759a40mr15005682a12.10.1747143770505;
        Tue, 13 May 2025 06:42:50 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5feadd3957csm2485544a12.67.2025.05.13.06.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:42:49 -0700 (PDT)
Date: Tue, 13 May 2025 16:42:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.16
Message-ID: <aCNMWP1MF2+ATdgb@linaro.org>
References: <20250507123528.585447-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507123528.585447-1-abel.vesa@linaro.org>

On 25-05-07 15:35:28, Abel Vesa wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.16
> 
> for you to fetch changes up to 6a55647af3334f1d935ece67de4a838a864b53fc:
> 
>   dt-bindings: clock: imx8m-clock: add PLLs (2025-05-05 10:48:56 +0300)
> 
> ----------------------------------------------------------------
> i.MX clock changes for 6.16
> 
> - Add video PLL clocks to both i.MX8MM and i.MX8MP
>   while dropping the numeral suffix.
> - Add imx_anatop_get_clk_hw helper
> - Add anatop clock providers for i.MX8M[MNP]
> - Drop ccm_ prefix from base in i.MX8MP clock provider
> - Document bindings for PLLs in imx8m-clock schema
> 
> ----------------------------------------------------------------
> Dario Binacchi (11):
>       dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>       clk: imx8mm: rename video_pll1 to video_pll
>       dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>       clk: imx8mp: rename video_pll1 to video_pll
>       dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>       clk: imx: add hw API imx_anatop_get_clk_hw
>       clk: imx: add support for i.MX8MM anatop clock driver
>       clk: imx: add support for i.MX8MN anatop clock driver
>       clk: imx: add support for i.MX8MP anatop clock driver
>       clk: imx8mp: rename ccm_base to base
>       dt-bindings: clock: imx8m-clock: add PLLs

Hi Stephen,

Please ignore this pull request. It currently breaks everything: ABI,
build, boot.

This patchset will have to wait until next merge window, at least.

Sorry for the mess.

Abel

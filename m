Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C3238C0A
	for <imx@lists.linux.dev>; Sun, 28 Dec 2025 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937126; cv=none; b=UK6utB3els9BuNpNDtcwwkWudW1xe271EtLBKO/Q99QPcTps3FLyY35Wy3bB9rppV7JM3oTw1VhuMbcyQaPyRHwOGmScKrswo7DHDzU3pANSMwKw85MHKfSFPEOWXGBjfiz9ZExmE5RZC95zo8jzmYrNjenGzj0hnLNIJCZi9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937126; c=relaxed/simple;
	bh=V66pYSRi4A1St60uNsQQJZZVJDEc2XRLg87YUH4BafE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWKl8+jB4v4NYZLas3K+GNWEOQ9Ipn34e2vdLgj4Mm4qaa+FlYRJi1teQRSTMPfefatN6vAFKweP6lXusUulmZIa5wnDlNZPfERwPPn4cyGjjVa2H8cSWk8Law14WSR041KKdK31EJgRlgQSPmegnn4R+a8FiYgvuMrQYEmHFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyV9xRbp; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyV9xRbp"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37fcec29834so70877791fa.0
        for <imx@lists.linux.dev>; Sun, 28 Dec 2025 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766937123; x=1767541923; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qAheLyw1k9qY+mz/MVoVF7TVeH1WUkty9nHXwVJPAT8=;
        b=hyV9xRbpQP3ffCSMDYSkU4TqTeiSbVFgqEQdCTaa/DnPTcqogsIDj7M63797x3ODD7
         MQitaCYCEcFV6KoIqzgQXqMsItkowRl5d0DXC4pGspM5N1yBTJo+K9/0uo6DB1C/Y1Gf
         KXL3iIFHOlsWs+Qu5lyImQKJxSspXz7DCfhKA1ShUm1CxuGEkusNu4Tiy57yX16zod3L
         V1PzYoTcdTTibWoAJ0bqic/YyfTh40/RhT+7xAgxVgXozJr0CQj/gilrCkVDLFvAzi0n
         oLanP63N5cReZbesrcTGWJhPeqDDlZp7HXJiqftOwKyyv2U+nsdbwdtyQItLV5KD8twq
         DbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937123; x=1767541923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAheLyw1k9qY+mz/MVoVF7TVeH1WUkty9nHXwVJPAT8=;
        b=h+wCgQd9av0VxyjKDgaDuRSxgz4jNDocLEeKFg/c6G5fryt+nmw15C231hPwBWrZj/
         6QLgLl/1ALk4KzZtCEwinlqTe628rp2WnqFlkmmEWE8A36RntRxTb7lU9ddmDWSbVbwv
         XuYrdIPB4MF4xZWnobmnmjQHyIVpL1nieuK5oftitYnnVX9uCeHZNBsXmlJndMuMFlUe
         OeCbuoSjcdDUd9uvUfSuMuVK1T89tGyB8gS8xjWEqDG6JXQ3knESQiugyaoCHHkkKXeb
         oqsWL9BgdRpGYhfVRCvjdYwiDnkSCr0pQ06X/wNtTdjbrnsW3SM43vNgucgUi5Odec8c
         GzKA==
X-Forwarded-Encrypted: i=1; AJvYcCWW1Ckg4dncjkKjSu5j2XuzWULOalPXowNfFRYQoyc0KhcUTtjnxhonXmkMtF0jr5Jlkrs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH7PtJRaF80OPkHTwy7SbbDr6nFckfd8KlVmpf6/0TUfhB8A51
	YibfNVxTbV3v4/5P/kWwIQG8ulg8bhHe51BLmrFuXYya8Qdg19Boe/Ufi+Y2cRisFyU1OYsQsyn
	9Rxc2NggaYrYWlI78WHyt+PcBQpSfaPMF2zPrnq342Q==
X-Gm-Gg: AY/fxX43lQpC8QFPrq8x8skjYdS5OVZ50qKMR6OdVmXznUb4YjTLAVDVknhKwo6JW7e
	Thcrh1jRm+1IYJNoynseRnDkdDSIEEL6ulwE9oxLaB5GWCivFb3LE/RrgcxZ3+bTC8AoIHGWJ9X
	vo1BPKJCIsVZBOt/aG87dZIwQ7vjAuJq8d3JzNmV/XksIKMsniDjWjE11TIJ3DwMo6ULtjELwAl
	40g0vamIzOn5cO09INwMca7MQ7pWMdchGhBNQWhSccmC9A6bI7vc/1NkYJPoDHx6q68D8fKw0jy
	eL0xOTU=
X-Google-Smtp-Source: AGHT+IHDXYiOjycsrIKZ7zOp2mbTEo2Zm5sublU20unZSOVOyEDUtBbKhYfhPO49TVyqnesEU9CtfO6gW6oj2nEpfho=
X-Received: by 2002:a05:651c:111b:b0:37a:3768:3b20 with SMTP id
 38308e7fff4ca-38121689bd2mr77622181fa.39.1766937122775; Sun, 28 Dec 2025
 07:52:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki> <15658107.tv2OnDr8pf@rafael.j.wysocki>
In-Reply-To: <15658107.tv2OnDr8pf@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Dec 2025 16:51:26 +0100
X-Gm-Features: AQt7F2q_cycC7hMecsrMvd9LXqesqMPWAqlcKFduTzmro2KUI5Ojv_wP0hLSjhg
Message-ID: <CAPDyKFrgXG5X-y0teE-wVvqaeNepStMN3=0M4zkZs8Kb88U22A@mail.gmail.com>
Subject: Re: [PATCH v1 19/23] pmdomain: imx: gpcv2: Discard pm_runtime_put()
 return value
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Dec 2025 at 21:37, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Passing pm_runtime_put() return value to the callers is not particularly
> useful.
>
> Returning an error code from pm_runtime_put() merely means that it has
> not queued up a work item to check whether or not the device can be
> suspended and there are many perfectly valid situations in which that
> can happen, like after writing "on" to the devices' runtime PM "control"
> attribute in sysfs for one example.
>
> Accordingly, update imx_pgc_domain_suspend() to simply discard the
> return value of pm_runtime_put() and always return success to the
> caller.
>
> This will facilitate a planned change of the pm_runtime_put() return
> type to void in the future.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> This patch is part of a series, but it doesn't depend on anything else
> in that series.  The last patch in the series depends on it.
>
> It can be applied by itself and if you decide to do so, please let me
> know.
>
> Otherwise, an ACK or equivalent will be appreciated, but also the lack
> of specific criticism will be eventually regarded as consent.
>
> ---
>  drivers/pmdomain/imx/gpcv2.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1420,7 +1420,9 @@ static int imx_pgc_domain_suspend(struct
>
>  static int imx_pgc_domain_resume(struct device *dev)
>  {
> -       return pm_runtime_put(dev);
> +       pm_runtime_put(dev);
> +
> +       return 0;
>  }
>  #endif
>
>
>
>

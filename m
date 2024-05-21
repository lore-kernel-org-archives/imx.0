Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828AA53E31
	for <imx@lists.linux.dev>; Tue, 21 May 2024 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716287000; cv=none; b=KHrVljMvlwhSv7n5RT5c7gWINnFy/xm/78fRjBAHpKIZrflmyniNiea8Yr2kCiFSkDynZCG+yLCxvRaut6k1CF+tdHuTkZqEA0MJMhj0Viebq42ifMyH7EIe5bloRw0tH4fxpuZ6hFkQokaR5AA2oX3EP9U2iKLRte0nQ9miEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716287000; c=relaxed/simple;
	bh=lNI0Hg8IC9ycV+6uxxjEMkC5MeHystRDrTQLKIOejwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvihmSEvrXL8Puyku7YKBHVp4mD3lBZS11zB20rA7inK1GWUzt0YQ8xKwjSIAr4f+kIBAQYNXl5W/PoD6cOuBB2J3WBqzZbZKFtpsOrBWO/q0ixhiR0Z47v7chzlLtJ3MCnNktkwPRxl/muHgO+Ru7iI5MtxtyrnqgV61BnmUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVnfHEbx; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVnfHEbx"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-deb654482bcso3600316276.1
        for <imx@lists.linux.dev>; Tue, 21 May 2024 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716286997; x=1716891797; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eQal9jlDbLEH1BqRzTobfVTZmQmUTVx0/uC+Hwtv/IM=;
        b=mVnfHEbx6OzJpQ7aZLJ8XTa/Qm7P4jtbGnxC86gd6yVwyzb/rIQDDKhOQ/5o7muQ5o
         INu6xIsK27SYh9ihiqEj16gJCzDBC6wd6cOPO56vVoLLaQPyqYQlAgSpxCd6QWRcZAjW
         owMhvSa9nNbxqc40+px9Fi992cViWCTK4/8zht+PS4hsoSnZlpKvAotsUjG3hp+8Jp6h
         97KzxWN8g+uBdij3lJjXbmNtco/rk9T+D1A7Zp5ak7tP/XFRIdqFiz9GYLxFsldLsgnw
         Ct+U0mXKU7hGfIgnq57xdGSvv8FkuDaabeLS7rO9amvKrEA21SP4g1p737DN6ECDSyPi
         jx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716286997; x=1716891797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQal9jlDbLEH1BqRzTobfVTZmQmUTVx0/uC+Hwtv/IM=;
        b=dXE2l7remRtUhpqcKY1oJlwH8wY/yMwznrcTiZQ0RiN0lBdLCyFwrbt5eTixMEOu9G
         z5i6fO9azNizLJlwBy8fhip34qya4OnmMl5IP3JGO7FtrJFSQBMj4i9S31ga8veuUX8t
         ytV1peFYxQ5WNRJXspOuxZ9Vlfcqvm2XipTwTIPXzRW4KX7kcwibCw1cfLfXRA50vwK4
         q62fGz3+euxt2DGdeuESydHIA+inHuUKWYcHgjoOAXCOlxzNCceZYPdzGsXukJup5a2h
         mii+Bn0KxiMlHRjpqtlqx9ATKOXq2diVk1TXNG4Plbwy9NM/VqALY8o7FkSbN70t6gc3
         JEcg==
X-Forwarded-Encrypted: i=1; AJvYcCXESCSEWftL9jvrLhT4BL4qzzENofIvexVcEO4r8Dye4wATE6NB01vdVYstWaGVD8RFuEEsfaf/Jf41EadoJjOVHRqC
X-Gm-Message-State: AOJu0YzbHmftfFylGqnIOS0+SL0WcMNooQCOzKuZ/7jIC98YzLQxHJae
	0vv1emALj/ZgCwPogYxRmbVe0GvmHipgxqb0k1y4FybWCiF4btWylWIAedhnCcxFokCFkh6pcKR
	VEsw6vwJ8R8pD/ewd7VkK5S3qHDG97zx29pDaGg==
X-Google-Smtp-Source: AGHT+IFusdwxmPQewGjPt+54YRS/caX7jsa//59b5F79W2aGKtmYSc/Hc4mM2ZuST8VV01w+uClOUSg1l5sjccug07M=
X-Received: by 2002:a25:3619:0:b0:dee:9baa:7760 with SMTP id
 3f1490d57ef6-dee9baa77e6mr22767700276.19.1716286997611; Tue, 21 May 2024
 03:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 May 2024 12:22:41 +0200
Message-ID: <CAPDyKFp4V8f0iyeRASSEu4YaCSz0m56=8ssBJ9ogSvqG1dzMZA@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Add delay after power up handshake
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: heiko@sntech.de, u.kleine-koenig@pengutronix.de, geert+renesas@glider.be, 
	rafael@kernel.org, linux-pm@vger.kernel.org, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, shengjiu.wang@gmail.com, 
	frank.li@nxp.com, mkl@pengutronix.de, linus.walleij@linaro.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 May 2024 at 05:15, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> AudioMix BLK-CTRL on i.MX8MP encountered an accessing register issue
> after power up.
>
> [    2.181035] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    2.181038] CPU: 1 PID: 48 Comm: kworker/u16:2 Not tainted 6.9.0-rc5-next-20240424-00003-g21cec88845c6 #171
> [    2.181047] Hardware name: NXP i.MX8MPlus EVK board (DT)
> [    2.181050] Workqueue: events_unbound deferred_probe_work_func
> [    2.181064] Call trace:
> [...]
> [    2.181142]  arm64_serror_panic+0x6c/0x78
> [    2.181149]  do_serror+0x3c/0x70
> [    2.181157]  el1h_64_error_handler+0x30/0x48
> [    2.181164]  el1h_64_error+0x64/0x68
> [    2.181171]  clk_imx8mp_audiomix_runtime_resume+0x34/0x44
> [    2.181183]  __genpd_runtime_resume+0x30/0x80
> [    2.181195]  genpd_runtime_resume+0x110/0x244
> [    2.181205]  __rpm_callback+0x48/0x1d8
> [    2.181213]  rpm_callback+0x68/0x74
> [    2.181224]  rpm_resume+0x468/0x6c0
> [    2.181234]  __pm_runtime_resume+0x50/0x94
> [    2.181243]  pm_runtime_get_suppliers+0x60/0x8c
> [    2.181258]  __driver_probe_device+0x48/0x12c
> [    2.181268]  driver_probe_device+0xd8/0x15c
> [    2.181278]  __device_attach_driver+0xb8/0x134
> [    2.181290]  bus_for_each_drv+0x84/0xe0
> [    2.181302]  __device_attach+0x9c/0x188
> [    2.181312]  device_initial_probe+0x14/0x20
> [    2.181323]  bus_probe_device+0xac/0xb0
> [    2.181334]  deferred_probe_work_func+0x88/0xc0
> [    2.181344]  process_one_work+0x150/0x290
> [    2.181357]  worker_thread+0x2f8/0x408
> [    2.181370]  kthread+0x110/0x114
> [    2.181381]  ret_from_fork+0x10/0x20
> [    2.181391] SMP: stopping secondary CPUs
>
> According to comments in power up handshake:
>
>         /* request the ADB400 to power up */
>         if (domain->bits.hskreq) {
>                 regmap_update_bits(domain->regmap, domain->regs->hsk,
>                                    domain->bits.hskreq, domain->bits.hskreq);
>
>                 /*
>                  * ret = regmap_read_poll_timeout(domain->regmap, domain->regs->hsk, reg_val,
>                  *                                (reg_val & domain->bits.hskack), 0,
>                  *                                USEC_PER_MSEC);
>                  * Technically we need the commented code to wait handshake. But that needs
>                  * the BLK-CTL module BUS clk-en bit being set.
>                  *
>                  * There is a separate BLK-CTL module and we will have such a driver for it,
>                  * that driver will set the BUS clk-en bit and handshake will be triggered
>                  * automatically there. Just add a delay and suppose the handshake finish
>                  * after that.
>                  */
>         }
>
> The BLK-CTL module needs to add delay to wait for a handshake request finished.
> For some BLK-CTL module (eg. AudioMix on i.MX8MP) doesn't have BUS clk-en
> bit, it is better to add delay in this driver, as the BLK-CTL module doesn't
> need to care about how it is powered up.
>
> regmap_read_bypassed() is to make sure the above write IO transaction already
> reaches target before udelay().
>
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/all/66293535.170a0220.21fe.a2e7@mx.google.com/
> Suggested-by: Frank Li <frank.li@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Sorry for the delay!

Applied for fixes, thanks!

Kind regards
Uffe

> ---
> changes in v3:
> - move change to gpcv2.c, as it is more reasonable to let power driver
>   to handle such power issue, suggested by Frank Li
>
> changes in v2:
> - reduce size of panic log in commit message
>
>  drivers/pmdomain/imx/gpcv2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 4b828d74a606..856eaac0ec14 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -393,6 +393,17 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
>                  * automatically there. Just add a delay and suppose the handshake finish
>                  * after that.
>                  */
> +
> +               /*
> +                * For some BLK-CTL module (eg. AudioMix on i.MX8MP) doesn't have BUS
> +                * clk-en bit, it is better to add delay here, as the BLK-CTL module
> +                * doesn't need to care about how it is powered up.
> +                *
> +                * regmap_read_bypassed() is to make sure the above write IO transaction
> +                * already reaches target before udelay()
> +                */
> +               regmap_read_bypassed(domain->regmap, domain->regs->hsk, &reg_val);
> +               udelay(5);
>         }
>
>         /* Disable reset clocks for all devices in the domain */
> --
> 2.34.1
>

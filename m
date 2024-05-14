Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6325180A77
	for <imx@lists.linux.dev>; Tue, 14 May 2024 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715724515; cv=none; b=J3DAfzKjbq21NVZ4RVN0VLlgiwP4ixFxZe/o0F0UUXai3hDEaacZtpF7Xu2nyuulyiQ/RckZQOvPFv/mGqCK2uvvNtsG34A/iwCxpn6Vq9lJTjqUVsadaK9AyYQd+F2LEcBlY+LrGiXEASGAHpFi3sBONmVr6CHFz3esqOpq7c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715724515; c=relaxed/simple;
	bh=3mV67Ormp7F5oiTt1MWDRh8eXDI7s+aKtl2sVrW4Khg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyhZbIKOGYfTf0+H0ujaVmEqCVu/ei+8WzCn+PA77tQ6J0NWMj1fgELmLTmBrdZ1eeSTmNI1WLVm4duIHas2iIGUr48crg33ZimNSEPYrlAo2DOt0DwcJJ7Msc7Tj/wYq1Y/GEj3YMi8mPxxEHR43uE3MjHhFvewXuW0CJBxOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nj1gy2Yd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nj1gy2Yd"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2b3646494a8so4801783a91.2
        for <imx@lists.linux.dev>; Tue, 14 May 2024 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715724513; x=1716329313; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuRLCp8VtYUQRATbO4IEMxwbmMHW0kcBJ0ksfK6yUzU=;
        b=nj1gy2YdjWu2v9YvweGUqsrJ3cv1cF1d8FiWuhE3D8LVX6XYI5vqEvNPC8oClbiOfi
         sW/2XoM7aeYoUyPO2hxv+nehYbGOdwptD+QuZOQMEvRAwb6baZ2NcM0nIhXJEJbOd9CO
         a1YjP7Wps7b/owkgwOU4Lap3k1PstH+oax70QfOoEwDTEJx0hwJqsNefTpht8CItbj+s
         s8J71j6OFS30D/n51wjskNIEhYCFCj4CcD7e9nSeARKx1xJtf8a/S1kWxy73KzpzSs3S
         2KgXWreZMIJP32KSWUlPAtjnA6+fIwgyucMFQG6ZLjI+qtuNxONECJQobmiEUcdXfxrt
         ox7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715724513; x=1716329313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuRLCp8VtYUQRATbO4IEMxwbmMHW0kcBJ0ksfK6yUzU=;
        b=Y2R45Gio77MvKE63b+7hxSfwRJE9nmhpCsR3y+hV86TVfPwow3wW/dtXPPXToLpXG2
         jcjLFDTmzmFIDMRiL8U0bWlTClX8/KHE0l8lNdiz/jHPbc1sHGqNxhm3OVAQoqa2XbyT
         ZG18VYas3rLv66B3x/AISvZBoMDVSEKpS/7pl91LN4WVbhckum/kDhQaSMHbueYxShUt
         Sy2Za5xkBopLLZ7OTcfpeU+Ml0Bu2D9x5izc+kBTW5Qus9WPB+eOSmen9Pc+/c1A4zTu
         JDUXVjl+6d1Fm6sOPtw0CYsXI5x6qhLVzVinrPubYb5tRSIBS9RtX63iIiFzXoK6iQwq
         O/dA==
X-Forwarded-Encrypted: i=1; AJvYcCWsijJuOt9ESJdSK6hMRA2/WzZDcA5hud2qSZwrACjCZkiVx+/RKnBmPT8ZqM3pDUOY5k0RKIpXIxheQHiCxtnVg3/u
X-Gm-Message-State: AOJu0YxMuob2fjcF3D+M5xG7Hsuade7V9Q9Wt7cXkwlw2IHUROS8utww
	5Fzjtq2CiMQ/lTBGR/b+M4MHY+m8JTDvvvYsCe13PC8trjMhK39BQj+Z6AlKJqlpwVdyraw32ec
	bMK5XY339ebHSVpHUsxN9R6y/cdA=
X-Google-Smtp-Source: AGHT+IFNb7Lyxt+AmA9hK0cAEPKXsq+F7bj3UYaUaS25Vr8EtpIoVNPce7DtM5S+0ADADXeItV979+3908GXTlM0xjw=
X-Received: by 2002:a17:90a:db54:b0:2b6:3034:4ae9 with SMTP id
 98e67ed59e1d1-2b6ccd6bceemr11216551a91.35.1715724512886; Tue, 14 May 2024
 15:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 14 May 2024 17:08:21 -0500
Message-ID: <CAHCN7xLoW2Nydhc3y-X1ieb7-UZTm=ap1O1eSLE31LawmfRZOg@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Add delay after power up handshake
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: ulf.hansson@linaro.org, heiko@sntech.de, u.kleine-koenig@pengutronix.de, 
	geert+renesas@glider.be, rafael@kernel.org, linux-pm@vger.kernel.org, 
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	shengjiu.wang@gmail.com, frank.li@nxp.com, mkl@pengutronix.de, 
	linus.walleij@linaro.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 10:15=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> AudioMix BLK-CTRL on i.MX8MP encountered an accessing register issue
> after power up.
>
> [    2.181035] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    2.181038] CPU: 1 PID: 48 Comm: kworker/u16:2 Not tainted 6.9.0-rc5-n=
ext-20240424-00003-g21cec88845c6 #171
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

The imx8mp-beacon board suffers from this as well, and I can confirm
the patch also fixes it.  It might be a coincidence, but the etnaviv
NPU also enumerates more reliably now too.

adam

> According to comments in power up handshake:
>
>         /* request the ADB400 to power up */
>         if (domain->bits.hskreq) {
>                 regmap_update_bits(domain->regmap, domain->regs->hsk,
>                                    domain->bits.hskreq, domain->bits.hskr=
eq);
>
>                 /*
>                  * ret =3D regmap_read_poll_timeout(domain->regmap, domai=
n->regs->hsk, reg_val,
>                  *                                (reg_val & domain->bits=
.hskack), 0,
>                  *                                USEC_PER_MSEC);
>                  * Technically we need the commented code to wait handsha=
ke. But that needs
>                  * the BLK-CTL module BUS clk-en bit being set.
>                  *
>                  * There is a separate BLK-CTL module and we will have su=
ch a driver for it,
>                  * that driver will set the BUS clk-en bit and handshake =
will be triggered
>                  * automatically there. Just add a delay and suppose the =
handshake finish
>                  * after that.
>                  */
>         }
>
> The BLK-CTL module needs to add delay to wait for a handshake request fin=
ished.
> For some BLK-CTL module (eg. AudioMix on i.MX8MP) doesn't have BUS clk-en
> bit, it is better to add delay in this driver, as the BLK-CTL module does=
n't
> need to care about how it is powered up.
>
> regmap_read_bypassed() is to make sure the above write IO transaction alr=
eady
> reaches target before udelay().
>
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power =
saving")
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/all/66293535.170a0220.21fe.a2e7@mx.google=
.com/
> Suggested-by: Frank Li <frank.li@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Tested-by:  Adam Ford <aford173@gmail.com>

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
> @@ -393,6 +393,17 @@ static int imx_pgc_power_up(struct generic_pm_domain=
 *genpd)
>                  * automatically there. Just add a delay and suppose the =
handshake finish
>                  * after that.
>                  */
> +
> +               /*
> +                * For some BLK-CTL module (eg. AudioMix on i.MX8MP) does=
n't have BUS
> +                * clk-en bit, it is better to add delay here, as the BLK=
-CTL module
> +                * doesn't need to care about how it is powered up.
> +                *
> +                * regmap_read_bypassed() is to make sure the above write=
 IO transaction
> +                * already reaches target before udelay()
> +                */
> +               regmap_read_bypassed(domain->regmap, domain->regs->hsk, &=
reg_val);
> +               udelay(5);
>         }
>
>         /* Disable reset clocks for all devices in the domain */
> --
> 2.34.1
>
>

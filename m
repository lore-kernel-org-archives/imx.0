Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24751420A8
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723640494; cv=none; b=IiZCnqKAPwgZf61i0CHokr9qXJqIIOWn9QX3iluSj1iDImAW+gs4lXmKkxXNO3f2+H1KJCmABT2/o5iX8zGXoz7MMXphc97Sy4ROha5Ze57kcFzSWokd/GyQKHCGjcOL9WX7PWwS0zAtfNm+qg5qpUHYU8gudhemktlQ8z7H4wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723640494; c=relaxed/simple;
	bh=q/uJbkjsZVe1udBwRTk4Z0NblBdsbyD+dlaoHPUzTfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARiIc+ggpV82Ms/pqWv/OPB5gCWtc+4o0Izc6MJozABWJG4PxWh9YYq+uVJBbt8+n9rbkOdwGgl4btFuhQpu0HM/ccfZmCou83eYlQBIUCnuLSs/edPPJZHHwpOIe7tIaSx34FjvEkdRRKc/WKnRS8j2zP8hsKVq6+buv7xr1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6OwDKow; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6OwDKow"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso5876732276.0
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723640491; x=1724245291; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jfobO0h8PCWvLzZDgipywq+q6ry4w+xtSJdMM8OsI8=;
        b=N6OwDKowbrW7PYI6jc1dPdTkjJJAe/dC2DZAuwdqfgRhv1fPo6jOkd7iqXdrfbXHfD
         b/UqmVp9m4WETiCWIbjMJkRMIYGrTn4aJ8r1LY/Cla6lKSqyUOiSUUsM6FZ/vEl3Q29S
         5FdKijFZG4Wdtr5hIAjFKO+xbbSXa5jShnl/p3G+XbNWzR1ASqNkWmDUnaIEcFSFAUAV
         eAbP2Jd9K0m8sUBOmShb/Ny0se15ZYHvLUsGScXWrju/TS35F+lUo1rP8EY7/HCnFj3t
         ifDBuStWFoIMfQBKWmt7MONWgBEEvP+NkXH1fYgOj6hHiP+4VlK5KkDGjiJIJLZlGzbT
         bb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723640491; x=1724245291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jfobO0h8PCWvLzZDgipywq+q6ry4w+xtSJdMM8OsI8=;
        b=XdH+vqlchXexxgRrKtkzIaYyLuKbZtNulX/mgbQn9+Buo39nAfRL8T/aoLGYXxqRMF
         xBoa9JeP0jdWIh5n6GiFgtKMRY9XDv1PkqnRmdk8nGIwY2kWe0HHxF15q8uEGgeNBXaQ
         dKLtX7pYzVUxZ9UbrSE2CohQX0voaVpHce8/Ut8uagPbWf2dtSk6+/Wl9muIqOMB7lnV
         canNc7zWxzBM+kFFo+zSsm9tzDksiep+dF3FoCuA5AdIklhQ9vtYoKxS+70rvNrXCZKA
         NUJZib7dnjxbiQFbojm0rnLeWey290DNLQPwBseZrvrO66fY3LkY5ohf7GJzVY6SsphO
         9+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUHvfHaBVlTjdtlqgRnQYrVtEW88fRWYnC5VGQfLkpysXg9Y5TkRV6eLWVC/v3T04JenEeQJjEgIeJ3Nl7BSHNHzFTA
X-Gm-Message-State: AOJu0YxUjhibv0Esxye0VZ7NdAt3lTYxk+k/5Yfm9sobsIBaNx6b8uIm
	9gDTVZqx7MSRkkA2aAHQbp+r87ftq8AAJvo2qMBP9ftecRw63YiQluFxlL8Fdr8U7u7CeuVcLN7
	JJ07FG4MJdrvOUreGEBXZj4vw8/07iTXmReUP2A==
X-Google-Smtp-Source: AGHT+IHrp4Xh3i1XqddMFLTNR0pu3w38VmxhIBnGcCEYDdONQahxkdZEFtRyur/hzKD2ig6aNbR/s73+CN6uArFqY3M=
X-Received: by 2002:a05:6902:2201:b0:e0b:c402:b03f with SMTP id
 3f1490d57ef6-e1155ae6007mr2993583276.27.1723640489000; Wed, 14 Aug 2024
 06:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240814124740.2778952-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240814124740.2778952-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 15:00:52 +0200
Message-ID: <CAPDyKFrUyEfSsEdjfXGLX5NJuWaGNBZg1D+kCR=EikG42_eL0w@mail.gmail.com>
Subject: Re: [PATCH V2] pmdomain: imx: wait SSAR when i.MX93 power domain on
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Stable@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2024 at 14:38, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With "quiet" set in bootargs, there is power domain failure:
> "imx93_power_domain 44462400.power-domain: pd_off timeout: name:
>  44462400.power-domain, stat: 4"
>
> The current power on opertation takes ISO state as power on finished
> flag, but it is wrong. Before powering on operation really finishes,
> powering off comes and powering off will never finish because the last
> powering on still not finishes, so the following powering off actually
> not trigger hardware state machine to run. SSAR is the last step when
> powering on a domain, so need to wait SSAR done when powering on.
>
> Since EdgeLock Enclave(ELE) handshake is involved in the flow, enlarge
> the waiting time to 10ms for both on and off to avoid timeout.
>
> Cc: <Stable@vger.kernel.org>
> Fixes: 0a0f7cc25d4a ("soc: imx: add i.MX93 SRC power domain driver")
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>
> V2:
>  Add Fixes tag and Cc stable (Per Ulf's comment)
>
>  drivers/pmdomain/imx/imx93-pd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
> index 1e94b499c19b..d750a7dc58d2 100644
> --- a/drivers/pmdomain/imx/imx93-pd.c
> +++ b/drivers/pmdomain/imx/imx93-pd.c
> @@ -20,6 +20,7 @@
>  #define FUNC_STAT_PSW_STAT_MASK                BIT(0)
>  #define FUNC_STAT_RST_STAT_MASK                BIT(2)
>  #define FUNC_STAT_ISO_STAT_MASK                BIT(4)
> +#define FUNC_STAT_SSAR_STAT_MASK       BIT(8)
>
>  struct imx93_power_domain {
>         struct generic_pm_domain genpd;
> @@ -50,7 +51,7 @@ static int imx93_pd_on(struct generic_pm_domain *genpd)
>         writel(val, addr + MIX_SLICE_SW_CTRL_OFF);
>
>         ret = readl_poll_timeout(addr + MIX_FUNC_STAT_OFF, val,
> -                                !(val & FUNC_STAT_ISO_STAT_MASK), 1, 10000);
> +                                !(val & FUNC_STAT_SSAR_STAT_MASK), 1, 10000);
>         if (ret) {
>                 dev_err(domain->dev, "pd_on timeout: name: %s, stat: %x\n", genpd->name, val);
>                 return ret;
> @@ -72,7 +73,7 @@ static int imx93_pd_off(struct generic_pm_domain *genpd)
>         writel(val, addr + MIX_SLICE_SW_CTRL_OFF);
>
>         ret = readl_poll_timeout(addr + MIX_FUNC_STAT_OFF, val,
> -                                val & FUNC_STAT_PSW_STAT_MASK, 1, 1000);
> +                                val & FUNC_STAT_PSW_STAT_MASK, 1, 10000);
>         if (ret) {
>                 dev_err(domain->dev, "pd_off timeout: name: %s, stat: %x\n", genpd->name, val);
>                 return ret;
> --
> 2.37.1
>

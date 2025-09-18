Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E4F2FE05B
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758207494; cv=none; b=uLrUbeltV89ODgXDrKEDBo2ZIjqFLckd6NEq80dkygdPgAx2JXzEypF2NRJMKtWBFYEkOGi+6p9AncM+L1uY0CvovGBksADuWBOtjke9e77uLoSLylrItdSivhPm7F0sGt+LbL6ZTgBRYZHd2ieSVDdTW+dh9IYrVhyO2x/PV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758207494; c=relaxed/simple;
	bh=r0MGZelkWDq9qnTXZ+PtPpNy5y8QjpGTSGrDqVUOhN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsG23jSqrCQY6gA6qLhCBBcg+9sft+xxBRm2CXsbXmQgmkfsuii+EXPpFIyhaUzauSjrEDcMEvnGFboHsTzd7xHVbTFYDxqAZPAwIsG1eO1AdTaD1Z5qfRAsMb6mYjQ1OqtC9p6BHO53yKhtd/uIBpoaCQVoMhxcBK17BiOfHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qh0lHeI7; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qh0lHeI7"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ea473582bcaso2603905276.1
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758207491; x=1758812291; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=au0N8UjUCdJyaXYgEI+pwEcqeIAVB1l8ChmB40Jysug=;
        b=Qh0lHeI7p1qPQX6miYyOjsrMP3TrMJw1mNjN6kQGLqy7lU9zTMm4emGmjAKwPeeFXo
         TqhkvX0L3LoNLDeAa9jk5yRwMeS1WB7qfhQ3IAArFAKViXD+GmIaSFcsuCZzN4yKl48y
         TeHVYQVNktNj0XNpKUKzjCcHfT3aW1RY6zKXaRx+iQASEQSD9ycH1Ifu97M/kzZeUotg
         hCATdfC3Krk4a+pQ0NmSnirQPD0H+fZ+c0aEbjdM8WVO7T7aFcboQTUPlVQiBqUn9E9O
         DMO1rD3+EbOR350iA5f4sWFNfn1DC+YPrnYGy7cGJuV4pBZxyKAX1qgakbp8X1ehh/Wf
         ZkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758207491; x=1758812291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au0N8UjUCdJyaXYgEI+pwEcqeIAVB1l8ChmB40Jysug=;
        b=Rnoq9GUG3szeT2lY2X9h1On1re5d9AJ0t+vDXUpKiFJZfbeMCI97li0prxxEV+APA2
         P6u4yzy3Xi169M4JR9pGm7QCdj5lU5Vp9VyOOmMn2X/tpqLW5cWR52/puTeH0qFlmndp
         1s68Uagx+1IAcjnTdFlpwU0l2aCOtXLos5zm06SOUtmKdrOU4WsTeUUq8/eakO0nHjCa
         SU0F+XN68owjllQMO6IK/NTm0h7emqETa1jVWq8EzOVPFyjmXR1l6pjDzMmR/iqMXvGS
         d3faKZBojHdTyG26MPVTtEunuffMQiUuNev7JmrYSlwvaOciqdVk9gsSU7Syjl3vBke6
         DbHA==
X-Forwarded-Encrypted: i=1; AJvYcCWj1wT6Uzgt7g70zhgAOJgo3vCiwoYz9R9uJoQcwo0FWutpHAqF2loHDHbuYf8cLAHUzqQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YydZLHQI1BpclSSe3HevJK17Xcofrj6fXTDbRvT06xu7Ilkp36v
	ifW3R8teu3eCt4fLfqgZW0TdCn7hhmd7Ik+QgF7OcaURYvC9SZTDjUxpCz9DtL9d+D+cd7hYTzN
	0xf24ix9IzEE6PPnR1c9Sk6kguBdpzwHS/NXyDK2Dxw==
X-Gm-Gg: ASbGncvF8RIsR36QG7NFDKEo59zaUUVMLSA3kDnh8uhuQ6myi1vMlMJL4IIb+r6IR38
	rTD8QAL7VL2S7p4kaVFbNnNblhR0jfRlTsFY2Cc37MYRU20lwVoGtGLqLovow+KLRPC6pOQbGhI
	97FUeGNhI5H2PsPVmKcg7TNJIwyeVu0fIzPnaipCvxlyONm1lS2cmZqiR5IAs8Tk1rH/JM/jJZN
	tiNYiG0WakqOsb9e7wKxkxJ7xs=
X-Google-Smtp-Source: AGHT+IFu/Hil6zUPihFVRvZ9DUy8R4zMDZj2S8OaE0GEEgl5Uq2FPzOER6rzX/6cmX1azbC/FOh27T6/OPOtiqBGMW4=
X-Received: by 2002:a05:690e:2515:b0:633:bc86:a1d2 with SMTP id
 956f58d0204a3-634773d6120mr24947d50.0.1758207490799; Thu, 18 Sep 2025
 07:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 16:57:34 +0200
X-Gm-Features: AS18NWDnkEmKtjLXZgraEdCqo9-wmrIQesU05v7Yd2QIwo9qUnvKejYI9I4FOEI
Message-ID: <CAPDyKFrui-Vr1rvE01w+n4ttWeUk4cmr2jqgqk0BWe98eQtkcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pmdomain: core: Introduce device_set/get_out_band_wakeup()
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> For some cases, a device could still wakeup the system even if its power
> domain is in off state, because the device's wakeup hardware logic is
> in an always-on domain.
>
> To support this case, introduce device_set/get_out_band_wakeup() to
> allow device drivers to control the behaviour in genpd for a device
> that is attached to it.

Would you mind trying to extend/clarify this commit-msg a bit more, to
make the benefit more clear.

For example, today we may be wasting energy, by unnecessarily keeping
PM domains powered-on during system-wide suspend, when a device has
been enabled for system-wakeup...

In regards to terminology, I would appreciate if we could use
"system-wakeup" and "out-band system-wakeup logic" and "system-wide
suspend".

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pmdomain/core.c   |  6 ++++--
>  include/linux/pm.h        |  1 +
>  include/linux/pm_wakeup.h | 17 +++++++++++++++++

Please split this into two separate patches.

>  3 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 0006ab3d078972cc72a6dd22a2144fb31443e3da..8e37758cea88a9ee051ad9fb13bdd3feb4f8745e 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1549,7 +1549,8 @@ static int genpd_finish_suspend(struct device *dev,
>         if (ret)
>                 return ret;
>
> -       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +           !device_get_out_band_wakeup(dev))
>                 return 0;
>
>         if (genpd->dev_ops.stop && genpd->dev_ops.start &&
> @@ -1604,7 +1605,8 @@ static int genpd_finish_resume(struct device *dev,
>         if (IS_ERR(genpd))
>                 return -EINVAL;
>
> -       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +           !device_get_out_band_wakeup(dev))
>                 return resume_noirq(dev);
>
>         genpd_lock(genpd);
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index cc7b2dc28574c24ece2f651352d4d23ecaf15f31..5b28a4f2e87e2aa34acc709e146ce729acace344 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -684,6 +684,7 @@ struct dev_pm_info {
>         bool                    smart_suspend:1;        /* Owned by the PM core */
>         bool                    must_resume:1;          /* Owned by the PM core */
>         bool                    may_skip_resume:1;      /* Set by subsystems */
> +       bool                    out_band_wakeup:1;
>         bool                    strict_midlayer:1;
>  #else
>         bool                    should_wakeup:1;
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> index c838b4a30f876ef5a66972d16f461cfba9ff2814..c461c7edef6f7927d696b7d18b59a6a1147f53a3 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -94,6 +94,16 @@ static inline void device_set_wakeup_path(struct device *dev)
>         dev->power.wakeup_path = true;
>  }
>
> +static inline void device_set_out_band_wakeup(struct device *dev, bool capable)
> +{
> +       dev->power.out_band_wakeup = capable;

I suggest we drop the bool as in-parameter and just do:
dev->power.out_band_wakeup = true;

Moreover, I think we should clear the flag in device_prepare(), next
to where dev->power.wakeup_path is cleared.

This makes the behavior better aligned for users of these flags.

> +}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)

Nitpick: I would rename this into device_out_band_wakeup(). At least
the "get" part is a confusing in my opinion, as indicates there is
reference taken too.

> +{
> +       return dev->power.out_band_wakeup;
> +}
> +
>  /* drivers/base/power/wakeup.c */
>  extern struct wakeup_source *wakeup_source_register(struct device *dev,
>                                                     const char *name);
> @@ -162,6 +172,13 @@ static inline bool device_wakeup_path(struct device *dev)
>
>  static inline void device_set_wakeup_path(struct device *dev) {}
>
> +static inline void device_set_out_band_wakeup(struct device *dev, bool capable) {}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)
> +{
> +       return false;
> +}
> +
>  static inline void __pm_stay_awake(struct wakeup_source *ws) {}
>
>  static inline void pm_stay_awake(struct device *dev) {}
>
> --
> 2.37.1
>

Otherwise, from an overall functionality point of view, this makes sense to me!

Kind regards
Uffe

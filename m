Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE17E37C0F8
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445636; cv=none; b=EvEWPZXGFHQ1BaB2qXCU2QrXv2C/GHyEj4Tm28YQZdpgodB4qNPji2eg2sPLx7QZd8JHshcCRSyJ+6U/fQex3WGQTrus5un88y29iXwc5+o9FFSX3JqiVY96GpNr3bb59olAoTHVOEw4HAj491+QQlCQuP8DgbFO+114HW7IP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445636; c=relaxed/simple;
	bh=4y2TOHi9TFOVkbjGDV689T/Smv9dTsRouELeh2CzMQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plmYReshc10POc5SPr0ET6AXfQJXf79HSezOHD3qahR5IICid/rwV6SuAYI7KppsJVJoXbuwc7/Gir4Aj4FrpBjSb3bkshxC75vw/xnmZBi9ZvC+xZiQw4LVnK5UxhvHT4bs1ObzxWzOC9ZpQAJfTNTK+wyOAkkfuAJuxM5ReJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8da2faf4so3547069e0c.2
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 02:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445634; x=1773050434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8HkRe6vR1zoQp8bGRDh2bo/ApHTR7KmRx9+/JW4v6E=;
        b=rozkVPGdJQqiPU5ccH+SG8TyUQS3P11tkEt7DKss/enngLlPuprmPbFcGzcscAIwks
         3ILQ78ZllAfOL8eAgZWTcVHJEWjsEW6BavJqFEOFarvcfxTmd5Lu2xLs+V85O6RZpzzD
         RBo07DFQ5bMf012aAwzb5+hLVmZca5itRACoqhpXkO2RLzyrVYRcgYqrWDqs/PQ33XsI
         B60DAX++SQD22pgC+UbUB8ZlbLDAPUBeIt6+DGqvaoNVCh8I9336bEHchcgsRO3O5HV/
         iaqWhOdS3tA701DJ4D09YkMAhY65idI7jHGNNodrcmy47TMe+TcFgTEJkGjoJZb50td7
         WkKg==
X-Forwarded-Encrypted: i=1; AJvYcCVwk6pgIGUATRkNPfbV9SW5vb9nkgorB4wfZ5cQ3huGkWLSCZS+HvxvBHdoI+j4tZ9PMpg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxL24KiZd6gZxFvyjMATNLKuLFDomowFbonJFR+nATeypFK/dUd
	NlBYu+Bg2oOxe/4/qTm24HhFs+YpwsN7tqrH7Zx6T+eoQUjsO3p7OV4l9Z+aGXhR
X-Gm-Gg: ATEYQzw//msCkun1ActzpmNk4SPuncCXfnacUl2Ou2LPZo7zO6mGPd/CjqWlp4Us5FK
	A0rt31tyrzGURq4cPUZ8XKk0jPvfN20trEQsF3ScwR7oVk4YQUb9LKPZWukT4PT5sOmmVxwHiay
	5P1ulGKp9n9q6JOnyPghmV+Jwwlf68GmaHe0pSCb3kU+T6c6b+7y5H1X5gTmCdQtMEZoXO6xMMk
	JaUutTOV5K1yR9C3pCxfTbOyG9shLGoZF9LKQlNn0UKgPGDagJsh2ee53Lq2DEwDkum1SnNrhVV
	0cQdYH+8nyK10tp5KzbGzHAoT6XhqZZJdETL3Da73BQAYWabPhpAg0tYwGb2THN1vp1l+tjHGTL
	pFQUu8EUzcoQo9M+AoWHmO4k5nrVkYsI124Yr6VFdfBhd+sdB4zq0TIhjj1Jak81l6hebn+6Qic
	y0w85vfZ/LHOBeXoSdYT6tKl/9LMLhQbpmCz5xZVIidv71t33o/Itc2TuXW/TQ1KfL
X-Received: by 2002:a05:6123:81:b0:566:341b:4ddd with SMTP id 71dfb90a1353d-56aa08cee01mr5509107e0c.0.1772445632280;
        Mon, 02 Mar 2026 02:00:32 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bbd85csm15142762e0c.7.2026.03.02.02.00.31
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:00:31 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8da2faf4so3547037e0c.2
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 02:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdREEWrcd1r5KXdOgOKHnmbKi3W0QyalJODfJ7VQZ4/wuT6QW8kajFXGdlUOFBNfYSMKQ=@lists.linux.dev
X-Received: by 2002:a05:6122:1c0f:b0:566:22e6:35df with SMTP id
 71dfb90a1353d-56aa09f82acmr5754346e0c.5.1772445631307; Mon, 02 Mar 2026
 02:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
X-Gm-Features: AaiRm52H_j84TKaKZyu39pwrVpDQPCGWPfmBnPTyHzO3FAF2JqSLhA9oDdBhutg
Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 2 Mar 2026 at 01:28, Danilo Krummrich <dakr@kernel.org> wrote:
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for your patch!

> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len = strlen(s);
> +

The newline case below is is basically the same case as the empty
string.  Hence if you would move the newline check here:

    if (len) {
            cp = strnchr(s, len, '\n');
            if (cp)
                    len = cp - s;
    }

then the "cp != s" check below is no longer needed.

> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old = dev->driver_override.name;
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }

Also, this block can be eliminated completely...

> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;

... by pre-initializing new to NULL, and making the allocation of new
conditional on len being non-zero.

> +
> +       spin_lock(&dev->driver_override.lock);
> +       old = dev->driver_override.name;
> +       if (cp != s) {
> +               dev->driver_override.name = new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

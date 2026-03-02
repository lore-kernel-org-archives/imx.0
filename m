Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567B29A2
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469145; cv=none; b=ko0d0hcTrDCFHPsUTzOPOWnl8/rEKR7983JiiwJTrdNI/Mu0f2/UDBH8QPy3w0JCMJ26Z+btu+uTaC7MRQz69ZCG+YSziNmJuSHqwSh5814FryTQWeVCEzOX0jchTWsvK2SG7HhSgJPmFv9AUhVMkmTf7KrnjJr/ZTGS3nWpLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469145; c=relaxed/simple;
	bh=ZN7ZYA3vRUNHHbGnPhwCvGjNZJR0JyldjOBVcI9neHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ8on0MrDQBPsqbLpNLk8emAhEIH9lNNKLouyAcBL2tWcR5bpAORdbOV4Y/6hdcucx8oNdB78ZirlpXzcnF8mrE/tDC01MPgQfLOgTCUVEFQjTBMyB2VS6KTCWHmi2LrFPIhcIIMoXi0xLrQloYP+sy1gm01rO0NtD/7BWIPnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a981f44c9so2006376e0c.2
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469143; x=1773073943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
        b=rz3luykjmPy6O92BuC2muoTCnY0lSdcQz3uF8j6yKtexyYnIMZ8lt550fapm3UL9vL
         fP9oVfbmqIEsIo1dorDc4BO0OJbm0WZEwaapWz6SZNJ4peP4G4PYfndO35flwNUIVU4y
         w1QAA47ylF+oqTPgH75heJpHljJt+OFLofBYOK7X1RsLxM9kQvuJbZ+RTPWPiwhGqDH6
         VMbQ2X8FGWOqd6sY4Hs8BAym/ZGkWJFTcFk+bUr0MSqWxaBNzKLRZwLNkGEKl7oNF6+e
         F1CkctF7yKNYREVQjUXkurrwem9AqkuEyx+XyTBe9T/Gq3qeocexdOD9/j+yUOYHXP39
         bqFA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgijC+uILh/c63q4bhVePpehAqlnQhiHl43ozE9kYorjB+6l+SOHrCN8yRjrLNeZWTD8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUVO36wiOEYpnE2iceRRfFDI2kV9U7dXmInUbDq8fKeSK60sjG
	jcMy6SkmTYw8TgDJ2hJeObHWXh87nIn6f70Mvv6/fI4UXr80f55lR6bmHl0VY6BT
X-Gm-Gg: ATEYQzwhFIS8bTFUw9LEizvWwQpeq9pLi+tVCG9KF3JoPzRfVPgnOe5Xom4guZhm1IM
	gTiv7yCk8+iMuXJrjoeVjjWp5ersIyUwFcXu2Q79P5vrqYD5/htLeu8E8LDVcqgUw+dornTNRvV
	bg27iwth9qWKU+cZMlSsPCLs7tKRpoyqFM0NbnPDrOlPiuobdtd9ARBUIBpPysojHSLaXwjh/dT
	tjzdKk2JEHrQJSeCXiLQkX+qeHr9vXuscwafswLbo2tAZcAsdOTFI6+7To1oK33KVEYwPIpYZNl
	ffQ8yHQ5mp7lYfyssbGKzXZm97ARiuACOwh1gMz4sGRNcCfyhpaHd8d56vlqvoC1I5hXJUq0PI1
	+QAXx6K/tGRJ6RZFfNlYnVrTiL75hEp7QLOA7hCoQXuIBBjeiH98XMpyKHQA9KV/GbhxnYPvyiH
	fskaEuqEfgalDYdMI9rx/hRV7cw7mPQ/cATuGSkrlroaXZamTaoL1AMKFNcclf
X-Received: by 2002:a05:6122:322b:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-56aa0a50133mr5417657e0c.8.1772469143176;
        Mon, 02 Mar 2026 08:32:23 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm16128937e0c.9.2026.03.02.08.32.21
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:32:22 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ff0f61abd7so1074762137.1
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 08:32:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbulomX6K9Gd+k/JnYy/zulmeNQwRmREccUDmpelHNWWWdwfPWqvniakC5FKqdcuLzWXo=@lists.linux.dev
X-Received: by 2002:a05:6102:a4c:b0:5ee:a1e5:6504 with SMTP id
 ada2fe7eead31-5ff3257ef76mr5247593137.36.1772469141709; Mon, 02 Mar 2026
 08:32:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 17:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
X-Gm-Features: AaiRm53oB2X0Qg0vbG2fw10FsfcqVt_uYNXkS-NKRd6s-Lft2nvlJyc42VLB5T0
Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c

> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);
>         if (!match)
>                 return -ENODEV;
>

I still find it silly to add a call to of_find_node_by_path().
In your reply to my comment on v1, you said you don't want to add
another helper.

Currently we have two helpers in this area:
  1. of_machine_device_match(), which returns bool, and tells if a
     match is available,
  2. of_machine_get_match_data(), which returns the match data, if a
     match is available.
But there is no helper to return the actual match?
of_machine_device_match() would be fine, if it wouldn't cast the result
to bool...

As there is no cost (binary size-wise) in having the helper that returns
the match, too, I have sent a series[1] to do that. The last patch[2]
is an alternative to this patch, avoiding the need to add a call to
of_find_node_by_path().

[1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
    https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
[2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
    https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B9438F24F
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823674; cv=none; b=XZrX627ZF4mcbX5KNwLH+2bvIMT1/EyXxpZgCL+AcRt/bqESVw8Y9KDQCn4s0xpnJqplhnOn1RToFLAqlLjjE8s6+leyXyCoU1qrMOwg36oTdzh8Gon6MneX5KgYpp42cuqxSMcwvcA/bWuA/1twRdDU6YGeJA3dLLIcN8Smfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823674; c=relaxed/simple;
	bh=1Q3Co6bxbshrYxrPl4jn/U2T1xBX3gjFWpDnRI8lYDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiJSAGggqoaaN7RKlWaYzQWlGBbqPrP7HS8+10QSKBQiF1f7Aw/Qm3/zkNjw7YSxFDMZiOzCeCeUukP+byXHuXQKmPBEYyFMuYuuUGyi6sQ8TIVVmNCzCiV7QyYmm9XxYBl8G+2i5tCJfeEz/0Y0pnvAN7Jaowz6lRhCnqWEaC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-899d6b7b073so84856536d6.2
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 01:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823672; x=1774428472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqPUDw6RZ7tI/8SbuWaBeZ31o+A7cvn/glmx6dclWwI=;
        b=HQvvWmfYAWDGjYCIOp3vmPJFXeZN+vBWRUY1gfsTlHydXvi3iSAMnTVtgXkM3jmZYF
         /+egbQE2HTMJLETforzqnV0WzfNpxzebcwAYd+q+EXTThplySsRlXXy+DjgOqaxqCt5w
         RjIzKA0xYgJYxcBtzsloKB2NmeeLrsGUnRe3KublFgTk5ZfAbhSExLmSMjYTVJEilG4v
         qdlecr0GjsO+GYBYDs3khl/szIJxDFFAXlRub1qgEpnxmfAg5Y47msf0plZqIunX4zMg
         7meWgMNqqrwWwD0gW3Aqoh9xRojF+ZthaZrM6vUF/2p0Du3iBYdkIMLVyq4rY2Se5AjO
         X8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWQDoPVu/N4pRzEPs8Q0jf4lLWp4xGq856meBHqr5+r4jJ9/eev/8RifHDiej+i0Ne7SCg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl6VGkoyU5D6cGdlzanvfhPXT9ef5e2QdRFaDPiYfwswsg/Cpu
	+Q+BLpEe0I+r4Tuo8y+Tw+3lB4oMvgXAzYpu5knl22udjIcLqG47PMy5gN6oq4G+zfc=
X-Gm-Gg: ATEYQzwdOiakEVERf7ntREaoY7CpjSFdmPnut4fPmh1OYdBn4/aVZ48Cnm5J4D6KDUZ
	dFSjvMhHDl93EwOVndge+N/POwTSbryTOMU4bZozj1k+hIRVaXn+yL6BtmsaIIPYnBsA8YqoYDU
	HWeK8My2LnUiyW0ZFf84anR1xr4O9/aJuRFBJQZhQ41b0Sm3cNhIDSY2wlDJXMJxVXKTQswvk8r
	s9zUJCWfYyzXroishlm7PXAYcZy32RPeRKVw4EPgVYorYttEyKvBJh7UuKdu8K8GjbyJsEXTT8m
	Dnyq1pDjuukAPwI186eP2kV9vV8Booh45tclEfTk7gCs3wXI0TKXrtTwAgRLvSlYcg7dXvfXWSs
	5jP4RHVt33IlfTfOJ9h06yZtCCks0PSfRxg9SFBRs1NNGPLNEyHKV9dX4IXx48u+u0O37/B3xCO
	CVlrpTVrOgTn6W27OytDQFaStiuLtEaFGPQTAD6QD/smMHcFdljPKweZ6UP6naTIuM
X-Received: by 2002:a05:6214:611b:b0:89a:3c4:5161 with SMTP id 6a1803df08f44-89c6b5dcdebmr30487246d6.59.1773823671987;
        Wed, 18 Mar 2026 01:47:51 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b90d2b4sm21014546d6.19.2026.03.18.01.47.51
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:47:51 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1027507685a.2
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 01:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOUR3ebvhJUr5Bn8Ocw8lPNdg6PwO+Wu6p6sTdj/xOOHTeJuF0gp9O5huDz8jM0irxKSE=@lists.linux.dev
X-Received: by 2002:a05:6102:5087:b0:5ff:e39d:9f9b with SMTP id
 ada2fe7eead31-6027d159e7fmr1126209137.16.1773823315107; Wed, 18 Mar 2026
 01:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro> <abkD-VLprcbbEbB1@ashevche-desk.local>
In-Reply-To: <abkD-VLprcbbEbB1@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 09:41:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
X-Gm-Features: AaiRm52_MgNfiAr79FL-62Ac0xXnTx-AfzVYThIE_IN0tF6AadQcPRzCkdJNUOc
Message-ID: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Douglas Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Tue, 17 Mar 2026 at 08:34, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 17, 2026 at 08:26:53AM +0100, Wolfram Sang wrote:
>
> ...
>
> > Thanks for tackling this issue! I agree it should be fixed, just
> > wondered about one thing:
> >
> > > While flags are often modified while under the "fwnode_link_lock",
> > > this is not universally true.
> >
> > Is it a possibility to use the lock in all code paths instead?
> > Because...
> >
> > >     struct list_head consumers;
> > > -   u8 flags;
> > > +   unsigned long flags;
> >
> > ... this change costs some memory on every system. Maybe it can be
> > avoided?
>
> How much memory does it cost? On most 64-bit architectures is +4 bytes,
> rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> +0 bytes. I expect that 64-bit machines will cope with this bump.

On all architectures with natural alignment of pointers and longs,
it won't cost a thing: struct list_head contains pointers, so the
struct must be padded to a multiple of 4 or 8 bytes anyway.
On m68k[*],  it will cost 2 bytes, as the existing padding is just a
single byte.

[*] Iff m68k ever switches to 32-bit alignment, there won't be an
    additional cost due to the change of flags here, but of course
    there would be a cost all over the place.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

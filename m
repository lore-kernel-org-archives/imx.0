Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C2A288DA;
	Sun, 23 Feb 2025 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740299387; cv=none; b=LDpr9S+RKJKc8TL2HWPngWaiwalgOFDANTyq+jpsyDE7qsrOZiWVgXxgqVYLP5/toH0y9qwqO7yuOzehaEbmbkTEIy9YRykNDRYkL7s9+jBkFNaxG08e4ruLiR0rfV/6bLb+EYOV3GPsrEWPmnm7B8k5pDdzfnLYkKneen7xFws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740299387; c=relaxed/simple;
	bh=oDgntAFl6wS5FYg9pbhP/ZNsiY3sual3N75erMlK6Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7K++9TqY2nBxTqUbAs7FQ6AU7BkQ0tftlcBllspQF3IkCrxtvecbRkmv9yiJ92r6YF6gbz0p3QtMeo99zcCtLyI4+6oSoBPwZAUtqSPx48k8sc1EGxFlK2xl8++NV3Tgu/rvwyJaolCI3WMnFZ0C/M5TJJ8jXoUbd1UCE7hh4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4be74b9de53so963350137.3;
        Sun, 23 Feb 2025 00:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740299383; x=1740904183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ki/B4ELY4rZob+oGFNIp8+cpQQDcjVNezaRSiDE1TE=;
        b=TyYNimjyQI2DX+1plHjtx5veS5kPxHN5prAws2xjEBR+7yVYykhZdIVZqAqNYfpBts
         vbRNActh33Nj9J+t2BamjX3gL6Cwt43dVzYPDe9jbV11QbQzXe/Yf1yr6WNUymuJHXWc
         PTUQ2WJYAXzM7lx3da92hpSLqZLP8Ad05KcW+fOkWnpnlcT3ryxDPu4UR915OKWFQg2y
         hHBSwYV3q13rD0fPRm/9DmPhTltux5hQ2bQfFZ6EBjnFnJp0U5oH0BN5WfHxYPS9i/2L
         kIIC1TOsu2amyflx7R0FDaCqNRxl3U/5oxHKuX1vvZIiHIXdhNlDFcFGYAuhbkv1LWrE
         Gdew==
X-Forwarded-Encrypted: i=1; AJvYcCU395vG5YcyARSbXJnO/ig0qpWF23zIXKVsXhyz5q+ZwcxorIdLB2U2/z7vi0iyJ2C3XI8=@lists.linux.dev, AJvYcCVGLa6YxXOBA/qSLO0egwUSdK9CKS5QBgo5i1n9DBISpgWgoD4zo0pPC7ZJyIP56xU52Zpl@lists.linux.dev
X-Gm-Message-State: AOJu0YxfO1jQ/IooYbpgj9S+qQ+TI67XxBXWohP8bYmL5wpQQkDSCIww
	mpHDCZqNdTbyV9ESkUWu2y6eAgw+BQIARCq1gYmWEzzKEuRS/1jdB6JzvGWt
X-Gm-Gg: ASbGncvS2XfcXhUqG4OYP56d2DM3a+CsFWx3VuHRM2j6J4zR1Gli1fCz/PKOpNC/z6k
	IgF8xPl0DFW6i+VZD89vlhqka/r/RgAw+tnukUZ0dyJIt9CHwHqZdxxR2GVHqbgKkx4B+WfECo7
	DXIn3Uljf9s97A/3T/UZc16ACYbsFr+uY66gB64m2NKssolbWdIy9JrZ0Ut0Mx4B0LXncmuB1/r
	0Kj7m9rginf3EDcv/H3ChG3iKh04tT0TN36C7mpBXPTRQrmkGEasb3v+x5PoStihhEOTPfMsFh9
	iUzQy0ZHxlSdibkigYGuo0wBDlnt0755rYdYOZQk7MS+MOI/010uMLUpPx/hn6Ru
X-Google-Smtp-Source: AGHT+IHyMV1Ews2Oq99Z5pA5zU4RwGgVlu07feolii/dt23wQ2UeVNnlJkLHIP1u1DRwCGITqAH4Vw==
X-Received: by 2002:a05:6102:3591:b0:4bb:e8c5:b149 with SMTP id ada2fe7eead31-4bfc0025743mr5120271137.7.1740299383107;
        Sun, 23 Feb 2025 00:29:43 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc18de1d31sm3960538137.1.2025.02.23.00.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 00:29:42 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4be625c5365so1103240137.2;
        Sun, 23 Feb 2025 00:29:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUG5Metg2mWmHjNvUxwf0OPiNI2xLtNpB6xCwEu2QxmGrtrKScS8nJTvn/UNud7AXmSxuRE@lists.linux.dev, AJvYcCVdwiUm0uV0RIsYax1NVSAIqu06CbSlkK09XahpZlljPd/mXo0JEFGnnuy+20CeXauMRt4=@lists.linux.dev
X-Received: by 2002:a05:6102:f9a:b0:4bb:eb4a:fa03 with SMTP id
 ada2fe7eead31-4bfc01cf2d4mr5204466137.23.1740299382047; Sun, 23 Feb 2025
 00:29:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
 <Z7rMdg7+m6qa0Hft@dragon>
In-Reply-To: <Z7rMdg7+m6qa0Hft@dragon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 23 Feb 2025 09:29:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=ZH7D+m54rh-25nFShCYhRhEjkjaB1LtOrRF5RyrXiQ@mail.gmail.com>
X-Gm-Features: AWEUYZmS7rXgq0ILXCQzgoTNJCt0MsAd5CmZz4lNsRJMvj13mGrXdUP0DGSg_yA
Message-ID: <CAMuHMdW=ZH7D+m54rh-25nFShCYhRhEjkjaB1LtOrRF5RyrXiQ@mail.gmail.com>
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Mark Brown <broonie@kernel.org>, soc@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shawn,

On Sun, 23 Feb 2025 at 08:21, Shawn Guo <shawnguo2@yeah.net> wrote:
> On Wed, Feb 05, 2025 at 03:41:43PM +0100, Geert Uytterhoeven wrote:
> > The i.MX System Controller Management Interface firmware is only present
> > on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> > asking the user about this driver when configuring a kernel without
> > Freescale i.MX platform support.
> >
> > Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for the patch, Geert!  But I have just picked up the change from
> Uwe [1].

Thanks, but mine has been upstream since Friday ;-)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=be6686b823b30a69b1f71bde228ce042c78a1941

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

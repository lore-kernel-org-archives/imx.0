Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBA3ABDB3
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950255; cv=pass; b=iOwJbaFetfKCNgFLQtZH6J9kXpmEXbSPx3Hww9uBiiqxwMCVPii1R06bV9mW+NRjV93JHCEOUSzjwNOV+QO/f4Gbx19m/hNnTHpR0HI2pm5Gdj4amB6jG2y7ckrTfV5IVCngjzaoUNErt2+jJu8pzRy2uW6Uhni/t5XFW8dwjic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950255; c=relaxed/simple;
	bh=DZ/xG6lf3TV658IbkqgJtug/TnD1W4FxX/TVgttLamo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9tirmlN4JOTOr1c8r1EVghyXxWb+nO6yj9doJUt2EIvKlG0nR1ARxwQAtqWDS295qI/VC/xmFoMoi+dQrIzj7JHp7NV8pnBlyMmc1lVOr6pdpUEjHja3hdeygDLWIdXuXSzldtwW63YIC5JlJL8OR+Wlm6U6n7SJwxSnLrw6oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s+ZYEMpr; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s+ZYEMpr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499add6348fso3475e9.1
        for <imx@lists.linux.dev>; Fri, 28 Aug 2026 13:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950252; cv=none;
        d=google.com; s=arc-20260327;
        b=cyjA1FjbIf1N83Z4P8Pfu7ysWW6HPSI0w084TcPZM8uS/lO2mUdUXyDm6Fj+tL+t7Q
         SyQPb/JQUUOXGA/dxB9q2KY/dHRpuht3/IvLek1CiPLMNWr5iykv6iXNPO5lbn1nL7vm
         IX6PSzU7du8P7KknbXZqMCI2imNv7UidyucdqHKCLvwDhcV22Id/QwnoyqdPPu7lm/oe
         ngSFltxRoGJBebutSWLNeHeTkFLvcm1fcpIK7/Fe97OVX2khfshGyhjQYoMmtN++7xQY
         1ZDSrPKvgQhvtyAWvSUECtru2IUxwhD2/83ca/gYNRbnSWXRgriFW/L/G/mxPCTHhzec
         keZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        fh=ioP+1V5KAKdpRCvMWzPIJ9MGuY66V+zkxkmDTXZYHY8=;
        b=C5x/YdHwobwonPPH/FQgpnT+dXiwVkOXIMGeec7JDjLBuvjHin9e7wzrliJKleeQed
         3XYXMDrqt98fkq0xZuMR7imQR3aVVSZsYQ4iqsLWUb/sw3MpWlVwtTd3PZxljb+tve0H
         pqI0sdWt2AIKKdMa1I+j2WHjEUs00wmvS62tw0UHebFzMKZKjN8NwytI+CnOCcZr5XmY
         HW4bQUDfXXY9VDMnEMH1sRdROtK5/st8QFDaIRX9gHxoKcnF4nFviUI2de24URBiepjB
         fFQQyUO0KpIzLHHVjaatf2ywiAroD/MElMK50R04EOyisJLAeMhvhM6wL1M//p9vvYNQ
         oBRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950252; x=1788555052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=s+ZYEMprWo21vnHcpixpYn1Q3KmMpiyS3XdaKsPvK5Fay4ZyV/N089tNAi2t5NPhQ/
         QD1kdstsPx0js87jaIYb9EAoh8FZz6fJ1rbkhiyTQe51RLBRw5hOkQd1c3hrAputfqxc
         zxf1fhBLWVzV+CdTYn7lhH/xi4sTt4KZ08T1+2wUsOA+i+fObANVfdNT+RHUME3hE5cB
         ixeDPwOTqiAemVP8aBjICOAjH75/S4F5i2Vlqp0st7trGbBSeEK2iCDByERY/o4Hy8xj
         YkBcTw5j6Cdy8vSxk1Y3u6ZeM7H34uArDAurfXXphNN5UsTwMemB4MHWj2UG++MnJZXy
         xQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950252; x=1788555052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=rZeZITGk6Zj4gPpMx8U98XYBkzC+bCP0CC+GqWe9BXVJsyYVtS88LkfqPhkiycji4Q
         Y6yIvmIbwg9gxtW+pI/oi0nx+Qf5od9IqfVsOXLteJu2DVnfTCO1lcyk8g7Rxrg35QxT
         i75SAGNwN+ZZF16GfDduwcO9F5diEvz4gd7dscv+cDPkfhom0SkGIL/1oEBQJu90ihw5
         AZClzRj6dma30MJiRJ3afH5GOsTJZz9qkQIsxp+y0mRvNgOiQgsVKn3ElxD1Hl2FFBsF
         4DfZH+d6C1UhuPLh4uuUxH5Kqgr8rmexJzOkfIJHEYeJkvdfBRnnBkLH2VNSBjxYB2+5
         WjgA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2UZ3rTbQnNXrznZhFO21Q6fWU4JGLgatzkVrkntZVDcXUBb5Aojc+05UeapI1dGnUqgE=@lists.linux.dev
X-Gm-Message-State: AFuF++ml1nOf1ehwytkq8YrPayyEwARU3aHSjsMb1mtihUQO2hVxAfOn
	atN+L8WNwVOXEpgUBtLzsTskzOBnlgdfIYIth9j2Ix9Ka81UPOtemPgb8UwIvIUUWcOSY3Mlpmc
	HK8HxBudM+AZNvfgkbSvS7leloMP9Ef6bscTdUWy3
X-Gm-Gg: AR+sD12G7CtzhLwrjkDiZKVtL2dI+79w495PMSYxd6V/7MJHBeJQ0Cs/u9a5J+6NdEn
	lI4nmfnKPzCUvxhnJJ9tNC/MA6lFvM+E5sIwVYQN7bobOrXZ9i0x1r9t9GtJ/EsgpbY3Yjdh76w
	9zKZZhKiXr/nA+eGGNie89tTJeH2R5PYjilpaIIJuwMFiJVeqkDF7SniHXtW3OXCsvRWCv5lxQg
	E7tVBod9QdBI/dnuurSdLcaQER/Kk6maIi3TfdLj+M8PooyBFIqRn1Pi6zJ0upwD3mTj2Dst1YH
	ArRaamY/pYpwvOw1kRLIN0X+zrm56/3VOhxRd6rCig==
X-Received: by 2002:a05:600c:21ce:b0:499:c3da:6f40 with SMTP id
 5b1f17b1804b1-49ccbb10d13mr260135e9.4.1787950251892; Fri, 28 Aug 2026
 13:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com> <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
In-Reply-To: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 13:50:14 -0700
X-Gm-Features: AcwNN1VOtvX9Y95_BvBjuOVh8z76AnKrtJFeJUv6jycw2oA0qmipRhZ22a1HmKs
Message-ID: <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 1:19=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
> But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
> think.
>
> Doing such an override would add unnecessary padding for each use of
> SYM_TYPED_FUNC_START where probably none of them have this fncopy()
> constraint.
>
> ```
>     #ifdef CONFIG_CFI
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         linkage(name) ASM_NL                    \
>         .balign align ASM_NL                    \
>         .fill (align) - 4, 1, 0 ASM_NL                \
>         __CFI_TYPE(name) ASM_NL                    \
>         name:
>
>     #else /* CONFIG_CFI */
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         SYM_START(name, linkage, .balign align)
>
>     #endif /* CONFIG_CFI */
>     #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
>         SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
> ```
> then this driver could do
> ```
> // fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
> SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)

Looks reasonable, but this still feels ARM-specific to me. How about
adding the macro to arch/arm/include/asm/linkage.h unless you have
other users in mind?

Sami

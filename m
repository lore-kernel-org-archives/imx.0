Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7582B37F30A
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948379; cv=pass; b=NI+Fofuiw7ycRUI5laxLX7TH+2c69feal5nzsA9nOG/j1I7NQd637jSTMu4vUJ/7AWrzqoHhdZUfSqT0j9cZVns4paD5hxzrxKhDGLjPkh9ix/UE7XOAx/+x2/OhjTawYhD91jxOJs2r8HnY3LaTU+PopSWGAPiNsnQLrPKQ340=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948379; c=relaxed/simple;
	bh=8opc2QShzrVS0PXZRlPRkpu6htUMy/gJ4UTVKwzCsDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvnTtI6qzR8t6An4M5K/b7A2dm0R9LTax72OX+YnMXRanUMA+Gkw1xcNb/jZj/cnUw5Bdq5T4RTV1vToPsohA9XHFwOXtg9yREAQhP04jEROM3ddshU/Sg1/qUUFjpyweWejhG/R/NZb1t0wraN/9YtAbtfFjT6N9Ju31G38A18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1slBYzS; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1slBYzS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so835789f8f.1
        for <imx@lists.linux.dev>; Fri, 28 Aug 2026 13:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787948376; cv=none;
        d=google.com; s=arc-20260327;
        b=BnRz9mUhbt1dqN3Vx56lfEzpOHLaF7iKblh6W2nmYinmE3/jzAQiFbUmho30QZW5Qo
         CiTakPksrmlRV3QrZrSV/mN25prRiOn2DLkysPZJhPLPr/pAK2c/6ytd6Kdls7hsO5l5
         9bgLJyhbqa7J4TiflgHQ6Q+9Wz/dRWtauaTbj5lgHM1ZMF7k2Bs9Tk0HsXUibgv+FdrO
         VjQVCbHDb56CmgfA/EO10droKh7fVzkg6mbYJqTKjX4tFz+GlX39gi89teVfG7PGpE8g
         W3A32HuW/edIVRtlLH91iGHlLafMHWfuglpTEHWHcIxKKS+zERTYj3W5g1PbEOafZE6O
         Xt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        fh=CGZ3ZgUDtSW6C/+QO2pgs46toWOk46C7bg8sbhGjois=;
        b=cfNmBMo/PnKBrSHqBYdQ8XwozifokFDndBQn0/fYtuVdooayHhdXDu9cf4GyzBCxVV
         dtZqVkDQC4Fq0LYx7lc50bFeE3FipuThSRMB9FJ0JBDSJmjmBfxhcP7Isonjp7o/svNA
         Q9FSg5dKvCINMvaAsZarkXy6nUj9PdKGp6SXciIBEBUpTnyRYZBIJezQX3XBDghg1P8z
         d+rwhYGO0LAiaRsJGhMP6S33upEA1suQK45aj9QISsXerR6/9vs18dBiwnnyNPb7hkZI
         sMbSTUxbzMl2E8OEwIjfM8U6GzNH24Me3MhLuOPSPPRCTH8bm+D/b191yjbaHbHJFtUT
         2jOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948376; x=1788553176; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=a1slBYzSKomMjlDgKft0ykbD0TfQ0TLd1ZTu1uso3QnkjFXMyr/VuW9jVcPAHUjGX3
         NdqsgGKDF24Gv0aJriiNK+FPJOKwxVsO3v+Ei5oFL04XwX3NogSV0G4BuKd5C0eOA423
         7TJ0waN2QuscEFGoN0vaDvFH79tHGK6Wu2W/tO3stfjT8KuUaW9kt+NTx9PX9a8ldHHy
         6qrgYjnkkBiAp4BB99jXNE9LAzMbSEHbOFLwrrBLuEUoN/aP0k9wvjA0vPlbWwjeSeEq
         ub41aBcOBKQgljEHq2t6rtdP4a/YeaKJEB/V7O+XSQ0Kx1TuYzN6G3nnmPDalsMGrKKo
         49JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948376; x=1788553176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=UYjJbMx+0prYLsCRlsjlYcWJlF5z0sQff7Rzboqbriq1kFpTk/5ICeNZ9GWaNVkKdj
         YmOOsMY7hnIoTVyQt0A0+CxkEmKNFnorzwaBYWz64CtPSCf6OGGe3R46chszNBQ1gSDb
         mcSTCIZafdago4Of6Xl4wEJVY0p2MnBD0oqW0JeZevYz5LQPldZuvJQdMIuNoqA2cK39
         DnmZp6S9EgvzJnOl5yzA5OVLO4FacU2HQKCnlz1JnBSuU1PSqxnGQ+IDgtbuOaAUXzAy
         jsebrzjefOKZpoHObnnvIBSo/7akfgeCk8/69OKwzsyBfym31rQXm7VdhH5dzw3pCUv0
         dMjA==
X-Forwarded-Encrypted: i=1; AKwUvBw4wdfbyqVT5ullMGYXV+ixGLGGNbO/RkGHUv31ayafLjlEoVwIyxZRUgybcdsq7CWIbi0=@lists.linux.dev
X-Gm-Message-State: AFuF++lStnWZfVb0p5LSUE2Vh0PIjIOFSYi9l/wqs+Lxe/b6xDcYHvv7
	F442jBF/+6STwn6IxSJS1fYUODNAxv16wdC9Rqy4GM5CSya7uEL4lJnvMmikVghXiPvlzo/tMng
	QZo+lo0NHcx1DJ8y5nA3K89Q3RwanHwSDj3OH2KbE
X-Gm-Gg: AYBFou0R8UCqP6eil6j9mq6rEQO5rQiByQyLSh4KIWrrmA/2nX/soOZfI1fqXd7mW4B
	Mhfoh0G4++NSadeHY6mQtWU9Lz8awFsyDx7qKLVgMFZ9Zeq0EOxPLXB7h+7EdDL/X25hnD4no6B
	H+SwnLhfOs4oxPWng/XNx7d/eTVw+MUpvaN71Gk6AYrUSSH/mg0d10EaXdkUv2LLATmcsEGMmlL
	zEzg0sb8xXrdVSxBNXK6Q5AG9EjHKZmyFsZ18KOSM26nM/Hc9xgDGYL3jK5IxAI1FwqGCoYtfoF
	7+/PL4EKleulK5k2oHFBk9DKpc+Ull4JJAwXbDQBPNEiAwyW6wIhi9LeRCAvDxqzMhPRSwe8Suv
	LeZnPoz4TQZGnyJdz33d8a8GpHV5O21iJ6AQjJzrGv0Zyatd+xtuWemvgZQ==
X-Received: by 2002:adf:e191:0:b0:482:e6b5:61c with SMTP id
 ffacd0b85a97d-482f7983567mr15853702f8f.8.1787948375179; Fri, 28 Aug 2026
 13:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com> <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
In-Reply-To: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 13:19:23 -0700
X-Gm-Features: AcwNN1V_2kf8BqMVIZlH3wMy_YFAxnJPsfByyKc8QzliKU08PTCWPTO7ull2SPI
Message-ID: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:45=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.c=
om> wrote:
> > >
> > > Note: linux/uaccess.h is included before linux/cfi.h because
> > > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > > include uaccess.h itself.
> >
> > Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.
>
> Nathan fixed this here:
>
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/

Ah! Then this series should probably be rebased or include that patch.

>
> > > -ENTRY(imx6_suspend)
> > > +#ifdef CONFIG_CFI
> > > +       /*
> > > +        * Pad the location counter so that the type hash emitted by
> > > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > > +        * fncpy() requires the function entry to be 8-byte aligned.
> > > +        */
> > > +       .align  3
> > > +       .4byte  0
> >
> > I still don't like these assembler directives inline like this; this
> > feels like we should have perhaps a new macro in
> > include/linux/cfi_types.h. Thoughts, Sami?
> >
> > One that garuntees the 8B alignment of the symbol for w/e that
> > function patching routine requires?
>
> Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
> alignment is needed?

The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
think.

Doing such an override would add unnecessary padding for each use of
SYM_TYPED_FUNC_START where probably none of them have this fncopy()
constraint.

```
    #ifdef CONFIG_CFI

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        linkage(name) ASM_NL                    \
        .balign align ASM_NL                    \
        .fill (align) - 4, 1, 0 ASM_NL                \
        __CFI_TYPE(name) ASM_NL                    \
        name:

    #else /* CONFIG_CFI */

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        SYM_START(name, linkage, .balign align)

    #endif /* CONFIG_CFI */
    #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
        SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
```
then this driver could do
```
// fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)
```
--=20
Thanks,
~Nick Desaulniers

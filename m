Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC3E346A10
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942754; cv=pass; b=VVny6gie+d/QSDstzGUkK7kP+NdhjIxJm20xp4BSKuEKy86L1Bknyc0CPgXhSD2cZcGT8i0CzOtQpmRnck37r4TXhVXlrhvD4xq4ffXtg0+3YwP7ndatMEWMJzsS9h9goWRolh3ycYx2un8NJch6gJrqEZx1wEquouuEz2TFwC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942754; c=relaxed/simple;
	bh=ge4Ljtv1uU3tLDv0qn+CogzzM5fRFylDnv9OiKMMdUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VuVbwuSLEOiN7lZIUW4mJsUFT2mr3V/ZaxWgdWlzrZkcfk7U1LBjg8mhl81pEQg1MQwe73ETFwnwu3bVl1KYMl2DZW7+JWit45QrsASaWukHP0bfpSXnef13bk1rRw473LqpVzPjQvabZVRsNw1asVRtrVQr+Tv8QVI5SSnOZOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1jxubSq; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1jxubSq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499add6348fso6045e9.1
        for <imx@lists.linux.dev>; Fri, 28 Aug 2026 11:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942751; cv=none;
        d=google.com; s=arc-20260327;
        b=cIGBX6rrZaLNx+sTRFESZtgDaXFfuBxCVfPIb2OYohDnE7KdKQ8zewC1NepoyzUIN9
         b8cDQYnk9dh3Q5Oz1BUFqMpBVCosO0yLV/Jb0QLCjvjA6Nd2M2tsW7dP6jtYAW9iVflL
         KD4yN8FihfRIL4yi1+shetxuxUgPGdWJwre9x4zhduW9L8agudx6MvswPkC8jgnkGOi6
         YZ4xJRzZ5RtwdP2wGGpw1qLC4oIQ7f3JNFy25hcULJFWOqS060f2wMNwe5yFoTp9mTIY
         +9TOasPnG4UzjPVMLreSvYyEJuag4kJjhqERsL0RVX1EiuD5cbO0xkTus4eQbh7u6NQp
         aOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        fh=tTuhpgiNTwC8pe+2K/vw258DP7YSdyTXfrpExTq/wow=;
        b=C7LItmVej3jjcgNUQzyeGY2z5pBnj7P1IluCKXvF7WgTg4U7a1MHJGoHUqNlDIooEl
         p2h8WGfylP2QrJqgNA/DO8+qRH/hKgZkXf9NKaOtK779VDq1QgXhdTL9bmYrNOLwTfgz
         U+DbkrUceQgX6N4WKuLEGaJHrl3rxWG8WaB25zc5B4bJIOR2+dj0h8oaPzEOalp6uH4Z
         9BxItiehicj3cOafCDPjbIF357kCAGrmzZSxxuwtIWcDnYbA5YZhiQonRUXMDiALz7/T
         wOdEOabsje4pN1mruufyKFwgVykpPMT6PIesxpdyhVZr4J2tSpS5+RfOuTXnlV0owrcU
         LsuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787942751; x=1788547551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=l1jxubSqGtfkZTBeeWjoZ7YgWFQ1jX+7t9FssZvuJ3h577THdfX5iKyPhltsFqqgha
         3jw+EX0/cQ/7v3GQBk30DC50orN1577wPfa3FzONQIlCiChS1P7gWUa6jUBNvp5jo2AQ
         WtCo/8/O9KMWRMFLZxMIiJWRc7Pa4onBgtOa+ogNMXfILd953Q/5G5cY+Bm+U0oz1q8E
         lWxRn+DQS3CsFCvG7gbWaVMgDeYYkiroZ4Rxz13dLpcv1hfO3G2ZiYzpkuyGp+ROarOk
         uEr3V9ONr8QGInx9waIQBugsugntBbvGIVI9UYIWEgMBtYBsp8RHIRSisQXpFTeXLHdl
         lphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942751; x=1788547551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=P405XNqIJMVQiE0/gNOQrxhgUx2C0t0hdASugXs+N1qRyStZdgmQsT22fhbxMJvccM
         SvEjWV1BmJYM7gmqDLABg/MpD/8lEN5Atj52C40r4gctTDrTw3tc+H/lr4FbXhJxoC8a
         JGXEsdssfJBMBnIERSS+pZdVDL2KI11h7B/+LGsjLxBFrL3uLAnc9J/o+u2VdJJuljCp
         E4IbnGPnbKBAc/Kei0XhjdSUMI0cau08tbbQwJz+gzk8ghJ1WwBlABRm2BTXEICpw5yU
         WYpqKMPy6CLQKlJbCP7g4VDQV3H/E5JDucJTYNd5FrwW0BYsgSnrOuUy2yYatnGAFY7f
         x1kw==
X-Forwarded-Encrypted: i=1; AHgh+RqzpUI7NFPCDADcRg1xHRriVRTrVS/MQ6Gt2MebZBvQVb9qB2B6YWvQ9ps0KLMfEuYfiPQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nKPNnjsG6YG2Xofvwqr6OfXled93Nu01iHnP+H29WV8I4N848B
	vTsK+c4GcVHqA5L/upywjxVXZuUzXKkPx5NdPyY46VD8chcko5+yQxcKXz16jlOUZMaw+lS3414
	NAbtUqUs0D5qOxKdtqNcF8CaYr/rG4m94NvFt0PnO
X-Gm-Gg: AR+sD13zi0xFYQKMo2CV5udX8h6bO8QrlZ+GoZ3T1gvHS/ettKDlobAF5fO1tzt14/J
	SN9vhmuIB9j1n5WIBDd4W3+Ai30AxsuY4UcuiAid1viW5mVpfBflPSSLjJB8m1DmF4Mx/jEeu5u
	xqxyA9CrL5L4o0vKRuouU4uiALikNnJeoFZCk3aJu2nyBHPG8MkZdsZlT2FCgR5KLzI2rMnTOq8
	RecKh43boBZCrkId0FvbwiWl8+im9iYjSX/AxYTb1XxuQiE/us0ep/MNGgHOjnJYniJ4daCohmb
	JhoOm01buIkunK3I4EXa0m3+w88TjdewnZCfEhAJzQ==
X-Received: by 2002:a05:600c:6549:b0:49c:1295:45c1 with SMTP id
 5b1f17b1804b1-49ccbb8a4f4mr63075e9.3.1787942750098; Fri, 28 Aug 2026 11:45:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
In-Reply-To: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 11:45:08 -0700
X-Gm-Features: AcwNN1Wx0I21Z8-gsT0HKzRa32m8c_GTOdvUPjQzxP_d9dv2tDYvd9upqY_kuJs
Message-ID: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
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

On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > Note: linux/uaccess.h is included before linux/cfi.h because
> > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > include uaccess.h itself.
>
> Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

Nathan fixed this here:

https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/

> > -ENTRY(imx6_suspend)
> > +#ifdef CONFIG_CFI
> > +       /*
> > +        * Pad the location counter so that the type hash emitted by
> > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > +        * fncpy() requires the function entry to be 8-byte aligned.
> > +        */
> > +       .align  3
> > +       .4byte  0
>
> I still don't like these assembler directives inline like this; this
> feels like we should have perhaps a new macro in
> include/linux/cfi_types.h. Thoughts, Sami?
>
> One that garuntees the 8B alignment of the symbol for w/e that
> function patching routine requires?

Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
alignment is needed?

Sami

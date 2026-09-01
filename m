Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350D3B83FB
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291618; cv=pass; b=GBkhDlS7dFLUNN7k4UMpPGVPTXUCyzTLVdnprq57CvEjMfTWELB3g4QwooLfaJFeBvMa7ntmSipSVJ/XTbcZ3v5iBjQzIfWJSkZvA1ndflEwc9F5Sf/Iv7GCkIuPzqGF+pph7P5FP1FlONjusOo2c7drh/lwRVVHlNcgRzDrl50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291618; c=relaxed/simple;
	bh=vPIlT3/0q3DmEJlhpdxnF5yqYyOZkdrfaCmYL1+wp2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGC60uQHVeYUDL3CHcggVrgSk2BoueTHbCcjqqHnQqO4z5MSHUkzrx9g3+OubZl0/VqqHz2WzXgBCgaEHd6Z7z/o9ghUC/PDw9pTWoTBlJaYkilE5MwVhwZtgsxd2dE4L2xiM2yvooSMRqV4wcpXNUW7lcayYPsmC4ELLXoiab8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=McgAgVYg; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="McgAgVYg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499add6348fso85e9.1
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 12:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291614; cv=none;
        d=google.com; s=arc-20260327;
        b=naxL/3wfoyLaBO2naKHqdipj7TBzA30fnlL/6ZpIqSC6l+zu4AYu2c8PAOQcVO+/oD
         3IgL4s0i6mn/oUe8wyHxuLQg4s8CM53jL2SIy8Wkjhstw/NXBP8vbWP9LUbJQ3YD/8l/
         2eHJlTghAjLPi8Xny4QBgnIMT1+NCe+xnfCrpWD69jAcuCyz4jhDA2uc/UTAQ2I7mlDV
         ZGsXMhxYW81FdkT1wCzLI2a+K8P1N0DavhWKK/vEhJVoxiLGrxast3o+JdrKD9EtKjxC
         yqsRfG08Kl6TCvR58Z8VG2Wk58cipGttpz+PJQ1jWw4fH5Eyy9jlZKm6LX8uH6p4dSyo
         og/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        fh=qEPyi37TZVfvCkDnk+RhGXDAAfeXDxzfdfL/qMCHr0A=;
        b=sZuLza8tn7cjN8/cJVPo73nPcmS9y7ICpfc1MJzv1DnRDh1rJWAcVZkIZUaXMNMtVD
         J/0a3jwWQqZHG1LnkxV3PiEuZnYbX0SVvrOkpp1NhbN2xTA36imI7CFJ0mgmjjlmStKX
         KUJEeNpVdFH7SeILH63j2RvJi0x6WDk4t4GJukxSz0bSuCosDGxQVNKdvURvjQdUNWdK
         1L5YHcKgjlVVb1ZeXOrNDNa4DP9w7h7PZ9qKwbpMuBUfTjib1XWQA2djSd54MQzMFYm7
         T6OGxs0V9M4D5IU4A3L+BI5hjuBIwjMv/CJ90uY1EBoBa6znSMziGLNWd/GbNl1TeTFe
         hhng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291614; x=1788896414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=McgAgVYgNAzu7RnAVQI5oHtbuJyzYuCHk+hbFzfw5rudnokOwNwEz+/NQlS8yIUi0n
         9p6txVr5bOGRocnHI9MxRgwrnzUnVpNyEFMa4qc0TIOaVOZ07Le07izPrbsf/kYymiiM
         gcImjZq2GE5ASH/JGdFDZfJE4ve94lcZkhvxpgZnPm2fXWhIYifRUmQepBkX0koBxI0w
         MdZ1T/kfpEZXhHsBuPpQmkPHJerJ+lVOoaNN0FTdBtIyy19xV9bOLqnt2xB/Qt2qU23q
         /11ec29JuNtgzBV7L5k71xNORUmXokfCNHJc9naXlT0K51SnxBvxcQI3yXsQVOzSmYtv
         5FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291614; x=1788896414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=Iqh8USOnVvGFzoVTtAhAup/GSd2T+rz17yDopyS6C2qggYMmwq0vFQNUR9q5jy46cc
         Mt6gRsPvrb3Bn9vjzg9c5HRR7gsm2ZNYNjE2h8cqHorHbTzawzv94AvUkMVtZhfCh1Xr
         rNs+YG9WYRjltlxaslAlBZvI6JlXioBHKAwYZiVyMBaESqouIoq/mBzrCMAv2MpKTd17
         HwrgWZbW8LEyoyz/o3f86I4DO4tv2Obyawats1eL7XMGgPDZQIDxxxIDgehqc+in8x2L
         cdDwRB1nsrEOoRmN1UFbKmPzjzBlRJnY0UojWqFncxCUlNmyzF+UFdwQE5KJfng+55Fe
         vRVg==
X-Forwarded-Encrypted: i=1; AHgh+RpsgiLXY58sOG67ca5oIeH3SrmSZhAefonYyygCqkpQoT86pCtY2YpTlaq9Gk45AteX038=@lists.linux.dev
X-Gm-Message-State: AFuF++k90UHbZ5/b/DyQApyXFB5k/WpQtyorY3sTqk8QZG1gdg9fSbXS
	lKOa5spA5VYHjk+pFKQ296QXSNNKynzqr5WqB9IcEm8l+g+oyz8UZLLBMQwIBNw7LVw3iJqyy5w
	ESQ5iCMUPGv6G2o8zWLK/QWQ5mFoJE8R3WL3IUZ9S
X-Gm-Gg: AR+sD13NhHrJfRX7YEmup4b6ocJfbuRM7hx2Yd+VLTR/IRkTqLpSbFf2PBjYfMuKe21
	KB1bRuiEp/VL/YJM8A1xprfjbJ90+bNC1q8y3TZFNg0KTM4zqkwpw1HoLMTV40UPP9q9UiJ4Uhd
	j9hW46OooVVEcDfU+Vl1tssnD2FPzmIoWNzKh3qPNRNyAcrj4lTGs/OTjIpwbtSi3UDReSQdeEA
	QlqP7gxsYHan8nfy4aTH5ZkWyij6HE8uVWFAv6zvL9FrR5uuTit1KRWfbbA3qxiqcDDJYy6ULjm
	e80QNrUW/1//nx81G3/BIh3kQZwEzwCXuGKojbYSptjVRhYgPMvUXAIQj1HwapuMMcXdUkm/OQm
	K
X-Received: by 2002:a05:600c:224b:b0:499:7da3:dd0c with SMTP id
 5b1f17b1804b1-49ce462122emr115145e9.0.1788291614023; Tue, 01 Sep 2026
 12:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827194508.446733-1-linux@yoavmoshe.com> <20260830155100.1020620-1-linux@yoavmoshe.com>
In-Reply-To: <20260830155100.1020620-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:39:36 -0700
X-Gm-Features: AcwNN1XK0l8thrBV4rYONxxoAFHyd0qFWNxSTWm7rTcE9pRg3SR1YhO1gQnpQwA
Message-ID: <CABCJKuecSgC2yZ1QHACv3gfOYf+cPXvR5TCEM_t67NX-putr+g@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 8:51=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:
>
> - Add SYM_TYPED_FUNC_START_ALIGNED(), a variant of
>   SYM_TYPED_FUNC_START() that aligns the function entry rather than
>   the type hash preceding it, and use it to declare imx6_suspend():
>   fncpy() requires the entry point of the function it copies to be
>   8-byte aligned. The macro lives in arch/arm/include/asm/linkage.h
>   since the requirement comes from arm's fncpy().
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA04A64C4
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369115; cv=pass; b=C/aitxhGoPBPYTWAHWDPyQKEwqveIPtGdrXTgVwg4GIIcOQKCIDWiEavvWzvGCYOhlbb30xL0QUEM/fds+4dlZnDzXbqNtVwQGq0dOSAAqQQsXL1dqYm53XTfFg7KpUEBGDFW9ltC+Ef86Y8mZKoba8m0kRXQFjRxN5jvAwJ84o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369115; c=relaxed/simple;
	bh=CAYWGXwkwt8+u/LxyR1chbCwCtu6a8KVTc22slh2Qj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBVcr9lDciS5RakiPMjRpXzUaa+/6+U0LBFYUVfh7KfimtOSOiIrizLpUj+v8qpJFRYyInZf2YliTo/CSf4nvgCwh7tOowUdTHBPngEUeVQIzxMVwK+v0AKQEFUqjUcn8QVx97B3UQZxt9yvt3XVJUiH75DanNXnNk0kXpy+vDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trdDu4h9; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trdDu4h9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso19750865e9.2
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 10:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369112; cv=none;
        d=google.com; s=arc-20260327;
        b=Nkbgj8ci6joGToiIfDAnwl8aZ75pp2r1/dXYrwxgxyc2JGYmnq1lfda9OgdM0rqnQz
         BRQH9+8q6VjfZiNypX49W23zEL2FynuHBG8PLOWRZGK/Gg1Qrz/iCivLjh71JFmHIqWB
         CJ8r3zzs+w/5rbkt1cSlQcR6ImZFfRaCQXdPbDVqR3qu+dUwxMnK3BAkoffSCqbpog48
         3qcQLM2cYjbqcUroGARUIInie+C/AizJfOkacxIOTQSFGdvHrg6PhRhzn1j8fzFeLqi8
         qEQkR/hy63a7NqEMQ4E0k9P3Sf/VFUjJNd0elCPxGhtW2CgsQmas5wXBwpKhVMxiFAcZ
         BdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        fh=gvlI/k4c9yz57O3nkZka9uLgH08wW9ZrmZkGFUbNFfU=;
        b=SFIsUzYzGpltB+OFIZWr6TPcsMgshf+ZqAI1kBeLb/parXGDy1+naha+GXXIesDSiU
         cdgJ+vmLKtr8/TAR53wlen/dwNDn94t17OO+4EptvFtxeF/cDHrwOFDhAfS3Vv94LSGf
         cl2kZ/EPjdlvyxBLSfvS4AwkqrYgEixZOPD6WnACay1Un9+3Wbv+KAvOMTCnRQM4psKb
         SkKZZMMy7NmcTI3hykEw5YGlhgXJohpJQKOs8LsqrO79tm9VKFiRX+Fm2pEVp5j2QGm5
         zLylBfIMi/hmVA2Gpc2Dc36g0f5dK9NKfHMkxEMuSlpZcFZZOiBdZtb9T/28KxTUhwkL
         sjWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369112; x=1788973912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=trdDu4h9Z1djIVulLslgOkEdyGzr0s44zx1OgDuaVgSY4XlwSSwlsIY7p6CUFy/hqR
         3ZSXBAuhbubu+TBVVRVbSrnjmiuR5Ea+oqYaFxbwlOEe35twHu4TuwurHDp5vj/H8dYD
         AR69JfOHUK/0jQBuqTmAW9YNLz0v6jzA9rkp3DLc/TzSygAzMaeU20bBiaxaqipLRgg0
         SVN9Xug3MILXVoymRWGKQWOlSBHKm+mFrMRbG/umwGlppLEJknDu98+Qn6sJkwM+TmD7
         U0SaQ/7BLgH+VGB45pVKPA4FhuNc7QCNVk08KnSww63JpW33EHBxqt15ouXozT+F5l2I
         A6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369112; x=1788973912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=TkyMrTEL7KvsHf0RQid1fdw+/ooEwJismzhN7e6EEY8bpgJjoD5r+etmvfW6efPDMd
         0RODLyrJfebTQJEfB0Ad5aJD0MkfTY44Y22iLPZp4XNrbBscm0+sPPC3fbbLNXTuxhIP
         1v1S9df0LOHAcW3n8ubgWwlcFexu/OuNcNvBDmS9P6f/g9maqu2L0MB1BNEAZWYKnEoX
         cibCTpN20upQCXX5kQjj7K5Rw0ioNjhvgJ4ZQ9s0Pk6qCrffLC/X+qnFvKY+7xV8k1Kq
         n9+84ZYObjWcMW4Xwo29448cx/TWQHfJ91b8GYXelsMhzFrax1N1TXzBYZZ84gHpNYoZ
         eVOg==
X-Forwarded-Encrypted: i=1; AHgh+RrBzqtwLxQfUfcyKQyVim6qv5MGAhhfBfilfeikXUUAb1+SH4qc8/PImPZuY4y0dT1lJ04=@lists.linux.dev
X-Gm-Message-State: AFuF++lG+UJqXImZqggUTp2TNdJX1bKbNgZGYtFbUg9SyV3EACPtZ9oH
	ntalXaP+UJWX68Vz0n4cFS3U8NEdygcJ5y4yt2yWZK1B9RM9JXHKhfLxE1R1khq7+TxGp8mGk5j
	h8hCYoNrrbMfAhi1gipVQUtT1xEIxNAJE2ofOwOF8
X-Gm-Gg: AR+sD11s3L5OgFZojumIdH5a4LXrxo2yqKshRu9ps9t9eoUKgrCDhp8ojE6jLD+naUA
	s21pSexqsfzmkRWbLtwkhNrws9AXSeq5RXJXMS+ntUuJWZZcanRiRFEZpu/SXG5vsuA/PcWq33p
	reSXsjmPWn4AGTDGpdCXAOpnSIqhNcdY/yXmkwIE494CjlTALcYhYzfbHiPRu1MWcKd79n1nQHP
	MbtsaZh4qsBy1N3uOI8yuzRL3Bta/DINdJIIuZ2SwZ8wzRJKleUXujTtPm1Sf631jiQSu6tBgJk
	hDjOJ1cVDCj744AR/i4IYP+jixxTTbXdOhBCFBmee7hOxa7qgrjzTMOxadwBUUvaBEl8Yg1IpYK
	gzcnOaoM1bEgus18TVu6nQhOuAeVwqqCw7mm7Rr3QjPA9d/7wi1tWi+tA1bzQcs4xlQ==
X-Received: by 2002:a05:600c:4e86:b0:49a:77c1:d246 with SMTP id
 5b1f17b1804b1-49ce5852589mr112274565e9.15.1788369110872; Wed, 02 Sep 2026
 10:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
 <aphSYUS7xGJjj2gT@SMW015318> <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:11:39 -0700
X-Gm-Features: AcwNN1Xmy-BrINuLcPwv_tFccFrs29sUnSKtr5FfgrTjlEDRCX8NohA0W3QuOR8
Message-ID: <CAKwvOd=P+bnKm_wDaZjBJQUcYKvVHb55MtOLKWO4k99By8emNA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:10=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> >
> > Nick Desaulniers:
> >
> >         Is this patch good to pickup?
>
> Yes.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> It does depend on
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/
> though, so you might need to coordinate your PRs to Linus with Nathan.
> Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-=
error-v1-1-b27015390901@kernel.org/
> going via kbuild tree or what?

And make sure to pick up v5, not v4. Was just looking at this thread
on lore, and it seems like Frank you replied on v4, not v5. My RB tag
is for v5, not v4.
https://lore.kernel.org/llvm/ca86be7a-7439-49cb-9deb-8d565ca0b1dd@yoavmoshe=
.com/T/#mc0e4f1537fba074b962de6b4338f289dbb26c81e
--=20
Thanks,
~Nick Desaulniers

Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7C29BDB5
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591871; cv=pass; b=X3hW62FIF77XhospmHo9nP2kZ3VUQqAtgu1XB3FEVsaeQ+R3/BVJrbpFNhothnviWV4FTSBxQqd62cDDL1hlbqQ7UhIidx/b+OkKiuRKjD0ZVF0DMBZwwpGf9tp70592YM2S+JAb/JT5++CXT9X+KPV6aVwtxVE9uf/u9PQOaKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591871; c=relaxed/simple;
	bh=gOPNZqLp7a5HeIP9YLnnqfOKKfCkhssIhljZ/6oUCzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGJYhl63/pwp+EWOh72PeYFm42WR5ojrqhafVM59kFqIqZjpfzm3+2msoG9HHLblyzrhpA0KimBpdGJyfyEbTO0E5pF6nb/CNmKw5iTG7u6mZoWxM4+zC6g+NZrQyrIgdcTfDkRIz891mBvxITffNXCUi9atwNZL7ptcrKjy0nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJk9NMx6; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJk9NMx6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38deea72eebso338225a91.1
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 20:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786591869; cv=none;
        d=google.com; s=arc-20260327;
        b=KNkzzAfHgegSl2A9DjYPTNa7XxaQsr8R5W389EjpfU75LmptnYMIlfnhdKLUIef1CT
         S3lGCDF+9bn4kkAY2iW3HM5a6+hjbVMET13ny8Lrv37j0jMGInAnUXvON7HqmBr95iSF
         S7/2+j00E+W+3g3nEO8rn8KjQW6pPDuUDWWhllVkQT9NT7uJSqrOeCM+g8np7rjEOG5x
         csnwGHCEojcjloNtp+7gK6SMgT9Hv/QsKTu4/Z55bcrqWO1/8R6fFo6UCSLu8+LsbFpe
         vtZNLTGOQVJMbhfz5hAKquvdP6cSpjQhwiRa9eLMDXlTktg/j6xfDTtViO/bBvoOZol/
         VV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D4T9bYHXVCBlbZGZYFqh4GD8XHK8t3g1v1wjuNVx8ds=;
        fh=6JoqCZQfIIaMOso4cy29UfZr1v3RVUo/Hc5SI3JR1k0=;
        b=mVA4rqCPYyy0BPV4ld70DT/epnkCa8rtYezYe/W8qxbZnG4eMKKlTlk4DwVxFe99rI
         rPd50BOkzYlXoh/iX2e5TfY1R2UIKgwCrHSYWTBQKtyvYjJoUhITpVGGURcF8JSSTr74
         BYCoGKY1ptlm7hkIrEGOPYlw9p7v/rIDdo01Pv4+ezPmxXwcFz5/tIdx+ze2ar3Z+7wY
         YkzIvPN5asnTyzsvWCKfl/Dhylz98VpU70WpHvw8sMS9zOCaL8vH9chlHhYYF6mQE1tZ
         L/86vTJIdqmAeoW26Jo34Ugb92d6G0Uum5vwoPk6dUgx1e554T62FsCStrwrPHghp9QN
         fmPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786591869; x=1787196669; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4T9bYHXVCBlbZGZYFqh4GD8XHK8t3g1v1wjuNVx8ds=;
        b=SJk9NMx6cjURztCeqOmr3B5a0WrtLpN8sIVBstB1N00atd25YrWWOAyDaJL3nPeezn
         9S4vbYx86KY2mWTubZR6fvMnRKAh25dB4by3c2FHyC2NP3CQoqtqnXjMy15rhhUFa45l
         pFpirxuuD+UtlvZuIShOOhs5sINOu9/GuxLLGcOaiHom8AUnnlPIcKbcOJ3U4tdc9BbW
         PV8s5o4qWkUFrnj8HOBlsAfwR+N3QviaoeJCqn0ZkmzrawxDV7nY0+cKkNySHcJWZVMg
         tLnmapsLN1ZiUE/+XEra9+4o94y89OShPLsA3Hk2S2tmI6gchC2IZ6qPvUMC+32JdF8v
         Uw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591869; x=1787196669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D4T9bYHXVCBlbZGZYFqh4GD8XHK8t3g1v1wjuNVx8ds=;
        b=SDu3ObvMhW0miPaK5wKKwY20IEtezTrPi2RRHnu2xl2yAKHFKxMSlU3Kr10IuRDilM
         i/sfr3/Ukez+lYH9j3B/aBvJhWQmHeLad0zSzv7hYfhqb+YF1NPonLMEzRBrHZx6ckws
         UbX0T1cl68NtOI5CMxRnsQMu6etwqO0cVO3MflqDCL+x/mYizghstuJDafeWADvMB/YY
         fj8887jTU10vmaYov6RyW0D/D6dkSPLY0aUwIbXhTHWB/aYdVnc1Aa0mMJK/AbK2qlA4
         azOg8DJTMsIkrDd4JrkDJiTonHVntp1Ab7kVg4FvKYjRD3JSTX3r2409/m51rJZaUXEG
         ip1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6i3hx83ext9txZVO10wcRweat/0anaW+mKbl2obnP+HFqoGr5aqqBgNQYIA4q35SJako=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOIFeREjaLVv6UamKcUpftFZGNQLXLdK6pZoAsPGdR07E6VWk2
	OcQ60wMnkDZqMAPibBHFTANWK5YczzfPwMPrmg4JrdaF39SEkLocJ71m0FIQ83icDvq7UlYs36m
	4yxvbOOABXbGTqPcyh0eSMgmgKBQmq6U=
X-Gm-Gg: AR+sD12VoN4t6aUD1I61YYfWnTQy35syICcyaTjNS5EW88kaM9muWKkdSm3NvW/QKRw
	xMbvDYWVJw9Q4vqmqB4pcTZ88rMwgSO84sr9T5VO14fkVuIyQNLUpHXTapkBkSdab4tV3C95hOr
	VQUuQkVSWT2ZfanVKq8hSa7JeSVIb/tAcyA7M7pfrLsS7cGC+Qltafyb3aJUh1QeHtbcWXXynVM
	IvnSMO4OLPWN25PmL7kpuHzpmVdJpecPKaaornzBj3v0pmK6GMfAyKd9PS8bQGDfYoKGZ9LoNAy
	emSN3xe2VtuN2bEKvXOJCyRx5tGHt2TsL+Z6DydnkZipDigEXIyoDjhap1A4OXD8oAOHA93sLrg
	nhRUfyD3q+yH1JkH2pnkBFTGC8QXXsdZGokLgvAvzg1/D0QN25kXsR27w
X-Received: by 2002:a17:90b:1f88:b0:38e:bfe:81e9 with SMTP id
 98e67ed59e1d1-3931dfd7b7fmr3944788a91.1.1786591869462; Wed, 12 Aug 2026
 20:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812101418.37966-1-phucduc.bui@gmail.com> <20260812101418.37966-3-phucduc.bui@gmail.com>
 <20260812102938.D4E101F00A3A@smtp.kernel.org> <CAABR9nEzo9pb=mLhZ2nyDuSYr=qDcgBZDzMUqptyvDCG8nLgTg@mail.gmail.com>
 <da9a3b50-bee9-4485-aeaa-5872f09c499d@oss.nxp.com>
In-Reply-To: <da9a3b50-bee9-4485-aeaa-5872f09c499d@oss.nxp.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 10:30:58 +0700
X-Gm-Features: AUfX_mzfmXh4NLJX1MKsYr1jid54mgT2F7xWNIpS5SDfSoyh36cdjOuWu_5UCJU
Message-ID: <CAABR9nFgiNv6cnYa3+ZY3KnjbKpcF-JHpZY8TVcR7H40vOoR=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thank you for your feedback.

>
> Is there a tool that told you to fix these? How did you reached the conclusion that
> this patch is needed.
>

My main goal was to understand what the underlying core code is
actually doing, so I tend
to trace the call chain and read deeper into the implementation when
reviewing these issues.
I use Bootlin Elixir for this, as it is convenient to access anytime
and anywhere,
even from my phone :

https://elixir.bootlin.com/linux/v7.1.8/C/ident/platform_get_irq_optional

I don't use a tool to detect bugs or generate these patches. The
patches are mainly the result of
reading the code, tracing the actual paths, and then finding issues or
improvements along the way.
Also, through discussions with other maintainers during the review
process, I can sometimes
identify additional issues or areas that could be improved.
For example, this discussion led me to another improvement:

https://lore.kernel.org/all/CAABR9nG2vYKhMKeSxFstCRcHb8Z2FzDTBuQ3PY261Lipx7FfJw@mail.gmail.com/

https://lore.kernel.org/all/95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk/#t

> > I checked all error paths in the called functions, and they already
> > report the corresponding errors,
> > either directly or deeper in the call chain.
> > Therefore, removing the additional dev_err() calls does not make these
> > failures silent.
>
> Point here is not really that the error is not propagated up in the call chain
> but more like if you remove the error messages the user wont' really know exactly
> where the failure happened.

I understand your concern.
I think this comes down to perspective on how much value the outer
message adds.
Let me give a concrete example :

----------------------------------------------------------------
       ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
                               dev_name(&pdev->dev), saif);
-       if (ret) {
-               dev_err(&pdev->dev, "failed to request irq\n");
+       if (ret)
                return ret;
-       }
---------------------------------------------------------------

Here, devm_request_irq() internally calls devm_request_result()

https://elixir.bootlin.com/linux/v7.2-rc7/source/kernel/irq/devres.c#L33

 which already uses dev_err_probe():
--------------------------
dev_err_probe(dev, rc, "request_irq(%u) %ps %ps %s\n",
                         irq, handler, thread_fn, devname ? : "");
-------------------------

Since this lower-level message already logs the exact IRQ number,
handler, thread_fn,
devname, and error code, my thought was that the outer dev_err() might
be redundant
without adding extra context.

That said, I recognize this can be a matter of maintainer preference.
If you feel keeping the explicit dev_err() at the driver level is
still clearer for tracing,
I am completely fine dropping this change from the patch series.

Best regards,
Phuc

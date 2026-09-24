Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954724A0926
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273593; cv=pass; b=SROV/heUQtDvSu7Wa3U8pQ1+JUQsXDMQS86FubbFqYf+6svMAH/saqZP7M0wk+sH7EffLna1EIvk/0MLs1/v5prJjMigl9Cl+Ath31CiufbZpM87Hi3sBo6TRYQUVTVvhI1zS48XHTm3xpZik/JbJluz3dAXyj4V4qjPKbnS6Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273593; c=relaxed/simple;
	bh=obM89duV/YDQdOLprqIx6ewSPHAr0cjoNZPC7dSU81A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEU4YtnVSvrLrjDcefUywZaMxaZom+A/mEKPnGOZL3LYE06EkqZrSDxM49KEVag9/UCoFeDeF/ORTKP4RZDakg+ha29x7Pige0NsAeFB+uGj4C1ky36ry/++jqgEN9fqukpJMhd2ck4g0yipAphuPMSoWZ5VITC0YSMUad+iZp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZvKx9ZT; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZvKx9ZT"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so313953d50.2
        for <imx@lists.linux.dev>; Thu, 24 Sep 2026 11:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273590; cv=none;
        d=google.com; s=arc-20260327;
        b=I7jKyeBRlyxdm2468yF0+/i/a74gIcPdxcvFNCU2yv4kiy4ycOBlQ6SGAzOY+doyFo
         WacFUAS10IXx9uNYf4pOai/Jc2F5qskK89HokiKrcFQgTCRHSCB5WdB1PrgGQORvd9kG
         tbP0Sc+qU1ms+pDgAUBqmyt7+E+fuecbxfPC6hlttsWOyfuLCSWetDjQncxUiyplXC5S
         PQ2jOb2xQhOVIZ33kP8cveOC5iSKq6411FDOyPrtaRN9pIwD6g4FBjdL+DKx2fo8H6BQ
         sxN8i91ReKIOV6vp8wLEccQBA8fAuli3wk71Zn9NLgVBO1RJBJ1ExCS35J7x/NFtaXH6
         keIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        fh=Ztj+bbUvRv8V/EfBgQBrW/dgcV7h+uoLTY1Tvhfcb+g=;
        b=mtkpRlfTWIi47f/BNSLns1kxfqt96kk8671d2fMBl51sgI2gOF4EYwVOgKfRd+vuIt
         /sFoeIb12ZCM1Mc4jEgU82Sp+YuLkkciz9I+rXEvXv91jRNFPgBsfTX+qn5BbWzaN6G2
         OhoHrJABqK171J5HbnvdfYHO9YsT/yaThOcKFI69pN0KMUEo7gA/H+vX67Uzpq/mWIIw
         oekB8P/aPnQFAlw3vA9RiCgyYavJZhyvA2Btz+ReGILSpSInR4XdxKVdHw9MxDjjUWLf
         lHZs/juy4xX/zwMc43yG2dbFi5fJwzV+N1/3DGRFLId9vKN0b/tvlZOLVY7HvNOzHzYE
         4u3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273590; x=1790878390; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=iZvKx9ZTJyWXcKPKbqaLjjezCYi6MFgl9FKDGZdIhZp5Ij9yWTOjeAL3xT1FQSV56C
         YqakQVb1dtvwfF7OTx7DseoluZb0GT8L2UXx0sCghXrawYFhQkfzTfCL7kOSJnBUbNZ2
         gHlM3hvEVAQgiZfZTXwqjNx4XtWKMhQuRqb7YvKplRb9r2b9nNcdGerlsB0eAycyoeoD
         92Z4cQMSSL8dpN7i4bHW/fSaeEPcsj9ylQ/5qPUCBN9MxtWPx++bFgGt6DCH1Y++mLfv
         SntCmwVF3/OysTBNm/MZ6EaazzRo5HwjWJRXPWoLEpMSwfYypSmF9DOVJSOv/ZJOdPGP
         kC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273590; x=1790878390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=JyMe747hnYI3tuNABnKYEIY7Mnvn1pXv4P5abqsF/NfbQbiXGx91AY6+M1vqaXtn7d
         9N68p24DYMfAF4PyPdlGx0hiy3skzwOPzCNqbBZ0qgpCMXAz7IZyYk8E6JSrgLkcPRMb
         hEIc+SHRKtFR532T/raSn6pOeXo5HiC86TdrCXNkEFFoDeOPXpJQh51YW9NuzQwdgKPJ
         t7IXHioyGjUaSWDkjuh9U5uLi5uxSsQUQvOGr5qBtAduKtepR4DBtw+TNnbxkfIN2v5f
         QmFyd97eapi4+MRIC+Pf4gBPFOfoxJzD0SuLTpLQMprV7WDNKmvP8cGxV1xe8TQfcYhs
         P9dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOZoOnCkk8nfytPValEYZAQEF2we6atuEC3sWvFcDFuxvnwHdfkMwPEbw4zn/N9BUhmVg=@lists.linux.dev
X-Gm-Message-State: AFuF++mnuNpMO7Sac69IxhjX6TIDIa+8pGQJTT3vGB/sSW56Bew85EVc
	ufXZwfc/faOIBl0EGS6y2sUItjrQbr80HCsRe0ZwJexXSpVJuT7PrYvWNi9Ij6kDCLBa9IEmxY2
	CX2ChSktaANP0KG0BVb5TBfye06m22rc=
X-Gm-Gg: AYBFou1UUNWIS8E2hOOIxCFFBUycsZjbF8AcfADEOo9BWKZEBA0lRnluZFO4WFhhADt
	rCqy8pRXF5jxTt/ZfWyth9iuc+lwfhCMOCfbYhleq5r3E3pULc1m8nF3qLrTxF0xMhpUeZ4Nlah
	1mATe66RkpEswoeEItnFGJry4i7aaUMnmEi8kYXzXAiSZ98qPMcJ1uhMuCDviZdL1fEU9/9o9ii
	lyU8CdMSpDOJyPr+dlYlhAD0WVJz+dqbtyRjcmqajd2c1LtnoyHbMTGvYdVqrgNQ8N05XnLM3Zg
	AJuzAltT+w+mU3oPSAo1nzlbR2LO/UGHm3m1JU+6ybYgn8KNswGBzwJf
X-Received: by 2002:a05:690e:418b:b0:671:5ede:96e2 with SMTP id
 956f58d0204a3-672ed2603d0mr2064645d50.8.1790273590483; Thu, 24 Sep 2026
 11:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Thu, 24 Sep 2026 23:42:59 +0530
X-Gm-Features: AclHuK9xd3dlB_Cgp98d7h2ns81HK8suGpMur6yXKcYJOLZ9LOtfHEkjox28BFY
Message-ID: <CAJ9orWTDrTTRLqwnwu9YMQQKt0k2g7qZEpH6fDcMFcTbTs55KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:42=E2=80=AFAM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
>
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
>
> This change significantly improves the readability of kernel logs and
> dmesg traces during debugging, without introducing any functional changes
> or side effects.
>
> The cleanup has been applied across the following PM subsystems/drivers:
> * powercap (intel_rapl_msr)
> * thermal (cpufreq_cooling, devfreq_cooling, qcom)
> * cpufreq (bmips, cppc, qoriq, s3c64xx)
> * devfreq (imx-bus, imx8m-ddrc)
> * power/supply (various battery and charger drivers)
>
ping for review request on above listed changes in this v2 series.

Thanks,
Sumeet.

> ---
> changes in v2:
>  - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
>    for *_probe() functions during review of v1 series. This will be done
>    in different patch series.
>  - Here in v2, reverted the changes for dev_err under *_probe() functions=
.
>
>  - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4l=
inux@gmail.com/
>
> ---
>
> Sumeet Pawnikar (5):
>   power: Use %pe to print error pointers symbolically
>   devfreq: Use %pe to print error pointers symbolically
>   cpufreq: Use %pe to print error pointers symbolically
>   thermal: Use %pe to print error pointers symbolically
>   powercap: intel_rapl: Use %pe to print error pointers symbolically
>
>  drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
>  drivers/devfreq/imx-bus.c                  | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c               | 3 +--
>  drivers/power/reset/macsmc-reboot.c        | 4 ++--
>  drivers/power/supply/cpcap-charger.c       | 4 ++--
>  drivers/power/supply/intel_dc_ti_battery.c | 2 +-
>  drivers/power/supply/qcom_smbx.c           | 2 +-
>  drivers/powercap/intel_rapl_msr.c          | 4 ++--
>  drivers/thermal/cpufreq_cooling.c          | 4 ++--
>  drivers/thermal/devfreq_cooling.c          | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
>  14 files changed, 25 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>

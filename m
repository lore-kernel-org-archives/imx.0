Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2F52F531F
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060226; cv=pass; b=jd5mxvyhf2K1Pfj+ooALZbQZ7Km1pjClR0GQqpBwy3Nempp4osIsH1ZDO4G74WDljB5hwWl3RK3ZutW7hpTuNqhM9GKzW2BMhXMOpxNCg4cD/bVh+6ak5Y5WtgA/K4c+0Aun6jTOY9axItusNOnU/MgWP/NnMsS54A6eZGIWeoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060226; c=relaxed/simple;
	bh=jnZPteeSHeX5ZpEveHAlWBA4LRcr7W4KJV3rdDt8BuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvh1rg2/yBYBBoWm06N2WZEI9f8eoodLtxYrLkLIbbB1A9dfIOAbQel81t2dm3NxER+bBDexvsrTXJfRjFS7pHtJwo/4ya70z5r6GC2JlnskGM9BP7Xh3OOMIsAFBuhydxVN30jHhGiREeNsrb9G9CfCYiuSANyF82ATpY2yW74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0zMn2FV; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0zMn2FV"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso7277711a12.2
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 11:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770060222; cv=none;
        d=google.com; s=arc-20240605;
        b=A8D1Fk5vsjkY5sIazgldnnx6M1xcYWIVFCtYQ7qjfhIgbRn+vAvelA5UNKsTmtDJjq
         YfyMOB+m79rulRfevS4rUAihhNhWyonfZArSN1eIn0Ovg2/8rmXRXRuWg2snpMcAUm1m
         CwdHjX2R9e++T5lAITyBbn3YG888MocMRs9Wp3XOYNgqLwoYPyQ2R8ppr2rnVM/9DbS2
         tFq2RSJBsivm2Ayo+Htwyz/AISnpVm0+JTvLxuFcu78eKddbTytDuyss9OmjvWUkcPpY
         K5aJqtOnNlDfqMRGSzuR1WSJm7cejdB4dOqmRpP3U82A6rlG52tn6TjkrQwLCZ0V4Cnn
         Ng9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=;
        fh=VggpFzYwybCBZnStzc3sloXlG6PlBck1cta7BXTR5Rc=;
        b=YL4G2VI0MJEHfZcxIDp2vDvB2qaZK3iDIMRJoWpz+svTlj03bPT/aRYtBvMprTabZS
         /6XfUayxU8NfhvfGvIqR8eCj1Qxl2AkBW4z4ryY7k5J4PXs0z+aOry0GZK8Tw18/OUB/
         QmlFyNa/XQRcd/YCTBgc1eZcu2zWjKYUY2tE4t6mx+fu92fM+M0QILKUDyalYvGxWynp
         nF4xXYMASbHHFRLtnCydQrp6AX6Zsl1ri/mH9GzPd5jhf8aAeRecgtsY9V70ADC0BaOG
         uxI6bZgSNY+slV2y95N3cjlLttyd/u5I8dqwu85h+1vQo1tAq/jjFX58IhC4SGtgk6Nb
         QQ6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770060222; x=1770665022; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=;
        b=T0zMn2FVVhFdmDXyuX0eoIWxmD95g6u4VgRuzCK/CBhGAXKcCf3TNLUoG1bsEyQ7R3
         RebmPvzjip0dq2Tmh5+LGTzBMXbb16X745xyW5s6Im6Pek5mC+8FGeRfPIDT7titxb9n
         YJ40Qg215TErZpy8UzZ0cZYswP0UTapRwjGP+Lw4oXjpTSP5exC5cIHAmtzpC3IPQjCf
         0VCw1ThlQW5HFes2bXW6FxegwxgQvca9xzIMKJmRuInKPo8Bzugr1c2LoPyinWFwhdW6
         nRh+QHD770i0u8aSqxDeVAjWj4ENNty6LUAPFVDrUhAZotTm+GNLaHR24ijAnmA+2S9s
         BPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060222; x=1770665022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=;
        b=jOsSgqcOT1dFSor42HNGU/fD2gcMtFLzOFNL3/xUou/chr/zjF/lgOq5TUMHPqbb4+
         kYcWfs91K9onrnz0iHr3CMuWyfQMiPQS1mbkfg8mTkHlKak/e8Ed6NUZW/fhXJjZVd8a
         liyjFE9nApoSu4a026DlfP9r7z78mcFQ6Fmv8rgL/kh7cJxyJWRE6pc8SL95cEng05Ut
         LKRLlNnOT7KlwhKlZgNhhS6DLDKvcl9qg9NET9Q9m7/DaAe1N+UjC/iHn3N7sIbxJOAL
         GAX84UcDsiSar2JFQgORZVsrmPFZ3LeViyRwvF80+UFNVyXDo/udHLnOadeoP9jzD3Ut
         pM5w==
X-Forwarded-Encrypted: i=1; AJvYcCVcnCcaderIEz1+DzLGlGMBEv7TenocSuVz8dnZzJbf+fTE9uV2t8JNne/0da13boPW914=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQZBBB9w3h1gxxRJndFDvKox1Yn93TekLyN6EbrLH5rQ5majtL
	QtMDMYpQDb746PKb5SV3or0o7KZ7D1+6VT8GNs4TsqRbWKKtPfR2CMPJ1LN48kV/8/R9GrIwfBZ
	iEPqQ8WLjsbY4zxiNBcusgy/JS9y8Vn4Dab9Hs2xpy5qKZPNDVhuq
X-Gm-Gg: AZuq6aLt2Q1NQ7eTgMK2GveNJS9bbrzjeu4Ta5Zu3EFr6Nhmec8BHPPFPpmtL/ZpP1B
	k8cMYFplpBFzo29OyH4hvjwqDaK1oIUgel4YtahTLixZ+3E/BNEUB/uOSeJ7JvC2OYLDqIwwMVX
	4z4QkaFTI90cv9F+z0kiCxccv1GEmHs5kodBRN+ULujNfgaSMYnnAmJwRcK+Tm/NB/8IdyL12TP
	4lBzwJBAAHZamy5q/RGrjg+futYBLVKO3exn2LNx/j4AiiSnE48mLKCWjH2/yPupOPZuNwK7N1O
	ZLehBX7Rplua+FjC72BwxA==
X-Received: by 2002:a05:6402:430a:b0:658:cc59:161c with SMTP id
 4fb4d7f45d1cf-658de563dccmr7500568a12.12.1770060221904; Mon, 02 Feb 2026
 11:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202151050.1446165-1-vincent.guittot@linaro.org> <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810>
In-Reply-To: <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 2 Feb 2026 20:23:30 +0100
X-Gm-Features: AZwV_Qh1oY-NeA_FmOnmZdDAzImBqngjLBWXIy59t4ga6SGhrkYyYc67DM6knQ4
Message-ID: <CAKfTPtDjad7aowTQ3UJPi5Qqgzf3q8J=kASa-t3YM4zfjUv3-w@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
To: Frank Li <Frank.li@nxp.com>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Feb 2026 at 18:42, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 02, 2026 at 04:10:50PM +0100, Vincent Guittot wrote:
> > No error return is missing after the loop resulting in removing the
> > ports from the list.
> >
> > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >
> > Change since v1:
> > - handle correctly the case when there is no child port
> >
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > index 47745749f75c..b3ec38099fa3 100644
> > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > @@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> >
> >               ret = s32g_pcie_parse_port(s32g_pp, of_port);
> >               if (ret)
> > -                     goto err_port;
> > +                     break;
> >       }
> >
> > -err_port:
> > -     list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > -             list_del(&port->list);
>
> break and goto is logical equal here. So only need below if (ret).

Yes it's similar that why I removed it, the goto becomes useless and
make code less readable

>
> Frank
>
> > +     if (ret)
> > +             list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > +                     list_del(&port->list);
> >
> >       return ret;
> >  }
> > --
> > 2.43.0
> >

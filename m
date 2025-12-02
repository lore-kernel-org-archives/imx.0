Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360526D4DE
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665678; cv=none; b=LPpFaVVjvAX1ktceZXUI1rOCNrg5uUCq2dTaJ4blrctkjEqca7en1AVDTzoioEwSUnJI/hsLjmtwEgp+4Tw3l+3EH0r7PLsVeidTE7y0D6PP00Sma8hNUhURbL3xOmK/tJRTk7Q3AVX13ewHZwovMCEEf6wOggUeuS6HiMjo/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665678; c=relaxed/simple;
	bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgrqcHrq9kbH1Pz0B9amiX21mRGB0gr3UQweoZvDUsBBkuKwF6Btf7NZ77dt+suUEJBYG657KfQHkaL2tHJcNwOiqmg3qjwfhSi7DddRhbtrX+AkxtTcmKtTao5NNFIa4Rw8Bh3W7sc/JI1bNFKY9KdcRR/fE0sa/V1akRlgg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFCX3N1N; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFCX3N1N"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso8031865a12.3
        for <imx@lists.linux.dev>; Tue, 02 Dec 2025 00:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764665676; x=1765270476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
        b=vFCX3N1NRdlc8Qpa/zdU1TfwK3vXelykCxohG4uX7QJ77K/UbjHuJdLXpOwdJETicR
         VMjURVigFuJby5jDuGmQ9Va/mJuf5VIvFX83IeYBNNjbRp97frHU3Tw/CwMUmOkqesEF
         7Mdd5bJyj7mRKkDRXBmLgxuA1dCng40iZGLADQae1FIIB+MIpn4ehJqJuI8oWxhXfz/z
         yTQSQGiE6OIBszaNFGSN1jT5GUHB/t5MNAlPfnhwpuCFwtTzeHuC2rqVGviYUt6jpd0S
         xxh3pxx3nL+5r3RzVjIlp264oe3smUi/hmP+WKzbB38VyV9SP1hE5FBYwaXvqGy7inhf
         Pv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764665676; x=1765270476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
        b=ruu4JKXz3FavjXIX3w62gdJBy2ePpCxTHLDVIJ3pj7mjDyez+lkhpiMYMrYjD6kJ+F
         tmw7TEPti6R6uDsj1VrRmcaiEG/XrhsRX49nyqqmu/xkjaDu5tnt0k/+2AF6KkRVZor2
         03H+4JhspheayVCbPv8tz4vrvp+vJk0k1n8YHXHwTkthHZNmwA6XrIUtDsn/pclc0XLr
         pnxb71SKiwOSRr4RIDBI2P1JXHCRSaHoRAVueQb0LgRkVeiqc6eGC4GoN5BMRPfx2Gyw
         ZSpc7VhkCxwe/3AoOGQcYYRJlmWl7yNnbua2Aw7dSmO5d23syhkwPnRk5FFjJR1u+rO+
         2FxA==
X-Forwarded-Encrypted: i=1; AJvYcCWUOA/Ptoe/eX81vaxGEpkTVWO5U19x7trbsyxP0C+Hq9S972wrV9UTgJLuh1MwtqzPuPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpHk0+bj3AeqoPKW0kprNP2WLFBEwSpRHbEGw1bKtQiwB7i198
	LvUiTu9lNFH0FNPCRl+h4fORz/EzcbJWXjSb6p08tj6Es5HaLXni6f7v8W16WiGwcdTW1u8loyz
	pYEm5uj0UTasCmqtaZSawaeJfoFBn6hoIWDTOZTm5LQ==
X-Gm-Gg: ASbGncuKRXPycvnk3u8xzmtWJjdypmbVvyabKXz2HLbMy7pF6acrq46j9fhYlBs50Jg
	dUTzIKpb8CKQv8ICRiGjGRLUZhD6CvS66r8nKKS2JSQ0C1af4RozcVe2mjMVWn+e0ya+SZB0SRl
	k0DkSCtEhAnT/u5C5RTM5f5PkKEQfq4L6ttWF8WxeV/t3XwVxchfbD5+vhGONMSOzfa3bFVCkw5
	REsqxJ7UwVCfVcXelNR8Y3Tsq1flsBunMA4z2mMaL23OooI0psV9e827e0UWL9qYpjLyYzKRL5z
	tzh23LdfGP4OjqsFJq8pdj8=
X-Google-Smtp-Source: AGHT+IGWnwcbDjhWT0x9H7sIzIa+WZkvafF3BehhPLR1uxm6/AMNVV3pUklD/QKk8hx3Gw45sSksLu6R8c7rGcUXEQo=
X-Received: by 2002:a05:6402:5113:b0:640:980c:a952 with SMTP id
 4fb4d7f45d1cf-645eb228d07mr27645261a12.11.1764665675613; Tue, 02 Dec 2025
 00:54:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
In-Reply-To: <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 09:54:24 +0100
X-Gm-Features: AWmQ_bkF5XtGr8F9ahjDdeghwGPaVkXlZCwEv85iEB2fw7LzWAo9ryRojtgxNZU
Message-ID: <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 28 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Manivannan Sadhasivam <mani@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> + Vincent

Thanks for looping me in.
>
> On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> >
> >
> > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20251127:
> > >
> >
> > on i386 (allmodconfig):
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pci=
e_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .ini=
t.text)

Are there details to reproduce the warning ? I don't have such warning
when compiling allmodconfig locally

s32 pcie can only be built in but I may have to use
builtin_platform_driver_probe() instead of builtin_platform_driver()

> >
> >
> > --
> > ~Randy
> >
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

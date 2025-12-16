Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961B36656D
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887370; cv=none; b=PwwBreVaVpqEBqFrN9qAfaIAU0XYnfrgyjuobi+AvZwk0Zhefr+nIzg6oxYUH+KfFvCd0ILO0PowUhtbgz0DdQaT/MT3CyXi+wNFYSwO9QpOJi96Ty7mcQ6YJYB7zq72ZYonzOoGFaBl5kqtnO2hkoEutzOf1nMoCU6eoJRua+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887370; c=relaxed/simple;
	bh=ygM6iPCH2TydP0HkxyKip8E+b6Ls9AqBqncVC7h+DLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLJ/Y7dssHBiH7XcoX2gbweZz9DxVCOVUhYGkkr5VHBEdyVpGunNqfPzCB0gzRgRuScpmUBMkRtvTweZojUOCAVAIHHMrSKKo7ldb/MHzH76NOnsdV/velDhaXs4O1fhxQobXwswQnuqazu1K0Cs0lFl5C3y/s6m2LZPVHl65+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bl6OTQyq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bl6OTQyq"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37ba781a6c3so40303831fa.0
        for <imx@lists.linux.dev>; Tue, 16 Dec 2025 04:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765887366; x=1766492166; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bBHT5GO4OwWFNFQ9+2hmY0RqEYQdKcZYHd8MT27q6k=;
        b=Bl6OTQyqMQXsiAtrWWv6P6yJISJgODC5LIC5QBDGoZ0kRjorzkYsNk/0R19ZGvyLas
         aDcPv1cXtUmc3TyU2fRCFrLL3Fw7Jnv52uNxDrFyrlCKuaiF+AcZ6sPbZgoRzD0yebEa
         3Woeo1Mj2i8zhrjCPWIntWJovMKth1DTlMSkaQVGlkXX1y779Lb5+w9SMJ82brK6dqcF
         NrV/72b4erQlw4sty3iioR1N7mnaC4VK9izD4+ixIt9kaQhFLOREHysyjZIg5d7pGoH+
         Qp4ywI4bdjbA28y3Vm/xAZuU2784KfvAJiSJUslA+5xXlFCQ19a/p8JTasIKvMuYCkjW
         5Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887366; x=1766492166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bBHT5GO4OwWFNFQ9+2hmY0RqEYQdKcZYHd8MT27q6k=;
        b=uLFMQlN4AGERgQofGebcxa0aYH/7Y5j03LT4KeQGd48Wkw/LqkgoEfOw4THLidzMkg
         wnCSp3+DQlvJnOq7bFpnGkyOiiBFwQmgqo59OjiLkBg0GiLGnLPTsWjvg/sLrYYY/hdc
         JbX57u+Gs5pXyjJvOUAtThg1151QYmieWS1TE6uYhw4Tuyx3yAK0qWgx1BBv1PgZw5Fk
         VT5tEyASo5RhXMUk0/jEKbPb0m1TuET0KrQKmbLcws1SoNk+KAoCRWIDq60rOc9mpZXZ
         J1ItpU6gla9hvzl35UHjikSc+6EmFgjrdlCohK4GUlwdokoO1Xk6EdY78QQR69sOVwsG
         X/7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+Q6gxnAZY5YjeG/lxDKN8yuSM2IbHd9m5LZCDXe4kSKlFRGWGwFMOW8hLxz9YWV0E1JY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDeritqBL9y/JlRa/oPVr8CxrXbdx42H9OipooZIyDUAJswNk3
	aIUj6x7ryd2I4kL0SSG6vS9499KrUP9O0CiMmHAAgBBRXk8KpuJDQKsUmk07wU8OUdm7uLzzG5E
	S+HejGlM8NdrEqGHv2odjONPIEWqc5UFNPPkxkPbx7Q==
X-Gm-Gg: AY/fxX6IkqrsJ3U4bkHNp4ctOKrkl/EO3qffDtW3+COfjMbq0kXE3GueJfSOW1yGB+2
	W7eqd/56xmGG+Ww63UFsQ491WIJWzPWQfCPyez9n1KvT+kmxhQ4ZBGACH0C0JPzNNddzjBalYPT
	YIGtwoku9T18J6EDN5I8E8o5xwml2BfvKwQ4I5TjszyG5CEMpzrdwcvTo/mXZuDDNHRhBvyR+pg
	+e+Gsz/ytDRRP1DI/cDHyTruCG7cD3a5xOiFuBIgvMRG8HPVjDZWzEmWAkjRAXdye9Ez+Y8
X-Google-Smtp-Source: AGHT+IHSOzKJUAD0VWoqMbAG9/IlbO2ZSE7puMKuCAi60z6RaWldMe2JJwlbhcYrPz8NDWuyAEiNqo14NocbJW/sTAU=
X-Received: by 2002:a2e:b8c4:0:b0:37f:b5c8:7cc0 with SMTP id
 38308e7fff4ca-37fd08c7ae4mr55985981fa.33.1765887365959; Tue, 16 Dec 2025
 04:16:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215102010.608421-1-ziniu.wang_1@nxp.com> <CAPDyKFoLmo=qDru67rj63gQwMjLqVKS+wEQecukuC+3Pz_CjDA@mail.gmail.com>
 <DU2PR04MB8567C09C52C66C59C9CA6607EDAAA@DU2PR04MB8567.eurprd04.prod.outlook.com>
In-Reply-To: <DU2PR04MB8567C09C52C66C59C9CA6607EDAAA@DU2PR04MB8567.eurprd04.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 16 Dec 2025 13:15:28 +0100
X-Gm-Features: AQt7F2qlgonHE1u8usoQ1ApRhJuG8Mj0nOYZGlZ59wEK9NLeswsioWiDble_0qg
Message-ID: <CAPDyKFoH+B363wiPi6HoKg1VJXvJVNPoYaRTGXzEDgSTEg9TyA@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 0/2] Optimize secure erase performance for
 certain Kingston eMMC devices
To: Luke Wang <ziniu.wang_1@nxp.com>
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Dec 2025 at 11:02, Luke Wang <ziniu.wang_1@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> > Sent: Monday, December 15, 2025 11:38 PM
> > To: Luke Wang <ziniu.wang_1@nxp.com>
> > Cc: axboe@kernel.dk; linux-block@vger.kernel.org; linux-
> > mmc@vger.kernel.org; linux-kernel@vger.kernel.org; imx@lists.linux.dev
> > Subject: [EXT] Re: [PATCH v2 0/2] Optimize secure erase performance for
> > certain Kingston eMMC devices
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report
> > this email' button
> >
> >
> > On Mon, 15 Dec 2025 at 11:18, <ziniu.wang_1@nxp.com> wrote:
> > >
> > > From: Luke Wang <ziniu.wang_1@nxp.com>
> > >
> > > This patch series optimize secure erase performance for certain Kingston
> > > eMMC devices (IY2964 and IB2932) that take a fixed ~2 seconds per secure
> > > erase operation regardless of size.
> >
> > Well, that sounds to me like the eMMC isn't really erasing the blocks.
> > I wonder how "secure" this is in practice.
>
> Compared to other eMMC, 2 second secure erase time for 1GB is reasonable.
>
> Using the default 3.5MB secure erase chunk, the total time spent secure erasing 1GB:
> Sandisk SDINBDG4-32G-I 0.8s
> Micron MTFC32GAKAEEF-AIT 4.7s
> Longsys FEMDNN032G-C9A55 0.6s
>
> In fact, secure erase does not guarantee that data is physically erased. We previously encountered
> an issue with long secure trim times on the MTFC32GAKAEEF-AIT eMMC, and got confirmation
> from Micron:
> "Secure Erase (0x80000000) is treated as a simple Erase (0x00000000), while Secure
> Trim (0x80000001 + 0x80008000) and Trim (0x00000001) are treated differently. So, it is
> possible that Secure Trim really is the heaviest possible erase operation for the FW to execute. "
>
> And the eMMC 5.1 Spec:
> "NOTE Secure Erase is included for backwards compatibility. New system level implementations
> (based on v4.51 devices and beyond) should use Erase combined with Sanitize instead of secure erase."

Right, thanks for clarifying this! I do recall the complexity around this now.

>
> >
> > >
> > > Currently, a 1GB secure erase requires ~300 operations (limited by max
> > > discard size), taking ~10 minutes. With these changes, the same secure
> > > erase completes in a single operation, reducing time to just 2 seconds.
> >
> > Hmm, is the problem really the size or is it the timeout? Why does 300
> > operations to erase 1GB take ~10 minutes?
>
> I think the problem is caused by the fact that this Kingston eMMC secure erase
> small chunk need ~2 second. In contrast, other eMMC secure erase small chunk
> only take tens of milliseconds.

Okay! So it looks like using a card quirk, something along what you
propose in patch2 could make sense. I will have a closer look.

>
> Also, the calculated max discard is too small. For the I.MX8MN USBHC controller,
> host->max_busy_timeout is 2684ms, and the calculated max discard is always
> card->pref_erase - 1, which is 3.5MB.

I see, so regular REQ_OP_DISCARDs are suffering from similar problems
that are taking a very long time to complete?

Are you planning to make a similar card quirk for discards or what do
you have in mind?

>
> >
> > Can you please elaborate what happens on the mmc host driver level for
> > each operation. What mmc host driver/controller is being used? Does it
> > support MMC_CAP_WAIT_WHILE_BUSY or do we end up polling for
> > busy-completion in-between each command?
>
> This issue is found on IMX8MN-EVK, uSDHC controller. We end up polling for
> busy-completion in-between each command.
>
> I print some log during secure erasing:
> Without this patch
> [  126.760429] mmc2: starting CMD35 arg 01294000 flags 00000095
> [  126.766530] mmc2: starting CMD36 arg 01295bff flags 00000095
> [  126.772246] mmc2: starting CMD38 arg 80000000 flags 00000095
> [  126.777988] mmc2: mmc_poll_for_busy
> [  128.616245] mmc2: erase operation completes
> [  128.628511] mmc2: starting CMD35 arg 01295c00 flags 00000095
> [  128.634293] mmc2: starting CMD36 arg 012977ff flags 00000095
> [  128.640089] mmc2: starting CMD38 arg 80000000 flags 00000095
> [  128.645811] mmc2: mmc_poll_for_busy
> [  130.456184] mmc2: erase operation completes
> [  130.468390] mmc2: starting CMD35 arg 01297800 flags 00000095
> [  130.474160] mmc2: starting CMD36 arg 012993ff flags 00000095
> [  130.479928] mmc2: starting CMD38 arg 80000000 flags 00000095
> [  130.485798] mmc2: mmc_poll_for_busy
> [  132.192309] mmc2: erase operation completes
> ...
>
> Apply this patch
> [  296.480818] mmc2: starting CMD35 arg 01294000 flags 00000095
> [  296.487219] mmc2: starting CMD36 arg 01493fff flags 00000095
> [  296.492995] mmc2: starting CMD38 arg 80000000 flags 00000095
> [  296.498999] mmc2: mmc_poll_for_busy
> [  298.712865] mmc2: erase operation completes

Thanks for sharing the log, much appreciated!

Just to double check, I assume that you have verified that the
busy-polling works as expected on your HW? The reason for asking is
that we have seen problems with this several times in the past, on
other HWs.

Kind regards
Uffe

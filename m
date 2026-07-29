Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36979156C6A
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284017; cv=pass; b=bUJMaCzBPy7j3MtwCFx+9VAQDx6UFEJMojnNYmwMA/R0fEmNH9SlKonS0wSMCGoFLhaOmU3Kp7I2OpT4JysNLXm3GOY8EIundn+PFWmQeCO8+7kwDdONsTwxyYM75xIKEbd+r2xzEz5O981lUFUcNCv9A4C+pVwbjXQoa5EjF7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284017; c=relaxed/simple;
	bh=h9aXM5QjNGMidHsRvBobL9YrXwlC8T0grjYAblNyM9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaLGxQWkfTeP3pgY0LWqanE2N81QhHintzkN3R58NWWABFGAIj18Ww7gQNv0RpBzEsYXjHei2Fuxqi6u54V5zUb3yq6h0lUgiwPD7De4zFLc0Ap5z7H/14c10fFlYNduXpacPrM4qpBDthO0eQ2ROQGwRw2E7bKNVzvxjF+EGpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFmBonep; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFmBonep"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69f7130b47dso462594a12.3
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 17:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785284014; cv=none;
        d=google.com; s=arc-20260327;
        b=dq8JbIxVRooR0Hgkigzs4ZVZrGxPYVodv1P8b2TFhhnirE62oggMD0e/u8OeJBtzse
         2U6eAvPYxUY2bVKs6oxpJqca170AIClcEX4h1VtEuRzm1NtUL/rukFRndFeiSfQtUQuM
         7XU5yFGHC6oK2N4QtHurqW6uDT4vMzgpJkQEu86rcfNSo8VmITPC/HLN7AbUuO1hKSMD
         4N+O1CX2Oe6bEc6D+L7EIjaOgHHDubmyJ2wfDJcBdZl20N2gvoEiHHWYZQQaBegsqlTy
         9WwIJD+YY/G19XcpGYWtpOReh+KmeV9s3r2MDZgqImo+DI/OOFCuPHtaeExrgSNFWrOA
         ceUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        fh=eOruAVU8xRltLH+1VMRXq9vHDTBhm5fIgOiThSzxEHo=;
        b=BUjVIeqJQuPqtRCtc6a/B7SYVz2sy0DFXdmSoylHUb42/lj3WyNULwQRMSevSWGG44
         vqzgCDbqp2+JPUMWK0wVLGYVV6pWH4MLhey+ypep4ydbOQaW0rodh9nODCV3am7Yf4Zu
         k8LF0wqof1QULGJhyy9JqEnVjf1kPIACWnYVh0mgw2OhxQaSdNHN4sxm5F2RFzRxYqS/
         xW5Mcb2TYuua1nmzD/8SqLR52Xh7B/ajHAU36J+Ndt/90foiVSMZwNIjFbdb2Xgq5UFZ
         FbsaDvZTskOoOVeNP0pyjtN2LAuaf2k1uvNOdXklhToqHIDeOQBMgRCpn70Pb1boDOsC
         a+5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785284014; x=1785888814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        b=SFmBonepzF5CM1SVVlVP1r914ZKcai/fO7NQ4gj7i6ksxs27kkltaAU3uz1dPhPEL3
         X7ret0WF4EqMouG3Vqq5ENVKg7tsjyVQn8CLs2JhUnu+znN8PKjpTj9RK0qBidJFEFNs
         OhrMD02ouaHKOLrXRieqF4gYfSpFkNf4DRXA7TbxftiqVmU90HASFoGcLQTcJ3USHufu
         EuCjUCEH62MG+W5hXOpPYFBZ0MQf9U2DZNbchsEAoZSh9g+slk++pidX6vFyCQVRLtt8
         nMyLkmP4/h16QpAEMZdD98qGWnzdVYY3fEvfMV4Wje+5aXhVTOHh8DWg8VY8ewYyQ8aR
         v7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284014; x=1785888814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        b=ZTpenCv5EEDufZQVR0jnXSnGi8Fjvc7XnQ7EoDbquOs1wpQGBtQzrdiKZt4tDE+x7O
         HHaOLYZs04wJrNZ8O5CF9oCAJVdI99beJi7RmbRUPGRj558aQ3W6k29VyXvGLO0l+baT
         x28LOc9n5EOdZkx9c7EjLuhKvH/4hjVOzF87T8WPyb1/gaI7liVlBBMHrwvpfbl092S6
         oZUoCK/zEZa7z2bju7ToqoI1WhCvNfE4+MKg8cVGg6NdKJGRtNBUIxU3QBWm8S+DGLsG
         0bDHtQBK1V7Rtoe01dYZO1qTiGqH8IDXnG5hPBOEBD6QF4JptXK3hzUnQ6VZrhbMKQE4
         8UEg==
X-Forwarded-Encrypted: i=1; AHgh+RqXXKcBv5j0+P2UaUlN7psKwTnmepi8GoArlcHZMNBydNuW2bVNkkOYIBqDZHo4/2M33IM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUEXPx5l8+6mV/3epzeWgQezMkG9XavwPOTrDYdmZ1wSzSpLfk
	VVdLk73Mz/5HREcK1BJddckx/MWgY2egtEk9PTU0DwzDmxXhsdRYapOygKjQochT2qSEBSvLZam
	NFGFVKjZMk6QTpI0lXwtjfWA7926Ak8k=
X-Gm-Gg: AR+sD10UvJGadgMx8Iv4N6zufsxzofrtPSAEoBjgYsqug6IYLgxcP1SiIkCReCJWZhQ
	5nJRGKoewdhaWcx1MGbCWxbztYSK4Dvz84rEUyCTO1jgZvEOLo7UsdffxoJaU87RsJqSsCj9dzD
	/KBTZNf8QweTaEM3ZsAgSWWuUne8QwKW0kQcLXbyPZjfjurQa3xRWUK4SAo4hnAmf4OuSSv3i0l
	AAWVTyEPH6HwyJ7zgi1RC3TFNXaMZgdBD5ca7yMQg43cIsRDyRJLls5vRIs/cH+wmn3P8OgT+hU
	r3YkkJkQJeu8OTh9J9chYyOCQYUQ+qK7mFC7EiQonMTIQVEGVEuYFJpFJ4/21yjDmunQsBpnw8r
	YWrtTtiSIW4q3gyGvDIv4PGdC4NkLRXVrocuUJYEiFgVCtevNcv5L0jrwD65lH8ZTTpvOfgwYui
	GHvvMjNkQxb5Werswb5zPFDq4QlAKf4Z/wmLs2qXsDn4/LocfKJOuJEQI=
X-Received: by 2002:a05:6402:24c8:b0:697:ecb4:b86c with SMTP id
 4fb4d7f45d1cf-6a034a0b240mr1758311a12.2.1785284014277; Tue, 28 Jul 2026
 17:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714234609.902367-1-rosenp@gmail.com> <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local> <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
In-Reply-To: <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 28 Jul 2026 17:13:22 -0700
X-Gm-Features: AUfX_mxHW0ADcbLB742WYGYN1hzAzsCDZWTuKdLexmZw6VpD6MNkUeIKBO7Hquw
Message-ID: <CAKxU2N_=DMAxM=-QRZ_J5Tt2rbjXs7C4uJRQTWF-xTquL_oFvQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
To: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 3:41=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> > The unfortunate part of that is sashiko does not understand v2 patches
> > and whatnot. Meaning it will always complain about things fixed in
> > other patches.
>
> That's fine as long as we've replied to the patches and said why it is ok=
. LLM
> is just a tool, at least for now and how it is used with Sashiko.
>
> What is more important here is finding real hw to test it on. I'm hoping =
Frank
> on Cc will move...
Based on some git log/grep, I don't see many devices that use this
driver unfortunately.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

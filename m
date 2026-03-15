Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF8370D53
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773598912; cv=pass; b=Xx911QzMNiZX63AsbPEJOI2emGeYkx47+Henv23dM7enMzb6T5MShY+YzTPYMcqx8WceVST079LJ+3knAL1+G0/fR6jwprUDJd0HHajRp/w8UtkCwoxVvRWgFk4/kopE5jOt57uTBh7nS3Thtz2r/V7nWC0X+RYQt8UUeQJYeEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773598912; c=relaxed/simple;
	bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkq7SEyiqkERp1ej9LHL0gBmpjkFcLwlSUGlxuGViQzZMsGWPb9qIZV6fNQz2R9IE8vT4q+wL0Cw70od/uN3bsi3GNQkVqAaAQDaOBTQHJR1WKfCdJup5oZgm96QTcpGTs7kWKEM5L8/mj25Eq782m22FaSuupWCLHaxe5Qjer8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7FltGMV; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7FltGMV"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso12317eec.2
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 11:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773598910; cv=none;
        d=google.com; s=arc-20240605;
        b=I5G0KKOcqUb6fQ54UG+QToLvj/6AyiDG6pCkCsBbdCwrP+5oRPCIPAexhqnxfYB9qF
         ZxToH6CIV5jwTbtnH7MuLNUdevVucdDaucS6C4YwKvXXw52Ajh18dKB2L+U1z/l5ouED
         eVEaSKYS7vs0Sf5GgqKlbMSIPXR0ZWbRLwogeXqnUIyoXxboOciea15CLag3CxCUG/Jz
         DBZEIResddYthBUzkOKmU16Vh6x9QkH7WmnPUgJKda9o+/EOoEmBM8vGDyBuSJuKVyxB
         gIl5bHFp03AiNNyZuxzzEKQ5vB4GAwO4XkyXmNor0IsCYXTFMX2L0qXKdo0zr+4gI2ei
         NRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        fh=CQboGRmZO3EwNgrB0Bc7itiaez+fY9omO9YyeiaPzA0=;
        b=ZR2/5SlL86KrtgqUgtqNutkMB61fnuUTMmsWDHRNG1Q4l9FuRCEQxJ3QNmn8q8ase/
         0aEd4fhJAWMPsETajLT1hVGfXTMFHYZkQLMp20Z/fG/6UJuyXVbf9x2L13uoasHhcQdm
         4Px+Obpejt9/35C4m8AXGz3ZUowIT+x0s/f+4Ba1aARsBVXkMfrKBhx1jx/c/RW6mukk
         lNQdaOFTXOvzCPkIaHSqp5OgeRCGscJyhJMVnNgGT/N3swl6QXztFlLPN5Q/0U9jNVs4
         S+B31hPfGSH8Rp35rYZnMf8gD75xKGYg6cfR7DXd4GM6MfZL3HzFtZIeMztpU0nY+PUn
         nUrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773598910; x=1774203710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        b=l7FltGMVUUcIEpKGPL1aq7Djc4K2YZGw8+q5nKI+9m+IaD/75SBVwV8f4DXdKTWiYm
         /KYVjARONssO8XUnNQ9gM23BmwudoQ/5i52OcNxo9JjQCHiKDwnxgNak8teZnk/ml4f8
         /0lE1wiEq584wC+Juolhir45U2p9nEjZlZ8TdvZtSekGOTAdatVVKQWIIbYcd+iQj56M
         xegqsg/gffkThV08tzg5ltG1IZ3Rjg0lFtY5Irr1WB4K3/+PvYnzGExYU0wYC3LUKDGr
         aHEnk9/R2DQsZ39UsFrg5sv5dwksi/pCxys/f/35O/1YcfmcPHm7oGZZkMFG43FlhrlV
         w0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773598910; x=1774203710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        b=KP+mkKVL+nRIXccHtOizt/Z9ur6crOaHH443y1JWDP47F/aYMU+7mxFQX7qOgrl7aA
         jGz5uVjRT34oPLL32gG83/JJaQYrelpZhFLVxSalRaN0OD1CeY2I4D9WFb8rvwuatCYb
         tYk89Qhhf5wgGG5Af4/GpZpO/SNCBgm5IopQg1VfwO+OVNzVlITiRl27asJUiriJCdbi
         Ki+VTVXa1g+FNpMdICS2j8qHiFUQOG64TQcbZcyHcqUCHAcimHZFifx01kFE0QWtRigH
         jBjUYGGB2js0DgadLvGOF95XwUa8v6gXDX2Yq/HeaK10k/Cr5zF7BT9I6lMpoVL517d2
         2GcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbhSHu62Ux20sLQM2tml+gv6fA8HYau7ailo+jXoY5JAYeL4mPwTFXmkMW2gggc3flCz4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8qAX7VP/q+LyLEnigqQOgh/NFYtj5/orBPpvQ2OdksD678F1e
	x17ZENIzZR0Mn0aZ80vtcXP3q4d+VWGQicoHRGEwivWed4/ShciB3EOeoN6nYBudvBhaI/CG1me
	mWlvDcnZBbzj5XjcAwyaO9BlkOJKzhdtnmhYv3dTEfQ==
X-Gm-Gg: ATEYQzzORcbD3Wfwb/QkV+0yvaAGiLxgfum6mliHEC0Lhk2FzVi/EiY8IY+lFZqMYHn
	rErXhilbm7DMhYyMICF2cDtNXxSIZ4Lz+GNGAL/WxnFHhPUX73r99uNn24KRxE6okoUZs+z0704
	YmZ8IL8fMJE3EuCW5VwBd/qtbYXoAPCycxY3l6R5Iu38hDege5gQNhjxh1jccoDHGjodM4XTH6o
	eX7aDqqPWOJiNsDFP74o5TAn96yzWdoMpLGbCmFRW8Am53Ae08UGDvC8cULEfuYvpI1I3hQtXbI
	d58IF9uO7BYoJXFhH4D3rpNA0U6YiFfoQlH4mbGkeGbJ3jqcYalybg0cdiskbqQJ1IGKtkncRTB
	FkUQUGALvIMlGORGZvEwZWz0=
X-Received: by 2002:a05:7300:4313:b0:2c0:bcca:e9ae with SMTP id
 5a478bee46e88-2c0bccaed2cmr503104eec.7.1773598909944; Sun, 15 Mar 2026
 11:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 19:21:37 +0100
X-Gm-Features: AaiRm504huR_jEPQjv25PhnCGlqvxnPL_8XhiojOoKqXdkJjPbWUaTm98aG9g50
Message-ID: <CANiq72kdfYLmhojMo=vOAc5tULjjB9V4bM=iUmm5cLGpF-zj=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Boqun Feng <boqun@kernel.org>, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 6:27=E2=80=AFPM Adri=C3=A1n Garc=C3=ADa Casado
<adriangarciacasado42@gmail.com> wrote:
>
> These changes were previously submitted as a single monolithic patch
> but have now been split into logical, atomic commits as requested.
> The code style has been verified against checkpatch.pl.

Thanks for splitting it and fixing the diff, this is way better.

However, it seems you sent v2 three times. Was that intentional?

In addition, it seems the patches here are independent from each
other, right? Patches that go together in the same series are supposed
to be related in some way and/or they need to be applied together, so
I would suggest sending them separately.

Splitting them into separate patches also means you will have a
smaller list of maintainers to Cc, since here everyone is Cc'd for
things that are unrelated to them.

By the way, I would suggest using the `--base-commit` Git option when
generating the patches (optional, but useful) and also Cc'ing
reviewers as well since that will increase the chances people will see
your patches (you may want to use `scripts/get_maintainer.pl`).

I hope that helps!

Cheers,
Miguel

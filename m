Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36AA3D890C
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 22:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276522; cv=pass; b=WlffSOF8102MbIAi/yXoPb/uWAdGYJaK2aXIWEPkyYiElIXGYwrsVs8WMCE109vS505cwgc1IwxnVTc2/MHI31GrwRWRP49AyfvMl155R0p6JPINxwQBfzZQVdZoj476uWUsiaW4rgz2QQeeiPVynBbJorqWqGpDo8M0Z9RDjwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276522; c=relaxed/simple;
	bh=66ex1fs8TchlYXvZh55rJ2lAIestaqS7kMHXiK1SnyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY+pEdQfPI0GNw8dEZ1Eg92Ti1iBe7Ui95SJfznCGhFDicdquBRRWoA12gJcN5NrqJ/ythy/WHo/O3Y8Gs01PrrFiDmVGetRFMg6L+aoHuN5IvrdIJGscvbO9c6nqdg6E9R/F6nlNrEsEbpx3J+WeRgYjJgELc1W6R3NRSK6aow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWAH8AhD; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWAH8AhD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69f7af97316so440885a12.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 15:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785276516; cv=none;
        d=google.com; s=arc-20260327;
        b=KGT8eUE5pUwB2A5XYE6vD9m9dFGKCYKEP4j+c6uj45QN+DBS5d/3ZJF4cXNRB5Iz9R
         4w3HZ9VDK/DgBJCU9do6nTgNgdICg1YtUqD+YZDi9ApOwpS4NP2Q9KpeJN8pbzFt0tSJ
         GNVEod6EQbIZkYGXCIjE2MwALRjCYPEfBYbt36s+SyQrtepkwip/AFWJCSdLvBO5iYT+
         fzeqSj5Sz8Uksb3v1hqB0nKICTIhH2Z9I/F76uZNpLW17L0kxQ3DiyNEY5LtxSpFtDoG
         XZ8tsVeyPRFQH/UP0iMM5KEZddyme43hrD91wjK515NOp+BbLyMqtFpEH5lD2WP6ETwr
         ndag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        fh=yctjNwSsWPL6NMCNX2FpoxQ50ux/g4+QDle+z9Ykz+o=;
        b=axFOPHCk1yQMs+QVe61R/eeH7+WQcbgEd+7WVIbIKiZGpAO41+s5XMWzCi+YNWGWUC
         lvZTw718vuZ0A6xjo2FB+h3rw2/dhECfoCOcnO+WBnyaJD8zf8oEESh3FxTMwpPjfHkc
         aQVwbwXHId6AJTDwe8F0pv5wokQBTzqzyPN4l7GSa/lVUq+/i+VehUnSH/bKQeQLV8JU
         U+HeHvN12UhcKu147XkbXFApsB5GNWcsuCDUJFR51A5/XwdKxJjv5DKiUfIu7hweJnVI
         oY6HWswte60PWnrE8swzpkQIBV+K7jd3IoqIkoUjtfp49idSjSY5zjLykx2K4jL+DBAr
         7B9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276516; x=1785881316; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        b=rWAH8AhDe/bmfwWkhfpzWbsNukQVJ1mFQC8Q4Ww5DeW1WL1Q1GEwXs5SXloOi+AWZL
         /E6vnqnOWrMviAydw/PeLUyeN77DEm1F6HTAIv//fKidcLPuoFz/6IwpwVZv38eYrs/8
         yK7ZfXOTTBMqD+lK76/A/GFwhZD4E8KtZp6yfB3mT66Vqq1sNVNjQsy8YSQ741LNkuSl
         RigWy/ffWIaW/iTk0tdPWYeQBVc9S88D7yfeZkfFOHq8/2rw37MzOLG9t1EqzglhB9q+
         mtbSg015rdV0RRBEFLMK61apPtDqX7qlVr0YIgYx2yG48I+B4gFtr2YqDQdZdGJNV2wL
         hk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276516; x=1785881316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        b=dX90g5ouwzwYnCYJi/wzJWPexgIW3o6DSlZdrInWNl2bwIYHRIQmm0elK8pww3i+sv
         wcOvZTKmPo2MFzvHV9j+MBjYXnbwf+gX4315r56R23Qau3HY52M4QAkr2SsP8whlEvng
         QpDf0F4yIQSAbdvjY5xaiP5iObsdBAHehpwThNMhJOlEf7l/lSYC9Coj/gcNBURgEbFz
         hXy+UsL9AeXehqqXdlsj/ro9PP0Z0l8F1GxBmVMaR+2YKz5BOkN2lD3peJq65pkohdXs
         j4u4BUjGJzFWUzzJSbV3my9r9wG4h4UzJ3Y99iUaZDs/hWR7wuIiPmmx0I8TUhlauGHI
         jhbA==
X-Forwarded-Encrypted: i=1; AHgh+RreOcsNq0JvEAtnewAF9wj9Iq/2Hmpljf74CwDm15LGOcoE4fD8aZfwO+1l/VAlWp0rZqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE5EYVuoYGO/AwBtqBxjj1Oe+My6sUD6KyImVbk+FhU47vXXMZ
	DkgoAdyEjKfG1Z0vzoUHDGFrTIMJMltELDr5QlcpMWSc2fjDv0gFYstHvmBOHLf0H6F8izF+wDU
	4+gYxUax/SAcDcibp+EtlP6nCDQxLyQI=
X-Gm-Gg: AR+sD12y70UXuyqlbmbavRFtweXfO8pjRWLxCkVfQyrBy0+Hr3cPXAu36gUdRwVJNOS
	T1UC6z6VElozJzv2yAZrBT1uPtN8xilBEkWVo5CDdNi34bYnQU9N3AaUGtXtidK7BRgD4taK1PJ
	wuDWBWwlwE6zEQzVrcjPPwqklN80d+ZhYug1wVi1xq85JY0+KrVtxbvZKV0FTDKpCIe7QUTWC4n
	A4vhh357KzOfsHgXkgnEOiLTQvmgYm6q6cOOG/76Ntk1p+suybb2hYXm1pgqdrtcteHGbWkhOj8
	/2XXvIjkIa0B79hXyz8Z2YNMoj/Vr8wNb5xnY8LDiG1aG9EmUbgJIkK1frPcSyYZgjWkpbJnzEH
	e++UTcJKFCEAyLEq9zEWvP3nUAr66UP/FrQ4iAAtcG7K6+oTHDMXzqVpOiMzmYqx4VmnK58rZ
X-Received: by 2002:a05:6402:52c2:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-6a034a5efd8mr2250309a12.20.1785276516357; Tue, 28 Jul 2026
 15:08:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714234609.902367-1-rosenp@gmail.com> <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
In-Reply-To: <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 28 Jul 2026 15:08:25 -0700
X-Gm-Features: AUfX_my55lIzgp4p1LgtC37hf3Fnv3utQEiKazUbNyOLekyaFQ7_OqDwCH_br3Y
Message-ID: <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
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

On Sun, Jul 19, 2026 at 8:58=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, Jul 15, 2026 at 11:00:50PM -0500, Frank Li wrote:
> > On Tue, Jul 14, 2026 at 04:46:09PM -0700, Rosen Penev wrote:
> > > Replace the open-coded of_address_to_resource() plus devm_request_mem=
_region()
> > > and devm_ioremap() sequence with devm_platform_ioremap_resource(), wh=
ich folds
> > > the resource lookup, region reservation and mapping into one step and=
 returns
> > > an ERR_PTR checked with IS_ERR()/PTR_ERR().
> > >
> > > Behaviorally equivalent with respect to region reservation: the drive=
r
> > > already reserved the region, so the non-overlapping reg requirement w=
as
> > > already satisfied. Drop the now-unused linux/of_address.h include.
> > >
> > > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=3D1;
> > > drivers/edac/fsl_ddr_edac.o compiles cleanly.
> > >
> > > Assisted-by: opencode:hy3-free
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Sashiko caught a bunch of preexisting issues:
>
> https://sashiko.dev/#/patchset/20260714234609.902367-1-rosenp%40gmail.com
>
> Let's fix them first please.
The unfortunate part of that is sashiko does not understand v2 patches
and whatnot. Meaning it will always complain about things fixed in
other patches.

There's no practical way to move forward unless done piece by piece.

As an example fixing the first issue causes
 [High] Calling `ddr_out32()` in the `err` cleanup path
unconditionally dereferences unmapped I/O memory pointers if probe
fails early, leading to a kernel crash.

because these functions are split into three.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

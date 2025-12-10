Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7831EDA0E
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765371221; cv=none; b=LE/LgJDTUGBh+VdDbscAT7CP9LUs36XnrTA5pvzX5Q9zGzQ+Cu4JX1rwkljWYATOQJh2jA4N8TcsBczJEtqncSjPB0YCRbub/pZRUgyOlp1z6tlfXEEPN4nx3bwMCnR5lPj7TxE9eTFtbIdPeFyKi8zNGdVfCWrCFX/uS3W6wBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765371221; c=relaxed/simple;
	bh=ffYwUy6DmitdjmTzpDWyPfbMV0e2+AUk8x9YqrUuwtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkPv3bA9BubJ2Hx/cyWOHvAtDx/pbNg+wirflwgOEvjXfQHcugycCjg4bwlHDej0YjALNctdzzLuaXFTZSInug7Y9uvlZ8T/MIHMjR4UXlCiZZUHdJz33HgRJk10gGYebIPihqyeXnp+n8USYMjGrNyNY5czoMgoN+66untcAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaSV2QCE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaSV2QCE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29853ec5b8cso87269115ad.3
        for <imx@lists.linux.dev>; Wed, 10 Dec 2025 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765371219; x=1765976019; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=;
        b=PaSV2QCEKLzKMi8+0DlIRl3qj96Jc65PWCNRpNodqnppGpcPidQ/1LRlNupcjYXXCW
         9DgmySvHaUbW3LTJ5NTASiZ0uPSSYBqkms/JtEjMZE9Hufsq/ndPQh/4mFhstyc+T8QH
         vIQjb6Jn+s2pRdNiWHDO9KKgGVBzjjqFcNRXb89h20cuQ4n+U46pmu06qjFthpcduWOd
         Ad4AeY+zPE1rTpqfY+n7fEIRXeSeidCC3GrOzF4Lx/wjJRBZDvk9y7QR0eK/NFu0y8wr
         8Jhy4+nbtoB22M+VG+EupLofwal7SNX5nREqCunn55ZEiNYwHGNn+JfIcOwJKaJzVMNp
         tE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765371219; x=1765976019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=;
        b=I3K89gphZCRe57Y8XRBV29HUeRtpoNAmHwfJumfLd8QRd8Bmv0jbLZTo0sNJISMcgm
         sYNwAnDi5e2M4lLvNWnSFjIeArQ/w6+dSJJfA5tfEuD9jXZFXaB9vRASrxfw8UGNLiTH
         6PTyi1ZX/wW2MaTAVV9b0z40i7VoM6L89XbBc81WzhXCeTftj4jR8Ce4UeQgjhtZa2Fd
         MJSXKj+/6/rm4b7aM8VlVGz9TCUcbl2iUsLdw+w7JDFQDombfvrhZo+psj8PCxWavnFv
         VNDCHk9CJrm4OrEJ6WF5b59xNb5f6s6US/PyNDuVtPa9avS7LBmsuV5iRk1i6tWRV7fY
         SCsg==
X-Forwarded-Encrypted: i=1; AJvYcCXqjWvrb7wu+DYZTx0ht9nmc4fs3SpwVGW7o5aXOVcrC8FkJLlKokhy9obT9D2skhppJss=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLTPc6beaBpoPCBe5QHJd0c8MuJBtt0kTWILtyfPekstKv2ygN
	Vrpu4XqAg07urkdgVCO+leCy8HE7GWoqXS3mPkRBIXPP4QDBXnJmMWikqafOevyHK3ZdCmpWia9
	zG4GNBpoheJXTHIDpSkuIoRAlmoqrUvE=
X-Gm-Gg: ASbGncuuV6nb3ujwadDX8nvJ6JgcA+UI4wqJW61bFNh1CTktZrwCCPxhfR7xnado+0m
	hMancvPnkMGjXHSknl07SK7++h1PaNA8IVYZLmNeNXpuwi8bYhfQeARYt0uhqs+CQeyOQ+N7sxi
	w1pLr4tWM4y7OYyYpYToWFZMJ3RtEQEuVPSLcAOP890jgdSzFEPPzS1bFeaEtQNcXCT7aSwccEf
	bov1Yb9ZS50GQ8a48cAUavoGDcwsRVnrB4oJ0HR8NR1x/y9S5zRfijgawrm5kQBoKFkh3jtRsMS
	NNkXLzN3BRJdZ5sFxhjIKG7I/7AgZ8oPi99dVTkbIU9VySileazwO5FtywgjTC2Fuvz2vGKoDJr
	RAW/epZD7AA==
X-Google-Smtp-Source: AGHT+IHA0/O6Wzz5bHmU/nrt457oLGG6ttX7cTEPQvhKpMwwd+6y16V/yTRgGiSk5FyZ9tp/nr1ta5W4YzVSuYnLH8Y=
X-Received: by 2002:a05:7022:30a:b0:119:e569:f622 with SMTP id
 a92af1059eb24-11f296898ffmr1599113c88.27.1765371218722; Wed, 10 Dec 2025
 04:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209140425.766742-1-daniel.baluta@nxp.com> <20251209152720.GA189083-robh@kernel.org>
In-Reply-To: <20251209152720.GA189083-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 10 Dec 2025 14:56:13 +0200
X-Gm-Features: AQt7F2pjwUAPAG7KNebgVirJuHxCoxM-g3DuFH_8a1gb0qP0UWiUfxOVxedsKqI
Message-ID: <CAEnQRZBV5ECT+P0FYPuS0Yt3C0xdpSmBpxjknhX0wa-c-LBXMg@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop commands
To: Rob Herring <robh@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, mathieu.poirier@linaro.org, 
	m.szyprowski@samsung.com, shawnguo@kernel.org, kernel@pengutronix.de, 
	festevam@gmail.com, arnaud.pouliquen@foss.st.com, geert+renesas@glider.be, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 5:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 09, 2025 at 04:04:25PM +0200, Daniel Baluta wrote:
> > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > functions for "memory-region"") following commands with
> > imx-dsp-rproc started to fail:
> >
> > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > -sh: echo: write error: Device or resource busy
>
> So unlike Marek's case, the first time works. Can you confirm your
> region is fixed address?

Yes, all regions are fixed addresses.

> > +             cpu_addr =3D devm_ioremap_wc(dev, res.start, resource_siz=
e(&res));
>
> Best case this is reusing the same mapping and we just have unnecessary
> ioremap and iounmap calls and devm entries. Worst case, we get a new
> virtual mapping every time. IIRC, arm32 will reuse existing mapping, but
> arm64 does not. But that's 10+ years ago I looked into it.
>
> Seems like devres is not the right lifetime. This should be just
> ioremap_wc() instead.

Yes, looks like for arm64 (imx8mp-evk) will not reuse existing mapping
but creates a new one.

Best course of action would be as Iulia suggested to move the operation
at probe instead of prepare.

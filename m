Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756E283FEF
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764669802; cv=none; b=BXzjUZJAfq2O6zA0lw6Df3ZFo8CqjGbKvaByT5ce5QI2ZnBlQ65+N+NZAzvI9acpqqcIJeA4naRgIQy6oYauo66Ok6LHcRN+R+FKw32iO62sKS/+b8s3MSrTG6p7TDX1/dMgLzweyt1SEVMxbz5yFnOKwEObKQdAAk4L3Q6n5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764669802; c=relaxed/simple;
	bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFLitZi4IUpJjtjsKHrCMzXqGCWBkeswpjnzL/z5m9EOPhmYaW2AVhGgQBg9261ghYObRwf+Y37Wjrz8ZVLTM3wUNA+pnqLiX0H9Tb3hOINuWz3v0l1AMpzDVRpcRetenwHk0wOnPPnt0E3K0FPBxXf3w7fSn/RvXn79z6TpL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gn6Tjy1p; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gn6Tjy1p"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so2040080a12.2
        for <imx@lists.linux.dev>; Tue, 02 Dec 2025 02:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764669798; x=1765274598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
        b=gn6Tjy1p0b2KCiZIdcWrIE96KTHIiDSbyEq+8iXraBT4TsUtHBisgaku/SwNXEocmD
         H+pwqWlQ8M1cb1wnRBxdHJUVX00wd8SJqoixXI6XRw5PzLG7LBuMYCL8fDDPdpUwpbQZ
         7jcNGMjIHuoYSkCdA99yV/sQfN6zAw+ISOMoakYYUsmxH4AQOOIhGYTt5cUfX3j9iAOe
         FmLxP/iXKMBZEtTo8bW7egs63ZjhiTyQ/vbMDiMWBcJm1E5bdhh6rvBoG7uyBEYz+5z8
         JPF8nB7YkO3yhVLJ7lwVgKjEc7ST80LT/fWwTdicO5rgclaHhUNJGrP6eWo/1wHk8R60
         e/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764669798; x=1765274598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
        b=rXqr7Ltz2RN3+79KH1wR1AUsvkTrizmxUUqAr/Y1xUcd3o8dYRptSZUd0QuWYVu90I
         ZnfjIHrqnphmazSguTfjjeXAKkDJM7B+L2Dg6C8/SILEkEHbYYM+1bFVN7Ac4nDLiDZE
         Fze7fMq9GmagC1pHHpRp2qKY4imPK04nHUfVKJKysowdWGDBkQH0brhPYU6i0iG/98d3
         CDljnDQEawiQd+qgzkXd6wH1B//GGEJW1333X3GvL6JYqTkvD8X2KtwYsa6bF49ICE6Q
         dPGr88o5O7dYyCZ5ns/WxPU13pm2YoQf1ylygGSKV0i4laJIpir4bik2zX7+9GllrCkC
         8xgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL7TdCDW8D/6/4bAKLHNusw5kFQQMbszh5RjRz9/ninHNtmMQWHay5T0y0tqZ52zclkhE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqzot389pr5lUuyFtk+cJdc5kDlGi/rryD57hJcF25eXtwU0LF
	6+r3aqKQuH9ZLvLFU4RVLkBKrJru2cESc944w4vUQ3CeX6IfI/S7N1Gf04S9FbfSLMfpdbPEMck
	tcglMRW0iiv8Fqa5laQPO+UA+m3mTxlQC8TcTDVv7vQ==
X-Gm-Gg: ASbGncs0EcDHmQqeoSlscEnYOb0CgMqlIHyrOBkeLjHLYuf6+oqt+qpC306k8gE/JNs
	sZWa9b7HmyH3yc0MvLC5F4j80IOSzw0GPQO0k+ejDy7JClb+PGgkXYDCeWCCPdqNKkIrklf++Zg
	I2jI67xFsYgGwY1G+UCtKnvDqlFVutkeql++pbQbCmc95MluErYWC/muI9TEysuUwyt/cOf1nkZ
	a/Fmf7NxRyUDhSvyQggxUXnmk62eYjkxe/HafZsNg2u7ix5k6iD4Egot5gmayhfiY4WJlSVisOW
	l7cL4gDLjtLahDoywVa+QwU=
X-Google-Smtp-Source: AGHT+IEzBZUvVe8v+NU3LgQcNDFZ1ywLGlvr4nq6P74LNME9ZQgiTo5FgVQnVsGl1RzS2H+nuAAtY4Diulatz7/9lxo=
X-Received: by 2002:a05:6402:1ed5:b0:641:3651:7107 with SMTP id
 4fb4d7f45d1cf-645eb23bc16mr27607615a12.12.1764669798505; Tue, 02 Dec 2025
 02:03:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com> <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
In-Reply-To: <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 11:03:07 +0100
X-Gm-Features: AWmQ_bnvt_8myvimspzAlsv7ON2LSirITDuqDAMojw-oVlxKenWaOKPgLgNEaRI
Message-ID: <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 28 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2025 at 10:53, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> > On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > >
> > > + Vincent
> >
> > Thanks for looping me in.
> > >
> > > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > > >
> > > >
> > > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20251127:
> > > > >
> > > >
> > > > on i386 (allmodconfig):
> > > >
> > > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init=
_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: =
.init.text)
> >
> > Are there details to reproduce the warning ? I don't have such warning
> > when compiling allmodconfig locally
> >
> > s32 pcie can only be built in but I may have to use
> > builtin_platform_driver_probe() instead of builtin_platform_driver()
> >
>
> The is due to calling a function belonging to the __init section from non=
-init
> function. Ideally, functions prefixed with __init like memblock_start_of_=
DRAM()
> should be called from the module init functions.
>
> One way to fix would be to call memblock_start_of_DRAM() in probe(), and
> annotate probe() with __init. Since there is no remove, you could use
> builtin_platform_driver_probe().
>
> This also makes me wonder if we really should be using memblock_start_of_=
DRAM()
> in the driver. I know that this was suggested to you during reviews, but =
I would
> prefer to avoid it, especially due to this being the __init function.

yeah, I suppose I can directly define the value in the driver has
there is only one memory config for now anyway

/* Boundary between peripheral space and physical memory space */
#define S32G_MEMORY_BOUNDARY_ADDR 0x80000000

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

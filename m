Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2D35DA5D
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449179; cv=pass; b=tTDfLv18U537bRw0MmRCyNPDq+rPNH6vKk2tkT1k1O4IUFTeNh4eW7+vG+SBWg7nWolCmxqrlVjsrHKToV2BSbnI30CPzIdwhTl756b5qv5WP8+kNWlbTuOVNGSzZuu+0dAas4wdhA9Ma6fLbOWSQcFS/fLd2jzlQadW/6UFMDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449179; c=relaxed/simple;
	bh=DOlMsHbMVLndF4FYMYvBm7QWT7c+r+O4d0gh3fB6Nu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SigQ5Ew+w4jxbZHcZdb2sMyFRfEit9RvMHik7rDxXuB8Jd+e8m8jECV33t/jA5FjWFkLA2J4BkBmLAbq0vTkhHKhfSYpJZ4YlscIglm4GTO5F15P3GM4KRBxgwfx2SvOU4vDzXYm4UUwsZm3GKLnr0PjJfMlya7MAn1hDJN7jhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2FHB9l4; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2FHB9l4"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d55b97f358so3785127a34.3
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 02:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449177; cv=none;
        d=google.com; s=arc-20240605;
        b=DGJWJfrFA87nIJ6wz2RMw/+sl0LS8Wa57iWdkXhgg8S8ilMIPu62qwVnwqrgbrimyR
         iPLyxNoZRF3E5rOdLIsY06DHNFqsv+vCBvFmuXUmgHBZdpc8rR6XiZfjHLmSFhn/Bfy/
         blrWY8B2GsisM3SwmwE1uOuwNj+TJDJgxESt05Oj+Mp0gW0I7BKQ6fD9qQi20euKSStd
         EHDOZdlb6ulQdup+kGF79E2OH8QDPOzJkwZxxV/zH96G1MelBGVzNlsLtyXbmr7KGGLl
         H19golPIxUCoVZsAp4msdLNqoxhHBEERtOrDVYh2OrZ3raeZW8kBdp1MqkNbpzcYTCiP
         P5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        fh=tWe+zecbxKlz+9ZIpqPvayZ4MF6ODrexidjprqsyOMQ=;
        b=bQ58P7LsahONfcHmV79YnHz+SxWwUh0dvoQg1oRCfe54eItuS2Y7sZ2PP0KyJPVByR
         l+JEWmbrbZwtivVgo543Ru8znLRfo7PwzQqY7qvB06X0TIcYfL0bgSjVCdR+40zbxQyi
         4/ojg9zXtW5/QywfgmPSHxoz8V840cUA6cJDJkOyLs6zklZe73qYDKq2MBTQzV8UWkUt
         EyDeV/KyW5HhBjdYKK8+lbD1dFe9dGGlZ1n57fVL7BfuETwNBpFmguTO61kl2gXpa1hW
         M+I3LxBq56DM1T4AQeNxA3Yu6800JuPR8xZ20vVsxwyOzpYWmf52+rni+hkliSR3H5Pm
         2UHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449177; x=1773053977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=V2FHB9l4bvBQvsjjZd8Tw4yRcI0Ze0SzZGgm+4NCtqNpYGsTUzJSIz22eufXzgFfMF
         TLNM/vcG9gy6CeOD8tX/7k0yOP/ASGI9j3/zDkqqL4hNkSPDpDRAlnL+wG4u89yT8SfS
         92peNirPYqxWLS67rnX3NnucV4asFDK+iqfw3dk4+kSuZ3HN68cXm5VLC0xWJQhaKs5e
         3rvWteVGM4aYTZ7DZxdG5nOL3KD5IZoHZuhTWvr7pVMlek1j77e+CzxkzDtrpmXOyk8L
         QoywcpLJJ8KuNPXSwxuglKxNuJb6+m9btS+ZTpeBG0/JBEeV02iYagP6qw3bLxGgQqVd
         9qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449177; x=1773053977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=FgrSvMIAr9vUUuFS4NS0IVyNqh6AJQJ8YKWHyHthHejRTedVUhGvNmYFpHFf+isxoI
         P+DkVv8/coETiQ4H28+kmnF8S7PAPzDnuIaEHTtwwlRwrZtF4SHfhxcHEPebKEzmdLQZ
         lT8g87u6D9wl7as9rJBKNJ9144zT8Ea2ACQsxEazFaxO2wB2gBbt6/ragEhOLk1etdEI
         6LF93SFoR6rdd7y+94lOIWBqjLN8eZRuOlVU596O7ooDaOCxKCF+CIK8MnBpGUAhIHhI
         Vg0GJQsINfDUclBvIvW08mqqA36eR7S289t0Q19IYPRLowP6udY3CIkx/4ITEtAMN+ZZ
         qH1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2FeiP+k5pqjTUF6pVgjI4186C6ncCpiN+FvFU6WPr6rxCXP+Go6+Q4W6OBq84ID4HH9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqpVrVtgGLpmWDmhdWdm5jRBZWeQANdb0w5Ebc2ch23c5JiOKX
	+kD3p/ZFtwXRL1MD7uU5pcfHDQvN2aBxJlnDpSFwjtFiTJ+BmYXKyqVh3vXfAHlfUBblqFIldVP
	RHletoPXu6STd4EvyCNT1fuaa88n9M+U=
X-Gm-Gg: ATEYQzym/21H6XyXVROajRIVCTVzQFpuLzyH/Hd41dIUSKMXXLjDXeDnIEltN+0PFKt
	MkCvlrlRe2u1/CQlZhbjrfVypajbpT/qck9MgAska+g2JpuHTxCaNk9MAMaPjEAGX3koQpl6f6C
	Fe3GdshFw7rFwXV0v9w3PYJcX2Vy/3jKxrYRhhlizkLrgNQtnGW2Lv/NZrBgzspW8C0cz5mBb0y
	x2EtPOuN3PZf9TkgBVC4zcJy+Lp65Ojj7yBb+tDcyhvoD6AGp6sFcVXtUwprONFJgE7Q242hUyc
	kI2WaQE6xCxT/amhsl0rq22drldUOcN1m1GEdGw/mbh2eUTvmFsJILHah5L6GWcj+1+ZpElKM0c
	=
X-Received: by 2002:a05:6870:3234:b0:36e:8381:db00 with SMTP id
 586e51a60fabf-41626d6496dmr5836181fac.9.1772449176906; Mon, 02 Mar 2026
 02:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
 <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
In-Reply-To: <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 18:59:26 +0800
X-Gm-Features: AaiRm50vW8aIhDL5VGmJOu5lxfmc5lcpsegRPt5hsmjpSbqi9ltnncK92dntUuc
Message-ID: <CALbr=LYMgWXcj0QkQYv-68gX2mkzyKrE2BJFeXbnoVXKW=F85g@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 10:41 AM CET, Gui-Dong Han wrote:
> >> Danilo Krummrich (3):
> >>   driver core: generalize driver_override in struct device
> >>   hwmon: axi-fan: don't use driver_override as IRQ name
> >>   driver core: platform: use generic driver_override infrastructure
> >
> > Hi Danilo,
> >
> > It looks like some usages of platform_device->driver_override were
> > missed. I found them here:
> > - drivers/bus/simple-pm-bus.c
> > - drivers/clk/imx/clk-scu.c
> > - drivers/slimbus/qcom-ngd-ctrl.c
> > - sound/soc/samsung/i2s.c
>
> They should all be covered by patch 3, no?

My apologies, I got a bit confused here.

>
> > The good news is these can be easily updated to use the new APIs. This
> > is required to avoid breaking the build, since the field is removed
> > from struct platform_device. The previous build likely passed because
> > these weren't enabled. I will use allyesconfig for testing going
> > forward.
> >
> > I scanned for similar cases and most fit the new APIs perfectly. One
> > exception is drivers/xen/xen-pciback/pci_stub.c. It does
> > strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
> > drv->name. We might want to change device_match_driver_override() to
> > take a const char * instead to handle this.
>
> xen_pcibk_pci_driver should use the exact same define, so we can just con=
vert
> this to:
>
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback=
/pci_stub.c
> index e4b27aecbf0591..301207b4a30dac 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -609,9 +609,9 @@ static int pcistub_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
>
>         match =3D pcistub_match(dev);
>
> -       if ((dev->driver_override &&
> -            !strcmp(dev->driver_override, PCISTUB_DRIVER_NAME)) ||
> -           match) {
> +       if (device_match_driver_override(&dev->dev,
> +                                        &xen_pcibk_pci_driver.driver) > =
0 ||
> +                                        match) {
>
>                 if (dev->hdr_type !=3D PCI_HEADER_TYPE_NORMAL
>                     && dev->hdr_type !=3D PCI_HEADER_TYPE_BRIDGE) {
>
> I.e. no separate API needed.

Thanks for the explanation, you are absolutely right.

>
> > Besides axi-fan, I didn't find any other drivers that need to read
> > driver_override. This is great, as it means we hopefully won't need to
> > expose a read API at all.
>
> Great, thanks for checking.

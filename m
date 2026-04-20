Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1633F8AA
	for <imx@lists.linux.dev>; Mon, 20 Apr 2026 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701057; cv=none; b=ms+kkqVJd1WV1Ud2HA/k8HtAEGLz60Qp5XmA76JbPlCVlslYlMYNQyQzEoRkVAYyY++FIcIi4NoVqIeY/dWu0P76nUb4DeMcjZv3K9H9R1OjnspS7jwV1wJTJEwjVS4QPJqE4/oT9wWyWVFiGCehktM7zkkxosRXMWaW5dNfzPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701057; c=relaxed/simple;
	bh=KIlPPGo0X7J+Rerxz9y7CSMVwywBHEeJRRBbryutCu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=unnXm74gZNchMGAGLjjKVLNB5EVvUzsh4F0pSODHNvhGpkTHqM4F2wp6OfqYHR8uuFpMG3pMZdAgp3nfGgCZ1Dam2vfJKvvYCOnmyphQVYszflcXz/ShPwQzD/bB7pcLTdPbqwao+J8yDHXFqhB+f1+6WY6fX9F7XI05seVL3A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=it7VYKHw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="it7VYKHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776701055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj5sN2uTms9dvgIclsPIFzN9As6sQ9fjVMFAHrqzo4M=;
	b=it7VYKHwrNiRIKreIyH9HRqM+HJVSKKJnUxOazSXA/UWGDkhVPixND9mt2fkYyFkHPOHp2
	KXeBMwqN1rsAUyz8oWYsClAMhJ7o3tw0EWRLHD8s6csXn0cLtdbg3RMOHwOjAu7AJdTbLP
	9ywvctMrJ+SRQRr6FKilJH3DjQORFNs=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-Cvvg5tI0MU-YIOTGNpwdLw-1; Mon, 20 Apr 2026 12:04:08 -0400
X-MC-Unique: Cvvg5tI0MU-YIOTGNpwdLw-1
X-Mimecast-MFC-AGG-ID: Cvvg5tI0MU-YIOTGNpwdLw_1776701046
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6101726c594so1102541137.0
        for <imx@lists.linux.dev>; Mon, 20 Apr 2026 09:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776701046; x=1777305846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj5sN2uTms9dvgIclsPIFzN9As6sQ9fjVMFAHrqzo4M=;
        b=BMpqC0HyzcVhrx5AQDlGZAyEJpmWEcRVY3C4s2RUJoq40Xj/bMJn000tjEAuRwXVg1
         ZsE36Cgpi01ayC3R8R+wL/jJ6WmWjI/qkiCkuSEArpEnPEZoJQRkKbj30usCHW39VOp1
         8fslMKYMjA5jyYfoSDjea9xHoWaUP+JJmky5szy4f+Ttc3XcMEnD96xE9wajNom+eH8U
         0ddHM/p0EqxQkRt6c42ERW9/F1bEbOiOpnhJQ6gd/LdFgUdemd0yHseZQvqRZLSUhGUr
         DVRMezZMJ8VobUf2Lo6smNyUoSp5itfXMCkwB1tHbB585YylauEU3D7xy2+ZHVmzRZNx
         PF8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/s9TpOm89hh9TEX23yEkYAfz4bKjcN+5SsH4wNNHwivK9NWaHpEzRCjievmTdDDxoojUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy9hhe6l9j5ubTjBWUZcZkaeKadLAr1b5snXDHLXQYOY5kC6Mv
	QrBaopHRN+gBypgChppixm/WxzDKbkvoIC+oQZTJlZjq8vYZPRaFx1MTjBjuhGLdmhUBZ2UDFg+
	fx/jWIttm/ltlk2zFzlwEOf8u2iV7MWAC7wVeRL07V+Kd7qTg87Zuzw==
X-Gm-Gg: AeBDietx/3c/7EGkbBfSpyqcQ7bBieov3bR4EObmgRDHZg2IS3dvWzVbkUnBRq5x7SY
	HWuqN6rY2WklEa5PXjMvnUfa8p7g2p1BiMdomxcPuQ7HMhDbg6biyzlmuMqOgdzXe3ohicPQk6j
	9gBBVq3QjQrGJ89RGGSZjSvcNsOk0sTEBujKT6y7nfSFsyM4wvtEJg1azLS4nEskoWGKorzZJWA
	SByBo/VPjPjmRDrWkoL3Gm9rvt0/z7D06Ibcvcsby1rojEYob1V1mb+tcK2NjvSvuepceJ71q+g
	6ZXGXuw0SJ1xSJbdctJT8TCWU2hOkeZO+PLYg+aVp2lk48dl/Ydjahwebr82BWBQo3Ch4hsKnF9
	i4p6QLuG9U2Hti9yX9R5ngCDLYrXgBwOrHrpaUX5PgQ==
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr5907111137.13.1776701045982;
        Mon, 20 Apr 2026 09:04:05 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr5907043137.13.1776701045394;
        Mon, 20 Apr 2026 09:04:05 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm817868185a.17.2026.04.20.09.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:04:04 -0700 (PDT)
Date: Mon, 20 Apr 2026 09:04:00 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXD5_Uct6wXnfx-Zw55DUJeljKp95ROOqbbBRGNGQsU_1776701046
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixing Dan's address based on mailmap update, sorry for the noise.

On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> Hi Dan,
> 
> On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> > Add the GPR syscon region for the s32 chipset.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >
> > [snip]
> >
> > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > index e314f3c7d61d..be03db737384 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
> >  			};
> >  		};
> >  
> > +		gpr: syscon@4007c000 {
> > +			compatible = "nxp,s32g3-gpr", "syscon";
> > +			reg = <0x4007c000 0x3000>;
> > +		};
> > +
> >  		ocotp: nvmem@400a4000 {
> >  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
> >  			reg = <0x400a4000 0x400>;
> > @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
> >  			compatible = "nxp,s32g2-dwmac";
> >  			reg = <0x4033c000 0x2000>, /* gmac IP */
> >  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > +			nxp,phy-sel = <&gpr 0x4>;
> >  			interrupt-parent = <&gic>;
> >  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> >  			interrupt-names = "macirq";
> 
> I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> dwmac-s32 side, but this appears to trigger a panic when reading the new
> debugfs regmap/*/registers file for the syscon node:
> 
>     # grep 4007c000 /proc/vmallocinfo
>     0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
>     # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
>     Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
>     [...]
>     CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
>     Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
>     [...]
>     pc : regmap_mmio_read32le+0x44/0xa0
>     lr : regmap_mmio_read32le+0x44/0xa0
>     [...]
>     x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
>     x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
>     [...]
>     x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
>     x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
>     Call trace:
>      regmap_mmio_read32le+0x44/0xa0 (P)
>      regmap_mmio_read+0x4c/0x80
>      [...]
>     Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
>     ---[ end trace 0000000000000000 ]---
>     Kernel panic - not syncing: synchronous external abort: Fatal exception
> 
> Running this through decodecode gives:
> 
>     All code
>     ========
>        0:   52800400        mov     w0, #0x20                       // #32
>        4:   8b214093        add     x19, x4, w1, uxtw
>        8:   aa1303e1        mov     x1, x19
>        c:   97f4caf0        bl      0xffffffffffd32bcc
>       10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction
> 
>     Code starting with the faulting instruction
>     ===========================================
>        0:   b9400275        ldr     w21, [x19]
> 
> x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
> points to a bad read at physical address 0x4007c10c; I also confirmed
> that the preceding memory reads back without issues:
> 
>     # head -c 990 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
>     0104: 00000000
>     # head -c 1005 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
>     0108: 00000000
>     # head -c 1020 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
>     <panic>
> 
> Best,
> Jared
> 


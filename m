Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D098372EE0
	for <imx@lists.linux.dev>; Mon, 20 Apr 2026 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703562; cv=none; b=qymbMnUWfsYnbdztCSew7OwVNgZSfccASStK5AYhO0MRvFn/WV5Py10oirxTtvyhHDMSfzh1XwmvtvT2+fyNUbO7YJBpQ58jNribWobY40w+ULaqqqwu8tjL77t4GKfZW3rcWrsAHPvt30iCOsxKbdzYUilOKXL/2GWi22GAI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703562; c=relaxed/simple;
	bh=8FNY7MbtkgjbsRoI1I6nx/707r+HF/T/RNrqqCg5fjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG26U/EiAtMy4Jf+LKseM+6aD3R3aA4EWhLLIUAMNEuz8QC7g8r3/inzeYH+OvVJfmsXejt4N8XRrCqab9jZ0fGWulkczvNQuiGC7GgfeLKH2G9NAI6SLu9RUlPn8NiNclZ4Bm9k+C0QIvInlWsTh/18hnEn6HMY+gYlKa7zkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtrzuYWE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtrzuYWE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1853129f8f.1
        for <imx@lists.linux.dev>; Mon, 20 Apr 2026 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703559; x=1777308359; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=;
        b=jtrzuYWE4s7Lyd4OALGYSIGQc+9Rq4VTrEmFcluTZg+z68O6PkLqKrAAbHR/aMweDZ
         I/R9N1z5amK+/TB0lmc4STqg90F5NySR8rlVqQ397PyCm2pdZed8vlNtbFbXZX5oq12K
         btTJFVbcQQqZg1pVSBMh3VjARWuJTQfO1JhRxdlA/YTbpULOmMj7AANxo2ymjHFLup+Q
         bhzviVrU3jk5BLD7LDLVhVycfs0HgUeHyOzrcsMzGfprfwcgZXw2Z1JMFOOQKzXJNHGv
         q5HVyDbeCC22xDx8qmPPCXSsOAPX/T1OedhPdToNY5ZxfJvqulfWy7IoLx3ZQQY4I8sX
         GH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703559; x=1777308359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=;
        b=BfigFKodg2NLKSDlOtp97sDCBOTVCAAr/+MmHwlec8Nmgfv+0OYhqh6XmdQ46I8bJK
         lRbwfwzAf/xKa8AgkgzVFUpLBzJBeusQyLWtwSDMzMQAhbDsE35wJGyzil7J0JssKfP6
         ILzgG8ZqqRg9uPvFY2veg9mkm+iCVO2f4ZjWcEKKcQHRHNn56oCuTprWNkkOp+3D9I7i
         3+I0jMiwuATEo6swgvBww1rq3PWdLrnfVJnXFoKVEpILT6EdxyXm1I+UeBuf4o1Fqk9S
         zLXm+FaBuTCPzaOCbjMTMooK8jpCt++vWp7HyQD5i3PDTY3uVAbQcDvc0Fc49F3ux4BE
         kWsA==
X-Forwarded-Encrypted: i=1; AFNElJ+aTQ89tLhd6XfIlU+eJkTe8yBnoyQImgOLnoc6XbR4bH3ERTtRXHu4kvDpB7JtlKHFGmA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc9ZuN839PPl72FoiU2amRJl6HZjLv9bMcJKCYqHiHvOIU4CRu
	SQF5efcHZfIVdJ2I2ilYZl9LfUTgmuA+vZ9xp1+nfYKylKJMr98dN4+g
X-Gm-Gg: AeBDiesbZVEm1zPxM38bR8QpzYvMFC8ens2LOHJwIBdtODmt4whX2yfpldqliqmjJwG
	X472uCrxhlcd4iSKfxo9Ba0RlrCy7fBpUC6OltQdZDmwdF1FfIMDpOI0yKLm5U/cvNKg5WmbVei
	WuZrKfvSNpm9dLs9nS8FT3sYwiusWfvT1+lWIyYPo1y6q6E1cpl5mXJ4PzpYaUDVHhr7hyqW9hn
	JBD45f2jUMyGcI9zxrlKAc/9O+IJV2/AAKsRHeRzgzCK0ZqVhduDaRdXaF+P63rg0WPQS3l7SRF
	1eYvKe+0KDXgI2DmNhfD1k1cQ40uN2CweKj9f/LGysOgbwdeZ9Ioe+OvwRExE5dD5ErerNOrYdx
	2/OximgGjmisVXexNMuBjDPD7XgYxMOaSqSXmLrNHmLNsRv8lKt4xUIDaV3KLd4Ywx+rFNE8VtA
	ayqbrlONrdFwkfVY82LaMcxAQgLZ1eQeGuOZuBImht
X-Received: by 2002:a5d:588f:0:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-43fe3dfd4aemr21673354f8f.39.1776703558306;
        Mon, 20 Apr 2026 09:45:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm32560450f8f.17.2026.04.20.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:45:57 -0700 (PDT)
Date: Mon, 20 Apr 2026 19:45:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jared Kangas <jkangas@redhat.com>
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
Message-ID: <aeZYQp9b5aoV7Ihv@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
 <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>

On Mon, Apr 20, 2026 at 09:04:00AM -0700, Jared Kangas wrote:
> Fixing Dan's address based on mailmap update, sorry for the noise.
> 
> On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> > Hi Dan,
> > 
> > On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> > > Add the GPR syscon region for the s32 chipset.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >
> > > [snip]
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > index e314f3c7d61d..be03db737384 100644
> > > --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
> > >  			};
> > >  		};
> > >  
> > > +		gpr: syscon@4007c000 {
> > > +			compatible = "nxp,s32g3-gpr", "syscon";
> > > +			reg = <0x4007c000 0x3000>;
> > > +		};
> > > +
> > >  		ocotp: nvmem@400a4000 {
> > >  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
> > >  			reg = <0x400a4000 0x400>;
> > > @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
> > >  			compatible = "nxp,s32g2-dwmac";
> > >  			reg = <0x4033c000 0x2000>, /* gmac IP */
> > >  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > +			nxp,phy-sel = <&gpr 0x4>;
> > >  			interrupt-parent = <&gic>;
> > >  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > >  			interrupt-names = "macirq";
> > 
> > I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> > dwmac-s32 side, but this appears to trigger a panic when reading the new
> > debugfs regmap/*/registers file for the syscon node:
> > 
> >     # grep 4007c000 /proc/vmallocinfo
> >     0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
> >     # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
> >     Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
> >     [...]
> >     CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
> >     Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
> >     [...]
> >     pc : regmap_mmio_read32le+0x44/0xa0
> >     lr : regmap_mmio_read32le+0x44/0xa0
> >     [...]
> >     x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
> >     x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
> >     [...]
> >     x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
> >     x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
> >     Call trace:
> >      regmap_mmio_read32le+0x44/0xa0 (P)
> >      regmap_mmio_read+0x4c/0x80
> >      [...]
> >     Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
> >     ---[ end trace 0000000000000000 ]---
> >     Kernel panic - not syncing: synchronous external abort: Fatal exception
> > 
> > Running this through decodecode gives:
> > 
> >     All code
> >     ========
> >        0:   52800400        mov     w0, #0x20                       // #32
> >        4:   8b214093        add     x19, x4, w1, uxtw
> >        8:   aa1303e1        mov     x1, x19
> >        c:   97f4caf0        bl      0xffffffffffd32bcc
> >       10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction
> > 
> >     Code starting with the faulting instruction
> >     ===========================================
> >        0:   b9400275        ldr     w21, [x19]
> > 
> > x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
> > points to a bad read at physical address 0x4007c10c; I also confirmed
> > that the preceding memory reads back without issues:

Oh, ugh...  I didn't realize that this wasn't merged.  I don't have a
way to test this any more.  The simplest fix would be to do change the
0x3000 to 0x100.  The GPR63 register is at 0xFC.

		reg = <0x4007c000 0x100>;

That's probably the best fix as well.  The later register areas would
be their own syscons.

regards,
dan carpenter


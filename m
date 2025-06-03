Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193081E0DB0
	for <imx@lists.linux.dev>; Tue,  3 Jun 2025 23:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748994673; cv=none; b=UnBSha+seajMsH6v1yOJHDkmqATFndnQOQhKjMDdNq31/mhFlawsUUXXmd8a8fsJhcws24jyAtq6Hd2TBFw7XFxz3BOwTmlztevz8RMcd/BxTMIMQPEISYZwaXIfsMjDJxzopeOUXML18PfcC9iw+Ul6RKUuACI3cym0qFtIGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748994673; c=relaxed/simple;
	bh=3iFWj11CkWHH71h9SyiDUGmXnlU/tw+q2bH9dzB+VJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZy2Iy3iCiEJZQjGJCFL39xcwevHXwybLA5SOb94tJ+kFd6TwT34RFBJTtlos/CVyMRV57RmjGzUoWTRyd7AJ9zq6JfDZoaGjo2BJ57y9dXz7/2fpdAPmY891wrP0bImn2pXKLC2ksqX+XWQ6Be1eYrVXaoSI+sMXI9JwM0mMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBQmbpn1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBQmbpn1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ae05d224so2997925ad.1
        for <imx@lists.linux.dev>; Tue, 03 Jun 2025 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748994671; x=1749599471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=;
        b=gBQmbpn1Ute+jTSqv5wELtd+4TmCzj/fkhJ2fz+HYjROuP9aNvVu4QREoz4r5c+IHP
         MFfzAaQznATA19puTtVyYTcMMkROfHlC2nXUN/Z+UmnHORag1VF+SqKtIEAu5fzDbd7P
         BuX9K0szhZ1SCnoCtYwmRc8MAHdvUAS8mjKEMrj0VX/GJ91EUDWk9kEu2FqSpBgKO3U0
         cTyxO8PCFlcqZE0NWm8CDqjsXQJ6msUHuZskxJismhUIqWPl5rCB//Z+Zpt0vlLNGojo
         3a4py24hyNwTy5GcSIBbx0eEAhBxre+C9cOZDylk1Slr1UrY7RneA8KSIiKpjcuIxeY3
         XjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748994671; x=1749599471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=;
        b=ve1xU8/kdK9sO5jJRsY3hHRneVeXQ1fy0zhhX3SqNn97wrYZLePsHcRh3qmzf3fjho
         203NW4l+5Z66hopK0QkFKsDGQqzANDKTzRqxSlVp0mBaG3mUQYYXfA3wYaDWCqhwOTjZ
         4nkcxhnJxpndGbKoS+4at1xmVpTO+RfFkWg7lB7WnPjGDw6SdZkbQdFUrtLPU3ltnnEf
         QF5LsHrWE3iocX7WmrCTlblB84Sjm1dwfZmgyLMmlpsa9TqmUPaBeoq/8SZcxEQ38xHQ
         ANQbh2SuQ+6XztIZ/TOX1yskaiHjTFFzchqQiNl+VpTcB9+9EcNQTzXo+meDFrMtdJv2
         Wj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfn/bmH/frX6Y2IrMfzLw1MtK7g1+tZqhtHdePSKcn6whQqVQygLZOkC9yAs+8e9EHDbc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz33g5AhN/NY7O/4AJEZbDqQF0J9Kgiu8tu9wV1mFo4tHLzCMUA
	74p2cMyJufAYMro535N+X7jQWI8K/8Q9CHFdv79LUwHz/DQ5yypngDEGWiOyI5b5ALBvd0ScVmQ
	XTRFlfU5mUnFm/FOrxf68MLRZ3E/6zY8=
X-Gm-Gg: ASbGncuRnq3SVULtkI4ocYDkK3rYsPsQLF8xHuw+ctbnmUE7fvLP1adpoJ5lTj4hRQt
	cUidRchGvQ4As9rV6sv4oeOeAvYSiHXio9kiaBB5PEJITDkuqRhw3lXcqzW8gVn8XBkap/GPtQL
	PEbsnZaYL/SE4Qr1Y63wfFl6K6DzX6b/xA
X-Google-Smtp-Source: AGHT+IFNst2H7GFHVcub0yd3Kmx7L7dZwZEJToym/csaIT88WJqNMHe3BnbzVXN+qxD/TPW9kbEM0Emgl9txshV4zbM=
X-Received: by 2002:a17:90b:1c0b:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-3130dce1bcemr1068222a91.14.1748994671162; Tue, 03 Jun 2025
 16:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de> <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 3 Jun 2025 18:51:00 -0500
X-Gm-Features: AX0GCFtCdZakQVBK8i9Mwd6h5JPSbdyOFZQ8LmRy0bByuZIyxG3rUNoDH5Gee58
Message-ID: <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 10:35=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Sun, Jun 1, 2025 at 1:36=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
> >
> > Hi Adam,
> >
> > thanks for the patch.
> >
> > On 25-05-30, Adam Ford wrote:
> > > The defaults for this SoC are configured for overdrive mode, but
> > > the VPU clocks are currently configured for nominal mode.
> > > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> > >
> > > This requires adjusting the clock parents. Since there is already
> > > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > > This frees up the VPU_PLL to be configured at 700MHz to run
> > > the G2 clock at 700MHz.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 909555a5da4b..848b25c9b752 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> > >                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> > >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G1>;
> > > -                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL=
_OUT>;
> > > -                     assigned-clock-rates =3D <600000000>;
> > > +                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL=
1_800M>;
> > > +                     assigned-clock-rates =3D <800000000>;
> > >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUB=
LK_PD_G1>;
> > >               };
> > >
> > > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> > >                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks =3D <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G2>;
> > > -                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL=
2_1000M>;
> > > -                     assigned-clock-rates =3D <500000000>;
> > > +                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL=
_OUT>;
> > > +                     assigned-clock-rates =3D <700000000>;
> > >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUB=
LK_PD_G2>;
> > >               };
> > >
> > > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > >                       clock-names =3D "g1", "g2", "vc8000e";
> > >                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&cl=
k IMX8MP_CLK_VPU_BUS>;
> > > -                     assigned-clock-parents =3D <0>, <&clk IMX8MP_VP=
U_PLL_OUT>;
> > > -                     assigned-clock-rates =3D <600000000>, <60000000=
0>;
> > > +                     assigned-clock-parents =3D <0>, <&clk IMX8MP_SY=
S_PLL1_800M>;
> > > +                     assigned-clock-rates =3D <700000000>, <80000000=
0>;
> >
> > I think we can drop the "assigned-clocks =3D <&clk IMX8MP_VPU_PLL>" par=
t
> > completely.
> >
> > Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> > the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.
>
> I think you're right.  I'll fix that up and do a V2.  I forgot to add
> my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.

Marco,

I tried removing the assigned-clock references to the IMX8MP_VPU_PLL,
but i found the defaul speed was 800MHz for the PLL even when asking
G2 to be 700MHz.  The only way that I found to set the G2 to 700MHz
was to set the VPU_PLL to 700MHz.  I can do that either inside the G2
node or the vpumix_blk_ctrl node. I generally like to have the
blk_ctrl do it since it controls the G1_ROOT and G2_ROOT clocks, but
it doesn't seem to hurt it being inside the G2 node either.  I can see
the argument for having it insde the G2 node, since the G2 clock is
what's requiring the VPU_PLL to be 700MHz.

Let me know your preferences, and I'll move forward accordingly.

adam
>
> adam
> >
> > Regards,
> >   Marco

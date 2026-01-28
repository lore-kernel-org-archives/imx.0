Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E20332EA5
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 21:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769635267; cv=pass; b=pfh+tHe6UyAlPS7U4L6YiBoMNC7nXs2P1+rcqQPOYBMkbEDnraVpjDjhWFkGEXt0tL7KZNWRjPZSOaccVxBj65DAWyCltYmUz5lduCBqhdEf6RYSsUtOpMMGIa/Poi3RF0MqiwcoSrb7kCpwo4X/2fBmmpWLn99/Jdm29yDIvpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769635267; c=relaxed/simple;
	bh=WQkN8WEZ2ANY9z3rxIK0d6tV7FybPoKAvZYM8kOVJpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQ7DAIycpvpGg+65q17QlfvkHYIVd6uVFyOT8Nz//0sTdia59bMpU5QDk1abAi3R2uiOOYoOAtF+I3voBazym34euUa1mspBAgcThTCs+am2+bV9eYWRCJO53wcwnfVO3bRTtnraEflEERZ4IivEl4tLiQV+rQjmIqkolIbmV7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=L7eE62P2; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="L7eE62P2"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b70abe3417so861211eec.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 13:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769635265; cv=none;
        d=google.com; s=arc-20240605;
        b=KQNiaj7Ibmax2cCqfA8Npo7DimWE4BsXUvqlZpDXp8wCH+4YF7gHp2LeYByTT9Zf8C
         nYX1nW3GMeZ8pkI5pf3vYGRQvNvTW5cMjTO1hbvKIR8oL+KTJqyJsGIuDPTf2Shw8raX
         gLvCLaYHnFB3Pdvp9fAMBkPq/BnH8bMr3GXvSD0WHPfp183PBdKG4i/ry6/isaLD0Cv1
         oqQeKM8NVyUrkPenVQoA2R85quXqXdlpGmN/89OyjOG92y3xeE7w/AoNnSwRy2E2mNQg
         LxJf+1yWfMv3DL83iL5MZpMBBjbj8bBci+a9W5x51oZdoHiQlddP2u0ZBO+L0eyd3rCe
         Niew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=196fYB1ny++ckXPgc6Gd/2GIlKheTEW/DwwNpsiJguo=;
        fh=qLaL1sOA728WS+4vEOME1u90emDiAVsO7EbfhGn8WjM=;
        b=aOFKKL2jErJU+Ru80nrImRzMzrKaYfUQ6zKfPWbgCB0RYyJF3k34PEtS/4n9CPHD1+
         UoCFOK1kXcI4TWyLlWXzvvn4O26yCPONdY781BpqUxUHZSj6j1ryYaUI1pGF/zMpnhcl
         XeVcF3l5ha5W3W782GSjKC+AfSVlYyoNSoRavM9HxmX8xQDCtsuHHBRb980cH+Qlt5wA
         aTpZzq2MGNqFjKlaMLM5BLcXeyQDmRsCD7/D9EgnXVvOphjc92B7tUXuH2CwU37s/Lp+
         xcroXSxS2UShQadDbAIa+EpZlr4DnFRxvCZJ7Dum8aZPvRwZS4SC7/SkBWZa52+1hf0j
         nmlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1769635265; x=1770240065; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=196fYB1ny++ckXPgc6Gd/2GIlKheTEW/DwwNpsiJguo=;
        b=L7eE62P2zq+C7n2VPdL8DlzzGYsx8EKPN6EVB62V7JyqGY/babeFkOBxkCnncTpOob
         ldSV1zsnXM91KTPLh1lvWNdO+59E6JG6/03kGP8BbHy3MxkJds/5DstZU/K2oWON2bSa
         NsGluWzxivDVwvRhBm6Ko2Ec204nGXMtEvgug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635265; x=1770240065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=196fYB1ny++ckXPgc6Gd/2GIlKheTEW/DwwNpsiJguo=;
        b=AznsWZ8kAyYsxem7wFnyNgcKlskj29S29zgSQg7qXVMTf3CzWFDFVbKmMy15iyHoG3
         iDrO11kJohRgxy6Ng/g2YDFKA4tdBL3qviRK5+KUmxfzclSc9ZJiXKCN0sXChfXJeWDU
         lAnq/Dk3CknonuflaEYhvyYfetpnB+I+v4ECFnmOFHkJR+00Tvd7cbwigGClku1Ck8QC
         Z4lnf8lO39yvVLKymUEAPhaNDdGdrovo2B6/mgS6Lc1pqkOY6Xqw5Nzgjvo6D2En/eXF
         NwOpZiOjXOGEAsdniZ/su/CEb8VLW8c0nfz469y9zUIgolJYYc/VUFDiMD/oYSZ7+2ME
         FSHg==
X-Forwarded-Encrypted: i=1; AJvYcCU4L3wi32HfsMVS1UFNTOlfxqaKLIG2Uvz4Pj07mILo/W5J0QJxQh7GzGRqxttPMrpTzM0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfuxNRNOxHHhs5GzjUwoyBly4ozTn0Pwk+M8HNkwb2Bh3o8jho
	whhSFRimDY1eVf3KGM3W2WHuMx3ol3NIERwoH+9mMnvxM4tT2O04SFqVhZ+81Bnvi31vpaXGek4
	RitRPH6lTs0mcGUroyfaLZfGZL91n6ykAhDZXO6fIVw==
X-Gm-Gg: AZuq6aICOs7blZ8RFb3phlVeYoM9zbdq7Yb8iQOcbB0Sit1X+JMpZ8mH7qM0imVPN4E
	4fOUVJrW1aFLTB298xL0zbfXT4v2bJMkwzdsliEXCUHR9ux1qJ+KDw6/ui4V7w76ul5O1ALCuLT
	nUUAjvltknNtjs+A91yIKaf6OYGn+xSsvevePtyXLfr7UV5xty4HRII1exlPfTYSvptmzQV+ODh
	KGagJLMki/LArUuTjwQn5i5bsDjhMSVHYHPR+ca1/T4fV8rickP3MoOhhBMibRn+JJ0QQimpdsG
	LmawRAuDKf28H1T1jhZKMfVaOQ==
X-Received: by 2002:a05:7300:ad09:b0:2b7:3281:6c33 with SMTP id
 5a478bee46e88-2b78d8d389fmr3828383eec.12.1769635264611; Wed, 28 Jan 2026
 13:21:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128094644.302313-1-michael@amarulasolutions.com>
 <13d1018c-d9aa-4838-8bb3-35c509cd3e35@lunn.ch> <CAOf5uwm30=AVhqm67yz8Y5TkX9FWdxizTevCGSeaQuJS0KqtNA@mail.gmail.com>
 <aXoV-U-yqcDJj2vk@shell.armlinux.org.uk> <20260128202634.gqevi76o6wnf5xno@pengutronix.de>
 <fe9385a5-170f-474c-af8d-24bbfa5eb3ab@lunn.ch> <CAOf5uwkr0Rmb_x0U88JAfozCQpkOoFOZ-V7BNteVZfcnNQF-Lw@mail.gmail.com>
In-Reply-To: <CAOf5uwkr0Rmb_x0U88JAfozCQpkOoFOZ-V7BNteVZfcnNQF-Lw@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 28 Jan 2026 22:20:53 +0100
X-Gm-Features: AZwV_QiIFrADFNxzm5F2oW2aYAjM_EJ9TkrxZD9o4caIe8dShn0VnY7xFM5-uBY
Message-ID: <CAOf5uwmzRfB-8qJPtgoCjV++TTTBawvifhuw_x08f=ehw6Rknw@mail.gmail.com>
Subject: Re: [RFC PATCH] net: phy: integrate reset-after-clock quirk into phy_init_hw
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marco Felsch <m.felsch@pengutronix.de>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jan 28, 2026 at 10:04=E2=80=AFPM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi
>
> On Wed, Jan 28, 2026 at 9:51=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > > The issue was with the out-of-band reset coming from the FEC driver
> > > which doesn't honor the phy state-machine.
> >
> > Could you explain this is more details. Is the FEC doing something
> > wrong?
>
> The fact that the phy should be reset when the clk is provided to it, is =
not
> connected at all with the fec. I think that fec_main does not register it=
self
> as clock provider, You "should" define the phy to have a clock if this is=
 needed
> during the restoration and we should not give any "magic" at controller l=
evel.
>
> * Marco * Your commit bedd8d78aba300860cec3f85d6ff549b3b7f2679 is clear
> and I have tried to use it but if I remember the problem is the clock
> is provided
> by the ethernet controller.

I have created this patch at that time but not solving it:

panicking@panicking:~/work/wandh/distro/linux-wh$ git show
bfe2e98b653637526213ba06dee92d2cf1f678b4
commit bfe2e98b653637526213ba06dee92d2cf1f678b4
Author: Michael Trimarchi <michael@amarulasolutions.com>
Date:   Sat Aug 23 09:34:22 2025 +0200

    ARM: dts: imx6ull-mrmmi: Describe the Ethernet PHY clock

    From d65af21842f8 ("net: phy: smsc: LAN8710/20: remove
PHY_RST_AFTER_CLK_EN flag"),
    the lan phy is not always reset the correct way and let time to time ph=
y
    not configured.

    Change-Id: I21549981bdca7581dc65acf06007136c24be5d56
    Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-mrmmi.dtsi
b/arch/arm/boot/dts/nxp/imx/imx6ull-mrmmi.dtsi
index 03a870e317cd..0a1618ced6aa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-mrmmi.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-mrmmi.dtsi
@@ -237,6 +237,8 @@ mdio {
                ethphy0: ethernet-phy@0 {
                        compatible =3D "ethernet-phy-ieee802.3-c22";
                        reg =3D <0>;
+                       clocks =3D <&clks IMX6UL_CLK_ENET_REF>;
+                       clock-names =3D "rmii-ref";
                        reset-gpios =3D <&gpio5 9 GPIO_ACTIVE_LOW>;
                        reset-assert-us =3D <4000>;
                        reset-deassert-us =3D <4000>;

Michael

>
> Michael
>
>
> >
> >         Andrew
>
>
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

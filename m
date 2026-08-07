Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2317368D59
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786128538; cv=pass; b=cDtxLeRBGSSgnlLhaeypgzXTdOUh6ubmicTsv40SK5bx3JxEkwrm0mpF+gocRpkYKGMeJSiGvpD/cIyIrDEMTEJVJ1XhJSUJsG6PODepGDukf3Z6xkKBUcONz783y/NtGarPomRUJl450xt7aAoJY+ZS7eqs+s9C6ZmsxQ3hmZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786128538; c=relaxed/simple;
	bh=K/AYQ0slGtGh2aGVAcbd5Ml309uD9bp7iupPakzq76U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cX+0RL4D8u3vHCAgyp7bRTelKIjiB1ptdM5rr0U4t7Dlw+3lwpEsPLI2PQL2+46op3A3XiKC8Tqk5ePoenaZZLxQv+pQsZNG/l7Bw1AltraU0hTnS+j6FeHvKi5qjWMDKglh8TaVzYKA1hxswFks0NQDaa061YoimrTUWYQF9F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSjTG8BP; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSjTG8BP"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73a442f7cd3so2298706137.3
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 11:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786128536; cv=none;
        d=google.com; s=arc-20260327;
        b=jTllRJOM3kwFmXPnUmNvpi8rnqZryiQhke+Rx8jUhW4MdXl8T/XZsSAvaJB7I8IzCZ
         WYvo8plgaKjTtcCs0ZQyG/RTPt+w5EQOy0gGEvilydfHXMRuqMuqRY9/JoMFbPrAm2zy
         +czyhIQ8dxnLtwgXfLnBP1yA2bcXlXpF2ph+BaZxIneDIU6GzY+/EXzf2YxFlYUVdC16
         E7FFLGwyUMQ0cDIaVXSq6J09PaaczK2jg9uiVyV1Sv77xgZk+TlKpzv5emvcJpOzVmI4
         WbJerAhq9B6V2iCBDxbRz/uSuhPdeqinwOBrS4ddky7stOs+ugYAVMlEX+xUnqUJnnEf
         WpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KQbEMAEah3Uz8h1TWdBCzAeaWUqz5MbVi1G2fYGojfc=;
        fh=IrX5my1Qd3E0LAOv60bxuPCBZPy1g9mSOoOM7tcdvO0=;
        b=n3APglsB/Su7GlR4opBlyGm8IVIR4sdVsO+9cALAbZfo3+oqyL8mG63sWHfuJVNiI5
         t1McawsmBXIs0/LY/tukLZ1YA3ji4qbuEkd91RPlMEI1yR24DzbL5AhA6AQwDX6hDr+G
         5B+/yJE6OAA7zjtzzHauHAw48F3L3NeRSlfRIa8KHChAzkd4wR555ZT9sKEyPvTTmZVw
         BzZawYItR6EuUd3aVAJM4sxbA9K+NrC+m4r2YWIwfatEKrvHm8Bil9TE9gQfF6jNM3a/
         ndMXHoW1x3ZdPceLuvelW560PovkMNC6VRHZE8zYPvXs23j1sT1moNmNeKmQE8Zax2rS
         9ijQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786128536; x=1786733336; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQbEMAEah3Uz8h1TWdBCzAeaWUqz5MbVi1G2fYGojfc=;
        b=qSjTG8BP+Kb/w15kYf5UmtzB0XfbhdX9O12x/MFKBxV7PqQsmMjh2k2GjEBYUDGfqO
         V01Ud6Z6NSzwNpj3qA2HopkKtgCJKXjAxxWWT44H2fcAnQZlaeYbELlRpmDIniLHA/Lu
         sPNIJDJJShMjM/rjV/2vKdzMNIIsAMoyPtf+tnKTF0uGArR/1aH4S0LW/wxMMN6pALJz
         YSZBuDVEg/wBCRuX8IcJ/0gpXVMVMPOJslYOHTIazrgOleYxHOskQBKOKe6v7wYQelJl
         wiJ+gHl3iopwSQiJeaNwBA0/b21luNBlHIVvQ07dZ8iSgwuH37ZZujwIgCpnPxiR0xE1
         FNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786128536; x=1786733336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQbEMAEah3Uz8h1TWdBCzAeaWUqz5MbVi1G2fYGojfc=;
        b=X8ZwhoNLrhzw8/qHAb2kKmXpHOTaAxrai+2fit6CVOmo7sjX/W47GHDr9W/ckfCLEa
         ypE5V3iDN+X5VbhpKmsCK1ScVs70V2FfRxyhSPISPpWKq8lOtbVXAlk9KEnP4QABsh4b
         Qy8vSjwCw9XJFGDTs3u1w8m1GSHpYbcqXtt0JgsMJXmlz+Y4E0nITCEwx2sxZsOtWfaH
         X7cA8TLQ6SoZHskf1T+6i2TcsnzjaW/ZvHlUB4Tt/ct5Nt5hjKEDeilscmJ5/8xKa96k
         RV54Cj/boDbtlXO19fm9+uH2UEJOQJMhrBOiYsFaxe5NAm9bHahyMpqB6JEjBHx3Gvhm
         PNYA==
X-Forwarded-Encrypted: i=1; AHgh+Rrjyug9T700c1Gy7ADymGPtgh7JBoDY9ALd+/S6bO+/6j1YRH6Srx0c9vzzUBA9s2+8P/4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmh8y6T24+WygtdYPXcJCn4Ougoisv7ydJdzwy02PVQPNcykf3
	sDM9FYqAzhhQvNudVj0a2lgxpU5mItUNdgaYpJHqC4INkGvrBo/6g/VtxKC3EMB8VMWZH1UADbG
	7sUQQrnTbekmpifSGyuDJDzqU50Gq/t0=
X-Gm-Gg: AR+sD11yuaXBpDRGN7uDjNRuAj9hAhuS723Gli9DecvgrQsgvjafPXVDgbAYiQEFYSh
	nIGuU2koDRsK7YAm9IuZ/7BFUwtXO4FhQCVqk0o/cOnU0s3IsZqkrIoCVTT5a+ifg0R43Yn364v
	4tGUll2C3B0UVMod3GSZuOZZQBcCRv0nzHb53taFSypvKg6K3jlT4KL+o8Ox9kq2EmxR7GX0/8o
	gInJRPyCsUVWgj1/0g85aauK8qhKSzOabgU7npKZ1Wsgp/p7SqZgUR+z9OCVHvJE2ndLyO3oiP/
	283Km5eJfnzAucgJgmaQg08FGRvMSs6+Tb8zl/MFZpgNLv4qmu9zyaN5An9DN50/nPX/6gsgyr9
	TgKYqkKCCslgfPUZR3xGAYWRkiJQOJBM2bDlv196HtigW7eXCp5P1ioqlJeGxK1f3QX1pvws9jt
	KmI9InW7OxJuAOsrP97ZJ/T0BsmhmML1pM8UgWSqyejvCuSPk=
X-Received: by 2002:a05:6102:41a1:b0:73e:9fae:5845 with SMTP id
 ada2fe7eead31-764e1c5f6d2mr939262137.0.1786128535635; Fri, 07 Aug 2026
 11:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch> <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
 <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch>
In-Reply-To: <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 12:48:43 -0600
X-Gm-Features: AUfX_mzkWefaGr-yvRIWAT7-WpS4J20YFg4GvupbZl2AqZK75NjTjLSVgtv1IY8
Message-ID: <CADvTj4qrYYA-e+9iJ+q4UaZteUjpypRa6HBSmwp-ajwPbwYERg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 11:15=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I guess it can also be used like this for live dt modification:
>
> A guess is not good enough. Give us a concrete, in kernel use cases.

I searched the current tree for callers of the OF changeset and
overlay APIs and for OF reconfiguration notifiers. I did not find a
current in-tree path which adds or removes a child below an already
registered MDIO bus.

There are concrete existing kernel mechanisms and DT descriptions which
could become users. lan966x_pci already applies an embedded DT overlay
from a PCI driver, and the FPGA region code already coordinates
in-kernel overlay application and removal. Mainline also ships overlays
for TI J7 Ethernet expansion cards, NXP LS1028A QDS cards, and other
boards which add PHY nodes below existing MDIO controllers.

Those overlays are currently normally applied before Linux starts, so
they are not present-day live MDIO users. If an in-kernel line-card,
mezzanine, or FPGA manager applies one of these topologies after
detecting hardware, adding or removing the PHY children below the
persistent MDIO bus is exactly the operation this notifier supports.

Likewise, a driver which identifies a PHY or retimer package from an
EEPROM, NVMEM, or firmware and then enables the matching child nodes
would use the same mechanism. The kernel already uses OF changesets for
analogous late hardware selection in other subsystems.

> > AFAIU the patches other than the last one are still relevant regardless
> > since they are fixing a bunch of generic mdio safety issues in code tha=
t
> > has users since MDIO maps already change at runtime through non-OF
> > paths(i.e. SFP insertion/removal).
>
> Fixes are fine, but please word the commit message around real things
> that can happen in todays kernel. If it is a race condition, such bug
> reports often show the call stack of the two racing threads.

After auditing those paths, I would qualify that statement. SFP, AMD
XGBE, and Airoha all modify the MDIO map at runtime, but their known
paths use subsystem-local lifecycle ordering to serialize removal and
attachment. I do not currently have evidence of a reachable race in
those particular paths.

They do demonstrate that the MDIO map cannot be treated as immutable.
Its safety currently depends on every producer and consumer arranging
compatible external serialization, while the MDIO APIs neither express
nor enforce that lifetime contract.

I found more concrete current interleavings elsewhere. For example,
PXA168 can scan and attach from ndo_open while its remove path
unregisters and frees the MDIO bus before unregistering the netdev.
BCM SF2 looks up and removes PHYs belonging to another MDIO provider and
can observe that provider while registration and OF population are
still in progress. GENET ACPI and Davinci also cross lookup, reference,
and attachment lifetime boundaries.

> Do you have a board with an SFP cage? Can you test your change.

I do not currently have an SFP-capable board.

>
>    Andrew

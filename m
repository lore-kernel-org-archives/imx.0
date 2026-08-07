Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796B1A6823
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131250; cv=pass; b=OA4FeN6vKeTjUvFJ/VmOyj8aKMD4PhWamDbsGxO2+cLC2ce8PGGFLUf5udDbQIgjiECPKNPZ/EHwZe+ILbTsvTWpN1+/GWrV9SJvIvcgPdsDuim2cSrsMI6oQV4cNQ/0Rg6eIbDvpFj/lBD45dB+tkfbLEogJcqi7DvnSXnNS2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131250; c=relaxed/simple;
	bh=U6y2778gV/zoZJ4mqp5v2pm/RGDs0J8HINfVltgsuYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZajRb1MZahtMpecB8SdNUMx2jRXjqhZ1dRoXru0bNmLkKKqr+Zp/6uf0IJAAoqg7GNgWztmrctRpzm8m6bmfwBUoNT83SeQl6rulcZ7XlomVgvVxbDWHG3a7L4OAA2QEreUaG+Kab1n6XWZxpmnbgAifUSw/U6LwVg1iBnmFeXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjHupp95; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjHupp95"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7389cff36bdso993902137.1
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 12:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786131248; cv=none;
        d=google.com; s=arc-20260327;
        b=GcwkqgvhZWZ3CpPAGlM6zC1kkfRJFdrgMN/ooXSc4mGjFI/+9xzkOhRemBjvuRWJd3
         iUazL5WVt8Ke1ysh9qx1bak1nAQXoCc9b1682/fzbqneGPuuPQSzJCXvxIlgzQ7F/Ttn
         lutlUDEomIZETWP5VBGxFnAn2C6gfVJtWUvh1NIvbzNjjjaPUI/YOMYCi6vL8gZMz7S0
         TCYmXS/8h1h4bvoFKT/YVlHYrRdZ9/p581O/M7FDltFXPKCrr1z1R6iKufZbNe9BR9Ty
         DaVGzxO9wQC0dfKhx80A00qlmrAEOym0clFj7LVjPWbYAmBHMjwaIF8PyZD6RjB76Pv9
         agEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9caxZJDo+1eTj4vuH9vzEsfwbNVL6i24iyprVwcm01c=;
        fh=wHXUigzgKQ5Ro1jqDDtD1PL3aEdbFtkN5j4ctQMks28=;
        b=sx+SWoprzAmrnX0TlNwB0npCeZlKTdDWIyBZHGtg5b4+3epCdQ2oTyuj7z7wwVDw8w
         mAVz85XOgJczOzNrLRPF8vHLlaygTzkdz9MlC8ByWnvBAEAEG7kgY4B512VpKmTxS+4+
         BDh51Ssp/K1tAqESZtu/sM/2wI+O0wBdEOWcirKGXygBXR1m6DBTjNzaYPIUrSNPyBLr
         7nyhxxYnBIcfvCkbKJ6/ZkfqxbHj8m7ehguymWt6UsufLOm1TGImLGEaxvj3BBeqDf+W
         WnsPMlOOeJyWicyIpri3Y/MgbahD2cSUQCSuu6pRS7qshqxXYJM8RJfIdMf/pQU4M0Ry
         Py2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786131248; x=1786736048; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9caxZJDo+1eTj4vuH9vzEsfwbNVL6i24iyprVwcm01c=;
        b=PjHupp95t+CJ+Re+sYQRaPQy37nmbEtZIYdnqFhOe7h4q/sNoKkMZff/MKJhRcXNc3
         Fw6NJDaMXhml1FrIw9J0j917ftsB3vmANxYnUcTWaMQn/n/cp99KGUX11UhPnbLSeiyG
         U0J6XYeS0Ot0olfNTM6X0TS++BDCp/0H5kTzrIN5VqeXkHXOfPu76zIKZJarLud5vARS
         X6dAnkGqBDDS/6+AmIvVUP23mOMT0DnvJ0iXz+QLWzJJaRP+aSsO8lYGxvDbVGo6W7UU
         /9f51DAFdE7O15PMaqrkncwBin6MzSmH9UjtWrlRKycmpgqAJ1GbPy6RRKGeQL7B2HQJ
         /fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786131248; x=1786736048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9caxZJDo+1eTj4vuH9vzEsfwbNVL6i24iyprVwcm01c=;
        b=S7zfqR/lJy8BUudJKROtD+pjasgY8OCpO6Xx234fwEDQHqms5oyzRXm9jMXn3IHbOt
         8oS0EwTst9kr/E5rlvmgEpiYYNspVYaCSvyKVSnfUN8sSpeuWP4p6Ab105wUzxZIWTgm
         xf0g1pQLDzoF6jU+9oxxSKnWHReHQAfkqZ1FDqI+3AdXNBbhCX0xvoAUtBPz1k2VVj1S
         u/HTL16fqm97O1EbhBCT23cuLuJsqOLCTq7gEzHrkJRU8lr0gV++XAUGxyP8PXQfAMJj
         F+8YLmBx/UxTg3u3QJWDYjqkdL+NIyJ60XTDtErsydBwwo+tCDPFAyfNyMUsT9sUyZUb
         3bTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6CRcpFBs1KbuIQQ+CTKCERTN+pfrxLyjVmlr7bst6U/VIKG177FsaHPy/M1CLApex7yk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMevneYpk6lSBLmYX3f2jdIpUSF0HTEfGAn2X3XADh/VTL5W5H
	eWHNzaj6nmhSr8U42zRrk5vuZaHE4umoRFnNPN9evMud/PtrQhUSBgDG4UOi8YFCOR7XHxv9Y/M
	FzU7liMIfjoX3zZAN4pYLAYNXAKuCeS0=
X-Gm-Gg: AR+sD10Y3Lpx6vVVi1wMfOZCyNxPSprrk9oKs4Zt3CM3g934s5DzfsStZc9JvRKQhJD
	OsOmHJLJhTygWvLkBzk2TMqJlIcgIn23gv4YjPMHjBS9NEW5YUl87G/lLZ2b6jAmJAn3iJuBjpf
	TC/a5plkpLawZGU7Arv+brFjFGW1IscUUJDqPqA4gBr1rl6CY/taRxGn1riHPYNE1LmfWSseIXw
	HsyopyRUhw1BNfIiZgQH5O241k+9RWBXHHNBwKRsOJKiuBofCyB08sZJF5PIOdVl5jNAp2ywfz9
	UAbowNGofa9aIAoAaeIdTTb0JxqrtCkD4paIVCZnsWUhQ7oLxju6It4o5+oxYJaeyQVwxWRRslX
	3lVaPxtGbGl2I4FZtM4MX2ZVlKcOmNx86voit+JdHzYypbWNL+CeLvsRnNwUKUKN0vYKaRoq8eW
	qqkijDGPaljDVHTpGSJbBsPagkX++BogRzcpus
X-Received: by 2002:a05:6102:d8e:b0:739:478b:5bf2 with SMTP id
 ada2fe7eead31-760e8f347d4mr6463052137.13.1786131247763; Fri, 07 Aug 2026
 12:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch> <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
 <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch> <CADvTj4qrYYA-e+9iJ+q4UaZteUjpypRa6HBSmwp-ajwPbwYERg@mail.gmail.com>
 <3cd188e7-7dc4-4d67-82de-e2ef3edee232@lunn.ch>
In-Reply-To: <3cd188e7-7dc4-4d67-82de-e2ef3edee232@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 13:33:56 -0600
X-Gm-Features: AUfX_mxMpD-qand8wklMDqDrRd_xxDI0iY7G3-8rmiKaEvXH5AFL93SLf7_FiGM
Message-ID: <CADvTj4pJG56UERve8BfbYzjCLO4KBDDuFviTcz1ivuwUFRMdxA@mail.gmail.com>
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

On Fri, Aug 7, 2026 at 1:16=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Aug 07, 2026 at 12:48:43PM -0600, James Hilliard wrote:
> > On Fri, Aug 7, 2026 at 11:15=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > I guess it can also be used like this for live dt modification:
> > >
> > > A guess is not good enough. Give us a concrete, in kernel use cases.
> >
> > I searched the current tree for callers of the OF changeset and
> > overlay APIs and for OF reconfiguration notifiers. I did not find a
> > current in-tree path which adds or removes a child below an already
> > registered MDIO bus.
>
> So lets wait for a real user to come along.

So should I just drop the final "net: mdio: support dynamic OF device
changes" patch and keep the MDIO hardening patches?

>
>         Andrew

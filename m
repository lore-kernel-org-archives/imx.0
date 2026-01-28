Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79738359F98
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607226; cv=pass; b=tudv5HJAR1gf14tVz+20hVfcW7+hoqDxWyOyGPEFuwou5Ccuy8lxtc0QWzQJFVc+NOXXJ4GbjKuYpUbkLl01FiK+AZ47+K9YAJvXXKCyn2cOv2JlH8LVuxrHnA0aDt/39YuzlOXPGfjH3gDXxZtyWpi/xAVbx5vHEkH5/lnJrE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607226; c=relaxed/simple;
	bh=Tms/8Efk1qgX7+qJzYnVrMSSHmsH1dYEU1+2Vwk/mSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdAjySYphL9vM2TvkXngUwWcZjakQETGLPgM7qsOUwiQwrp7Dc/7COZrhYcT5JB7ilDemchz5tjdIEDkg2QyR9t7TJcF1Ytq1d7kTmc4BOnVflnvdMbC/zwK0deeDl7OiUNo3wbwlX0yX4yuYCwu8PgE84ctGbZe7xv8e+TxOP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aJVO21Jc; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aJVO21Jc"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so7353108eec.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 05:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769607217; cv=none;
        d=google.com; s=arc-20240605;
        b=KggR5gmPJryxXVdzcfGE3K+KHIYvYXp6ZKcgQvEZ5zp1q1gybuncR1UDzDtBK7D/hB
         JkJLYOWW3isorbVbMBTgyx6lVwgVl2fPLBIhL+LP74AqyU/eIxdpJgatdHrFGNJfjG8M
         0QDYmtLXP9zYeVzmrpmw44wprLziJkFCCC7Myd67wPMWarb/9tZNpKSaKXRcF9o2A6zb
         Mw1VNxMGfvj1sSb4vr8eby0k2c1bQeq+W/M3Y71cr/15APStajiawUzyICpDcGWWH1Nw
         FEjEkVI5rGuFhAHuZwfp/D9Eivw2fEt6cXQAVhl9P6nACW4PMsJaKp/Hr63ty64EMT0a
         fSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RA9TE55EWKKZ97sJJnOMdvR9v+h2t26GBU4KXan8Iws=;
        fh=3Y9O8mv9XUFBSGfQX+E4VO+1stvlUdYBCFAVkiwsdGc=;
        b=IjQ71mAkbOdSjr3+LVjtZAcnasxQRmtPlJ/3hNZnvvdkBhzQmVNa/1GGHw3WwlyRBx
         4KtcQwzLM3iTJhkoZnbUTFHHvh7hU64MPsUsHhlGKZP1Mj+g46mTD2bIUkIJTq6GDDjh
         35LD5crXYYNT3Yk3SWFpx45IMqqXyoVYKgqYSbIwnmV6xUM3/ta3FgkKVcSx2unGuUFk
         AZaxNuj2tpc03Zct4SdxUNFYmHnM01pZkuBFZKQNDHfYWP5bOJB9H/dZEBgLAzqRYk8C
         ZSMe1lcCSjEJauer6z6oF7zTJc4gRt3fB/Ib4FJt6CnVbGT0HQMr1TUIEoSpwxl70Hwt
         9UJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1769607217; x=1770212017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA9TE55EWKKZ97sJJnOMdvR9v+h2t26GBU4KXan8Iws=;
        b=aJVO21Jc2Ti8aMvz088RPOJA5p4g42z20SMywfLDYndxVBPFAu6a813yedtQ9KscqP
         I59MUVhZlvSsZ/j5XlRFxpvb9A35fyTqHER54Kok8eJ2riq7IZDZLJhv52lvbAxSKFg2
         7wjzEjBI9nkQ5F+CJ0Awniyn7TYA43yZZ1cbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769607217; x=1770212017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RA9TE55EWKKZ97sJJnOMdvR9v+h2t26GBU4KXan8Iws=;
        b=QlhIJz8W2QhftLaIGMcy0mu25coH5L3X8otZCKu0rYtKBw4WMdKOPz06Nx/6qay+Ey
         h4+bbB0LCMtlB8ESjwRjJvwjkWNKrlvWITvPC7cuxfkBgrvHujYpF5fvZgvDmN534P0s
         nGvNXVtIPvv15laYd9QV97wuZ3+8AdBDrUX11ISp6f6XSHyoOenyNvScaiIgsY7KdDXh
         R7DdraFJFL62Ik/8oU23IHM1pk/6mQaoFezUuHv1YyihPt6NQ8VAUEoMRgX++5yeBAtd
         Dm5acSdQ26mt3WFzcDrNQtLxTD6EqicTkCaXHu6b+/bOn3picpA0lCvqgt71T0795UvP
         rUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5VFdatCFwGAuBIcWTQNMzQ/WpfdgzcTGEymh62G1VAF3Wr4tu9ORtQXKoWZAihCm+YzM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPTHEV+ad/uC2U+pCh/tlEsY5N+SU1kS4r1KS8oxCxrXZkXBUW
	2Bh/tBP3/U+Ay68lYULxccIqWbY/In4upQTyGXHgxkpXsu9WmevQFmo8ZLy+xo3ODgJXWVpjtc4
	4biN7/1njiptQaNsN3tZtol7DdHjd5oO734c3Y7bg2Q==
X-Gm-Gg: AZuq6aIB/w8wMrBt7kE0Tw4+H/yQQ8lzI18Kn+3ajQgzAJ5mwqqyxkVz8MKdB6suNL/
	pPuO8tj/1sqYUnZHVje3rdTmTtMNRw0/AiiVr36h3oxEwwuugpVV5xj4ZteBADitv/EtGHjzqyt
	rB+zcZrli+Qf62fpV353r09W98WxQWSdJ2WCo0rnNkTcvGlbVpUz37XLLeJcyiVQhxeavM+fIuF
	TbHJMFZ7iD08ISrb5KiwK63QgXpMMj6h2z9wAHEpj8O7s1C3gQ5+xtKBxSDU+ljlnPtz9kqNXpp
	dNgz+6mM0ovWIjZk68ZO7n73Ug==
X-Received: by 2002:a05:7300:2317:b0:2b7:265d:9eb3 with SMTP id
 5a478bee46e88-2b78da6e6ddmr3049145eec.41.1769607217033; Wed, 28 Jan 2026
 05:33:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128094644.302313-1-michael@amarulasolutions.com> <13d1018c-d9aa-4838-8bb3-35c509cd3e35@lunn.ch>
In-Reply-To: <13d1018c-d9aa-4838-8bb3-35c509cd3e35@lunn.ch>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 28 Jan 2026 14:33:24 +0100
X-Gm-Features: AZwV_Qjd1qcCWoaexPQigCWo-zva9shEhgNv_ttVzyAO-FctiTwx_WG9daQpEWc
Message-ID: <CAOf5uwm30=AVhqm67yz8Y5TkX9FWdxizTevCGSeaQuJS0KqtNA@mail.gmail.com>
Subject: Re: [RFC PATCH] net: phy: integrate reset-after-clock quirk into phy_init_hw
To: Andrew Lunn <andrew@lunn.ch>
Cc: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew

On Wed, Jan 28, 2026 at 2:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Jan 28, 2026 at 10:46:41AM +0100, Michael Trimarchi wrote:
> > The current implementation of phy_reset_after_clk_enable requires MAC d=
rivers
> > (like fec_main.c) to manually track PHY probing states and trigger rese=
ts
> > at specific points in their clock management flow and was created just =
for a SoC
> > vendor.
>
> We try to keep workarounds for specific SoC vendors out of the core,
> when possible. It just makes the core more complex for an edge case
> which most people don't care about. It is better to hide the
> complexity away in the driver which needs it.

We should not merge things in the core that are for one Soc and
after d65af21842f8a7821fc3b28dc043c2f92b2b312c, I need to anyway to do:

net: phy: smsc: Fix functionality of lan8710 in combination with NXP fec

Revert "net: phy: smsc: LAN8710/20: remove PHY_RST_AFTER_CLK_EN flag"
d65af21842

The way the reset is sent using phy library is not compatible with
the phy reset logic. For now we need to revert this patch to all
the phy to go back working

Change-Id: Ic1b0fde04188c7cbfd8c94f9fa1a26d058e07d1d
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

>
> > This leads to fragile code in the Ethernet driver, involving complex
> > checks to see if the PHY device is bound.
>
> Have you found an actual issue with the code in the driver?

Yes, and I think that the flag should be used properly in the state
machine of the phy and not
in the fec. Is possible that is the only one SoC has this problem?

Michael

>
>      Andrew



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

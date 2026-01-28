Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373AF2F2607
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769634258; cv=pass; b=WFH4MAVRIlcLi6fn4QGNe2NOneEKVQP3pNqUhWxveO5GCTGdQECRb8th1pdGR39MB5FMUpbw7XpCZijkhUYF6oMi7ClPSmqs8XO2b+7V7H2Ccf2YYWWQ+CR6qD12hRwlXXocyJ/mVv1AXx3XOpjTMaNaCqhhFHXmpXZxALjjQgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769634258; c=relaxed/simple;
	bh=BygABrZs+wt84ZiF/+S94JaIE9wJlUmfQCMn9on8jek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APJzpBu5t45RftxObxWfK9jPe79R+X5pJn7uPKEf+Iu3CAufpJE856CRwiA8mAOay+KCs7i3RPku2jw3RUBnNqNVDMUeUWA32LBKDPgSNOeRoA5IET+LoXUfTCwYzEDalnMzna/rZchrcTQOUuiEV/z41JuXdqrPfi0NpWyl2p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=G858FBN8; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="G858FBN8"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b4520f6b32so672346eec.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 13:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769634256; cv=none;
        d=google.com; s=arc-20240605;
        b=UbwmpBay2FePaDgpvJ8n7Y77vdI9Bp3LNncOQ5N3SDQtZR9U3WGaSXjLYGpR8mUqxG
         2oKAZNMz1OaahD9BA2kvIPJZG/y9cdTVbnQhTXj19AWF8wGY4JoDL39EGmLJ7lTwiHXb
         NxncK5uxrt0MnaII8rx8W79k7BZIALB4FSp09f6oJNYCOanxzHmvgAYI9Xlw41Yv935g
         gz95Y5O61LH9RePy7GeCHIQS2YAhx060jyPsJ77aWSMpu+AI3TB0d8DHdEcD6m4FQcFv
         xq6+0DA1mzEqnlLnfZq+ZTWKUN7tTNpn28meEy/sFI1v30OiO/68GY8+iJuW//IxwAiJ
         tfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A+V9f1KpRq1EFF7gJxUeGto+TPrHemnbiENvZwSi9QY=;
        fh=c3sxdEPREMLj0HTs1JIx1E3rwpC2RbqhodMwr7mHymU=;
        b=krpt7kRExJoZiYb0EPQdM+3EWGN8RATV1YwRcG0cUuGJWWjF9wFjQpjE0CviptQfWr
         xE66jKLSD+k/TdGYnf7y3sPS8KzF2ZoaC7eNR7j2PU0/GLNhSyswy4XJQcG/yXib5mqY
         yC7mfZPOqoXvvhAF4ETETIRzoPYqYpdIHLfiaCwjJH9Pt1OBNfoNvw5d8edP2rb5xaj3
         2MvRKi/0zDpVUcsJhK4smnFprzd9sXgMuQyBLCx1ub1UqwjJB92l+3b1QtVeGvqm1yk1
         O230bq2VBSGTSKTg/bYEYzKR302vHDUkyN3waLKeayqmKafLdu/EuludmJ5abcaoiClz
         f5Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1769634256; x=1770239056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+V9f1KpRq1EFF7gJxUeGto+TPrHemnbiENvZwSi9QY=;
        b=G858FBN8V0oTAXNYphUHLdO721IRl/M+/rtShK8lL7mLJLgvKRw6ThXmB5/k78h5dA
         SbDz2yQpcwHzHo1qKoIFE4YM/NPwfEKjhWB+43Hx5HL/0EJf3F148Y8h1eTmZ0AMPgnq
         M0Gz984IadRv5GK/gcU94LthFmnWklxd7x32A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769634256; x=1770239056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A+V9f1KpRq1EFF7gJxUeGto+TPrHemnbiENvZwSi9QY=;
        b=rckJHmdkxLj+gDu3pbPcpav3yPpwEx9IZr8TB7DFnbVSs1JyMTjHTwk9idFSVOH9H3
         PAx7HNHoFZ2b+WAWvpQ5sKnpcHg6Ze+X6zz19H3xFtFFFYkp1cfFQ9zEykzeKyZWUkI7
         j5nwJC+sB8r3imCstHgD4KvOn86nQZzj5/LxbjNcxl5G6RI+GJMTnQsUKcuOeBGYM+ia
         PG7VJBEnAuUiwyFCnkcZqvcAamOxufz5psO9479JecDLL+0ikzTijxHV3DBb26QJKVj5
         ZfhqINu9Q/+USDigWeaBpqu9Ow+mLeLXJ5lzihEtDcU68ViABba3Bm4clrC+7zLu/fFK
         7J9A==
X-Forwarded-Encrypted: i=1; AJvYcCXPukcCfNVCFO/dBWLh1XM6SodsuR0jpOcWLT1lhJJye92vOx+TUHbop2Vwk+Ec2UWcFaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVa2vxZe+UVI0G1WyMgUfRuBRP/A/BmUM0WksRlmjLUCbKeZ3a
	UvoytW1XzLB9LWTQ+G25tMZ8Wrz8MVAXt13MswiuFPtikKq0QqjcP0mToRYNEBu226v5j4wOg1J
	xthHqTG1C3tVQ+F0q6caN9IlqLsLAzK/AIqiMMn7dWA==
X-Gm-Gg: AZuq6aLBZTYL299B+hoqrLnXabg1jG/fthrqIWnO1A8g0EH8FOQ89sSWTdGbwQIshJV
	LnLlkKfblQdATWu1x03Cv42W1ihDPR9aYovexzMq1ecYAy+OzUFcAr71t8hzqHp51Dmiu11u3Zy
	h2Z8oJZjKJIjck30v+dVU16r5Kcb/Vg5xAetfsvy+KF92VoVbaoNQA9bOn1vtyH3NXF5efkNTuQ
	TdKb2rAU8jLEDaz5xWSZarG7mS5fKicayG3sUt4znlqA9h04hbQzhwSs6XbiTYHNSGOUD+hO8eL
	uv2ooBVOxRpx4SgEvAmJ2C+pAA==
X-Received: by 2002:a05:7300:bc99:b0:2ae:614a:330e with SMTP id
 5a478bee46e88-2b78da0d5f8mr4150693eec.41.1769634256264; Wed, 28 Jan 2026
 13:04:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128094644.302313-1-michael@amarulasolutions.com>
 <13d1018c-d9aa-4838-8bb3-35c509cd3e35@lunn.ch> <CAOf5uwm30=AVhqm67yz8Y5TkX9FWdxizTevCGSeaQuJS0KqtNA@mail.gmail.com>
 <aXoV-U-yqcDJj2vk@shell.armlinux.org.uk> <20260128202634.gqevi76o6wnf5xno@pengutronix.de>
 <fe9385a5-170f-474c-af8d-24bbfa5eb3ab@lunn.ch>
In-Reply-To: <fe9385a5-170f-474c-af8d-24bbfa5eb3ab@lunn.ch>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 28 Jan 2026 22:04:03 +0100
X-Gm-Features: AZwV_QjeVK6653l_oKvazr-qVIRp2OY5CRy56KYjvXXmGOXOKRv3DL9zvmlu5TU
Message-ID: <CAOf5uwkr0Rmb_x0U88JAfozCQpkOoFOZ-V7BNteVZfcnNQF-Lw@mail.gmail.com>
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

On Wed, Jan 28, 2026 at 9:51=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The issue was with the out-of-band reset coming from the FEC driver
> > which doesn't honor the phy state-machine.
>
> Could you explain this is more details. Is the FEC doing something
> wrong?

The fact that the phy should be reset when the clk is provided to it, is no=
t
connected at all with the fec. I think that fec_main does not register itse=
lf
as clock provider, You "should" define the phy to have a clock if this is n=
eeded
during the restoration and we should not give any "magic" at controller lev=
el.

* Marco * Your commit bedd8d78aba300860cec3f85d6ff549b3b7f2679 is clear
and I have tried to use it but if I remember the problem is the clock
is provided
by the ethernet controller.

Michael


>
>         Andrew



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

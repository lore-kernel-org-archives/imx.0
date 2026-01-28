Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D27359716
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610896; cv=pass; b=uhBDWID3KR6KeiCB25z4R8ajsmd0I2mDoMtyCH6DR0UrVfYA/IJa4ikgq1bZCINZxOspKWxEV3pPIwbS4dVK94iGLkVEagu3X1wF19wt3lWrTA1qENyoz/yqt8M8a37ZUJcv90dWUzG13Y5K6XYYdbxJiUQEXFtWoXJWHCtL3Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610896; c=relaxed/simple;
	bh=UYjDQFIXwCpEoQ5tqr1aJ0ZE8sXdCkFKLSofbuf8EMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJbgDRWiNYunerTL+XaIMzABCDByTBVH3Be+fHamjKPe2CJnItDqpyQoLH8J95EE5qsUaA6G6klYcy9i6zzZOqcZaQx8memfqtEzx+qmrqxo1zofxVn8HyRgq9RDoRVmEuRj2eaTwy/tJG9fYd/wiWioOajX8KvQUkEB2+p73vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Yeyrw07T; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Yeyrw07T"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a1b4dd40so1101061c88.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 06:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769610894; cv=none;
        d=google.com; s=arc-20240605;
        b=ak0Al8erzwks+davy/zRBDb6lKNWz1HPBzV2DBqPsxCzWl3C5OHpKoLGYeOf091OEm
         sLpyy8rf/Rrh06RtwZueLKyArUFFXa4UMd9phCqiLJfcLKqvGIhIMNy+JDehgIRO2G9G
         1+lzQN1jLC96kd44ZY32S8nWka8dTzakvVR9ob+Y7kiDu77KT35lAP7fWEMZ89XJJiBH
         sy9Jly1OEgckcBVsAB6o2OmDDYX0wxt73exnY0n7pey8Kptj7PUNqnWkLrGMm6KrbYbB
         bHDCgoYfOhUtonM+ly1YAcifkMORL+W8zkI+wTFV9lVog9YslTbw4CjC1veK0o0Fht8h
         PS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddA/+oHzfXwIvJwF7dTojsUX4x8Sl87piJCxJWIc4B8=;
        fh=VktTfmOrLy+QJeE2STkqPADMFfA9BrvjlXQdW25Y+xk=;
        b=XrMXJNDSs7ysg78J4basH/q+kP3S7DyvCVzy099HutsacY6EegDFUNte6eMP3arZIg
         A8QXj3AXIxLqff6jVN1XzFLB4bS7R3V2OOB1bOecFLsfVFn1nqRMKQy2EYnBDuc/bIim
         ekv7ouUfuptUZgbQzl216mrR9jyLm72zKik6EnYrES4Rn9rpz7+g3UiEhcQidvHgvpkP
         vXd938YmAKqI7mpeUJUmSWT/5K+Tq91YymjEPxUQnsnYmxd5yT4OEySDd2/ZkZfhQOxV
         dZ4kyoa+GHBUDuYiw8yjDIuvHCL7RM/Ilfgq8jbk1bctv7BJXYX1nXG2Gjx7diDE7txN
         XybA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1769610894; x=1770215694; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddA/+oHzfXwIvJwF7dTojsUX4x8Sl87piJCxJWIc4B8=;
        b=Yeyrw07TQWeB6jaUIceJXkwMIjDjAjqPRHqmj759/ztgiZyW/KwMLn023f+xBmsZvS
         NQkk2LY4hsLUpBD2t9k9L003XnysiXqd9Fop1HAB+1Iqlb2CC8ykyUcIdNrqQlv2d7D3
         qPUGYA/e7MvPKimvuZ+rvYtigm8XQfOSisww4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769610894; x=1770215694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ddA/+oHzfXwIvJwF7dTojsUX4x8Sl87piJCxJWIc4B8=;
        b=vB9eAttfWNbP2ci0bz/bmb2xGNSdIpZ5cvvjaeE+xxTGdBXUkW7NYn+R5NseRKkR/a
         XltbohvcJzRJELc6C69tJaLmSpdzQyttWHCEUlC/CEOPOwyhmVfNWf3cN7HN3/0zct64
         uJMnc1j0gCBFW7sVw6rFEKSnFWire5qNKTyYJWC0J/XsCGAvuCbW3K5BpIi+ywSXihTG
         AK4I8sgVPfpLAEMCk+Rcuv96ORhCFu8llZf1sgzZnNr7bc9YYydMkQ0CM/YW3o9Pexm/
         CLUAqwwW3mJwno5/YAoRv09L3kgQJZrxegianf0wTfX3RhuovxNlTvJP5S22A027XU0H
         TSow==
X-Forwarded-Encrypted: i=1; AJvYcCUpHViiGM+z+ytAT1E/w48CJu6iZJofrB2DBDxZHi76IbVX21fjXdA0Ec8xUC5RngUFFIs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqXCaRvr60PodAeIoiw5bq8MW7x506K0Eyfxm4HTmIqoJGBlN9
	WJE937NEY39YoO4cY1mAvlTPj2zgLMBIWhkcaVAjEG4abgaKZnSAos5lSJEn3nT8rrPgJ7Ycklc
	3hWAOKnyQ+/Ka+66+mkdMwG9S1AvBZEGS2vR5GUK9IA==
X-Gm-Gg: AZuq6aIhwIcDGuEVCiNBL447zqBAN5AOF8NLqSexzwyN2/YEnlNURo/X1yVeY5Jobzs
	BYUdkCmFKpOueEWVRVf0g5LKToerwPDMmmlz7+qrkzKkrnlCnQ0JjxrbDvUcWyAXbxEujX/sp6K
	SkcSU3fIQoCWVjch9M47PTfGj0qFuUfZpbfbdK+0G7Y545lCUrGt3QuH4e48svRcmW3Md2J5QLR
	Qlx+Waj48JHi0uuCWfSaoV4eeWY6nNQKqeerQ366Z46D7rbASBIpDOmGCm0JXKVHKNLXpQGunzM
	UZgsyNAiQe2CZ4W2nB7jDj2RIA==
X-Received: by 2002:a05:7300:72c5:b0:2b7:12f8:5eea with SMTP id
 5a478bee46e88-2b78d8cb620mr4125308eec.9.1769610894061; Wed, 28 Jan 2026
 06:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128094644.302313-1-michael@amarulasolutions.com>
 <13d1018c-d9aa-4838-8bb3-35c509cd3e35@lunn.ch> <CAOf5uwm30=AVhqm67yz8Y5TkX9FWdxizTevCGSeaQuJS0KqtNA@mail.gmail.com>
 <aXoV-U-yqcDJj2vk@shell.armlinux.org.uk>
In-Reply-To: <aXoV-U-yqcDJj2vk@shell.armlinux.org.uk>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 28 Jan 2026 15:34:42 +0100
X-Gm-Features: AZwV_Qj2aNMpO47jDQm3Eisz5zUz-ZfU1MKosTGtsmCW07HfyD4XHqQHwTnx1Cg
Message-ID: <CAOf5uw=J_Vj2aOFJi2jyfj_7osZgv9BB=2P=KZ76qV_mwJfHQA@mail.gmail.com>
Subject: Re: [RFC PATCH] net: phy: integrate reset-after-clock quirk into phy_init_hw
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell

On Wed, Jan 28, 2026 at 2:58=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Jan 28, 2026 at 02:33:24PM +0100, Michael Nazzareno Trimarchi wro=
te:
> > Hi Andrew
> >
> > On Wed, Jan 28, 2026 at 2:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Wed, Jan 28, 2026 at 10:46:41AM +0100, Michael Trimarchi wrote:
> > > > The current implementation of phy_reset_after_clk_enable requires M=
AC drivers
> > > > (like fec_main.c) to manually track PHY probing states and trigger =
resets
> > > > at specific points in their clock management flow and was created j=
ust for a SoC
> > > > vendor.
> > >
> > > We try to keep workarounds for specific SoC vendors out of the core,
> > > when possible. It just makes the core more complex for an edge case
> > > which most people don't care about. It is better to hide the
> > > complexity away in the driver which needs it.
> >
> > We should not merge things in the core that are for one Soc and
> > after d65af21842f8a7821fc3b28dc043c2f92b2b312c, I need to anyway to do:
> >
> > net: phy: smsc: Fix functionality of lan8710 in combination with NXP fe=
c
> >
> > Revert "net: phy: smsc: LAN8710/20: remove PHY_RST_AFTER_CLK_EN flag"
> > d65af21842
>
> That commit is an example of a poor commit description. It doesn't
> describe the problem, nor which hardware this affects, so when we end
> up with this kind of situation, we're lacking the context behind why
> the change was made.
>
> So, how do we know that reverting that commit is not going to cause a
> regression for whatever platform the patch was proposed for?
>
> If you read the preceeding commit (which is referenced by the commit
> you intend to revert) itgives more information about the problem, and
> I would expect that reverting it will cause a regression with
> interrupts.

First the PHY_RST_AFTER_CLK_EN was introduced just for the phy that
needs a specific reset  sequence and we need to guarantee that the
clock to the phy is
active during the reset. Now phy clock can be provided even by the
fec_main and the code
there was written really to support in my opinion some reference
design they had at that time.
The entire code that I suggest to re-think is on top of this use case.
For the platform I get this problem
was an imx6ull and reverting that patch that triggered the nxp code
was the only way to have the
reset properly across the clock reset sequence. During this revert I
found this code and I have tried
to figure out it was possible to just let this specific flag used only
on the phy level.

>
> Adding Marco to this thread for comment.
>
> Also, maybe you could clearly state what the issue that you are trying
> to address - why do you need special reset handling for the combination
> of FEC + this PHY. Consider including that description in the commit
> message for any proposed solution so that - as is the case here looking
> back at Macro's commit - we can see _why_ the change is being made.
>

Michael

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--
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

Received: from mail-yx2-f31.google.com (mail-yx2-f31.google.com [74.125.224.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9888B37A49D
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741669; cv=pass; b=Np9C5V9r9gWwIZaDnIANM4/X1Jg1Z4sPTNaUMvKGsldM8nErxL38Ds/tEGHqPXa+p0ZwR3bNh0PLfYq4z274QoGSVDSembSx1en0w6D5qQuXCQMYp7P2XQzUZkmOugINoRCBH8x/XtRp4tnYucNZHxy9b+92eLywlc8vWmx7apc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741669; c=relaxed/simple;
	bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3qs7bHdgWlO71uJHhD7PlSCXRufqcac2+gZTx1yRCTrxNHrUKAXPnVbe3q+ofIg686JD0prPgIyQcwENYPrLyCbtrfRY2/yfyTrMzFKzym0ZEEqisVC0/K5ubZav926Ml+uhgHdpeJniV5xTOJVX9JqOS/tiAueay91ry6Cl4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ahtcuyzw; arc=pass smtp.client-ip=74.125.224.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ahtcuyzw"
Received: by mail-yx2-f31.google.com with SMTP id 956f58d0204a3-6762de1c77eso446674d50.1
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 21:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790741666; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8IC2+Tzcu528XhoTcjOQcIOZ/7dAqJYlWK0g0Z/XvCCbdM3eVPhKDeagj0Vd105Z1
         2BbVko43plMMeVwHhU8eLjmW2iA1oDgQeecjEjBeMHbfNwlXBvbb7RasTr8UufzQmZcm
         79w5JAeiTuRHY5DYvYufWe1bU6mY+hXmh13wXFb8qtDwWoHFBA+u7SjvMJaMA0LJhwPD
         OGenAKgAiIGWB61u35BKBT/ApcL4hpzmNA3ATTBy3NwPFSoLyD85IYBAMTw9WkMnvPyD
         mSdrdTsIVQgL+gwpNhTQe+a/nsFKa9VIj9m+/7u0ER+o6CkfOW4J8u/R04fv65NW78bE
         5OYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        fh=zoL58wQVzP7ZY11+2HwK7R3NYow1XBAdVJW99T4pweg=;
        b=H9f03OQXa0/RmFHHBn0hr/UexIAbFLTKQSaS9Tbvtp9/RlkmkYt8FVr1XVo5GSeH5r
         yrWCq5oBJ9RxvVFICJHa5cZlSFNuiFgNFA6hg526j58DYnSW5qntB76ht4LnmhDMB8hA
         cHYizzI61UyLLwGFvOJ5ctWciSEPKTxdOz+TYNFNqKb6T3kNegfikIvkak7RuF1wMaHz
         hr7Qs7Cxe3cKJs0gl6+T6ps8WQCx9J+lFKS85gy1J66wrdwXgdfAXnTY64t7ZlLhP4OM
         LwwvRP8x7VRAyvOY76M04RS7vc2G7k9zJroqXG25ziZ3lwK4XlqyG5uAKzRs75J4qUU5
         ypOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790741666; x=1791346466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=AhtcuyzwRA5gzZCK4yKV4aPTTa6xO7qh6yozUCyHkD9BEQ/55VoCMjQulgi23bouX7
         H70vS+Vv9uBAu0h6Naov5UkNEmatmqINMydqv8v4EYtSRwLW//gWEB/hbjzW5Yn8J354
         8y6ONwTVy0Yw1BgORu5TD8mPuC8An5M0x/a68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741666; x=1791346466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=J3uH1CjSS/oGHH1xSIq2hlg54OpmlUO07avCcGmudOqjeXIFF/PKmH/yMu0vOyTBzG
         sex0QTO/pmmqgjHTBkCKGfJWiWE/CdWkCi3dRyOZgjYLa98xWi2niKly01lZKIB4xIYW
         ZjyicAeXiI68r419b9zvRsNIF65zjDm964v7o82z/6zIPlx49UVuXXVGtSwIpBfDHOFX
         qbnZWmALm19/VC86vXUEx/A1WJdBPU8nzs+UztNJi1vwO2BUdxuqXfYqiM57a+QBL1lO
         HsG3SLBq9Ko2aq6jsQr67m0h+0wUeDPjz4YinAxkOvYtLYNpqP7RoaNU77Z93liLLEeE
         BIZA==
X-Forwarded-Encrypted: i=1; AKwUvBy1n4neGUocuD4g60lvwJuxEpcRhAFQ1r13GZViNomxA9/khod1MzSwWz5wpQ8rWM+57i4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKH0lvX6JMZYmIEBvq8aDJzA74mSNyWDBirFDiLXCcpnr2w1Ux+
	7oFXvAbA4ODxJVKgmALbKDGBY/Qnl1VZWMA3yy0qpOQRIiUtcifjx35pCPCl0S3c0zbRRqwguD8
	p+KFq7SteumSDXmj7SA8Kv25/+E/Yh5nTV/BvF0JX
X-Gm-Gg: AYBFou2mn8alhl0RSYWpzXp5RRki8YqOndIpvWfw33IvAld8vFSqjaW97Gw9EnLbWDv
	AonjHT08RWwqoLVCigVjb4N/g84w+uSFn7ni/Qe7rRt3gF+cyKX6s6ooC0WmVyWWY8njw7gHnU8
	dUfqfUoyae3ZVlzopws7v43vfBFkbhlzokNrVUAM0PUnYNG2OnnWMDfmMkJmccgB4LQTrE16Nzc
	f6JBWnZoRrxk/7DMBgg8yDR4jLvukYLvRBmmcGoJrTedXtHSvzNUwPDYeCLithQg1VKycFPMwOp
	4b6qoCLYXgmpbaLrEs+S3o59bFhujYWE6JZEq7tXADB2hSDpoXB+VDqIjDZsO7qBmsBz5uHQdSI
	AZ2r1Bu7t1Q==
X-Received: by 2002:a05:690e:4197:b0:675:405d:643b with SMTP id
 956f58d0204a3-6768349a6c4mr76844d50.98.1790741666569; Tue, 29 Sep 2026
 21:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins> <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
 <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
 <arWIcrSFkEA4GMTY@collins> <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
In-Reply-To: <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 12:14:14 +0800
X-Gm-Features: AclHuK8VlKUTvMI0v8jjtLYpqVzk8qBeIKfHOI-d_wW7lfMXYke40oAj8SBNDvc
Message-ID: <CAGXv+5F8iJQJK4N2g8pmpGQVf8TxNvkC5Gm-RZ6F4HdQaThXpA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 4:46=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul
>
> [...]
> > By the way if you have ideas about specific problems with the stateful
> > API that should not be reproduced in the stateless one, feel free to
> > mention them.
>
> Few things:
>
> - Drain flow should be as simple as for stateless decoder, there is no
> reordering, and so no holding on frames.
>
> - Capability query should mimic the stateless decoders (but up-side down)=
.
> Basically, we don't add a pseudo unset state, that was bogus.
> V4L2_FMTDESC_FLAG_ENUM_ALL could be made mandatory, this is only partiall=
y
> implemented decoders today :-S
>
> - Capture/Output S_PARM, maybe review/revisit, but likely still needed,
> otherwise the rate controller can't know the rate.
>
> - S_SELECTION, maybe make it mandatory for codec with a conformance windo=
w ?
>
> - Of course, encoding process requires a request
>
> - Anything about keyframe insertion can be dropped, since frame type is e=
xplicit
> and per codec.
>
> One ambiguity we have in all decoders at least is weather or not the enum=
erate
> sized are coded or display resolution. I believe technically, all statele=
ss
> decoder exposes constraints in coded resolutions, and display resolutions=
 are
> not easily enumerated. Not a blocker, just a remark.

IIRC from working on bringing the Chromium V4L2 code up-to-date, userspace
programs coded resolutions as the frame dimensions, and uses the selection
API for the display resolutions. And yes, the decoder exposes constraints
in coded resolutions, like having the resolution steps match the macroblock
sizes.


ChenYu

> Hope this is helpful,
> Nicolas
>
> >
> > > A second implementation, not just a variant of the same brand would a=
lso be
> > > nice.
> >
> > I still have it in mind to add support for the Allwinner encoder based
> > on my earlier stateful-ish attempt. Hopefully that work can be funded.
> >
> > All the best,
> >
> > Paul

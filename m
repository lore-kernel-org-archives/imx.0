Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38B52F9B
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111553; cv=none; b=Rxahxr+96VYDN8g8M8JwoOHnpHIt5CJK7p6zHVRc9ZF1EuwqZXSew+GrQqYgKxN8gtpWIbG/NeN+7lTHfeXw0rTcQYfedR67uSK3DVEtG+6h4JIDEbbjKoKT5DcRGrr67lwFk6ZA/KeR0N9VNzYYBJclxedQ9WI6Ke58BQVnPYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111553; c=relaxed/simple;
	bh=DniOfXgTLSa71MQcWVYJDh48rOCPLZsPLOazK/gFzhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gT2sG/W7cj7354L21e/Ih3aB/e4CEoR/0pt2lCLfQXVBx1LXaAUbjjl2rygdVjX+eNEabC3ooI1rvxn2dMtLjGxZ30WMMjXTU+RwelZXF3Rz0MwcuaQjWbb4Mlf6IyE3ce6+6rH9LJ4kBq0+HjsJtkxwDGSm7TFSghwBmnbzvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=U+AYkD6l; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="U+AYkD6l"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29327636f3so4280363276.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111550; x=1730716350; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sifr2jJTKHUjzilORSWtcX+eJYT6NU0RJzPCM1a85Qs=;
        b=U+AYkD6lH7swEqRcNeg9fXJRan99X+Hq6V/pswIEtqBN9K7G4HWQ/e+nSGQ6UIWz0T
         8RvRz71GtjYGzXboHEv70/earwIEAdyM0q1vBbVjxokV9Eiq1d7amec+IGgHTsrB8XF5
         STXqMDQlD29PQri1Ka6vhJ39nEnItk2wRwPtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111550; x=1730716350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sifr2jJTKHUjzilORSWtcX+eJYT6NU0RJzPCM1a85Qs=;
        b=DFdq2qyNUEa5NXQUKmfw93KzvyaHFJwiGWOp8QFvQVNIKOk1Qctd3wh9HWIj7v/nwq
         SIHCAGbHpGcchkEJ2RDy6F5wirqyCu2D2uGHhHMI4NfLPUr8HUKvVENU2TTLgSEvGQXI
         sAH4VXH7bySj4clgpIW2bm6ip93hoGVt0ZHUMBOoiIQzIrNjZGdxYqNVpsejRuGR80ku
         WMr6ah/boZJcQfR20cryLCgtWQNjbsqfdpz3fhY22fq+v+sx4lvr1QZHTcrq/BtX2p+L
         /JyBdSkY6pJRNYWkIe+5F2eZdzW3Jf6EktQFN9MKRHOcsQYmtcQSG++8wR+g6pk9DCcs
         TVCg==
X-Forwarded-Encrypted: i=1; AJvYcCWTGIDpAJ7HmR1gP67m2GX5jHSs6cv0L3n9IZVU4PpmnbrYSHCMho91+GDlfaqBzCZz2UY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE0zA6M8f5OIVTqKBL8htxUJy6S37QDynnXkH0iTmiM30oNtbi
	cRvIXPOeTJrDsd2vDTy0XNNoSKRllr1VhLpvY5lDtPiNJsMvfUra3hEpTdbNH5/pibHooecxz+c
	ftJNhksBkGDUXM25z+UBy8LV2xvM3f+cntAbLSg==
X-Google-Smtp-Source: AGHT+IF9ddqHdtij3qzgutlZYqDdqye4Y0X7im5D9JxYtJ3EWaxqlKOCIp8dtlSZCbbCN0feWNn58wnCJ9/AjxCbxos=
X-Received: by 2002:a05:6902:18d6:b0:e1d:194a:51ee with SMTP id
 3f1490d57ef6-e3087a4cabcmr6741526276.12.1730111550644; Mon, 28 Oct 2024
 03:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
 <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com>
 <566859c1-a397-4465-987e-0682b07a703e@kernel.org> <CABGWkvqqg-PGAZTCz=MMLRx5F93jaN_=z8zJt1sDd3PHXd80PQ@mail.gmail.com>
 <6c3e6071-822f-4230-b76b-276330de07ef@kernel.org> <CABGWkvrU507BHoP94Y7fEyFr=chuuy3o=oBHtuWRvwTw3GnxXw@mail.gmail.com>
 <82db5037-bbd3-4005-bde9-02df1bf4c475@kernel.org> <CABGWkvqXZ+YAvo-AtUy+Ftdu0xxXKuhOwcSTwO5Fv6D3yzttNg@mail.gmail.com>
 <b847ccb1-1eb8-4119-8612-212804cb50d8@kernel.org> <CABGWkvqkmo9O-O1taR651W4xo=yqar=p71e0LKqRte2CGZ2Z8w@mail.gmail.com>
 <7bce31c0-8c74-4d65-812f-01951a0d75d1@kernel.org> <CABGWkvqFi_y8OzKbi=K7ucW4RuY_zh6Z4a=uO2oqQRoVE8LaCQ@mail.gmail.com>
 <CABGWkvrR-vVTpNSBD_etjn4SteO8cpUed+dTvYguHR67UUSsYA@mail.gmail.com> <fdb76466-3258-4c71-bca3-50fd3cc94a0e@kernel.org>
In-Reply-To: <fdb76466-3258-4c71-bca3-50fd3cc94a0e@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 28 Oct 2024 11:32:19 +0100
Message-ID: <CABGWkvpTospGbdPtEz-Fn5OL52+Fp6tQxdoAVFZUP_HeG=a7aA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 7:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/10/2024 16:58, Dario Binacchi wrote:
> >>>>
> >>>> This is another commit [1] on enabling spread spectrum that I
> >>>> implemented some time ago for
> >>>> the am335x. The most evident difference is that in that case the nod=
e
> >>>> was a clock node and not
> >>>> a clock controller, as in the case of anatop. The parameters are als=
o
> >>>> not exactly the same, but
> >>>> that depends on the platform.
> >>>>
> >>>> [1] 4a8bc2644ef0cbf8e ("dt-bindings: ti: dpll: add spread spectrum s=
upport")
> >>>
> >>>
> >>> OK, I still do not know what "0" was, but the items are fixed, so you
> >>> know exactly which clock you are configuring here.
> >>
> >> So, after delving deeper into the topic, is it now acceptable to use
> >> the property
> >> "fsl,ssc-clocks" instead of "clocks"?  As in the patch I applied local=
ly?
> >
> > A gentle ping.
> > Sorry, but I haven't yet received your response to the previous email,
> > and I'm not sure how to proceed.
> >
>
> Yeah, the property is fine, but I don't think you need the clock index.

So it then becomes reviewable v2, which I had already sent some time ago?

https://patchwork.kernel.org/project/linux-clk/patch/20240929172743.1758292=
-2-dario.binacchi@amarulasolutions.com/

Thanks and regards,
Dario

> The lists - like clocks and your spread property - have strictly defined
> items, so it is enough if schema lists items and says which spread
> points to which clock.
>
>
> P.S. I think you might pinged me on IRC, but you know,
> https://nohello.net/en/
>
>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

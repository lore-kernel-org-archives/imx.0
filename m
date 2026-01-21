Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471FC4418CD
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768984196; cv=pass; b=qfo0knzNsK58aRJiQiJM01CSQKqk3H/N+3+5cqvUfzchIzV7ieujpelAbTjvw5hRYRZh9Pis0oIld7NK4mDJ5ELT4wDNVO2u28V3oy8Uw4zEnUAcihqjYNsFSlGGTqLs6fp4dSspYmipmqkeQgpaIE9/9Wh+Imvo54RjrSnIArw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768984196; c=relaxed/simple;
	bh=IYiLR/6ee2XqEtSUBEP2QD572evtL/NpvdANhUBe7g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hllhY1hLx0DUzrWt00+EOpNo3NP4k0jZkIkGc7Z0J8Izr8uiKy1SRSE644O4jal8TnK/Y1r3/YMhuwLsuCxzGMlH2QLjjtBnkTyZY6FOQpnT7zW+ypDRoGaQ7cca79iN96pQOhTcsxgu66MqF6X2pAFmmOAnZhfk605NkBHeKVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzLCoLFE; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzLCoLFE"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b70abe3417so2273747eec.0
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 00:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768984194; cv=none;
        d=google.com; s=arc-20240605;
        b=ICu0ZmO3O7HnzGMm6rAzRRvXVNCQbGwtiQDV7clq4n9gXuYXfO5oXED113Hqqfta7Z
         lqjWsnaEPRERNkBymvifPrnGXzVINyXg4YYmHhGtbCi9bNveOnWDPNXNkuItr4nwpQUB
         PgR51/aRr9Ym3b9B6UDnrFgu5E/BUSeF3ok+fngewgvZ0zK7Q7cWeCiGfFcGK1v21Emf
         6Z/8zrisgh5i97LYNbyUYJMdIonYSBqoIZdXQLsKqXpU3gO2jP+0Wx6Sc3fC6YT/3RaM
         l7IXyU+iQXuZZy7Ju7Rxhgm2awxEMaQB2W1pKImtmyqaNQxDbSAWuFwqdRf2Qf4wMOe4
         jWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=;
        fh=0/99yHrThSdwPOmMB9Gos2iN/UuEtWgrKfSO62QU1ro=;
        b=Agw8EcF0adsHM12UNkKDDjNW3mOL2fix+AH9kE8cPGvwxhswYHG1Bn69coKW3HmOjE
         r0hU9iD1X9JUfMnthF6D0w5IWOINAK6CJvuUCF6YU1VJAPch/CTl/j36ZxVqrMTLvAjQ
         dHBemGR5JdPwpH1m9xI/7ncHQVSUqWzUuKVsGZ9jhXP9ryTlfvsLFd8BqaYZ7IHaw0tz
         6q7ZdfppMfHEHTB5fi3ZMn1MHK4I/8ZAVOrRW/42SwRNXOXENs0RmssynZAtwW7h/sRS
         iFboY/6zGHp3mqglSg8kKqUoEFKpMdlWrc6ALWbp0fijBbprJQwbwe4HKfTV4N8MYGBD
         MdVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768984194; x=1769588994; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=;
        b=hzLCoLFEj4Oc8dlKMCLHOxCC2tvztQghYDxG5C+38rcak/c4yqJlGZTwm/bBX0hhyj
         ImgIUtguVlKx7BOF3HDFn0Ed9YiMHZo0n04vFdHfjxbsTHVFm4Lw1RxNVhgCnFHuUSmf
         Dbqf04lr9Wx4MrVg1Sv3zb+FWGILU0fnaYII40VcqiiTbtrlQSDEAKXdBHpcnhNe9gtH
         62mZDf3rt56UlnpKLgcvWEKiQRsMp3vFIXj0FNBf00+ao4mePxcYtAVvgLIYZ0rvYCiJ
         Lzr9ISLDtf2WEbm7dmhyAovJhAqZf5m432KOjHo9v8TRfH2m+I6OT5QgkAV+35M61RmN
         SRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768984194; x=1769588994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7aI+GPwAH0BUEU90sHG77IoEanYx72AgVA1ohd1zcDk=;
        b=k+xHBX+TEmf25sGgtfIXFmjX7pwcT0pR5wUgRK4BiLwy+ulOq9tz3+VvvVLahBaLjY
         OLEo7MpmlUU1NSAD7S+EVwlqmxtrwZuynE89TBkb60jnMn1Gn+eQi7cvLqgnuIVSZxb+
         pzPJyrUV6WtoN7KLAmf8Cb6iF798l899V8KZQoA3mf7wH9KT7GjR1D8cjC4ttU77wh0H
         Dqe51mO8/rBaLzH9B/EpbES1/MiSclkQ3aruDXUWmTi6a2rUz56EGvfDcM8Iaan8xuGa
         vCR5c77+RvnFEtHO1dWNupHMqjzFcvkq0EMXVs+Bor98H68MOtILDmzJtqMH+kY5PYR8
         EYsg==
X-Forwarded-Encrypted: i=1; AJvYcCVGZzM9acOF1kv86uHk4v4WUrynWKxEasd7tbrk2yLIq7zbrmUDhod+1+qPSYYBWGKVF8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDB4Laot+ou88UEw6whj4Q/YTLmxctoMvOwCkW/Soc7X5GAPxa
	gx0Ibu+8jWsn5hyqTVi403iLxR60xMTGIHxTrzW2Y17FJRSVH++28TPfGWWNcqEkOFfH9JhNduY
	/p6ep9TZrRLCuvwK8tVur3qCzknju+No=
X-Gm-Gg: AZuq6aLSXN8jBObdfEFnJmvSm+v7+my/ZZZXV9NFgcTKocOfyMBljz2QJ1E1cZzTpFm
	LoWtTW5mixTQ9RDBYaCjHRKjLbvwRi3xIRH741nabGtSlZ0cT8OFEwfSQwV2UQtjygxnZ0KfOGG
	5O3QltoCqO+6a4mT8uWL1PPRc+cBteVaT/WNhuRU8wNjxhN+yhk55mrYytF/YRN3vLnND7jOkK5
	h2iig3k5tVvh3n3Nlvxqei1WLGJGD1WV/k6bMXoP8eRqLKgRTcKmrrNNRGfmbI1htttmBNouEKT
	+uO9AtsKqkkMv/WIL97XAOjaZbdefIb/cVNfmX3zTZVZ0G/ItZoVC0DNCTMnrq8eRg18VaitgMM
	vyENf6hnt/DYoAsx8LCf0
X-Received: by 2002:a05:7022:4399:b0:123:348d:8576 with SMTP id
 a92af1059eb24-1244a6fb15amr13122314c88.6.1768984193944; Wed, 21 Jan 2026
 00:29:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120102604.1989725-1-sherry.sun@nxp.com> <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810> <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To: <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Jan 2026 10:32:33 +0200
X-Gm-Features: AZwV_QiY0sD13-nX9UTIpSYPXU-DrhdabVw0h6HRC3hxGCNgeBaTfACxmKoz6Dw
Message-ID: <CAEnQRZAfRLL1c19WHbQjJfgZfQLQx6CaBYx7KW9wSmVzVa6Q+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	"dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, 
	"Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>, 
	"matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>, 
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	"primoz.fiser@norik.com" <primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:25=E2=80=AFAM Sherry Sun <sherry.sun@nxp.com> wro=
te:
>
>
>
> > Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
> >
> > On Tue, Jan 20, 2026 at 06:26:03PM +0800, Sherry Sun wrote:
> > > Add DT compatible string for NXP i.MX93W EVK board.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> > b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > index 93ad6f0027d0..1769f243d70f 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -1432,6 +1432,7 @@ properties:
> > >                - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
> > >                - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
> > >                - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
> > > +              - fsl,imx93w-evk            # i.MX93W EVK Board
> >
> > Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.
> >
>
> Hi Frank,
>
> IMX93W-EVK is the official board name, it basically reuse the  i.MX93 11x=
11
> EVK board, as described in the cover letter and dts patch. I prefer to st=
ill use
> this name (imx93w-evk) to keep align with the board official name.


No matter of what name we decide to use in the end please add this clarific=
ation
in the commit message.

Also please add small comment describing what are the major
differences between imx93w and
imx93 11x11 board.

thanks,
Daniel.

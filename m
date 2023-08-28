Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE7610F4
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 21:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED3CC433C9
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693257233;
	bh=Ppe8+p29OpZk3rbylj8fht9T7CmPmpiixY5GfGHua0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d3dVyCIGfHTBKRalWRYwYC5OjBmgXAQX5cOGn/tJi05U173ZRwRSK79Vr8v9uFMqJ
	 +Zt5FQPAiI4eKuASq8CNPdimQ8OHj1BT16f7Cq6MZwNvrUPm3aJD25qw5WJ4ofyesR
	 h0YSdZExp7aWeQpFaaXihthZYSM5/P5RBk4ML0eKf+5w/R2OMW22NsN6W2cvdJ0/Js
	 h2hyOUavYv5WYg9z/+nhtk6KvrZ3X8r1IcIlo3NGT8RSmQ4qPvb0xbCNF549IabtES
	 eYGCQGhVKfxNs74OnX3IAVxEddkZlTMLuJIIOB8bC0JG+ISALIYdD47I+rK/4htzNk
	 zaAtx9KWtBi6g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bbad32bc79so54964881fa.0
        for <imx@lists.linux.dev>; Mon, 28 Aug 2023 14:13:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YxVOb1NbGVUPXgOMAJ5dhTYnOCQW/QEV8OHWZCqIZi8MPArPs3r
	jReU20qAIEJ6maj9aiuipJPm2YVdiZRPT4cRbg==
X-Google-Smtp-Source: AGHT+IFP9EEfxSRqcNnINa90szPTTfdsfOVO6T6jksgEg/Fal2zDHTsroKNHyRrkkbYV00WL7Dn0BQnUYDAr6Uo1JZg=
X-Received: by 2002:a2e:7810:0:b0:2bc:e46d:f4d0 with SMTP id
 t16-20020a2e7810000000b002bce46df4d0mr9678271ljc.2.1693257231210; Mon, 28 Aug
 2023 14:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
 <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org> <PAXPR04MB9185957B729588D3E7CA3A5089E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <51fe3126-16ba-ade6-b106-e3683f96ad26@linaro.org> <PAXPR04MB9185DC79721E78E631F9889589E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <154b36de-652b-3931-96e6-04e99253a09f@linaro.org> <PAXPR04MB91852AD4E5242306B57A910B89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f3e89479-14ab-d1d0-ad87-6f457f313c39@linaro.org> <PAXPR04MB9185D87525AA88A8C3543EEA89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <465e61a0-895d-54b9-d1b9-424265c82855@linaro.org> <PAXPR04MB91851302EAB989EC8261AEFD89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <2bd01950-20e0-51f1-91d2-88c9ee2e8dc0@linaro.org> <PAXPR04MB9185526385C775306A87D85989E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185526385C775306A87D85989E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Aug 2023 16:13:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKki2pcf+4q_7e-dEH+B59zr8uUtv-Y7ZCP0hb9jX25PA@mail.gmail.com>
Message-ID: <CAL_JsqKki2pcf+4q_7e-dEH+B59zr8uUtv-Y7ZCP0hb9jX25PA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 2:49=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
>
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Monday, August 28, 2023 2:31 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>; Ulf Hansson
> > <ulf.hansson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>=
;
> > Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> > imx@lists.linux.dev; devicetree@vger.kernel.org; linux-kernel@vger.kern=
el.org;
> > dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [EXT] Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd=
 yaml
> > > The fixed-regulator is a virtual regulator driver that uses the GPIO =
pin.
> >
> > We do not talk about drivers but bindings and DTS. Why do you bring aga=
in
> > drivers, all the time?
> >
> > > You claimed this
> > > as a hardware chip.
> >
> > ??? Sorry, this is getting boring. The DTS-snippet is a hardware chip.
> > If it is not, then drop it from your DTS. I insist. Srsly, third time I=
 insist.
> >
> >
> > >
> > > The regulator-pd driver also uses the same GPIO pin.
> >
> > Again, what is with the drivers? Can you stop bringing it to the discus=
sion?
> >
>
> I have to admit you have a real talent for debate.

It takes 2...

You've gotten feedback from multiple people that your proposal is not
going to be accepted. The prior attempt of the same thing had similar
feedback from even more people. Please go re-read the responses until
you understand.

For fixed-regulator, I can tell you very easily what the h/w looks like:

Vfix---|gate|---Vfix-gated
            |
GPIO--------|

'gate' here may be a chip or discrete transistor. That's a very common
board level component.

If you want to discuss this any further, describe the h/w in terms of
simplified schematics. Otherwise, there is nothing more to discuss.

Rob

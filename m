Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D6C43681
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M4Ad9X85"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E27E3C0015;
	Tue, 17 Oct 2023 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+5JqiyTOv3TPqc/V/H+YGYwqd0d676gX7UE8nIxZpE=;
	b=M4Ad9X85i5+2Mw8Hs1jcxIenMfvWwAXvmf9bQlCU22P4jwZr12Vi74PHJ61pQ6o3I4NhuY
	28NeuscGp82NrRV301FM43h9ltbVnX0nXz7b4RZEgOzdzSXrNG0Qs0BxGdmIMYMmzLkwhN
	eexGYueMEMPaj2s5V+j270mBjcSycuT9sG0Kd61ot2rPJGG2rF0R8KDWgYi4SMbsGttVrO
	kBfww7QExBigcPaQOczMY3s78FDJpN7LuQanxCrhwJik1X8YdoqGjZ/NoNHla+3Bf3SNYc
	FaMtuXhcA86iIwDbAZAfAgVLeNFU/IzUoVesGo4T1fAfWvA9de9fR2XZnjjPKA==
Date: Tue, 17 Oct 2023 16:15:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor@kernel.org>,
 conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, joe@perches.com, peng.fan@nxp.com,
 alexander.stein@ew.tq-group.com, haibo.chen@nxp.com, ping.bai@nxp.com,
 xiaoning.wang@nxp.com, sherry.sun@nxp.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Fix silvaco,i3c-master compatible
 string
Message-ID: <20231017161504.396150aa@xps-13>
In-Reply-To: <b5d3b52f-f551-483c-a4d4-763130b48fe3@linaro.org>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
	<20231016-chatroom-regulator-a75f1d8be809@spud>
	<ZS2Pz1HxUgrx4+0R@lizhi-Precision-Tower-5810>
	<6110c58a-8003-4889-9a4b-6a7d1821c00e@linaro.org>
	<ZS2Y0YRPItYhUBXE@lizhi-Precision-Tower-5810>
	<b5d3b52f-f551-483c-a4d4-763130b48fe3@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Mon, 16 Oct 2023 22:43:28 +0200:

> On 16/10/2023 22:10, Frank Li wrote:
> > On Mon, Oct 16, 2023 at 09:57:18PM +0200, Krzysztof Kozlowski wrote: =20
> >> On 16/10/2023 21:32, Frank Li wrote: =20
> >>> On Mon, Oct 16, 2023 at 06:30:11PM +0100, Conor Dooley wrote: =20
> >>>> On Mon, Oct 16, 2023 at 11:24:49AM -0400, Frank Li wrote: =20
> >>>>> In driver, compatible string is silvaco,i3c-master instead of
> >>>>> silvaco,i3c-master-v1. =20
> >>>>
> >>>> And what makes the driver right & the binding wrong? AFAICT, this is=
 an
> >>>> IP sold by silvaco & the -v1 suffix was explicitly requested during
> >>>> review of the binding. =20
> >>>
> >>> The driver existed for the long time. DTS files already use
> >>> silvaco,i3c-master.
> >>>
> >>> There are two options, one change doc, the other change dts and drive=
rs.
> >>> I think change doc is easiest ways.
> >>>
> >>> If there are v2 in future, we can added silvaco,i3c-master-v2 in futu=
re.
> >>>
> >>> If everyone prefer change drivers and dts, I can work on new patch. J=
ust
> >>> break back compatiblity. =20
> >>
> >> No, because Rob explicitly pointed out too generic name.
> >> https://lore.kernel.org/all/20210111200821.GA2978830@robh.at.kernel.or=
g/
> >>
> >> Is it some way to avoid implementing feedback or how does it work? =20

Not at all, it's my (faithful) fault, I did update the bindings upon
Rob request and apparently kept the previous string in the driver.

After thinking again I would drop silvaco,i3c-master entirely from the
driver, it was never intended to keep it.

Thanks,
Miqu=C3=A8l

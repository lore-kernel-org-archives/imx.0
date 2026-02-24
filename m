Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A7834D392
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973237; cv=pass; b=Qomz4THAn73opaVib9SLg4Efm6suZqbl8lkyUpU2URIzblq3h5qIOL0znNmZzx7XlOAkLJ19F+AZaL0QaTPUq33K/9AYl6CcLPa7FyVecxZz1X/jNYkHf7B9GrVLVMii2FrWxf/s04bLkKlO8sYp9BsymLo3nVyjvYg/dxaOGJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973237; c=relaxed/simple;
	bh=mR2DxBgw13ANLVUMK5/jjvVRnqlmqJqFCSdBmr/gbTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+fZkEiMXRHZ9+8mnFgX/eCmQMjjJrrsjCND249/rP7kPd89vJC594jOsTUdJ0Qjw4AztmYYGcHRvUxGuryr7tmxapyC/It6oUeULU4MlGGVxJMUG2xIuPyanweIwrCM1thn40TnrW0pYsma3+4q4oZ7QWLssZd58zmx284tKVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZLyMbpz; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZLyMbpz"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo10591261a12.0
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 14:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771973234; cv=none;
        d=google.com; s=arc-20240605;
        b=MMntJkSWvw12xKcKOfQ8W8dE6tPeMe8AY5tLbD3VeR43QoXDE2mwnpy3jYF+fMros/
         9z8cspFR+P9shuY1hKnoY7S2jAqO+ScwGbxQGZZBkNwtbWUelSX14CUI11jYZP/HKLyK
         V98gxHE+0Sewm8QdZFi57mUtmdUFkD1ZpIZc2EkiL/i1wHDY64Ej0DAwymSUb/fnraFe
         xEOv/Ju13HH5nFPu1Y+i4ePOUoYq9JVQ0gYzwVyANoz37N/3O9mP4eQITTw4bCHvaqfW
         Jme6b+zRWDzVfUOxeHNCJpTIpZLNnJyutyZZTk24mjAxJJ4IU6MgrBo3leE7K3aeZ//N
         973Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        fh=2b/KB1Q6SJGzZjrWFQyh+PHLVWiaCGWYm92LhdW0BnI=;
        b=lCrgmX0Jx3p94ovDe9KYPUo3AXiCva0hDkmTp0VK0uWMIa10rMCmvr9X6/F9JCH9mx
         rIQounTDWqcrpvT7lMA3arCp/yguAlVUGzDfY5aCt9DvVGgWeRz4NGHahmvWnepO8/iG
         p3ApKpV4or3GJvz2XnW4FfSIbtFe7PRN1PwJHAAVPPw7jk28hb0+2+X66EBLnpP8oKVj
         /4YM7lDkFdYG/HL+gUB74Sm13wVMSlA10CHZBAT43onpSz5wRoKgKz57krQKfbfPSfuZ
         MWuOWxXhnhacC8MJLVRjpN5fCTXo/HpZjM9EjFwQiTgDZxTXEG8ql/tdl416GUdeuziR
         QztQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771973234; x=1772578034; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=aZLyMbpzg1QGH6EV2+a5Y7C6zw2j1h9rRkUnMIsWxYE3sSukEYrJIEoRKHwYqRxNQz
         2oBlRuzGP1Ix81ujTYn4mlYPwSKGPoTlevG3yw76IkEqqJlRg7Zu2FdSwTElhqa1fOQL
         TkWo5SJjd5Dv6YRsav5Vrvh4oETNufCYjKJGl62YQMOEvkY0pPCybo6+MGJOoJaLKeSV
         s0CJYHJbimDSRNKO99qv+CKX7KsL6ojLixPuDfnGn+iLXYi9X+d387JxKJHqQxzGSTcP
         BiWou7Dq2RkVlgSjpd/Ex3DWFaJQ5QVbf2YSJlUogquB4zvzJIx/5kEDZKXxU0sVbT6E
         Wg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973234; x=1772578034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=d3EMyqZYkkP34IELqIi54Mlg5RjbXlBcfTyNOIc6hcmTFAMeRDmzRjWN6RYQfoiFNd
         EpywU8paH92JQ5uFXl1JLbgAquanYT56khO8ozKtQ8zvRPIEzsrAZViw90RDTezUCDo1
         sm5q3aoVm7mC0vvaF2sPH8E1zcAlFiTSCXgabhoBmgD76KVpcB+hp1FrhADrWMmy99+7
         l0fRJI8saXS7GmWJ27Cq4tX0Zu0p+peE45NF9oKetMISZIecT2FsVWX3+E1N1ZHXhTLG
         dW/kEpOlmtnLKiccUjUc/LOXLfkY09U9I9wUeIHg0MYmdj6PP6oJlg7K1OnPm+3QLLVK
         x1NA==
X-Forwarded-Encrypted: i=1; AJvYcCVWgkQjqtLd5oykWNj0qjq5xqEYDIFmdRaVb7AMlTL5XMLCWcc75u2AC1lV5m0npiM6kOs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbtlbUxlOCCKOuuqkOl/9yWcJokWRj3mKO/WgsN3FpVgrimNAR
	1H2+GfWKlOFgI/6P/X1Hb6h1aHXOxbl45pinDA+1HB+WpAbiYJAM/I4wyZiFc9w7iPsg7bjDtfS
	BSBSQIDx4GSmDCZolMZmM0n0pxKyydaJEUMf6JrOBrg==
X-Gm-Gg: ATEYQzwjIIaEr1pXxUXzDt0lboQCMkKyiSccRTGgXNLu4Rn/AjRiGwMyrN6N/oapte/
	DKXO+3AbnHha8HjVa+klnMZRkWokHtOJxEkkMic1AD0debCJ2h3Nlc1BhXNPsGiqUs+Q6lG1C2L
	xjSakTQnKpyAi1Ti7SEkYU9OtekBazFSdZTZniSDztnCgkKg9z0jcXLMZbbed3tXfCPtxz9Fnjr
	yXQkQ7taoGN5iI0NjQF4P6/+UUGfAGyFtDpxzGvH3g8DFIir8s8bOLxHAl2PNon/7BlgJdCUHzy
	3D2U98+G14xc5Q1REe4p9BHLyUDaEkYlbDJTmeMgRA==
X-Received: by 2002:a05:6402:430c:b0:64b:3225:b771 with SMTP id
 4fb4d7f45d1cf-65ea4ec02efmr8235378a12.6.1771973233960; Tue, 24 Feb 2026
 14:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com> <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch> <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch> <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch> <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch> <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 15:47:02 -0700
X-Gm-Features: AaiRm53YSUao7_rhr1i52add55pdbzLxtSc_huet_gFbRkQV2slyqwkA4zQhORI
Message-ID: <CANLsYkzzkvSHVWt_DOw8q7DvD3mic12zcNR1wuxrG-_vG+H+JQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Feb 2026 at 15:32, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Tuesday, February 24, 2026 4:23 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: Re: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> >
> >
> > > > > + remote_cm33{
> > > > > +     rpmsg {
> > > > > +        rpmsg-io-channel {
> > > > > +          #address-cells = <1>;
> > > > > +          #size-cells = <0>;
> > > > > +
> > > > > +          gpio@0 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <0>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> > > > > +          gpio@1 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <1>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> >
> > > Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus
> > in the example above?
> > > They are running on the same transport.
> >
> > Doesn't reg indicate the channel number? gpio@0 is on rpmsg channel 0. gpio@1
> > is on channel 1? The reg value gets filled into struct rpmsg_channel_info when
> > the endpoints are created?
>
> There is only a single RPMSG channel for the CM33 remoteproc in this example-its name
> is "rpmsg-io-channel". As I mentioned above, both gpio@0 and gpio@1 run over this same transport.
> The transport here is the RPMSG channel, so multiple GPIO controllers share that channel.
>

That is one of my main problem with this proposal - multiplexing
several GPIO controllers over the same RPMSG channel adds complexity.
RPMSG can already handle multiplexing via channels, use one RPMSG
channel per GPIO controller.

> Thanks,
> Shenwei
>
> >
> >    Andrew
>

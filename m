Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506233A9CE
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965688; cv=pass; b=tHIkeN2VkV+VkXE0HIxT0tvuwXAheJMYaRpkBvBYR1PtepbquEWIOwW2TP2sXoHDqCvNNTvru7ep7qPSufmbUNxotC+aaJfkv5k0qjtFHeg2YTM0mO+tdBON6APFYE5Y9i1X6Amf6Au33e6fRYKPwwkhxYFBOhN+HrykuHT+Y1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965688; c=relaxed/simple;
	bh=yQX0QV89eK/kIauizaoFSMFTRwwcZcFoSH8ajXCreAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hW5FsaIN94K+Zqrcyl/Mo9W0kkZnxOxIi5h9jGXN89OeoPCGPxeowHHDhQTW5ROkeE9DbKn8/ZCvRB/cF6S5VF0oAxkFCAa0DuB6pDdTE0a3AiCQTcGyrmtCzdpnXrmIjF7hsGXnfXTEHraLLRqVwasikF9ah3yu92LsEkP+uVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VArTj3s/; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VArTj3s/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65c0d2f5fe1so10345364a12.3
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 12:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771965685; cv=none;
        d=google.com; s=arc-20240605;
        b=VunjAUCaFw43fsedsV7H3FeGmklqQsDQxMSXokjYqQoWjLmt9kdN5oaUkHlVXY1DYe
         9gt6hhYx6Fj9je/GmSGAJVRFsxkiTlOR9x/XFBmMRs3mH7vZf9Q6o9Vpqmua1QjM5UfZ
         ehaxbwCbBO36uGG0RQriQ5uJG/27q7bjSbwzya/litPHhIrbb4FyrRZnligR5YfPO8Zs
         witKXFUgx3Pb5PyZobXBliUUVmm753V8bvX43MnlenmfRVRO34FBTN8j6LUVybdkgohI
         t/GN92hAZ9xVeP6tWEC9McfvHeRettEmQx3uewLiVF4CTGo9Ts8u5pYI61z09Mc9Tj9N
         FQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNTWDS7xIFhn1fF1oG2R6ESQZOh+RfZzpB4H54GaJZw=;
        fh=1eFp+Tz0fwAaHJWuc1ALPx7o/pmknEgu9eU/ceDcTpQ=;
        b=BLtfgonPeUIEAn+NkV1AxgWjev8Rt3fK8nhcD4W3f3O+3BcFx6yamX+uMJkMxAc03/
         FJClwr1MjIkAdRWW2FctvTCgrHpc0vgHjfJpGgBDIms3jQ2KCOxp0VX4qtjBwRC/pbRu
         EZ/sLBKRfPwEAMgwymXIKm6767r/UvvTJ7Mq5DpFRhq6Oz2xQsMjzjF6en5ZlfCGvRNG
         xKPXuAkJnERk+1oGisJvNLaeH0kAM/paF+vGZUX4J22VNB6qH6PUOZqznjFR5GRAPzdd
         0J4M4uP7qARvx84ghpehcA1SmkULels/gOJPcvU7BvlT0fudswQ4B7ncyuWBrr2KSqw7
         uCVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771965685; x=1772570485; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNTWDS7xIFhn1fF1oG2R6ESQZOh+RfZzpB4H54GaJZw=;
        b=VArTj3s/w7OcI8oG2I845oUlwYZSGnF/cjXITOtBIy6noSodqi/QAl6+FTL6zy6As3
         exremUMXkhdWxlmNM1kFCsh2chnh4gcjnlaCOzEAbirqc7uCgAIpDP64QrxXgNqCviVh
         wIdhjhhWTuQoIl9rAIqenszEEZzfNTjv+FVwDOnrkzvoE5XO4lbXsB090HzR8KWRdojE
         aFHs7JU6gLhH3Ok8nRfDKQPkMRz4Ixaa8GE8ZWNUDj3NhjBEdfMWgZXs9TfQgaB1fVz4
         71kpSPhtzTd6DgeqZRCRPh3/5MS56OTALo+tZhL1sslFY09H68igsiUpsaij4XHCkJMd
         PjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771965685; x=1772570485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNTWDS7xIFhn1fF1oG2R6ESQZOh+RfZzpB4H54GaJZw=;
        b=DgYTjt2sQzaIfrw7zkdS4Wpr48UttRVy+9sabFllLHNSseeiZzHeWi7/yzbW7XgRvx
         i2EFQCnrFWqSug5+NxG1TPN4+NLc8CJrzgDXhbM9FMEgGOUuhNiYAeUTABqjdVhJR8zf
         YkyqmYVBxlxTx9//eZsOdFchIXfNTJHwaQaXKUWOcdmfKoR5pw8zi5TsnlpjbICh77m4
         ZV+7qk/18xNXW2pDDwK3W/Phw7P3TehlwqEVHUTFRxqACA8/SgvZWrOAnT+Jh8urkWQD
         kDokpwgVs1gjFxfe+dYXNiTu0kbgYB4PJ5F98jUEVmcOVTqT1J4T5l4U8wqQ8zF5rByi
         K26A==
X-Forwarded-Encrypted: i=1; AJvYcCUjXblsEHi6oS/FqffEHWL1wzndCw7D8louTfsey9Ruw6hxLCjp960HDiEeMCcbjLfbKn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVP6jaM9T3hNFLxyy2YyqvbbOwY/ii2OawU+Wx4teDm/lM9XSX
	T9R3n/WMyzaZLKGrdbl7QGsMPA+/fpz/4TlxwamtHqqyVL7CyCsBq1ZSs07J2oI+p0ppFgdaybR
	tVWjq6y/+8QtXtn+QZQ3ccHhIS/F7VAKtL8QTlAlH9w==
X-Gm-Gg: ATEYQzw4+gd+E7q3iWhUqsJQwMs+TxZlS5WywCto5tc2E2kd9ux7jmCWkCW3NgZaNLo
	cO6ska07Ig8OOS6EoeJWyEaLlZNCCv05D044ntzeNJ9FHs8c2aK5EjcohVHP8kiVml42idhcV0x
	8hJva57bGXpUY1mPWHQTgrHXzlKNXyYkw3NbWJ395hT50v1SI7fM3M1T+LggGDUfr2oWLZLX01t
	fkJ1DjbJL5ZfxFhiGADBJHOBe/aVCylMZcjJ5uOM6vGAt1BwduuRK5Rh/3CKY2ACebYbxCEZTxF
	rTfySZuNsqJi9j8oZgPJ7pq04If7Gg4Qp05uPMyDXQ==
X-Received: by 2002:a17:907:9716:b0:b8e:a024:1c81 with SMTP id
 a640c23a62f3a-b908196fb16mr909923266b.7.1771965685358; Tue, 24 Feb 2026
 12:41:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212213656.662437-4-shenwei.wang@nxp.com> <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch> <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch> <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com> <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 13:41:14 -0700
X-Gm-Features: AaiRm52VdXaBjzzgmhpL1Z-g6JThXBNeXEmeramA_XtCruXiC4qI2WpVWSvfPHI
Message-ID: <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Feb 2026 at 13:17, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Tuesday, February 24, 2026 12:10 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>; Andr=
ew
> > Lunn <andrew@lunn.ch>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlo=
wski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > On Tue, 24 Feb 2026 at 08:56, Shenwei Wang <shenwei.wang@nxp.com> wrote=
:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Bjorn Andersson <andersson@kernel.org>
> > > > Sent: Monday, February 23, 2026 8:43 AM
> > > > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > > > Cc: Linus Walleij <linusw@kernel.org>; Shenwei Wang
> > > > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Bartosz
> > > > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Ro=
b
> > > > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>=
;
> > > > Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQ=
UEN
> > wrote:
> > > > > On 2/22/26 15:48, Linus Walleij wrote:
> > > > > > On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang
> > > > > > <shenwei.wang@nxp.com>
> > > > wrote:
> > > > [..]
> > > > > >
> > > > > > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driv=
er"
> > > > > > and rename files etc accordingly. Maybe it can share code with
> > > > > > the actual generic RPMSG driver once that arrives, that is more
> > > > > > of a library
> > > > question.
> > > > >
> > > > > I would like to (re)express my concerns regarding the creation of
> > > > > an NXP-specific driver. To clarify my concerns, ST, like probably
> > > > > some other SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in
> > > > > downstream with plans to upstream them.
> > > > >
> > > > > If we proceed in this direction:
> > > > >
> > > > > -Any vendor wishing to upstream an rpmsg-gpio driver might submit
> > > > > their own platform-specific version.
> > > > >
> > > > > - If NXP upstreams other rpmsg drivers, these will likely remain
> > > > > NXP-centric to maintain compatibility with their legacy firmware
> > > > > and the nxp-rpmsg-gpio driver, leading to platform-specific
> > > > > versions in several
> > > > frameworks.
> > > > >
> > > > > - The implementation will impact not only the Linux side but also
> > > > > the remote side. Indeed, some operating systems like Zephyr or
> > > > > NuttX implement the rpmsg device side (Zephyr already implements
> > > > > the
> > > > > rpmsg-tty)
> > > > >
> > > > > Maintaining a generic approach for RPMsg, similar to what is done
> > > > > for Virtio, seems to me a more reliable solution, even though it
> > > > > may induce some downstream costs (ST would also need to break
> > > > > compatibility with legacy ST remote proc firmware).
> > > > >
> > > >
> > > > Could the virtio-based mechanism be used directly (without rpmsg)?
> > > >
> > >
> > > Technically, yes=E2=80=94it's possible to use the virtio mechanism di=
rectly without
> > rpmsg.
> > > It=E2=80=99s a bit like talking straight to the IP layer without invo=
lving TCP
> > > or UDP: doable, but at a lower=E2=80=91level approach.
> > >
> > > As for the idea of gpio=E2=80=91virtio, which could be an optional so=
lution
> > > that certain customers might prefer. I recall hearing this idea from
> > > Mathieu originally, though I=E2=80=99m not sure whether he plans to i=
mplement it.
> > >
> >
> > As Daniel pointed out, gpio-virtio is already available and already inc=
ludes a
> > protocol that is generic - no need to redefine a new one as this set is=
 trying to.
> >
> > As mentioned in a previous email, I understand some implementations wil=
l have
> > restricted memory and need to use RPMSG.  For those cases a generic rpm=
sg-gpio
>
> I think this highlights why some customers prefer RPMSG over using virtio=
 directly. Limited
> system resources and development efficiency are the two main reasons that=
 make RPMSG
> a better fit for certain environments.
>
> > protocol should be derived from gpio-virtio that would only deal with b=
reaking
> > down the standard gpio-virtio protocol into something digestible by RPM=
SG.  That
> > was Bjorn's point in an earlier message.  This will allow to use the sa=
me interface
> > and be flexible in how we want to talk to the transport medium, i.e pur=
e gpio-
> > virtio or rpmsg-gpio.
> >
>
> Once the remoteproc chooses to expose devices through an RPMSG=E2=80=91ba=
sed protocol,
> deriving another driver from gpio=E2=80=91virtio doesn=E2=80=99t really m=
ake sense. That would essentially
> mean re=E2=80=91implementing parts of RPMSG yourself instead of using exi=
sting one.
>

We clearly do not understand each other.

> > Fortunately RPMSG already uses channels to differentiate between traffi=
c, no
> > need to multiplex everything on the same channel.  That too needs to go=
.
> >
> > > As the chip vendor, NXP=E2=80=99s role is to provide all possible opt=
ions and
> > > let customers choose the approach that best fits their needs; we don=
=E2=80=99t make
> > that decision for them.
> >
> > As kernel maintainers, our role is to advise on designs that are generi=
c, simple,
> > maintainable and stand the test of time.
> >
>
> These adjectives only make sense within the context of a specific use cas=
e. Different
>  systems have different constraints, and people choose a particular solut=
ion for valid
> reasons based on their requirements.
>

You can choose whatever solution you want, that is entirely up to you.
Maintainers can also choose to reject that solution for mainline
Linux, which is exactly what we are doing.

> Please respect their efforts.
>
> Thanks,
> Shenwei
>
> > >
> > > Thanks,
> > > Shenwei
> > >
> > > >
> > > > If not, it would be good to derive a generic rpmsg-gpio protocol
> > > > from the virtio protocol, and land implementations of this in e.g.
> > > > Linux and Zephyr to establish that option.
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > > >
> > > > > In the end, I am just trying to influence the direction for RPMsg=
,
> > > > > but based on the discussions in this thread, it seems others shar=
e
> > > > > similar expectations, which should probably be taken into account=
 as well.
> > > > >
> > > > > Thanks and Regards,
> > > > > Arnaud
> > > > >
> > > > >
> > > > > I just want to
> > > > >
> > > > > >
> > > > > > Yours,
> > > > > > Linus Walleij
> > > > >

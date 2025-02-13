Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877520010C
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434666; cv=none; b=WLu/Z6U5KGdd7U0CuUQNhS082Nk0jGeOtvrey/fQvRx9xABCvZWNTPVZ29eHJKCp35Nd8+Gvzyef/j98lHnSJl2xBzcB0/NS1jxZIsFnbCCLIVQLD5Zp8QezuhgDduetV5Gv4kr635Ip6cHkNHxy2XJxsA1IPLjxG2RbAFa2fG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434666; c=relaxed/simple;
	bh=QIcpGwLOutIyQh32HNDYfU3g6OUWstG2YLgU9TsX+WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0Eov4OHK3LADaosta0ZMDCpxgOEfvgtOCoaxa1+wzNohQkAGEa4/NTwQR5+Mlf1JxDNUr8eBLNcT+g6ka/G72QA6vnFbQBmYUnzkUjJpNYc70tRdWBTt5OlDCLLgTh9Dqz2myQ46Zwomklrf0tLpINVG0mvLRpcmphcfr8+zs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNL4Izau; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNL4Izau"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-545097ff67cso541887e87.2
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 00:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434663; x=1740039463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=uNL4Izau54AlmFNwDMQY4CeOFszJfaae84R21YNDfodObyBM7/hSm+SUwaDhV2hj9J
         s9NTCClL46B1rLPoE0XhHEViqW6CyzL2qS29Ak7Q6Lzq266fdVIqlPS79fVLWbbhBTJn
         ygnE9UrABXWMIoxyWgSAw6rKG5kGDhG0pXEqdVbqTzI711FkK8PStMftnddQw76XDTjk
         or7nFRWfbvz9RjRF5ayea4ejruxaHfNohSLBYZT0tPDOEdq5uiM3e+Wsf43AonA1G/E3
         aPeObNY43geN1BToQU+tPtNiWttjx0sp6Lfio3x6Vt86sZTY+I32sd/83x1in/7thNZO
         DkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434663; x=1740039463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=fVOLYa1ex89BGKynkVEul8yCS28NblHGW4+rtt7iFVcNqng42N4NhT6SkS3kirgDoW
         qo8V12D4zz3xK6xbz/mCczYzdS0ncNi5Kbh4Bccd42ppoO0GEvi0Q7JK/jscj/t2mPHf
         x2d5nWKeXrKAiF8/zVPR4HDzhBwTBxFNk3cX6tRrMIBc6JN2noq8LaUnLYlsd1fg84Cv
         y/Px0fBpVpUBf85ckbQQWcTO9qkQPEdQF6wLMzpdOKRA201WZKhZPbbnRYVpOdhNi/9d
         KrrT7Ow+aooXsgff0QVfFdjuFzuCp5x5m/8X3sxsGDUk/aiA1VFDJXGOJ/DZqsRlKh3x
         lceQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmAiV7tL6bMluzZD9AdAK1Cqmh+bgAdxi2GzCF5Q7y0e7cGdoi1yKwhzsdfNNPepMdNlg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh4eFIey/TXfsUFreQLcK0ZU19rx9kBDU0It4ZnkzvqWy70llN
	CHEDHdvX+V+dGKCVqyei5noAXdEWzCK22qFxaAbNQ37yPfhkLp84pxXNjVhJzdjufRgbgG/lwzG
	sm/FqcnDspsAhoRUXBOhKp0RXkCDo0se5+ClJ
X-Gm-Gg: ASbGncunmLYYIIptyZQweg0qixyULHaMSCIYBsPKO9dXDJScCqaSTDlCZjYDfCiF0EA
	BSpd3mB8h0zKRMPhVyv/JpsaNKRtuNdy4TQIvyWJw58NeeedCANpRqpdLRxgOp+cuNALRA4E=
X-Google-Smtp-Source: AGHT+IF69eZEtmq/bytiQvp5QhXzQAgT59awT8Yvq0oySfRGAni/tuvturEoI284/LivbVgt7JWAcyiW719+mfChwik=
X-Received: by 2002:a05:6512:1324:b0:545:c92:271f with SMTP id
 2adb3069b0e04-5451826ea10mr1946789e87.10.1739434662716; Thu, 13 Feb 2025
 00:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com> <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain> <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:17:06 -0800
X-Gm-Features: AWEUYZmIzWqZe4wj2qpsKpM0Mnm6z_-a0UXdGuXwQ-oMTHKT5ieIi6a9LqYyhk0
Message-ID: <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for scmi cpufreq
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 3:42=E2=80=AFAM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/ar=
m_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d=
32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi=
_device *scmi_dev)
> > > >>          device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct devic=
e_node *np,
> > > >> +                       int protocol, const char *name)
> > > >> +{
> > > >> +        /* cpufreq device does not need to be supplier from devli=
nk perspective */
> > > >> +        if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name,=
 "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > >
> > > This means when creating scmi_device, a flag needs to be set which re=
quires
> > > to extend scmi_device_id to include a flag entry or else.
> > >
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > >
> >
> > Yeah, I like that.
> >
> > -     if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufre=
q")) {
> > +     if (scmi_dev->flags & SCMI_FWNODE_NO) {
> >
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
>
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Sorry, looks I replied to v1 series. Can you take a look at that
response please?
https://lore.kernel.org/lkml/CAGETcx87Stfkru9gJrc1sf=3DPtFGLY7=3DjrfFaCzK5Z=
4hq+2TCzg@mail.gmail.com/

If that suggestion I gave there would work, then that's the cleanest
approach. This patch series is just kicking the can down the road (or
down an inch).

-Saravana

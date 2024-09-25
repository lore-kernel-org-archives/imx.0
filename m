Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A237145A11
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727294722; cv=none; b=FZZ8QrH6SgOcvW14oFBuOG6a2Auvpu5Ay1seeQ+uI/MDGiLfNexsme138fcJed5s+L7qa9mtsT0MBHk6caO5YXv5NJn7CXAam3UOI0077IK9Fl3dY20ti4I2uEDY/NdIIvRNSxE5gOFt/K5WO2oXyyoIxw+s69z3T1bjs/4Ke+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727294722; c=relaxed/simple;
	bh=YeblqJYwm2BtjWpPCooiZuze5OgFV3qFGUvUKNxIth4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zmqd+FvDb+zEoSGpjmtW8BtQWXOoOmb1WxL5FXR62zZysCQFChLzNY2G0F558z38WU/BVJuk2wawf/Df2o6GLaxMycC06dRZpMPbdX08H+GfovUqlKndZ5MG8Pl2E8EnCo7uy/cPSDabiULHBeTOM2Mt0T/n24AJ6gAVq02H0vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QHyz898W; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QHyz898W"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e082f2a427so226669a91.3
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727294720; x=1727899520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeblqJYwm2BtjWpPCooiZuze5OgFV3qFGUvUKNxIth4=;
        b=QHyz898WhXa3chzKJhseWUBBs075sJJZg04vHCVwKB2bv4BEkSYUcEfPDzHncY047K
         afpVjHdUG0CG3Oul/3YnmRfsnAvqeEaIyDQDu30vLTyPq2XckhXla9l9tENux/nVF4vX
         AXgD+FkOCs4CuNctz5yE+aqjg5+OPA4h8/TwG6jZdBjGD4eRe1nl1xhYEJCGPa8e6FFB
         eGw9UCUaIpDtsS5opLMoUTt+NqIr90+7PhhlJ9TEpwr0zQxsTaxCDgQJqwZeOMmAM4OO
         ZGOBoJ2DG4j79xdpi67A/vbkybIsAe5VmfZJPr6lXOuJFR0vjlmNyhn7N7+mz0eWnRJy
         c+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727294720; x=1727899520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeblqJYwm2BtjWpPCooiZuze5OgFV3qFGUvUKNxIth4=;
        b=YAjl9g65yCPpqLqga/5xnuqF4sUms981RRmFbbcuLkAcu4KYbYUSGWZ4cf2vHz7vza
         2ALPVne1ypX5exbDy0LqDKULOQ/d2/YNmPJ1XylIsDpWP1TOsv2bQVDgSXR+bBYV2o25
         +EaN/Ovm3+nS9L3svcwiiJLGujGYBCFwWxz82+jXwpDjNmGBjDP6fBpldQJ125zf+nhN
         s2P8tZ8YZq4aN/6exzv/4AlvhzAOXZTpyxA4xb5i9gPTH/kK9mDQZA+BhW0StwQt5uS1
         QXO96pR3gL75P3wQUc4IIV9LPGXigV0pzKyceqxQ1Ly1TMy4tcL+X+brF4vcHdDV4+Dz
         Gwdg==
X-Forwarded-Encrypted: i=1; AJvYcCUQNsmU5SjoXXATmlvDMlegD1vAzLdTjCBEHPocNPxLONbfc+bz4MvruR5jnqyPgrTHR0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7ENy6lG3QtQEwGq2pf/fxxjUgSHxKglQlY0jMCkBXUx3h5rAq
	f2TqGvLSlK+RWZ4+bfvzAlLqBz63+ju5HUsKSCbIwhs7exX+uEbsOolP8hG4Sa7ToZwO7/bO8/i
	teyB6OIlUPLlctZg56Og0GrF/QWg8ObeAnxw1
X-Google-Smtp-Source: AGHT+IFeUPcDhTOCy6XpxwUvvIKVTfi64DqAL33+O7MwLkOljqYRRc9rq5Nt5AYfJqXkUxRtu20PsFxjE0VZ4uNbqCk=
X-Received: by 2002:a17:90b:380b:b0:2d8:8ead:f013 with SMTP id
 98e67ed59e1d1-2e06ae21a45mr4279639a91.7.1727294719839; Wed, 25 Sep 2024
 13:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925160026.84091-1-marex@denx.de> <486054ad-20c2-45f4-a457-c9334afb53ed@app.fastmail.com>
 <03b05be4-2276-4e70-9480-2b1467df4ef6@denx.de> <4897ec78-b82c-415d-88dd-5092fa009f77@app.fastmail.com>
 <51c340c5-b104-4872-bfdc-8c6d52f6a35a@denx.de> <CAGETcx_ODj-FqhH7stxu27PpGNg2LiFwgC=1piLaBjDV4OagLA@mail.gmail.com>
 <37634d8e-678e-45ba-98e9-a40a5e71cf77@app.fastmail.com>
In-Reply-To: <37634d8e-678e-45ba-98e9-a40a5e71cf77@app.fastmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 25 Sep 2024 13:04:39 -0700
Message-ID: <CAGETcx-=UvJx1C9nNYzLP7v1T6sELN3QPzfbZT==b83LUAC=VQ@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: Probe the SoC driver late
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, 
	kernel@dh-electronics.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabio Estevam <festevam@gmail.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 1:00=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Sep 25, 2024, at 18:48, Saravana Kannan wrote:
> > On Wed, Sep 25, 2024 at 10:07=E2=80=AFAM Marek Vasut <marex@denx.de> wr=
ote:
> >> >
> >> > Right, of course. And unfortunately it can't just register to
> >> > the fsl,imx8mm-anatop/fsl,imx8mm-ocotp/... nodes because they
> >> > all have a driver already.
> >
> > Can't we change this to add a platform device and a platform driver in
> > the initcall? And then the driver can return -EPROBE_DEFER if it can't
> > get the clock yet?
>
> Yes, good idea. So the initcall would still use of_match_node()
> to see if wants to be loaded and then either bail early or
> call platform_create_bundle() to register the driver and the
> device.
>
> >> > On the other hand, making it a late_initcall() defeats the
> >> > purpose of the driver because then it can't be used by other
> >> > drivers with soc_device_match(), resulting in incorrect
> >> > behavior when another driver relies on this to enable
> >> > a chip revision specific workaround.
> >
> > We could have soc_device_match() return -EPROBE_DEFER if no soc device
> > has been registered yet.
> >
> > For cases where it's already working without any changes, we shouldn't
> > see any new -EPROBE_DEFER return values. But for cases like what Marek
> > is trying to do, it should work properly. He might have to fix bad
> > driver code where they remap the error instead of returning it as is.
>
> Right.

Sweet!

Marek, now you know what to do :)

>
> > On a tangential note, the soc framework seems to be yet another
> > framework violating the bus vs class thing. If it's a bus, then you
> > need to have a probe. Otherwise, just make it a class. Might be too
> > much to fix at this point, but might be good to keep this in mind if
> > you plan to write more frameworks or redo soc framework at some point
> > :)
> >
> > See Slide 20:
> > https://lpc.events/event/18/contributions/1734/
>
> Very useful, I don't think I've seen this explained like this
> in the past. It's probably not easy to change now since I'm
> sure there is existing userspace looking at /sys/bus/soc, but
> I can at least make sure I'll follow these when reviewing new
> bus_type or class submissions.

Great to hear it was useful!

-Saravana

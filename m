Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CB234BA42
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 03:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758253413; cv=none; b=q8eM92CXvSoFKrmzsOKvY7L84seIyhlE/u9xEvWrPBpXM6cva8MoeS54ckt7IAp9/fGhlRlADDXZyZUdzo79LuSuFg0VudPwX/bCLQBURsHPqev5KkWowWJyDu5SQzOJCpo1+wu0s6edu3jlI5WnbMXg3q2QXbIQiF1D5Uibo48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758253413; c=relaxed/simple;
	bh=aeNvmUS62k0jH566cB0cmH9oXeO2gW4GJlD3nXTVxAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imddQHvmH8BEmQKwoMJOfCLUMZWB/G7CLK6D/qf6YTuh5zTa1CU5aGFO46QKyib5YjX27R37yINkacqLqHB1ZhAeU6o0DZr9azKoK/X6fkW4S1SFArRZokr6gPyJpqDk7ZGK4NSNBSpNUprEp+n2YRPvR+tW3pXlkHBm/q0niOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzhSCfI5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzhSCfI5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-330631e534eso1419552a91.0
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758253411; x=1758858211; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=;
        b=ZzhSCfI5DtGcen8M1NAWIu1fA9cavuEfb3K94RMt7MWIJ+kQAtI6QE1aupeWvdoNzY
         C0v7iZ8xdqrCakOz8u4ZQNj0HpcpBIYpUaQhZXUbrEYSQ7BFD75WM4WN8shASuKyS8J7
         MeFlDNhavAKh/3b2nSuGKkONPw0htKhy1Nmk6Ebt2JgQneg+kRYEpQjecbT5n/M/k2NR
         7Gf8glz2QnBmKMqqiqiOCvwsrC0u6+0mI8FV4dxX2ii8h929fW8+NwS9C0pc1vk2SoJt
         N45dsmS7TPDFyMDvyemVp+V0hbtqHgmpfEAO/hA06SNxO/gUvKytBXgRkAmVSWy46HTn
         sLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758253411; x=1758858211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKMYfdVwb74kV6i8GOAfD4K3WUGY3beOoq2S/aiwLCo=;
        b=DxWLPHWC7InnQqN7s+zKC4LOMDPXf6V9Uws90X8vOqUfVHSTyN7awz+AZxz4wGmXfE
         Z+H1GqnvClUPDZTfCfQZMLLrwtN5q3HBz+P52+PsGxvfs6UxhmCXhNVE8AlU1TeGTmqB
         w3nYNmOhYHNp2ZBrzvHFb50xBVEzlRD0xUni/SBwflUnBY8lN9Hn5vYj+JDDBV68uC6r
         /eK984BX+L1aiCu8k7oRt+i+zjIGzVH7qwxOZF8VrvZe4Xs33ZwN8mMX+cSuIFd8dJBQ
         LvidscGUSeOyfge4SKBkw+abEUSGgUSrcpHK4iV31O6JQhxLNwhGnUEWRG/2aUi0xc56
         8+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVNoacnweY6BwdJgPD8TpyqfSBQNjzU++um52o/tfJxeh+9EK5C4hOc4WhowneC3VE2eBs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy47A+DCjNZZyiFtIS1Y11a0TM7X9mWj/FzErLUCY+c4C2v/shR
	dsNI0GJ9ur1z30XMV642j9wVo4uu7v1VyVcvHRAQvVzHLAL9w7czK+CqGqGIWldE6HP3/aHc3Jq
	fdGvDI8kHJ3kj3uY1q/7jt8mAcr+tSxM=
X-Gm-Gg: ASbGncutlxKW63Nhh9hE2R30WvbP1+x0n4t1ohsI1g8mtCgKm12FyBtci4zWAs7LBcZ
	MVEpVT/uHRIU9rMERjslNPKbpi25qItQ+NPFJ2aN7ALPnymdrwlzwAL1rzHc2+j+FUhN7OPLUO5
	4c2ayUrNqylTojkSmcuqsd4Q909+JKd0kt1nvax7r3i2YRlz7arEOdcEmU5XtqfsFZKutIhI14X
	dtgL6k=
X-Google-Smtp-Source: AGHT+IF3ku8gvZB1hxFYXtLnd7iwTR3jkeyD4oKxxo5kWDQcOyxdH6t3IjIvgH7PYtQujNBSFI44t24lqUYUtwzzka8=
X-Received: by 2002:a17:90b:52d0:b0:32e:d011:ea1c with SMTP id
 98e67ed59e1d1-33097ffd1b2mr2599824a91.15.1758253411070; Thu, 18 Sep 2025
 20:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat> <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
In-Reply-To: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Sep 2025 11:43:05 +0800
X-Gm-Features: AS18NWDra1nGW4hE_RulzgXqUXLGFVIDrxwneg_8Sfyhy5B_85F5WDGUq5FPeS8
Message-ID: <CAA+D8AP8eJ8_pueq1ZSb-ORzTJbNT7HOwKFOO5ZCXqgqoQ1qGQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca

On Wed, Sep 10, 2025 at 6:29=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> Hi
>
> On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > Hi,
> >
> > On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> > > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@=
bootlin.com> wrote:
> > > >
> > > > Hello Shengjiu,
> > > >
> > > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > > >
> > > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because aud=
io device
> > > > > driver needs IEC958 information to configure this specific settin=
g.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > > >
> > > > [...]
> > > >
> > > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned in=
t iec958)
> > > > > +{
> > > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > > +     hdmi->sample_iec958 =3D iec958;
> > > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > > +}
> > > >
> > > > Apologies for jumping in the discussion as late as in v5, but I not=
iced
> > > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > > really needed, as you're copying an int.
> > >
> > > Thanks for your comments.
> > >
> > > Seems it is not necessary to add mutex here. I just follow the code a=
s
> > > other similar functions.  I will send a new version to update it.
> >
> > Let's not be smart about it. Next thing you know, someone will add
> > another field in there that would absolutely require a mutex and now
> > you're not race free anymore.
> >
> > Unless there's a real concern, the mutex must stay.
> >
>
> Ok, thanks for comments.  Then Patch v6 need to be dropped.
>
> Is there any other comments for this Patch v5?
> If no, can this series be accepted?
>

Can we have a conclusion that keeps the mutex as Maxime's comments?

Best regards
Shengjiu Wang

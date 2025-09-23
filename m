Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97802D0C83
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590980; cv=none; b=UYli6juBt1yUr7e5PX+vThBkuPnG+mu7svFaBP7HNq9SjKKAuTV/vwnoI4ZLaMdPc20OBRTgy/gRAkLPGQmBq6GTMvH1o+DJlbedYZfXDOMyER0VQU/e6wLxiFBrOUNgQp1fZNmhvSl387XaYcpPYESGw77X9/4Dk4WgmY/zJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590980; c=relaxed/simple;
	bh=Keih4ozM2ClJ7bLKolp4rzu48rFOC9n6MVTSF0I4RXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qb/ZfbBr2CJDiCFdxDPfWZ3xbMDWgjg5EgcxZdl3pd33wESoIzX2PRV2Z66AuctOwyCfwCvy6CH5VbSmx/mof7N8AKZcFuIiCgj/SDBhzaUbsU6qmlsJsZPEQIR0QHqUTxdWskkxwzQvYtLeid3P+3quUgDFvnGrcb9fVE7A13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEP5K+SQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEP5K+SQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-330b4739538so3132113a91.3
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758590977; x=1759195777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=;
        b=lEP5K+SQ6IYsQLeAhs/dfx/TsgHDar3EYcC2f7nJGs2z5x6QPECHEqaqyZAuDdIBV+
         yuH8ZXLMkebj7qOUVfE1NdVlHAYtZ6iN3+fE59ZfGpGJTLSHIAy6bO8VSVhTahg1Mgko
         QxlQkgJ/J1MO9ihqLjD4qUX07ifBqhLE/xavscB0oayo/aYgFetCLacIG7Qlu9hkR3Iw
         uNRzSq21A2WAbtSQKFfG40OsaMMBh0/AB6ckRQm1TtB6IDGuGgkk8haFHKjrWzru/8dY
         z3JisO3/Fr0/oLKplQ6vH/RFyWt9yUl/GkGudc2EC+midMsB7MU0cAXyGSr/Gemj2sXp
         bJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758590977; x=1759195777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=;
        b=cBwg7GyE/UIIqtpwbdXprFv46g4rCAtUrBiu80Wg4wXiDmh7ivbfq8+KJeklu80FKg
         iXN3/dm0NMNUQryMSslbyuhV5dkhW7tMn/SIajrq9v16saBidXuXPVJdypI1hfSGSOGl
         jE7Z9WJ9BT1vUMswUu1b1Zwqa8KAt+Se6nQLT0H8QrSnnTHXzaakXaSxcSV+WePcVgn3
         m9aBQswl6OUxe4pPxvh30TbujwN34u842gauCVTmyWCXH9pGJcZTVSyqsJh5jPOpmc+w
         sb39xp60XsD5FVEfQ3nNqqsLFAqhzXDqMPGOyN5nRzdghxKD4zHn7dMBDWk+cxS1yyM8
         xWqg==
X-Forwarded-Encrypted: i=1; AJvYcCW8ZBcZu1CxpTU3Z06NiHNAcdCMyeQN2RbkRJVPHthj6ISJLZ+LBIvcCkpOXYrRNRwky9U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL5ItJ/9OTo0Fz5IXwgjy+7j9VfkL1r431oysr5y6QUQr2h4wC
	X9/nEG6l7R8aYbg4OkWINPJinraBrmUF+yMrrxlYG2NsxMO4GLZ2kkZq2v4LNEwg5gCFwR8Dv4q
	B13XRlo+zyYL2OzscGzrwxV78mRFacT8=
X-Gm-Gg: ASbGncvUGMNM7V1QQjVc8x4YGVProhcifW1m2ZJp8ZVaZuOJYwoOZ1b7nxu2fhnfOhl
	n7PWYdlpgSXbSC6PVsuYnLIwL+ha4xxhFrmk/cpOK+Ja2Sy6tU4zJJX07p2y0HFvz8oUkh/9H/M
	waRacHo4lUZ/eXs+Yun8MXcjHyzFadTSzdBdKnmFTsWQAwF7s1dtLQzxbLKWnbvn+n7FfYAC0h1
	d95GZo=
X-Google-Smtp-Source: AGHT+IGBT9LTfm84q4DXIRoJSFR8hZ2WWRU49SsvtumqUnLfaKU5tnx1duKBXoUog0HE+Dc5+BSde4IFSplat+4nyaY=
X-Received: by 2002:a17:90b:33c8:b0:32d:f4cb:7486 with SMTP id
 98e67ed59e1d1-332a95e8e19mr1041351a91.19.1758590976762; Mon, 22 Sep 2025
 18:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
 <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com> <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
In-Reply-To: <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Sep 2025 09:29:23 +0800
X-Gm-Features: AS18NWBhgiBnQW_QrjL4oCw3YUyblBEb719xz-MBTlZAVwouH205ucQ6fmr_z54
Message-ID: <CAA+D8APA85PhWVkW7c=d_qWF7L1ERxe7cS3Gg00SV-3TSyLwQw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, 
	dianders@chromium.org, cristian.ciocaltea@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 11:01=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> On 09/10/2025, Shengjiu Wang wrote:
> > Hi
> >
> > On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> >>> On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@=
bootlin.com> wrote:
> >>>>
> >>>> Hello Shengjiu,
> >>>>
> >>>> On Thu, 21 Aug 2025 15:31:28 +0800
> >>>> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >>>>
> >>>>> Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio=
 device
> >>>>> driver needs IEC958 information to configure this specific setting.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> Acked-by: Liu Ying <victor.liu@nxp.com>
> >>>>
> >>>> [...]
> >>>>
> >>>>> +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int =
iec958)
> >>>>> +{
> >>>>> +     mutex_lock(&hdmi->audio_mutex);
> >>>>> +     hdmi->sample_iec958 =3D iec958;
> >>>>> +     mutex_unlock(&hdmi->audio_mutex);
> >>>>> +}
> >>>>
> >>>> Apologies for jumping in the discussion as late as in v5, but I noti=
ced
> >>>> this patch and I was wondering whether this mutex_lock/unlock() is
> >>>> really needed, as you're copying an int.
> >>>
> >>> Thanks for your comments.
> >>>
> >>> Seems it is not necessary to add mutex here. I just follow the code a=
s
> >>> other similar functions.  I will send a new version to update it.
> >>
> >> Let's not be smart about it. Next thing you know, someone will add
> >> another field in there that would absolutely require a mutex and now
> >> you're not race free anymore.
> >>
> >> Unless there's a real concern, the mutex must stay.
> >>
> >
> > Ok, thanks for comments.  Then Patch v6 need to be dropped.
>
> To properly track the changelog with patchwork, can you send v7 to add
> the mutex?

Yes, will send it.

Best regards

Shengjiu wang

>
> >
> > Is there any other comments for this Patch v5?
> > If no, can this series be accepted?
> >
> > Best regards
> > Shengjiu Wang
>
>
> --
> Regards,
> Liu Ying

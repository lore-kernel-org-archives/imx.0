Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F33A0E99
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484401; cv=none; b=mAb74LGN8NJjarroO1GJ2usKlb4rsnsS2W/b4LCvigum+2OxhIuSp3RC9XOIPJsBFih5pr2TIqnaXKpZR/JUuMsCOY+nU37TnqRXimOzaZxwGak6tFQR4FiybNsCU1kOM2ZbQHvYD7FQUxqQSW9Ah0nwp9dPFTFmG1kKrWUQCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484401; c=relaxed/simple;
	bh=mrAbzAWxr60dAFBMUskJrOYI7tum+hisLhbJRq6FwWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0Q+5rqu8q6EzdWrXAG23+/R5UtIGjKukT62/kf5TGHcLY6et26YJHTn2uAMkiXQS4r/teqNSRY73N1hTfQClqbGKQOeNb+ugaCyBMCotB0lg+suXe7b8KAcRpZb057TF+ljhCCKDrWdntZGN6z/3EIgtfXJwp1iTc9NkFyYhYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3V7Rawm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3V7Rawm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946A7C19423
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768484400;
	bh=mrAbzAWxr60dAFBMUskJrOYI7tum+hisLhbJRq6FwWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M3V7RawmkDE9Q3K8qh2nKPqr4Bimpz1iGHUYBhDh3Pfz6xWHu1tluLCoIFDgibWDN
	 Zw+dxpP1SZibCrhI2EEOeCxwUcaMr0EHwlgiy5f11S3yY7e5PdJ92RV0Aj6nffrP79
	 7sZ1+s5l1qAE2CHT4f9insjBWEYfBfL4nX1LUbpg99WKuQk0NYtcv3/Nwi7VzAK868
	 6pJPQDnF/MfwFdUkzgiKJkKhtg76+kvqkvcHp1bxWRGm+M0/NPODR0KAvPqGI01C4/
	 HshGyd9uTJ6zaW5GYbsVdvDuWGKDcqjU8AB8shveedXea1Hzht8snPFwiDg4U5/3KY
	 eGlxDlrhhHCXQ==
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7cfd10887d5so398899a34.1
        for <imx@lists.linux.dev>; Thu, 15 Jan 2026 05:40:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnu7NThKQoYYLEe9VJ56DH3u8JlrfPt0sNRkAnkAiJ7sEJ0mocUhM/S4v7+iPqjrJSEGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtJQk8IA+XTwuZMErAeiDsuQXXCxC0BBdBMqaeykY/v74kHtny
	LDIGreUK1hzm6Y1YNBrJ23TSF5Bt1hQk1iV8XN9Jh8mJTR4JYBWNyObdrWSx69/giQSReCfuh3T
	y+XPR5hTdKyGdNrEo1tec1STUfBetB0g=
X-Received: by 2002:a05:6820:229b:b0:660:fd8d:9567 with SMTP id
 006d021491bc7-661006caf58mr4486708eaf.42.1768484394669; Thu, 15 Jan 2026
 05:39:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2256082.irdbgypaU6@rafael.j.wysocki> <CAJZ5v0gdj6Oe=LSJX8+6JbxTt42W3RkabLDWh=VqEkjUvAWxow@mail.gmail.com>
 <aWjbPpkDd_SORcfC@e142607>
In-Reply-To: <aWjbPpkDd_SORcfC@e142607>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 15 Jan 2026 14:39:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i+uXsCRk7kxLb8t+96k-SOJY-wEwNvYBXTdMKWSCdR9w@mail.gmail.com>
X-Gm-Features: AZwV_QjYJ0BHmX3LmoNRKoKvX64bvSOuZN1goYZbg_jJwN3xZNHgDMdAG5htFnI
Message-ID: <CAJZ5v0i+uXsCRk7kxLb8t+96k-SOJY-wEwNvYBXTdMKWSCdR9w@mail.gmail.com>
Subject: Re: [RESEND][PATCH v1] drm: Discard pm_runtime_put() return value
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, imx@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 1:20=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Wed, Jan 14, 2026 at 01:03:25PM +0100, Rafael J. Wysocki wrote:
> > On Thu, Jan 8, 2026 at 4:38=E2=80=AFPM Rafael J. Wysocki <rafael@kernel=
.org> wrote:
> > >
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Multiple DRM drivers use the pm_runtime_put() return value for printi=
ng
> > > debug or even error messages and all of those messages are at least
> > > somewhat misleading.
> > >
> > > Returning an error code from pm_runtime_put() merely means that it ha=
s
> > > not queued up a work item to check whether or not the device can be
> > > suspended and there are many perfectly valid situations in which that
> > > can happen, like after writing "on" to the devices' runtime PM "contr=
ol"
> > > attribute in sysfs for one example.  It also happens when the kernel
> > > has been configured with CONFIG_PM unset.
> > >
> > > For this reason, modify all of those drivers to simply discard the
> > > pm_runtime_put() return value which is what they should be doing.
> > >
> > > This will facilitate a planned change of the pm_runtime_put() return
> > > type to void in the future.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> > > ---
> > >
> > > This patch is requisite for converting pm_runtime_put() into a void
> > > function.
> > >
> > > If you decide to pick it up, please let me know.
> > >
> > > Otherwise, an ACK or equivalent will be appreciated, but also the lac=
k
> > > of specific criticism will be eventually regarded as consent.
> > >
> > > Originally posted here:
> > >
> > > https://lore.kernel.org/linux-pm/3045480.e9J7NaK4W3@rafael.j.wysocki/
> >
> > This is the last patch from the "discard pm_runtime_put() return
> > values" lot that has not been applied yet, AFAICS, so this is the last
> > call for objections or concerns related to it.
>
> I think you can go ahead and apply it, I don't see how the imx8 driver wi=
ll
> be affected by the lack of debug messages.

Applied then, thanks!

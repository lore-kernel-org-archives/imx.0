Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6D1DE4F0
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737030301; cv=none; b=aKADLm9r/D0p/bqEHXbW9AmHl9WeSrGDyvHxfrah8IfIBw9llsA4SjTylYIFf51lnk+f/WAtwmuvEwdhVKp30nbhGXD9tAgxks3mE/hi9MPB7EIhq5nJivad7Uxu+oNmLA5kMyBTSxBxgqRr3mGaK/5X7cslqpkk9UbQfosjImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737030301; c=relaxed/simple;
	bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYz3kzWLC7rihWXtgU1flS5v292ivcL6fJgFgNRdPxDUlFBa9iVz6SMYI/qLs0vqnCLPnti4Vkb0+gTYdJ4ycebvAto0x9JcQrZXaYqQz5WzT+3RUoJ1htfM042He1hR1OmkVaD3kT/nU2x4Op2PwHWHJcUM+DnvGjLlNpGuUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=lpnSMmdv; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="lpnSMmdv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6e9586b82so63590385a.1
        for <imx@lists.linux.dev>; Thu, 16 Jan 2025 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1737030298; x=1737635098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
        b=lpnSMmdvT5azzLhsn35/4ZZ83ZdDQMGK85r5DqcerE6fEXNL1BeLORXoOmi/tSdMvw
         PtujlfCelotYVtVs1wIhDhXILkWXuUp7SiCvmov509kk7nUem3WviFcwIKa+fxNMr7Qc
         WqySADphiEg8j4WJhruXtOUTidMidN9jwOpaB5GniphHsL0rHAOfy7Y7qteYsN7hF03l
         gxhIyTEiSFtNDFcEiDMHsQMsdyUPMLXr6ESEYv/0KYTZ+32eV/9hmbLPShOqHcyaHTJL
         SKJMEzoBwGbZhV+LyOQ2d1aB19Arck81zDTRE1UDRCwm5PG8LCRTqdD24xxsAL4oVWzu
         dXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737030299; x=1737635099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
        b=uivncOtOWk067mfJ5S0tLOFeZNbdHFW8J/4mS5hNfpGmbHt7fwpwueDsDNTF1zJRuq
         cp25tAh8McP6/jZgcWVzF9v0U1SU7SJq9Hi2ovejw/D8FK3SuFE9kQZeIXuLHQ1q6AUx
         F/ZqkmnwEH9k92gX3nuiSnh78SH4RJc7srn9DbNryCg+z7RazePKvk1nQgAD/LMASVGf
         lFawvEvmh+fMmnKXF5QM8iW1HsNN+VdsGWrd6AP0BAjXCbgYIHq44ReMoL1k6ocwOu0Y
         q8NeFpX4qf9GjPbk54hVf+ywybaWJXQTT93fKCU2j7AM4vSCrqFHKDE0qogFCfkL0LV3
         cLJw==
X-Forwarded-Encrypted: i=1; AJvYcCXGpzQT1gZ9bjFG/m/nbHBSDmQH/JUE/Y7tHBhYv1ANpGDEx/ZVV7LWrVXqs9dYXFIxQp4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXNz2Qx9/hbcNetxQrlYfV/GTM2AcqHHxKLM3X3oRG+gbOxz8p
	XhsCwppUVTwZlyfsrR+eZL/0XPdd7icqSIYxD4zuewwX6dj+JoyubhRr2KpQeU6Flx/9AEc2+/d
	AdAUefk3x8HZ6buN3Ka83cHDcDC8t1Cqy0spf6Q==
X-Gm-Gg: ASbGncsaDsdx5BBZiW7wmzINSRMRC/FKQsAb7ydYrPHK3FU6ctM1X4hbAUjc7BGuYbQ
	OXhPpp13nxRFwXEpku4+oWNDfBoxIRYDNOM4=
X-Google-Smtp-Source: AGHT+IHYPoThOqCGG0mIrocl9o1givl0D/RoYwWOKY0kUiZ64KPF9cSvP+6N1Rd6ke2PYtdS9xOibflODkJbaGvT990=
X-Received: by 2002:a05:6214:528e:b0:6d9:3016:d0e7 with SMTP id
 6a1803df08f44-6df9b2b1a21mr442378366d6.29.1737030298608; Thu, 16 Jan 2025
 04:24:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de> <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de> <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de> <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de> <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com> <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
In-Reply-To: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 16 Jan 2025 12:24:47 +0000
X-Gm-Features: AbW1kvarRJv1VyJjUo1t8ScK0brJ2o4-Qq6ABYK10edUo6rgOW2PAccCb4uQWlM
Message-ID: <CAPj87rNS7quwfqDmxyrW8_vQ6tnrcfWUn=81aTduDXtmdVkkAg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jan 2025 at 10:35, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > On the platforms I have been using (omap, tidss, xilinx, rcar) the du=
mb
> > > buffers are the only buffers you can get from the DRM driver. The dum=
b
> > > buffers have been used to allocate linear and multiplanar YUV buffers
> > > for a very long time on those platforms.
> > >
> > > I tried to look around, but I did not find any mentions that CREATE_D=
UMB
> > > should only be used for RGB buffers. Is anyone outside the core
> > > developers even aware of it?
> > >
> > > If we don't use dumb buffers there, where do we get the buffers? Mayb=
e
> > > from a v4l2 device or from a gpu device, but often you don't have tho=
se.
> > > DMA_HEAP is there, of course.
> >
> > Why can't there be a variant that takes a proper fourcc format instead =
of
> > an imprecise bpp value?
>
> Backwards compatibility. We can add an IOCTL for YUV / etc. But
> userspace must be able to continue allocating YUV buffers through
> CREATE_DUMB.

Right. If allocating YUYV dumb buffers works on AM68 today, then we
need to keep that working. But it doesn't mean we should go out of our
way to make CREATE_DUMB work for every YUV format on every device.

Currently, drivers are free to implement their own ioctls for anything
specific they have. But like Laurent said, standardising on heaps and
how to communicate requirements to userspace wrt heap selection / size
/ alignment / etc is imo a better path forward for something generic.

Cheers,
Daniel

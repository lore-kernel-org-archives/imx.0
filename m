Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E57223A9AC
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739481644; cv=none; b=QNHN5ua8nRdMtFwQm5sgo6F1Ha/0rf7wYsd4P3hE8W4N0iIBzQdjJEB0GXiQO+YA5WxMazVPu1aGDtn95TIY1Y41jhpAI3I3CEzWd8Hu4eR8gOs4bDmmP1+4tjW7JFDw4c4myUzBLzKGv22IUNt/hB8HFbUhiCOqwHDzpbj1jN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739481644; c=relaxed/simple;
	bh=R6yZihHam0h6IlcVsO97cIFK7OeOruhXhxzpvShzhP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fL/ftEtEMrh/OUgTvrtPzMmPkhT/j1U2+tzlzRLpnV/YXp486OiS+3mT+abUwnULxBakJgVAD6RIK53eqPZxJbR/avei92jZ3NhByovyD/KJ/DtVXIxRsD5UxTMJYx+B4q5p9C3po4CGJlCGm0T/u+y/sQ29fwz7m4vSgEGpA9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZ5zokHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZ5zokHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB184C4CEE5
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739481642;
	bh=R6yZihHam0h6IlcVsO97cIFK7OeOruhXhxzpvShzhP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GZ5zokHfQSpwvV1L2JWEfg6mn3mG7aVeEyJKnZXVYeL4C5JDTx5exVfT6HY4tQol0
	 ueFr0fEnuOzYaF3RAs3V7t19CUjQDMxPmMWRvh+wyDKA3V6FHQymN9oy43oUP/WFS/
	 W/L/89lX54kbG5P9mM0P1J0ajNGFW1YD2J2dq9dIhByW1nu4+JGey7+ov1HOWjALX7
	 R5ytmqjVRMQNXTQxLoI6ugJSb2YAExPDsXAT/AfCI2kKb6X6RC/pFUV0J98UF23PXS
	 VyuMWnSmaTJpcVqniacPMlIMo+z/yVaZtRDJ1ud8uNRhYTCJ0AU/MnJ14ZO2KiTZhD
	 gGINg7RkgaSdw==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2a88c7fabdeso810461fac.1
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 13:20:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7+g1F5Qpd8g/R9R7Ihhpv49zHFzbwMTqNBBhJDYtBdr8IHSHz5rvexniXq65s2GJPnk0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWX7vBw0l8vrnS8+t0CiRN5Y5W4HPnaOLt9VoXk2uYMhNpl1oo
	sZPgap91/8cWLjP3EjK6kzhyw8ajtJfqzX3kP6FOIxD7XRaofGFvUL5HJnA4qNkbgjR4aq1a+i1
	VKx0grldpJilf78pCCQmLvHoKHRk=
X-Google-Smtp-Source: AGHT+IHhtwiyO7pSSPqsWR2kHRk24EchxhEUH5QxXM6/nqWNb/nvAeT4uYZe2n/jCmUVmvNLC3LUXeHdxJuvNMhzhDE=
X-Received: by 2002:a05:6871:7506:b0:2b7:ecaf:59d4 with SMTP id
 586e51a60fabf-2b8d6831231mr5507942fac.38.1739481642049; Thu, 13 Feb 2025
 13:20:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211034423.833783-1-xu.yang_2@nxp.com> <CAJZ5v0idzf1QKf8UKp4ttepLbipZD6b1RFHX7QqgQCyJZL8dQg@mail.gmail.com>
 <20250213105306.vz2xirvffqaycz7z@hippo>
In-Reply-To: <20250213105306.vz2xirvffqaycz7z@hippo>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 13 Feb 2025 22:20:30 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jEd1hdssAeLXUMqAuqFsc1Pcebm3eEUP0wrx39xG2TwA@mail.gmail.com>
X-Gm-Features: AWEUYZn7R16V2pRKXfHP1W9UJH86Y8NuXzfIZN6YIUVp_0ne92KdxV50IZQCwYo
Message-ID: <CAJZ5v0jEd1hdssAeLXUMqAuqFsc1Pcebm3eEUP0wrx39xG2TwA@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: core: Set is_prepared to false before checking direct_complete
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, len.brown@intel.com, pavel@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, stern@rowland.harvard.edu, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:56=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> On Wed, Feb 12, 2025 at 09:55:00PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Feb 11, 2025 at 4:43=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wro=
te:
> > >
> > > Currently, if power.no_callbacks is true for a device, device_prepare=
()
> > > will also set power.direct_complete to true. When device_resume() che=
ck
> > > power.direct_complete, setting power.is_prepared will be skipped if i=
t
> > > can directly complete. This will cause a warning when add new devices
> > > during resume() stage.
> > >
> > > Although power.is_prepared should be cleared in complete() state, com=
mit
> > > (f76b168b6f11 PM: Rename dev_pm_info.in_suspend to is_prepared) allow
> > > clear it in earlier resume() stage. However, we need set is_prepared =
to
> > > false before checking direct_complete after including direct complete
> > > support.
> > >
> > > Take USB as example:
> > > The usb_interface is such a device which setting power.no_callbacks t=
o
> > > true. Then if the user call usb_set_interface() during resume() stage=
,
> > > the kernel will print below warning since the system will create and
> > > add ep devices.
> > >
> > > [  186.461414] usb 1-1: reset high-speed USB device number 3 using ci=
_hdrc
> > > [  187.102681]  ep_81: PM: parent 1-1:1.1 should not be sleeping
> > > [  187.105010] PM: resume devices took 0.936 seconds
> > >
> > > Fixes: aae4518b3124 ("PM / sleep: Mechanism to avoid resuming runtime=
-suspended devices unnecessarily")
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/base/power/main.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > > index 40e1d8d8a589..69d0f9ca7051 100644
> > > --- a/drivers/base/power/main.c
> > > +++ b/drivers/base/power/main.c
> > > @@ -929,6 +929,12 @@ static void device_resume(struct device *dev, pm=
_message_t state, bool async)
> > >         if (dev->power.syscore)
> > >                 goto Complete;
> > >
> > > +       /*
> > > +        * This is a fib.  But we'll allow new children to be added b=
elow
> > > +        * a resumed device, even if the device hasn't been completed=
 yet.
> > > +        */
> > > +       dev->power.is_prepared =3D false;
> >
> > Well, not really.
> >
> > This is to allow new children to be added from a resume callback, but
> > direct_complete devices are still in suspend at this point.  You can't
> > make this change for all of them.
> >
> > You can clear power.is_prepared for devices with power.no_pm_callbacks
> > set before the dev->power.syscore check, though.
>
> Okay. Thanks for your suggestion.

Actually, this is more complicated than I initially thought, sorry about th=
at.

While it is true that is_prepared may be set early for devices without
PM callbacks, in principle they still need to wait for their parents
and suppliers to get ready before this happens because the new
children may depend on the functionality provided by those devices.

However, IIRC in the USB case the new children are added by the parent
of the device in question during the execution of its resume callback,
so is_prepared needs to be set before that callback runs which is not
guaranteed to happen so long as it is done in device_resume().  It
looks like that would need to be done in device_resume_early(), which
then would be questionable because of the above.

I need to think about this some more.

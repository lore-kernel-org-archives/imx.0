Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7734EF08
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771844655; cv=pass; b=BPSWO5MgQ7ndSa2Ky0G5UFkof+QvNk/o0Dl9rim5kzutd6oSzjIo1t/Z81aLbYEI+E4OZg0NPt/mAY3riZvZctlK26y7CmmmTqVHPzGccQgOzqTmAKP07K/A0Nzdoqm60tynzyN+yZEvEDyLF9DDq4TBLfW/Tx1JXckFO6GRBo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771844655; c=relaxed/simple;
	bh=eHhGlHIE8dk1noerspRaa17UDGSM1U9oKZlnCB8Kea0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nO+6F9ItK+H7oVVoY4j7YNgLSdSeIk1nnYbU2/stnU6MTMb5sMd74Gp+3eyKgAqxYZDWGEt5H8y2Syj+0FUb+ntXgv9ptsteFvCoWLv7TNQ27uk6TGKHg71uPQrJJoVpp1s5NU/g3hUNL4T+0FV+y9zvtJK1TpIued2qUNOF2ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4gFiM+u; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4gFiM+u"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso4108964e87.2
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 03:04:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771844652; cv=none;
        d=google.com; s=arc-20240605;
        b=CwuSmaYE2w3vaFqW+5oKG8GnnhhvrV4F+7Ao9AzYdZMZ0nqpBRtjnkCIEeEmuSnaPJ
         GNqgcj8CcYJJ/dwiypw8wttORyBQBYUbcf9AlkeY8uYW7k/+g2WehED4+eMGymbarLmX
         ckeOUvYTRLvjyf6Q1sIDIRfp/OV356wokQkBLvfFjPvxMURJQOjxwMANBpX3pm4x2VDI
         AwY9so1XfQoB5ohfSLFr6zGdwy7yNjeqgrl3q8A4adoNtVNI0OPEjs8RDeAA8n528uAJ
         8tq+6xfHjxl+XvLatDajwL0pLGwd+QqpqSYu+kl8fbTmwVE/v0AfHqk6QCH48sp/Y4h1
         9grA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHhGlHIE8dk1noerspRaa17UDGSM1U9oKZlnCB8Kea0=;
        fh=YDxz0MJXaRUSq3Xz/KgcLnoWXAoC4utOeF1+3nWopoY=;
        b=KVW8issalthJSbF+8ysx+yfx2mKkjBAQUSaLtDyAScoHshL7J/n9+UIklGsvuLuyhO
         fu35Dqws4+MaVQsL3A3nObzoqzhnySl3ADWmbWVIhskd6ul0pvaeDA79jla37+GDIGZg
         17f2UQlTR+J2lreYWbPQkpxEFd/AqujNpyy/3J2rF9qX93lloYbsZgL1NCwiUu5QPqvY
         42o+xj5TOynixPqQ16qv56y9BNL/+yY8vGbQXemgxRfP2u6gBUtCqH4kx6mifuQvTI3v
         gkbE6rdiiVFoHzjWfbCpQphNjnDRHf5HgtH5/MuSIG5xsnjSkTf75uZHhZb3gh2DHBtf
         jfrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771844652; x=1772449452; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHhGlHIE8dk1noerspRaa17UDGSM1U9oKZlnCB8Kea0=;
        b=R4gFiM+u5ELxL3pENMq6WDeWle4855bUeyoqPTIPFrk8np94qg151gwZBqjWHv8AvE
         AXf6JKpDU7sP/EXh73iMz7TGqwbycAdYKo9oPu1+/BWt0bwEfiS1WYDS+G73vDDgkeXD
         avjojTHB9xwYf9wlnbinzNGdhNd33N50lqBdFJCdO+Ybtx4aaLPWs+9zjJtg6IxXw1BU
         VBAxUq95cvn67Mibv4b95u2Rxj3h6o4dqkZwt8fWR5JaWlWmqSTnUkkqC/E8klU2WDqq
         /wo8CfwOT5596l6Kyy3LalOW/BmtEnicXbLfMJxYPhTvue4EShmE7AH54Rtpl0JUgIhT
         uJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844652; x=1772449452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHhGlHIE8dk1noerspRaa17UDGSM1U9oKZlnCB8Kea0=;
        b=hePV96K7BbuEqKuviT8TyGGpKZUMPwMe0vyHD+ototKbs48kL4lx/umXYX5zj/uyaD
         Xq3PWJkgymF0OFE1jvhPLItQ9S6dVf+bqFZD/xBkhWdoH1HsFt4XSHu0dPUXXiTEP+So
         wMjKWSEw0XNShFZxQikd3RP1gnaqOV9J6ld8UP36XrotwKmfiTU4BhdJrJED19oNJ6tT
         ns56e4evRQ2UwnFxHl0iwDEZzGYnVeP5YrW8xyOboZHvd/O0RxIMdbSrfcN4GeJcXu+e
         kgU8FlbvkX9GsjWLu4SkW54OwH/QoBv4FbsiRpf6JqG0vUG00wf3gGDn3mne54cGqOpx
         O87g==
X-Forwarded-Encrypted: i=1; AJvYcCUY6wlWiLWy16A2ias/BGHD6yApRNPB6r9tIZ0NDZmQzL0vuPWKSrR9kJuIhj7TIzRCMeo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1rq9NMyn6FtnI4ZucRNLm13/1EZ6Ecf/PAHNVOOc/SnRdDTMu
	OrwVmadEleBsapP09Imq0DOK+eWX+RU++3LHOcovEqXvb+3/so/ZIKhBuBvE603r3ulWEDMIxMe
	iw4SKsVs+KT364OJjQJmo3yE3dYp0WKxORPZm0KXWng==
X-Gm-Gg: AZuq6aLwR0CcdMIW11pS3ehDOSWPki2H5t5ILlLPnWva5zOCoRh5U6Ua09zfAbweCPp
	2ZH/l9qpAA0t7FWR5h3/Bp03m8Q+RHjPOwbhQ0xeq9ZXTYyoQ/6Dv3KNvRZZ9O2bygbqlR6OTOr
	bc8uo3mIiSKA3MfNh/tmJqCJFelHb1SYwW2zHepDkx7Mu2gsNWaPd0R9QFHnF/2nvc7LAMSdeLJ
	2PGEB+KWKexruVP0Iqh/fECcW6AohMAQ0hBw5qmHP7InTz4CdjBJjDbVcFNRVnwzZJDRRDfQKpw
	eT53vWPL
X-Received: by 2002:a05:6512:b91:b0:59e:644a:a857 with SMTP id
 2adb3069b0e04-5a0ed87eafcmr2670972e87.19.1771844652052; Mon, 23 Feb 2026
 03:04:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki> <15658107.tv2OnDr8pf@rafael.j.wysocki>
 <CAPDyKFrgXG5X-y0teE-wVvqaeNepStMN3=0M4zkZs8Kb88U22A@mail.gmail.com>
 <CAJZ5v0iszxD9WV2Nfy9=usmP84Lf0aE9nCxKTBP-B2=zxqnoYw@mail.gmail.com>
 <CAPDyKFqP1pgyv3F+krKsViE96oyYF-O=Q7+bresDf5Okjeh6RA@mail.gmail.com> <CAJZ5v0gOAdST7KsTqR6EEK_AQZMf3Ls5mt-Xys2tHbmRoaLAZg@mail.gmail.com>
In-Reply-To: <CAJZ5v0gOAdST7KsTqR6EEK_AQZMf3Ls5mt-Xys2tHbmRoaLAZg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Feb 2026 12:03:36 +0100
X-Gm-Features: AaiRm52R8LE_YX0oCaW_kTHlvd9-w1M2jGyQBTYrFVjg6DoIy_zAZaLZv4IWOKc
Message-ID: <CAPDyKFr6YdQ4nHD8RcGQpTdqKH7CszEd23YzF-o-TUVETBaG6w@mail.gmail.com>
Subject: Re: [PATCH v1 19/23] pmdomain: imx: gpcv2: Discard pm_runtime_put()
 return value
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Feb 2026 at 17:58, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Fri, Feb 20, 2026 at 5:06=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Thu, 19 Feb 2026 at 15:07, Rafael J. Wysocki <rafael@kernel.org> wro=
te:
> > >
> > > Hi Ulf,
> > >
> > > On Sun, Dec 28, 2025 at 4:52=E2=80=AFPM Ulf Hansson <ulf.hansson@lina=
ro.org> wrote:
> > > >
> > > > On Mon, 22 Dec 2025 at 21:37, Rafael J. Wysocki <rafael@kernel.org>=
 wrote:
> > > > >
> > > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > >
> > > > > Passing pm_runtime_put() return value to the callers is not parti=
cularly
> > > > > useful.
> > > > >
> > > > > Returning an error code from pm_runtime_put() merely means that i=
t has
> > > > > not queued up a work item to check whether or not the device can =
be
> > > > > suspended and there are many perfectly valid situations in which =
that
> > > > > can happen, like after writing "on" to the devices' runtime PM "c=
ontrol"
> > > > > attribute in sysfs for one example.
> > > > >
> > > > > Accordingly, update imx_pgc_domain_suspend() to simply discard th=
e
> > > > > return value of pm_runtime_put() and always return success to the
> > > > > caller.
> > > > >
> > > > > This will facilitate a planned change of the pm_runtime_put() ret=
urn
> > > > > type to void in the future.
> > > > >
> > > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > Applied for next, thanks!
> > >
> > > Since you applied this one, I'm assuming no objections, so I'm going
> > > to queue it up separately along with the patch changing
> > > pm_runtime_put() to void because I would prefer to make that change i=
n
> > > 7.0 to dragging it for another cycle.
> > >
> > > An ACK would be helpful though, I think.
> >
> > I was still hoping that Linus was considering to pull my pull-request
> > for pmdomain, but it seems like that may happen. Assuming that doesn't
> > change, I can re-base my next branch on Monday to drop $subject patch,
> > but please wait until my confirmation so we don't end up having two
> > commits in linux-next for the same change.
>
> Sure, no problem.

I have updated my next branch and dropped the $subject patch from it.
Please add my ack when applying.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

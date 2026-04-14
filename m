Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3337536DA1F
	for <imx@lists.linux.dev>; Tue, 14 Apr 2026 06:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148518; cv=pass; b=HQ3gxEyFjx6JuTeZKAjzM5V4fLlCS293CGJdkdPK3ueSEK9RAxg6RxXUq7d7hbS/KJYBXQAI8UBLwtTwtioDRU6Td4A5Pp2P7X4o/HS3ufjlynqbzYtcCURa6F7nxqrWbhjEfj1j5KTTB0eR6UdmpfD/XCO3iV8rw7Oaf30aW68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148518; c=relaxed/simple;
	bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sr68eq6mNcZo0GwZ4z1EVopSPwLBUnzB9ta4g9QyFleYrAAE3OXSBcotQBXNanWzUmlAMyw+MXwqxHA2bXBfsNgZegsZhohaS9Rr2/aFxv1XLq+WEHBH/v3Q6Js7iYvxb15FKk7xZiCyixH74WOi4E2kIqzSFngGzMdOOn+7UhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mechasystems.com; spf=fail smtp.mailfrom=mechasystems.com; dkim=pass (2048-bit key) header.d=mechasystems-com.20251104.gappssmtp.com header.i=@mechasystems-com.20251104.gappssmtp.com header.b=VCTwlvH5; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mechasystems-com.20251104.gappssmtp.com header.i=@mechasystems-com.20251104.gappssmtp.com header.b="VCTwlvH5"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso15251001fa.3
        for <imx@lists.linux.dev>; Mon, 13 Apr 2026 23:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776148515; cv=none;
        d=google.com; s=arc-20240605;
        b=J+6AH8JVDNcKYbVXQbeuMVrkizqc1ViqK+9ktA22GLc7+vzefWm448MyaXUYfRTYvm
         cCVbGjWukhIT+h53XO2kdqZFsFgnrCp1dt05Sy2pC1eYtcDtFl3FsmAa0HGhqlXsb6wc
         vaD0/vP/5Ifa4voe0oqyZSQB9/FYCEWHj3Rx2vYHI331u5xlY2s+yLMCsOv5uZ+KGPIF
         loQz78MeroKoOZ7GXFsv+5/57mKNYPUQSYDQE47eSE8G3zXRAR5BpDoYKIjUgTg1+Ps8
         DQJB83hHRdgPiw4cZVd/hS1twC9pgKw3Vvw5BOJvdYrVV0bLyHzs18mNiCJ9bH+Qe/sY
         e5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
        fh=0qt2DmdDrDAnsGqcogtnQ+fUpH5OtzQrErSTa959e2A=;
        b=OkshzlOPm94RnE0Cs/lHB//yw+rrl+Ca7gfIGYtLxoKnORmxWby016WXKJ7bKrx8DV
         c0zE3U3gnm2rt3bvyRwEXA8PZtXEss3OOTPVUbwvjHXF7dm/aU2bwCRnUxetNAiYQdZB
         tbPeoL+mOpplPtnFn2Hs+lLW38ArxR97gUoPGeST/eJEfCnsxYSiDTKk+Ctxz5RZ7/Zv
         Pw/iHHbwMaAijcKQL46l016Yi1NKprLudhZ++7+lnwOFjK0Xa5YC2WtLqJ3Fe0j+/as/
         VcseNEQiIt54iuB18OAE2FZiVm/MhmgMl7sM5dY8h0dEaWOV6y7PbUuwvMqniF3un5S9
         GO9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems-com.20251104.gappssmtp.com; s=20251104; t=1776148515; x=1776753315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
        b=VCTwlvH57rnoo5v5zhJ4ASodQOMR6YUozdgaljVprcQvW6hvvUfYKbVnuk+K75FwdN
         uoExwiMA0AIbozoX/yqADQvbYdlcgPdCrPD1cv+BUALLXvTibVh6WAf0hh2xwLDrXERZ
         SkOG2BY7xg3bGY3eWSCw7f/0FE4X2AWj5r25Eimg2aPiRO8rCQtJf3Im+18G6jn9cC95
         3iT2q5HsC0bn7dQr5Pgkwdv0kzQCwyKxIXHlKqUluFzvK05/UdOcr4nlr1Ubgae2qQkl
         aywMDB1TjFv47XO3HfYpzgyOpuZ0uG8ekpSaEaLUaIlSvqsFYeUs+4KQMZ8vsKXUIxvZ
         6hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148515; x=1776753315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
        b=op60OeOBko61/08ysFusDD6dehUKFifWftr62hMkqBZy3+YEG8N+X3kTNlHb1jlJyR
         /X3STiDlhuOig9ydPwH1tXIrIHfyIH2j1l44rPhozgyKuoG7iYMpejEDpPENLP2yPdnJ
         0iueeHlf1WI/Uub9MsRsRygk27Uc69bqJHvgmH/0ehPAzzITjEdb7j9amCl1TJWCdKZ0
         w6vu3jq+/3iO6tIC7iJdmFGArNTYnbnOHqhCGc+QfrVHVU6wsNPpy8vZe8lyFg05ZwfR
         vvrGkxNyfNLIGAjnzFubGloZxAYWMhctp3BJo2Dst5jdftXMi+Kc4EFcvScDLC7OVbEg
         N0gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NAHM5xsVybBM7hPj59htONSeKOAOoM4oaj2Z+g/smBTS51l4MN3y4VcuJ47jiXNrB/LI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyHNc7fPXn44OJfGDAytab2Eg22a1XRrLHLLaB/3SsYvhOpoje
	jqePc4rxDhwkWoOcLoHrB/CGZqOP4SLCx1GnCCO1CnZOO92ojwf9ZMs0wo/95UAcdkhTcO68gbj
	sXbuLOFlekEuqCJ8+oalyf0uIj8l8nXqT/x9vNwfwWQ==
X-Gm-Gg: AeBDiet9F5ednV2h3qd3HI4sClzHDrnYs6IaTvR87HEunUKEN5gjQGAhq0tEE1YS4iF
	nY/yn6QKt9YUX4lAI6z5tP3c7Toqo4UnPqXBrYxdiY+LW3lxFVFCWsCxiI+N5tHg+ZQDK2+Vx7x
	qZ6tkSPVburcDdttO72MgI5c8pUuWWYFcrn8LlmAS95DBaexvpkXEVwCdmIEVnogSvNRD0XKN+I
	mcYX7uH6voa+j5Dj4vgRYnepApbbqpqPx7ceC8IyFOKoCsfRUQ6JNZl/ok7FOfPYzOaueAf5cb0
	TGr4X+Hl1zJyX07GUyXSwxYp0SxIlkRRO2cGWmgk
X-Received: by 2002:a2e:8a88:0:b0:38e:7b10:fdca with SMTP id
 38308e7fff4ca-38e7b11028amr23413361fa.18.1776148515199; Mon, 13 Apr 2026
 23:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413114456.173485-1-advaitd@mechasystems.com> <99fdddde59e1b0fe13d5014182b1c97de4fbec86.camel@pengutronix.de>
In-Reply-To: <99fdddde59e1b0fe13d5014182b1c97de4fbec86.camel@pengutronix.de>
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Tue, 14 Apr 2026 12:05:02 +0530
X-Gm-Features: AQROBzASMMowUHpiQY8V3AZzIF8UFIDuQygsDzeqZIIv6U3TInzAp3bBuMtO9xM
Message-ID: <CAAPs2HRQ12Y18y1JGRE+8htegjUiKN9S5JP14rkAye=pdoxt-A@mail.gmail.com>
Subject: Re: [PATCH] drm: mxsfb: lcdif: enforce 64-byte pitch alignment for scanout
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: marex@denx.de, simona@ffwll.ch, imx@lists.linux.dev, festevam@gmail.com, 
	kernel@pengutronix.de, dri-devel@lists.freedesktop.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, 
	linux-kernel@vger.kernel.org, mripard@kernel.org, stefan@agner.ch, 
	tzimmermann@suse.de, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

> I wonder if setting 4320 bytes stride works if you reduce the burst
> size, for example by reverting commit 2215cb3be5c2 ("drm: lcdif: change
> burst size to 256B") to test.

Unfortunately, reverting the commit doesn't seem to fix the issue.
I tested with the reduced/default burst size as well as explicitly
setting it to 128 bytes, but a pitch of 4320 bytes still results in a
corrupted output(stretched and choppy display).

However, using a 64 byte aligned pitch works in all cases without having
to alter the burst size.

Best regards,
Advait

On Mon, Apr 13, 2026 at 7:16=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Hi,
>
> On Mo, 2026-04-13 at 17:14 +0530, Advait Dhamorikar wrote:
> > The LCDIF controller expects framebuffer pitch to be aligned to a
> > 64 byte boundary for reliable scanout.
> >
> > While byte-granular pitches are
> > supported by the interface, the i.MX8MP reference manual
> > recommends 64-byte alignment for optimal operation.
> >
> > Corrupted output was observed with XR24 framebuffers where a pitch of
> > 4320 bytes caused visible corruption and choppy display, while an align=
ed
> > pitch of 4352 bytes worked correctly.
>
> This happens to be divisible by 256, which is is the burst size
> currently set in the undocumented CTRLDESCL0_3 register fields,
> according to the comment in lcdif_set_mode().
>
> I wonder if setting 4320 bytes stride works if you reduce the burst
> size, for example by reverting commit 2215cb3be5c2 ("drm: lcdif: change
> burst size to 256B") to test.
>
> If that is the case, it might be better to allow unaligned pitches but
> configure the burst size depending on pitch alignment.
>
> regards
> Philipp

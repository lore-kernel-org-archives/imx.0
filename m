Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7F274B46
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240073; cv=pass; b=QGkeQLiVo9SY/L4hCfX1J4JpgaI1rm2eE4R5flYF4M9spUuio/DTSj1bdO3/uF7EFa+xBQcKARKEEl5Q49VCD8oUctg+ZFIXjzMgIXHYw3z0fyUQnqrrrF3qh3bID7oO2m1Wo4c0PdzTzQKb19IygJjIFjdokv4LfI+s2eTntd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240073; c=relaxed/simple;
	bh=vBGRoQcJXlxAMtSg/Ev+xruoEjdajUUrjRvI4ba6Pgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWD205Y5aCrimH/5v1Uk8V6WBEUZ/2DHT7fHzXDg7ExbFKiL4AvwzQwtRPqtQLbvDMeM8ZJVT2sjzqJV3XotN40ItPZECKvUbPIDe/AzWwUGWLEUVCAztzY6ntwa9j4JnIBkYN/Aw4s78p1Jv2OEoIE0+wlOhzLecAcfvFOQgb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASHC+msH; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASHC+msH"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-836c4474028so17697547b3.0
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240070; cv=none;
        d=google.com; s=arc-20260327;
        b=druKrOWQ0lTeJDDJNTAbGdGorDQBQfOD6Il8IktDWI3nArnYrUsKhRsgv8bbIf8W28
         YaR8A8gLpsMmWlY2J3Sj6hmPoOZq1Tpr5pfJs1TyFrjmrkbEqSjWIViUshpA19+mS3mp
         qjLrfZWrcuhwuZEef6Dsw6wzqfMmQGQUgSu44oRckwEQkjzs1tgdGE2wb3gvtZiYsKkd
         wlVnhpPIBQkaQdANe/30jageLMTFc5apsg1fT6v+iX4XSnr2uGfJWhA6LBd9L/gAL0qM
         7q+NC692aI4uSgG8Ltba6YNI8+BCsNFbKOirh4xhXTB4c+waXdXTOG27aq1beRh8FPvM
         DjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        fh=dN3uIZVa4D4g/svD5WdzotPR5uT/BWoggsqXOZtKFVE=;
        b=c7zIkqaaHsLXQfWDGMpUv9h1zSgmX6b8oiEDZu4wWEKMr0VsmrJ6NycQsbNm/8H5sS
         uz7kV8ZFvfsFrQywDaHq4ece2pFkdc12tjr0gts3h9H2ojK0b4rL0kNAfDyYtwrnJxvR
         BL55MaUbz35zJGihdAR9J2ATtmrlSL7j7W0R9mULKGar1ME2GXaTkdjXi2QISld0jTPb
         DMgU7RZ1ZKZbtYzjq5uffIgKy08CE5n7IzCQ6G0aFtQh0OgnHHUZeTke0dgnNKAso258
         ieAiOqvX6lYNgpbC8vurEicCPIgBK4maSDhGmmAH9w+XQoG5HhEwLmScEPuULpew+dh6
         yGGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240070; x=1789844870; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=ASHC+msHUV/u9n2oqeq7vTBwiEdo07a5oq++i8zAStkwAVP13omjf16RPiwLR5+SU+
         YWr+xBY0D6018zQaesHG11HKDB5HH7AahiMU0KWhRfIsgE3oT7PzgbKh9u7GId9JyhQf
         /9o+aI56vSmNwnTz0J52cHmRB7EPz8j2PH/jq8uxAUO3jqqA3IUuwm2zv9qESnvZnk6x
         /xPAAH6ZjHuo0WTO+ue7R54x/Vz9LO9YYLZxfHDj0MpIjBFIVhhO/61r0Bg6E2ORT599
         osyjWXg5IG5yrlyWBniGti7X/3Nwr4v7pcgcnw0w4lNT8wKDkWlPdS2aaf5tz5Ntzoau
         kMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240070; x=1789844870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=gMGZU6SOpjoRwqdyDLxnR54Itg6BanlFin6/gvmhB8pCbdW3DvGlosvAjwh59y1/m+
         l4fNL8iRFxm6y+EqNJhqgh0pzS/7TXofz1AceRDsWVzj6xEHvO3DNV2WIWeAYKuDysk6
         EWctVaEVJmOd6gepDRyucjQtIKhsTbnqcGWAxaOP5FspcYmcx6vdJBTQm+Fxc05Dq1Df
         797KOZruRoC0PIV2ZwUX+5VvjI1e7LVQ2prvvB/U1tYHMSih2/uQs25lSbLw4KTTkJpl
         8Y+EXLD4PbE5kr/AEhANMoqALApEc4OgFptCfmPT9OSn8PE5xmAu/K8gNIReaOnUd4/f
         hZmw==
X-Forwarded-Encrypted: i=1; AKwUvBwwSup4ttQoYpcXMM7sgjcRd8uOWb/eH91UrENvNASwkUL+0Q/LWIJyWDUbLXAnMaUHaWs=@lists.linux.dev
X-Gm-Message-State: AFuF++nqbrzye67+loh35NIlP95QB3sfPA2FqsUjMlklz3Y+LLLbT7CB
	9iWu5kdfK6Yfz10nwuTr3LIZcOVJ+2fvKOHyXBNE4Ygu3dy8B98vAjHqxgUg6ftpQt6Rq5Pn1sG
	nBOLF9eaIHBcRZ8RtgHeGfOG6tJCqK0A=
X-Gm-Gg: AYBFou0hKahCpU2AhMJlAQVGS7JgEoGKru+L9tUzwr3wezOtyqB/ckpdQh292IyuxPK
	xSyh3+5b3LqKJyzk0pCKLDtxjN8PuB6fzZ9ZGE236S6oL7HqgHTjOq9qumUTBwhnesBeuavxL9+
	OtqiPXb2JistwiT8g+PEjAT6S16mBfsWIVxWMR1jJVmpb3TCVk9V7gEgzU/fQZe0yigmsWLETpc
	57kSvWVkboQKaqdMd39rqSmTJApcGnovlG0M/JZajW0anLiS6zBwWPZMVmyMCY5a2MEYSVMC4+E
	VEfl0Tnj2xOZNuIguJZGjkUSKhSpa40e9ppJm9fpykxLblo8RjsQ
X-Received: by 2002:a05:690c:a790:b0:873:5bb2:6c0a with SMTP id
 00721157ae682-884b6f29b6bmr21177167b3.52.1789240070580; Sat, 12 Sep 2026
 12:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-5-sumeet4linux@gmail.com>
 <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
In-Reply-To: <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:37:38 +0530
X-Gm-Features: AcwNN1XqTP8GoNHaMkR4dokovXZ0UiUGTDkYaF2EyUFt2qLbm2siHwKKSL9BVhQ
Message-ID: <CAJ9orWStxJLN-0Dk2LqmyxEagC_nH-veS7wWrN_kXvb6WEUWiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >               ret =3D -EPROBE_DEFER;
> > -             dev_err(dev, "failed to add devfreq device: %ld\n",
> > -                     PTR_ERR(drv->devfreq));
> > +             dev_err(dev, "failed to add devfreq device: %pe\n",
> > +                     drv->devfreq);
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

Planning to post V2 for this original series to use %pe to print the
error pointers symbolically, reverting the change for dev_err under
*_porbe() function.

Thanks,
Sumeet.

>
> Best regards,
> Krzysztof

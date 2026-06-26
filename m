Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434737F007
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477537; cv=none; b=mRROfoxONP36XvXr6CS8MCNBOWEh4Hm2By2qonpn52Rgak+woTHLn60/WfI0pgJH25/2mUDgoRNcTVC561yAM9WssZF3xnP6HWZDFlIUMM33tMZSv+0hZyhHxP3NqO9UcQOK0dD/UGRcpx0UWh21ht/f+S7P2CTNyIeHnR2Wv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477537; c=relaxed/simple;
	bh=L8m+v9Mumd9PBrIoKCr6p8n/MbxpHP4z26Qvy7erVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFayeuJ1C/L1iO41+voO6RAPeQOGFRzH7sRe4NQxqVM3dAozZgSPuz0xvWwW/5QWtDHJNgYuqJuQ5oLUqo2BITDo1jN7Oazak9D93bTjahZ3WJn794YETknHyK8WvJNalFPJfOyexJbXRR+SqyZ935P2+4M/viG4LPKxlVy/9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4474073fa81so595338fac.3
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 05:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477535; x=1783082335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=;
        b=N/O3EBldavxOUY9sBMAuokNnS4AK9SP2dbuP1kv7KSsNwyWufA3St67RseXh1h6mQs
         MGfvCn+BBDkdkez5akvXfdpwOsy2l8EyK1br+gFtP/eX4Y4Fy9gyYfdaFKl/gdLEvnzr
         vSnomp3rkICcJvrdXZF8Dq8iyvnEtMM9hrmz8eqRk7fZBUqRXhTkfNLMlrDWEJoDnaAt
         3nVTuy5/mBBlkPx41SlHJdTKrFfqVheAJonE3UbaRpubxVchvYHaa1HrQCnhlEh2Q5vg
         p9zMLjnkLAg4JofFCqZ0Z8g5dHljgauqESrUTHbKnYibIGaxZfYX+SgfgcUV+7govQvW
         eTOw==
X-Forwarded-Encrypted: i=1; AHgh+RrGnyPqaN0QrBXVO9yTAjiADnQVhTFxVfI4VOq64fHFAxbug7XZZ8Md/R3B2rgsCWkpvgY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0v8svC2COWHMUJ9Pk4FqTTY2joH9gAdx3cqY0sB90gtchix1i
	DgDY4PZhxhFbyAZBYjODuLK66yIUJFLGrSGnqpEfz/48XJa+KmUzHmXmic7LeHXh
X-Gm-Gg: AfdE7cm/0GnuAAFLfYh7ozo4hmM+WABopMbGNWAOprcknu0FFKdGYDoC2GSHdslYRN3
	rITvd7DGIGrQej9cXpK88CwF1RsMvfZu86LZZQlpalGK8vSq7RpkYDgROS72SEwZac6bct+nNHf
	Nbc9Upi02byXwmHvaRpT7dXxI982X/oOtK5tz4Ib0SgErSRaH3Pv/s8p1gPW1EqdzL5cyYYP8as
	aGUSdLklfOiX05XFAmoaMh3GV9wWzDXP/gIcFvYjozhTdIq7o1he53RHzoldoGk/CikVnVokvee
	kqFM3n9dpRfri5Q0TXxSeqCvqzRNSAa2W2t9BWr1HSy25iVn7ygVMaJVM/0/A7zvf8uCDR+hFN1
	mxAvkqXy0fGq26xbEAgItuBaxjKDMK6AKKhwIVq1DgXXvwTa+EGPhUdtqXPzgFHyYfsws1Dvvr0
	8PR6SPNZ2CdiFEoxxGGe9QIFiYaq9Jy8ACSfIsOuXvcapiRs+Ffw==
X-Received: by 2002:a05:6870:4791:b0:43b:bb18:affd with SMTP id 586e51a60fabf-4481184cab9mr5353950fac.8.1782477535459;
        Fri, 26 Jun 2026 05:38:55 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448488af3afsm335852fac.4.2026.06.26.05.38.55
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:38:55 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69ed219d3ecso868515eaf.2
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 05:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+sNmnPhKdSq8a7yOcfFUqumUJYa9SDZIq5e871AkSC66/1BiyFY/PIWFk3432rR1C1UeI=@lists.linux.dev
X-Received: by 2002:a05:6102:5491:b0:631:4580:6a46 with SMTP id
 ada2fe7eead31-73435b90f5fmr3476500137.17.1782477036873; Fri, 26 Jun 2026
 05:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 14:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
X-Gm-Features: AVVi8Cc1rFvCNNORSHDtFmL_tkYQ91oxJ5vGSfmmYwanPmDM2yIyJwQSJ-fX378
Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 14:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the renesas device trees to use the new
> definitions.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

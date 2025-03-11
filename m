Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602C022FF42
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683492; cv=none; b=tJiUkGKM+5p7oFRnvQjeLof49P0yR99dZ8QavAWG/yPoKe7pbXiBQ979CRVKoh6W+iWsbXaSha6i3fwc6F/hCJs0NIGFCEGoRAZVVy7kHwgdbMWgfl9gpaC1Y0W3yH3z3tUclnn/toK14aJjo2MeCQIqbn2bh+lz2WfZk92mmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683492; c=relaxed/simple;
	bh=OoJriUqFnHkd+c0rjQnFxlTZBZ6vjf/CcBs/t4RG/qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SORXNt9yy1fAM7Y1D47ipPLTCy6gzoPhCVhbs07ml3NgAsR7h5rqxqPLeQ/OLMRdUH6qean2KPCOvOLlpYIA0QzNAORxlFmMjJhrMWFD56j6l0FxXCDVM4hyDU/awSr+nYiWxDIkPfy4UXrighCMwoNFIUqUqfF+oo+98Xk/AcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAr4Qjg9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAr4Qjg9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2234e4b079cso92592685ad.1
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741683490; x=1742288290; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=;
        b=MAr4Qjg9mXOzg1V/NgVvc6HuO813MVLwMeoYWLxxm5I2FVjQywKeaK5yTj/YY0RGgP
         P1qWnZbDyMDIzHPF88k6QkBzSDzoWN6TnKYuo5TSpIHpIf8YiCQc12wRv8SahFxnK8C9
         RTgKwcovweF87ca4tAE62betBLd/S/W07teZ6KRILQIjVqDG0cpRh//B7dJU67/7cLEk
         ax3cObRNd5pc6XhnZxnwv6d3aJu4hmx+wRf9dzIuEcf3nc1I0+vQ2jyUPJ9txRNQrALh
         jcGaFQLGXhoIoW532sborMKRdpi2aQMotmGR0TrHRKK/p3ziMlFQmfO5jEmGChMJsNrX
         VNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741683490; x=1742288290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=;
        b=EzNPa56TpmdFK488bYNTFKI6NKBBFasaRjb17cEMwgFryKQl6ylsKC7p0YXME7rwng
         BdmAv5X+yI4ltpCw+TTVIv+q7Mo4u3XgaL7Rp4tXPhv7jPBKM1U0TXNWSMWdhwNYXeBx
         ZU0No86cyZFqgImS7RiUwGAc3iv9limXHWjPgumtapEOWG3NCBzHHtF4PnJ5gdTjHk2m
         yse5ZX7UAJrbtZkU1gPHgVYN/O09U2T70i1LB56vWiuuHb05fSILI3EnrrYc2Oxghi1I
         daBIMx9l1W4wLu2p0KS7tU4YVQk/MaM4SoYKqbGYDWcoPsvC1GbwQKtsmbt1+YBbfNtW
         R6RA==
X-Forwarded-Encrypted: i=1; AJvYcCWBcPZPYRvHokTdD3wUx4lPUhWT6SBVsxpZrYOnU5s+AXBFQn/wIxpQulaQx489onoacao=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0/vNkP9NqDageci/KUVsbl9+KildU4zZgiimId5MH1FKtQX6X
	7/IBL8PX9xdTJgy+Z6ZyFXJFBb2vlilw36EUBzzoWHW/PPT0xwRpyx4coXxISrthujtIhynzVLs
	a8c12qmxtOwe1WKJphP0K5W/hzS4=
X-Gm-Gg: ASbGncuVq48wTHAmggYjRwJ2eyB+NvNhBKId63HY3pyEycIuuSQWOrOPMHHbRsfULen
	OhP5hAfenqG8Jag16Xskej0H0KjaRczLC0EHh6gLiGlMhqSQaelwlqc1B94uvBNk+x8149f74pb
	EeyBD0pPx6vjPSOM6wPraObNo=
X-Google-Smtp-Source: AGHT+IHRbLEfFkSRN7svD/SU2NARgmIEUPnyFQQfIvjDTjaMuTGcz4qJxDZa2+cv/4IHsddy318d5FT1qriGzMT0Ex0=
X-Received: by 2002:a17:902:ec84:b0:220:ca08:8986 with SMTP id
 d9443c01a7336-22428a98135mr255205425ad.22.1741683490491; Tue, 11 Mar 2025
 01:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-9-daniel.baluta@nxp.com> <Z88Ib7HkbRQoiyZp@p14s>
In-Reply-To: <Z88Ib7HkbRQoiyZp@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Mar 2025 10:59:46 +0200
X-Gm-Features: AQ5f1Jqksp8_Ow3W7CPPxQeuga9K9-0CI_LlAxXmLAD4nYxorLD8ECBrBf3t_78
Message-ID: <CAEnQRZDeBkNYBNQwJL5LZgLK49siqomzyM_RDccdusJa22yiJA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 5:43=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Mar 05, 2025 at 12:00:36PM +0200, Daniel Baluta wrote:
> > DSP on i.MX8MP doesn't have a direct reset line so according to hardwar=
e
> > design team in order to handle assert/deassert/reset functionality we
> > need to use a combination of control bits from two modules. Audio block
> > control module for Run/Stall control of the DSP and DAP module in order
> > to do software reset.
> >
> > Initial design accessed RunStall bits from audio block control using th=
e
> > syscon interface but this got NACKed by community because of abusing th=
e
> > syscon interface [1].
> >
> > So instead we use the reset controller API.
>
> I am good with this patchset.  The only thing I'd like so see modified is=
 the
> above changelog.  The second paragraph doesn't belong there, i.e it is no=
t
> useful to remark on a design that was not accepted.  Instead please conce=
ntrate
> on _why_ we are moving from the current design to using the reset control=
ler
> API.
>
> This can go in the 6.15 merge window if you send me a V5 fast enough.

Thanks for review. Reworded the commit message and send V5.

Thanks,
Daniel.

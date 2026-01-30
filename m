Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62404353EFA
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761499; cv=pass; b=pG3hM3LV0CCpKYfmpSt4ludOe3UGeaDTcvy0Xqyd60rp0LMz/W0o4vlF3d/MY9XOuSvRy7E8BetXTGiXPbCNsGWTEv4PJKqGjtTpW1UUPN4lQ9fZOE/o/dP9Bx7wkdSpi9P6Q39eOv3VKBpyuODfjjIjkfQG51o0VXCb1e/v0Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761499; c=relaxed/simple;
	bh=ZC+fuQk21hYzdagNdpY7ch+QY0LHmxNvBoMUa+2kaN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO2xm4wLnoNHt6wIlKAFfwb1Fn3nDc+kK7jYPAXZiWXPVBqTY3eY1zIFog1A8gJKvh/JWzr5KrlF2MhD3+nA3u4h1ojWL6WaFvXZhaf0raWVM5vVrh7AJbjyMkWfvZQDoyUymoW4WBLWZy/FNE7HByz4Aq3ymmdFZzFUiOhADNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXEhLOQr; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXEhLOQr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so1612293a91.1
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 00:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769761496; cv=none;
        d=google.com; s=arc-20240605;
        b=KY9CBEjdjUSZYUFVl82QhFPDFGQn2XMicH9nn+F2telTqgIEiPGxPdw1tnbUWcP2Cd
         KwstylaQ0pi1hR1ffbvqRuPNIqR63siHBfjpp7OzDfG9MKOd0Zybjcjkldw9VnvsL6gC
         Fc+kEvedmaR/xwG+Tl+b1TUNN+hsE0Po6RcfOxEg8qN5S3jWE0EtXnTwxupz6PFghlw3
         MObRXMVzETUdfM5EmiUJeIE0sxRIpELaUBHkcmKmABXkiFdK6HQJ8hiK/Zk/ggmPZ5zW
         H3XNz+riJawkqja/mc9LJM9jvWJAO11NtXCojJ6RIJXegHmxTONvJVS30CxcmoehSwLs
         CpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        fh=/VomLVsnouob7HVVxN/2m5rXLbjZK/gHAwjayNGkuto=;
        b=dGU1A4HAyY3KgztMGckKZyYFVrDoqR4Q4WGOPtzapMCVo9e5NhSJyt7wHxl6+8PKr8
         FCtZdGjpQ5ntKqKarqNB013zGEUsEWrmKh4qzVcqUxXdgQQFmp6htfDJ1LpHsO4yK9pp
         vCyoKSLl0MN48k734lea0kzsh0rn346yfqGPMu+wrV6VD+3ln9RM022TapCvSZ86iXqv
         RN53m4+oaVqjom5/bf9EvDZhdEqA/QBHVAEP9LXM4dsuSox08II7jntuyPVuQrjHReBh
         JJQJ0OQZGV1ov5cd4yqZzdOg8KUoo+virf1HbUVap4aFInREumZ6fffFzQ7JgMQmjBEK
         LdcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761496; x=1770366296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        b=EXEhLOQrf9HDwY50Y4LZVheFhukcCoIRK8EPRvm8lU8xcXKs/N8Ozk0pwiyPsITmsJ
         zC0uL7SojPHB38L7QtQAqjpy6zgi9X1uo+zlm4PHUUOTca1q6L+w3yxiHEplocWTfS/W
         xfDko7iXWQd3N1GPKjpQzW5nI6oCUypLtKC4twTklgdsNwsKUDCxKTBTdSUhvAOS6vl3
         7JWoiPX714nGPSiz617eywP9k5sOQGx/1LFuk/9Uk3hvrG71uLgCeg0IOlm6MFRcNHoz
         gdfNk59bCa0oyhIZb8q0JSpN6tBFlkCoU9ozjFB8Nkjqkyz0bR+M64OgIHeqf28HTopn
         sxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761496; x=1770366296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        b=B22RVHuDBs/W+ndh1ges0/hiSWfYK2GklR0ZyxxK/Wt1Mx4sNWI6+zbvzsdcZ7LLvJ
         nwztVCtiymX5Fk4Rd8yrQ1LrgGz4R5g8C8B4Pv+FKvwEPPaFy0bg2auS7zjFeyxfmn2Y
         gZZt71EM2vla/gBG2HEFmPBaJpWeUDygH91hYPd+5g5tf7MBKsZzfJi4K51OE0PTA/Nf
         3t9g0qJqdIjlQCb33rLMLgmytknqCMxXavS42o2oyHHMAJ0HDWbDEIeQLkWgUuG6asth
         u6bHcRvag/ptrDKS4RrxJJcWsKljM2SVWvy4su0Zqm8Pfidv0HlKSHfNDs/1DPw7qlvS
         52FA==
X-Forwarded-Encrypted: i=1; AJvYcCVZRR9RfV1ueo3D6m+LjSryR3mAt1uFiH6IvYQ77bQvOWxly9cnJiFlpvXMb0SuPB2rvkM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsPWgRDvw9gH5kDKlqRdlkM5FMmEfEgQHsBfJZ0xz6f/X9Bm98
	ZXlIknCHSRRPrQA+7ii8ygDdIeyFYZBzgaNFR3ykXZKYdIuwCOTatXAONKS9bo4tlqWbIQtaVuQ
	bYNP2Nj1ZNj5o2OM+HnADTgH4xFza4do=
X-Gm-Gg: AZuq6aLrt0ULkEZBn5Z7Y4eVgjVgnoJ5A2+k+EkW02jFtFo7d1V3SwKtIPlYSwyGAS6
	IAYSANXTp+1uzvtpMO5U0lHUbNsO6406NWLBKDOuSyb6XjI0F9bGvSJmagBYJwnizng/q44WND8
	isgg94ZDfF9UG4Gzw2tThxP1EI4nol1ae0HqVbS2dZPNTa3JMvmY4fPuyxYoHcOzRv+eGAPpqOp
	9vcpsaDrsyykjFbDk98sqS+eJFJvd+QVWUUZN5uL2nJqXRgIKPLiu+wQKjqPYCMDGCpz0k=
X-Received: by 2002:a17:90b:35cf:b0:353:e91:9b2f with SMTP id
 98e67ed59e1d1-3543b3c648emr2292966a91.37.1769761496076; Fri, 30 Jan 2026
 00:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-3-shengjiu.wang@nxp.com> <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
In-Reply-To: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 16:24:42 +0800
X-Gm-Features: AZwV_Qh3nyHcIbEYDDCvGcF70iBOk8SCVrc7tCSz-T6YiK9YuuynA5ywxyM9ma4
Message-ID: <CAA+D8AMkaTkHL03fi8THxK-a8xBR1Cu4BcNC5XfeZvzvwJ=rTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:27=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
> > The clock mapping table is to map the clock sources on i.MX952 to the
> > clock ids in the driver, the clock ids are for all the clock sources on
> > all supported platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> At this point imx952 has the issue with dma request not cleared you fix
> in patch 3/4.
>
> So in order to avoid this you need to swap patches 2 and 3.  And in the
> newly patch 3 you will fill fsl_asrc_imx952_data with correct value
> for start_before_dma.
>
> Thus we also keep everything working for bisection.

Good catch. I will swap them.

best regards
Shengjiu Wang

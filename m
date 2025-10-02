Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E212586C8
	for <imx@lists.linux.dev>; Thu,  2 Oct 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422318; cv=none; b=aVCMk+5SRz372IwNy/25bpCFr7Jj9h7rj/mgNssEDl9YJdaIXgtKWBGjheL0aocA3KXL+jpSem+J+KV/rB6oY1WbKTiRDhEtOPhdBegH2cRMjwCLAcOFLfeKpNKDU1a4lOBcorutzDSZWoiIJwnVNa4+lbNos5Ydn/rF3cky+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422318; c=relaxed/simple;
	bh=Dye5xG6ZBlkFS8UnTaxhmHjl4qw3h7OPv8XQMDNn3/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mj3RLl2GKP4OonTbRMaFWC06Rhz+mJPdQ2LLqPxhTj7utD8mDy/Flu6ksm9AVkQthPGnCOoOjgelbeP6HUMGtieaS+kOp1/Drery2dGy0cso4vl2G+YkCZf9+Y8AVa5Y+4c3u1azFupZgPVEK77PPVDD8UiB0dfNSHQaSsyzALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhvmznoP; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhvmznoP"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78af743c232so1189558b3a.1
        for <imx@lists.linux.dev>; Thu, 02 Oct 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422315; x=1760027115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=;
        b=KhvmznoPsGVqW7oY3X3xk560L62qwE0v0pUKWISPU8agddPr8BrMoWL/Ozu1NAIzz5
         y/DUdWP0WIV6T0WsJbRQ4z5m2yS+3IBWN4yn10QAObFVbMjieaUPL5kGQ7r/bwIQh+xw
         Gwsknh6A64/AM8JFN9p9Kol8VZsgGogcCxM3CfHsG9FNpgktUFQIre8NF9kZmM/66eg4
         +GCZT7GqAGHQjYiKcLryZI5TZESJe3YqfXp/AmvRPjU/NzLgo4W3i1ktJIaWKaBgeKkB
         bK8KKrkWEGVrctjvL29QSIMFy5D5v7RC8NWi8geXpTBiCij7QCOphqH61bRexZN/u5eC
         zMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422315; x=1760027115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=;
        b=IU1LthvldVjCK18SNtfDqlOi2oq2kDElu6gV81vkE2nqqm+bXeXhWYVE9rKmtSpkWq
         Ss4Rilv2jdCPwUDoIyehp1RdmTf11bAeoNBrvucG+pDl1DSWO3W4X67PQ2B5b20D7wTh
         URed0a3BuCh/DvS/K+lYSmoGW3/Be+1vGd7hrgGGDiqguqCMMb3slqjJlrGLRDIjrePi
         MTRdzdcpa01yqlM77u2dmRsKtbKlSRvFnXrMvZsbc22nQ2C8e3TJugiOTgdU/p5R6X3s
         Fbg77t+g8LoQtzarOiN4vW7d0ofCOYpO7N/oqP8NEB8wSFB+e3sQRdkjEWVfcXb0Vkfe
         R3wA==
X-Forwarded-Encrypted: i=1; AJvYcCUHGbrRn39iIWamXXIaeVjlcml7u6nUirpRWvCsZb1Tl0kd55Nio7HB4rkLMOT2D5vA15k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBn2wP8FPUCD8ym4xNwaUZHbHPHFIybAbKSxxdzCwPk1Sb6wh9
	/unBJMHJA3N/CqQ+bnbG64n0K7+xbx4hjpPIJ0BpgNGoT3e+ABUAGcr/J1sHa5dEzxYk/WkYfd2
	OjYTGeFLVl2v1aE3UBXEDxIrJ5WfL540=
X-Gm-Gg: ASbGnctQSaVbFbYbID8gtQ4gFTkvEmlQTi83TwlZnIPA4az4uLvGHEFHJh19ZUI+7of
	Kw04TNrepQDX6LzmBizjS0IyDK3/OAZsPXXaoQINMWxKXmfup+ql2158qz+hvGQ2ED6KjS5GtcC
	FqQlGRs136XXxXDSntlx8gvOHDYstAd4gWqztB573NOkmI3D7KUHB42qYiaZUGGXHEfr97yJJIT
	Be4zW7XwxebUvDLoEId2HzIL051WQs=
X-Google-Smtp-Source: AGHT+IHE/zk/UTkg8cQuQgjzmknU1P4NQ77O2Frb3S1sd6aKc/XPDhOrrz+zfZ4f19CBYGkA2+apVfUO9bhD8Hpgsxo=
X-Received: by 2002:a17:90b:4d08:b0:335:2b86:f319 with SMTP id
 98e67ed59e1d1-339a6f76fdcmr9571286a91.35.1759422315195; Thu, 02 Oct 2025
 09:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
 <20250820140154.GB6190@pendragon.ideasonboard.com> <a9283349-c58d-47e6-ac33-77b5a6b893fe@gocontroll.com>
 <20250820141439.GA10547@pendragon.ideasonboard.com>
In-Reply-To: <20250820141439.GA10547@pendragon.ideasonboard.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:30:12 -0400
X-Gm-Features: AS18NWDGHOBDrSguIYms66P-zFEY8uoL7wGfB2jgVSBuHpouvKYa_JLzhedGeUA
Message-ID: <CALC8CXf2RTYz2YjbFHsbdjDSSAt3Jdv1NBbBQs4jRPmwkuUuXA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maud Spierings <maudspierings@gocontroll.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Riedmueller <s.riedmueller@phytec.de>, 
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maud... Laurent
Yea you a Mad Lad.

On Wed, Aug 20, 2025 at 10:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Aug 20, 2025 at 04:07:55PM +0200, Maud Spierings wrote:
> > On 8/20/25 16:01, Laurent Pinchart wrote:
> > > On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay=
 wrote:
> > >> From: Maud Spierings <maudspierings@gocontroll.com>
> > >>
> > >> media_pad_remote_pad_first() can return NULL if no valid link is fou=
nd.
> > >> Check for this possibility before dereferencing it in the next line.
> > >>
> > >> Reported/investigated in [1]:
> > >>
> > >> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e4=
9e@gocontroll.com/ [1]
> > >> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > >> ---
> > >> I'm not sure if this should be a dev_dbg(), just following the patte=
rn
> > >> around it for now, also not sure if EPIPE is the correct error.
> > >
> > > I've submitted
> > > https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pin=
chart@ideasonboard.com,
> > > which should fix this issue in a more generic way.
> >
> > Saw it, but I think my patch technically is still correct as the
> > function documentation states it can potentially return NULL right? [1]
>
> The function documentation states
>
> "returns a pointer to the pad at the remote end of the first found
> enabled link, or NULL if no enabled link has been found."
>
> The MUST_CONNECT flag ensures that there is an enabled link, so the
> function can't return NULL.
>
> > Link:
> > https://www.kernel.org/doc/html/latest/driver-api/media/mc-core.html [1=
]
> >
> > I will test you patches tomorrow.
> >
> > >> ---
> > >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 ++++++=
+
> > >>   1 file changed, 7 insertions(+)
> > >>
> > >> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c=
 b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04=
a8752747f556bd1fc5a9 100644
> > >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_c=
rossbar *xbar,
> > >>    }
> > >>
> > >>    pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > >> +
> > >> +  if (pad =3D=3D NULL) {
> > >> +          dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n"=
,
> > >> +                  sink_pad);
> > >> +          return ERR_PTR(-EPIPE);
> > >> +  }
> > >> +
> > >>    sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > >>    if (!sd) {
> > >>            dev_dbg(xbar->isi->dev,
> > >>
> > >> ---
> > >> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> > >> change-id: 20250818-imx8_isi-954898628bb6
>
> --
> Regards,
>
> Laurent Pinchart
>

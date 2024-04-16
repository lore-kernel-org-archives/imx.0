Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5468130492
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713283694; cv=none; b=caF+bCta/iC2SegZ33MKFMbMY3tTyHOqgrk+WZTj80VRlaHO5l9OvyWf40AiPDynj7AGCZfaoelERAY/3OSzFqEZ674eer4iAhEIZXexkrmBBzSEUnxiNFkLY6+mHj87hEya+tN3jAWDbtcJ5F4f6AZP7qxdqjZxdZ3f3fmT4d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713283694; c=relaxed/simple;
	bh=QV71qq9odi8AHKM63Tno0XX3cSK/Xlz9aafkhj8FPUw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fpk5sBoLRgCjJK3/L0UAX8qwAOCQBe823nWefFyo4Ty/s+3zXMPtZIhkARzPvHHe1s1362xePPFv/Ub0p5mCY/Ezer+KUscSd4Tjeok1yasq3n6chfU2r9d5ZcTn0S5yZba+TCZXcqbU5CpA10pr/IlaD5jvlV7H2Eh9LZo3PZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddONVnb0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddONVnb0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4187731a6e1so12199145e9.2
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713283691; x=1713888491; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZIdA1Sj+M3uL+IMIYi64iHj/gQH9BBQNdMeTTfi5MAk=;
        b=ddONVnb0XAQw5/QqoqIMP8ujadYRXEoMDELpTsIhZTmL3hmbH9lPE61l2uzrPquyMO
         UGXPv6DipeGo4hTSA0VRd/vA3MVdGXlN+IFPVH7j8y144SDq8slHEGmsJddQRc10fpSO
         58p/nNCWct7DUgsqWyFQPY9asPCjd2sju5Qzck99Q8c1WUHDDhyuN1EGW3FvFYH8jRJ/
         0VfNMOUL5CEukpKd8XzZ9pWn35eTk4g6L6EjYLmBySok9+CyiuULK6IiXrHiPTT5i4R6
         M5wEOiMyZFDePmFwIecyuhCSm/eFMXb79GmXNLf2P6qrMYkGuwob8PifLUu3oAXvQkd3
         msaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713283691; x=1713888491;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZIdA1Sj+M3uL+IMIYi64iHj/gQH9BBQNdMeTTfi5MAk=;
        b=rTt1cBms06K4JNaKoBcgoE+KNX/x3dFsx+jpefOlcqy7xHTi8DMZnymqydZD9CBZay
         0SJFj86wiIRJdJurY4l6KmOEKElMSB8OvzfYQtvHXo9krJF0Vx6TsH/v4jAt06THh/mo
         80a+HpK+72ND89sPvhH0l3tsDHt5jHdq0azDv99oqH9P9wUaotIFLJVO/rOyMtqG+Emm
         GeONK7DvJ2J9ZEEBEIYlO4c+g4k92iMGC9MyTof5t5mf+vDcl+aJta4lOlXq0QnxuC3U
         /W11OtltrT6iVPlayd9XxBHmnxEir2Y6lzZ/7gtxfAhm2V1NA+anD0YGrEYl4ZnC+IO5
         VJhg==
X-Forwarded-Encrypted: i=1; AJvYcCWeZ8anpPLlYA2YNjR503Sh6TrNmHqyCoXXPgP/ZaZOKSBTIoj/vP8LhumAo9LV8Hz2W+ZDx7jIOV/l7G/iDv5CYTbf
X-Gm-Message-State: AOJu0YwAO4WL9jtzPBTj/264Mqa91KkoX0NTpnnB5pTGQ/gfOT3j77z3
	RPGLsOZgiSAf3L6Yq8d0vf/EWbVI7Ev6VhX/XR+0SOXEhBG0Wnkp
X-Google-Smtp-Source: AGHT+IHyFWGmvJYOfR2xREiYISWtTfew1Vay0BFApoqN0ItFTTRH32ygEA6x9s/dWYJk19A15KUMfg==
X-Received: by 2002:a05:600c:3549:b0:418:23d7:816f with SMTP id i9-20020a05600c354900b0041823d7816fmr5977429wmq.17.1713283690835;
        Tue, 16 Apr 2024 09:08:10 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e622:f700:648e:56c:90e2:9fe8? ([2001:8a0:e622:f700:648e:56c:90e2:9fe8])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c1c0700b004187d900766sm5347326wms.43.2024.04.16.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 09:08:10 -0700 (PDT)
Message-ID: <c064940ba46449b540a3cba14ebab96d31ba19de.camel@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8mm: fix missing pgc_vpu_* power
 domain parent
From: Vitor Soares <ivitro@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 16 Apr 2024 17:08:08 +0100
In-Reply-To: <564fa534b32f4a6e96da6752f531fc7447ec633d.camel@gmail.com>
References: <20240409085802.290439-1-ivitro@gmail.com>
	 <9ce35b9bb5a15891f6bd01bd54b7dc84b3ba4021.camel@pengutronix.de>
	 <e1552a3008a30ef7ed9097b4b80cda23ccb9e840.camel@gmail.com>
	 <fcd6acc268b8642371cf289149b2b1c3e90c7f45.camel@pengutronix.de>
	 <bd4d7198e58bd89b46a4c721546f6975b287a5fc.camel@gmail.com>
	 <c76d98a300a9d65d236d334da62916a7d658ef27.camel@gmail.com>
	 <564fa534b32f4a6e96da6752f531fc7447ec633d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-04-16 at 11:53 +0100, Vitor Soares wrote:
> ++ Peng Fan <peng.fan@nxp.com>
>=20
> Greetings,
>=20
>=20
> On Wed, 2024-04-10 at 12:01 +0100, Vitor Soares wrote:
> > Hi Lucas,
> >=20
> > On Tue, 2024-04-09 at 17:44 +0100, Vitor Soares wrote:
> > > On Tue, 2024-04-09 at 16:36 +0200, Lucas Stach wrote:
> > > > Am Dienstag, dem 09.04.2024 um 14:22 +0100 schrieb Vitor Soares:
> > > > > Hi Lucas,
> > > > >=20
> > > > > Thanks for your feedback.
> > > > >=20
> > > > > On Tue, 2024-04-09 at 11:13 +0200, Lucas Stach wrote:
> > > > > > Hi Vitor,
> > > > > >=20
> > > > > > Am Dienstag, dem 09.04.2024 um 09:58 +0100 schrieb Vitor
> > > > > > Soares:
> > > > > > > From: Vitor Soares <vitor.soares@toradex.com>
> > > > > > >=20
> > > > > > > The pgc_vpu_* nodes miss the reference to the power domain
> > > > > > > parent,
> > > > > > > leading the system to hang during the resume.
> > > > > > >=20
> > > > > > This change is not correct. The vpumix domain is controlled
> > > > > > through
> > > > > > the
> > > > > > imx8mm-vpu-blk-ctrl and must not be directly triggered by the
> > > > > > child
> > > > > > domains in order to guarantee proper power sequencing.
> > > > > >=20
> > > > > > If the sequencing is incorrect for resume, it needs to be
> > > > > > fixed
> > > > > > in
> > > > > > the
> > > > > > blk-ctrl driver. I'll happily assist if you have any
> > > > > > questions
> > > > > > about
> > > > > > this intricate mix between GPC and blk-ctrl hardware/drivers.
> > > > > =C2=A0
> > > > > I'm new into the topic, so I tried to follow same approach as
> > > > > in
> > > > > imx8mp
> > > > > DT.
> > > > >=20
> > > > That's a good hint, the 8MP VPU GPC node additions missed my
> > > > radar.
> > > > The
> > > > direct dependency there between the GPC domains is equally wrong.
> > > >=20
> > > > > I also checked the imx8mq DT and it only have one domain for
> > > > > the
> > > > > VPU in the GPC. It seem blk-ctrl also dependes on pgc_vpu_* to
> > > > > work
> > > > > properly.
> > > > >=20
> > > > > The blk-ctrl driver hangs on imx8m_blk_ctrl_power_on() when
> > > > > access
> > > > > the
> > > > > ip registers for the soft reset. I tried to power-up the before
> > > > > the
> > > > > soft reset, but it didn't work.
> > > > >=20
> > > > The runtime_pm_get_sync() at the start of that function should
> > > > ensure
> > > > that bus GPC domain aka vpumix is powered up. Can you check if
> > > > that
> > > > is
> > > > happening?
> > >=20
> > > I checked bc->bus_power_dev->power.runtime_status and it is
> > > RPM_ACTIVE.
> > >=20
> > > Am I looking to on the right thing? It is RPM_ACTIVE event before
> > > runtime_pm_get_sync().
> >=20
> > During the probe I can see that
> > bus_power_dev->power.runtime_status =3D RPM_SUSPENDED and then vpumix
> > is
> > powered up on GPC driver.
> >=20
> > On resume routine I can't see this flow. bus_power_dev-
> > > power.runtime_status =3D RPM_ACTIVE and vpumix end up not being
> > > powered-
> > up.
> >=20
> > I checked the suspend flow and the GPC tries to poweroff vpumix.
> >=20
> >=20
>=20
> My understanding is that when resuming the 38310000.video-codec, the
> vpumix isn't powered up. It happens because runtime_status and
> runtime_last_status =3D RPM_ACTIVE.=20
>=20
> I tried to change blk-ctrl suspend routine to force the runtime_status
> =3D RPM_SUSPENDED, but the system ended up hanging on another device.
>=20
> From the comment in blk-ctrl suspend, we rely on PM_SLEEP code that
> iterates over dpm_list for suspend/resume.
> I did look at the dpm_list, and it changes the order on every boot.=20
>=20
> With all the tests, I also found that the system randomly hangs on
> dispblk-lcdif suspend. I have confirmed this device is in a different
> place in the dpm_list (not sure if it is the root cause).=20
> I haven't understood how blk-ctrl ensures the correct order there yet.=
=20
>=20
> Taking the following dpm_list excerpt:
> idx - device
> ------------------------------
> ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 191 - imx-pgc-domain.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> 192 - imx-pgc-domain.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> 193 - imx-pgc-domain.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> 194 - 38330000.blk-ctrl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> 195 - 38310000.video-codec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 196 - 38300000.video-codec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ...
> 205 - genpd:0:38330000.blk-ctrl
> 206 - genpd:1:38330000.blk-ctrl
> 207 - genpd:2:38330000.blk-ctrl
> 208 - genpd:3:38330000.blk-ctrl
> ------------------------------
>=20
> Shouldn't genpd devices be before 38330000.blk-ctrl?
> As their power domain is GPC and the blk-ctrl power domain is genpd.
>=20

I did the following change to have genpd device before 38330000.blk-ctrl
on dpm_list and it did work.

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/i=
mx8m-blk-ctrl.c
index ca942d7929c2..0f1471dcd4e8 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -220,6 +220,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device =
*pdev)
                        return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev=
),
                                             "failed to attach power domain=
 \"bus\"\n");
        }
+       device_move(dev, bc->bus_power_dev, DPM_ORDER_PARENT_BEFORE_DEV);
=20
        for (i =3D 0; i < bc_data->num_domains; i++) {
                const struct imx8m_blk_ctrl_domain_data *data =3D &bc_data-=
>domains[i];
@@ -268,6 +269,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device =
*pdev)
                                      data->gpc_name);
                        goto cleanup_pds;
                }
+               device_move(dev, domain->power_dev, DPM_ORDER_PARENT_BEFORE=
_DEV);
=20
                domain->genpd.name =3D data->name;
                domain->genpd.power_on =3D imx8m_blk_ctrl_power_on;

any concern about this approach?

Best regards,
Vitor Soares
>=20
> >=20
> > >=20
> > >=20
> > > >=20
> > > > Regards,
> > > > Lucas
> > > >=20
> > > > > Do you have an idea how we can address this within blk-ctrl?
> > > > >=20
> > > > > Best regards,
> > > > > Vitor
> > >=20
> >=20
>=20


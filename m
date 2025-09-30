Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18403081A4
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759248681; cv=none; b=CKcVbfvLTBqoRqJd70IMPj7HMTD22r97pnPI+lDYJny7FqxengMRQqn4dg0UI0KZrCpveJsgqjeHHg/hgtTzOVtHhLR4b7hBe8t50CGz7uhMRmM7TSCvttmyZarBTyPywAI59WF3kBXfBUWSIM2YFDuiaEJ2rn/I+PSyYKTTrLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759248681; c=relaxed/simple;
	bh=MndQLK5x5cGMTWMw/cHXzHjTxE6qM7el/nwtDsSCCTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1yl/Dqa1bVbnHUq0/IqZNz1sDoC3vxuCa13gNc8qZWEFK+iap0C64UerjiEHE9I6Y10y+b1AiVYDOCVUGOkL6ASilgh7mkcDWa2dLe364GwY0ALkZFCmxyLstSxQ3GE8gwlxkIPpfuWxeuM4mcuZgQbPa67w4R0wnYtqDbgMFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlVS/ezm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlVS/ezm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso11116411a12.2
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759248677; x=1759853477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxp5oWG2zYQb/bAadgrp+7BT1AfD0ElhKVNTGDmQyfk=;
        b=OlVS/ezm61s3pupznz+MSxrU0/OBo6hKTd2Qa+82zph53XI0WFvrrFvQf2xareCZu9
         Nf4V1YkJ4cJuu19OW4Go1tNxmk1CdJazurkcUCsQDW1k/atsQOYoWrM3oQsjdlgFProW
         fNPBURAwh/wtm9RHZlNB72dmwjkY2rLoLMVGoFT8tZo0n5NfY8o5vIwPkneVZgiwV/bY
         2x0h2HXBw8H2XxVSFPuPaGbCfeD66DYAg3AURP85kc+a66DMHe7ZJxHK0R6e6gaSF6sO
         pXE+/EOnO85qRyeDE7Y0RAYu/TDFMZCm75zokqnwg4boiI4AZgTjywAZNPIdNDE1qjVZ
         zb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759248677; x=1759853477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxp5oWG2zYQb/bAadgrp+7BT1AfD0ElhKVNTGDmQyfk=;
        b=VNjnbfBov3qXYoikZvBi7UwsDyKzikDMC9b6FYx45/nwUF7OSBeTCV0Bzn7p6LNZfW
         26iQ5rq/uMTrIbOst3lIvp03JHD9z7nRzzxfqshVzCWrwpGTsIwhWtGSxWMGfD+fv1Vp
         03SVibzmRm7ysGvOCrsJV9pG1oTkB1ZRUxJAaJVxOk/HLCQiYG+GHedJNAZzptMlh4x9
         X4A7nyAoobLuM3gn2wBRfSgEL3J3nxam7I2EZUiSUQLPdt+e+3ZjTZvhEfqLbEE7rcM+
         zbmWUDFddgc/MfS9rLNncchAMKYNIfnvWh0jlRCfVrcFU5QaQeSWP3rawN/AhEpLnNFB
         6qAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsJ4vKg031cvzkItAdDcRXyb+R1XEvUSqBzUJUyYdWAtYfvb4puVW89S3H/amhYvKBk+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxPC47oJ2AE0xtYm4yeKNYi+rbjTuF9hEBOvvME0n4b6kdBIw5
	Y8kwt35COwUqrwAmZlPTes/zHRVOftCI19S/vhCj0K0HGN7eCfWeOAnJBqr+2Gd5MQp9tZFC1Pg
	7DW7C98vKHNcRKI0SPiDzOUJmcC2MJ7yPXIZY4PgBAQ==
X-Gm-Gg: ASbGncuiUu3w7ISZKM0wCQQL1ShdM5+y2iwrAKDDoJCdxSJDbyRYY93exey4sVU1Q4h
	5ewVrXEyaOyx/5O0v79Anl+W1gyDuf+Xyeh5PpEBeBNDS412sHqXB98uc7YLWnX/XuJxk74K0ON
	zCUJsSr7rfXT0u5l/bpjtc5dKFPrnCqBHP1V+vp23B5fkWy7zR5aEDaoN9HsTi9b0zYOOMGIOfH
	qDw7Ixs/5IgJ3j1SdDgpBKHQTLuNirQ/Vk5OV2AiSFa7GlR4hv3cX5PtO3Ah3XZvB+pA5I=
X-Google-Smtp-Source: AGHT+IHcT65SCb0YDaj8HXJyzDEr17zNKjdB+wgbHVUN98mdk2+pEmJMBE3H+oYu+G7ZvB3GLkI42wO9NC0FtjKrGmM=
X-Received: by 2002:a05:6402:3584:b0:634:abb6:8b4b with SMTP id
 4fb4d7f45d1cf-63678d0a45amr507520a12.22.1759248676729; Tue, 30 Sep 2025
 09:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-3-vincent.guittot@linaro.org> <4ee5tqdjv5ogcdtysiebtoxmrvrzhkar4bjcsqi47dxtgwac4c@rezn4waubroh>
 <CAKfTPtAEkegCV-9_x-dXSWQFOoG6kO5JbJq_LToY9YuuRusoVA@mail.gmail.com>
 <lmczw5agheqbcl6xcomlhf7yfbdvfx45pozmaxjmbkkqudsxlu@c7u6s5h4xm6j>
 <CAKfTPtCacFhJztYvWycSdoWMUStaf1WAcGJKHwk3y4n-uEELSw@mail.gmail.com> <xmjgs5ssolugcq2ogjc5j3ccwalcc4q3whl64fcra2aiebhtci@qwobbjtb2wcl>
In-Reply-To: <xmjgs5ssolugcq2ogjc5j3ccwalcc4q3whl64fcra2aiebhtci@qwobbjtb2wcl>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 30 Sep 2025 18:11:05 +0200
X-Gm-Features: AS18NWCijqY2xYOImmRNqiG0s-RQFrJ1uFUZhBOTuBa0xoCxbLUGNkckGMVPh8A
Message-ID: <CAKfTPtDva4fUQty8b5b=tLEHcd+OGFSS9i0DJqnn3vFvgG9wrA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Sept 2025 at 18:32, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Mon, Sep 29, 2025 at 06:23:05PM +0200, Vincent Guittot wrote:
>
> [...]
>
> > > > > > +static int s32g_pcie_resume(struct device *dev)
> > > > > > +{
> > > > > > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > > > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > > > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > > > > > +     int ret =3D 0;
> > > > > > +
> > > > > > +     ret =3D s32g_pcie_init(dev, s32g_pp);
> > > > > > +     if (ret < 0)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     ret =3D dw_pcie_setup_rc(pp);
> > > > > > +     if (ret) {
> > > > > > +             dev_err(dev, "Failed to resume DW RC: %d\n", ret)=
;
> > > > > > +             goto fail_host_init;
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D dw_pcie_start_link(pci);
> > > > > > +     if (ret) {
> > > > > > +             /*
> > > > > > +              * We do not exit with error if link up was unsuc=
cessful
> > > > > > +              * Endpoint may not be connected.
> > > > > > +              */
> > > > > > +             if (dw_pcie_wait_for_link(pci))
> > > > > > +                     dev_warn(pci->dev,
> > > > > > +                              "Link Up failed, Endpoint may no=
t be connected\n");
> > > > > > +
> > > > > > +             if (!phy_validate(s32g_pp->phy, PHY_MODE_PCIE, 0,=
 NULL)) {
> > > > > > +                     dev_err(dev, "Failed to get link up with =
EP connected\n");
> > > > > > +                     goto fail_host_init;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D pci_host_probe(pp->bridge);
> > > > >
> > > > > Oh no... Do not call pci_host_probe() directly from glue drivers.=
 Use
> > > > > dw_pcie_host_init() to do so. This should simplify suspend and re=
sume functions.
> > > >
> > > > dw_pcie_host_init() is doing much more than just init the controlle=
r
> > > > as it gets resources which we haven't released during suspend.
> > > >
> > >
> > > Any specific reason to keep resources enabled, even though you were r=
emoving the
> > > Root bus? This doesn't make sense to me.
> >
> > By ressources I mean everything before  dw_pcie_setup_rc()  in
> > dw_pcie_host_init() which are still there after dw_pcie_host_deinit()
> > in addition to being a waste of time. Also we don't need to remove
> > edma and free msi
> >
>
> Let me take a step back and ask, why do you need to remove Root bus durin=
g
> suspend() and not just disable LTSSM with dw_pcie_stop_link()?

That's something that I'm trying to clarify but it's so far the only
way to get suspend/resume working. I have some hypotheses that I need
to get confirmed but it doesn't have full control of clocks and power
domain

Vincent

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

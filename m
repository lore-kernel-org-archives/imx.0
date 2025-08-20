Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005652236E1
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677941; cv=none; b=bWzz8NbLslMnQolgU3A7xxIwdBPYBtcGRCh4ZQD9LlELqMzl95PMX7kz7MInTi5tP7+dJCKBZ3fAnVqZZW5cj7o+7/F2W0ktAqDx2IlG1TAe5LX8XJzxB4lqu4jQQIGTnBjD1WfvF12ZURjYSxnqda3MGYUPlF7/oGnnGtxa4ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677941; c=relaxed/simple;
	bh=fK2DuSyV4LqHa2BTm2YQxEWab71xsSNOPn0cGrQrG24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhPcbvCyEkhOtdmuYmVn546nrNowRY5FUL/ObZgJSIVN/E+K63EsHx1PC4Nlmtu+n+BO58CDC47OmAR96BA/hSCTXDASpvz6d90QTwhpbwzq7PcHrvYGnDBLvsN50HfoIV8KW5dAkx49Vri8tSWU1SR+x7viMpswkm5ORUBGzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJjZK7gl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJjZK7gl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-245f5213679so1467685ad.2
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755677939; x=1756282739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
        b=RJjZK7gliYKCOMrDQGFZOs6d4FbCOTjoxv5He0S16wM61ECYmN5D/hcJ03fp3MMtGi
         lwV/x1MwSAeCaDSIPYFgPsaLYSSSWkppgQtjKsYsqvdGupbGtWi/rN6gdrhyzZIS2TjC
         PKA/v5X3Gs2P6tZDCgqbxju0so/tZTU2VHsBWY2LGqEEKWTeTtBdqYVOwpmjcIAbOLws
         8N6cqodprcof1hPIrOvmVOvLss5vryot5wr5KsQXIokGmp7eJNSDxbP6EKtXG6tH9zxo
         THt111GW8+wwbzhxJFiqHkCQTGCB5rE8gjGZHzpObFvQepugQkR57OBel+Kp4esdVwW/
         t0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677939; x=1756282739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
        b=E/q+7VYRMyntrBROhCxVIbrjgkC72qp2ykKbPD/6nGaCHRxTr6uhRrOmYAtgo1njtG
         YnHf5vU+c5KlVqSQM9oS1Qq4BZFbGHdvoNvTvNWMN13PGp3VZzZjWBPrAj53TI8p+egH
         vERPXr1OBjvOOeeJtpzu2+RkVwOG2RaLUZ/79xoyybNlketIYp+/US6g7wYGyMO+jL0u
         Y1u7Oo+S3bLxqm4e0q8frRTeogYQgELQcGtROoWEk0dOgbJ0I2SB4lbNyTalz8/UdmNg
         VGIOTIA7btNixog7eP31GuNw8giMZURvxbTnE2cEJ5ZV17thBlfJo9ptrrVfdJcNCHMS
         gatg==
X-Forwarded-Encrypted: i=1; AJvYcCWTBWGyLwsb9YHhDRTgP2X3hrdja5G1rWYmzG0pevNPBcRlBhw9YW7lTR7rcoqQ1b+rT1M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7XJ7s+0CTJvGOMJEnIPM/7+8wHyCl03z24Conhf+t4c6Qpv/5
	Im71sOjzgERxNQDCuxO0iKpeDnH6fBmpw+b4RL/+sXHREYaO4WunfdZt8MiM+R3mxygho0m++FX
	tdPwzeKol8+2QYLhkVyE5p98Ngh1H19Q=
X-Gm-Gg: ASbGncv8hZ2hLNs0mJAztyUjcGxMeRBdnLZ8FNTM4q3FYSwUa8UgyQv78HMFvGvhIrG
	zlUdUCHOex9dEIiAp58J6CN1dNcpiyOQuHjAy/n8EzBHHXTvSC/+cPNdqGfZSCHegWsifSF5Mjt
	vsl+g4YxP8xMwGUWBhz/Key8kQuZe7Mb81Xs+K/iSvbEUDBupvxUobWsKr912h1xz49xLtGyFxH
	hsh
X-Google-Smtp-Source: AGHT+IHyS319ZtbgIK5QZ2TPQXhA0Y58me3odjKXWmlmqSDihLpOV/ytvp3iwfpabPjgDac+00Icnjn6G+Cpo8Pj+bM=
X-Received: by 2002:a17:903:18c:b0:240:96a:b81d with SMTP id
 d9443c01a7336-245ef0bf2bcmr23609915ad.5.1755677939214; Wed, 20 Aug 2025
 01:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org>
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Aug 2025 11:21:09 +0300
X-Gm-Features: Ac12FXwDgSq5YSRmZRgmCG7R1pa20x6uPGQw-yiLKpdR5FfgZLxMT4en9AePre4
Message-ID: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

This patch will break IMX RPROC support.
<snip>

> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c

<snip>
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware=
 *fw)
<snip>

> -               priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev, res=
.start, resource_size(&res));
> +               priv->mem[b].cpu_addr =3D devm_ioremap_resource_wc(&pdev-=
>dev, &res);

devm_ioremap_resource_wc works only for IORESOURCE_MEM resources:

lib/devres.c:124
static void __iomem *
__devm_ioremap_resource(struct device *dev, const struct resource *res,

=C2=BB       if (!res || resource_type(res) !=3D IORESOURCE_MEM) {
=C2=BB       =C2=BB       ret =3D dev_err_probe(dev, -EINVAL, "invalid reso=
urce
%pR\n", res);
=C2=BB       =C2=BB       return IOMEM_ERR_PTR(ret);
=C2=BB       }

while the devm_ioremap_wc doesn't care about this.

So we cannot use devm_ioremap_resource_wc here unless you add
IORESOURCE_MEM flags
to  of_reserved_mem_region_to_resource as discussed here:

https://lkml.org/lkml/2025/4/28/759

The same issue we are already experiencing with Sound Open Firmware
where the change was already merged
and we have a bug already reported.

How should we fix this:

1) Add  res->flags =3D IORESOURCE_MEM; in  of_reserved_mem_region_to_resour=
ce

OR

2) Use devm_ioremap_wc instead of devm_ioremap_resource_wc.

thanks,
Daniel.



Daniel.

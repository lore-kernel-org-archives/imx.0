Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED6F192D6C
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999290; cv=none; b=MSQAbwmLBfiP6pRmgeIokeoAr9kg4gmLnwuBgonhMA+Lnkci++9HhefgyKqzvs1ITPRWOyx9/4Ig3Imtd+ewwwGLnn51RzUmWHz4Kvq5r1ZnepD8lmHg43h/GMRbvEroaKJgeAOylkOg+j70yvuvINOv2ogQQCxUoTOU6fNds1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999290; c=relaxed/simple;
	bh=uLqkbtaF/lYOCg5L7+7mzBordSwyiyem7pG6ozNXv6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JO3COTeMRbH/Dj5T1LpzJZQRxklMStP+UlA3JREO/zGvKW3/BLovv5Noa5MyanrZluQoXXkQuy/Xqsz3xIZI4uGDp32qe/6WCBl/GKx9Mmkkw+1pHs8/VAltIeMXb3vi7hz+ClK6bMdzl+H+zdbiRDShMTxj48sf8tGfxxMdiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=CLYt9849; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="CLYt9849"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so298754466b.1
        for <imx@lists.linux.dev>; Tue, 10 Sep 2024 13:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1725999287; x=1726604087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re/RvoGbxwdzYBSMy04B2Az3HNgONOU/qvSCSe57sDc=;
        b=CLYt9849pEWkOeHnXS/IPzFbcErQCfNE4dFFIGH7kPfoLCAyKe2PuWlYcmZH3SpKkD
         ZeRoXyojNSVIBY2386/jJo862ivwHg5xnYP33lDkBFOh2A4xaigdDONTU2ZkW08BpoH6
         13gDyUJuK5ajcF6nrA97k/zAJgEV1v0EED/s6GLY2IdgFQshvvU5XOZ/4Wm1kSRufj1B
         bY9FYBjZy5xVlfXmlknwcMUlWfnyYJDaoMzqRWCKH8hW7rCKSZo0c/YqSLG4u4TIr1eT
         E8Eg0NO6n52TYV3DHA+TQBJRkSjzbTKmTP7OMGLyY8d0PzhoR97rHlydGJkofEYlpcwN
         QWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725999287; x=1726604087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re/RvoGbxwdzYBSMy04B2Az3HNgONOU/qvSCSe57sDc=;
        b=Bis/JXqA7gtic7oO0AOOzCykhrNHuyWJ9c74OTiYieKTmYWQEUT/daScHx7qBNpAMy
         nIV6sMqMNvIjO3FnEbbY1vRwfVA2VtCthunmFikbPcXrA+orNAgdgezjIT8WYfZIcPoX
         jES0v8Wk+wNcYmud3Zfkz+C+sdWSE1+5YTBUtWdGQ4sK+bVkdBM2gHPyTOPQKrALKzdN
         31SXqDWuFTDm0b5NQEXMhPnduEVQxQOs+IFsnEx+xlnwXorrlZPnWOiX4ZC0XHbwU79U
         bo4ZUDpYYf1a84EXkK9/YAPIDUNq1u3dAIqleiQpO8dlF8GK2s+/Yrj+dbXLZs7CIjRo
         2gxw==
X-Forwarded-Encrypted: i=1; AJvYcCUciBjcsnm4F0XZ5N6QM7KMG0mb/F2ytyU2/Ycj9V+WVVhJ1K/jkKZURJf8FnH4nh1z89Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2+jx5vHghP86wGB+dVv6EzDTLALZfbE6FOfystjUyp+CDi57R
	frAZ7/NuH6DqX9wnM0lCZNfWGHVus1dLrHds5ARk16idWrTjA5i4Usl8F9ggLihDkbHumFikFsP
	idytSSSgefo+9er4fB5F8Bi4f9ymsAS0WM1vSqQ==
X-Google-Smtp-Source: AGHT+IFSy3754qdsgn+YFAz1meLOVeKD2q6UuOoxvRh0g802fr0oiEfcIphQGK8utwSUQpeBElrdfh5jrqHgOaz8vc0=
X-Received: by 2002:a17:907:94d5:b0:a8d:3705:4101 with SMTP id
 a640c23a62f3a-a8ffab78b54mr175294266b.39.1725999286224; Tue, 10 Sep 2024
 13:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240909215359.780561-1-tharvey@gateworks.com> <ef218f6b-7c24-41f2-a3a3-fcd97c29886d@kontron.de>
In-Reply-To: <ef218f6b-7c24-41f2-a3a3-fcd97c29886d@kontron.de>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 10 Sep 2024 13:14:34 -0700
Message-ID: <CAJ+vNU0zZMcg3fFqZinx5cs0WGV4LGVByj=XEqn3mGt-Qa=xrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-venice*: enable NPU support
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:50=E2=80=AFPM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Tim,
>
> On 09.09.24 11:53 PM, Tim Harvey wrote:
> > The IMX8MP has a VeriSilicon (Vivante VIP8000) NPU which
> > is supported by the etnaviv driver. Enable it.
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi | 4 ++++
> >  arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts  | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi b/=
arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
> > index 6c75a5ecf56b..f0211a96855b 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
> > @@ -393,6 +393,10 @@ &i2c3 {
> >       status =3D "okay";
> >  };
> >
> > +&npu {
> > +     status =3D "okay";
> > +};
> > +
> >  /* off-board header */
> >  &uart1 {
> >       pinctrl-names =3D "default";
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/a=
rch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > index 9885948952b4..8a04b66a4afc 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > @@ -666,6 +666,10 @@ &i2c4 {
> >       status =3D "okay";
> >  };
> >
> > +&npu {
> > +     status =3D "okay";
> > +};
> > +
> >  &pcie_phy {
> >       fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
> >       fsl,clkreq-unsupported;
>
> I think there is no need for this patch as the NPU is already enabled by
> default in imx8mp.dtsi (same as the GPUs). Or do you disable it in some
> intermediate devicetree include file?
>

Frieder,

Thanks for pointing this out... you are correct. I'm not sure why I
thought it needed to be explicitly enabled.

Please ignore this patch.

Best Regards,

Tim

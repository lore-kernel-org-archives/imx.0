Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36966201013
	for <imx@lists.linux.dev>; Fri,  6 Jun 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749243853; cv=none; b=Hwt9b4p2yYC2hhdSPuqRYDFKIqwdwKTRfF5DVKIB0YmIucHyabytvKd9DIMp84D6heTDXabVHxN/1RBU420cvanKBjeUoaqCVAZLDFqKldmvDMycGDKk2JEvZ9i6yIcROSXwEriZwPvhG7t/QhJy7L92b4GlKPMvqqh+1kUGyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749243853; c=relaxed/simple;
	bh=1Xc1REoGz59kJ4M9DicrjznJxMvjS5pOb4T5OcmR7Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmaDtooWY67NopVC6FMjaFNiAZYX+fqYhK609A3Zi0K1wQVa1QwMJUMyOTyDfTPSTHB/VLNN5lA6DEOkB9xD7/1HIXuSBNQCOgojbMZBwhMSe/dq89+Wg8dXbIA18VtSNELqdQvTyI+EgPsfqnVreYkwK9gFdmtjAuPgCzu4mPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=ZGekj6jO; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="ZGekj6jO"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81877c1ed6so2437402276.0
        for <imx@lists.linux.dev>; Fri, 06 Jun 2025 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749243849; x=1749848649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=;
        b=ZGekj6jOmT8Ew22TE6jdzUZ++uWN8ek3QHrYIroMGSq5/vZUswPBOjM0oIIqGGO5pY
         8MNiqZgbXVDsUcOKLprsQDej6WLnq+Akn3tNw1a8x/h52qhreogRMRsLnG/idmndJpLL
         SPXXGuUXOYSpUpZbJcoDEihUymgJRAWVDL51LDcAmQXpRVJZsXFqSsNrESnmcDdglecJ
         giEbEts+Z8iSP6WqYyDKbDfb+MK+muX1s7fWItifXLJ1qqhXwxBMvODAPLg+aHtCWNIN
         iy9EoVsaqcwr4bgM7VDJ4IAWA+WguuGbgdT2MAvqIC2IYVbySRZ+3e+bp5492fzbr3zh
         ZDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243849; x=1749848649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=;
        b=w7UTCkmxYyc3ODgtdTxqF5qQlDIO14fUjjxLYcPyeXwRmyA3SyIbUXFsAplz0axvLP
         0atj/UTGXfFWNbHxtNp0cFCQ2TYiRL7wRZtQmBxsEA88tLbOqVH9Q4LXpvBeJ1evNwzF
         Gn1nkM53HA8qFri7d85awU+YA43qzQziVcyi26Y09dsxoaI+vH7V9XIfAqzscapHHMEW
         5oDQukfB+IC45/9+LkkZE7WY+p/8jmoRVCfjrOtEZ01zWZDLL3/UySTKWG86G6vO5+qs
         ISThtTirMXMatR+2ja21CTDxvlqjKG6JnJWl/0GKqaSmRt5Gs8Vc40YIbORsB23cnMoe
         qsxg==
X-Forwarded-Encrypted: i=1; AJvYcCWp4MgSGLwVaoswuiJrAhAKCDjoWZgHSr7Tzuewab14wZtQ7Qz/eTeLNgOgYUr9nmOYeY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHGUIan45R/Ieve7E/7TROCkUWHr4pnQHm8usCwC0tRJpohRrv
	6jVa3Rva2gaqhkCE4TW7K3pHpZg4v6SRLv2Ydvb3o+YzOKJ4Z30he6Z4l2YfcA2yml+KpaYAgUs
	X1h0zCdSI9rNJri3V/mOPD+IDxZQanOW9AkOmR1IsUw==
X-Gm-Gg: ASbGncvihD3yKPEW29EwIGPc7yTNbKSU7bZODobvRpVcwH0YQlo6NqtKvW7P1EOnRUI
	i/rMsAZfgi3N4yYU9A9ukYNE+082g2frz9+3rmwdOdpQMn2Ao7fHH1dYAWiP5nlL+sR+VgifNZ5
	Gpxy/mK0B4tvliwbuJckHAbU1duk/Ji2G8
X-Google-Smtp-Source: AGHT+IHz5Vh1WV9nsY/ZJiTiB1W8ok9w5HzbkMh2HaPQU1ew8kA+sOX9MHLa7aQ/uKATj0C5Wdv6l/pIEuTUkbDn4co=
X-Received: by 2002:a05:6902:138e:b0:e81:566c:3085 with SMTP id
 3f1490d57ef6-e81c0fc6b57mr402062276.1.1749243849237; Fri, 06 Jun 2025
 14:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com> <20241126075702.4099164-6-hongxing.zhu@nxp.com>
In-Reply-To: <20241126075702.4099164-6-hongxing.zhu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 6 Jun 2025 14:03:57 -0700
X-Gm-Features: AX0GCFsPTDn7iA-rHigWV1JSUeeni9XBl8RHjYyReEuG_dN3ujPTRzbBW4231V8
Message-ID: <CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 12:03=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com>=
 wrote:
>
> Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it shou=
ld
> be deasserted in imx_pcie_deassert_core_reset().
>
> Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 3538440601a7..413db182ce9f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -776,6 +776,7 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> +       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> --
> 2.37.1
>
>

Hi Richard,

I've found that this patch causes a regression on i.MX8MM and i.MX8MP
boards with hotplug capable bridges:
i.MX8MM+PI7C9X2G404EV (this switch does not support hotplug) - no issues
i.MX8MM+PI7C9X2G608GP (hotplug) - fails to reliably enumerate
downstream devices about 80% of the time
^^^ when this occurs PCI_PRIMARY_BUS (0x18) for the root complex
0000:00:00.0 reads 0x00000000 instead of 0x00ff0100 (PCI_SECONDARY_BUS
is 0 instead of 1 and PCI_SUBBORDINATE_BUS is 0 instead of 0xff)
i.MX8MP+PI7C9X2G608GP (hotplug) - hangs at imx_pcie_ltssm_enable
deassert apps_reset

In both cases here reverting ef61c7d8d032 ("PCI: imx6: Deassert
apps_reset in imx_pcie_deassert_core_reset()") resolves this.

I notice the sequence of events here is:
imx_pcie_assert_core_reset asserts apps_reset (disables LTSSM)
imx_pcie_deassert_core_reset deasserts apps_reset (enables LTSSM)
imx_pcie_ltssm_enable deasserts apps_reset (enables LTSSM; this is
where it hangs on imx8mp)

Is there perhaps some issue with de-asserting this (enabling LTSSM)
when it's already in this state?

In the case where downstream devices do not enumerate some
investigation points to them not being happy that the link drops so
perhaps deasserting apps_reset when its already asserted drops the
link and restarts it?

Best Regards,

Tim

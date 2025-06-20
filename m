Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE628A415
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435970; cv=none; b=TvRx+VPx1mvHgRp5PrXWUw2BqC67RhU4IkrZNV/n08HWLXSfeaizPTtc5DPxZFeY5OH6wyGw8giIdNq8NTYlCBJ5KJ6+ouativ1g/n8rBD7XD5ldg0DztugJuT7feu/YMnpTK46x1GY+0hNne9nVpgVd8EDgYXea+X1gOvl+WV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435970; c=relaxed/simple;
	bh=dSrlAF32I5lH3btMaCGJWgljcuhVLfSPBYtyqJZd7k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqyWdhE5VcAu7UgaWRBAl9A1d9XMItI3ECbZMLrZYSMffXeXb6Pvrh5P9syCFSfd+Wr5m1kYJsWoFtwiNjzBSCR4eCnziC8dpsxIEYNEj9kDeGCMaxdGVE+QZ2Q/k4u6aGRtEQu5Q2YCak2y5hEXqsTtIL/9ux3xXQ+LSJqVdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=dlVbOFZC; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="dlVbOFZC"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-610d86b3da9so437043eaf.0
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1750435966; x=1751040766; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=;
        b=dlVbOFZCcCHSOECM811ThcSMv0YPcs/Gt4YR9LKrXwqfZ6ua9pcFtSxh2dBMdulIkp
         xH1yILXcf3N0EwA60Y/mBeC2Ih9B+kDLJMETSyc4N1HgrM/hB9/00TTLuuapeBPfo2Xl
         0ulm50LbdrfP/RPYjwflw4iNy5aVUxuzocSnS/ym/5NvucAO/5nRfvUiA6HGi8Qb8X1h
         ardl93oFZE7WHWfhin68XhVFWtv84zi4nUX2HmgnA28sa6MsB7Vtcqeru6JefupzN84J
         QTGbVNAU0Mn2OR3VWf4uXHUJEz2B+CfSSZLhlzS5dIn50xyGKzQSgSYhWqG3nJsUtGuH
         TbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435966; x=1751040766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=;
        b=Y8Qxlw3wnSwblwYtDb3UyMqYseMWl+C3yW34qJRrCOKm3+Npk8sdtqL+SnYmqpqnjh
         pkYWBsqOdoVef/jh0D2FY81YvefTelyEMeky4Uoac9PjOhLl2X8+ISC+cxGyTuX0fP1K
         ots2q2JlUAiHFHacChHPLqyzOz5xkgfKTH5Akdb+8nLeANtSXc0tNlWY+Bu3XaqCynh/
         T4urhvLPjEidAyTdbwYJNNWW5ktAePyNtoowkoFutHtE4G+asOe/SL13Sphnx7pYdcgv
         UFIJ2o47xqttnOuEOkmibas+P3cPRlSgGFQ6K68+ep28vxQ4/ZgB4e/VRBpcN9KgbDen
         nRTA==
X-Forwarded-Encrypted: i=1; AJvYcCUh9iIZOU+0ImWi4X6WIDALIs28qxU2duvgKmsqkxbL45PVrIKzYAuboEP/zBG8BYNBmbc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/PBWUT+6hGZcaGP8PoHkUDj35uJLv1QZV8S9KU5fd4gtFUrvI
	Wu/QI17KSiuDhj1GobWujZrDymWkwsF5BOWki4vua3taN9YRQlMUuyU//uHdNxAtbh1+ZrwAVTJ
	LUdmgyRfblI2dSDG+YIPJlw6IGEz3WB0sK2qBj+DlcQ==
X-Gm-Gg: ASbGncv+L8WKKH0bdQsaP2k/pS1f2IWPMc4uT2oGV3VrHAaM47K4MEDMNZrkPOPkb45
	q+VOBfdtojUPoXHn6tQCxRRG4KsWOKPtQGZbS7ObdklMxQZWPOSt8/XL4n+ku8Wzo0T9dP8uwWb
	q1YBWKnYYXdTZEG6HCZ18BVLP4xoSV1xU+gZKI7V9piAk=
X-Google-Smtp-Source: AGHT+IEWHRk01AMNXUO3Iti/LVUHyPY06MPi2HY582F4LaypQ5ZkZqqgLLKeo/FHsS0LAg4XUMcQcmQIpTlGgPfCCxs=
X-Received: by 2002:a05:6820:1e87:b0:610:fc12:cbb4 with SMTP id
 006d021491bc7-6115b8a077cmr2461053eaf.1.1750435966109; Fri, 20 Jun 2025
 09:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com> <20250616085742.2684742-2-hongxing.zhu@nxp.com>
In-Reply-To: <20250616085742.2684742-2-hongxing.zhu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 20 Jun 2025 09:12:35 -0700
X-Gm-Features: AX0GCFupqyePYKY1h7Imt92So6Th1StimJuRSWH0VvVxy1uS8kPjLbLXM76L3Es
Message-ID: <CAJ+vNU15XpyLuxO4EowyqO9P+ZUqNApoH2Wu261iu-5b2GrkGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 1:59=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
> Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
>
> Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> and imx_pcie_ltssm_disable() to configure apps_reset directly.
>
> Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, which
> reported By Tim.
>
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcM=
HDy+poj9=3DjSy+w@mail.gmail.com/
> Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deassert=
_core_reset()")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 9754cc6e09b9..f5f2ac638f4b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -860,7 +860,6 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx=
_pcie, bool assert)
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_assert(imx_pcie->pciephy_reset);
> -       reset_control_assert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, true);
> @@ -872,7 +871,6 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> -       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> @@ -1247,6 +1245,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp=
)
>                 }
>         }
>
> +       /* Make sure that PCIe LTSSM is cleared */
> +       imx_pcie_ltssm_disable(dev);
> +
>         ret =3D imx_pcie_deassert_core_reset(imx_pcie);
>         if (ret < 0) {
>                 dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
> --
> 2.37.1
>

Tested-by: Tim Harvey <tharvey@gateworks.com> # imx8mp-venice-gw74xx
(i.MX8MP + hotplug capable switch)

Best Regards,

Tim

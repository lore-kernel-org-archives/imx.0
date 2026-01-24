Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C751318B8E
	for <imx@lists.linux.dev>; Sat, 24 Jan 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769260267; cv=pass; b=VezeiJ5XdAzn8mc2p2SHY05R7S0PxAXGSL++hjwXAQL7x4o/DnjH3/cr8KnIpIrN7TiY+y5Qxq7e+SVi3rGEzAQSKiHxl4+EOlKOL54srzGzI+3ya6rUZFrFSF8fnkSx29UERzAonKAVo9mD5NCpY934FzrUv3zrKXOXJcdHrIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769260267; c=relaxed/simple;
	bh=uyHtgLwYzGgHkFD2fBpckJzQVJKhpavHJk6AJPxEQGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtX+SMsx4kUT5q57no+h1UrWHbySP+E53W1cxjcpyeXwBqsQfkAqQrpB3VsPdhMABjoePGAI7pyW6XqrEik80kZoA5FCu+O6zoSB+IYXUxDF1Cp32HsJbtYPUnxqdLiQ9dlLRM+ndiQ6/8g80/ofJCpz/xJkV3Lh4F9KdXi/gYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkZarV9s; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkZarV9s"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35305538592so3025540a91.0
        for <imx@lists.linux.dev>; Sat, 24 Jan 2026 05:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769260266; cv=none;
        d=google.com; s=arc-20240605;
        b=Dfub5eyhy5nG7CewYjjYt5LIdmilEXS5QvbQTh/IrMPSl+yG+Vh394FwLlCZB/henl
         Bo6C9FBt8lhwz5YOm9lrLHS1jvzNSIKlnkv6ObkgFwgTVL/GfeLudcdq9jAefLtRZpLN
         bFWO455O9Xy1wjJ4kwH/FPh+5YxoTeEN/BDdJpQAAg/Dclpr41sYTH1e0E3XFZAGnEzR
         JTRRo+OLEA3DHJ/DpCHlgc2B4WnC3BSV1vXDSbf3ug7Xkzwtbdi1mZH9C5ut3i5TwsBz
         Y5mCaWINRmEYBgWBWmc7xAbvrSx7ejOKW90QjQh7O8Wp7PakL5FyUr5MBOTUoWCz9jCb
         J5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=;
        fh=z9sMQJxnG5WAvn7TSQu6/1RfAwzVrigWZafOO04gzgk=;
        b=CKDHbnXHn1FjMgV8PQ2UsPPD/XE1QmgbC4yp4PdfAAf90WA7ELQZD2mmL0dodNpZg1
         16gluJGhY+Z1+RodyNL1KuhykGPjZihO41ozwHd9/8idGdNe+gHMjfeewjnvIYh8CfYk
         1EkPHFKpq6fCp4mPvhaq3EcwIC4HoaR7WyBmH/hcgZYEEbIkUyPGeghpuop8HgnyozR4
         wR36n/6Yc3DTbJFkhrzjS8gr+/TVZzhlt5e7qRb8YF6jKXJ43HhaZyqRiIBM978lQDem
         R3ukW8Sndus8mM8d6TtDjeIkPrSo6G+mD49O9pG7qq9eLXN6tq7JHbNbKPr1P0lTRO0K
         04Yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769260266; x=1769865066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=;
        b=mkZarV9se7QAdOrfxAsUgN4iFQrDe/9U9WTU7VGB2wyMaWPsly0AnZj/qHxiDX8bDr
         Fq1orWHv6m4L3Rlg1hQstksNYekloD18WFRiyzcYg92jRD5AIxm2IbkiuuC24ZKfX5ya
         enxARIUO3+CifC98ss784LrmEb0xiEwDZWUj/HyGIwbO7AmBOsD2JnlR6kAp34zdxu0l
         JSfWEu80aWrdkAc252SMKZL7sx/VKb0FGA9eQmswxijgN7uftT53emczmlMEIq3RW8tf
         aqBG08O1tcWf9PJ/6svgjNrZxKBT/GI1vgc9OsT4yACprOCgAYi/E9Wnj1otzRfPTetH
         O+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769260266; x=1769865066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=;
        b=Da7WNL0/VSbch8jSX3QnEWCliLjs7kVqp44txonjmYf/2RUj6WdDU5jJG4EhkRP5bm
         Zk2XfC1xQl5RXFyx1tRmI7MxcKmJp5x2vkzcCKbzontU1XnyLMJAqCE4eB4tIIrmkiqp
         duBJb5ikE0/AdwQPCAc+PBu1MxDBdLQuv3JrV6QGsTSyKE3wGB+69OvvLw2x/vqk1Rx0
         UIdOdLLY7Kq1BJ5jcrdSdFdP7xqFNXsvBUIvO2FU/TxnWQh16QTEI338u6tYdVx8vGN8
         Yh98iI6yVJubsEZLpEKJxNgOXP60kYJCc5YKSjsV3zm7xStVQGD5YFRBCvre7vvfS+sl
         2YSw==
X-Forwarded-Encrypted: i=1; AJvYcCUbN3GX2tG9gXVJu8V8ZN2BZdeKuuoUK6FkeJvjLWy4/IbbT4iZKfx9tkcCIPGwzlI3yPc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbn+2cTe3iGDXoztExlezbjQpUjJ1+K89cVy+Hs7stURdgtKew
	k34bdV+f+DXXda7fICPOPrP/SPEfK5w586W1H6MI+54qmm2gc3K0NQcs2FZj27cxp9lHz160xHA
	TLLTw4E7wyzsvDVlZnXZvPelv6jvP1+c=
X-Gm-Gg: AZuq6aKCBy7Yl+lDko92id/69w2cK8Uv0VLYxU0mr/ppWtey1NgVkH0fiKAaen84Xlj
	rMZP3IWfE71v3MC3aVNb8Rtx1fczDRowODPfnJI97A2rPCL/FH36mKqsWnjSp4gvpUSmPJxtazB
	1kJe5azOJ1390QmCleEvwg4pqqiPBua4FgRoo7Kw+61RKoozx4nDsBi4O22doUT55Tlgnv34e1r
	1XQo0wMUwwTJUjtf+8m6DAa6PGiRLU5BIsQ1nqKPdILBb3auxVpyc+wOj0acRavSqiWEB409M5b
	8QVG8bdV2HduFalLcCHhRrCnQOUnkQ==
X-Received: by 2002:a17:90b:560c:b0:343:f509:aa4a with SMTP id
 98e67ed59e1d1-35368f2be10mr5326690a91.36.1769260265480; Sat, 24 Jan 2026
 05:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com> <aXPMyYeFVvDjSMhZ@lizhi-Precision-Tower-5810>
In-Reply-To: <aXPMyYeFVvDjSMhZ@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 21:10:53 +0800
X-Gm-Features: AZwV_QggnlVdXjeVSFlMBfY0oUjAdJOUKqSfuiS6Rl6oqAQRydYTbQJb8y5wbyo
Message-ID: <CAN4SLj20j8FW_AKAEG3kPBk5GH_hmWMU7fZUQM3TsQfZV7koAA@mail.gmail.com>
Subject: Re: [PATCH] PCI: imx6: Fix device node reference leak in imx_pcie_probe()
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Trent Piepho <tpiepho@impinj.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 3:32=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Sat, Jan 24, 2026 at 02:18:49AM +0800, Felix Gu wrote:
> > In imx_pcie_probe, np is obtained by of_parse_phandle() and must
> > be released with of_node_put() when it is no longer needed.
> > Add the missing of_node_put() after of_address_to_resource() to fix the
> > leak.
> >
> > Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe P=
LL failure")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/contro=
ller/dwc/pci-imx6.c
> > index 1d8677d7de04..3ae02712d3f0 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1675,6 +1675,7 @@ static int imx_pcie_probe(struct platform_device =
*pdev)
> >               struct resource res;
> >
>
> Please use auto cleanup
>
>         struct device_node *np __free(device_node) =3D
>                 of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
>
> Frank
Hi Frank,
Thanks for the review, I will fix it in V2.

Best regards,
Felix Gu
>
> >               ret =3D of_address_to_resource(np, 0, &res);
> > +             of_node_put(np);
> >               if (ret) {
> >                       dev_err(dev, "Unable to map PCIe PHY\n");
> >                       return ret;
> >
> > ---
> > base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > change-id: 20260124-pci_imx6-f97d70887dfc
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >

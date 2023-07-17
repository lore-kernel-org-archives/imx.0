Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F58253AD
	for <imx@lists.linux.dev>; Mon, 17 Jul 2023 14:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA51C433CD
	for <imx@lists.linux.dev>; Mon, 17 Jul 2023 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689605129;
	bh=6Lh/okJ/tlTuqTU1b/j/uErvTDrdoSJQUHuVEAFETts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DXcRR896EnZnRLJNO/6oE3vS17JskNmeBySR1a8GBnSZMpK8R09u2GHreDf2c0Dzo
	 JLenvfB83kOgsDGMpX/l4sKSoMCJTkDOcZ1AMcrisUwBT45Hqkbl+XlzoIQD7J44xp
	 BYFUcjgFWWPES+2nt7thJ9TOtx9ok3veYqLmGXwpUvNrkKD9uUi4kuNmjRjO8kvSv/
	 Q22oXxhN3DW4SMHsd2yGH263wD6ee7T8xcq/guGZp7OF4Df7SJdXBFCdPf5RkCCV/3
	 AAiKiz+alTYz/OnLZ5fgffEXHxAlU+vg0JkRSCtx7kTfPpi4mi5LtNw9VoqrLwYgPv
	 lh5ICjbnogAkg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so68132681fa.2
        for <imx@lists.linux.dev>; Mon, 17 Jul 2023 07:45:29 -0700 (PDT)
X-Gm-Message-State: ABy/qLa83RJICo8hBU7pV+RKOpFRioq+BfMjpdFsesnqIGDMW3CMH5dp
	oYJitoo35BUWfyu/4fmpAeh4vd88gj9UiCdcNA==
X-Google-Smtp-Source: APBJJlFFXYcLka0U2O/B1evPE/8dIeXS+VuPwNFdjWy1LSj2t3dI5YnbEtEP8rRsNBtPkvMxm/lDG3mrsq/u8ZWdw1Y=
X-Received: by 2002:a2e:9d84:0:b0:2b6:e76b:1e50 with SMTP id
 c4-20020a2e9d84000000b002b6e76b1e50mr9074981ljj.41.1689605127886; Mon, 17 Jul
 2023 07:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615164113.2270698-1-Frank.Li@nxp.com> <20230615164113.2270698-2-Frank.Li@nxp.com>
In-Reply-To: <20230615164113.2270698-2-Frank.Li@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 08:45:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7o5ipaBkNRECkWZPZDTB1kSFrUV3YjKL6xj02f0x2Sw@mail.gmail.com>
Message-ID: <CAL_JsqL7o5ipaBkNRECkWZPZDTB1kSFrUV3YjKL6xj02f0x2Sw@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
To: Frank Li <Frank.Li@nxp.com>
Cc: mani@kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
	Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 10:41=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>
> A workaround for the issue where the PCI Express Endpoint (EP) controller
> loses the values of the Maximum Link Width and Supported Link Speed from
> the Link Capabilities Register, which initially configured by the Reset
> Configuration Word (RCW) during a link-down or hot reset event.

What makes this Layerscape specific? Seems like something internal to DWC.

>
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci=
/controller/dwc/pci-layerscape-ep.c
> index 4e4fdd1dfea7..2ef02d827eeb 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -45,6 +45,7 @@ struct ls_pcie_ep {
>         struct pci_epc_features         *ls_epc;
>         const struct ls_pcie_ep_drvdata *drvdata;
>         int                             irq;
> +       u32                             lnkcap;
>         bool                            big_endian;
>  };
>
> @@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, vo=
id *dev_id)
>         struct ls_pcie_ep *pcie =3D dev_id;
>         struct dw_pcie *pci =3D pcie->pci;
>         u32 val, cfg;
> +       u8 offset;
>
>         val =3D ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
>         ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> @@ -81,6 +83,13 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, v=
oid *dev_id)
>                 return IRQ_NONE;
>
>         if (val & PEX_PF0_PME_MES_DR_LUD) {
> +
> +               offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +               dw_pcie_dbi_ro_wr_en(pci);
> +               dw_pcie_writew_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->ln=
kcap);
> +               dw_pcie_dbi_ro_wr_dis(pci);
> +
>                 cfg =3D ls_lut_readl(pcie, PEX_PF0_CONFIG);
>                 cfg |=3D PEX_PF0_CFG_READY;
>                 ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> @@ -216,6 +225,7 @@ static int __init ls_pcie_ep_probe(struct platform_de=
vice *pdev)
>         struct ls_pcie_ep *pcie;
>         struct pci_epc_features *ls_epc;
>         struct resource *dbi_base;
> +       u8 offset;
>         int ret;
>
>         pcie =3D devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -252,6 +262,9 @@ static int __init ls_pcie_ep_probe(struct platform_de=
vice *pdev)
>
>         platform_set_drvdata(pdev, pcie);
>
> +       offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +       pcie->lnkcap =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +
>         ret =3D dw_pcie_ep_init(&pci->ep);
>         if (ret)
>                 return ret;
> --
> 2.34.1
>

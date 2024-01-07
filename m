Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB289125BC
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBeJVwsL"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7fdde8b54so52558139f.1
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 22:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704608216; x=1705213016; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tjkLk9BGknFoHjmI/p9bsyEkzetnF4kncdD8DemYfk8=;
        b=vBeJVwsLn6gGvvp4ZF49zZ8JrD49BeFCHNM16yjQSZsR7b2iNvu2qPdDdrY/0plPXD
         EYtC2DZVzAXliNI7kLf1la4lC3uolSosys2wxRzwYxSUonII8KZLkTPXfxnAmUTHUBzP
         W09bpp9aEBEbvm99rJGw8nGVW+e2ujjzVxqUn2cOGlT85wNxE39bp9/pGZ0KpVOd/TSl
         8dsQj3lDNtswiwLeq8WLkNDwCIH6cUk0m9e4mqIwyd2oWb32nbcCf9uF50AHRnUetQ+h
         w9Enh6jubGYIuVMsBtAbOF0W5c6TZ7En/Nx3pgmz1i5heoP2Pqi8iUwca0DvUVfcARuG
         7LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704608216; x=1705213016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjkLk9BGknFoHjmI/p9bsyEkzetnF4kncdD8DemYfk8=;
        b=T/y/tqoApNNX5uwu/bwMJoIBaJGtVCl7oitBdkVpVF3LQ9AaBm9LyTvIXNotnEIApQ
         EtH7hYqhgkLuLX8e5HS2ur9ufDfKK19cLGqV1UJYI/yB2WjmDJ0o2/IEmbH8cBezEoDg
         pGZ5ER4Gwu8eFb4WrFXWVGLRIhVwYpgUDngI1ygWJ086V+xOgYr+hRvwnYqEJ+qAJiM0
         QXZr/C0hpTwCyK24wSAjzn5t7a+o3NqZyBWlT0DBn6yPdIYUaEoYAMsDrFVL+peeeTg1
         arX4hB7HIDSGVYaU/31T7mAYe8WkeOqlm64RZPy++eDuejoY6ADTYZHoLS0t4IjA0jaF
         BV+g==
X-Gm-Message-State: AOJu0YwJL0VGvwUcBd6LECdi3OHvhrhB8QesxJZUOXuU+7u39TU1mBPH
	kIILqVCVqOgUcLeAfOOHAoGsF2XSvDcv
X-Google-Smtp-Source: AGHT+IGkIZ9NUGm1g1hagpBGTj6dUH9zK41yf3/7mRT3F5hk9YWbobujTiV37E3hfHnBnFtEWKlang==
X-Received: by 2002:a05:6e02:1d17:b0:360:655e:df6b with SMTP id i23-20020a056e021d1700b00360655edf6bmr3772923ila.12.1704608215966;
        Sat, 06 Jan 2024 22:16:55 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id v5-20020a170902b7c500b001bbb8d5166bsm3888225plz.123.2024.01.06.22.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 22:16:55 -0800 (PST)
Date: Sun, 7 Jan 2024 11:46:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, bhelgaas@google.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: Re: [PATCH v7 14/16] PCI: imx6: Add epc_features in imx6_pcie_drvdata
Message-ID: <20240107061649.GN3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-15-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-15-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:25PM -0500, Frank Li wrote:
> The i.MX EP exhibits variations in epc_features among different EP
> configurations. This introduces the addition of epc_features in
> imx6_pcie_drvdata to accommodate these differences. It's important to note
> that there are no functional changes in this commit; instead, it lays the
> groundwork for supporting i.MX95 EP functions.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v5 to v6
>     - add missed maxitems.
>     - add comments about reuse linux,pci-domain as controller id.
>     linux,pci-domain have not defined at PCI endpoint side.
>     
>     Change from v1 to v3
>     - new patch at v3
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 4b2b9aafad1b4..6a58fd63a9dd2 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -104,6 +104,7 @@ struct imx6_pcie_drvdata {
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX6_PCIE_MAX_INSTANCES];
>  	const u32 mode_mask[IMX6_PCIE_MAX_INSTANCES];
> +	const struct pci_epc_features *epc_features;
>  	int (*init_phy)(struct imx6_pcie *pcie);
>  };
>  
> @@ -1065,7 +1066,10 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  static const struct pci_epc_features*
>  imx6_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
> -	return &imx8m_pcie_epc_features;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
> +
> +	return imx6_pcie->drvdata->epc_features;
>  }
>  
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> @@ -1530,6 +1534,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.mode_off[1] = IOMUXC_GPR12,
>  		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
> +		.epc_features = &imx8m_pcie_epc_features,
>  		.init_phy = imx8mq_pcie_init_phy,
>  	},
>  	[IMX8MM_EP] = {
> @@ -1540,6 +1545,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.epc_features = &imx8m_pcie_epc_features,
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> @@ -1549,6 +1555,7 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  		.clk_names = {"pcie_bus", "pcie", "pcie_aux"},
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> +		.epc_features = &imx8m_pcie_epc_features,
>  	},
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

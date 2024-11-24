Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604B188A18
	for <imx@lists.linux.dev>; Sun, 24 Nov 2024 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732432270; cv=none; b=ECd7f2+Yswz3p8/1gQ9/ol3VqRr2y4RJisBdqX3jw9d5Bchi+DZU0rlSyrxBmtetZ+q1Noi69A5yMIVWpiMBiJ/1tQ5g66m2wlUYJ1DdUHfsoaS9V2f6VC3kpUlS/ZijaMYcYXokwnpgaRnPmIbYc1Txr1LSh6SH5dvsH4FSTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732432270; c=relaxed/simple;
	bh=Jh4TFRyB38GkH9XMLtaVrr4by8pRBeNdveW6o8CV8Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ac9dygm3wefIyEeujO4lngZDPQoRjCAmGqFAAJ6tXEkFvzmqVAYLXjgCFGnvgTlzW2gZQO1/j7qWQH4mbVZVZ0jWCJwyOYHuSoQGPDsFYveRnm1cUv1SXc240MYj1Oj4vrLJ8CyrkgT9POPe0mfNlzO6h89GSKczM+2IvXubfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXzMDmYd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXzMDmYd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7242f559a9fso3416996b3a.1
        for <imx@lists.linux.dev>; Sat, 23 Nov 2024 23:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732432267; x=1733037067; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUBwayFAarPrS1JTjl9O+JdTBdqlG59MDYk/Wk5mK5c=;
        b=zXzMDmYdK0IF++QHGx01EtCQGVaEcJkAQ+4qprNFQDdmDFaWm+ReW3ZKSK6NDAm3RI
         Nc2o57pn5ZlfcfDZ0zkGkWF5LmRIWfNRbXI8P+igvk1YxisyS0OANnAyBFg1AhrF7H+k
         mai9JuoF8phjKYgDKZW9W47Zdr4LoPUkYXpVhn1A8No9pLRX47qTAWYyAobkKmhkyxvl
         TUwDEZRJLeGWoSn6B7eaSQN0d5ZD29Nh6YzhhYGQcCsJtfowQbV2uAb0tXmzK4zGYsJH
         p/gSbPCtLsPbTj1bCZuz2fUa/VE4zRdon2dwp+PPDqZV5vuzC9xTYIbsuNPnhJBFe4sa
         iMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732432267; x=1733037067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUBwayFAarPrS1JTjl9O+JdTBdqlG59MDYk/Wk5mK5c=;
        b=hso+O7+FyW31Rdl6Iq/zUw9ZvlRPx117c3TAlwdAPh+8GVQ7Tk118+ewc3hj06AnpY
         KNpgJTmJX9SNdiBI8pgn66UDjZdnPqY7p/Yj39QLLRt7Vo8Vpw5GULIwufKi10kIkxtz
         vND/H/TPOz3xt2o/gUKC0IONGnvkKU0Dwy9HkBTPiuI74mW8EF/Abnj3SSaBIQr190Ag
         s2k8FbbhWlWRTaNQz2KLtd2C+UMod9DS9AtqnE6crqPeOoI6NZ4TPGG90To2CSXUipPY
         cSgFIAnN4gYjJFxv8K7HnunA/MnSo6wYlpfmhNygeAMNBxAvB+DUuLk2mYMWhfjsepeR
         1GxA==
X-Forwarded-Encrypted: i=1; AJvYcCViyZNbVZWY8S4HVYjhku/FXwz/lD551hGiam+ZTf8VfZ7Udinxpd4c62zVL/IxZbXtvXo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv9Vd0PvE3cWMmCu/6+2impNNQqrsP+cnAT4tg5juxqodLn6VZ
	DRmUFi3rlpfhX1RN4Y3SkeoaHeLcfzl4NfM0nukpysKLsliporI4XX0I4WHbYw==
X-Gm-Gg: ASbGncuLo6aTtvRtCgFcJCIg35OTsM7CMwjFTsGl8cl6RgT8AZjaAZ7Gx76uelJt59S
	UC6B9sDgo1sQEjGXAo8ow3boc58vXyR00lO4j3US0/KlhH5MGxC78Vdmk4NQKDh72d6nSl/wx9V
	Lx+ZVapfzcnuhLSS2GZZAKMITt7a+J5rDa6gK/EY0DCLC69CxbcfMmnId4JNsrHCpO09mDHq5dl
	ezsUh8a83nx234xZOBlZk/Kqo8aPjTHPwbi++RCtNWpj7BiryWEID1Qb0cRyTT8Mw==
X-Google-Smtp-Source: AGHT+IFW+BG/x2A1btDFw10GDtMqQ0QNCfceMONDlBPPdj77feBstXz+Gq9nYXGSQ4wCKhzZmImimw==
X-Received: by 2002:a17:903:230e:b0:212:3f13:d4d5 with SMTP id d9443c01a7336-2129fd22060mr116470595ad.27.1732432267264;
        Sat, 23 Nov 2024 23:11:07 -0800 (PST)
Received: from thinkpad ([2409:40f2:100d:708e:8ced:6048:5b4d:7203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba3044sm42219745ad.91.2024.11.23.23.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 23:11:06 -0800 (PST)
Date: Sun, 24 Nov 2024 12:41:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	dlemoal@kernel.org, maz@kernel.org, tglx@linutronix.de,
	jdmason@kudzu.us
Subject: Re: [PATCH v8 2/6] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <20241124071100.ts34jbnosiipnx2x@thinkpad>
References: <20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com>
 <20241116-ep-msi-v8-2-6f1f68ffd1bb@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241116-ep-msi-v8-2-6f1f68ffd1bb@nxp.com>

On Sat, Nov 16, 2024 at 09:40:42AM -0500, Frank Li wrote:
> Doorbell feature is implemented by mapping the EP's MSI interrupt
> controller message address to a dedicated BAR in the EPC core. It is the
> responsibility of the EPF driver to pass the actual message data to be
> written by the host to the doorbell BAR region through its own logic.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v5 to v8
> -none
> 
> Change from v4 to v5
> - Remove request_irq() in pci_epc_alloc_doorbell() and leave to EP function
> driver, so ep function driver can register differece call back function for
> difference doorbell events and set irq affinity to differece CPU core.
> - Improve error message when MSI allocate failure.
> 
> Change from v3 to v4
> - msi change to use msi_get_virq() avoid use msi_for_each_desc().
> - add new struct for pci_epf_doorbell_msg to msi msg,virq and irq name.
> - move mutex lock to epc function
> - initialize variable at declear place.
> - passdown epf to epc*() function to simplify code.
> ---
>  drivers/pci/endpoint/Makefile     |  2 +-
>  drivers/pci/endpoint/pci-ep-msi.c | 99 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-ep-msi.h        | 15 ++++++
>  include/linux/pci-epf.h           | 16 +++++++
>  4 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/endpoint/Makefile b/drivers/pci/endpoint/Makefile
> index 95b2fe47e3b06..a1ccce440c2c5 100644
> --- a/drivers/pci/endpoint/Makefile
> +++ b/drivers/pci/endpoint/Makefile
> @@ -5,4 +5,4 @@
>  
>  obj-$(CONFIG_PCI_ENDPOINT_CONFIGFS)	+= pci-ep-cfs.o
>  obj-$(CONFIG_PCI_ENDPOINT)		+= pci-epc-core.o pci-epf-core.o\
> -					   pci-epc-mem.o functions/
> +					   pci-epc-mem.o pci-ep-msi.o functions/
> diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
> new file mode 100644
> index 0000000000000..7868a529dce37
> --- /dev/null
> +++ b/drivers/pci/endpoint/pci-ep-msi.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCI Endpoint *Controller* (EPC) MSI library
> + *
> + * Copyright (C) 2024 NXP
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/slab.h>

Please sort alphabetically.

> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/pci-epc.h>
> +#include <linux/pci-epf.h>
> +#include <linux/pci-ep-cfs.h>
> +#include <linux/pci-ep-msi.h>
> +
> +static bool pci_epc_match_parent(struct device *dev, void *param)
> +{
> +	return dev->parent == param;
> +}
> +
> +static void pci_epc_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> +{
> +	struct pci_epc *epc __free(pci_epc_put) = NULL;
> +	struct pci_epf *epf;
> +
> +	epc = pci_epc_get_fn(pci_epc_match_parent, desc->dev);

You were passing 'epc->dev.parent' to platform_device_msi_init_and_alloc_irqs().
So 'desc->dev' should be the EPC parent, right? If so, you can do:

	epc = pci_epc_get(dev_name(msi_desc_to_dev(desc)));

since we are reusing the parent dev name for EPC.

> +	if (!epc)
> +		return;
> +
> +	/* Only support one EPF for doorbell */
> +	epf = list_first_entry_or_null(&epc->pci_epf, struct pci_epf, list);

Why don't you impose this restriction in pci_epf_alloc_doorbell() itself?

> +
> +	if (epf && epf->db_msg && desc->msi_index < epf->num_db)
> +		memcpy(&epf->db_msg[desc->msi_index].msg, msg, sizeof(*msg));
> +}
> +
> +static void pci_epc_free_doorbell(struct pci_epc *epc, struct pci_epf *epf)
> +{
> +	guard(mutex)(&epc->lock);
> +
> +	platform_device_msi_free_irqs_all(epc->dev.parent);
> +}
> +
> +static int pci_epc_alloc_doorbell(struct pci_epc *epc, struct pci_epf *epf)
> +{
> +	struct device *dev = epc->dev.parent;
> +	u16 num_db = epf->num_db;
> +	int i = 0;
> +	int ret;
> +
> +	guard(mutex)(&epc->lock);
> +
> +	ret = platform_device_msi_init_and_alloc_irqs(dev, num_db, pci_epc_write_msi_msg);
> +	if (ret) {
> +		dev_err(dev, "Failed to allocate MSI, may miss 'msi-parent' at your DTS\n");

No need to mention 'msi-parent'. Just 'Failed to allocate MSI' is enough.

> +		return -ENOMEM;

-ENODEV?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

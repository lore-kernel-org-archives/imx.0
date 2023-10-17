Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E32D7B7
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfKi3qlh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-578b4997decso4455235a12.0
        for <imx@lists.linux.dev>; Tue, 17 Oct 2023 11:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697567850; x=1698172650; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDIMPqihTJidR00sawm2Nr6O1yAKRnZhnAyaqVDW0po=;
        b=GfKi3qlhgZC7BZMcS/SJ3eunANRtODwoV8uoqiFcJY64W5WB0UhnLUJcrXKMh4B88K
         l3bO0qYSAWQQiO6OGzYNTn3AL1puYYDOZoJ4DQpcip+4OosH0AEzj0WeyaCi6DL0Z+7P
         Mfqv1udiF0Vz3rJgweloYulaRZDu5qr4uJb28q4BXnp9Lc2gD58AqM3Ml0cy5rFIZMcP
         3FiC8xDSjkM1wFzv4qmciR1YZKKiV5HkZVxCaripQetl2253WviCkBVIAYgfZyElWgtp
         Zc64oCWM2Bv4o5VNGDAU3hN05dAAKMqAge4P7Bzn9VkjzhwlpABH3ql7zTDQrpz74zC+
         z/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697567850; x=1698172650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDIMPqihTJidR00sawm2Nr6O1yAKRnZhnAyaqVDW0po=;
        b=w9JZs1yyr875XVc7PQog06M0+MMITCg1zoZwui5xFEPjBcmsmui4iaE4RRK11qb2Zp
         kXIabvOxla+8Hh3YygLkCUwWOoyesUZM8R4czYKChZTItPS15bZAQ/N+AcduV+FABJyQ
         X/glVbfPDoMT3XSRJnRwhk2t7erA4XeFsTtZDoRHdTDSbQM+OJNiP6COPolT+C57IeI8
         1ZkHTafWyEoP6LPdYeK/nWJv6EpbDI+7qynQp+czQSZlnZ6mKR5dL1C3I2sO7Arv+mrj
         LKzENge2+tQ/CvrptwKdWo6RvFo/j4ea0VHH7oaPhS7HeU8v5DxOtmIov2c2VPyOYhAn
         hqZA==
X-Gm-Message-State: AOJu0YwHg7XpMHcsQ+bfiItRd4+8d5e1ZT+Q1Uiu+DC6xXVDJ1dUSeNI
	CjKrP+TwyrwCy/2tHOg9RunF
X-Google-Smtp-Source: AGHT+IGZc+AgmoxdQbyFgHaq0HpMKMawgaGe+zQRacb1kYCqnv0STvUbAj7qgu4yUBj9NSvPcrfVDw==
X-Received: by 2002:a05:6a20:1608:b0:14d:d9f8:83f8 with SMTP id l8-20020a056a20160800b0014dd9f883f8mr3663772pzj.1.1697567849901;
        Tue, 17 Oct 2023 11:37:29 -0700 (PDT)
Received: from thinkpad ([117.202.186.25])
        by smtp.gmail.com with ESMTPSA id i2-20020a63e442000000b00577d53c50f7sm211772pgk.75.2023.10.17.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:37:29 -0700 (PDT)
Date: Wed, 18 Oct 2023 00:07:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: aisheng.dong@nxp.com, bhelgaas@google.com, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jdmason@kudzu.us,
	kernel@pengutronix.de, kishon@kernel.org, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lorenzo.pieralisi@arm.com, lpieralisi@kernel.org, maz@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH v2 1/5] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <20231017183722.GB137137@thinkpad>
References: <20230911220920.1817033-1-Frank.Li@nxp.com>
 <20230911220920.1817033-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230911220920.1817033-2-Frank.Li@nxp.com>

On Mon, Sep 11, 2023 at 06:09:16PM -0400, Frank Li wrote:
> This commit introduces a common method for sending messages from the Root
> Complex (RC) to the Endpoint (EP) by utilizing the platform MSI interrupt
> controller, such as ARM GIC, as an EP doorbell. Maps the memory assigned
> for the BAR region by the PCI host to the message address of the platform
> MSI interrupt controller in the PCI EP. As a result, when the PCI RC writes

"Doorbell feature is implemented by mapping the EP's MSI interrupt controller
message address to a dedicated BAR in the EPC core. It is the responsibility
of the EPF driver to pass the actual message data to be written by the host to
the doorbell BAR region through its own logic."

> to the BAR region, it triggers an IRQ at the EP. This implementation serves
> as a common method for all endpoint function drivers.
> 
> However, it currently supports only one EP physical function due to
> limitations in ARM MSI/IMS readiness.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/endpoint/pci-epc-core.c | 192 ++++++++++++++++++++++++++++
>  drivers/pci/endpoint/pci-epf-core.c |  44 +++++++
>  include/linux/pci-epc.h             |   6 +
>  include/linux/pci-epf.h             |   7 +
>  4 files changed, 249 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index 5a4a8b0be6262..d336a99c6a94f 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -10,6 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  
> +#include <linux/msi.h>
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  #include <linux/pci-ep-cfs.h>
> @@ -783,6 +784,197 @@ void pci_epc_bme_notify(struct pci_epc *epc)
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_bme_notify);
>  
> +/**
> + * pci_epc_alloc_doorbell() - alloc an address space to let RC trigger EP side IRQ by write data to
> + *			      the space.

"Allocate platform specific doorbell IRQs to be used by the host to trigger
doorbells on EP."

> + *
> + * @epc: the EPC device that need doorbell address and data from RC.

EPC device for which the doorbell needs to be allocated

> + * @func_no: the physical endpoint function number in the EPC device.
> + * @vfunc_no: the virtual endpoint function number in the physical function.
> + * @num_msgs: the total number of doorbell messages

s/num_msgs/num_db

> + *
> + * Return: 0 success, other is failure
> + */
> +int pci_epc_alloc_doorbell(struct pci_epc *epc, u8 func_no, u8 vfunc_no, int num_msgs)
> +{
> +	int ret;
> +
> +	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions)
> +		return -EINVAL;
> +
> +	if (vfunc_no > 0 && (!epc->max_vfs || vfunc_no > epc->max_vfs[func_no]))
> +		return -EINVAL;
> +
> +	if (!epc->ops->alloc_doorbell)
> +		return 0;

You mentioned 0 is a success. So if there is no callback, you want to return
success?

> +
> +	mutex_lock(&epc->lock);
> +	ret = epc->ops->alloc_doorbell(epc, func_no, vfunc_no, num_msgs);

Why can't you just call the generic function here and in other places instead of
implementing callbacks? I do not see a necessity for EPC specific callbacks. If
there is one, please specify.

> +	mutex_unlock(&epc->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_alloc_doorbell);
> +
> +/**
> + * pci_epc_free_doorbell() - free resource allocated by pci_epc_alloc_doorbell()
> + *
> + * @epc: the EPC device that need doorbell address and data from RC.

Same as above.

> + * @func_no: the physical endpoint function number in the EPC device.
> + * @vfunc_no: the virtual endpoint function number in the physical function.
> + *
> + * Return: 0 success, other is failure
> + */
> +void pci_epc_free_doorbell(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
> +{
> +	if (IS_ERR_OR_NULL(epc) || func_no >= epc->max_functions)
> +		return;
> +
> +	if (vfunc_no > 0 && (!epc->max_vfs || vfunc_no > epc->max_vfs[func_no]))
> +		return;
> +
> +	if (!epc->ops->free_doorbell)
> +		return;
> +
> +	mutex_lock(&epc->lock);
> +	epc->ops->free_doorbell(epc, func_no, vfunc_no);

Same as suggested above.

> +	mutex_unlock(&epc->lock);
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_free_doorbell);
> +
> +static irqreturn_t pci_epf_generic_doorbell_handler(int irq, void *data)
> +{
> +	struct pci_epf *epf = data;
> +
> +	if (epf->event_ops && epf->event_ops->doorbell)
> +		epf->event_ops->doorbell(epf, irq - epf->virq_base);

Same as suggested above.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void pci_epc_generic_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> +{
> +	struct pci_epc *epc = NULL;
> +	struct class_dev_iter iter;
> +	struct pci_epf *epf;
> +	struct device *dev;
> +
> +	class_dev_iter_init(&iter, pci_epc_class, NULL, NULL);
> +	while ((dev = class_dev_iter_next(&iter))) {
> +		if (dev->parent != desc->dev)
> +			continue;
> +
> +		epc = to_pci_epc(dev);
> +
> +		class_dev_iter_exit(&iter);
> +		break;
> +	}
> +
> +	if (!epc)
> +		return;
> +
> +	/* Only support one EPF for doorbell */
> +	epf = list_first_entry_or_null(&epc->pci_epf, struct pci_epf, list);
> +

No need of this newline

> +	if (!epf)
> +		return;
> +
> +	if (epf->msg && desc->msi_index < epf->num_msgs)
> +		epf->msg[desc->msi_index] = *msg;
> +}
> +
> +

Remove extra newline

> +/**
> + * pci_epc_generic_alloc_doorbell() - Common help function. Allocate address space from MSI
> + *                                    controller
> + *
> + * @epc: the EPC device that need doorbell address and data from RC.
> + * @func_no: the physical endpoint function number in the EPC device.
> + * @vfunc_no: the virtual endpoint function number in the physical function.
> + * @num_msgs: the total number of doorbell messages
> + *

Same comment as for pci_epc_alloc_doorbell()

> + * Remark: use this function only if EPC driver just register one EPC device.
> + *
> + * Return: 0 success, other is failure
> + */
> +int pci_epc_generic_alloc_doorbell(struct pci_epc *epc, u8 func_no, u8 vfunc_no, int num_msgs)
> +{
> +	struct pci_epf *epf;
> +	struct device *dev;
> +	int virq, last;
> +	int ret;
> +	int i;
> +
> +	if (IS_ERR_OR_NULL(epc))
> +		return -EINVAL;
> +
> +	/* Currently only support one func and one vfunc for doorbell */
> +	if (func_no || vfunc_no)
> +		return -EINVAL;
> +
> +	epf = list_first_entry_or_null(&epc->pci_epf, struct pci_epf, list);
> +	if (!epf)
> +		return -EINVAL;
> +
> +	dev = epc->dev.parent;
> +	ret = platform_msi_domain_alloc_irqs(dev, num_msgs, pci_epc_generic_write_msi_msg);
> +	if (ret) {
> +		dev_err(dev, "Failed to allocate MSI\n");
> +		return -ENOMEM;
> +	}
> +
> +	last = -1;
> +	for (i = 0; i < num_msgs; i++) {

You should iterate over msi_desc as below:

        msi_lock_descs(dev);
        msi_for_each_desc(desc, dev, MSI_DESC_ALL) {
		...
	}
	msi_unlock_descs(dev);

> +		virq = msi_get_virq(dev, i);
> +		if (i == 0)
> +			epf->virq_base = virq;
> +
> +		ret = request_irq(virq, pci_epf_generic_doorbell_handler, 0,

	request_irq(desc->irq, ...)

> +				  kasprintf(GFP_KERNEL, "pci-epc-doorbell%d", i), epf);
> +
> +		if (ret) {
> +			dev_err(dev, "Failed to request doorbell\n");
> +			goto err_free_irq;
> +		}
> +		last = i;
> +	}
> +
> +	return 0;
> +
> +err_free_irq:
> +	for (i = 0; i < last; i++)
> +		kfree(free_irq(epf->virq_base + i, epf));
> +	platform_msi_domain_free_irqs(dev);
> +
> +	return -EINVAL;

	return ret;

> +}
> +EXPORT_SYMBOL_GPL(pci_epc_generic_alloc_doorbell);
> +

[...]

> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index 3f44b6aec4770..485c146a5efe2 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -79,6 +79,7 @@ struct pci_epc_event_ops {
>  	int (*link_up)(struct pci_epf *epf);
>  	int (*link_down)(struct pci_epf *epf);
>  	int (*bme)(struct pci_epf *epf);
> +	int (*doorbell)(struct pci_epf *epf, int index);

kdoc missing.

>  };
>  
>  /**
> @@ -180,6 +181,9 @@ struct pci_epf {
>  	unsigned long		vfunction_num_map;
>  	struct list_head	pci_vepf;
>  	const struct pci_epc_event_ops *event_ops;
> +	struct msi_msg *msg;
> +	u16 num_msgs;

num_db

You also need to add kdoc for each new member.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E5A495
	for <imx@lists.linux.dev>; Mon, 28 Nov 2022 21:03:27 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669669400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhB7JGU0+3dUf/xb6vSXZN0hUM70VXiiaFn2KBna12A=;
	b=zlvNwIwoHG+fU4gxnuatMPxfyVs5ZSLePNJu4/ocONdVKcLEZDqxHiVlXWATLTuFzvzVQH
	wvylbGYhnIJkRBfI06fvH8zrEydybvoGyJU4k6idIaEb8132jwZUwabOGcYf5ls2TUSa81
	SbeW0BZ0iRRMeh23zOgiaOb0YEuMrwElmiEaTS7Nepm/GHglMgTFNCurANP6kTLFcFlxT+
	S6h+mst5tidq7iJ67Vk4o2lLC31GVx0EpMSI7Jy53xj9hjy0e+Xb2TiEVK7iM0+bf272Ze
	2pAQf4pFBLaQtNW95y+qQXVA9uI271Sl7FODDOKRr/856Yr93LB6VMiYkim0lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669669400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhB7JGU0+3dUf/xb6vSXZN0hUM70VXiiaFn2KBna12A=;
	b=CWSwp1XKO4MBIhCx2CWco0lkUyqfbLhLh5RYHrL1h2GQY7cqKnAbOprHdP8gtA7ZMoKFpk
	LeZC3c+3eRBaziBw==
To: Frank Li <Frank.Li@nxp.com>
Cc: agross@kernel.org, ammarfaizi2@gnuweeb.org, andersson@kernel.org,
 andrew@lunn.ch, bhelgaas@google.com, festevam@gmail.com,
 gregkh@linuxfoundation.org, gregory.clement@bootlin.com, jgg@mellanox.com,
 kristo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lorenzo.pieralisi@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, nm@ti.com, okaya@kernel.org, robin.murphy@arm.com,
 s.hauer@pengutronix.de, sebastian.hesselbarth@gmail.com,
 shameerali.kolothum.thodi@huawei.com, shawnguo@kernel.org,
 ssantosh@kernel.org, vkoul@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, imx@lists.linux.dev
Subject: Re: [patch V2 33/40] irqchip/imx-mu-msi: Switch to MSI parent
In-Reply-To: <20221128204710.2084706-1-Frank.Li@nxp.com>
References: <20221121140050.386216606@linutronix.de>
 <20221128204710.2084706-1-Frank.Li@nxp.com>
Date: Mon, 28 Nov 2022 22:03:20 +0100
Message-ID: <87tu2ivlk7.ffs@tglx>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Frank!

On Mon, Nov 28 2022 at 15:47, Frank Li wrote:
> On Mon, Nov 21, 2022 at 03:40:09PM +0100, Thomas Gleixner wrote:
>>  	 * The device MSI domain can never have a set affinity callback it
>> --- a/drivers/irqchip/irq-imx-mu-msi.c
>> +++ b/drivers/irqchip/irq-imx-mu-msi.c
>> @@ -24,6 +24,8 @@
>>  #include <linux/pm_domain.h>
>>  #include <linux/spinlock.h>
>>  
>> +#include "irq-gic-msi-lib.h"
>> +
>
> I think irq-gic-msi-lib.h is not good name. Actually mu-msi is not arm gic.
> irq-gic-msi-lib do common work, which not related arm gic at all.

I realized that after a while too, but the main purpose of this series
was to establish that the core design holds up to handle the gazillions
of ARM variants out there and to solicit technical feedback from the
involved parties.

>>  static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *dev)
>>  {
>>  	struct fwnode_handle *fwnodes = dev_fwnode(dev);
>>  	struct irq_domain *parent;
>>  
>>  	/* Initialize MSI domain parent */
>> -	parent = irq_domain_create_linear(fwnodes,
>> -					    IMX_MU_CHANS,
>> -					    &imx_mu_msi_domain_ops,
>> -					    msi_data);
>> +	parent = irq_domain_create_linear(fwnodes, IMX_MU_CHANS, &imx_mu_msi_domain_ops, msi_data);
>
> coding style change should be in sperated patch.

Thanks for the thorough technical feedback!

       tglx

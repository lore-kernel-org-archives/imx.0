Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522EB746E
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733317696; cv=none; b=upfQDthL3D1A7SId79AI4dY/vgqGkOu60vUpYDcTxM17bI+LUo2Ksf+Qjl2hkxhis5M6dyKMfiO/RWRhR45RwfcQ2/85YbqssQDclQJASuAmLrI9vjAD7zKvRPoukYXPLHrF7QQUe6HQJxo34zpVKoaxhFngUhZ0v3JAG64254I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733317696; c=relaxed/simple;
	bh=05RaxY8NTJZsdAMk/F+MVGS6iIIbXrpDd0cv9NTMgsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O2o9Ee5JMXXoQExVMUQXURHRn2wYUeEGmqSeBU5uVOVqxNUP4NwWh1rojRAwPuGtxckfj0H1TpfRye64OmyRqQJw5Yj7Q122pSjEGg1IC+PXBJSwEgiNe0s5nO6bOVcOazYo+O+mFQGYEyVCVBLGfRx8o1F2+CyH5qGqEOJn9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zFBy1gyA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6OVT3qJb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zFBy1gyA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6OVT3qJb"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733317692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ai6Td+7Re4FB0bJzl00OhDz0NYYlW8jViszOUHsn54c=;
	b=zFBy1gyAVOA9KgJwUcsOSY5q9TPYuTqu9LkGJXJC+RsJzCZ7aB9Hb8nslQDzhJxP91iwvv
	ayQxv7NwBnF4sH3k8udsY2kj2yVSgy3UbvHYSc/TlBtYprapRncVYqnz9OqkYwl7zoVdus
	WVNuh76NkV+R/LL6iczxXh3IyHhtj0znSpYq9EbcK+ddnOKFWaTbrCsVYKnVMMnzg2emje
	dBeADw1CwksN/+R6mi+nyuwA7ICGcwnyCynmBocoNktqzyxhYZzFPMvUeKhlH4+dnC4qMq
	SUHNdv4ZcG9KgMYfwso3Qa6O9aY8H93m3bWyRh3fQD81s5p3OtIIM+uCzLNuPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733317692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ai6Td+7Re4FB0bJzl00OhDz0NYYlW8jViszOUHsn54c=;
	b=6OVT3qJb7QSbzkewvzZYWWbqCQIHPBJ/jiRUicmS4fVMvTkHZhy9KpkcqF9yl8uB0Mg8Yi
	pXiq6/VkKOtt1zCA==
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
 dlemoal@kernel.org, maz@kernel.org, jdmason@kudzu.us
Subject: Re: [PATCH v9 2/6] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
In-Reply-To: <Z0+TFbH5uWgFq6xY@lizhi-Precision-Tower-5810>
References: <20241203-ep-msi-v9-0-a60dbc3f15dd@nxp.com>
 <20241203-ep-msi-v9-2-a60dbc3f15dd@nxp.com> <87v7w0s9a8.ffs@tglx>
 <Z0+TFbH5uWgFq6xY@lizhi-Precision-Tower-5810>
Date: Wed, 04 Dec 2024 14:08:12 +0100
Message-ID: <87jzcfsiir.ffs@tglx>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 03 2024 at 18:24, Frank Li wrote:
> On Tue, Dec 03, 2024 at 11:15:27PM +0100, Thomas Gleixner wrote:
>> The fact that a MSI parent domain supports DOMAIN_BUS_DEVICE_MSI does
>> not guarantee that the parent is translation table based.
>>
>> As this is intended to be a generic library for all sorts of EP
>> implementations, there needs to be
>>
>>   - either a mechanism to prevent the initialization if the underlying
>>     MSI parent domain does not provide immutable messages
>
> How to know such information?

It obviously needs to be flagged somehow in the domain and the EP magic
needs to check that flag. 

>>
>>   - or support for endpoint specific msi_write_msg() implementations
>
> Even provide specific msi_write_msg(), write to address/data to shared
> memory.
>
> host driver:
> 1. read address/data from shared memory
> 2. write data to address.
>
> 1 and 2 is not atomic. So it can't avoid above raise conditon.

Correct. So you cannot support that case, which in turn requires to have
a mechanism to check for the immutable property.

Thanks,

        tglx


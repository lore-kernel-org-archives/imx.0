Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3ED136E17
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717446588; cv=none; b=JbMHuX+YtHLY29SM9O2KntBSpfjv5RO/moMYvlNmygA68KtbwvZCvpLdPIJITzzk3L2gT1NC0+h7/3tTVvnkkMy7a35aTMUK8ODUbRWAK87L0PpRN2IbxrAjsOU69JZA5t85ai6L9Ii+sxRJ4dcNlEOVSKULgndlfpcZs0h0lAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717446588; c=relaxed/simple;
	bh=j3gfTKddyYWmSxXQuoNeqUkMME14BCZN3zYIx14emZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3nYVN5UxhzpfabPNsvmAKlW158Qw2NAtrGWrLD1+whytjN3zGzn/QxqwNkfYKDzQpAks0LALcMaQPckVQGTky/B4OWGQ9V3v4ZD/mLeCFr8I43Vxht9Po6wsFPwhrq5VmL5w3ovZN0s2Hy8VRQfjmp6bDHS0tIi6a4c+vWuD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2qEb70q; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2qEb70q"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48bd10e526cso109087137.1
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717446586; x=1718051386; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5X2AoY/lQVZz1FKCa6KHvqy44zzQ3mhz+ruaolMEMaw=;
        b=G2qEb70qffKdvf38KfuGFHjlDbShyLtneArNqQF2FjmAwSqLU+gTsUllmeP9n16Kg+
         ewvveVaUVotF26DYJFMMsqrCDLgkS9DjkRI/CW8a1sypwfqtn9Be5ts4/LE8RE903xYd
         Bg37/qe1IVEB0psnrgmJi5uVG81u9fvO/PdPoDY64ho7lasaXfipaq/v/+pqqAMVD+5t
         YeKUYlgw24YEXjhqK4Xmvb7JRlSQHmudSQ6BhsApHOMrcc/kRppp61su4T+iyL1NL/nh
         GQm14L0YbyxrRo3igaOLoWOVbld/cCuk/PqIrVVxbIwwtUaJnsDPzEtqE7urwL8IEuyV
         QoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717446586; x=1718051386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5X2AoY/lQVZz1FKCa6KHvqy44zzQ3mhz+ruaolMEMaw=;
        b=Fg8v7RN4P0oJRSPFeocyt7GknuUVtQFRo85EZsdETjoHAuQOjFUgpuWsGU/Obwx1E/
         yuFn5F5syedHE/WZNi6Hx18RcuNdglU42/sZac7nkO4nA7d9I2MJlwJfMUEonlg9rTht
         HaUeqflH/wX6ib6i0DN/iqYDpWIUaB12SbqZ1E4p6kWvXfVcXt/BuykUWwfzRwTDwtX2
         Ozm0HPoOGjo69YvBbdwFR3v1s0AEeFoBzZR0kUXMkpe8xxo/by+rxGVA53iOzJ9XhaXV
         O4tgdRKN72t24XiYnrKp8uZy0d9IM0eO+2YaQuUJ4IHT/vstAoG2hqvAbxRSJ6q9h3Ie
         qBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOZBovH9WThxLAzD3miDnlUaUnrxQFHnci0eisSx8nI1ovst3JppUwTMpyW7fmbsGQZy9z5pfGhlzxN0BpVQgVTh63
X-Gm-Message-State: AOJu0YxUIkXewupDBwbC9Lyz+KZpIuQgVFljn8soRifm8eX4uyEsMtWd
	IlC1EMelFh350KeRLdXPJHNFPlOVyliMTZ8Eqav0u2RbiwcRfWrL
X-Google-Smtp-Source: AGHT+IGWrKHzvzbDJxYZB9izbaKjENhQiSF4aLl0mt855tkbfFf0g9cOXHABW4R9S8b+9ENLJgRQIw==
X-Received: by 2002:a05:6122:309e:b0:4eb:152e:cf92 with SMTP id 71dfb90a1353d-4eb152ed501mr5250710e0c.0.1717446586037;
        Mon, 03 Jun 2024 13:29:46 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:920e:e000:3b36:462:775e:2626? ([2a02:2f04:920e:e000:3b36:462:775e:2626])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2efc67csm311044785a.20.2024.06.03.13.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 13:29:45 -0700 (PDT)
Message-ID: <7edbdb11-5135-4f26-be12-c86f4dc4c0ff@gmail.com>
Date: Mon, 3 Jun 2024 23:29:38 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] PCI: imx6: Config look up table(LUT) to support
 MSI ITS and IOMMU for i.MX95
To: Robin Murphy <robin.murphy@arm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>
References: <20240530230832.GA474962@bhelgaas>
 <974f1d23-aba8-432e-85b5-0e4b1c2005e7@arm.com>
Content-Language: en-US
From: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
In-Reply-To: <974f1d23-aba8-432e-85b5-0e4b1c2005e7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/31/24 17:58, Robin Murphy wrote:
> On 2024-05-31 12:08 am, Bjorn Helgaas wrote:
>> [+cc IOMMU and pcie-apple.c folks for comment]
>>
>> On Tue, May 28, 2024 at 03:39:21PM -0400, Frank Li wrote:
>>> For the i.MX95, configuration of a LUT is necessary to convert Bus 
>>> Device
>>> Function (BDF) to stream IDs, which are utilized by both IOMMU and ITS.
>>> This involves examining the msi-map and smmu-map to ensure consistent
>>> mapping of PCI BDF to the same stream IDs. Subsequently, LUT-related
>>> registers are configured. In the absence of an msi-map, the built-in MSI
>>> controller is utilized as a fallback.
>>>
>>> Additionally, register a PCI bus notifier to trigger 
>>> imx_pcie_add_device()
>>> upon the appearance of a new PCI device and when the bus is an iMX6 PCI
>>> controller. This function configures the correct LUT based on Device 
>>> Tree
>>> Settings (DTS).
>>
>> This scheme is pretty similar to apple_pcie_bus_notifier().  If we
>> have to do this, I wish it were *more* similar, i.e., copy the
>> function names, bitmap tracking, code structure, etc.
>>
>> I don't really know how stream IDs work, but I assume they are used on
>> most or all arm64 platforms, so I'm a little surprised that of all the
>> PCI host drivers used on arm64, only pcie-apple.c and pci-imx6.c need
>> this notifier.
> 
> This is one of those things that's mostly at the mercy of the PCIe root 
> complex implementation. Typically the SMMU StreamID and/or GIC ITS 
> DeviceID is derived directly from the PCI RID, sometimes with additional 
> high-order bits hard-wired to disambiguate PCI segments. I believe this 
> RID-translation LUT is a particular feature of the the Synopsys IP - I 
> know there's also one on the NXP Layerscape platforms, but on those it's 
> programmed by the bootloader, which also generates the appropriate 
> "msi-map" and "iommu-map" properties to match. Ideally that's what i.MX 
> should do as well, but hey.

That's usually fine, except when SRIOV and/or hotplug devices (that is, 
not discoverable at bootloader time) come into play. We came up with 
this "solution" to cover these more dynamic scenarios.

https://source.denx.de/u-boot/u-boot/-/commit/2a5bbb13cc39102a68fcc31056925427ab44b591

---
Best Regards, Laurentiu

>> There's this path, which is pretty generic and does at least the
>> of_map_id() part of what you're doing in imx_pcie_add_device():
>>
>>      __driver_probe_device
>>        really_probe
>>          pci_dma_configure                       # 
>> pci_bus_type.dma_configure
>>            of_dma_configure
>>              of_dma_configure_id
>>                of_iommu_configure
>>                  of_pci_iommu_init
>>                    of_iommu_configure_dev_id
>>                      of_map_id
>>                      of_iommu_xlate
>>                        ops = iommu_ops_from_fwnode
>>                        iommu_fwspec_init
>>                        ops->of_xlate(dev, iommu_spec)
>>
>> Maybe this needs to be extended somehow with a hook to do the
>> device-specific work like updating the LUT?  Just speculating here,
>> the IOMMU folks will know how this is expected to work.
> 
> Note that that particular code path has fundamental issues and much of 
> it needs to go away (I'm working on it, but it's a rich ~8-year-old pile 
> of technical debt...). IOMMU configuration needs to be happening at 
> device_add() time via the IOMMU layer's own bus notifier.
> 
> If it's really necessary to do this programming from Linux, then there's 
> still no point in it being dynamic - the mappings cannot ever change, 
> since the rest of the kernel believes that what the DT said at boot time 
> was already a property of the hardware. It would be a lot more logical, 
> and likely simpler, for the driver to just read the relevant map 
> property and program the entire LUT to match, all in one go at 
> controller probe time. Rather like what's already commonly done with the 
> parsing of "dma-ranges" to program address-translation LUTs for inbound 
> windows.
> 
> Plus that would also give a chance of safely dealing with bad DTs 
> specifying invalid ID mappings (by refusing to probe at all). As it is, 
> returning an error from a child's BUS_NOTIFY_ADD_DEVICE does nothing 
> except prevent any further notifiers from running at that point - the 
> device will still be added, allowed to bind a driver, and able to start 
> sending DMA/MSI traffic without the controller being correctly 
> programmed, which at best won't work and at worst may break the whole 
> system.
> 
> Thanks,
> Robin.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

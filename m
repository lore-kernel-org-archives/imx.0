Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B992389D6
	for <imx@lists.linux.dev>; Sun, 24 Nov 2024 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732456297; cv=none; b=ZRqRx+qiYnMvFv8Y1MKzN7ZP0zNf5d/ZyS8T0LggIiD7MREouSeD4tVcqmiPE6XUFMPbJu/eoKe2z0FKmbk6x+0nn0rZEPgTpXvweAH/KdrKN3Ee3o8leS7pL8uOH7yZCOC+xFvMkOsoJDk8A0pT6uD4Vjmij7SaGOmmIQZ9Uf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732456297; c=relaxed/simple;
	bh=RJsjqr4IiY7Cv7vF7lbpxYrASAZu+7fQCrywo7wd1cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWU7OIDDOACarbUpljxkXbI+OIrruZweGo7at0QzCtRe4pC4SISINL44Tsm6WG6rgELPoTME7rkGkqvRE6E2kZAU2cVRDdnKJ4KRuXBT83pB0wQ6gXAJ6n5VPj4fLbjEA3lZvZEgLArCXJ1PQAd75YJ7/ugJtTNz+gVo/Ktm8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVhnpuP5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVhnpuP5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ee020ec76dso3138132a12.3
        for <imx@lists.linux.dev>; Sun, 24 Nov 2024 05:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732456295; x=1733061095; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SvwL6kRJHjUocjJpIPTlFq19Lrj3E/Hany+pDs45/JI=;
        b=KVhnpuP5V5MW22mqal2bgEwwpFZxIrgRTNfJmctuB/H3IO8pNzKXhO00DReZQi4cVj
         ZVcnLPOpwtfclnFozLOlysLvpt2BYG1sHw9yUBJyJO2LTbkBc1JD7kmgmM21MYf0ZedS
         IEv7KOW1aEfe14+70YVFV9IG9F/Z3X2w2PBNGGZ3SKRn6v24w3DPtjuayF3JfGJUHFkJ
         0McSvMVPvfjIE+SpdZwe1UJj6UH+U2VyQDyQXp87Av6ZCPuvsknvG4F3GZNppicfqDaW
         7QRg3eKFchY65z/YPHFK8hToKqxBs+aWgnGxkAGLy50Cw/zeeaw++X5KtcmMwZ2J5Cx7
         QYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732456295; x=1733061095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvwL6kRJHjUocjJpIPTlFq19Lrj3E/Hany+pDs45/JI=;
        b=UjxwLjNcuQ/yzXAMAGQpixyVjjM/coOOptQVo8gWNYHhIp6Vmp9YJveB26+RuJCr+x
         C/o0KNwdomZLbOT4iNbs4cldxQhuIySOKCe2RA9wGM6bW1N1TmVVyrr2NFdYBvMTpo/S
         No0XOlDKO94jnHKqmkO44Ig58D3Cj++cSAvR9YSkg0hi8nA/99omrQQNSa8iNp/g9t0U
         WRh4to5cIeU9q+XYHCVUfXaycdGYVpdjQm2Rwuf7KyBWWwrPmkLf+fLaAdsel7ZX3sib
         Tj/j+rwyAlLHMCXaIEkaZ52mi2GtXkG9r6ZZgZ1Oo7LxCpntche/8vESkzpVf7aWPzP2
         QmPg==
X-Forwarded-Encrypted: i=1; AJvYcCU7IWzWc1OPcjV2SUylMkxkc7oBckuXj3xrc47T0VW0g3nd6/V8iZ15cmTLSE4Ybdr/Ulg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfvvVNTVPCiTY+U6kwn6lGpKRs24msbkxfyU2ZgwfqFo4OEGQx
	VOBeBtku1KDnRAZMtVnio9HdpHYcZyZgeD2Lf8vc4dpVdIfcss9XG7viWLDFn1xRrl5GXbiNnW0
	=
X-Gm-Gg: ASbGncvT95l+/LckBBEwyZBa/uTGThM+u2CBHC7WnEsYnvAFA+HN5jS18Gx3JOw4XXS
	XG70eNvIv//U3DFfqQJC2DZKtu8KkTEBH/X/5Kr1MBWN80Hmto71IaCOVRmL3dl07lYpaKVWERj
	ygt4tIFbB59fSx3zn6JSnBV/qhwRq8celfn2aElPMGcYWZWvlx4IkLVzAQt89AJnmqGhDhtMOGg
	yR2LHtya5EgTwQvV5sPUB34D1EwuedNBfOlVoxnUHo1suup0WBR635ZYrPI
X-Google-Smtp-Source: AGHT+IEzlys82+csTBT6VGLCobeegey4e2aYC2fZg5o/NAz2y+kFhnSKiB+ktDAdEDxDDXN3XKTHYA==
X-Received: by 2002:a05:6a21:338e:b0:1d6:fb3e:78cf with SMTP id adf61e73a8af0-1e09e631698mr12401964637.41.1732456294822;
        Sun, 24 Nov 2024 05:51:34 -0800 (PST)
Received: from thinkpad ([36.255.17.192])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3ddc8bsm4787668a12.60.2024.11.24.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 05:51:34 -0800 (PST)
Date: Sun, 24 Nov 2024 19:21:28 +0530
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
Subject: Re: [PATCH v8 5/6] misc: pci_endpoint_test: Add doorbell test case
Message-ID: <20241124135128.775zh3xqkrajzvn4@thinkpad>
References: <20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com>
 <20241116-ep-msi-v8-5-6f1f68ffd1bb@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241116-ep-msi-v8-5-6f1f68ffd1bb@nxp.com>

On Sat, Nov 16, 2024 at 09:40:45AM -0500, Frank Li wrote:
> Add three registers: PCIE_ENDPOINT_TEST_DB_BAR, PCIE_ENDPOINT_TEST_DB_ADDR,
> and PCIE_ENDPOINT_TEST_DB_DATA.
> 
> Trigger the doorbell by writing data from PCI_ENDPOINT_TEST_DB_DATA to the
> address provided by PCI_ENDPOINT_TEST_DB_OFFSET and wait for endpoint
> feedback.
> 
> Add two command to COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL
> to enable EP side's doorbell support and avoid compatible problem.

Can you explain the 'compatible problem' and how this patch avoids it? Just for
the sake of completeness.

> 
> 		Host side new driver	Host side old driver
> EP: new driver		S			F
> EP: old driver		F			F
> 
> S: If EP side support MSI, 'pcitest -B' return success.
>    If EP side doesn't support MSI, the same to 'F'.
> 
> F: 'pcitest -B' return failure, other case as usual.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change form v6 to v8
> - none
> 
> Change from v5 to v6
> - %s/PCI_ENDPOINT_TEST_DB_ADDR/PCI_ENDPOINT_TEST_DB_OFFSET/g
> 
> Change from v4 to v5
> - remove unused varible
> - add irq_type at pci_endpoint_test_doorbell();
> 
> change from v3 to v4
> - Add COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL.
> - Remove new DID requirement.
> ---
>  drivers/misc/pci_endpoint_test.c | 71 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/pcitest.h     |  1 +
>  2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> index 3aaaf47fa4ee2..dc766055aa594 100644
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -42,6 +42,8 @@
>  #define COMMAND_READ				BIT(3)
>  #define COMMAND_WRITE				BIT(4)
>  #define COMMAND_COPY				BIT(5)
> +#define COMMAND_ENABLE_DOORBELL			BIT(6)
> +#define COMMAND_DISABLE_DOORBELL		BIT(7)
>  
>  #define PCI_ENDPOINT_TEST_STATUS		0x8
>  #define STATUS_READ_SUCCESS			BIT(0)
> @@ -53,6 +55,11 @@
>  #define STATUS_IRQ_RAISED			BIT(6)
>  #define STATUS_SRC_ADDR_INVALID			BIT(7)
>  #define STATUS_DST_ADDR_INVALID			BIT(8)
> +#define STATUS_DOORBELL_SUCCESS			BIT(9)
> +#define STATUS_DOORBELL_ENABLE_SUCCESS		BIT(10)
> +#define STATUS_DOORBELL_ENABLE_FAIL		BIT(11)
> +#define STATUS_DOORBELL_DISABLE_SUCCESS		BIT(12)
> +#define STATUS_DOORBELL_DISABLE_FAIL		BIT(13)
>  
>  #define PCI_ENDPOINT_TEST_LOWER_SRC_ADDR	0x0c
>  #define PCI_ENDPOINT_TEST_UPPER_SRC_ADDR	0x10
> @@ -67,6 +74,10 @@
>  #define PCI_ENDPOINT_TEST_IRQ_NUMBER		0x28
>  
>  #define PCI_ENDPOINT_TEST_FLAGS			0x2c
> +#define PCI_ENDPOINT_TEST_DB_BAR		0x30
> +#define PCI_ENDPOINT_TEST_DB_OFFSET		0x34
> +#define PCI_ENDPOINT_TEST_DB_DATA		0x38
> +
>  #define FLAG_USE_DMA				BIT(0)
>  
>  #define PCI_DEVICE_ID_TI_AM654			0xb00c
> @@ -108,6 +119,7 @@ enum pci_barno {
>  	BAR_3,
>  	BAR_4,
>  	BAR_5,
> +	NO_BAR = -1,

I really hate duplicating this enum definition both in EPF driver and here.
Maybe we should move this to pci.h?

>  };
>  
>  struct pci_endpoint_test {
> @@ -746,6 +758,62 @@ static bool pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
>  	return false;
>  }
>  
> +static bool pci_endpoint_test_doorbell(struct pci_endpoint_test *test)
> +{
> +	struct pci_dev *pdev = test->pdev;
> +	struct device *dev = &pdev->dev;
> +	int irq_type = test->irq_type;
> +	enum pci_barno bar;
> +	u32 data, status;
> +	u32 addr;
> +
> +	if (irq_type < IRQ_TYPE_INTX || irq_type > IRQ_TYPE_MSIX) {
> +		dev_err(dev, "Invalid IRQ type option\n");
> +		return false;
> +	}

Is this check necessary?

> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
> +				 COMMAND_ENABLE_DOORBELL);
> +
> +	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
> +
> +	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
> +	if (status & STATUS_DOORBELL_ENABLE_FAIL)
> +		return false;

I think we should add a error print here and below.

> +
> +	data = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_DATA);
> +	addr = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_OFFSET);
> +	bar = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_BAR);
> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_STATUS, 0);
> +
> +	bar = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_BAR);
> +
> +	writel(data, test->bar[bar] + addr);
> +
> +	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
> +
> +	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
> +
> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
> +				 COMMAND_DISABLE_DOORBELL);
> +
> +	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
> +
> +	status |= pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
> +
> +	if ((status & STATUS_DOORBELL_SUCCESS) &&
> +	    (status & STATUS_DOORBELL_DISABLE_SUCCESS))
> +		return true;

Usual convention is to check for error and return true at the end.

> +
> +	return false;
> +}
> +
>  static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
>  				    unsigned long arg)
>  {
> @@ -793,6 +861,9 @@ static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
>  	case PCITEST_CLEAR_IRQ:
>  		ret = pci_endpoint_test_clear_irq(test);
>  		break;
> +	case PCITEST_DOORBELL:
> +		ret = pci_endpoint_test_doorbell(test);
> +		break;
>  	}
>  
>  ret:
> diff --git a/include/uapi/linux/pcitest.h b/include/uapi/linux/pcitest.h
> index 94b46b043b536..06d9f548b510e 100644
> --- a/include/uapi/linux/pcitest.h
> +++ b/include/uapi/linux/pcitest.h
> @@ -21,6 +21,7 @@
>  #define PCITEST_SET_IRQTYPE	_IOW('P', 0x8, int)
>  #define PCITEST_GET_IRQTYPE	_IO('P', 0x9)
>  #define PCITEST_CLEAR_IRQ	_IO('P', 0x10)
> +#define PCITEST_DOORBELL	_IO('P', 0x11)

I think defining PCITEST_CLEAR_IRQ as 0x10 was a mistake. It should've been 0xa.
But since it is a uapi, we cannot change it. Atleast add new ones starting from
0xa.

Niklas's consecutive BAR patch adds a new ioctl for 0xa, but we can fix the
conflict later depending on which patch gets merged first.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

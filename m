Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410337;
	b=HClMul9j79aHQP85OkDKHKfC5H3hujKl99KjTelCZ7ccR68LY8tYjmsfr2Z37cY/bglM
	 on9Rj8Kru3sQEok4m8AVcu7WRmKjp3Z1vRcNWKrgd/o2WiJ6pPOZRehH+O1ANqNQu3Xl/
	 MKtJt8GmUNW9T1MPVCythvUGb4d+QcUNNEi3SavrayM2ybiAbEL0ixgscH1Tt6h+lHEY8
	 2cRJY7rScxfqBF4nS4zWwoB4u9CIcNivwk/V5EXvXeKL9xjAbrWBQDUIrdA1R4nslcUTz
	 aaOrvOh8qtQefreobUHFyDSucrw1R4HDaGhiOwCh+mvBt2+rFD+glUEvdf0yd3YdNMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410337;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kc1WDNzqnWa7MzsqOAzEg3sXZ0FXTjUIsij2hS/psy8=;
	b=UMqixHALkSixwbHCcovprjnS8XF1rswOK/0knw4FsZ2TTpS0W2p144g+9iSzB2UHMu7c
	 D9rjruD9UzmsCXVH0DBsc5M97Jfj2I/g5i9ImYziSI2dmh3GOF2hqfo2wRaXYASp90f5A
	 ZgCHZtgpJGRx6mdRvFlehe6QEfyhZ9t3zo0zqDS2cN4VwZU4IzxxgJehMFM9A+tNIqde/
	 frniisL64O9yN1wpYMFMNhwTdxfqGIwQk4NJMMmxPQioJsHUSClBlobWvR/QOucp8aBZB
	 oqEk7/Yctl0kaJnxNs4PRhbr5aP5pCDg3S+ALWZoZ5BfELTqLLlxL1kIoDddd5VyJBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MaJmLHh7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47244606A31A;
	Mon, 23 Nov 2026 05:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MaJmLHh7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B6C1F000CA;
	Mon, 23 Nov 2026 05:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795410336;
	bh=kc1WDNzqnWa7MzsqOAzEg3sXZ0FXTjUIsij2hS/psy8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MaJmLHh73l7lNwukwY22xJ7TRPlLyjsKgI6pQH3BWlzUQYCqKS6z5xd9rP6LXTe4s
	 NDRy/Kdzc1QCkY8khTw91OdWz9E38XGfiyjbKlxz8VJ5GJ67k+MKXBnHvkIvbKOKaF
	 i2lEzuClX9n2A2rFbOC9dLOcP1RpTiq8BWLsqKx+XxtKkv1X5Sd0Oad+NJ+u/P21sq
	 49uho1bKuptVA/znJFwH0qo+mIZ2gDReW9eyAr9MNFyAomkqcRBhLZVmhNXE/GQ+qM
	 PP2dqtmReItxuqsTqV3WiwPpCl/jS0oqf12gHVKteZHYIFda+sKvbxAr/zQOX3Lx67
	 Bz2PZVJKjrvJw==
Subject: Re: [PATCH v8 net-next 4/9] net: dsa: netc: tie setup resources and
 reset to DSA setup/teardown
From: netdev-bot+sashiko@kernel.org
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 05:05:35 +0000
Message-ID: <179541033517.3135.5228725617878780083@kernel.org>
In-Reply-To: <20261119030534.1892935-5-wei.fang@oss.nxp.com>
References: <20261119030534.1892935-5-wei.fang@oss.nxp.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch changes how netc_switch_pci_init() handles a failed
  probe-time FLR, and the commit message does not say so.

--

net: dsa: netc: tie setup resources and reset to DSA setup/teardown

This commit adds netc_switch_reset() so that every netc_setup() after the
first one does a PCIe FLR and starts from a clean hardware state. It also
converts the setup-path devm_ allocations to explicit alloc and free.
These are released in netc_teardown() and on the error paths.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> index 1225ff8153d44..f724f95add36b 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1042,7 +1161,10 @@ static int netc_switch_pci_init(struct pci_dev *pdev)
>  	void __iomem *base;
>  	int err;
>  
> -	pcie_flr(pdev);
> +	err = pcie_flr(pdev);
> +	if (err)
> +		return dev_err_probe(dev, err, "FLR failed\n");
> +

[Severity: Low]
This hunk changes probe behaviour, and the commit message doesn't say so.
Before, the return value of pcie_flr() was ignored and probe always went
on. Now any FLR failure in netc_switch_pci_init() makes probe fail.

The commit message only says:

  The probe path already performs a FLR in netc_switch_pci_init(), so the
  first setup will skip the reset because the priv->configured flag is
  not set.

and later:

  The NETC switch does not support multi-switch yet, so there is no
  functional problem today. This only reworks the driver so that
  multi-switch can be added later without hitting these issues.

Both passages read as if the probe path is unchanged.

pcie_flr() can fail in three ways:

  - -ENOTTY when pci_dev_config_accessible() fails
  - an error from pci_dev_reset_iommu_prepare()
  - an error from pci_dev_wait() after PCIE_RESET_READY_POLL_MS times out

In any of these cases, a NETC switch that bound before this patch would
now fail to probe.

Failing probe is probably the right behaviour, since the driver relies on
a clean post-FLR state. Could the commit message mention this change, or
could it go into its own patch? The hunk is still the same at the end of
the series.

>  	err = pcim_enable_device(pdev);
>  	if (err)
>  		return dev_err_probe(dev, err, "Failed to enable device\n");

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119030534.1892935-1-wei.fang%40oss.nxp.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620518;
	b=3yGohwn2DFOgkMh3C1l9HGfMzzpEfRgSuIbNNK887bvmdHe8Cs0cys5dXblz8UVN3wdn
	 54SpbKstSSTgD5nlI7exMQTqciRnnTdPnuQQJJgdxH06w0/54PdNnHC+vnMC9aJgKZzq9
	 uS9OIeh5dY4hB/mqZIJsJTcaw2SFvp6pRkv73mhzZvnd651qpC8f8/IJpGpK0AOwNC3F5
	 KhgAFXYKNXIuxwgn6E7X/QK420FOVAhkwC0NkvT6cTp6kmcv/mPWnvZY3aY1rspeR/0rk
	 b4MkqkezdNGNVqUYtW9QqfzMF/u/JY7FSjXulYY+JBKWmUrndmpoj1LaSesiCu6WGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
	b=DCDqImOoj4XgeS/7SnMuruBTNaqAftyy06TAqKdwQNIEvWN15hzvKsZOB1BTIXswv5kM
	 3jH9w2uE131736SfdoWjAOl+HS3Tt/YVoBy4eKvHv5T/Kz6WSRsByiMwb9bPqmpJ4/Las
	 +kLO4Q9cc2F5AGMCuyCMw2bOeSbeo9qjbrux58YOrFuBd1e3t74E540q4tE1vdpBvcl/Q
	 S0GnPPAa0a4GPV1FZ3gb6tt3Y70pTfqVT5AraGijQf4KDmr2yt9XYiGUdGQc8mjwnt7Fv
	 nmQ3miW1wseJX+aWDPvJpHff9tDJd/Z6M5xZykwV931GgpviB325nU8YkHimkhzoPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzrZ4ED6;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3DF606A32A
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 15:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzrZ4ED6
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df160bb9cso274983f8f.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620515; x=1796225315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
        b=RzrZ4ED6Vg12NpjYhELaDR095VcigwZUQHuNyQ9nhgZb8eBQVWxOpXuaMZTU/5dJf0
         SUy91fU7JiC36axVTa79hK0ewxiO2/aIO6LDmDJOlcuheQ2oPBaEno0xwb6B03Q7o8gt
         S6rSvSjXqzG0p6e+yP2wLz1sBqNcf/Aw4eKHe1uIQ8qbJzrUVL8yHAk5GdYq+VcCBsNN
         fgB0eOYMg5+7jipObvUhsaN5wdwWuAF60nNd1jf9cdHDCfgTD+5x5XH3d/3wAGlRLPxC
         jvbgj+GiD4p9dOeqsQMgkPD31cXIIX8P/slC69vtbVi83b4jguzYwRkB0zyTRJpvtHwz
         vSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620515; x=1796225315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
        b=XCNsYugVuTHUpDoEA30i8awixiKzbJ05OVCfkzRGY9Vtn6BDzxD9+0Ive6sdM8TGvZ
         RzZbn7hYCtsIUukiCSx8gH3+lE9JjA1K7c5Pud4o0egK0mkW6WJTork5U9Z7Hc6ToRbc
         R0ZRRLOSmANm2lcdMAp0cVKKWdmrtW+u8hwHtaOTUZfHxhYsUPUnioP4cC7BZdKYGPjN
         V8MgupWSek5WxabrVzNk2urijwAfy6KZo5z8F+0hwQDfVhQv5UuWnMoTgUAw7qbUw4iP
         rV76aZELYSSEUje7CZQer1RYuJqrjzdkrXe6PvfwZtnFOPpbb0lcSHYaRfXGssmwvq41
         OCjw==
X-Forwarded-Encrypted: i=1; AL+hErEbGVlZW4Ajr1iERCqazJz1AOMB0Iq9Dd0020K/LTx8t0GLUSMPVmWoZRNTvPrTx60UKok=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZRK1OI2kSR9B8UHs2Zb3RHKRM/FtEDBf0Io6FkeErNOmYm+Sj
	pdxPqBPfFQcInf3/vpads3b0lke5XmjiwSuDDsI4j2+YT7gEW0W/eXJj
X-Gm-Gg: AZFdTZdLCcgyMeTT2w4ZptApFK3yu/Fuj6InUPsZ7bCHY5Z/AHk+BL+nirr3vdRYKCn
	00YSoH+lJF3aRgocalkOCk/UdlsSIzQzTUD1wqvz5T1J7n5krWVaTmWXqhv4GtLcWibEIUR09wT
	vKLgYtLY5u76XnzLVe6wsbv3c2kr77PRDMAobg/aQtsX8mpaVO3K1ghn+mEMVhmZcrTklnB9Geb
	V8jUvG15tyX7/5dvoOK5IWR4soWyfT6Sluf9cpM6FvFVgguSAmhR6P3CmXzC1fjTFmB1ddhtxOX
	wWlKOF4oScI1NXuVUf6eK3ZsS2w9Xf2KoentXzq0V4zJlNHAiEJVMIv1N9u1usaOwea2lsbSmJK
	5HN6gtUQMo1OFDgLtseDuBH5XnPmab2rsjQA9+UdToVruPnphvCmCu0ml5eE2MYZzODVbRWhdeQ
	ay9KQsSXBTaKvT3Wv5KCwPfonwtuhWPLp/Z6cd8t81WaHtOclqJAq6QilX7a3LkjHgjXagEx8eK
	I1Xl6MCFytOHGRnIGpQQZOZwecepQOrRhAVH5/XhuBKuMKGW0zpeOmimZHxQwIVCJDRpEHzPQS5
	F8iUCTVRiBOj8Ke+D4lD
X-Received: by 2002:a5d:5e01:0:b0:4a8:eed3:770 with SMTP id ffacd0b85a97d-4abb47b25eemr37771369f8f.4.1795620514919;
        Wed, 25 Nov 2026 07:28:34 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm34443459f8f.10.2026.11.25.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:28:34 -0800 (PST)
Date: Wed, 25 Nov 2026 17:28:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Message-ID: <awb-MUCgZJn94Lbx@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-7-inochiama@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-7-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:37PM +0800, Inochi Amaoto wrote:
> Document all newly added bulk helper function, it can be used to manage
> a set of PHYs automatically. This is useful when the driver want to
> simplify the management of multiple PHYs.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
> index 0865c2e94eec..cae3d4700814 100644
> --- a/Documentation/driver-api/phy/phy.rst
> +++ b/Documentation/driver-api/phy/phy.rst
> @@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
>  	struct phy *devm_of_phy_get_by_index(struct device *dev,
>  					     struct device_node *np,
>  					     int index);
> +	int devm_phy_bulk_get(struct device *dev, int num_phys,
> +			      struct phy_bulk_data *phys);
> +	int devm_phy_bulk_get_all(struct device *dev,
> +				  struct phy_bulk_data **phys);
> +	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> +				     struct phy_bulk_data **phys);
>  
>  phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
>  In the case of dt boot, the string arguments
> @@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
>  devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
>  reference based on name or index.
>  
> +The bulk helpers are useful when a controller operates several PHYs together,
> +for example the lanes of a single PCIe port. To get a set of PHYs by name,
> +the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
> +each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
> +zero if it obtains all the requested PHYs or a negative error code on failure.
> +The driver owns the array and keeps it valid until driver detach, when the
> +PHY references are released.
> +
> +When a controller needs every PHY listed in a device node's ``phys`` property,
> +devm_phy_bulk_get_all() obtains them from the controller's device node.
> +devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
> +node. These functions return the number of PHYs listed in the node, which may
> +be zero, or a negative error code on failure. They store the allocated array
> +in ``*phys`` only when the return value is positive.
> +
>  It should be noted that NULL is a valid phy reference. All phy
>  consumer calls on the NULL phy become NOPs. That is the release calls,
>  the phy_init() and phy_exit() calls, and phy_power_on() and
> @@ -149,6 +170,14 @@ The general order of calls should be::
>      phy_exit()
>      [[of_]phy_put()]
>  
> +After acquiring a set of PHYs with a bulk helper, the order is::
> +
> +    phy_bulk_init()
> +    phy_bulk_power_on()
> +    ...
> +    phy_bulk_power_off()
> +    phy_bulk_exit()
> +
>  Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
>  but controllers should always call these functions to be compatible with other
>  PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
> @@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
>  Both these APIs are used to release a reference to the PHY and devm_phy_put
>  destroys the devres associated with this PHY.
>  
> +For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
> +releases both the PHY references and the allocated array. To release them
> +earlier, use::
> +
> +	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
> +
>  Destroying the PHY
>  ==================
>  
> @@ -221,3 +256,8 @@ DeviceTree Binding
>  
>  The documentation for PHY dt binding can be found @
>  Documentation/devicetree/bindings/phy/phy-bindings.txt
> +
> +Missing Bulk Helpers
> +====================
> +Currently, only a few bulk helper functions are added as they have users.
> +Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

s/Function/Functions/

Other than that:
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Thanks for updating the documentation, this is appreciated.

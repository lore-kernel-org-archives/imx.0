Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620043;
	b=TQPr+AnFpp7/escYSB813eLnrkgE2yAm5XgM5OTCyWecZ7pFD2mw9hSAfO2XZkpYscdq
	 B5yap/cXZp/sUWUyZG7b0hc7eOH3OTSUG9MYKrOci8ccnbK1rYK2k14u+P1wwDWHWGrsF
	 JKKt69iGV4QOnChJbDzuhnAsCBfUz3r/oOItTsTyEnC+Mjf4J9DzmDBfc3ReFhu+3gHRp
	 ynCxWOFqefXLVFg4HbFwHlzXimBEvtQAednVhPnPpp4+xItwqBppu/07J1J08CQJK1UEo
	 8gpcEQNaBXixQ0mqHM0QlGRobG31C07F5B86RIoANY71zhM+lPKMWO/+ZE0njzO3Q2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
	b=RsbLzRwLCFIHJ6R5vuS6nosgBxiyHCyG/SBPUqqIQS7n4JD/Yd4sC2V0KLGa1jN6fiSL
	 dpTI06OcMOqGBSynDi99F15OcwMTpOabBsMObcfYA47yzaM6+fcbsSgagw0fJxrumhbLg
	 WwoMm4ondVV30sRGq7AMDM+g4ry7EXsEdPyDAdUTngdMerkS4ZRC7RQe4SjCuJ89Hg3Sz
	 dpLjlFD89kzPaeOn4SKi6j87p7ISLZB61S4mdVbpUl6wincnRXdxO0/eLc/Gc/wzgchcw
	 3eT/Oiyb/MBvRLYpWS4qobp8WK5uyybEZ4WIwIbqmpdC3FMYUhGGxZupAJoMM1nTsEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcHY77k9;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97EA606A32C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 15:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcHY77k9
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6bae06f2b8aso419998a12.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620041; x=1796224841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=JcHY77k9pdDiOrSUDoEp/ZNTHUc/4GRA9tmQ9pXVpjtonOrz10Wx/q3pfNaavHfc5L
         wM3O4R+3rCEcOpmYr81TW3p3mdqrdphQi0TvSw5nSEIBiNtZJUILInxBkKTw8Yqj7FXf
         uO3PG75XIuDdBYoF8ZGMN6VHcSq34IE7Pv49grxsXHJf3oRo+rOhg1sBalOHuQBPl/Mj
         Yytc3omvKuEmz5sbpTK7El9Pjr+RCb0hdCPIt6PdOtCi0NxEVbW7j6FiXQ2JcOl5N17e
         ZXmXPsZFKW+/1nweCRdNOtK7jOaf57ascG0qMSd1X+L2WwpQAzqWf0NN0rd6WOqF4rz9
         7xOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620041; x=1796224841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=Ju38HeoZ+CG2msPt+1XIwSy0cP50onGGJo1fNiNcF3w4IPHNPoV2JAZZmjuMIg0osY
         Co/SIR3J1OuhqJy27Ll4oBXrAqJQh5bCvkOMk4QenjiRIT8GrcHXDd+9Brps+cvBQqqY
         XPE4vp0VWIpa5bkalwhBZkBey/gT1u1kjHwgSh/ilSzDHSOgf1kHiy4gPYVEyF8W+o2L
         135ujCaJS1Tf14qE4g7wpKj6SKUYMMDi0CfyPXTJkqIfDY/ZBVsExpMqoArgwHNKSh2U
         5bbhMDdqKBcsgLyEIPO7GWHBxdhBVIlk/HYmo+/6HafWLN+MElqpqfs44uZNqiLIFcPf
         Wgtw==
X-Forwarded-Encrypted: i=1; AL+hErGWh3P3IVaaQXMWjW2xeuaFxKa/Ffy9gEOz87Pn1iSn7uoAY1Z5eZ4LZ23WJOvGBFM5f6U=@lists.linux.dev
X-Gm-Message-State: APuU4Z911Y2PfPyRPySRxztIAEilmQhakRW2aHeXrXaV3MkubkU3d1Id
	ayXeCGspyMLlgWt7Wf9QhG7/kvoRM/ctkH/wCQUYBS/uuB28+hZmdm02
X-Gm-Gg: AZFdTZdaLYZ7m0eJCByX4kQpUxCWlleur7zNO1WprCMYa3jyIxyhb5Nv4fzVAvnyoTV
	nPw5U0AvcIG90gYZmJgDwUUyOHifAopWU5cxFNiU9zETkTzq8UzB+Y565HH9Ayq+duN6PVJAcu6
	boIumO0JLPHaC+EqigYQBsG8AjxeCrnXqGyqmU8qlzB+V9bCf9ciZObytB+7DwheRYkp9jQniXs
	MtDxQ18CF35FDrcaEsEypekoh7fUlB28/0AMy5XEcmzdc0skVx7qadvDtpSlVyPW1T7v/p8/1fs
	ikOiu6SQY9L+BbR9WhzpV50OECV8h7JQ4GB0YHADZyI4+9msVSlnX8450xFWlHisiYIpLvY3him
	0kr55qkyOOyhlnPP9UVr7pS1pJ47cxxXQ1cZeLccT+DsTnvEbI1jBVd0A6KkGUXad4G8qfTLgra
	1ZJxZTFmEDrFjvm4LrzHvtg/tbdDuVwhmZBNrCIwS487v2TVths2I6jTi2vRXZZmZFpH98nIYTO
	rUtvznjtuavx1ip4I/lyv4GdS2izibvpWJ2OwLh16FC11jSH50/WjscpjA3gizn4FS6uR7e0lTw
	YMTucIrPh7a8xQzt6O4V
X-Received: by 2002:a05:6402:90d:b0:6b7:dace:635d with SMTP id 4fb4d7f45d1cf-6ba37ac9214mr15694051a12.0.1795620041130;
        Wed, 25 Nov 2026 07:20:41 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm8131962a12.16.2026.11.25.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:20:39 -0800 (PST)
Date: Wed, 25 Nov 2026 17:20:36 +0200
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
Subject: Re: [PATCH v5 4/8] phy: core: Add phy bulk data helper functions
Message-ID: <awb8ZycWk2PJzTUD@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
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
In-Reply-To: <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:35PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Transient build warning due to improper patch splitting, please fix.

Documentation/.renames.txt: warning: ignored by one of the .gitignore files
../drivers/phy/phy-core.c:1202:12: warning: unused function 'phy_bulk_get' [-Wunused-function]
 1202 | static int phy_bulk_get(struct device *dev, int num_phys,
      |            ^~~~~~~~~~~~
../drivers/phy/phy-core.c:1242:12: warning: unused function 'of_phy_bulk_get_all' [-Wunused-function]
 1242 | static int of_phy_bulk_get_all(struct device_node *np,
      |            ^~~~~~~~~~~~~~~~~~~
../drivers/phy/phy-core.c:1274:13: warning: unused function 'phy_bulk_put_all' [-Wunused-function]
 1274 | static void phy_bulk_put_all(struct device *dev, int num_phys,
      |             ^~~~~~~~~~~~~~~~
3 warnings generated.
